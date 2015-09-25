--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-25 10:17:44 CEST

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
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20620129)
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
-- TOC entry 229 (class 1259 OID 20620686)
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
-- TOC entry 228 (class 1259 OID 20620669)
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
-- TOC entry 219 (class 1259 OID 20620546)
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
-- TOC entry 222 (class 1259 OID 20620576)
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
-- TOC entry 243 (class 1259 OID 20620925)
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
-- TOC entry 197 (class 1259 OID 20620336)
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
-- TOC entry 199 (class 1259 OID 20620368)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20620851)
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
-- TOC entry 190 (class 1259 OID 20620250)
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
-- TOC entry 230 (class 1259 OID 20620699)
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
-- TOC entry 215 (class 1259 OID 20620501)
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
-- TOC entry 195 (class 1259 OID 20620315)
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
-- TOC entry 193 (class 1259 OID 20620290)
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
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20620267)
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
-- TOC entry 204 (class 1259 OID 20620415)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20620906)
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
-- TOC entry 242 (class 1259 OID 20620918)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20620940)
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
-- TOC entry 208 (class 1259 OID 20620440)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20620224)
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
-- TOC entry 182 (class 1259 OID 20620138)
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
-- TOC entry 183 (class 1259 OID 20620149)
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
-- TOC entry 178 (class 1259 OID 20620103)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20620122)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20620447)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20620481)
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
-- TOC entry 225 (class 1259 OID 20620617)
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
-- TOC entry 185 (class 1259 OID 20620182)
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
-- TOC entry 187 (class 1259 OID 20620216)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20620797)
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
-- TOC entry 205 (class 1259 OID 20620421)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20620201)
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
-- TOC entry 194 (class 1259 OID 20620305)
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
-- TOC entry 207 (class 1259 OID 20620433)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20620811)
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
-- TOC entry 234 (class 1259 OID 20620821)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20620754)
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
-- TOC entry 235 (class 1259 OID 20620829)
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
-- TOC entry 211 (class 1259 OID 20620462)
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
-- TOC entry 203 (class 1259 OID 20620406)
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
-- TOC entry 202 (class 1259 OID 20620396)
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
-- TOC entry 224 (class 1259 OID 20620606)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20620536)
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
-- TOC entry 192 (class 1259 OID 20620279)
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
-- TOC entry 175 (class 1259 OID 20620074)
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
-- TOC entry 174 (class 1259 OID 20620072)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20620475)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20620112)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20620096)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20620489)
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
-- TOC entry 206 (class 1259 OID 20620427)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20620373)
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
-- TOC entry 173 (class 1259 OID 20620061)
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
-- TOC entry 172 (class 1259 OID 20620053)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20620048)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20620553)
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
-- TOC entry 184 (class 1259 OID 20620174)
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
-- TOC entry 201 (class 1259 OID 20620383)
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
-- TOC entry 223 (class 1259 OID 20620594)
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
-- TOC entry 236 (class 1259 OID 20620839)
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
-- TOC entry 189 (class 1259 OID 20620236)
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
-- TOC entry 176 (class 1259 OID 20620083)
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
-- TOC entry 227 (class 1259 OID 20620644)
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
-- TOC entry 196 (class 1259 OID 20620326)
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
-- TOC entry 210 (class 1259 OID 20620454)
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
-- TOC entry 221 (class 1259 OID 20620567)
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
-- TOC entry 239 (class 1259 OID 20620886)
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
-- TOC entry 238 (class 1259 OID 20620858)
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
-- TOC entry 240 (class 1259 OID 20620898)
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
-- TOC entry 217 (class 1259 OID 20620526)
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
-- TOC entry 198 (class 1259 OID 20620362)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20620634)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20620516)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20620077)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2974 (class 0 OID 20620129)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 20620686)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5605-0325-82fc-a5acc7c3e4a0	000d0000-5605-0325-a8d3-7870eda0cdf4	\N	00090000-5605-0325-48b7-15c531203372	000b0000-5605-0325-86ba-b2318d8b8dd7	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5605-0325-f1b5-65d62970d3eb	000d0000-5605-0325-7183-0a8479f021d8	00100000-5605-0325-b42a-03b5376648a4	00090000-5605-0325-5a42-be896944a81d	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5605-0325-1381-c6248f64e350	000d0000-5605-0325-2ca5-fb94930f0523	00100000-5605-0325-0f36-e8cb2ac5838a	00090000-5605-0325-ad93-50fd322eb3fa	\N	0003	t	\N	2015-09-25	\N	2	t	\N	f	f
000c0000-5605-0325-6a5e-8a9bded09bc6	000d0000-5605-0325-b7eb-d7d4f90b3147	\N	00090000-5605-0325-3e24-659094313676	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5605-0325-653e-5143f19c5fd2	000d0000-5605-0325-fdc0-f954fd04849c	\N	00090000-5605-0325-ae9d-b18fe0ea4c07	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5605-0325-1a6e-4c9663e133d6	000d0000-5605-0325-f959-db0456add094	\N	00090000-5605-0325-5fa0-8505f3841ddf	000b0000-5605-0325-2c50-03054e3d1a44	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5605-0325-a05e-d69f2ba19e06	000d0000-5605-0325-3f06-4d2bbb26bbe0	00100000-5605-0325-8b47-3f2c34c56a8d	00090000-5605-0325-8dd8-aac6195e2d00	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5605-0325-ad48-36d7533eb5b9	000d0000-5605-0325-601a-64e04866780f	\N	00090000-5605-0325-95ad-84af88e3f5be	000b0000-5605-0325-3bf4-9675a6720105	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5605-0325-fc2b-dce84c2c9ac7	000d0000-5605-0325-3f06-4d2bbb26bbe0	00100000-5605-0325-2502-94bd88ab4de2	00090000-5605-0325-cd89-d8f14e7d483b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5605-0325-d1a7-62cd7abcb9ed	000d0000-5605-0325-3f06-4d2bbb26bbe0	00100000-5605-0325-12dc-f1845bb2af91	00090000-5605-0325-d9c1-3fd0aaf5650e	\N	0010	t	\N	2015-09-25	\N	16	f	\N	f	t
000c0000-5605-0325-b29e-ce6fcdac03c9	000d0000-5605-0325-3f06-4d2bbb26bbe0	00100000-5605-0325-3d2e-a810a54d9ebd	00090000-5605-0325-92f8-7c58052abcb2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5605-0325-07a6-6535155b8608	000d0000-5605-0325-a425-2a36e34c383e	\N	00090000-5605-0325-5a42-be896944a81d	000b0000-5605-0325-bb53-9f496cda3cb2	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3021 (class 0 OID 20620669)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20620546)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5605-0325-13ef-e1f2331e8b2f	00160000-5605-0325-49fc-20c478966149	00090000-5605-0325-084b-2f890d6267e3	aizv	10	t
003d0000-5605-0325-fc0b-a6de5dc44d5a	00160000-5605-0325-49fc-20c478966149	00090000-5605-0325-e858-b4e8abdd6436	apri	14	t
003d0000-5605-0325-8a58-cea6c6baed16	00160000-5605-0325-2bb2-7da84212536a	00090000-5605-0325-dfa8-6d7fa716c079	aizv	11	t
003d0000-5605-0325-eff8-b2a1372cb6d0	00160000-5605-0325-bf18-26f1e1ec8b42	00090000-5605-0325-f3a2-18168ccfd57f	aizv	12	t
003d0000-5605-0325-47c7-30c2f75f338e	00160000-5605-0325-49fc-20c478966149	00090000-5605-0325-c668-89b07fa95afc	apri	18	f
\.


--
-- TOC entry 3015 (class 0 OID 20620576)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5605-0325-49fc-20c478966149	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5605-0325-2bb2-7da84212536a	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5605-0325-bf18-26f1e1ec8b42	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3036 (class 0 OID 20620925)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 20620336)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5605-0325-af46-daa1f77446f3	\N	\N	00200000-5605-0325-b772-fd41e4d1c7e4	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5605-0325-3a39-79f32a86f5f7	\N	\N	00200000-5605-0325-8156-8be81411eb66	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5605-0325-d4ff-63e47dff2630	\N	\N	00200000-5605-0325-f1ea-ca71450aedb4	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5605-0325-4dd9-faa099216c11	\N	\N	00200000-5605-0325-b29b-2895789e5461	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5605-0325-f4d9-2c3a73827cf2	\N	\N	00200000-5605-0325-1010-e885a4124a09	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2992 (class 0 OID 20620368)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20620851)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20620250)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5605-0323-bf02-fa94eb661901	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5605-0323-085c-0f7bfe239df4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5605-0323-2cca-789e21f78ba6	AL	ALB	008	Albania 	Albanija	\N
00040000-5605-0323-f727-a1d4436754d1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5605-0323-750b-65a4f842cf53	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5605-0323-f216-75ec4921a661	AD	AND	020	Andorra 	Andora	\N
00040000-5605-0323-52aa-9d7273a22837	AO	AGO	024	Angola 	Angola	\N
00040000-5605-0323-5040-25b45fd9775f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5605-0323-266f-bc281e962ec1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5605-0323-0481-1bd6aedc8514	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-0323-3692-f1a9c6ddeea2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5605-0323-c7d1-3f9758b2b641	AM	ARM	051	Armenia 	Armenija	\N
00040000-5605-0323-2b5f-68e82746cff4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5605-0323-31a1-28d6e9d3d509	AU	AUS	036	Australia 	Avstralija	\N
00040000-5605-0323-0051-8044cea5f31c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5605-0323-48de-a834725ea26b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5605-0323-8481-d6ec5e41893c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5605-0323-50a7-1363ee3be84f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5605-0323-4e4b-e9a0ac8358c0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5605-0323-5656-4916b4b7c576	BB	BRB	052	Barbados 	Barbados	\N
00040000-5605-0323-a98d-df42233fe6f0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5605-0323-d70d-83453c116d7a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5605-0323-c2a4-f32db3300833	BZ	BLZ	084	Belize 	Belize	\N
00040000-5605-0323-9f11-e70f43726f5f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5605-0323-c5e1-361fc087ad5b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5605-0323-0d13-d4994cd098c3	BT	BTN	064	Bhutan 	Butan	\N
00040000-5605-0323-475f-2d3b8f266bbb	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5605-0323-1aab-3d58ff4cce0b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5605-0323-ab3f-17750b1b4ca2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5605-0323-769a-17be0714528f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5605-0323-6ae3-fe90b68d750a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5605-0323-7ac7-e02a4b6bdc59	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5605-0323-d16d-d7d4214754f9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5605-0323-d303-4a79736df349	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5605-0323-21c4-8d49c37ee159	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5605-0323-75f9-3a59bd72f02b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5605-0323-b4c8-8e7be3eeeadd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5605-0323-3658-135358c851a6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5605-0323-b782-a4fd21c3292d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5605-0323-f65f-0a9c369f433e	CA	CAN	124	Canada 	Kanada	\N
00040000-5605-0323-23a9-0df50d32ac49	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5605-0323-e926-0bf7545c62fc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5605-0323-9aed-c7475552ea5c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5605-0323-05be-a80312ef331f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5605-0323-da69-b540a6d79851	CL	CHL	152	Chile 	Čile	\N
00040000-5605-0323-b2a1-b48a83ee7e71	CN	CHN	156	China 	Kitajska	\N
00040000-5605-0323-433f-73e0e1442030	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5605-0323-9cc9-93bef013ebaa	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5605-0323-19d7-0e6a55059bf9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5605-0323-4d80-218854c46720	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5605-0323-ddf0-da850b69f10c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5605-0323-c827-6015515e2c93	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5605-0323-41b7-2d0c91d28028	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5605-0323-629f-fc7e5d756bfe	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5605-0323-339c-7bc28c168f57	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5605-0323-8e0e-1890c527cd16	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5605-0323-cd98-d5943e50452a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5605-0323-9d22-117fe7a2c201	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5605-0323-3aef-dbfb896b7d97	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5605-0323-8741-ec342f89a19a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5605-0323-4e82-09e5d1ec89fd	DK	DNK	208	Denmark 	Danska	\N
00040000-5605-0323-9828-fbf9c4261127	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5605-0323-6366-bd42fd726d8c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-0323-426b-df0d687fdf75	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5605-0323-3acc-a052c658172f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5605-0323-7468-16f457fa025c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5605-0323-f7d5-b582e0a467ad	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5605-0323-be3c-376983960e52	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5605-0323-8f00-e0aa4ad98d91	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5605-0323-6150-02e639dc32a4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5605-0323-5b1e-3b1295d1d58e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5605-0323-7f57-15970468330f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5605-0323-48db-9bc12ec110fd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5605-0323-9d25-c017605137e9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5605-0323-88d5-83b8dab5a3a7	FI	FIN	246	Finland 	Finska	\N
00040000-5605-0323-899b-c3d92882cb4c	FR	FRA	250	France 	Francija	\N
00040000-5605-0323-af20-77daa1013192	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5605-0323-4d2a-2cf461c3c608	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5605-0323-c3cb-58722d6fbaee	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5605-0323-7282-fecaf0b1de98	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5605-0323-e287-c345dcbf6567	GA	GAB	266	Gabon 	Gabon	\N
00040000-5605-0323-8df8-7fb9978942ea	GM	GMB	270	Gambia 	Gambija	\N
00040000-5605-0323-8a84-1d016013fae9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5605-0323-58b9-740b62af1b65	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5605-0323-623f-bfc0cf77c955	GH	GHA	288	Ghana 	Gana	\N
00040000-5605-0323-78e9-f53f0070e164	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5605-0323-5b8a-1ec2bc96af8f	GR	GRC	300	Greece 	Grčija	\N
00040000-5605-0323-c293-1c83f8752aec	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5605-0323-af9b-f51bd1fe7813	GD	GRD	308	Grenada 	Grenada	\N
00040000-5605-0323-3a5e-44a5923a011c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5605-0323-04c8-95869ad21062	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5605-0323-18f5-6796379fb704	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5605-0323-f70c-82dcc498ce4f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5605-0323-1275-90d66f878816	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5605-0323-d9f3-8ad2f27bb4cf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5605-0323-36c3-e1214fa621d2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5605-0323-cae6-ec7ed8e2125e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5605-0323-7968-33f7458c8aad	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5605-0323-9583-ad256b0734e5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5605-0323-209e-6f4336089e0f	HN	HND	340	Honduras 	Honduras	\N
00040000-5605-0323-e72b-b64d37cbea51	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5605-0323-ed21-19faf480e4b0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5605-0323-d00d-c923f31b0da9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5605-0323-939f-59530556020b	IN	IND	356	India 	Indija	\N
00040000-5605-0323-3d71-50115fe5d150	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5605-0323-f3f0-56d5228ee514	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5605-0323-35f9-f3e309a6b9d6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5605-0323-2f8c-ff51e0dd33ff	IE	IRL	372	Ireland 	Irska	\N
00040000-5605-0323-0efc-f793d2d038ba	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5605-0323-43cd-04e67be79a02	IL	ISR	376	Israel 	Izrael	\N
00040000-5605-0323-c0ad-4c17c6fb832e	IT	ITA	380	Italy 	Italija	\N
00040000-5605-0323-51a8-b8fe1e45724e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5605-0323-86d8-083dc82702b4	JP	JPN	392	Japan 	Japonska	\N
00040000-5605-0323-3a71-9373d28ff557	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5605-0323-b39d-4730efc6c69b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5605-0323-f7dd-99c7940d3dde	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5605-0323-ca7f-f6a64b11f37a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5605-0323-f315-6769616d9fa3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5605-0323-3a2e-5863d23aeeef	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5605-0323-d39a-fd32be32e296	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5605-0323-9f47-306be764b942	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5605-0323-decc-fca38f1c8ff0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5605-0323-3e97-0503cefb7122	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5605-0323-c071-b8411891ee07	LV	LVA	428	Latvia 	Latvija	\N
00040000-5605-0323-06a6-5afc2cccf2e7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5605-0323-edd7-a63bcc15a0fd	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5605-0323-edb0-26d0f85c8434	LR	LBR	430	Liberia 	Liberija	\N
00040000-5605-0323-decc-f4c27d047c94	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5605-0323-c7ff-2a76da5a0d10	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5605-0323-6aaf-a57139aad7ff	LT	LTU	440	Lithuania 	Litva	\N
00040000-5605-0323-cf78-39339f4d1628	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5605-0323-f25f-aa453b4451ad	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5605-0323-c677-598395e70516	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5605-0323-d296-60c5510789c4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5605-0323-6555-883a2c4f529a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5605-0323-fd42-b20c6f38621e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5605-0323-718d-fcb68dfa0faa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5605-0323-9a89-98b2c145138a	ML	MLI	466	Mali 	Mali	\N
00040000-5605-0323-d20d-9ead065eb658	MT	MLT	470	Malta 	Malta	\N
00040000-5605-0323-cba8-de619e7ba0a9	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5605-0323-2c12-a9463b84beee	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5605-0323-8518-a54fdebf9f24	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5605-0323-4218-b49864dc4bba	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5605-0323-38d7-f6ffeac26553	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5605-0323-f34a-91f1c9436201	MX	MEX	484	Mexico 	Mehika	\N
00040000-5605-0323-2f7a-2f09ce33943c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5605-0323-b568-cff8e6390f9d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5605-0323-6e3e-a97a7a66d175	MC	MCO	492	Monaco 	Monako	\N
00040000-5605-0323-cf88-419e4809a6c3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5605-0323-191c-9ea30bdb3462	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5605-0323-93bf-317e11d5be48	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5605-0323-ab19-3763461140ed	MA	MAR	504	Morocco 	Maroko	\N
00040000-5605-0323-0253-494dfd4e50c9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5605-0323-26db-0c7beeea9e99	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5605-0323-c6d4-943b829c7d33	NA	NAM	516	Namibia 	Namibija	\N
00040000-5605-0323-c8ba-dd7151b4bbe3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5605-0323-e25e-b79067d11047	NP	NPL	524	Nepal 	Nepal	\N
00040000-5605-0323-1d52-45d1bc1d5d0c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5605-0323-e93e-a27344c60928	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5605-0323-e3e6-3b3aff3118a2	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5605-0323-61b6-cbfce2c8c978	NE	NER	562	Niger 	Niger 	\N
00040000-5605-0323-0c8f-c15c778fb6e7	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5605-0323-e568-bf4f502743ac	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5605-0323-ce33-26eb2412d0d6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5605-0323-6a67-22c0fd5fd104	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5605-0323-2e0e-f0b43fa8d0ad	NO	NOR	578	Norway 	Norveška	\N
00040000-5605-0323-ec8a-611b3bb2d4f4	OM	OMN	512	Oman 	Oman	\N
00040000-5605-0323-46d7-3d53a832590d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5605-0323-6c24-cf84cf8727d0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5605-0323-721d-1ef46573f879	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5605-0323-f241-336c601d1097	PA	PAN	591	Panama 	Panama	\N
00040000-5605-0323-2a69-7bb35291104c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5605-0323-0fe3-527ba2090645	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5605-0323-49d2-ce854864c0b8	PE	PER	604	Peru 	Peru	\N
00040000-5605-0323-931f-bcd703016c48	PH	PHL	608	Philippines 	Filipini	\N
00040000-5605-0323-9779-b6024d179371	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5605-0323-7b12-0559ad019677	PL	POL	616	Poland 	Poljska	\N
00040000-5605-0323-a20b-9cbe4d0039f5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5605-0323-1e4f-88ebeffa6480	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5605-0323-0c0c-95e4c9639049	QA	QAT	634	Qatar 	Katar	\N
00040000-5605-0323-338b-450a316d028d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5605-0323-bff0-16cb5c8c949d	RO	ROU	642	Romania 	Romunija	\N
00040000-5605-0323-f9eb-12b77f8fc7f0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5605-0323-4758-3ce10a298c90	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5605-0323-f8a8-1881e0e6656c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5605-0323-9ad0-392a196d8357	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5605-0323-6165-31b0db48f41f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5605-0323-7fbb-a99d7a0618bb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5605-0323-0fc5-a520886cb6a6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5605-0323-6177-e516d65318f3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5605-0323-a6e6-aa9366598479	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5605-0323-ade4-534ff3e75ffb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5605-0323-4d7c-b6f664781da2	SM	SMR	674	San Marino 	San Marino	\N
00040000-5605-0323-f2a2-ed55511ec9c1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5605-0323-d1a0-1228368ded28	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5605-0323-90d1-230364542c5f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5605-0323-8152-112ecb4b7c9a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5605-0323-ac4e-926c92ac8dae	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5605-0323-13d4-9ac8e0ff1ded	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5605-0323-0cb2-25e2fa9f136d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5605-0323-28a8-23d4ba6ee91e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5605-0323-c5ca-2e8513032f6e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5605-0323-1c50-47e43a9d2d66	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5605-0323-4eb9-9d2d00f1ca30	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5605-0323-5f28-3b6f55c2a9c0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5605-0323-1b30-f20f4bc94d5b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5605-0323-a043-3f00fedb5b1e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5605-0323-8819-d2de9cee40bf	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5605-0323-95e9-746f466e8593	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5605-0323-b037-0092b0053f62	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5605-0323-4db3-e9c44ba48e35	SD	SDN	729	Sudan 	Sudan	\N
00040000-5605-0323-bbf7-e87aba455a68	SR	SUR	740	Suriname 	Surinam	\N
00040000-5605-0323-90bf-f976cc6ee77d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5605-0323-8e45-c4448c70dbd4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5605-0323-7aaf-bffea56070f5	SE	SWE	752	Sweden 	Švedska	\N
00040000-5605-0323-bf66-581262a32f04	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5605-0323-8729-c694501c8ebf	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5605-0323-a91e-de01fa01862e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5605-0323-d286-f907e8d65c89	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5605-0323-a6b1-4ed701e55c72	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5605-0323-41df-d9957ea363c0	TH	THA	764	Thailand 	Tajska	\N
00040000-5605-0323-f8f2-817d56ed17db	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5605-0323-122c-32fb4564515f	TG	TGO	768	Togo 	Togo	\N
00040000-5605-0323-c34f-00a32c633120	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5605-0323-c043-f6d991d32843	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5605-0323-c4e8-f7799812cf20	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5605-0323-7bf3-ff932da3fd0f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5605-0323-168e-30a9cf516554	TR	TUR	792	Turkey 	Turčija	\N
00040000-5605-0323-e925-4b4223593d20	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5605-0323-68e5-d7d761730779	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-0323-f7cb-f87c5f37060b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5605-0323-34e2-41431ecdb8a3	UG	UGA	800	Uganda 	Uganda	\N
00040000-5605-0323-5ba2-4559eb9bae45	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5605-0323-427d-ac538a56001d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5605-0323-43f2-bb9cdc93b10c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5605-0323-5c1b-4011608484b9	US	USA	840	United States 	Združene države Amerike	\N
00040000-5605-0323-f703-2a5f6a61f44c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5605-0323-f20f-4832e0a3e469	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5605-0323-cc59-6e5f3f613dc4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5605-0323-931f-ffcb26dfbb89	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5605-0323-f7b2-f0797e8917d1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5605-0323-5bb4-3487b2d28c50	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5605-0323-a27a-a6e757ff8c7b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-0323-3e67-a57d6998d7d0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5605-0323-c18c-7fb5ce56f34b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5605-0323-22f1-59052028148a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5605-0323-bede-b57e9a62c605	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5605-0323-701e-728788b9e83f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5605-0323-a92b-ff1a644cbe41	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3023 (class 0 OID 20620699)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5605-0325-42e2-a02715c68bae	000e0000-5605-0325-4cbe-bfa926643666	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-0323-127f-e936161b1695	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-0325-6c81-9e3c54ce0271	000e0000-5605-0325-3292-58b15ec30e16	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-0323-a3f0-9e50f03d3647	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-0325-f25c-a22bbea74799	000e0000-5605-0325-b08c-7a3191008e40	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-0323-127f-e936161b1695	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-0325-e734-8b0763267e4d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-0325-c93d-94069df8c0a1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3008 (class 0 OID 20620501)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5605-0325-a8d3-7870eda0cdf4	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-82fc-a5acc7c3e4a0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-0323-a6ac-3dff2287b6a6
000d0000-5605-0325-7183-0a8479f021d8	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-f1b5-65d62970d3eb	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5605-0323-1207-75fe227b0276
000d0000-5605-0325-2ca5-fb94930f0523	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-1381-c6248f64e350	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5605-0323-945d-df908bff056d
000d0000-5605-0325-b7eb-d7d4f90b3147	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-6a5e-8a9bded09bc6	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5605-0323-1c63-6f7db8f1422b
000d0000-5605-0325-fdc0-f954fd04849c	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-653e-5143f19c5fd2	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5605-0323-1c63-6f7db8f1422b
000d0000-5605-0325-f959-db0456add094	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-1a6e-4c9663e133d6	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-0323-a6ac-3dff2287b6a6
000d0000-5605-0325-3f06-4d2bbb26bbe0	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-fc2b-dce84c2c9ac7	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5605-0323-a6ac-3dff2287b6a6
000d0000-5605-0325-601a-64e04866780f	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-ad48-36d7533eb5b9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5605-0323-51b0-cc76804ea2ae
000d0000-5605-0325-a425-2a36e34c383e	000e0000-5605-0325-3292-58b15ec30e16	000c0000-5605-0325-07a6-6535155b8608	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5605-0323-6f9a-571381b9b5b5
\.


--
-- TOC entry 2988 (class 0 OID 20620315)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20620290)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20620267)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5605-0325-27ee-64c56aa6ccae	00080000-5605-0325-05e4-057c72f7ba8e	00090000-5605-0325-d9c1-3fd0aaf5650e	AK		igralka
\.


--
-- TOC entry 2997 (class 0 OID 20620415)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20620906)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20620918)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 20620940)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 20579799)
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
-- TOC entry 3001 (class 0 OID 20620440)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20620224)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5605-0324-385d-3cabdd729fd9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5605-0324-957f-ad4adc75d083	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5605-0324-7dd6-d627e9fb304e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5605-0324-31e0-13fe836fca31	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5605-0324-9859-480f795d1172	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5605-0324-3b8e-a90501fdd4d6	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5605-0324-9dfa-4b1027f9ae71	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5605-0324-87e5-3a934af693e7	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-0324-dcf3-90309a2eeda2	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-0324-0f90-5969e9e84be4	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5605-0324-7220-897aae960f06	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5605-0324-82d2-d3ec3242f050	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5605-0324-7a22-e8501fb276c4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5605-0324-e4e5-c81587489c7d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5605-0324-1d5d-5706db2fe2f2	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5605-0325-9aa3-3662f3c40762	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5605-0325-c022-4b052ce95129	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5605-0325-3de7-ba1baa90c10b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5605-0325-8b51-0550618e321e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5605-0325-02cc-9a02692b89dc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5605-0327-76ca-8a78cc33079c	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2975 (class 0 OID 20620138)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5605-0325-40d8-406b0a28db1c	00000000-5605-0325-9aa3-3662f3c40762	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5605-0325-ba76-8d39f602dacc	00000000-5605-0325-9aa3-3662f3c40762	00010000-5605-0324-e892-a5bd58e65b33	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5605-0325-2657-9e73070f3379	00000000-5605-0325-c022-4b052ce95129	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2976 (class 0 OID 20620149)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5605-0325-48b7-15c531203372	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5605-0325-3e24-659094313676	00010000-5605-0325-844f-2ff591fe210c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5605-0325-ad93-50fd322eb3fa	00010000-5605-0325-2a3b-37e1bca91dad	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5605-0325-cd89-d8f14e7d483b	00010000-5605-0325-fb6f-5bc48b6ed36c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5605-0325-b2dd-17ddec664a3d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5605-0325-5fa0-8505f3841ddf	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5605-0325-92f8-7c58052abcb2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5605-0325-8dd8-aac6195e2d00	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5605-0325-d9c1-3fd0aaf5650e	00010000-5605-0325-7af8-73b1c4fa3ed7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5605-0325-5a42-be896944a81d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5605-0325-61ec-56253589a4c6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-0325-ae9d-b18fe0ea4c07	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5605-0325-95ad-84af88e3f5be	00010000-5605-0325-efb6-442930a9c2fb	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-0325-084b-2f890d6267e3	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-0325-e858-b4e8abdd6436	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-0325-dfa8-6d7fa716c079	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-0325-f3a2-18168ccfd57f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5605-0325-c668-89b07fa95afc	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 20620103)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5605-0323-6100-7aeeaaaca2a0	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5605-0323-1c38-317fecff5385	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5605-0323-f93c-51e90629a158	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5605-0323-667a-7f5556788a10	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5605-0323-d48d-806c53217f5e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5605-0323-8405-b4e7f2491fe2	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5605-0323-f606-59431488290a	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5605-0323-c8fc-865b7f4b7c37	Abonma-read	Abonma - branje	f
00030000-5605-0323-5bca-7cb9d46afbd8	Abonma-write	Abonma - spreminjanje	f
00030000-5605-0323-103e-dd42e2390963	Alternacija-read	Alternacija - branje	f
00030000-5605-0323-3345-2b7a986c8b3f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5605-0323-ec75-8004b3c46a70	Arhivalija-read	Arhivalija - branje	f
00030000-5605-0323-5a67-2d51817188c9	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5605-0323-8421-003c72d1dc1b	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5605-0323-f9cd-4972c9670b8d	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5605-0323-9a96-decdda4781e5	Besedilo-read	Besedilo - branje	f
00030000-5605-0323-c83e-4596a09571b4	Besedilo-write	Besedilo - spreminjanje	f
00030000-5605-0323-c968-0b3afd46281b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5605-0323-4114-27533f0b8b90	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5605-0323-c20e-c0932ea4188f	Dogodek-read	Dogodek - branje	f
00030000-5605-0323-2fc3-c7e160c3233d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5605-0323-4a86-51025265f99f	DrugiVir-read	DrugiVir - branje	f
00030000-5605-0323-69bb-09e923f9b2bb	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5605-0323-244e-514f8d8261f6	Drzava-read	Drzava - branje	f
00030000-5605-0323-2b4c-995b70d5e148	Drzava-write	Drzava - spreminjanje	f
00030000-5605-0323-20d3-f0baccd934ac	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5605-0323-c060-05dc4f29c711	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5605-0323-37ad-37820bc0b1b3	Funkcija-read	Funkcija - branje	f
00030000-5605-0323-8ce9-aed14ff7540b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5605-0323-d4ac-453959b28af3	Gostovanje-read	Gostovanje - branje	f
00030000-5605-0323-1703-b56f8c495b68	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5605-0323-a46b-41c5a5e49f69	Gostujoca-read	Gostujoca - branje	f
00030000-5605-0323-c454-0eca4d478392	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5605-0323-311b-4475836711aa	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5605-0323-bbbb-58b683af393d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5605-0323-5d56-6119abd62588	Kupec-read	Kupec - branje	f
00030000-5605-0323-33ff-0b5f424e412a	Kupec-write	Kupec - spreminjanje	f
00030000-5605-0323-3628-d4a53156899b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5605-0323-ccfb-deea2ee55fc3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5605-0323-44f8-361c94b64b73	Option-read	Option - branje	f
00030000-5605-0323-f696-13dc233bf479	Option-write	Option - spreminjanje	f
00030000-5605-0323-7de0-a5011f344551	OptionValue-read	OptionValue - branje	f
00030000-5605-0323-7ca6-62d2b670f082	OptionValue-write	OptionValue - spreminjanje	f
00030000-5605-0323-4952-e1d5cbd3d013	Oseba-read	Oseba - branje	f
00030000-5605-0323-4205-015f26dfa2f8	Oseba-write	Oseba - spreminjanje	f
00030000-5605-0323-0668-29372ac0bdbb	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5605-0323-5bbc-ff5b11148427	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5605-0323-a6a1-bb363776d96e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5605-0323-f06e-633b89821f18	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5605-0323-47d0-b9b203733962	Pogodba-read	Pogodba - branje	f
00030000-5605-0323-98ed-ab8f63735a14	Pogodba-write	Pogodba - spreminjanje	f
00030000-5605-0323-ecf1-f77e15750e17	Popa-read	Popa - branje	f
00030000-5605-0323-0a03-83c02c9ca7cd	Popa-write	Popa - spreminjanje	f
00030000-5605-0323-4a70-eb186206cc00	Posta-read	Posta - branje	f
00030000-5605-0323-450a-e72db05f943c	Posta-write	Posta - spreminjanje	f
00030000-5605-0323-22d9-c5c110b1dab4	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5605-0323-6e42-0c03a5d93fc9	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5605-0323-04e5-616121e13edd	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5605-0323-43c2-fcbcce948b3f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5605-0323-3c79-4d3f0e12e6c1	PostniNaslov-read	PostniNaslov - branje	f
00030000-5605-0323-327d-e9de5ffdaef4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5605-0323-da6b-99504cfa4d93	Predstava-read	Predstava - branje	f
00030000-5605-0323-8537-88457d4e9bfd	Predstava-write	Predstava - spreminjanje	f
00030000-5605-0323-6415-37382e49d624	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5605-0323-4a9d-0a600edd8bd9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5605-0323-ee39-bf5c1c505565	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5605-0323-48ea-d192ab997abc	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5605-0323-0829-1ebb6e10444a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5605-0323-516a-8cb98460ca0d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5605-0323-bf72-adf976e41b6f	ProgramDela-read	ProgramDela - branje	f
00030000-5605-0323-82f0-7dd45a727105	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5605-0323-2aee-a80bde435252	ProgramFestival-read	ProgramFestival - branje	f
00030000-5605-0323-ffb4-3de25969b19a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5605-0323-8522-1e60cc2e5d14	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5605-0323-749b-04ca9ace3a38	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5605-0323-9413-4089a7cc4b4b	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5605-0323-d038-0a9bfb220091	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5605-0323-50d9-8d908b7c7bc0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5605-0323-7f45-28285a0cadc6	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5605-0323-3b91-e18bb76cab3e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5605-0323-ed50-5784c7470de8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5605-0323-13d3-75f676f7e88d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5605-0323-70d5-625bee1666fb	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5605-0323-c881-f7a292747535	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5605-0323-200b-3fa8b1737a7d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5605-0323-0e57-6bf1b0099710	ProgramRazno-read	ProgramRazno - branje	f
00030000-5605-0323-4663-820773283b4a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5605-0323-5a10-5ec98ae3a031	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5605-0323-6e79-f986c8db2281	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5605-0323-5075-3b2ac099587b	Prostor-read	Prostor - branje	f
00030000-5605-0323-939b-798426c9508a	Prostor-write	Prostor - spreminjanje	f
00030000-5605-0323-e30d-b901536f532b	Racun-read	Racun - branje	f
00030000-5605-0323-c46e-523f196d4e04	Racun-write	Racun - spreminjanje	f
00030000-5605-0323-86b2-74cd2bc3aacf	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5605-0323-0b03-4c8bfa6b19e0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5605-0323-96fd-87fcf19c3bfc	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5605-0323-853e-f28b80f51033	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5605-0323-937c-99273c287b02	Rekvizit-read	Rekvizit - branje	f
00030000-5605-0323-8e0f-baa6d3a3434e	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5605-0323-cc6d-ec672ac3fe54	Revizija-read	Revizija - branje	f
00030000-5605-0323-6965-db20e6b6b13f	Revizija-write	Revizija - spreminjanje	f
00030000-5605-0323-156c-0409f9deff1e	Rezervacija-read	Rezervacija - branje	f
00030000-5605-0323-6799-0f43e01702d5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5605-0323-354a-6dc7c8668535	SedezniRed-read	SedezniRed - branje	f
00030000-5605-0323-6cb8-a8c12f6f5d46	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5605-0323-21ce-7a6494851a91	Sedez-read	Sedez - branje	f
00030000-5605-0323-9ebd-2743375ec742	Sedez-write	Sedez - spreminjanje	f
00030000-5605-0323-4c65-4e77d553e115	Sezona-read	Sezona - branje	f
00030000-5605-0323-6676-9c276184f5f0	Sezona-write	Sezona - spreminjanje	f
00030000-5605-0323-c903-6cd4e1ac7cda	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5605-0323-7594-e873e1494864	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5605-0323-15c6-f2d9066d2f65	Stevilcenje-read	Stevilcenje - branje	f
00030000-5605-0323-a822-839c7ea0c287	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5605-0323-eaa1-aaf647d40aa7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5605-0323-66f1-707dbf91ecf6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5605-0323-510a-aab720c431e6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5605-0323-9555-63cf8790b3d9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5605-0323-4124-31ca0255eb82	Telefonska-read	Telefonska - branje	f
00030000-5605-0323-09f9-366ac5d3d865	Telefonska-write	Telefonska - spreminjanje	f
00030000-5605-0323-5877-916a3b3b2fa2	TerminStoritve-read	TerminStoritve - branje	f
00030000-5605-0323-4b64-d2434040a1db	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5605-0323-e9fe-5980b6a45d2a	TipFunkcije-read	TipFunkcije - branje	f
00030000-5605-0323-04cb-129951ce4010	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5605-0323-73f6-477564415041	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5605-0323-6e06-ac3e1589315a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5605-0323-a868-9b6532e0f327	Trr-read	Trr - branje	f
00030000-5605-0323-66fe-56d210cf21b4	Trr-write	Trr - spreminjanje	f
00030000-5605-0323-e8fb-5d74f2d18db4	Uprizoritev-read	Uprizoritev - branje	f
00030000-5605-0323-5bfd-320b40f940e5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5605-0323-1fae-7097f7241abd	Vaja-read	Vaja - branje	f
00030000-5605-0323-6551-41f2348410d7	Vaja-write	Vaja - spreminjanje	f
00030000-5605-0323-811d-9fd93ee64186	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5605-0323-abf1-b21ef8607f1a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5605-0323-e22b-482ba2ac5926	VrstaStroska-read	VrstaStroska - branje	f
00030000-5605-0323-1631-96ac3162adbf	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5605-0323-a98d-2e094adcaba7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5605-0323-7520-1fa1ab3e5dd4	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5605-0323-0414-339fef77fc5b	Zasedenost-read	Zasedenost - branje	f
00030000-5605-0323-88ad-b0af23e25ded	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5605-0323-865c-d8ef70db6b32	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5605-0323-e211-2e32eb2254b8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5605-0323-03a0-d9dc6a8cef87	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5605-0323-0d12-1c0b8dbe398d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5605-0323-b239-e914b481a38c	Job-read	Branje opravil - samo zase - branje	f
00030000-5605-0323-2773-3c680bf37558	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5605-0323-8ebf-81e4d8a603f7	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5605-0323-53b6-a03a783a7c86	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5605-0323-bb52-067d8fe4c8f4	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5605-0323-aa44-362dcecd88a7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5605-0323-fcf5-2c4b9a0d81dc	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5605-0323-0248-4d84dc62d136	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-0323-8df1-cb91be4c0511	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-0323-0a0a-76c2529e60c5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-0323-0c19-9e45aec1d7ee	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-0323-a16b-1efdd9060949	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5605-0323-1c14-345cc04ee6dd	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5605-0323-f191-8963ad5b70a3	Datoteka-write	Datoteka - spreminjanje	f
00030000-5605-0323-5bf5-0eba21601b87	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2973 (class 0 OID 20620122)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5605-0323-adb4-dfdf36f415f9	00030000-5605-0323-1c38-317fecff5385
00020000-5605-0323-9ec5-9610f0b21156	00030000-5605-0323-244e-514f8d8261f6
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-c8fc-865b7f4b7c37
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-5bca-7cb9d46afbd8
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-103e-dd42e2390963
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-3345-2b7a986c8b3f
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-ec75-8004b3c46a70
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-c20e-c0932ea4188f
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-667a-7f5556788a10
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-2fc3-c7e160c3233d
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-244e-514f8d8261f6
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-2b4c-995b70d5e148
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-37ad-37820bc0b1b3
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-8ce9-aed14ff7540b
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-d4ac-453959b28af3
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-1703-b56f8c495b68
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-a46b-41c5a5e49f69
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-c454-0eca4d478392
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-311b-4475836711aa
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-bbbb-58b683af393d
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-44f8-361c94b64b73
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-7de0-a5011f344551
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-4952-e1d5cbd3d013
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-4205-015f26dfa2f8
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-ecf1-f77e15750e17
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-0a03-83c02c9ca7cd
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-4a70-eb186206cc00
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-450a-e72db05f943c
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-3c79-4d3f0e12e6c1
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-327d-e9de5ffdaef4
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-da6b-99504cfa4d93
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-8537-88457d4e9bfd
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-0829-1ebb6e10444a
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-516a-8cb98460ca0d
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-5075-3b2ac099587b
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-939b-798426c9508a
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-96fd-87fcf19c3bfc
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-853e-f28b80f51033
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-937c-99273c287b02
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-8e0f-baa6d3a3434e
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-4c65-4e77d553e115
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-6676-9c276184f5f0
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-e9fe-5980b6a45d2a
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-e8fb-5d74f2d18db4
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-5bfd-320b40f940e5
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-1fae-7097f7241abd
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-6551-41f2348410d7
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-0414-339fef77fc5b
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-88ad-b0af23e25ded
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-865c-d8ef70db6b32
00020000-5605-0323-7614-0db88bdd77bd	00030000-5605-0323-03a0-d9dc6a8cef87
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-c8fc-865b7f4b7c37
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-ec75-8004b3c46a70
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-c20e-c0932ea4188f
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-244e-514f8d8261f6
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-d4ac-453959b28af3
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-a46b-41c5a5e49f69
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-311b-4475836711aa
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-bbbb-58b683af393d
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-44f8-361c94b64b73
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-7de0-a5011f344551
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-4952-e1d5cbd3d013
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-4205-015f26dfa2f8
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-ecf1-f77e15750e17
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-4a70-eb186206cc00
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-3c79-4d3f0e12e6c1
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-327d-e9de5ffdaef4
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-da6b-99504cfa4d93
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-5075-3b2ac099587b
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-96fd-87fcf19c3bfc
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-937c-99273c287b02
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-4c65-4e77d553e115
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-4124-31ca0255eb82
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-09f9-366ac5d3d865
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-a868-9b6532e0f327
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-66fe-56d210cf21b4
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-a98d-2e094adcaba7
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-7520-1fa1ab3e5dd4
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-865c-d8ef70db6b32
00020000-5605-0323-c402-56dfb096f3ea	00030000-5605-0323-03a0-d9dc6a8cef87
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-c8fc-865b7f4b7c37
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-103e-dd42e2390963
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-ec75-8004b3c46a70
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-5a67-2d51817188c9
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-9a96-decdda4781e5
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-c968-0b3afd46281b
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-c20e-c0932ea4188f
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-244e-514f8d8261f6
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-37ad-37820bc0b1b3
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-d4ac-453959b28af3
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-a46b-41c5a5e49f69
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-311b-4475836711aa
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-44f8-361c94b64b73
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-7de0-a5011f344551
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-4952-e1d5cbd3d013
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-ecf1-f77e15750e17
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-4a70-eb186206cc00
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-da6b-99504cfa4d93
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-0829-1ebb6e10444a
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-5075-3b2ac099587b
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-96fd-87fcf19c3bfc
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-937c-99273c287b02
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-4c65-4e77d553e115
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-e9fe-5980b6a45d2a
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-1fae-7097f7241abd
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-0414-339fef77fc5b
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-865c-d8ef70db6b32
00020000-5605-0323-8d8f-88b960b13b12	00030000-5605-0323-03a0-d9dc6a8cef87
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-c8fc-865b7f4b7c37
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-5bca-7cb9d46afbd8
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-3345-2b7a986c8b3f
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-ec75-8004b3c46a70
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-c20e-c0932ea4188f
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-244e-514f8d8261f6
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-d4ac-453959b28af3
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-a46b-41c5a5e49f69
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-44f8-361c94b64b73
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-7de0-a5011f344551
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-ecf1-f77e15750e17
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-4a70-eb186206cc00
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-da6b-99504cfa4d93
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-5075-3b2ac099587b
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-96fd-87fcf19c3bfc
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-937c-99273c287b02
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-4c65-4e77d553e115
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-e9fe-5980b6a45d2a
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-865c-d8ef70db6b32
00020000-5605-0323-3749-3d5433b5d973	00030000-5605-0323-03a0-d9dc6a8cef87
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-c8fc-865b7f4b7c37
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-ec75-8004b3c46a70
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-c20e-c0932ea4188f
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-244e-514f8d8261f6
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-d4ac-453959b28af3
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-a46b-41c5a5e49f69
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-44f8-361c94b64b73
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-7de0-a5011f344551
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-ecf1-f77e15750e17
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-4a70-eb186206cc00
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-da6b-99504cfa4d93
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-5075-3b2ac099587b
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-96fd-87fcf19c3bfc
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-937c-99273c287b02
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-4c65-4e77d553e115
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-5877-916a3b3b2fa2
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-f93c-51e90629a158
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-e9fe-5980b6a45d2a
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-865c-d8ef70db6b32
00020000-5605-0323-4cb6-e959b186288e	00030000-5605-0323-03a0-d9dc6a8cef87
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6100-7aeeaaaca2a0
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-1c38-317fecff5385
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-f93c-51e90629a158
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-667a-7f5556788a10
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-d48d-806c53217f5e
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-8405-b4e7f2491fe2
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-f606-59431488290a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c8fc-865b7f4b7c37
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5bca-7cb9d46afbd8
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-103e-dd42e2390963
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-3345-2b7a986c8b3f
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-ec75-8004b3c46a70
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5a67-2d51817188c9
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-9a96-decdda4781e5
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c83e-4596a09571b4
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c968-0b3afd46281b
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4114-27533f0b8b90
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c20e-c0932ea4188f
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-2fc3-c7e160c3233d
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-244e-514f8d8261f6
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-2b4c-995b70d5e148
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4a86-51025265f99f
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-69bb-09e923f9b2bb
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-20d3-f0baccd934ac
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c060-05dc4f29c711
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-37ad-37820bc0b1b3
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-8ce9-aed14ff7540b
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-d4ac-453959b28af3
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-1703-b56f8c495b68
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-a46b-41c5a5e49f69
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c454-0eca4d478392
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-311b-4475836711aa
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-bbbb-58b683af393d
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5d56-6119abd62588
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-33ff-0b5f424e412a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-3628-d4a53156899b
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-ccfb-deea2ee55fc3
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-44f8-361c94b64b73
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-f696-13dc233bf479
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-7de0-a5011f344551
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-7ca6-62d2b670f082
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4952-e1d5cbd3d013
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4205-015f26dfa2f8
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-0668-29372ac0bdbb
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5bbc-ff5b11148427
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-a6a1-bb363776d96e
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-f06e-633b89821f18
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-47d0-b9b203733962
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-98ed-ab8f63735a14
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-ecf1-f77e15750e17
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-0a03-83c02c9ca7cd
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4a70-eb186206cc00
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-450a-e72db05f943c
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-22d9-c5c110b1dab4
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6e42-0c03a5d93fc9
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-04e5-616121e13edd
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-43c2-fcbcce948b3f
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-3c79-4d3f0e12e6c1
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-327d-e9de5ffdaef4
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-da6b-99504cfa4d93
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-8537-88457d4e9bfd
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6415-37382e49d624
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4a9d-0a600edd8bd9
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-ee39-bf5c1c505565
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-48ea-d192ab997abc
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-0829-1ebb6e10444a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-516a-8cb98460ca0d
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-bf72-adf976e41b6f
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-82f0-7dd45a727105
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-2aee-a80bde435252
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-ffb4-3de25969b19a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-8522-1e60cc2e5d14
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-749b-04ca9ace3a38
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-9413-4089a7cc4b4b
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-d038-0a9bfb220091
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-50d9-8d908b7c7bc0
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-7f45-28285a0cadc6
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-3b91-e18bb76cab3e
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-ed50-5784c7470de8
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-13d3-75f676f7e88d
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-70d5-625bee1666fb
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c881-f7a292747535
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-200b-3fa8b1737a7d
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-0e57-6bf1b0099710
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4663-820773283b4a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5a10-5ec98ae3a031
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6e79-f986c8db2281
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5075-3b2ac099587b
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-939b-798426c9508a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-e30d-b901536f532b
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c46e-523f196d4e04
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-86b2-74cd2bc3aacf
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-0b03-4c8bfa6b19e0
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-96fd-87fcf19c3bfc
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-853e-f28b80f51033
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-937c-99273c287b02
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-8e0f-baa6d3a3434e
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-cc6d-ec672ac3fe54
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6965-db20e6b6b13f
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-156c-0409f9deff1e
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6799-0f43e01702d5
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-354a-6dc7c8668535
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6cb8-a8c12f6f5d46
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-21ce-7a6494851a91
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-9ebd-2743375ec742
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4c65-4e77d553e115
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6676-9c276184f5f0
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-c903-6cd4e1ac7cda
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-7594-e873e1494864
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-15c6-f2d9066d2f65
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-a822-839c7ea0c287
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-eaa1-aaf647d40aa7
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-66f1-707dbf91ecf6
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-510a-aab720c431e6
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-9555-63cf8790b3d9
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4124-31ca0255eb82
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-09f9-366ac5d3d865
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5877-916a3b3b2fa2
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-4b64-d2434040a1db
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-e9fe-5980b6a45d2a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-04cb-129951ce4010
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-73f6-477564415041
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6e06-ac3e1589315a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-a868-9b6532e0f327
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-66fe-56d210cf21b4
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-e8fb-5d74f2d18db4
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-5bfd-320b40f940e5
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-1fae-7097f7241abd
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-6551-41f2348410d7
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-811d-9fd93ee64186
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-abf1-b21ef8607f1a
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-e22b-482ba2ac5926
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-1631-96ac3162adbf
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-a98d-2e094adcaba7
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-7520-1fa1ab3e5dd4
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-0414-339fef77fc5b
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-88ad-b0af23e25ded
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-865c-d8ef70db6b32
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-e211-2e32eb2254b8
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-03a0-d9dc6a8cef87
00020000-5605-0325-72fa-9dcdf65ab7b2	00030000-5605-0323-0d12-1c0b8dbe398d
\.


--
-- TOC entry 3002 (class 0 OID 20620447)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 20620481)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20620617)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5605-0325-86ba-b2318d8b8dd7	00090000-5605-0325-48b7-15c531203372	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5605-0325-2c50-03054e3d1a44	00090000-5605-0325-5fa0-8505f3841ddf	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5605-0325-3bf4-9675a6720105	00090000-5605-0325-95ad-84af88e3f5be	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5605-0325-bb53-9f496cda3cb2	00090000-5605-0325-5a42-be896944a81d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2978 (class 0 OID 20620182)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5605-0325-05e4-057c72f7ba8e	00040000-5605-0323-1c50-47e43a9d2d66	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0325-9aa6-7f90bb9036de	00040000-5605-0323-1c50-47e43a9d2d66	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5605-0325-3edd-3191e7acf8e8	00040000-5605-0323-1c50-47e43a9d2d66	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0325-873b-ade4d7c73c41	00040000-5605-0323-1c50-47e43a9d2d66	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0325-958d-d056043c0703	00040000-5605-0323-1c50-47e43a9d2d66	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0325-cef0-c34d501a08cf	00040000-5605-0323-3692-f1a9c6ddeea2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0325-5b55-ab642bebaa0e	00040000-5605-0323-8e0e-1890c527cd16	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0325-6b42-00ea95494cd7	00040000-5605-0323-0051-8044cea5f31c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0325-54e5-d3c596283f67	00040000-5605-0323-58b9-740b62af1b65	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-0327-4e0d-86ba55105c53	00040000-5605-0323-1c50-47e43a9d2d66	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2980 (class 0 OID 20620216)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5605-0323-63cd-f42f2b70a88f	8341	Adlešiči
00050000-5605-0323-7279-b2fde3545340	5270	Ajdovščina
00050000-5605-0323-8473-2be559327ae4	6280	Ankaran/Ancarano
00050000-5605-0323-72b1-d809b32ccf10	9253	Apače
00050000-5605-0323-1f30-f549e0fc7b06	8253	Artiče
00050000-5605-0323-89ff-61e1830ee9fa	4275	Begunje na Gorenjskem
00050000-5605-0323-7423-88ea1784b48c	1382	Begunje pri Cerknici
00050000-5605-0323-5d57-e08a4b019ee4	9231	Beltinci
00050000-5605-0323-ced5-05560a328d14	2234	Benedikt
00050000-5605-0323-2e18-27cb34085973	2345	Bistrica ob Dravi
00050000-5605-0323-d8ae-caad63f216c5	3256	Bistrica ob Sotli
00050000-5605-0323-1356-27864c46382e	8259	Bizeljsko
00050000-5605-0323-c7c3-2a4476129ee8	1223	Blagovica
00050000-5605-0323-6328-e037f6f3c510	8283	Blanca
00050000-5605-0323-c3b0-c6106334ced8	4260	Bled
00050000-5605-0323-24c5-be44cd934c16	4273	Blejska Dobrava
00050000-5605-0323-8579-c8da88bc7c98	9265	Bodonci
00050000-5605-0323-f28d-0e44fdfd0b60	9222	Bogojina
00050000-5605-0323-fe25-75bc13d99779	4263	Bohinjska Bela
00050000-5605-0323-d66d-787bc49d320f	4264	Bohinjska Bistrica
00050000-5605-0323-bd19-0c5574c76311	4265	Bohinjsko jezero
00050000-5605-0323-4e95-b2f98c2ef32c	1353	Borovnica
00050000-5605-0323-b959-21ec965289ca	8294	Boštanj
00050000-5605-0323-c4da-e57fcb61f591	5230	Bovec
00050000-5605-0323-6b6c-897ac3f1490c	5295	Branik
00050000-5605-0323-0ad2-c5f27f5c72f1	3314	Braslovče
00050000-5605-0323-7a5d-7baee0efccf2	5223	Breginj
00050000-5605-0323-8993-fa472c900814	8280	Brestanica
00050000-5605-0323-3dda-10c036e77aa7	2354	Bresternica
00050000-5605-0323-c420-5ebed91d0998	4243	Brezje
00050000-5605-0323-0327-c12dbbf9cbce	1351	Brezovica pri Ljubljani
00050000-5605-0323-9704-85e6a2b73ee7	8250	Brežice
00050000-5605-0323-df0b-4ecefa3d3381	4210	Brnik - Aerodrom
00050000-5605-0323-cc71-a749a386caac	8321	Brusnice
00050000-5605-0323-bafd-8e4d76126a1f	3255	Buče
00050000-5605-0323-cc1a-d734ae5e3193	8276	Bučka 
00050000-5605-0323-866f-2465e20e1c03	9261	Cankova
00050000-5605-0323-e2ef-8af9bee53e38	3000	Celje 
00050000-5605-0323-7a96-1614738142ad	3001	Celje - poštni predali
00050000-5605-0323-7896-d9317f12f2b2	4207	Cerklje na Gorenjskem
00050000-5605-0323-3659-48a9601fa4a9	8263	Cerklje ob Krki
00050000-5605-0323-19af-71d688ec8b47	1380	Cerknica
00050000-5605-0323-672a-e212817171e4	5282	Cerkno
00050000-5605-0323-58b3-46a6995d6efc	2236	Cerkvenjak
00050000-5605-0323-d59c-77ab9b37a567	2215	Ceršak
00050000-5605-0323-b708-a2b7eda08e91	2326	Cirkovce
00050000-5605-0323-2b85-60d18d912622	2282	Cirkulane
00050000-5605-0323-75ba-10cf2922d9b0	5273	Col
00050000-5605-0323-da4c-e891658b1986	8251	Čatež ob Savi
00050000-5605-0323-e245-d0d4be07ee08	1413	Čemšenik
00050000-5605-0323-8ada-24825ea59b62	5253	Čepovan
00050000-5605-0323-c783-99a25646c99e	9232	Črenšovci
00050000-5605-0323-9f1a-873c3b238baf	2393	Črna na Koroškem
00050000-5605-0323-ace4-d0921b9e9ae9	6275	Črni Kal
00050000-5605-0323-fb98-c47bd967e92a	5274	Črni Vrh nad Idrijo
00050000-5605-0323-5a94-83a5d02b56a1	5262	Črniče
00050000-5605-0323-98f4-07957492d229	8340	Črnomelj
00050000-5605-0323-d870-1b31b5c8c8bd	6271	Dekani
00050000-5605-0323-12e2-ef1a4dc93144	5210	Deskle
00050000-5605-0323-c0af-176e8deca8a2	2253	Destrnik
00050000-5605-0323-8613-61ce43ccf9d0	6215	Divača
00050000-5605-0323-2561-a0df2671b6d2	1233	Dob
00050000-5605-0323-718f-3a8d8b260cd5	3224	Dobje pri Planini
00050000-5605-0323-483c-565b88c491c0	8257	Dobova
00050000-5605-0323-d3a5-1eab532f4313	1423	Dobovec
00050000-5605-0323-d025-f2a4a4fad674	5263	Dobravlje
00050000-5605-0323-1ee9-49991107b3d1	3204	Dobrna
00050000-5605-0323-eb86-2ddd0b7056a2	8211	Dobrnič
00050000-5605-0323-27e0-a3004da835db	1356	Dobrova
00050000-5605-0323-ee10-830e2d96b5ec	9223	Dobrovnik/Dobronak 
00050000-5605-0323-5781-76fabfc299d3	5212	Dobrovo v Brdih
00050000-5605-0323-c9e6-0e7295474542	1431	Dol pri Hrastniku
00050000-5605-0323-edbe-b2db426793b7	1262	Dol pri Ljubljani
00050000-5605-0323-fa66-42b8ae58e072	1273	Dole pri Litiji
00050000-5605-0323-c9bd-077290f184c4	1331	Dolenja vas
00050000-5605-0323-2bcc-d20633d04e4d	8350	Dolenjske Toplice
00050000-5605-0323-46ec-297c1328dd50	1230	Domžale
00050000-5605-0323-f9fd-8b9a3d1513ca	2252	Dornava
00050000-5605-0323-d106-8a0ee6c08c2b	5294	Dornberk
00050000-5605-0323-983c-9354e3de1f10	1319	Draga
00050000-5605-0323-51e3-54345040d884	8343	Dragatuš
00050000-5605-0323-b250-244261db1b81	3222	Dramlje
00050000-5605-0323-05e9-7cb8834fcda2	2370	Dravograd
00050000-5605-0323-da20-49b53db42e85	4203	Duplje
00050000-5605-0323-cd39-c95638119144	6221	Dutovlje
00050000-5605-0323-0952-cf94a5e61631	8361	Dvor
00050000-5605-0323-2cea-2e8a8b8e5d60	2343	Fala
00050000-5605-0323-1d43-5fdf1b00cc5d	9208	Fokovci
00050000-5605-0323-5c59-ecd787deaff4	2313	Fram
00050000-5605-0323-a55e-e803766e4d8e	3213	Frankolovo
00050000-5605-0323-9a47-51a0de8f3456	1274	Gabrovka
00050000-5605-0323-ce43-dc79f2be3ef3	8254	Globoko
00050000-5605-0323-c81b-618df7110d55	5275	Godovič
00050000-5605-0323-a38b-95c53787fc6b	4204	Golnik
00050000-5605-0323-f62b-51d44fbf1dab	3303	Gomilsko
00050000-5605-0323-6126-8fd5768b810a	4224	Gorenja vas
00050000-5605-0323-7227-18807bd85276	3263	Gorica pri Slivnici
00050000-5605-0323-c487-e50a8699bc20	2272	Gorišnica
00050000-5605-0323-af72-a7b240178c73	9250	Gornja Radgona
00050000-5605-0323-3c73-ff4a709b4151	3342	Gornji Grad
00050000-5605-0323-6bd7-8ef22a5c493a	4282	Gozd Martuljek
00050000-5605-0323-1bf7-d94327c6066e	6272	Gračišče
00050000-5605-0323-c967-9b09b349199a	9264	Grad
00050000-5605-0323-f056-b5c57794c237	8332	Gradac
00050000-5605-0323-0638-cf955d24ece4	1384	Grahovo
00050000-5605-0323-735c-7afff7efeccd	5242	Grahovo ob Bači
00050000-5605-0323-f296-91b4c978a20c	5251	Grgar
00050000-5605-0323-4a6e-c868ee6cba4b	3302	Griže
00050000-5605-0323-cf76-96c1a5d7b483	3231	Grobelno
00050000-5605-0323-0e9c-96ab8119d758	1290	Grosuplje
00050000-5605-0323-54c7-410f04895361	2288	Hajdina
00050000-5605-0323-dc10-ae080b2d80b7	8362	Hinje
00050000-5605-0323-d262-05b8866524a4	2311	Hoče
00050000-5605-0323-1146-04e085c30da2	9205	Hodoš/Hodos
00050000-5605-0323-88df-165336aa35b2	1354	Horjul
00050000-5605-0323-26e4-9e77320b89cb	1372	Hotedršica
00050000-5605-0323-6a69-e77d030a002f	1430	Hrastnik
00050000-5605-0323-41d9-f52dbb278d8d	6225	Hruševje
00050000-5605-0323-61fd-22cb6845cfd7	4276	Hrušica
00050000-5605-0323-5896-c1a431b39766	5280	Idrija
00050000-5605-0323-8c8d-368985168694	1292	Ig
00050000-5605-0323-04a9-56ea751a336d	6250	Ilirska Bistrica
00050000-5605-0323-67d5-b6b0266464ed	6251	Ilirska Bistrica-Trnovo
00050000-5605-0323-a434-d67a63f6906e	1295	Ivančna Gorica
00050000-5605-0323-92e8-b3ed0969ecff	2259	Ivanjkovci
00050000-5605-0323-5efe-8c8c6e6d3a81	1411	Izlake
00050000-5605-0323-5c54-ed4a16362c73	6310	Izola/Isola
00050000-5605-0323-4375-200f4cd73cf8	2222	Jakobski Dol
00050000-5605-0323-8361-87f733f873a9	2221	Jarenina
00050000-5605-0323-f182-5d35aa28e438	6254	Jelšane
00050000-5605-0323-b5a0-6c892145bdf4	4270	Jesenice
00050000-5605-0323-959a-a5778923c5e2	8261	Jesenice na Dolenjskem
00050000-5605-0323-8037-15f408fc2dd4	3273	Jurklošter
00050000-5605-0323-4c2d-d3c5676f77ae	2223	Jurovski Dol
00050000-5605-0323-d5fb-25eaa7273acf	2256	Juršinci
00050000-5605-0323-08e8-5b5165bf26d4	5214	Kal nad Kanalom
00050000-5605-0323-42d6-3b16d946ac05	3233	Kalobje
00050000-5605-0323-65a2-49b1b1da9073	4246	Kamna Gorica
00050000-5605-0323-aeea-1d56f76450d7	2351	Kamnica
00050000-5605-0323-0c86-4500fd320338	1241	Kamnik
00050000-5605-0323-2d14-511e2e7e86e0	5213	Kanal
00050000-5605-0323-bbdc-cb8bb9e9f6c9	8258	Kapele
00050000-5605-0323-8d37-917b2bed9c28	2362	Kapla
00050000-5605-0323-e72b-86ccdc188390	2325	Kidričevo
00050000-5605-0323-e700-1b04c66c7d0c	1412	Kisovec
00050000-5605-0323-9788-f5189476e89e	6253	Knežak
00050000-5605-0323-c997-c65339577e56	5222	Kobarid
00050000-5605-0323-e9af-44a1e8a842d4	9227	Kobilje
00050000-5605-0323-1f25-1632966b6911	1330	Kočevje
00050000-5605-0323-1fa4-a0496143d207	1338	Kočevska Reka
00050000-5605-0323-c013-ae003c512961	2276	Kog
00050000-5605-0323-4711-3c528199518d	5211	Kojsko
00050000-5605-0323-7cbc-d303d00d5d4f	6223	Komen
00050000-5605-0323-866b-86e98e477f80	1218	Komenda
00050000-5605-0323-7e12-e5c62193396a	6000	Koper/Capodistria 
00050000-5605-0323-df7c-238991db5a53	6001	Koper/Capodistria - poštni predali
00050000-5605-0323-551f-0edf282914c3	8282	Koprivnica
00050000-5605-0323-d8e5-12638e2ecee8	5296	Kostanjevica na Krasu
00050000-5605-0323-0240-13cf9b945968	8311	Kostanjevica na Krki
00050000-5605-0323-c715-bd3fcc8ceee0	1336	Kostel
00050000-5605-0323-49d2-5116773aaa1d	6256	Košana
00050000-5605-0323-734a-24ff61a3130c	2394	Kotlje
00050000-5605-0323-4b02-94241e925950	6240	Kozina
00050000-5605-0323-3333-b74e4dc5684f	3260	Kozje
00050000-5605-0323-c4ee-91f8a0ff9f78	4000	Kranj 
00050000-5605-0323-65cf-4d7f64dc28d8	4001	Kranj - poštni predali
00050000-5605-0323-db2d-ee7d8ff09e92	4280	Kranjska Gora
00050000-5605-0323-2437-19230f3e5ef7	1281	Kresnice
00050000-5605-0323-196f-4953df5409cc	4294	Križe
00050000-5605-0323-2469-cc5b9a459f86	9206	Križevci
00050000-5605-0323-9f78-15d0c5c27a81	9242	Križevci pri Ljutomeru
00050000-5605-0323-5263-1b837cd82184	1301	Krka
00050000-5605-0323-5b56-0adc09df48cc	8296	Krmelj
00050000-5605-0323-1beb-88c10c85ae5c	4245	Kropa
00050000-5605-0323-f698-4330b61a3593	8262	Krška vas
00050000-5605-0323-1c97-ca6a61b41698	8270	Krško
00050000-5605-0323-a98d-7d1abab9bfd7	9263	Kuzma
00050000-5605-0323-878f-d82b8ffac963	2318	Laporje
00050000-5605-0323-bb00-168e12ce99cc	3270	Laško
00050000-5605-0323-a564-8dd8222eb761	1219	Laze v Tuhinju
00050000-5605-0323-584d-5c66ab8af249	2230	Lenart v Slovenskih goricah
00050000-5605-0323-a723-549c121de436	9220	Lendava/Lendva
00050000-5605-0323-bb30-9b42349143d1	4248	Lesce
00050000-5605-0323-4066-69fbf42919e4	3261	Lesično
00050000-5605-0323-dac8-6cbab7139c91	8273	Leskovec pri Krškem
00050000-5605-0323-1ffb-36b398aeccca	2372	Libeliče
00050000-5605-0323-c98c-d8c222882b9f	2341	Limbuš
00050000-5605-0323-f73a-35dd0fc764fe	1270	Litija
00050000-5605-0323-a692-72f011ab5486	3202	Ljubečna
00050000-5605-0323-854a-d3ed1d4b466c	1000	Ljubljana 
00050000-5605-0323-74cc-cf8403b23a89	1001	Ljubljana - poštni predali
00050000-5605-0323-877e-0a29042b16e8	1231	Ljubljana - Črnuče
00050000-5605-0323-63d8-40e27592ca60	1261	Ljubljana - Dobrunje
00050000-5605-0323-6459-0cd3775cd53b	1260	Ljubljana - Polje
00050000-5605-0323-6b0c-46f233e55d37	1210	Ljubljana - Šentvid
00050000-5605-0323-9208-246e841249de	1211	Ljubljana - Šmartno
00050000-5605-0323-4f65-7c9cafde83ec	3333	Ljubno ob Savinji
00050000-5605-0323-aeee-b45ded1801c9	9240	Ljutomer
00050000-5605-0323-65b3-4d32860f9481	3215	Loče
00050000-5605-0323-c891-b45a8d1ae3fa	5231	Log pod Mangartom
00050000-5605-0323-3581-547a5086f8e7	1358	Log pri Brezovici
00050000-5605-0323-4add-8502a16af778	1370	Logatec
00050000-5605-0323-26f5-0da549722463	1371	Logatec
00050000-5605-0323-80c1-fd5f530f9059	1434	Loka pri Zidanem Mostu
00050000-5605-0323-8ab4-b076746026c9	3223	Loka pri Žusmu
00050000-5605-0323-f039-9601a6eb5d95	6219	Lokev
00050000-5605-0323-4dad-98ad0d94b35b	1318	Loški Potok
00050000-5605-0323-8cbd-ea76dc183378	2324	Lovrenc na Dravskem polju
00050000-5605-0323-9a2b-7ff2f2d7fc3f	2344	Lovrenc na Pohorju
00050000-5605-0323-05bc-ff72964d25a6	3334	Luče
00050000-5605-0323-b39e-73ca8b3a8498	1225	Lukovica
00050000-5605-0323-dc5b-5ec461d49f50	9202	Mačkovci
00050000-5605-0323-8e4e-6b86d6c3a1f3	2322	Majšperk
00050000-5605-0323-73ef-c825de6d313f	2321	Makole
00050000-5605-0323-7397-6e3229e2e3a6	9243	Mala Nedelja
00050000-5605-0323-1c06-0c7c411a6577	2229	Malečnik
00050000-5605-0323-8ac3-e7ba252f739b	6273	Marezige
00050000-5605-0323-018b-4491121e4194	2000	Maribor 
00050000-5605-0323-c8ac-5982df8e21b7	2001	Maribor - poštni predali
00050000-5605-0323-3df7-a97d5c97df55	2206	Marjeta na Dravskem polju
00050000-5605-0323-c7ec-05a1620be1eb	2281	Markovci
00050000-5605-0323-bad9-85d9456ac1b4	9221	Martjanci
00050000-5605-0323-a15f-3f27f0f78c9e	6242	Materija
00050000-5605-0323-0f1b-ff32b1d9d01d	4211	Mavčiče
00050000-5605-0323-ccdd-421dd7fb7cc9	1215	Medvode
00050000-5605-0323-db18-a2ee0c181e03	1234	Mengeš
00050000-5605-0323-97af-5fd5b974992f	8330	Metlika
00050000-5605-0323-40c7-afdfed6f4229	2392	Mežica
00050000-5605-0323-8979-3d71d2f3fcb0	2204	Miklavž na Dravskem polju
00050000-5605-0323-fea9-d111db81b312	2275	Miklavž pri Ormožu
00050000-5605-0323-853f-3bd53611dd9a	5291	Miren
00050000-5605-0323-bac9-8bb9cb9f4d6e	8233	Mirna
00050000-5605-0323-c7ce-fd2181f75553	8216	Mirna Peč
00050000-5605-0323-d7e2-da99b0c22eac	2382	Mislinja
00050000-5605-0323-8d1c-d8e6a6ac0a88	4281	Mojstrana
00050000-5605-0323-b713-e6e84c616842	8230	Mokronog
00050000-5605-0323-2fb6-bb89926db61c	1251	Moravče
00050000-5605-0323-9ac8-97b81331ef93	9226	Moravske Toplice
00050000-5605-0323-cac5-8e8b1909b166	5216	Most na Soči
00050000-5605-0323-2ca4-5d332abf6221	1221	Motnik
00050000-5605-0323-eadb-760206211b4c	3330	Mozirje
00050000-5605-0323-36b6-ee0c0e10718a	9000	Murska Sobota 
00050000-5605-0323-6c17-373574f26d94	9001	Murska Sobota - poštni predali
00050000-5605-0323-a57e-8582cea0e3f0	2366	Muta
00050000-5605-0323-7b92-5352b3b6b819	4202	Naklo
00050000-5605-0323-7c98-0d5264f3a615	3331	Nazarje
00050000-5605-0323-41f2-205c92ff0117	1357	Notranje Gorice
00050000-5605-0323-9baf-959bd5b90d96	3203	Nova Cerkev
00050000-5605-0323-e7a8-b72e5337e6cb	5000	Nova Gorica 
00050000-5605-0323-8ee8-81c740f9415a	5001	Nova Gorica - poštni predali
00050000-5605-0323-b984-90d28967475d	1385	Nova vas
00050000-5605-0323-2678-726d0a8d8695	8000	Novo mesto
00050000-5605-0323-e3a1-5bc36838b416	8001	Novo mesto - poštni predali
00050000-5605-0323-b046-c7a825488b47	6243	Obrov
00050000-5605-0323-2f48-081f63abecc1	9233	Odranci
00050000-5605-0323-bf0f-482337afc2a8	2317	Oplotnica
00050000-5605-0323-7d08-7909a3b919f4	2312	Orehova vas
00050000-5605-0323-64a8-af2183428f34	2270	Ormož
00050000-5605-0323-05bb-4e8eea580415	1316	Ortnek
00050000-5605-0323-a644-1baaf5c9a380	1337	Osilnica
00050000-5605-0323-ad2f-48a7dd78b7cf	8222	Otočec
00050000-5605-0323-597f-7f05359599a8	2361	Ožbalt
00050000-5605-0323-947d-c14898e54d0c	2231	Pernica
00050000-5605-0323-1939-2b8cbf7bf3c9	2211	Pesnica pri Mariboru
00050000-5605-0323-377f-f87ef09031d5	9203	Petrovci
00050000-5605-0323-6097-aa97025fc32e	3301	Petrovče
00050000-5605-0323-7f30-77677d4f5c67	6330	Piran/Pirano
00050000-5605-0323-badd-c894cc09b7dc	8255	Pišece
00050000-5605-0323-67ed-0e7530d6b361	6257	Pivka
00050000-5605-0323-371e-a9eabf0daad8	6232	Planina
00050000-5605-0323-d390-bb0b6c1e34c6	3225	Planina pri Sevnici
00050000-5605-0323-9ed3-d9c476f1c330	6276	Pobegi
00050000-5605-0323-ce2f-f53538cc38c5	8312	Podbočje
00050000-5605-0323-214a-aa9cd39238d7	5243	Podbrdo
00050000-5605-0323-3113-768767201fcf	3254	Podčetrtek
00050000-5605-0323-fcf7-6d87bc56512f	2273	Podgorci
00050000-5605-0323-cb67-6d1e13880d49	6216	Podgorje
00050000-5605-0323-9b71-5733bee86c3b	2381	Podgorje pri Slovenj Gradcu
00050000-5605-0323-16f7-b48a86b892d4	6244	Podgrad
00050000-5605-0323-86d7-550fe516e874	1414	Podkum
00050000-5605-0323-e468-1b639db8c670	2286	Podlehnik
00050000-5605-0323-c173-1fe824d6579d	5272	Podnanos
00050000-5605-0323-dd59-daa6b2fde3a3	4244	Podnart
00050000-5605-0323-46ca-46a3d2143a06	3241	Podplat
00050000-5605-0323-e556-0d360bbcd1d9	3257	Podsreda
00050000-5605-0323-5061-34123672bd51	2363	Podvelka
00050000-5605-0323-ec47-a9ff1a7a9b7e	2208	Pohorje
00050000-5605-0323-6736-b1273a8a6e60	2257	Polenšak
00050000-5605-0323-6e7c-9a8a8abc5b1c	1355	Polhov Gradec
00050000-5605-0323-d1b5-1e97e70380fe	4223	Poljane nad Škofjo Loko
00050000-5605-0323-77f6-c10fe177cf81	2319	Poljčane
00050000-5605-0323-4aab-bf8be5eedbcd	1272	Polšnik
00050000-5605-0323-4402-6a01430bc6e7	3313	Polzela
00050000-5605-0323-7c1d-562a27c7eec0	3232	Ponikva
00050000-5605-0323-5635-d1f9534f5bc9	6320	Portorož/Portorose
00050000-5605-0323-61cf-4117db725ab9	6230	Postojna
00050000-5605-0323-cd3c-42b5a387918a	2331	Pragersko
00050000-5605-0323-c743-9ebe13627bf5	3312	Prebold
00050000-5605-0323-c115-cecf0a128d09	4205	Preddvor
00050000-5605-0323-5013-5c9e23aeeb58	6255	Prem
00050000-5605-0323-e4d7-85720c3e589d	1352	Preserje
00050000-5605-0323-a143-6e907879b30c	6258	Prestranek
00050000-5605-0323-ff40-fc7b1ec3b561	2391	Prevalje
00050000-5605-0323-08a2-7bc42c396496	3262	Prevorje
00050000-5605-0323-cb2e-ba92a49043bf	1276	Primskovo 
00050000-5605-0323-f6e8-83b745fad339	3253	Pristava pri Mestinju
00050000-5605-0323-5a39-bb99e74e21e4	9207	Prosenjakovci/Partosfalva
00050000-5605-0323-fbc9-6431edfcc4c1	5297	Prvačina
00050000-5605-0323-9d64-adc3d26023fa	2250	Ptuj
00050000-5605-0323-628b-55641d9f5912	2323	Ptujska Gora
00050000-5605-0323-63b7-552fcf08bd7b	9201	Puconci
00050000-5605-0323-86c3-d9158e72bac0	2327	Rače
00050000-5605-0323-4b6d-7b290e27ea91	1433	Radeče
00050000-5605-0323-f29e-48824560c66d	9252	Radenci
00050000-5605-0323-8201-e2eef53c9b12	2360	Radlje ob Dravi
00050000-5605-0323-91b4-598090b72681	1235	Radomlje
00050000-5605-0323-16d5-f96c926eacc3	4240	Radovljica
00050000-5605-0323-ae3e-944c7d0806b3	8274	Raka
00050000-5605-0323-6bf3-eb098ecea6ff	1381	Rakek
00050000-5605-0323-a919-4e50e4f00e6e	4283	Rateče - Planica
00050000-5605-0323-4022-e59c47bdff02	2390	Ravne na Koroškem
00050000-5605-0323-443b-16fc7293e740	9246	Razkrižje
00050000-5605-0323-a931-13aae430a033	3332	Rečica ob Savinji
00050000-5605-0323-397a-5f6f9f228237	5292	Renče
00050000-5605-0323-bd8a-f47e5aaae6aa	1310	Ribnica
00050000-5605-0323-a5ef-044c429226b0	2364	Ribnica na Pohorju
00050000-5605-0323-8ae0-037fa5d809b1	3272	Rimske Toplice
00050000-5605-0323-ed69-6e8e4fe0bd7d	1314	Rob
00050000-5605-0323-c3b0-582f0ed76ed6	5215	Ročinj
00050000-5605-0323-1bb8-77be402a8ab8	3250	Rogaška Slatina
00050000-5605-0323-4f9b-588fb000ccbe	9262	Rogašovci
00050000-5605-0323-6751-7ed553c6225f	3252	Rogatec
00050000-5605-0323-0af8-4287bcf7d9c6	1373	Rovte
00050000-5605-0323-3f59-af20cc02de6f	2342	Ruše
00050000-5605-0323-68bb-26ef4a334209	1282	Sava
00050000-5605-0323-c40b-a604e7e02ba1	6333	Sečovlje/Sicciole
00050000-5605-0323-523d-f4ca05c93b7a	4227	Selca
00050000-5605-0323-0c73-6683a1f714ee	2352	Selnica ob Dravi
00050000-5605-0323-5fbf-7f4f9c11e557	8333	Semič
00050000-5605-0323-5253-98082119d60a	8281	Senovo
00050000-5605-0323-2902-2f5d87e8f2cd	6224	Senožeče
00050000-5605-0323-02f0-d627bf3e4c7d	8290	Sevnica
00050000-5605-0323-318f-0d757a2502b2	6210	Sežana
00050000-5605-0323-a184-dcfa00569a92	2214	Sladki Vrh
00050000-5605-0323-a1ed-71967d09ca46	5283	Slap ob Idrijci
00050000-5605-0323-ab2d-4515041e2fe1	2380	Slovenj Gradec
00050000-5605-0323-2cb3-59776169564b	2310	Slovenska Bistrica
00050000-5605-0323-6372-9f50d93c6db1	3210	Slovenske Konjice
00050000-5605-0323-3671-60b05fb6aab2	1216	Smlednik
00050000-5605-0323-c429-44868154ede9	5232	Soča
00050000-5605-0323-5aa6-a0988f375861	1317	Sodražica
00050000-5605-0323-4249-765d86e454f5	3335	Solčava
00050000-5605-0323-8708-00ddf3d76d4e	5250	Solkan
00050000-5605-0323-295d-8e753559ae87	4229	Sorica
00050000-5605-0323-5222-b6a4979bcb02	4225	Sovodenj
00050000-5605-0323-9cb0-e5941a15183e	5281	Spodnja Idrija
00050000-5605-0323-f80b-237a1efd5f4e	2241	Spodnji Duplek
00050000-5605-0323-2e7b-fdec9b6488b0	9245	Spodnji Ivanjci
00050000-5605-0323-9ead-0ca7f772a64f	2277	Središče ob Dravi
00050000-5605-0323-8c38-56b9cd6c2522	4267	Srednja vas v Bohinju
00050000-5605-0323-e18b-fe4c20851375	8256	Sromlje 
00050000-5605-0323-b898-ffaf4ad63536	5224	Srpenica
00050000-5605-0323-f53c-2a5bb5b7385b	1242	Stahovica
00050000-5605-0323-2292-ece72334186d	1332	Stara Cerkev
00050000-5605-0323-23e4-86b0b3043324	8342	Stari trg ob Kolpi
00050000-5605-0323-380c-298bd194ce2a	1386	Stari trg pri Ložu
00050000-5605-0323-150b-2950c4ec208b	2205	Starše
00050000-5605-0323-e122-b962a8ef2cba	2289	Stoperce
00050000-5605-0323-05da-9dc18c8d00f2	8322	Stopiče
00050000-5605-0323-b077-c8985b8f60ce	3206	Stranice
00050000-5605-0323-0a65-6d8a94ad5ba8	8351	Straža
00050000-5605-0323-0324-d71e14b49e70	1313	Struge
00050000-5605-0323-e8b0-391a535d85e6	8293	Studenec
00050000-5605-0323-6c03-66dd71e4bdd9	8331	Suhor
00050000-5605-0323-9b51-70cb93af496f	2233	Sv. Ana v Slovenskih goricah
00050000-5605-0323-eec3-3491b5b12bff	2235	Sv. Trojica v Slovenskih goricah
00050000-5605-0323-a8a8-34d8c8d08df5	2353	Sveti Duh na Ostrem Vrhu
00050000-5605-0323-56f6-6aff0317a3ac	9244	Sveti Jurij ob Ščavnici
00050000-5605-0323-f4ba-8e591c1b5bed	3264	Sveti Štefan
00050000-5605-0323-6aaa-9647cc65123b	2258	Sveti Tomaž
00050000-5605-0323-b355-bbbc9eca691b	9204	Šalovci
00050000-5605-0323-454b-ee3b04ae3b66	5261	Šempas
00050000-5605-0323-f9b6-2919fe0bdda5	5290	Šempeter pri Gorici
00050000-5605-0323-2f05-8ab8edd1760f	3311	Šempeter v Savinjski dolini
00050000-5605-0323-80c2-a16badcdd53a	4208	Šenčur
00050000-5605-0323-6b73-ba55db2f11fd	2212	Šentilj v Slovenskih goricah
00050000-5605-0323-84f8-9630fc8e1244	8297	Šentjanž
00050000-5605-0323-d701-51659b4ff0d1	2373	Šentjanž pri Dravogradu
00050000-5605-0323-59be-817c6ea0d4d1	8310	Šentjernej
00050000-5605-0323-839e-c1813776134f	3230	Šentjur
00050000-5605-0323-b193-e610e44e861c	3271	Šentrupert
00050000-5605-0323-181d-5a3e8b8a9602	8232	Šentrupert
00050000-5605-0323-67d8-496d1a370f08	1296	Šentvid pri Stični
00050000-5605-0323-0445-ee95183aa1a8	8275	Škocjan
00050000-5605-0323-095c-aec4dac8aaa3	6281	Škofije
00050000-5605-0323-470a-c9bf80e00e4d	4220	Škofja Loka
00050000-5605-0323-ca1b-58b3b58dc06c	3211	Škofja vas
00050000-5605-0323-ce37-696af7077a0b	1291	Škofljica
00050000-5605-0323-9a38-be8ee1a8b1d1	6274	Šmarje
00050000-5605-0323-741d-002ec4d07f85	1293	Šmarje - Sap
00050000-5605-0323-c7c7-ea8b9b387b2c	3240	Šmarje pri Jelšah
00050000-5605-0323-787e-43d1f7a81b0d	8220	Šmarješke Toplice
00050000-5605-0323-5b70-50d6f844564d	2315	Šmartno na Pohorju
00050000-5605-0323-b84d-754bf86fce0d	3341	Šmartno ob Dreti
00050000-5605-0323-b3c2-313dcd381a4a	3327	Šmartno ob Paki
00050000-5605-0323-49c5-ad91caeabbae	1275	Šmartno pri Litiji
00050000-5605-0323-b24e-77265a86314e	2383	Šmartno pri Slovenj Gradcu
00050000-5605-0323-9f61-ef8221e7b69f	3201	Šmartno v Rožni dolini
00050000-5605-0323-b456-3a42048fc76f	3325	Šoštanj
00050000-5605-0323-6a5a-6494d49b4401	6222	Štanjel
00050000-5605-0323-3a70-02888e65a9a7	3220	Štore
00050000-5605-0323-6fc6-ce1c712a77f0	3304	Tabor
00050000-5605-0323-13fb-3632bd2e04e8	3221	Teharje
00050000-5605-0323-f534-d6a8825fae4f	9251	Tišina
00050000-5605-0323-80f8-416c9755ab21	5220	Tolmin
00050000-5605-0323-e338-a100733bcd1d	3326	Topolšica
00050000-5605-0323-2ba1-382df7a7a486	2371	Trbonje
00050000-5605-0323-0599-3db0ff592df9	1420	Trbovlje
00050000-5605-0323-4314-b8b8df16eb8c	8231	Trebelno 
00050000-5605-0323-3fff-e00986edee5f	8210	Trebnje
00050000-5605-0323-833b-0c65b84f2f63	5252	Trnovo pri Gorici
00050000-5605-0323-0285-f40eb65bf690	2254	Trnovska vas
00050000-5605-0323-5e57-d3f7334f38a9	1222	Trojane
00050000-5605-0323-b3e5-b34eb6fd37a5	1236	Trzin
00050000-5605-0323-e2d9-a3f89bfac42a	4290	Tržič
00050000-5605-0323-7d58-d2bedb259752	8295	Tržišče
00050000-5605-0323-79bf-7d2669f1cb4e	1311	Turjak
00050000-5605-0323-8773-d460a41ffee1	9224	Turnišče
00050000-5605-0323-f595-ee7ba77399d4	8323	Uršna sela
00050000-5605-0323-6688-d2297005a854	1252	Vače
00050000-5605-0323-869c-d49f58f3ef7b	3320	Velenje 
00050000-5605-0323-f72e-e33825cc7d37	3322	Velenje - poštni predali
00050000-5605-0323-37ff-2495e6cf40c2	8212	Velika Loka
00050000-5605-0323-ce37-b1c6cd4853a0	2274	Velika Nedelja
00050000-5605-0323-2085-e4200b5712fd	9225	Velika Polana
00050000-5605-0323-f87e-d46203e83ee5	1315	Velike Lašče
00050000-5605-0323-23f6-edd83ab4784e	8213	Veliki Gaber
00050000-5605-0323-d5ed-65e2377e91e1	9241	Veržej
00050000-5605-0323-4eac-30b3228742b3	1312	Videm - Dobrepolje
00050000-5605-0323-2058-56cdfeef22f4	2284	Videm pri Ptuju
00050000-5605-0323-86c8-3111f528c9eb	8344	Vinica
00050000-5605-0323-0e11-9d4b9645b5ab	5271	Vipava
00050000-5605-0323-cd83-1b04f707fe92	4212	Visoko
00050000-5605-0323-2f59-9741a1e7a210	1294	Višnja Gora
00050000-5605-0323-fcfd-2b4c2f4d591f	3205	Vitanje
00050000-5605-0323-0989-3626c3862398	2255	Vitomarci
00050000-5605-0323-ec68-e688e126223a	1217	Vodice
00050000-5605-0323-5f31-3efcad9d1e0d	3212	Vojnik\t
00050000-5605-0323-f2ea-bdc831b437eb	5293	Volčja Draga
00050000-5605-0323-fbc3-49c8b2a05850	2232	Voličina
00050000-5605-0323-c8ac-046a8ed1be5f	3305	Vransko
00050000-5605-0323-ed11-cc1715117de3	6217	Vremski Britof
00050000-5605-0323-acaf-8960ebdcd903	1360	Vrhnika
00050000-5605-0323-0506-3d2e0eaae4c2	2365	Vuhred
00050000-5605-0323-6171-506121055b37	2367	Vuzenica
00050000-5605-0323-822c-200c83f02edc	8292	Zabukovje 
00050000-5605-0323-d493-7dffcc91cae7	1410	Zagorje ob Savi
00050000-5605-0323-5e44-e79fc00368a9	1303	Zagradec
00050000-5605-0323-bd74-8add8a332192	2283	Zavrč
00050000-5605-0323-65ec-98c5b9bd11a5	8272	Zdole 
00050000-5605-0323-73a7-65b0af6305fb	4201	Zgornja Besnica
00050000-5605-0323-b965-9bd9523bd6a5	2242	Zgornja Korena
00050000-5605-0323-123b-81fdc1e03779	2201	Zgornja Kungota
00050000-5605-0323-35bb-8670704c3036	2316	Zgornja Ložnica
00050000-5605-0323-5993-61f1cabbb2ff	2314	Zgornja Polskava
00050000-5605-0323-66e0-7b5fc90c4ef0	2213	Zgornja Velka
00050000-5605-0323-9063-4145f1e534bd	4247	Zgornje Gorje
00050000-5605-0323-f53d-f4ff7bb36fbd	4206	Zgornje Jezersko
00050000-5605-0323-6d3a-194f5a5e78e2	2285	Zgornji Leskovec
00050000-5605-0323-4c78-25ab83f27296	1432	Zidani Most
00050000-5605-0323-d1ae-580563e18302	3214	Zreče
00050000-5605-0323-b5d0-11b13ba0c51d	4209	Žabnica
00050000-5605-0323-e6cb-00d102521e5e	3310	Žalec
00050000-5605-0323-0606-7db534eb1ecf	4228	Železniki
00050000-5605-0323-362f-f0904a4a6380	2287	Žetale
00050000-5605-0323-7265-0387ac643a9f	4226	Žiri
00050000-5605-0323-b9fe-6bb68fb839cd	4274	Žirovnica
00050000-5605-0323-de93-9c5a276d2bb9	8360	Žužemberk
\.


--
-- TOC entry 3025 (class 0 OID 20620797)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20620421)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20620201)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5605-0325-ce61-f7306fee41b8	00080000-5605-0325-05e4-057c72f7ba8e	\N	00040000-5605-0323-1c50-47e43a9d2d66	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5605-0325-c134-dbb985dd634e	00080000-5605-0325-05e4-057c72f7ba8e	\N	00040000-5605-0323-1c50-47e43a9d2d66	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5605-0325-b726-577df9e6da69	00080000-5605-0325-9aa6-7f90bb9036de	\N	00040000-5605-0323-1c50-47e43a9d2d66	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2987 (class 0 OID 20620305)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20620433)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20620811)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20620821)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5605-0325-de7d-9525e10fd52a	00080000-5605-0325-3edd-3191e7acf8e8	0987	AK
00190000-5605-0325-4f04-b104e6948a3c	00080000-5605-0325-9aa6-7f90bb9036de	0989	AK
00190000-5605-0325-c255-bd5fd2eeb09d	00080000-5605-0325-873b-ade4d7c73c41	0986	AK
00190000-5605-0325-fdf3-c4279e8c38dc	00080000-5605-0325-cef0-c34d501a08cf	0984	AK
00190000-5605-0325-a167-e665d88f5f80	00080000-5605-0325-5b55-ab642bebaa0e	0983	AK
00190000-5605-0325-0ca5-46f2bc4598aa	00080000-5605-0325-6b42-00ea95494cd7	0982	AK
00190000-5605-0327-f4b6-dbafa89aaf2e	00080000-5605-0327-4e0d-86ba55105c53	1001	AK
\.


--
-- TOC entry 3024 (class 0 OID 20620754)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5605-0325-6cd0-a19816f29b43	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 20620829)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20620462)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5605-0325-5dce-afbc73821355	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5605-0325-45b3-799d4b4f684d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5605-0325-fa48-7029dfe08552	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5605-0325-b1d1-8885539b6bfa	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5605-0325-e57b-f56c12e7f93c	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5605-0325-4efe-8b18654ef738	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5605-0325-6910-469b9de66745	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2996 (class 0 OID 20620406)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20620396)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20620606)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20620536)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20620279)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20620074)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5605-0327-4e0d-86ba55105c53	00010000-5605-0324-e6e7-f41c48b0907c	2015-09-25 10:17:43	INS	a:0:{}
2	App\\Entity\\Option	00000000-5605-0327-76ca-8a78cc33079c	00010000-5605-0324-e6e7-f41c48b0907c	2015-09-25 10:17:43	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5605-0327-f4b6-dbafa89aaf2e	00010000-5605-0324-e6e7-f41c48b0907c	2015-09-25 10:17:43	INS	a:0:{}
\.


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3005 (class 0 OID 20620475)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 20620112)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5605-0323-adb4-dfdf36f415f9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5605-0323-9ec5-9610f0b21156	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5605-0323-1bf7-ff163d949119	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5605-0323-056c-620e1661cc74	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5605-0323-7614-0db88bdd77bd	planer	Planer dogodkov v koledarju	t
00020000-5605-0323-c402-56dfb096f3ea	kadrovska	Kadrovska služba	t
00020000-5605-0323-8d8f-88b960b13b12	arhivar	Ažuriranje arhivalij	t
00020000-5605-0323-3749-3d5433b5d973	igralec	Igralec	t
00020000-5605-0323-4cb6-e959b186288e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5605-0325-72fa-9dcdf65ab7b2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2970 (class 0 OID 20620096)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5605-0324-e892-a5bd58e65b33	00020000-5605-0323-1bf7-ff163d949119
00010000-5605-0324-e6e7-f41c48b0907c	00020000-5605-0323-1bf7-ff163d949119
00010000-5605-0325-ab5c-77fe7782d071	00020000-5605-0325-72fa-9dcdf65ab7b2
\.


--
-- TOC entry 3007 (class 0 OID 20620489)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20620427)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20620373)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20620061)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5605-0323-a778-ace5aa0dbf08	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5605-0323-6774-12a02c2d2545	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5605-0323-5eaf-062b8c7f7882	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5605-0323-621d-cce53a28bf17	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5605-0323-7ab1-d00e67a39de1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 20620053)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5605-0323-a9ab-d9a982cd149f	00230000-5605-0323-621d-cce53a28bf17	popa
00240000-5605-0323-0708-81210223f58b	00230000-5605-0323-621d-cce53a28bf17	oseba
00240000-5605-0323-1ff9-1475f71f69a4	00230000-5605-0323-621d-cce53a28bf17	sezona
00240000-5605-0323-74bf-6fe9f0d14e53	00230000-5605-0323-6774-12a02c2d2545	prostor
00240000-5605-0323-3a10-ccda07c5c02c	00230000-5605-0323-621d-cce53a28bf17	besedilo
00240000-5605-0323-166b-a0cdb8a891d8	00230000-5605-0323-621d-cce53a28bf17	uprizoritev
00240000-5605-0323-d4a8-908f435dd704	00230000-5605-0323-621d-cce53a28bf17	funkcija
00240000-5605-0323-af3f-5935acac123f	00230000-5605-0323-621d-cce53a28bf17	tipfunkcije
00240000-5605-0323-1c7a-378f2fb45df0	00230000-5605-0323-621d-cce53a28bf17	alternacija
00240000-5605-0323-fe7d-515deffdad92	00230000-5605-0323-a778-ace5aa0dbf08	pogodba
00240000-5605-0323-22a7-701d1502d4ee	00230000-5605-0323-621d-cce53a28bf17	zaposlitev
00240000-5605-0323-8122-01340220a451	00230000-5605-0323-621d-cce53a28bf17	zvrstuprizoritve
00240000-5605-0323-7cb1-6e1fe3f2f5fc	00230000-5605-0323-a778-ace5aa0dbf08	programdela
00240000-5605-0323-a885-aa7a34c0e538	00230000-5605-0323-621d-cce53a28bf17	zapis
\.


--
-- TOC entry 2964 (class 0 OID 20620048)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
892d08e1-c6de-40e7-8430-d5b7331920d3	00240000-5605-0323-a9ab-d9a982cd149f	0	1001
\.


--
-- TOC entry 3013 (class 0 OID 20620553)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5605-0325-e353-cb751ad96c28	000e0000-5605-0325-3292-58b15ec30e16	00080000-5605-0325-05e4-057c72f7ba8e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5605-0323-2c66-7a306ad3f50a
00270000-5605-0325-e651-8e3ab0b27290	000e0000-5605-0325-3292-58b15ec30e16	00080000-5605-0325-05e4-057c72f7ba8e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5605-0323-2c66-7a306ad3f50a
\.


--
-- TOC entry 2977 (class 0 OID 20620174)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20620383)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5605-0325-649a-760a447e9147	00180000-5605-0325-af46-daa1f77446f3	000c0000-5605-0325-82fc-a5acc7c3e4a0	00090000-5605-0325-d9c1-3fd0aaf5650e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-0325-57f4-43c43c218888	00180000-5605-0325-af46-daa1f77446f3	000c0000-5605-0325-f1b5-65d62970d3eb	00090000-5605-0325-5a42-be896944a81d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-0325-d583-ace6791fec60	00180000-5605-0325-af46-daa1f77446f3	000c0000-5605-0325-1381-c6248f64e350	00090000-5605-0325-ad93-50fd322eb3fa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-0325-3552-cc04b92f6fb3	00180000-5605-0325-af46-daa1f77446f3	000c0000-5605-0325-6a5e-8a9bded09bc6	00090000-5605-0325-3e24-659094313676	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-0325-ded6-34c53f265705	00180000-5605-0325-af46-daa1f77446f3	000c0000-5605-0325-653e-5143f19c5fd2	00090000-5605-0325-ae9d-b18fe0ea4c07	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-0325-6dc9-2d8824572b82	00180000-5605-0325-d4ff-63e47dff2630	\N	00090000-5605-0325-ae9d-b18fe0ea4c07	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3016 (class 0 OID 20620594)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5605-0323-6f9a-571381b9b5b5	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5605-0323-fad9-d5f4c683c071	02	Priredba	Priredba	Priredba	umetnik
000f0000-5605-0323-ad2a-a5153a89c088	03	Prevod	Prevod	Prevod	umetnik
000f0000-5605-0323-1207-75fe227b0276	04	Režija	Režija	Režija	umetnik
000f0000-5605-0323-5cee-3129d6944359	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5605-0323-6ac1-6a17005c3e42	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5605-0323-f5f7-09feb3e912d3	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5605-0323-d2a3-bc399624746a	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5605-0323-132e-3f67d014b165	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5605-0323-9071-4304e1499cd2	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5605-0323-51b0-cc76804ea2ae	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5605-0323-f50e-3af12241088d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5605-0323-6758-dd843831b5fc	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5605-0323-9999-87108b006cac	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5605-0323-a6ac-3dff2287b6a6	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5605-0323-fd9f-276ff6fc3cca	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5605-0323-1c63-6f7db8f1422b	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5605-0323-945d-df908bff056d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3029 (class 0 OID 20620839)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5605-0323-0fb6-59b227682ead	01	Velika predstava	f	1.00	1.00
002b0000-5605-0323-e9ed-ec403c59c029	02	Mala predstava	f	0.50	0.50
002b0000-5605-0323-56ed-044412d673d0	03	Mala koprodukcija	t	0.40	1.00
002b0000-5605-0323-127f-e936161b1695	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5605-0323-a3f0-9e50f03d3647	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2982 (class 0 OID 20620236)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20620083)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5605-0324-e6e7-f41c48b0907c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO3/qmSGCcnjqQfMVcCxuztGss/XvoPSu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5605-0325-2a3b-37e1bca91dad	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5605-0325-844f-2ff591fe210c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5605-0325-7af8-73b1c4fa3ed7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5605-0325-efb6-442930a9c2fb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5605-0325-fb6f-5bc48b6ed36c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5605-0325-b8bf-c5014bad70de	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5605-0325-d6c2-d9fed69299ac	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5605-0325-f2ab-db6cdc755f91	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5605-0325-2fb3-19d436a556a8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5605-0325-ab5c-77fe7782d071	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5605-0324-e892-a5bd58e65b33	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3020 (class 0 OID 20620644)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5605-0325-4cbe-bfa926643666	00160000-5605-0325-49fc-20c478966149	\N	00140000-5605-0323-5b9e-6e2c2928cfb1	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5605-0325-e57b-f56c12e7f93c
000e0000-5605-0325-3292-58b15ec30e16	00160000-5605-0325-bf18-26f1e1ec8b42	\N	00140000-5605-0323-12e2-adb58998b448	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5605-0325-4efe-8b18654ef738
000e0000-5605-0325-b08c-7a3191008e40	\N	\N	00140000-5605-0323-12e2-adb58998b448	00190000-5605-0325-de7d-9525e10fd52a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-0325-e57b-f56c12e7f93c
000e0000-5605-0325-3cb9-9b9650221658	\N	\N	00140000-5605-0323-12e2-adb58998b448	00190000-5605-0325-de7d-9525e10fd52a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-0325-e57b-f56c12e7f93c
000e0000-5605-0325-4579-2136fdf7ded5	\N	\N	00140000-5605-0323-12e2-adb58998b448	00190000-5605-0325-de7d-9525e10fd52a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-0325-5dce-afbc73821355
000e0000-5605-0325-9831-bec8bd615619	\N	\N	00140000-5605-0323-12e2-adb58998b448	00190000-5605-0325-de7d-9525e10fd52a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-0325-5dce-afbc73821355
\.


--
-- TOC entry 2989 (class 0 OID 20620326)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5605-0325-b772-fd41e4d1c7e4	000e0000-5605-0325-3292-58b15ec30e16	\N	1	
00200000-5605-0325-8156-8be81411eb66	000e0000-5605-0325-3292-58b15ec30e16	\N	2	
00200000-5605-0325-f1ea-ca71450aedb4	000e0000-5605-0325-3292-58b15ec30e16	\N	3	
00200000-5605-0325-b29b-2895789e5461	000e0000-5605-0325-3292-58b15ec30e16	\N	4	
00200000-5605-0325-1010-e885a4124a09	000e0000-5605-0325-3292-58b15ec30e16	\N	5	
\.


--
-- TOC entry 3003 (class 0 OID 20620454)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20620567)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5605-0323-9567-27ac10c6cd4f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5605-0323-42cc-f8149cb50216	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5605-0323-516c-7122e18fdb73	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5605-0323-9297-30546b4ebfa2	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5605-0323-ff40-2f7b296ae779	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5605-0323-01a5-d2a60946f3b0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5605-0323-a5c3-5ab7dc493a20	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5605-0323-e565-5e4e1b0f1093	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5605-0323-2c66-7a306ad3f50a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5605-0323-b9e4-8dca78cb45b7	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5605-0323-c0f0-22336c602a14	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5605-0323-b64c-f76fa89ee5a9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5605-0323-7f4f-96d72b15b539	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5605-0323-d0dc-c4fcb5b56d62	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5605-0323-812a-4762e39afe60	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5605-0323-cc38-eef96baa60b3	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5605-0323-d2b2-8e4a8790fba4	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5605-0323-f8a4-c1ee04a4df8a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5605-0323-6544-ae05d6f3ee59	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5605-0323-6d60-faf19e9a98a1	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5605-0323-1e4a-67640129ff28	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5605-0323-e533-560ea322d084	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5605-0323-fc48-eaa3f542ed56	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5605-0323-cd5f-dd266b8125df	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5605-0323-2d71-5469272b4268	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5605-0323-e635-c287b2b83810	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5605-0323-aa51-4c4800c244e0	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5605-0323-3b1a-311a77217bd8	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3032 (class 0 OID 20620886)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20620858)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20620898)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20620526)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5605-0325-b42a-03b5376648a4	00090000-5605-0325-5a42-be896944a81d	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-0325-0f36-e8cb2ac5838a	00090000-5605-0325-ad93-50fd322eb3fa	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-0325-8b47-3f2c34c56a8d	00090000-5605-0325-8dd8-aac6195e2d00	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-0325-2502-94bd88ab4de2	00090000-5605-0325-cd89-d8f14e7d483b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-0325-12dc-f1845bb2af91	00090000-5605-0325-d9c1-3fd0aaf5650e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-0325-3d2e-a810a54d9ebd	00090000-5605-0325-92f8-7c58052abcb2	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2991 (class 0 OID 20620362)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20620634)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5605-0323-5b9e-6e2c2928cfb1	01	Drama	drama (SURS 01)
00140000-5605-0323-0dbe-ee5bb9d1c858	02	Opera	opera (SURS 02)
00140000-5605-0323-82a0-56c6e955e2fb	03	Balet	balet (SURS 03)
00140000-5605-0323-7e7c-a4cf50003514	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5605-0323-719a-240a9bf9ef9c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5605-0323-12e2-adb58998b448	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5605-0323-e970-d4ba007c3001	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3009 (class 0 OID 20620516)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2496 (class 2606 OID 20620137)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 20620693)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 20620683)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 20620550)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 20620592)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 20620938)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 20620351)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 20620372)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 20620856)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20620262)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 20620748)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 20620512)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 20620324)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20620300)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 20620276)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20620419)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 20620915)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 20620922)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2750 (class 2606 OID 20620946)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 20579803)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2608 (class 2606 OID 20620446)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 20620234)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20620146)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 20620170)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20620126)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2487 (class 2606 OID 20620111)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20620452)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 20620488)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 20620629)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20620198)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20620222)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20620809)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 20620425)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 20620212)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 20620312)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 20620437)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 20620818)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 20620826)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20620796)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20620837)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20620470)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 20620410)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 20620401)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 20620616)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 20620543)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 20620288)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20620082)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 20620479)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20620100)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2489 (class 2606 OID 20620120)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20620497)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 20620432)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 20620381)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20620070)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20620058)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 20620052)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20620563)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 20620179)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 20620392)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20620603)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20620849)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 20620247)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 20620095)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20620662)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 20620334)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20620460)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20620575)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20620896)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 20620880)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 20620904)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 20620534)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 20620366)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 20620642)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20620524)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 1259 OID 20620360)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2561 (class 1259 OID 20620361)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2562 (class 1259 OID 20620359)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2563 (class 1259 OID 20620358)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2564 (class 1259 OID 20620357)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2650 (class 1259 OID 20620564)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2651 (class 1259 OID 20620565)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 20620566)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2736 (class 1259 OID 20620917)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2737 (class 1259 OID 20620916)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2510 (class 1259 OID 20620200)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 20620453)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2723 (class 1259 OID 20620884)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2724 (class 1259 OID 20620883)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2725 (class 1259 OID 20620885)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2726 (class 1259 OID 20620882)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2727 (class 1259 OID 20620881)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 20620439)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2604 (class 1259 OID 20620438)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2555 (class 1259 OID 20620335)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20620513)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20620515)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2635 (class 1259 OID 20620514)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2535 (class 1259 OID 20620278)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2536 (class 1259 OID 20620277)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2714 (class 1259 OID 20620838)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2666 (class 1259 OID 20620631)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2667 (class 1259 OID 20620632)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 20620633)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2733 (class 1259 OID 20620905)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2675 (class 1259 OID 20620667)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2676 (class 1259 OID 20620664)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2677 (class 1259 OID 20620668)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2678 (class 1259 OID 20620666)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2679 (class 1259 OID 20620665)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2525 (class 1259 OID 20620249)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 20620248)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 20620173)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 20620480)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2491 (class 1259 OID 20620127)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2492 (class 1259 OID 20620128)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2626 (class 1259 OID 20620500)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2627 (class 1259 OID 20620499)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2628 (class 1259 OID 20620498)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 20620313)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 20620314)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 20620060)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2583 (class 1259 OID 20620405)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2584 (class 1259 OID 20620403)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2585 (class 1259 OID 20620402)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2586 (class 1259 OID 20620404)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2482 (class 1259 OID 20620101)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2483 (class 1259 OID 20620102)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 20620461)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2746 (class 1259 OID 20620939)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2648 (class 1259 OID 20620552)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 20620551)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2747 (class 1259 OID 20620947)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2748 (class 1259 OID 20620948)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2598 (class 1259 OID 20620426)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2642 (class 1259 OID 20620544)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2643 (class 1259 OID 20620545)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 20620753)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2697 (class 1259 OID 20620752)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2698 (class 1259 OID 20620749)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 20620750)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2700 (class 1259 OID 20620751)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 20620214)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 20620213)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2516 (class 1259 OID 20620215)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 20620474)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 20620473)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2706 (class 1259 OID 20620819)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2707 (class 1259 OID 20620820)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2689 (class 1259 OID 20620697)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2690 (class 1259 OID 20620698)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2691 (class 1259 OID 20620695)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2692 (class 1259 OID 20620696)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2639 (class 1259 OID 20620535)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 20620414)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2590 (class 1259 OID 20620413)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2591 (class 1259 OID 20620411)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2592 (class 1259 OID 20620412)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2685 (class 1259 OID 20620685)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 20620684)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 20620289)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2542 (class 1259 OID 20620303)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2543 (class 1259 OID 20620302)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2544 (class 1259 OID 20620301)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2545 (class 1259 OID 20620304)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2554 (class 1259 OID 20620325)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2703 (class 1259 OID 20620810)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2722 (class 1259 OID 20620857)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2740 (class 1259 OID 20620923)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2741 (class 1259 OID 20620924)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2497 (class 1259 OID 20620148)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2498 (class 1259 OID 20620147)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2506 (class 1259 OID 20620180)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2507 (class 1259 OID 20620181)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 20620367)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20620395)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20620394)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2580 (class 1259 OID 20620393)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2565 (class 1259 OID 20620353)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2566 (class 1259 OID 20620354)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2567 (class 1259 OID 20620352)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2568 (class 1259 OID 20620356)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2569 (class 1259 OID 20620355)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2513 (class 1259 OID 20620199)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20620263)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20620265)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2533 (class 1259 OID 20620264)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2534 (class 1259 OID 20620266)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2597 (class 1259 OID 20620420)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 20620630)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 20620663)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20620604)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20620605)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2504 (class 1259 OID 20620171)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2505 (class 1259 OID 20620172)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2636 (class 1259 OID 20620525)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 20620071)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 20620235)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2474 (class 1259 OID 20620059)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2719 (class 1259 OID 20620850)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 20620472)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2620 (class 1259 OID 20620471)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 20620694)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 20620223)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 20620643)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 20620897)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2712 (class 1259 OID 20620827)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 20620828)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 20620593)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2577 (class 1259 OID 20620382)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 20620121)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2781 (class 2606 OID 20621079)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2780 (class 2606 OID 20621084)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2776 (class 2606 OID 20621104)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2782 (class 2606 OID 20621074)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2778 (class 2606 OID 20621094)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2777 (class 2606 OID 20621099)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2779 (class 2606 OID 20621089)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2817 (class 2606 OID 20621269)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2816 (class 2606 OID 20621274)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 20621279)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2849 (class 2606 OID 20621444)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2850 (class 2606 OID 20621439)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 20621004)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2799 (class 2606 OID 20621189)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2844 (class 2606 OID 20621424)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20621419)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 20621429)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 20621414)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2847 (class 2606 OID 20621409)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2797 (class 2606 OID 20621184)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2798 (class 2606 OID 20621179)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2775 (class 2606 OID 20621069)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2809 (class 2606 OID 20621229)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 20621239)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2808 (class 2606 OID 20621234)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2768 (class 2606 OID 20621039)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 20621034)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 20621169)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20621399)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 20621284)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 20621289)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 20621294)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2848 (class 2606 OID 20621434)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2822 (class 2606 OID 20621314)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2825 (class 2606 OID 20621299)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2821 (class 2606 OID 20621319)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2823 (class 2606 OID 20621309)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2824 (class 2606 OID 20621304)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2766 (class 2606 OID 20621029)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 20621024)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 20620989)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2759 (class 2606 OID 20620984)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2803 (class 2606 OID 20621209)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2755 (class 2606 OID 20620964)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2754 (class 2606 OID 20620969)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2804 (class 2606 OID 20621224)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2805 (class 2606 OID 20621219)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2806 (class 2606 OID 20621214)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2773 (class 2606 OID 20621054)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 20621059)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2751 (class 2606 OID 20620949)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2787 (class 2606 OID 20621144)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2789 (class 2606 OID 20621134)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2790 (class 2606 OID 20621129)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2788 (class 2606 OID 20621139)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 20620954)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2752 (class 2606 OID 20620959)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2800 (class 2606 OID 20621194)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2853 (class 2606 OID 20621459)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 20621264)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2814 (class 2606 OID 20621259)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2855 (class 2606 OID 20621464)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2854 (class 2606 OID 20621469)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2796 (class 2606 OID 20621174)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2812 (class 2606 OID 20621249)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2811 (class 2606 OID 20621254)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 20621374)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 20621369)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20621354)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 20621359)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2834 (class 2606 OID 20621364)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2764 (class 2606 OID 20621014)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 20621009)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 20621019)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2801 (class 2606 OID 20621204)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2802 (class 2606 OID 20621199)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20621384)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2838 (class 2606 OID 20621389)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 20621344)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 20621349)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2831 (class 2606 OID 20621334)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2830 (class 2606 OID 20621339)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2810 (class 2606 OID 20621244)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 20621164)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2792 (class 2606 OID 20621159)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2794 (class 2606 OID 20621149)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2793 (class 2606 OID 20621154)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2826 (class 2606 OID 20621329)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 20621324)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 20621044)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2771 (class 2606 OID 20621049)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 20621064)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 20621379)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2840 (class 2606 OID 20621394)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20621404)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 20621449)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2851 (class 2606 OID 20621454)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 20620979)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 20620974)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2761 (class 2606 OID 20620994)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 20620999)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 20621109)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20621124)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20621119)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2786 (class 2606 OID 20621114)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-25 10:17:44 CEST

--
-- PostgreSQL database dump complete
--

