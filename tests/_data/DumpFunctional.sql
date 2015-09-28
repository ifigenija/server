--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-28 10:18:25 CEST

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
-- TOC entry 181 (class 1259 OID 20791875)
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
-- TOC entry 229 (class 1259 OID 20792432)
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
-- TOC entry 228 (class 1259 OID 20792415)
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
-- TOC entry 219 (class 1259 OID 20792292)
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
-- TOC entry 222 (class 1259 OID 20792322)
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
-- TOC entry 243 (class 1259 OID 20792674)
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
-- TOC entry 197 (class 1259 OID 20792082)
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
-- TOC entry 199 (class 1259 OID 20792114)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20792600)
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
-- TOC entry 190 (class 1259 OID 20791996)
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
-- TOC entry 230 (class 1259 OID 20792445)
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
-- TOC entry 215 (class 1259 OID 20792247)
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
-- TOC entry 195 (class 1259 OID 20792061)
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
-- TOC entry 193 (class 1259 OID 20792036)
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
-- TOC entry 191 (class 1259 OID 20792013)
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
-- TOC entry 204 (class 1259 OID 20792161)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20792655)
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
-- TOC entry 242 (class 1259 OID 20792667)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20792689)
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
-- TOC entry 208 (class 1259 OID 20792186)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20791970)
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
-- TOC entry 182 (class 1259 OID 20791884)
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
-- TOC entry 183 (class 1259 OID 20791895)
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
-- TOC entry 178 (class 1259 OID 20791849)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20791868)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20792193)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20792227)
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
-- TOC entry 225 (class 1259 OID 20792363)
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
-- TOC entry 185 (class 1259 OID 20791928)
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
-- TOC entry 187 (class 1259 OID 20791962)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20792545)
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
-- TOC entry 205 (class 1259 OID 20792167)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20791947)
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
-- TOC entry 194 (class 1259 OID 20792051)
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
-- TOC entry 207 (class 1259 OID 20792179)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20792559)
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
-- TOC entry 234 (class 1259 OID 20792569)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20792502)
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
-- TOC entry 235 (class 1259 OID 20792577)
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
-- TOC entry 211 (class 1259 OID 20792208)
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
-- TOC entry 203 (class 1259 OID 20792152)
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
-- TOC entry 202 (class 1259 OID 20792142)
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
-- TOC entry 224 (class 1259 OID 20792352)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20792282)
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
-- TOC entry 192 (class 1259 OID 20792025)
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
-- TOC entry 175 (class 1259 OID 20791820)
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
-- TOC entry 174 (class 1259 OID 20791818)
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
-- TOC entry 212 (class 1259 OID 20792221)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20791858)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20791842)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20792235)
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
-- TOC entry 206 (class 1259 OID 20792173)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20792119)
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
-- TOC entry 173 (class 1259 OID 20791807)
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
-- TOC entry 172 (class 1259 OID 20791799)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20791794)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20792299)
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
-- TOC entry 184 (class 1259 OID 20791920)
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
-- TOC entry 201 (class 1259 OID 20792129)
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
-- TOC entry 223 (class 1259 OID 20792340)
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
-- TOC entry 236 (class 1259 OID 20792588)
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
-- TOC entry 189 (class 1259 OID 20791982)
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
-- TOC entry 176 (class 1259 OID 20791829)
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
-- TOC entry 227 (class 1259 OID 20792390)
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
-- TOC entry 196 (class 1259 OID 20792072)
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
-- TOC entry 210 (class 1259 OID 20792200)
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
-- TOC entry 221 (class 1259 OID 20792313)
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
-- TOC entry 239 (class 1259 OID 20792635)
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
-- TOC entry 238 (class 1259 OID 20792607)
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
-- TOC entry 240 (class 1259 OID 20792647)
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
-- TOC entry 217 (class 1259 OID 20792272)
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
-- TOC entry 198 (class 1259 OID 20792108)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20792380)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20792262)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20791823)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 20791875)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20792432)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5608-f7ce-bca2-2496d321d69b	000d0000-5608-f7ce-07db-c7074ecefa08	\N	00090000-5608-f7ce-dac8-c4f58d8470f3	000b0000-5608-f7ce-7da3-eedd05595e9e	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5608-f7ce-50c2-7f924770b665	000d0000-5608-f7ce-1ebe-e0355d9ed71a	00100000-5608-f7ce-63c6-30e768b59f08	00090000-5608-f7ce-064a-cd38eb595cf3	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5608-f7cf-0118-1377b3e97299	000d0000-5608-f7ce-cdda-14c39209deb4	00100000-5608-f7ce-e7c0-c6bce9d531a6	00090000-5608-f7ce-783a-6026ef3e6c5b	\N	0003	t	\N	2015-09-28	\N	2	t	\N	f	f
000c0000-5608-f7cf-15bc-3a394e1cf519	000d0000-5608-f7ce-8e82-13386f67c371	\N	00090000-5608-f7ce-1d61-58c769f6998e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5608-f7cf-5924-625460df7e29	000d0000-5608-f7ce-de54-39afcfc2985d	\N	00090000-5608-f7ce-e7fb-05cdcea2f03d	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5608-f7cf-9f43-50ca7b1afdeb	000d0000-5608-f7ce-cc06-d651e79ac370	\N	00090000-5608-f7ce-97b4-e03ac5d26ef9	000b0000-5608-f7ce-27e6-f99644e20440	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5608-f7cf-b261-84b18ede3e2f	000d0000-5608-f7ce-5af5-362ed5b7881a	00100000-5608-f7ce-792b-58e8bed15728	00090000-5608-f7ce-ea7f-e2e9c032c597	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5608-f7cf-74b9-dc84034d8a13	000d0000-5608-f7ce-38ab-ddaf44b586bf	\N	00090000-5608-f7ce-3454-942046c21c7d	000b0000-5608-f7ce-eda3-6f7e013b2129	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5608-f7cf-5fd8-9c9f9842ca3c	000d0000-5608-f7ce-5af5-362ed5b7881a	00100000-5608-f7ce-e2ba-f2f66235a6f0	00090000-5608-f7ce-fb82-a4c6e067126e	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5608-f7cf-8bb5-1da6835ae9e3	000d0000-5608-f7ce-5af5-362ed5b7881a	00100000-5608-f7ce-9d96-64bb84dd370e	00090000-5608-f7ce-31d3-1ca24ad52f64	\N	0010	t	\N	2015-09-28	\N	16	f	\N	f	t
000c0000-5608-f7cf-44e1-7f920a1343d9	000d0000-5608-f7ce-5af5-362ed5b7881a	00100000-5608-f7ce-02b1-9c5caf67fc39	00090000-5608-f7ce-1da8-588b41b8cdc3	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5608-f7cf-96ca-23367f3df9d3	000d0000-5608-f7ce-fe31-8b9c500785cd	\N	00090000-5608-f7ce-064a-cd38eb595cf3	000b0000-5608-f7ce-e0d2-499bf7b9df00	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3024 (class 0 OID 20792415)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20792292)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5608-f7ce-ceb1-feaf205fabce	00160000-5608-f7ce-7a95-56100efea48c	00090000-5608-f7ce-16ed-2d60580cce4d	aizv	10	t
003d0000-5608-f7ce-9873-3ad9f3de41a0	00160000-5608-f7ce-7a95-56100efea48c	00090000-5608-f7ce-36f8-54d2fd591396	apri	14	t
003d0000-5608-f7ce-fd3c-d9e60a574f2f	00160000-5608-f7ce-a6ca-85c1f10213e5	00090000-5608-f7ce-fd4d-5d44a70d6490	aizv	11	t
003d0000-5608-f7ce-ab44-a3ea5ac12cba	00160000-5608-f7ce-557d-482dfdd96659	00090000-5608-f7ce-fce3-747a1f29afd5	aizv	12	t
003d0000-5608-f7ce-ac81-2f04408af543	00160000-5608-f7ce-7a95-56100efea48c	00090000-5608-f7ce-8678-1756c2cfa566	apri	18	f
\.


--
-- TOC entry 3018 (class 0 OID 20792322)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5608-f7ce-7a95-56100efea48c	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5608-f7ce-a6ca-85c1f10213e5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5608-f7ce-557d-482dfdd96659	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 20792674)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20792082)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5608-f7ce-7d6c-76a3df593433	\N	\N	00200000-5608-f7ce-975f-6f462cccabe3	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5608-f7ce-1674-f6e7067ab85f	\N	\N	00200000-5608-f7ce-2c2a-c2761a837f82	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5608-f7ce-b1a0-264e54ab6898	\N	\N	00200000-5608-f7ce-09e1-1c9224a4b977	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5608-f7ce-2b8b-7b983db53f23	\N	\N	00200000-5608-f7ce-0ba2-f8ac1a417ad7	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5608-f7ce-5c9b-8301d6ad6f0d	\N	\N	00200000-5608-f7ce-1f24-258e934cfe75	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 20792114)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20792600)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20791996)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5608-f7cc-bbf1-a7f781a17c50	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5608-f7cc-3c0b-2d21876609b8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5608-f7cc-4bb8-ba3a14f20cd8	AL	ALB	008	Albania 	Albanija	\N
00040000-5608-f7cc-191d-2c06c7b4af1d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5608-f7cc-6970-d1cde227e157	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5608-f7cc-fb1c-6b891874eb8c	AD	AND	020	Andorra 	Andora	\N
00040000-5608-f7cc-6ffd-c6e30a1eb0d1	AO	AGO	024	Angola 	Angola	\N
00040000-5608-f7cc-387e-8dba14422fa2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5608-f7cc-51aa-b562e74b00cd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5608-f7cc-0bca-2d7aae5800e1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5608-f7cc-d949-687a41357097	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5608-f7cc-35b3-4c4779e19414	AM	ARM	051	Armenia 	Armenija	\N
00040000-5608-f7cc-e823-d6e2e669ad33	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5608-f7cc-e633-d900242dbcd5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5608-f7cc-86f1-1efcb543f210	AT	AUT	040	Austria 	Avstrija	\N
00040000-5608-f7cc-8f01-0ffc8df84d4d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5608-f7cc-8147-5a9ceb320a64	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5608-f7cc-9d88-566d3542775a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5608-f7cc-a5bd-f2bee39880d9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5608-f7cc-33a0-4fa1bdeafa52	BB	BRB	052	Barbados 	Barbados	\N
00040000-5608-f7cc-4cbc-0340e83fb02d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5608-f7cc-0326-33e1bcc42c9b	BE	BEL	056	Belgium 	Belgija	\N
00040000-5608-f7cc-9a04-877627e51573	BZ	BLZ	084	Belize 	Belize	\N
00040000-5608-f7cc-109f-30d94ffe0efb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5608-f7cc-0174-aa11bd323279	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5608-f7cc-59c5-344504527e15	BT	BTN	064	Bhutan 	Butan	\N
00040000-5608-f7cc-6a4d-13544a6377ff	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5608-f7cc-e3bb-aa752f607c8d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5608-f7cc-4758-eee112500361	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5608-f7cc-5f65-5cb7170219b7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5608-f7cc-6994-8cec1b61ccda	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5608-f7cc-37c0-a4cb9e1e779d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5608-f7cc-a160-1738d1f0c3ce	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5608-f7cc-b173-fe67a784fe62	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5608-f7cc-1e01-45635fd8cb87	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5608-f7cc-ea39-e04920db519d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5608-f7cc-272a-b2b796205b04	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5608-f7cc-d064-b6f114d82d0f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5608-f7cc-e445-df2c33729332	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5608-f7cc-92bd-2858d4444a4d	CA	CAN	124	Canada 	Kanada	\N
00040000-5608-f7cc-a237-abc29c29fe25	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5608-f7cc-67c0-eeba07ab3397	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5608-f7cc-3062-3034e24eecc6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5608-f7cc-96d9-94498d1e8e0f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5608-f7cc-50b0-38b9cbf21fcc	CL	CHL	152	Chile 	Čile	\N
00040000-5608-f7cc-f1a7-15770834fcf7	CN	CHN	156	China 	Kitajska	\N
00040000-5608-f7cc-0f6d-dcdd7ea86af2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5608-f7cc-3ec0-e060d7f68b9a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5608-f7cc-4637-9a740e68edc8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5608-f7cc-99e7-5a46bcfeed96	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5608-f7cc-d03f-d786bf2dec22	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5608-f7cc-521e-890bbffd1ac2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5608-f7cc-9777-db6badd25392	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5608-f7cc-d1aa-168ada45c6ba	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5608-f7cc-1996-6f35fc4cff9a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5608-f7cc-19a3-b808a7117319	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5608-f7cc-d662-3fdf79d3bb8b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5608-f7cc-5ee7-80183b631d63	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5608-f7cc-c69b-3fec87c90ff8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5608-f7cc-b383-1bd3b9c834d2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5608-f7cc-55c1-37c482200599	DK	DNK	208	Denmark 	Danska	\N
00040000-5608-f7cc-022e-91db44270c8a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5608-f7cc-438f-87251b5e4964	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5608-f7cc-c525-d69579699162	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5608-f7cc-ff8c-54ad917f7e97	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5608-f7cc-7a25-1128775a0eff	EG	EGY	818	Egypt 	Egipt	\N
00040000-5608-f7cc-e3a5-5a789574b707	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5608-f7cc-50f6-84c4b3e0c0fd	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5608-f7cc-b0d4-f7aa83334211	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5608-f7cc-ee11-97073006cc9e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5608-f7cc-5ecf-384d7124835a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5608-f7cc-47e5-a693934fa84b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5608-f7cc-c160-079f33ccf1b4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5608-f7cc-ff47-b796e8b2664f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5608-f7cc-c7ae-a3b420d64c14	FI	FIN	246	Finland 	Finska	\N
00040000-5608-f7cc-b102-cbd62bbd4ead	FR	FRA	250	France 	Francija	\N
00040000-5608-f7cc-48fc-2fbf6e8dcec4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5608-f7cc-5b16-650ddcdaa7cc	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5608-f7cc-ecdb-e88f985cdef9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5608-f7cc-54a0-3207e0a155f2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5608-f7cc-f9e7-e6940f24b4fe	GA	GAB	266	Gabon 	Gabon	\N
00040000-5608-f7cc-e55e-746e1a94eb75	GM	GMB	270	Gambia 	Gambija	\N
00040000-5608-f7cc-08ac-7801b98a719f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5608-f7cc-684b-ff4208bc772b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5608-f7cc-4963-4ec8faaf347b	GH	GHA	288	Ghana 	Gana	\N
00040000-5608-f7cc-f8ed-bdf7fcb095ed	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5608-f7cc-85ab-e06f2f71ed14	GR	GRC	300	Greece 	Grčija	\N
00040000-5608-f7cc-53d9-9192671fe68c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5608-f7cc-f591-568e07596235	GD	GRD	308	Grenada 	Grenada	\N
00040000-5608-f7cc-7e69-204e90658ce9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5608-f7cc-e6d3-aefefd5751de	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5608-f7cc-8471-8c2539ec475d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5608-f7cc-c7b1-31086710bbec	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5608-f7cc-1309-452759816fc6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5608-f7cc-fd11-3ac1f76eedb3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5608-f7cc-e78b-2c334a416552	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5608-f7cc-e8d7-1d49e949acf9	HT	HTI	332	Haiti 	Haiti	\N
00040000-5608-f7cc-89d5-27093adebb9a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5608-f7cc-4b7b-34cf0be3be8b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5608-f7cc-d4a4-a7719d1d36a2	HN	HND	340	Honduras 	Honduras	\N
00040000-5608-f7cc-2c63-249c059c814a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5608-f7cc-bd28-51a7a251ac60	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5608-f7cc-cb16-b5626d26c336	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5608-f7cc-39f6-c0e4c2b8f582	IN	IND	356	India 	Indija	\N
00040000-5608-f7cc-28e4-d4009c855423	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5608-f7cc-0e1f-6b0d287d72a9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5608-f7cc-f6c6-b7d7933abc19	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5608-f7cc-862a-f3d436bf7677	IE	IRL	372	Ireland 	Irska	\N
00040000-5608-f7cc-67af-88eadd7ca372	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5608-f7cc-dbc2-0c45b24e63b2	IL	ISR	376	Israel 	Izrael	\N
00040000-5608-f7cc-208e-59cc365278c4	IT	ITA	380	Italy 	Italija	\N
00040000-5608-f7cc-6107-f847ee9b4b7b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5608-f7cc-e4b5-147a4b9f9721	JP	JPN	392	Japan 	Japonska	\N
00040000-5608-f7cc-bb84-f1daab0c7caa	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5608-f7cc-d848-5cd8138af52d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5608-f7cc-d436-dca345f491ef	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5608-f7cc-9803-24d02bd1bb83	KE	KEN	404	Kenya 	Kenija	\N
00040000-5608-f7cc-360a-57bbf050e944	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5608-f7cc-5c17-940625335481	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5608-f7cc-7e25-2c2b5b09984e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5608-f7cc-e7ab-67ae85ab8b44	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5608-f7cc-5057-359f1e73960b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5608-f7cc-e46d-ff9fd156a5ba	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5608-f7cc-0809-ec120637f5a6	LV	LVA	428	Latvia 	Latvija	\N
00040000-5608-f7cc-7366-93ff204f4425	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5608-f7cc-6739-0c9fecc2c1e9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5608-f7cc-2d27-4bcd5f573dde	LR	LBR	430	Liberia 	Liberija	\N
00040000-5608-f7cc-dbc6-c8074442c86f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5608-f7cc-570a-170e09086844	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5608-f7cc-dc8e-607aafbe4482	LT	LTU	440	Lithuania 	Litva	\N
00040000-5608-f7cc-8d5b-7183c2447d3e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5608-f7cc-1ced-38d8cd75debe	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5608-f7cc-5f6c-710eab9022ce	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5608-f7cc-ca87-5b1e00d99f5c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5608-f7cc-1f6d-0d72f429d6bd	MW	MWI	454	Malawi 	Malavi	\N
00040000-5608-f7cc-179f-8eb310e81442	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5608-f7cc-8acb-221a28be00ea	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5608-f7cc-8624-9aa6f64b7529	ML	MLI	466	Mali 	Mali	\N
00040000-5608-f7cc-b4f6-fcdda47ecbc0	MT	MLT	470	Malta 	Malta	\N
00040000-5608-f7cc-2422-83d6dc6a9f95	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5608-f7cc-62c4-9f85c67b5b38	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5608-f7cc-a846-22217aa47743	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5608-f7cc-c507-e61867829e35	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5608-f7cc-0832-8d3f4bb37e04	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5608-f7cc-ffe7-11070531197a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5608-f7cc-e5de-a4a03f0c6b1c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5608-f7cc-f298-55c18f499f0e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5608-f7cc-db78-8cca55faad09	MC	MCO	492	Monaco 	Monako	\N
00040000-5608-f7cc-571f-1e90e2132f35	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5608-f7cc-00d4-42dfc1fc4036	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5608-f7cc-0284-ffe991d97d33	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5608-f7cc-85b8-b0c65fa3e724	MA	MAR	504	Morocco 	Maroko	\N
00040000-5608-f7cc-e23a-d633b188b342	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5608-f7cc-6684-518aeed0b435	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5608-f7cc-7dd4-3053c2b74d7e	NA	NAM	516	Namibia 	Namibija	\N
00040000-5608-f7cc-90c3-aa352d893150	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5608-f7cc-7ea9-4aeb2f31b017	NP	NPL	524	Nepal 	Nepal	\N
00040000-5608-f7cc-20f6-6dbe2c950504	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5608-f7cc-84da-276990c5dce7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5608-f7cc-3654-8996e10360be	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5608-f7cc-844a-df6b5b8207a6	NE	NER	562	Niger 	Niger 	\N
00040000-5608-f7cc-e326-dafa1a37c19b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5608-f7cc-d9c8-6117ec4e43d7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5608-f7cc-4b59-ae261a98c4c9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5608-f7cc-6370-8240eee1f898	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5608-f7cc-aa40-731eca46d72b	NO	NOR	578	Norway 	Norveška	\N
00040000-5608-f7cc-9b01-f0cf9c982bf6	OM	OMN	512	Oman 	Oman	\N
00040000-5608-f7cc-a6af-0cc8f3d5f3a9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5608-f7cc-654f-6b2a1d7cb9a2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5608-f7cc-64a9-13a1cf313b79	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5608-f7cc-6437-ec2a160485ae	PA	PAN	591	Panama 	Panama	\N
00040000-5608-f7cc-f53f-b4e012d9584a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5608-f7cc-16a1-addb7c0ce11e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5608-f7cc-a4df-b7e710bc44b2	PE	PER	604	Peru 	Peru	\N
00040000-5608-f7cc-6b5c-a4be4d3e2f81	PH	PHL	608	Philippines 	Filipini	\N
00040000-5608-f7cc-8fe6-67e02bcca59e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5608-f7cc-5691-1e811648a982	PL	POL	616	Poland 	Poljska	\N
00040000-5608-f7cc-d6cd-be78af59cc09	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5608-f7cc-cbba-d2a2741dd1de	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5608-f7cc-97b3-fa7266f8bff7	QA	QAT	634	Qatar 	Katar	\N
00040000-5608-f7cc-9bd2-bbab31570a3a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5608-f7cc-49a1-c1420dd32cb8	RO	ROU	642	Romania 	Romunija	\N
00040000-5608-f7cc-c31d-e3709c9f439d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5608-f7cc-1eac-3d49556bd765	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5608-f7cc-7c6b-18167b3af196	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5608-f7cc-a810-2b309a3a8e36	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5608-f7cc-f7b0-0281fafe1e16	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5608-f7cc-1f84-4a027dbd9fe8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5608-f7cc-2169-c9af9e90f2af	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5608-f7cc-81a4-6d0349bb0499	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5608-f7cc-4c15-505c4d8a1bb2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5608-f7cc-1a74-bd08e78765f1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5608-f7cc-695d-092e67f39053	SM	SMR	674	San Marino 	San Marino	\N
00040000-5608-f7cc-1824-2b36ae434d51	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5608-f7cc-1529-3c328fe08ab8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5608-f7cc-11c6-8e79b4c18cd1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5608-f7cc-c943-a7164a3af8a9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5608-f7cc-120e-40f1ed6f5553	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5608-f7cc-9460-60e0d5e98f48	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5608-f7cc-5041-48a5cd367c9a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5608-f7cc-0ac8-a21afeff9fd0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5608-f7cc-bfb5-4824edeee6df	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5608-f7cc-51af-df1dcd11f18c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5608-f7cc-cc6a-495c37908ff1	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5608-f7cc-6a84-94d41a80fd29	SO	SOM	706	Somalia 	Somalija	\N
00040000-5608-f7cc-1213-b4208b88960f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5608-f7cc-092c-ef2fd159ec96	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5608-f7cc-9d30-ca1da8a8c966	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5608-f7cc-7a7c-a6847db40d0d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5608-f7cc-3030-ca59021b50fe	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5608-f7cc-2c57-e8e1d2bcfa46	SD	SDN	729	Sudan 	Sudan	\N
00040000-5608-f7cc-1d5e-43f6a5ec982d	SR	SUR	740	Suriname 	Surinam	\N
00040000-5608-f7cc-f8c4-d4b546944912	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5608-f7cc-6cfe-48d83a266766	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5608-f7cc-40a0-750cd1ade22c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5608-f7cc-0fe8-93e3c760b5ab	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5608-f7cc-60dd-57d47fc7258a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5608-f7cc-e3db-23bc157abeea	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5608-f7cc-d487-51787d4a42ed	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5608-f7cc-ca98-3fefc7ca482d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5608-f7cc-7931-59dc64ec1b56	TH	THA	764	Thailand 	Tajska	\N
00040000-5608-f7cc-4bbb-74594cf0ca16	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5608-f7cc-5055-50dcbd027b9c	TG	TGO	768	Togo 	Togo	\N
00040000-5608-f7cc-e8cd-92c4854843fb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5608-f7cc-7d0d-2a8755210032	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5608-f7cc-b666-e883a2257c86	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5608-f7cc-3883-b88dbcfa13a5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5608-f7cc-31fd-66afece60c21	TR	TUR	792	Turkey 	Turčija	\N
00040000-5608-f7cc-9ed5-63bfa2231e5e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5608-f7cc-2ce0-28716fec075c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5608-f7cc-1d01-6e4162e1b76f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5608-f7cc-d188-8b1bb1f3c600	UG	UGA	800	Uganda 	Uganda	\N
00040000-5608-f7cc-4a3b-92188873c65c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5608-f7cc-b02c-aca8c97fb67f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5608-f7cc-4f0d-97489682e3e2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5608-f7cc-b1b5-78f1ab6e6913	US	USA	840	United States 	Združene države Amerike	\N
00040000-5608-f7cc-3ea0-abb6129078ad	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5608-f7cc-ed00-b391d6643395	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5608-f7cc-3a51-91e5bc1ec6c6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5608-f7cc-4ac5-cce64ddba8fe	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5608-f7cc-9d38-33b9fc7dd951	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5608-f7cc-eba0-ceb9cfd2260b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5608-f7cc-2dd1-f99a283b75b6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5608-f7cc-426e-53966be9cd83	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5608-f7cc-321a-8d46773c658e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5608-f7cc-3acd-32b08ae836e6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5608-f7cc-b5d5-d4a28ee1fdcd	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5608-f7cc-eee9-78c5c2f235eb	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5608-f7cc-78e8-415038713552	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3026 (class 0 OID 20792445)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5608-f7ce-02ac-8afe3a93a14d	000e0000-5608-f7ce-9824-9a9e0329a455	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5608-f7cc-fb80-92d0a029a13d	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5608-f7ce-ef2a-48c9cf981f10	000e0000-5608-f7ce-7b96-4d98f7795a26	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5608-f7cc-7559-da3281f85d3f	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5608-f7ce-4dad-447322803d7a	000e0000-5608-f7ce-bf08-dfec4789e021	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5608-f7cc-fb80-92d0a029a13d	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5608-f7ce-083b-9ca91935bd70	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5608-f7ce-ff48-6aada2cbb6b4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 20792247)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5608-f7ce-07db-c7074ecefa08	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7ce-bca2-2496d321d69b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5608-f7cc-1b38-873f8c53ed21
000d0000-5608-f7ce-1ebe-e0355d9ed71a	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7ce-50c2-7f924770b665	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5608-f7cc-15be-aa70d1f8483c
000d0000-5608-f7ce-cdda-14c39209deb4	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7cf-0118-1377b3e97299	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5608-f7cc-0bc3-bdb160c78ffe
000d0000-5608-f7ce-8e82-13386f67c371	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7cf-15bc-3a394e1cf519	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5608-f7cc-d082-591b9cb45a66
000d0000-5608-f7ce-de54-39afcfc2985d	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7cf-5924-625460df7e29	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5608-f7cc-d082-591b9cb45a66
000d0000-5608-f7ce-cc06-d651e79ac370	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7cf-9f43-50ca7b1afdeb	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5608-f7cc-1b38-873f8c53ed21
000d0000-5608-f7ce-5af5-362ed5b7881a	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7cf-5fd8-9c9f9842ca3c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5608-f7cc-1b38-873f8c53ed21
000d0000-5608-f7ce-38ab-ddaf44b586bf	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7cf-74b9-dc84034d8a13	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5608-f7cc-ae2a-6612d2039a99
000d0000-5608-f7ce-fe31-8b9c500785cd	000e0000-5608-f7ce-7b96-4d98f7795a26	000c0000-5608-f7cf-96ca-23367f3df9d3	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5608-f7cc-8c7e-5dc086b2e153
\.


--
-- TOC entry 2991 (class 0 OID 20792061)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 20792036)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20792013)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5608-f7ce-1054-1088bdc9be63	00080000-5608-f7ce-41b4-cb7423b8eafa	00090000-5608-f7ce-31d3-1ca24ad52f64	AK		igralka
\.


--
-- TOC entry 3000 (class 0 OID 20792161)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 20792655)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 20792667)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 20792689)
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
-- TOC entry 3004 (class 0 OID 20792186)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20791970)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5608-f7cd-3f1a-c46c2b0b9aee	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5608-f7cd-3678-88f78de8ee52	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5608-f7cd-511d-d65e317cae27	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5608-f7cd-4fd6-84899b831f86	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5608-f7cd-8694-a2967094ed1e	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5608-f7cd-fd92-fb0cf393b8a2	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5608-f7cd-a541-ffad5016ace1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5608-f7cd-5a18-32a9fbb3ce98	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5608-f7cd-103d-86fd087ab98a	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5608-f7cd-41f7-2f4955f78b42	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5608-f7cd-6ce4-6d722108d386	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5608-f7cd-7b5e-e65c8bd11fb1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5608-f7cd-5fcd-acf9602f14b1	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5608-f7cd-313f-61c0c7c37f41	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5608-f7cd-6baf-38d6e2ff76ef	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5608-f7ce-f933-bd6f73733a45	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5608-f7ce-58c6-ab7e0962acfc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5608-f7ce-dd05-28f4953a1c6b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5608-f7ce-7d83-6d54883e94d8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5608-f7ce-da56-a7346b4468d3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5608-f7d0-c28f-f79d96403ed8	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2978 (class 0 OID 20791884)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5608-f7ce-3e6c-12d7a24cb4a3	00000000-5608-f7ce-f933-bd6f73733a45	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5608-f7ce-c894-85f15aa55a11	00000000-5608-f7ce-f933-bd6f73733a45	00010000-5608-f7cd-ddb1-c9c46c9f6aba	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5608-f7ce-859c-0ff6caacd087	00000000-5608-f7ce-58c6-ab7e0962acfc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2979 (class 0 OID 20791895)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5608-f7ce-dac8-c4f58d8470f3	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5608-f7ce-1d61-58c769f6998e	00010000-5608-f7ce-4f18-ad640611ab80	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5608-f7ce-783a-6026ef3e6c5b	00010000-5608-f7ce-1d4f-706f00c86ef7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5608-f7ce-fb82-a4c6e067126e	00010000-5608-f7ce-d0bc-9c830c2e9428	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5608-f7ce-3005-6e5f5917ebc3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5608-f7ce-97b4-e03ac5d26ef9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5608-f7ce-1da8-588b41b8cdc3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5608-f7ce-ea7f-e2e9c032c597	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5608-f7ce-31d3-1ca24ad52f64	00010000-5608-f7ce-51de-f0c72c86a199	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5608-f7ce-064a-cd38eb595cf3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5608-f7ce-f9ad-5749a4ed6d06	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5608-f7ce-e7fb-05cdcea2f03d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5608-f7ce-3454-942046c21c7d	00010000-5608-f7ce-8084-447bc22d7879	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5608-f7ce-16ed-2d60580cce4d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5608-f7ce-36f8-54d2fd591396	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5608-f7ce-fd4d-5d44a70d6490	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5608-f7ce-fce3-747a1f29afd5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5608-f7ce-8678-1756c2cfa566	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 20791849)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5608-f7cc-a6ba-30cc68343734	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5608-f7cc-227a-67036c7564a8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5608-f7cc-6bdf-01d169838e12	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5608-f7cc-44c3-f24e983dd521	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5608-f7cc-0f38-c6b0454d6397	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5608-f7cc-0427-6bf06fd8f7dd	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5608-f7cc-9560-2c7174d8e29b	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5608-f7cc-42cd-6a545b6e0e23	Abonma-read	Abonma - branje	f
00030000-5608-f7cc-7f3a-b88bab93356f	Abonma-write	Abonma - spreminjanje	f
00030000-5608-f7cc-2de3-cf3ea374c55c	Alternacija-read	Alternacija - branje	f
00030000-5608-f7cc-64e0-9c644f733245	Alternacija-write	Alternacija - spreminjanje	f
00030000-5608-f7cc-09eb-aff935c85fdf	Arhivalija-read	Arhivalija - branje	f
00030000-5608-f7cc-1396-2ec7a8550897	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5608-f7cc-3373-16610a3e9de5	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5608-f7cc-7a0d-c7dd4c12a6bc	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5608-f7cc-7acd-d63f42a73196	Besedilo-read	Besedilo - branje	f
00030000-5608-f7cc-a458-8834460aac25	Besedilo-write	Besedilo - spreminjanje	f
00030000-5608-f7cc-4ca6-2f3d00dbcf68	DogodekIzven-read	DogodekIzven - branje	f
00030000-5608-f7cc-6857-e86de7f416b2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5608-f7cc-2cdc-d5ebe4964ed3	Dogodek-read	Dogodek - branje	f
00030000-5608-f7cc-1136-1fe64e24e3c1	Dogodek-write	Dogodek - spreminjanje	f
00030000-5608-f7cc-732b-1ebb7ea25e25	DrugiVir-read	DrugiVir - branje	f
00030000-5608-f7cc-259c-770625317a26	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5608-f7cc-6cae-82469e969e58	Drzava-read	Drzava - branje	f
00030000-5608-f7cc-b208-83b93013835a	Drzava-write	Drzava - spreminjanje	f
00030000-5608-f7cc-b072-5f61fdfeb666	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5608-f7cc-2b95-e12f0a1fc893	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5608-f7cc-7279-5000fce9a552	Funkcija-read	Funkcija - branje	f
00030000-5608-f7cc-205b-048271cf4c85	Funkcija-write	Funkcija - spreminjanje	f
00030000-5608-f7cc-1fff-61bae8f996bc	Gostovanje-read	Gostovanje - branje	f
00030000-5608-f7cc-3611-60319ac722ad	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5608-f7cc-9468-b7ea5a4d0518	Gostujoca-read	Gostujoca - branje	f
00030000-5608-f7cc-9abc-5a428ca85cfb	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5608-f7cc-ca72-501b4a0d3d47	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5608-f7cc-1ba1-2ab3b138a391	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5608-f7cc-374e-d46db37d872b	Kupec-read	Kupec - branje	f
00030000-5608-f7cc-0bb4-44ae2f0673aa	Kupec-write	Kupec - spreminjanje	f
00030000-5608-f7cc-fe91-abbcfcbee58f	NacinPlacina-read	NacinPlacina - branje	f
00030000-5608-f7cc-2534-4af02bc126e0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5608-f7cc-8c07-1f0ed5c2486f	Option-read	Option - branje	f
00030000-5608-f7cc-e8e0-879bc99ea014	Option-write	Option - spreminjanje	f
00030000-5608-f7cc-4869-00626edef93b	OptionValue-read	OptionValue - branje	f
00030000-5608-f7cc-5051-a612c15fb8d0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5608-f7cc-ea12-91c2466ad5b6	Oseba-read	Oseba - branje	f
00030000-5608-f7cc-202a-c8caa24472fa	Oseba-write	Oseba - spreminjanje	f
00030000-5608-f7cc-baba-d48f8b3163c6	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5608-f7cc-6480-9e4109429691	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5608-f7cc-53ce-f2622fc67dce	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5608-f7cc-3caf-47c691b7f7fc	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5608-f7cc-3f5c-215f958b0f95	Pogodba-read	Pogodba - branje	f
00030000-5608-f7cc-517b-e6a9e08cc2ec	Pogodba-write	Pogodba - spreminjanje	f
00030000-5608-f7cc-7942-b567541434c4	Popa-read	Popa - branje	f
00030000-5608-f7cc-8b60-ade3d7cb50eb	Popa-write	Popa - spreminjanje	f
00030000-5608-f7cc-614b-6bdeecbcbba3	Posta-read	Posta - branje	f
00030000-5608-f7cc-c365-38776f5c005d	Posta-write	Posta - spreminjanje	f
00030000-5608-f7cc-9448-125851a69d1b	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5608-f7cc-0e87-ec1f7c9b6560	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5608-f7cc-32b3-e56cc1e6bfbf	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5608-f7cc-71c7-3188f25129bd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5608-f7cc-cf59-088c3acdd6ff	PostniNaslov-read	PostniNaslov - branje	f
00030000-5608-f7cc-2aff-c66c23484cce	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5608-f7cc-644e-f0274dcba46d	Predstava-read	Predstava - branje	f
00030000-5608-f7cc-d391-272d99a29e59	Predstava-write	Predstava - spreminjanje	f
00030000-5608-f7cc-a3ee-50490c8df18f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5608-f7cc-deaf-5c6261d85d4f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5608-f7cc-c50e-92cfdd55f756	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5608-f7cc-2822-1d55f445eb48	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5608-f7cc-07c5-6b92dbc05211	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5608-f7cc-4226-427aaa1d221f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5608-f7cc-7145-1fe58ae2687d	ProgramDela-read	ProgramDela - branje	f
00030000-5608-f7cc-6841-70f825e22290	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5608-f7cc-2db6-dd7966d4ef69	ProgramFestival-read	ProgramFestival - branje	f
00030000-5608-f7cc-1491-35f1b8515464	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5608-f7cc-c74e-eee442bede9b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5608-f7cc-d503-dfa4af88188c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5608-f7cc-d95e-f1d8be529d18	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5608-f7cc-50ea-592e2035799f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5608-f7cc-13d9-7d4f8f23010d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5608-f7cc-1400-d28d48912dc4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5608-f7cc-de9e-c8a557b4092f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5608-f7cc-0dc1-783fe5b00a6f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5608-f7cc-d427-284432469c16	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5608-f7cc-1aad-514b19c1418f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5608-f7cc-551d-a0e50d41796b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5608-f7cc-0dfe-b1bbc73cd3f7	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5608-f7cc-4fa4-685a09f91fa4	ProgramRazno-read	ProgramRazno - branje	f
00030000-5608-f7cc-a278-c8496318a768	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5608-f7cc-bf8d-0d8cf6ad5f19	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5608-f7cc-a779-5510bf6c718a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5608-f7cc-07aa-e13de85b8c18	Prostor-read	Prostor - branje	f
00030000-5608-f7cc-93cb-eb7bf916298d	Prostor-write	Prostor - spreminjanje	f
00030000-5608-f7cc-a153-ec2c674b14c7	Racun-read	Racun - branje	f
00030000-5608-f7cc-8ae8-d1a67e7e5089	Racun-write	Racun - spreminjanje	f
00030000-5608-f7cc-34ff-1f21e463c2f0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5608-f7cc-e56e-fc91373fa9ba	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5608-f7cc-6520-f62554cfa9fa	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5608-f7cc-224b-cda2b56362eb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5608-f7cc-dc9d-978a94133adc	Rekvizit-read	Rekvizit - branje	f
00030000-5608-f7cc-7892-23c7d01e7968	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5608-f7cc-322e-4bbe68f5a23f	Revizija-read	Revizija - branje	f
00030000-5608-f7cc-a2a7-28bf733a2f64	Revizija-write	Revizija - spreminjanje	f
00030000-5608-f7cc-f38e-59ad5deea06f	Rezervacija-read	Rezervacija - branje	f
00030000-5608-f7cc-a087-62451a586800	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5608-f7cc-24b8-aacb2a171e39	SedezniRed-read	SedezniRed - branje	f
00030000-5608-f7cc-3fa9-8f320d86315b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5608-f7cc-557c-bd5d9680608c	Sedez-read	Sedez - branje	f
00030000-5608-f7cc-0861-b320624bdbcf	Sedez-write	Sedez - spreminjanje	f
00030000-5608-f7cc-35c1-6061b5bdf1fd	Sezona-read	Sezona - branje	f
00030000-5608-f7cc-ac14-9abcf8730878	Sezona-write	Sezona - spreminjanje	f
00030000-5608-f7cc-8181-f2ebdb74c5a5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5608-f7cc-d8e2-8ee8b708f3b0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5608-f7cc-b7c1-404789e56a7f	Stevilcenje-read	Stevilcenje - branje	f
00030000-5608-f7cc-8fb3-0eb3dc911179	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5608-f7cc-4483-98d1ae7d843f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5608-f7cc-04e8-6fbf5eb88fa5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5608-f7cc-3bd2-9d81618c5302	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5608-f7cc-3f7c-0e691867f556	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5608-f7cc-9c95-2678c7abc15b	Telefonska-read	Telefonska - branje	f
00030000-5608-f7cc-e63d-202277b5b6da	Telefonska-write	Telefonska - spreminjanje	f
00030000-5608-f7cc-a8e2-61bea780184e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5608-f7cc-89d2-52ca5d77dc7f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5608-f7cc-bd97-bf5a375c2150	TipFunkcije-read	TipFunkcije - branje	f
00030000-5608-f7cc-2544-6889a626de0b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5608-f7cc-6922-967bee0fac79	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5608-f7cc-ba09-8e72a6f60542	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5608-f7cc-40fb-1d936844e6e5	Trr-read	Trr - branje	f
00030000-5608-f7cc-00d1-99e5e1fef12c	Trr-write	Trr - spreminjanje	f
00030000-5608-f7cc-6b37-ccb17a965af0	Uprizoritev-read	Uprizoritev - branje	f
00030000-5608-f7cc-a864-ffda0047652c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5608-f7cc-9143-2831624a8c17	Vaja-read	Vaja - branje	f
00030000-5608-f7cc-8075-4746b1dc3a01	Vaja-write	Vaja - spreminjanje	f
00030000-5608-f7cc-21e9-35aca1ce824d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5608-f7cc-f610-287b4b39c03a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5608-f7cc-afc4-215eddb83203	VrstaStroska-read	VrstaStroska - branje	f
00030000-5608-f7cc-08ed-2a9d02bca484	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5608-f7cc-9167-1fbabfad307e	Zaposlitev-read	Zaposlitev - branje	f
00030000-5608-f7cc-5a9f-8dadea94910d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5608-f7cc-7425-1c20d1399949	Zasedenost-read	Zasedenost - branje	f
00030000-5608-f7cc-fa2b-2339fbc4f1a4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5608-f7cc-83d3-b5f3c27321dc	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5608-f7cc-f68f-bc64dccd9d62	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5608-f7cc-2efe-0c50f9f47f5b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5608-f7cc-b089-28d8c4a1b829	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5608-f7cc-f86a-35447990d4b0	Job-read	Branje opravil - samo zase - branje	f
00030000-5608-f7cc-eff5-594b06dd2579	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5608-f7cc-160e-ceab24f85b0b	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5608-f7cc-34fa-026c313ee34f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5608-f7cc-aeb7-4bf1f391a52a	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5608-f7cc-64d1-504feab9a600	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5608-f7cc-2255-fed86e5ee672	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5608-f7cc-b245-7770411f952d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5608-f7cc-eb63-be41a69e5db7	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5608-f7cc-a4ac-47240c914028	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5608-f7cc-d306-35353586a5ec	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5608-f7cc-d702-4b2069c15417	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5608-f7cc-e5a3-b06bb386c5c1	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5608-f7cc-6b2b-601e08d7bc2b	Datoteka-write	Datoteka - spreminjanje	f
00030000-5608-f7cc-3fb9-140e1fa1f7f8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2976 (class 0 OID 20791868)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5608-f7cd-5b80-0a227d070d5e	00030000-5608-f7cc-227a-67036c7564a8
00020000-5608-f7cd-339a-6d3672da2ac6	00030000-5608-f7cc-6cae-82469e969e58
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-42cd-6a545b6e0e23
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-7f3a-b88bab93356f
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-2de3-cf3ea374c55c
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-64e0-9c644f733245
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-09eb-aff935c85fdf
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-2cdc-d5ebe4964ed3
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-44c3-f24e983dd521
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-1136-1fe64e24e3c1
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-6cae-82469e969e58
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-b208-83b93013835a
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-7279-5000fce9a552
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-205b-048271cf4c85
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-1fff-61bae8f996bc
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-3611-60319ac722ad
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-9468-b7ea5a4d0518
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-9abc-5a428ca85cfb
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-ca72-501b4a0d3d47
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-1ba1-2ab3b138a391
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-8c07-1f0ed5c2486f
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-4869-00626edef93b
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-ea12-91c2466ad5b6
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-202a-c8caa24472fa
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-7942-b567541434c4
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-8b60-ade3d7cb50eb
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-614b-6bdeecbcbba3
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-c365-38776f5c005d
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-cf59-088c3acdd6ff
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-2aff-c66c23484cce
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-644e-f0274dcba46d
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-d391-272d99a29e59
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-07c5-6b92dbc05211
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-4226-427aaa1d221f
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-07aa-e13de85b8c18
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-93cb-eb7bf916298d
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-6520-f62554cfa9fa
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-224b-cda2b56362eb
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-dc9d-978a94133adc
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-7892-23c7d01e7968
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-35c1-6061b5bdf1fd
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-ac14-9abcf8730878
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-bd97-bf5a375c2150
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-6b37-ccb17a965af0
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-a864-ffda0047652c
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-9143-2831624a8c17
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-8075-4746b1dc3a01
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-7425-1c20d1399949
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-fa2b-2339fbc4f1a4
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-83d3-b5f3c27321dc
00020000-5608-f7cd-963b-842feadfa449	00030000-5608-f7cc-2efe-0c50f9f47f5b
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-42cd-6a545b6e0e23
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-09eb-aff935c85fdf
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-2cdc-d5ebe4964ed3
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-6cae-82469e969e58
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-1fff-61bae8f996bc
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-9468-b7ea5a4d0518
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-ca72-501b4a0d3d47
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-1ba1-2ab3b138a391
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-8c07-1f0ed5c2486f
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-4869-00626edef93b
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-ea12-91c2466ad5b6
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-202a-c8caa24472fa
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-7942-b567541434c4
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-614b-6bdeecbcbba3
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-cf59-088c3acdd6ff
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-2aff-c66c23484cce
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-644e-f0274dcba46d
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-07aa-e13de85b8c18
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-6520-f62554cfa9fa
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-dc9d-978a94133adc
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-35c1-6061b5bdf1fd
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-9c95-2678c7abc15b
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-e63d-202277b5b6da
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-40fb-1d936844e6e5
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-00d1-99e5e1fef12c
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-9167-1fbabfad307e
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-5a9f-8dadea94910d
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-83d3-b5f3c27321dc
00020000-5608-f7cd-afec-2fd94e07b513	00030000-5608-f7cc-2efe-0c50f9f47f5b
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-42cd-6a545b6e0e23
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-2de3-cf3ea374c55c
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-09eb-aff935c85fdf
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-1396-2ec7a8550897
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-7acd-d63f42a73196
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-4ca6-2f3d00dbcf68
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-2cdc-d5ebe4964ed3
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-6cae-82469e969e58
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-7279-5000fce9a552
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-1fff-61bae8f996bc
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-9468-b7ea5a4d0518
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-ca72-501b4a0d3d47
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-8c07-1f0ed5c2486f
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-4869-00626edef93b
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-ea12-91c2466ad5b6
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-7942-b567541434c4
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-614b-6bdeecbcbba3
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-644e-f0274dcba46d
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-07c5-6b92dbc05211
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-07aa-e13de85b8c18
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-6520-f62554cfa9fa
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-dc9d-978a94133adc
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-35c1-6061b5bdf1fd
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-bd97-bf5a375c2150
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-9143-2831624a8c17
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-7425-1c20d1399949
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-83d3-b5f3c27321dc
00020000-5608-f7cd-18b6-ef6a3c87605b	00030000-5608-f7cc-2efe-0c50f9f47f5b
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-42cd-6a545b6e0e23
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-7f3a-b88bab93356f
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-64e0-9c644f733245
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-09eb-aff935c85fdf
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-2cdc-d5ebe4964ed3
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-6cae-82469e969e58
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-1fff-61bae8f996bc
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-9468-b7ea5a4d0518
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-8c07-1f0ed5c2486f
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-4869-00626edef93b
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-7942-b567541434c4
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-614b-6bdeecbcbba3
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-644e-f0274dcba46d
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-07aa-e13de85b8c18
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-6520-f62554cfa9fa
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-dc9d-978a94133adc
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-35c1-6061b5bdf1fd
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-bd97-bf5a375c2150
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-83d3-b5f3c27321dc
00020000-5608-f7cd-05f2-94ea7ec53cdc	00030000-5608-f7cc-2efe-0c50f9f47f5b
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-42cd-6a545b6e0e23
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-09eb-aff935c85fdf
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-2cdc-d5ebe4964ed3
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-6cae-82469e969e58
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-1fff-61bae8f996bc
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-9468-b7ea5a4d0518
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-8c07-1f0ed5c2486f
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-4869-00626edef93b
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-7942-b567541434c4
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-614b-6bdeecbcbba3
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-644e-f0274dcba46d
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-07aa-e13de85b8c18
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-6520-f62554cfa9fa
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-dc9d-978a94133adc
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-35c1-6061b5bdf1fd
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-a8e2-61bea780184e
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-6bdf-01d169838e12
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-bd97-bf5a375c2150
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-83d3-b5f3c27321dc
00020000-5608-f7cd-62d4-927cc6858c3b	00030000-5608-f7cc-2efe-0c50f9f47f5b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a6ba-30cc68343734
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-227a-67036c7564a8
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6bdf-01d169838e12
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-44c3-f24e983dd521
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-0f38-c6b0454d6397
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-0427-6bf06fd8f7dd
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-9560-2c7174d8e29b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-42cd-6a545b6e0e23
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-7f3a-b88bab93356f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2de3-cf3ea374c55c
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-64e0-9c644f733245
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-09eb-aff935c85fdf
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-1396-2ec7a8550897
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-7acd-d63f42a73196
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a458-8834460aac25
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-4ca6-2f3d00dbcf68
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6857-e86de7f416b2
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2cdc-d5ebe4964ed3
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-1136-1fe64e24e3c1
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6cae-82469e969e58
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-b208-83b93013835a
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-732b-1ebb7ea25e25
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-259c-770625317a26
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-b072-5f61fdfeb666
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2b95-e12f0a1fc893
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-7279-5000fce9a552
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-205b-048271cf4c85
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-1fff-61bae8f996bc
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-3611-60319ac722ad
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-9468-b7ea5a4d0518
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-9abc-5a428ca85cfb
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-ca72-501b4a0d3d47
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-1ba1-2ab3b138a391
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-374e-d46db37d872b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-0bb4-44ae2f0673aa
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-fe91-abbcfcbee58f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2534-4af02bc126e0
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-8c07-1f0ed5c2486f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-e8e0-879bc99ea014
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-4869-00626edef93b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-5051-a612c15fb8d0
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-ea12-91c2466ad5b6
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-202a-c8caa24472fa
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-baba-d48f8b3163c6
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6480-9e4109429691
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-53ce-f2622fc67dce
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-3caf-47c691b7f7fc
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-3f5c-215f958b0f95
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-517b-e6a9e08cc2ec
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-7942-b567541434c4
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-8b60-ade3d7cb50eb
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-614b-6bdeecbcbba3
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-c365-38776f5c005d
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-9448-125851a69d1b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-0e87-ec1f7c9b6560
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-32b3-e56cc1e6bfbf
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-71c7-3188f25129bd
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-cf59-088c3acdd6ff
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2aff-c66c23484cce
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-644e-f0274dcba46d
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-d391-272d99a29e59
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a3ee-50490c8df18f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-deaf-5c6261d85d4f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-c50e-92cfdd55f756
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2822-1d55f445eb48
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-07c5-6b92dbc05211
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-4226-427aaa1d221f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-7145-1fe58ae2687d
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6841-70f825e22290
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2db6-dd7966d4ef69
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-1491-35f1b8515464
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-c74e-eee442bede9b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-d503-dfa4af88188c
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-d95e-f1d8be529d18
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-50ea-592e2035799f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-13d9-7d4f8f23010d
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-1400-d28d48912dc4
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-de9e-c8a557b4092f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-0dc1-783fe5b00a6f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-d427-284432469c16
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-1aad-514b19c1418f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-551d-a0e50d41796b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-0dfe-b1bbc73cd3f7
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-4fa4-685a09f91fa4
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a278-c8496318a768
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-bf8d-0d8cf6ad5f19
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a779-5510bf6c718a
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-07aa-e13de85b8c18
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-93cb-eb7bf916298d
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a153-ec2c674b14c7
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-8ae8-d1a67e7e5089
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-34ff-1f21e463c2f0
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-e56e-fc91373fa9ba
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6520-f62554cfa9fa
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-224b-cda2b56362eb
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-dc9d-978a94133adc
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-7892-23c7d01e7968
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-322e-4bbe68f5a23f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a2a7-28bf733a2f64
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-f38e-59ad5deea06f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a087-62451a586800
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-24b8-aacb2a171e39
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-3fa9-8f320d86315b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-557c-bd5d9680608c
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-0861-b320624bdbcf
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-35c1-6061b5bdf1fd
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-ac14-9abcf8730878
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-8181-f2ebdb74c5a5
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-d8e2-8ee8b708f3b0
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-b7c1-404789e56a7f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-8fb3-0eb3dc911179
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-4483-98d1ae7d843f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-04e8-6fbf5eb88fa5
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-3bd2-9d81618c5302
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-3f7c-0e691867f556
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-9c95-2678c7abc15b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-e63d-202277b5b6da
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a8e2-61bea780184e
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-89d2-52ca5d77dc7f
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-bd97-bf5a375c2150
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2544-6889a626de0b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6922-967bee0fac79
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-ba09-8e72a6f60542
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-40fb-1d936844e6e5
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-00d1-99e5e1fef12c
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-6b37-ccb17a965af0
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-a864-ffda0047652c
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-9143-2831624a8c17
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-8075-4746b1dc3a01
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-21e9-35aca1ce824d
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-f610-287b4b39c03a
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-afc4-215eddb83203
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-08ed-2a9d02bca484
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-9167-1fbabfad307e
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-5a9f-8dadea94910d
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-7425-1c20d1399949
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-fa2b-2339fbc4f1a4
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-83d3-b5f3c27321dc
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-f68f-bc64dccd9d62
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-2efe-0c50f9f47f5b
00020000-5608-f7ce-d409-608451ffd1f5	00030000-5608-f7cc-b089-28d8c4a1b829
\.


--
-- TOC entry 3005 (class 0 OID 20792193)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20792227)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 20792363)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5608-f7ce-7da3-eedd05595e9e	00090000-5608-f7ce-dac8-c4f58d8470f3	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5608-f7ce-27e6-f99644e20440	00090000-5608-f7ce-97b4-e03ac5d26ef9	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5608-f7ce-eda3-6f7e013b2129	00090000-5608-f7ce-3454-942046c21c7d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5608-f7ce-e0d2-499bf7b9df00	00090000-5608-f7ce-064a-cd38eb595cf3	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2981 (class 0 OID 20791928)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5608-f7ce-41b4-cb7423b8eafa	00040000-5608-f7cc-51af-df1dcd11f18c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7ce-0a98-8cdcb27ee38c	00040000-5608-f7cc-51af-df1dcd11f18c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5608-f7ce-3278-72dd424d656a	00040000-5608-f7cc-51af-df1dcd11f18c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7ce-6617-8623f70ad1bd	00040000-5608-f7cc-51af-df1dcd11f18c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7ce-a0e6-dd677ac530cc	00040000-5608-f7cc-51af-df1dcd11f18c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7ce-88b1-e84bbcea0f96	00040000-5608-f7cc-d949-687a41357097	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7ce-e632-b472f435b0d1	00040000-5608-f7cc-19a3-b808a7117319	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7ce-4fb7-af1161f08807	00040000-5608-f7cc-86f1-1efcb543f210	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7ce-d336-99130091c728	00040000-5608-f7cc-684b-ff4208bc772b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-f7d0-3cd3-2b66f2c3a1fc	00040000-5608-f7cc-51af-df1dcd11f18c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2983 (class 0 OID 20791962)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5608-f7cc-f5e9-d933e7a95913	8341	Adlešiči
00050000-5608-f7cc-dd10-b204c9096deb	5270	Ajdovščina
00050000-5608-f7cc-df14-dcec99360e0d	6280	Ankaran/Ancarano
00050000-5608-f7cc-b360-0bb2eb05ec2e	9253	Apače
00050000-5608-f7cc-b565-c35e1270b224	8253	Artiče
00050000-5608-f7cc-ae9e-8bac1c5451e6	4275	Begunje na Gorenjskem
00050000-5608-f7cc-290f-69a4f8b58e16	1382	Begunje pri Cerknici
00050000-5608-f7cc-3cf6-6f098165be2a	9231	Beltinci
00050000-5608-f7cc-acff-77928d0fd4c2	2234	Benedikt
00050000-5608-f7cc-5210-a6bf147cc223	2345	Bistrica ob Dravi
00050000-5608-f7cc-3d08-16e492477a85	3256	Bistrica ob Sotli
00050000-5608-f7cc-f7b7-2f939657dd35	8259	Bizeljsko
00050000-5608-f7cc-254f-0df924053030	1223	Blagovica
00050000-5608-f7cc-8cfc-e7c6c380f790	8283	Blanca
00050000-5608-f7cc-2803-229e33eb28a0	4260	Bled
00050000-5608-f7cc-6b05-39bc39ad50eb	4273	Blejska Dobrava
00050000-5608-f7cc-5a2b-527f7de9fa26	9265	Bodonci
00050000-5608-f7cc-2d9e-a06b13616443	9222	Bogojina
00050000-5608-f7cc-9263-f7588f7217c1	4263	Bohinjska Bela
00050000-5608-f7cc-6509-f97551bc74cd	4264	Bohinjska Bistrica
00050000-5608-f7cc-5c83-22d3fed99a64	4265	Bohinjsko jezero
00050000-5608-f7cc-6529-d549fc2300fa	1353	Borovnica
00050000-5608-f7cc-b055-48ea4d70d05d	8294	Boštanj
00050000-5608-f7cc-afce-3588e038bdc5	5230	Bovec
00050000-5608-f7cc-3553-f8ff149ad7b1	5295	Branik
00050000-5608-f7cc-cc12-ad88e0cf53aa	3314	Braslovče
00050000-5608-f7cc-db61-f2913fb811aa	5223	Breginj
00050000-5608-f7cc-b1b4-3fb6cff8fd19	8280	Brestanica
00050000-5608-f7cc-b630-489b0a9a1e03	2354	Bresternica
00050000-5608-f7cc-6215-69cc91f29651	4243	Brezje
00050000-5608-f7cc-876b-5d65a428718e	1351	Brezovica pri Ljubljani
00050000-5608-f7cc-3e02-437621037b87	8250	Brežice
00050000-5608-f7cc-6dca-5184099d79ed	4210	Brnik - Aerodrom
00050000-5608-f7cc-c7c6-42070da2e411	8321	Brusnice
00050000-5608-f7cc-d50f-78846b22377c	3255	Buče
00050000-5608-f7cc-561b-ef990bb17b2f	8276	Bučka 
00050000-5608-f7cc-ae64-61b99862b932	9261	Cankova
00050000-5608-f7cc-57b2-045440349863	3000	Celje 
00050000-5608-f7cc-590b-fedc85532b18	3001	Celje - poštni predali
00050000-5608-f7cc-6de6-85ca611a4c24	4207	Cerklje na Gorenjskem
00050000-5608-f7cc-cd53-b30b5ca36576	8263	Cerklje ob Krki
00050000-5608-f7cc-26a0-60964d3fc046	1380	Cerknica
00050000-5608-f7cc-d201-fb755f9eaaac	5282	Cerkno
00050000-5608-f7cc-221e-85cd89604fa5	2236	Cerkvenjak
00050000-5608-f7cc-152e-2c6495e26f21	2215	Ceršak
00050000-5608-f7cc-8b3c-29799753dfd4	2326	Cirkovce
00050000-5608-f7cc-12a7-1709d846a2eb	2282	Cirkulane
00050000-5608-f7cc-34e1-7db9ed8c5973	5273	Col
00050000-5608-f7cc-0e4f-d6d5a873ede5	8251	Čatež ob Savi
00050000-5608-f7cc-12a4-3a106664b573	1413	Čemšenik
00050000-5608-f7cc-8774-ebb184743bf9	5253	Čepovan
00050000-5608-f7cc-a31a-16aba0b360a9	9232	Črenšovci
00050000-5608-f7cc-763f-6c74eecf3b2b	2393	Črna na Koroškem
00050000-5608-f7cc-39ae-6a9156262a7b	6275	Črni Kal
00050000-5608-f7cc-72e8-7d9ddae6e044	5274	Črni Vrh nad Idrijo
00050000-5608-f7cc-6729-4c3d2ba9e0fb	5262	Črniče
00050000-5608-f7cc-6ce0-90f156c96f61	8340	Črnomelj
00050000-5608-f7cc-3ab5-e126adcd0328	6271	Dekani
00050000-5608-f7cc-6222-bd738d4ce670	5210	Deskle
00050000-5608-f7cc-3703-b2b57e487c0b	2253	Destrnik
00050000-5608-f7cc-a64a-2907c6d376d4	6215	Divača
00050000-5608-f7cc-3ed9-afb46e573976	1233	Dob
00050000-5608-f7cc-586f-51d0a3d2bea3	3224	Dobje pri Planini
00050000-5608-f7cc-6bd7-f57192316aba	8257	Dobova
00050000-5608-f7cc-0649-4e84dd2ee265	1423	Dobovec
00050000-5608-f7cc-0e0b-3989403bfb36	5263	Dobravlje
00050000-5608-f7cc-a9da-11dc4d8dbe60	3204	Dobrna
00050000-5608-f7cc-e646-58c45894c255	8211	Dobrnič
00050000-5608-f7cc-1ac4-04ad1e8a68a9	1356	Dobrova
00050000-5608-f7cc-8b76-a661c772e24a	9223	Dobrovnik/Dobronak 
00050000-5608-f7cc-e44d-77702b7412a4	5212	Dobrovo v Brdih
00050000-5608-f7cc-fcfa-7c224df3ead7	1431	Dol pri Hrastniku
00050000-5608-f7cc-3b53-cef78ba48db6	1262	Dol pri Ljubljani
00050000-5608-f7cc-e158-3b6f08f81caa	1273	Dole pri Litiji
00050000-5608-f7cc-30b3-b0579bdce0e3	1331	Dolenja vas
00050000-5608-f7cc-dda8-1619a3216f05	8350	Dolenjske Toplice
00050000-5608-f7cc-81e7-47960da42fd4	1230	Domžale
00050000-5608-f7cc-a3b2-0e736f07cb38	2252	Dornava
00050000-5608-f7cc-f0cd-65b89aa3c761	5294	Dornberk
00050000-5608-f7cc-ae6f-35ddd350ce49	1319	Draga
00050000-5608-f7cc-2c45-432174f193e4	8343	Dragatuš
00050000-5608-f7cc-9cf0-c095f951fc93	3222	Dramlje
00050000-5608-f7cc-1cc5-ece1d86c204c	2370	Dravograd
00050000-5608-f7cc-b42d-3c1574c31fd5	4203	Duplje
00050000-5608-f7cc-b52e-ca241d04f8f5	6221	Dutovlje
00050000-5608-f7cc-a512-068f3f9113cc	8361	Dvor
00050000-5608-f7cc-2f8d-8d9ce7a46e49	2343	Fala
00050000-5608-f7cc-733c-c57405c0955e	9208	Fokovci
00050000-5608-f7cc-4ba4-aa9f8bde52fd	2313	Fram
00050000-5608-f7cc-9f43-a80a6f2bb46e	3213	Frankolovo
00050000-5608-f7cc-604c-1c1ba0357f65	1274	Gabrovka
00050000-5608-f7cc-86a7-12bde45a595b	8254	Globoko
00050000-5608-f7cc-78dc-244dfc788743	5275	Godovič
00050000-5608-f7cc-8e67-b493fa671248	4204	Golnik
00050000-5608-f7cc-9c7e-551031dfb033	3303	Gomilsko
00050000-5608-f7cc-3c4a-72038d162194	4224	Gorenja vas
00050000-5608-f7cc-d426-beb4713840cd	3263	Gorica pri Slivnici
00050000-5608-f7cc-c15e-7127fcc84e77	2272	Gorišnica
00050000-5608-f7cc-0934-0b39caf26dc7	9250	Gornja Radgona
00050000-5608-f7cc-bff8-0f3c6f805ad2	3342	Gornji Grad
00050000-5608-f7cc-7813-bc9d12ee80bc	4282	Gozd Martuljek
00050000-5608-f7cc-d4ef-9fbbcc9a6735	6272	Gračišče
00050000-5608-f7cc-12f7-4eeae69eb45c	9264	Grad
00050000-5608-f7cc-971c-b37697196e60	8332	Gradac
00050000-5608-f7cc-2c6e-df68c594ea3e	1384	Grahovo
00050000-5608-f7cc-704a-a1c3c2df00f1	5242	Grahovo ob Bači
00050000-5608-f7cc-7a78-8dae2c550e8a	5251	Grgar
00050000-5608-f7cc-5773-55c28d164971	3302	Griže
00050000-5608-f7cc-28a1-9c3202eecf3c	3231	Grobelno
00050000-5608-f7cc-e485-d097af833e2c	1290	Grosuplje
00050000-5608-f7cc-1661-0439c35f3bfc	2288	Hajdina
00050000-5608-f7cc-932b-1103ce899d73	8362	Hinje
00050000-5608-f7cc-5467-15ac41c03c9d	2311	Hoče
00050000-5608-f7cc-681a-29e19b9d8b2e	9205	Hodoš/Hodos
00050000-5608-f7cc-6cf8-0c41468630c5	1354	Horjul
00050000-5608-f7cc-1c80-6f6c9360a54c	1372	Hotedršica
00050000-5608-f7cc-7878-e13d00eaa70e	1430	Hrastnik
00050000-5608-f7cc-5198-993e1e3e66ef	6225	Hruševje
00050000-5608-f7cc-64ae-7c6b7856b911	4276	Hrušica
00050000-5608-f7cc-d7fe-bab6cac820e5	5280	Idrija
00050000-5608-f7cc-7037-159bdc726fff	1292	Ig
00050000-5608-f7cc-818a-ad07e41068a4	6250	Ilirska Bistrica
00050000-5608-f7cc-c64a-3a3044d0dfd0	6251	Ilirska Bistrica-Trnovo
00050000-5608-f7cc-1f5a-a98cdec47c80	1295	Ivančna Gorica
00050000-5608-f7cc-2481-8c13dcc0b789	2259	Ivanjkovci
00050000-5608-f7cc-dd9e-fc72805a3d18	1411	Izlake
00050000-5608-f7cc-5663-b0c8255bf36a	6310	Izola/Isola
00050000-5608-f7cc-c384-acd77a9bb2c2	2222	Jakobski Dol
00050000-5608-f7cc-832b-a12dbefbe4fc	2221	Jarenina
00050000-5608-f7cc-9f50-97c419766366	6254	Jelšane
00050000-5608-f7cc-6204-2adb3c7a333c	4270	Jesenice
00050000-5608-f7cc-cef8-99b830992c53	8261	Jesenice na Dolenjskem
00050000-5608-f7cc-88aa-c36e1fa58ac3	3273	Jurklošter
00050000-5608-f7cc-0012-ddcc540252a1	2223	Jurovski Dol
00050000-5608-f7cc-4504-93746715c183	2256	Juršinci
00050000-5608-f7cc-82d0-be099b4a0757	5214	Kal nad Kanalom
00050000-5608-f7cc-735e-cae6404765cb	3233	Kalobje
00050000-5608-f7cc-a26c-3efc7499f654	4246	Kamna Gorica
00050000-5608-f7cc-c7fe-246b517ea33e	2351	Kamnica
00050000-5608-f7cc-f45e-d496778e3c22	1241	Kamnik
00050000-5608-f7cc-1045-c17f94273283	5213	Kanal
00050000-5608-f7cc-483c-4fdc4bc2652b	8258	Kapele
00050000-5608-f7cc-b6af-0819c2bc4fb0	2362	Kapla
00050000-5608-f7cc-4fd8-45f6628718bf	2325	Kidričevo
00050000-5608-f7cc-78cc-2ec0e27c8477	1412	Kisovec
00050000-5608-f7cc-1f7b-4b11bf706179	6253	Knežak
00050000-5608-f7cc-2a7b-f564b3120b50	5222	Kobarid
00050000-5608-f7cc-1da1-6de687b62e1f	9227	Kobilje
00050000-5608-f7cc-8709-bdef243a9a25	1330	Kočevje
00050000-5608-f7cc-e370-1196a743b7f3	1338	Kočevska Reka
00050000-5608-f7cc-ccf7-8b641d56048a	2276	Kog
00050000-5608-f7cc-a812-46e398ef9d82	5211	Kojsko
00050000-5608-f7cc-8d7a-6c93f15ddfc2	6223	Komen
00050000-5608-f7cc-d7fb-770700991bcd	1218	Komenda
00050000-5608-f7cc-8f90-b61e38f5829e	6000	Koper/Capodistria 
00050000-5608-f7cc-fb8b-7ea8394f47ed	6001	Koper/Capodistria - poštni predali
00050000-5608-f7cc-893a-9664400bfaba	8282	Koprivnica
00050000-5608-f7cc-4177-c9b9c39bebc0	5296	Kostanjevica na Krasu
00050000-5608-f7cc-0dd2-73b5ccfa1230	8311	Kostanjevica na Krki
00050000-5608-f7cc-96ac-9d4de275cffb	1336	Kostel
00050000-5608-f7cc-c03c-3c91e2326415	6256	Košana
00050000-5608-f7cc-76c3-2893f7509268	2394	Kotlje
00050000-5608-f7cc-5d01-280d0c68c617	6240	Kozina
00050000-5608-f7cc-16c6-5669ea9a1c1c	3260	Kozje
00050000-5608-f7cc-0498-1a9537f80d6e	4000	Kranj 
00050000-5608-f7cc-56c7-770a79f0eb3e	4001	Kranj - poštni predali
00050000-5608-f7cc-562d-53d36f332d43	4280	Kranjska Gora
00050000-5608-f7cc-6e37-58f6db1c220c	1281	Kresnice
00050000-5608-f7cc-e239-6a5b4c292f69	4294	Križe
00050000-5608-f7cc-99df-33ff83e64c50	9206	Križevci
00050000-5608-f7cc-ba68-1741fe650488	9242	Križevci pri Ljutomeru
00050000-5608-f7cc-a51d-864aa4e28190	1301	Krka
00050000-5608-f7cc-3d9b-39e34a57dc4a	8296	Krmelj
00050000-5608-f7cc-602b-580481549d18	4245	Kropa
00050000-5608-f7cc-6e9c-aa440f2adeba	8262	Krška vas
00050000-5608-f7cc-a2ef-24be61c86aa6	8270	Krško
00050000-5608-f7cc-f902-0cccbf96a852	9263	Kuzma
00050000-5608-f7cc-6e9e-16cf61a9c404	2318	Laporje
00050000-5608-f7cc-17ff-8878c6274db9	3270	Laško
00050000-5608-f7cc-546c-93fa679acd5d	1219	Laze v Tuhinju
00050000-5608-f7cc-6a1f-816c46c6f0f5	2230	Lenart v Slovenskih goricah
00050000-5608-f7cc-03ca-0399882c7972	9220	Lendava/Lendva
00050000-5608-f7cc-6311-9280f825a1b4	4248	Lesce
00050000-5608-f7cc-edb6-40c542b47955	3261	Lesično
00050000-5608-f7cc-02c0-d195fe28c4dc	8273	Leskovec pri Krškem
00050000-5608-f7cc-5a93-2c6a524f1190	2372	Libeliče
00050000-5608-f7cc-99b4-4d2fea54fe80	2341	Limbuš
00050000-5608-f7cc-7fea-26e1f0b97755	1270	Litija
00050000-5608-f7cc-51b9-8db72e868468	3202	Ljubečna
00050000-5608-f7cc-f522-c906ad231d52	1000	Ljubljana 
00050000-5608-f7cc-b35a-47f34276ef08	1001	Ljubljana - poštni predali
00050000-5608-f7cc-dd06-5d67797c1267	1231	Ljubljana - Črnuče
00050000-5608-f7cc-5fd2-6200efd2a6e0	1261	Ljubljana - Dobrunje
00050000-5608-f7cc-3e79-7b835e8f1d25	1260	Ljubljana - Polje
00050000-5608-f7cc-6f6a-4b86e50e6527	1210	Ljubljana - Šentvid
00050000-5608-f7cc-ac42-fd45a426b62d	1211	Ljubljana - Šmartno
00050000-5608-f7cc-9af3-e0b070163801	3333	Ljubno ob Savinji
00050000-5608-f7cc-caa4-bc45057ed366	9240	Ljutomer
00050000-5608-f7cc-ff3e-73ab3e301df7	3215	Loče
00050000-5608-f7cc-b59d-726e536ed821	5231	Log pod Mangartom
00050000-5608-f7cc-54b4-e4e7dcd438e5	1358	Log pri Brezovici
00050000-5608-f7cc-b0a0-dfeacfbc04af	1370	Logatec
00050000-5608-f7cc-0806-d9e12dfe078e	1371	Logatec
00050000-5608-f7cc-78f3-4e89951e0924	1434	Loka pri Zidanem Mostu
00050000-5608-f7cc-0d2b-85cfbbea49b4	3223	Loka pri Žusmu
00050000-5608-f7cc-e169-30bb38b69d49	6219	Lokev
00050000-5608-f7cc-e219-63cd96802783	1318	Loški Potok
00050000-5608-f7cc-e1e3-4576b7683a3a	2324	Lovrenc na Dravskem polju
00050000-5608-f7cc-2f6d-6995d346c4b3	2344	Lovrenc na Pohorju
00050000-5608-f7cc-d0d2-7ebcb41d042d	3334	Luče
00050000-5608-f7cc-4fef-28091a77e9bf	1225	Lukovica
00050000-5608-f7cc-cfad-6490d297e82d	9202	Mačkovci
00050000-5608-f7cc-fbbc-cdaf2b31725a	2322	Majšperk
00050000-5608-f7cc-fdf3-b55372833b83	2321	Makole
00050000-5608-f7cc-c35c-e3fa1145a275	9243	Mala Nedelja
00050000-5608-f7cc-cf2f-cc15c0064921	2229	Malečnik
00050000-5608-f7cc-23a0-98e2610b709b	6273	Marezige
00050000-5608-f7cc-87f9-203a5aa454a3	2000	Maribor 
00050000-5608-f7cc-3ce8-5b9255a79680	2001	Maribor - poštni predali
00050000-5608-f7cc-8531-3643e6593702	2206	Marjeta na Dravskem polju
00050000-5608-f7cc-122e-506eca8e81cc	2281	Markovci
00050000-5608-f7cc-7b80-9119ace73080	9221	Martjanci
00050000-5608-f7cc-11ad-d77290d88e73	6242	Materija
00050000-5608-f7cc-d5cf-0d759b565881	4211	Mavčiče
00050000-5608-f7cc-2f9c-9837b71b2ed5	1215	Medvode
00050000-5608-f7cc-2604-6d061cfa8885	1234	Mengeš
00050000-5608-f7cc-287c-6b8b4168ccb5	8330	Metlika
00050000-5608-f7cc-c3da-6dfa3f1dc391	2392	Mežica
00050000-5608-f7cc-e19b-123bbfe2c045	2204	Miklavž na Dravskem polju
00050000-5608-f7cc-ed6d-b35a48714a61	2275	Miklavž pri Ormožu
00050000-5608-f7cc-3d84-f50b0641fa1e	5291	Miren
00050000-5608-f7cc-12a3-af8fe045db3b	8233	Mirna
00050000-5608-f7cc-5b32-bba00d98c928	8216	Mirna Peč
00050000-5608-f7cc-10a0-a7efd9ab7674	2382	Mislinja
00050000-5608-f7cc-51ef-5afe10fe1110	4281	Mojstrana
00050000-5608-f7cc-4540-5eb40051e0c4	8230	Mokronog
00050000-5608-f7cc-1030-cdc0d1f276a6	1251	Moravče
00050000-5608-f7cc-fcfb-30fbca57adf1	9226	Moravske Toplice
00050000-5608-f7cc-c1a0-a437971d81d4	5216	Most na Soči
00050000-5608-f7cc-9a55-c1f35b858de2	1221	Motnik
00050000-5608-f7cc-1c62-ceb9dc162f62	3330	Mozirje
00050000-5608-f7cc-ee7a-a8489f2f0364	9000	Murska Sobota 
00050000-5608-f7cc-252a-5c7b84182fd4	9001	Murska Sobota - poštni predali
00050000-5608-f7cc-14fc-6274347f5fed	2366	Muta
00050000-5608-f7cc-db29-941cfc8f8c5d	4202	Naklo
00050000-5608-f7cc-a5ea-f2db48474c34	3331	Nazarje
00050000-5608-f7cc-21fb-0cc37ea03e8b	1357	Notranje Gorice
00050000-5608-f7cc-b4a4-5fa932206b86	3203	Nova Cerkev
00050000-5608-f7cc-d631-56ffa3135f2f	5000	Nova Gorica 
00050000-5608-f7cc-b90f-6db06273ce01	5001	Nova Gorica - poštni predali
00050000-5608-f7cc-d560-95c7a95a9607	1385	Nova vas
00050000-5608-f7cc-2fc0-4468f0fa5d5c	8000	Novo mesto
00050000-5608-f7cc-9188-ff7a5344d368	8001	Novo mesto - poštni predali
00050000-5608-f7cc-532e-b2c1c593f27f	6243	Obrov
00050000-5608-f7cc-9662-115afb66c8da	9233	Odranci
00050000-5608-f7cc-3d80-e0d1dfeeae51	2317	Oplotnica
00050000-5608-f7cc-6edf-574f906fed25	2312	Orehova vas
00050000-5608-f7cc-9363-8c7d23b2eee0	2270	Ormož
00050000-5608-f7cc-319d-dea35df94931	1316	Ortnek
00050000-5608-f7cc-2cb7-0a69480f558e	1337	Osilnica
00050000-5608-f7cc-2462-c64350a535d0	8222	Otočec
00050000-5608-f7cc-50f9-3a994f7a3cb4	2361	Ožbalt
00050000-5608-f7cc-8ae8-7da62c084518	2231	Pernica
00050000-5608-f7cc-ecbb-49be9785d65a	2211	Pesnica pri Mariboru
00050000-5608-f7cc-fa84-2dc3a6cfa711	9203	Petrovci
00050000-5608-f7cc-75df-94541db5cbe7	3301	Petrovče
00050000-5608-f7cc-30f7-dc5903f8dc44	6330	Piran/Pirano
00050000-5608-f7cc-47d9-742f0374c4aa	8255	Pišece
00050000-5608-f7cc-16ed-a63496fa1af4	6257	Pivka
00050000-5608-f7cc-7238-d8ddded01a7c	6232	Planina
00050000-5608-f7cc-935c-557dc488a23a	3225	Planina pri Sevnici
00050000-5608-f7cc-2a6a-344ea3fa4966	6276	Pobegi
00050000-5608-f7cc-ab96-6dda9c5810c9	8312	Podbočje
00050000-5608-f7cc-f2cb-8b518db4a909	5243	Podbrdo
00050000-5608-f7cc-44be-6a25f37ebeff	3254	Podčetrtek
00050000-5608-f7cc-210d-90b44c3f38d0	2273	Podgorci
00050000-5608-f7cc-09c3-e10430cf62f8	6216	Podgorje
00050000-5608-f7cc-8975-a9e8fdab5ff0	2381	Podgorje pri Slovenj Gradcu
00050000-5608-f7cc-7af5-3f9ede64540a	6244	Podgrad
00050000-5608-f7cc-6c47-149e1b286b8a	1414	Podkum
00050000-5608-f7cc-4af9-8187b2ae6813	2286	Podlehnik
00050000-5608-f7cc-1c02-99bbefec1117	5272	Podnanos
00050000-5608-f7cc-c6f7-76993a316ea4	4244	Podnart
00050000-5608-f7cc-e20f-8e0d7a9827dc	3241	Podplat
00050000-5608-f7cc-d2fd-e9b82d745c31	3257	Podsreda
00050000-5608-f7cc-45ad-67569d6a1ff8	2363	Podvelka
00050000-5608-f7cc-ba28-58e1f2ffef37	2208	Pohorje
00050000-5608-f7cc-d6c2-796ee403beb3	2257	Polenšak
00050000-5608-f7cc-b002-b42f1518b9d5	1355	Polhov Gradec
00050000-5608-f7cc-ff9f-bc008519302a	4223	Poljane nad Škofjo Loko
00050000-5608-f7cc-4a67-4ee4a4f46d3c	2319	Poljčane
00050000-5608-f7cc-4c01-9f65b60d9275	1272	Polšnik
00050000-5608-f7cc-ad56-55b254a4b8b9	3313	Polzela
00050000-5608-f7cc-e8cf-6c60bbf05b4b	3232	Ponikva
00050000-5608-f7cc-d6b7-36f9a4681fb8	6320	Portorož/Portorose
00050000-5608-f7cc-9749-d2be7745d02a	6230	Postojna
00050000-5608-f7cc-ddaa-958e3e97d0da	2331	Pragersko
00050000-5608-f7cc-d630-5af42ce6f2c5	3312	Prebold
00050000-5608-f7cc-7454-e509a4a929d1	4205	Preddvor
00050000-5608-f7cc-e5f7-8aedacd8e0bd	6255	Prem
00050000-5608-f7cc-e93d-1eec13e99d46	1352	Preserje
00050000-5608-f7cc-499c-cec9ea9a8952	6258	Prestranek
00050000-5608-f7cc-82df-8b1c36684d8c	2391	Prevalje
00050000-5608-f7cc-7e2a-04afef6e333e	3262	Prevorje
00050000-5608-f7cc-38fe-bacf853c5fea	1276	Primskovo 
00050000-5608-f7cc-af5f-13db33533f85	3253	Pristava pri Mestinju
00050000-5608-f7cc-6b7c-17ba3efaaa41	9207	Prosenjakovci/Partosfalva
00050000-5608-f7cc-97b7-ba5bfa6c1305	5297	Prvačina
00050000-5608-f7cc-addb-f2a0b7fe8de7	2250	Ptuj
00050000-5608-f7cc-39f7-8bccdf811e01	2323	Ptujska Gora
00050000-5608-f7cc-d96a-624e81e329c2	9201	Puconci
00050000-5608-f7cc-ea32-f783a231b26d	2327	Rače
00050000-5608-f7cc-d96d-2f77c23290d8	1433	Radeče
00050000-5608-f7cc-e160-6b1024b1bc30	9252	Radenci
00050000-5608-f7cc-21eb-1927e3b27613	2360	Radlje ob Dravi
00050000-5608-f7cc-159a-d2d64a370c20	1235	Radomlje
00050000-5608-f7cc-9741-ef0bc692e19d	4240	Radovljica
00050000-5608-f7cc-07fe-eeeac46eaf27	8274	Raka
00050000-5608-f7cc-d9f2-70efd7317e72	1381	Rakek
00050000-5608-f7cc-d5e1-15ecff5d8497	4283	Rateče - Planica
00050000-5608-f7cc-be37-bafb82a2d627	2390	Ravne na Koroškem
00050000-5608-f7cc-98d6-cf1d8ffb6029	9246	Razkrižje
00050000-5608-f7cc-af5a-67cf578e5259	3332	Rečica ob Savinji
00050000-5608-f7cc-dfed-a14786eccae6	5292	Renče
00050000-5608-f7cc-957f-453d2c278d17	1310	Ribnica
00050000-5608-f7cc-55b6-c704f7b27241	2364	Ribnica na Pohorju
00050000-5608-f7cc-61fe-600fdf830f14	3272	Rimske Toplice
00050000-5608-f7cc-7254-cf6a30d90faa	1314	Rob
00050000-5608-f7cc-c3dd-683ef162d439	5215	Ročinj
00050000-5608-f7cc-d364-7c94391636a2	3250	Rogaška Slatina
00050000-5608-f7cc-58f4-6aae2e9c2ffb	9262	Rogašovci
00050000-5608-f7cc-837b-20d42de52808	3252	Rogatec
00050000-5608-f7cc-6c86-5cdef42e0bfb	1373	Rovte
00050000-5608-f7cc-228a-11a9ab81c5cb	2342	Ruše
00050000-5608-f7cc-fbc5-9a33872aaed7	1282	Sava
00050000-5608-f7cc-1147-2b676192d48e	6333	Sečovlje/Sicciole
00050000-5608-f7cc-127d-84af0df0abcc	4227	Selca
00050000-5608-f7cc-3037-3ea568f9ce45	2352	Selnica ob Dravi
00050000-5608-f7cc-4971-10eb139ce168	8333	Semič
00050000-5608-f7cc-6303-8df699837f40	8281	Senovo
00050000-5608-f7cc-1163-618994890f81	6224	Senožeče
00050000-5608-f7cc-f936-8aceeb6cb3fd	8290	Sevnica
00050000-5608-f7cc-33a4-cd0419fd41f2	6210	Sežana
00050000-5608-f7cc-ce41-3f5d74a94d16	2214	Sladki Vrh
00050000-5608-f7cc-38ba-c0388f753036	5283	Slap ob Idrijci
00050000-5608-f7cc-1167-8497797e7e94	2380	Slovenj Gradec
00050000-5608-f7cc-bf2f-983ced133d80	2310	Slovenska Bistrica
00050000-5608-f7cc-3949-32435b29edeb	3210	Slovenske Konjice
00050000-5608-f7cc-ec45-bc3117071ad8	1216	Smlednik
00050000-5608-f7cc-8154-f9d5a39bd8d7	5232	Soča
00050000-5608-f7cc-017c-cfe1c3da7652	1317	Sodražica
00050000-5608-f7cc-6750-324c52a3d810	3335	Solčava
00050000-5608-f7cc-67b6-e7a66cc99fb0	5250	Solkan
00050000-5608-f7cc-1de8-ec25dae39cc7	4229	Sorica
00050000-5608-f7cc-d2a6-4818bb4e2f24	4225	Sovodenj
00050000-5608-f7cc-cf40-358b59b26deb	5281	Spodnja Idrija
00050000-5608-f7cc-1d60-82dd6f6f0b13	2241	Spodnji Duplek
00050000-5608-f7cc-6e20-286276b307be	9245	Spodnji Ivanjci
00050000-5608-f7cc-2c46-32172b83cff8	2277	Središče ob Dravi
00050000-5608-f7cc-e0e7-376d4298de85	4267	Srednja vas v Bohinju
00050000-5608-f7cc-3044-8c3cfddabe31	8256	Sromlje 
00050000-5608-f7cc-edc1-5c13bf823d7a	5224	Srpenica
00050000-5608-f7cc-119c-560a77e1b44d	1242	Stahovica
00050000-5608-f7cc-406a-8307bf601b42	1332	Stara Cerkev
00050000-5608-f7cc-6355-e8657af716b2	8342	Stari trg ob Kolpi
00050000-5608-f7cc-7b81-2516a193bb24	1386	Stari trg pri Ložu
00050000-5608-f7cc-697d-67580c0d4424	2205	Starše
00050000-5608-f7cc-9d10-7d1e36f566df	2289	Stoperce
00050000-5608-f7cc-3de7-b2bdc3a9cb5c	8322	Stopiče
00050000-5608-f7cc-1d14-69d6bfc8fde5	3206	Stranice
00050000-5608-f7cc-a240-b9f6f5fd52dd	8351	Straža
00050000-5608-f7cc-cadb-9d799c51ff37	1313	Struge
00050000-5608-f7cc-6324-1882fbceb93b	8293	Studenec
00050000-5608-f7cc-ad13-933aeb5574ce	8331	Suhor
00050000-5608-f7cc-0e69-8f90204e5c6b	2233	Sv. Ana v Slovenskih goricah
00050000-5608-f7cc-edbd-380ceb63737d	2235	Sv. Trojica v Slovenskih goricah
00050000-5608-f7cc-1b41-058ea7001591	2353	Sveti Duh na Ostrem Vrhu
00050000-5608-f7cc-b4e3-3ad7ca1ec755	9244	Sveti Jurij ob Ščavnici
00050000-5608-f7cc-468c-0128cbf27f4e	3264	Sveti Štefan
00050000-5608-f7cc-e284-5a079375eaff	2258	Sveti Tomaž
00050000-5608-f7cc-d599-e621e691c4dc	9204	Šalovci
00050000-5608-f7cc-87fd-21fce079338b	5261	Šempas
00050000-5608-f7cc-8951-1cd7a7441737	5290	Šempeter pri Gorici
00050000-5608-f7cc-baf8-93b2220aaa2a	3311	Šempeter v Savinjski dolini
00050000-5608-f7cc-fc10-d571302bb6b6	4208	Šenčur
00050000-5608-f7cc-d9ac-1f892fa2cdc0	2212	Šentilj v Slovenskih goricah
00050000-5608-f7cc-ae5f-e6bc5e9ee483	8297	Šentjanž
00050000-5608-f7cc-80b5-47acc946425f	2373	Šentjanž pri Dravogradu
00050000-5608-f7cc-669c-2c2147d86a0d	8310	Šentjernej
00050000-5608-f7cc-a9a3-23cb56e51bc4	3230	Šentjur
00050000-5608-f7cc-452b-0f2f280f2b3a	3271	Šentrupert
00050000-5608-f7cc-3981-3bf0637d5fd8	8232	Šentrupert
00050000-5608-f7cc-136b-cf30e7bbd941	1296	Šentvid pri Stični
00050000-5608-f7cc-e484-2e16bd199078	8275	Škocjan
00050000-5608-f7cc-83e1-bce14d5b5f43	6281	Škofije
00050000-5608-f7cc-f970-16b0fd163171	4220	Škofja Loka
00050000-5608-f7cc-0c3a-c2e53bea3f65	3211	Škofja vas
00050000-5608-f7cc-a55b-c4759dff8bdd	1291	Škofljica
00050000-5608-f7cc-5530-baae22fffc65	6274	Šmarje
00050000-5608-f7cc-6e8e-66e2a98cebda	1293	Šmarje - Sap
00050000-5608-f7cc-96fb-9000cabab180	3240	Šmarje pri Jelšah
00050000-5608-f7cc-8983-f77c6c0b2ffa	8220	Šmarješke Toplice
00050000-5608-f7cc-2b94-76b5ecd2667a	2315	Šmartno na Pohorju
00050000-5608-f7cc-d66a-19fb35c7fd5a	3341	Šmartno ob Dreti
00050000-5608-f7cc-d4a8-91e6827a13a6	3327	Šmartno ob Paki
00050000-5608-f7cc-1a08-e53afd7194b9	1275	Šmartno pri Litiji
00050000-5608-f7cc-b5f4-ff6495a2b9dc	2383	Šmartno pri Slovenj Gradcu
00050000-5608-f7cc-db9f-b8facead96ab	3201	Šmartno v Rožni dolini
00050000-5608-f7cc-c69a-96611afee14b	3325	Šoštanj
00050000-5608-f7cc-449c-5f9f53954500	6222	Štanjel
00050000-5608-f7cc-9104-2380a97f60ef	3220	Štore
00050000-5608-f7cc-3ffb-aa97a1cbb94a	3304	Tabor
00050000-5608-f7cc-eb5e-4765213cdd87	3221	Teharje
00050000-5608-f7cc-0c96-bab4d5ac9d0c	9251	Tišina
00050000-5608-f7cc-1ca2-b0ced00829bd	5220	Tolmin
00050000-5608-f7cc-7b1d-6eab47aaa999	3326	Topolšica
00050000-5608-f7cc-ae7b-9efbf169537d	2371	Trbonje
00050000-5608-f7cc-c69c-eca9de887acc	1420	Trbovlje
00050000-5608-f7cc-b48b-53bee2682b8a	8231	Trebelno 
00050000-5608-f7cc-4195-e4fb8719d29b	8210	Trebnje
00050000-5608-f7cc-c305-25f99f95bcfe	5252	Trnovo pri Gorici
00050000-5608-f7cc-b930-041bdd37cedf	2254	Trnovska vas
00050000-5608-f7cc-7f08-f54d1a5f1195	1222	Trojane
00050000-5608-f7cc-e71f-b90f692e7b5b	1236	Trzin
00050000-5608-f7cc-cbd8-cc335d2d0233	4290	Tržič
00050000-5608-f7cc-7450-a991868e6728	8295	Tržišče
00050000-5608-f7cc-ee02-e4af6f7741fe	1311	Turjak
00050000-5608-f7cc-c098-cba87495389f	9224	Turnišče
00050000-5608-f7cc-85b8-ec16f2384fe0	8323	Uršna sela
00050000-5608-f7cc-ca9f-19736b6536a6	1252	Vače
00050000-5608-f7cc-1ad2-181e48632321	3320	Velenje 
00050000-5608-f7cc-49b9-0c7bcb03208c	3322	Velenje - poštni predali
00050000-5608-f7cc-8552-8d44dfbb7c44	8212	Velika Loka
00050000-5608-f7cc-2fcb-5f7f8a31fb4c	2274	Velika Nedelja
00050000-5608-f7cc-b97b-62427dd57d83	9225	Velika Polana
00050000-5608-f7cc-1bf7-1f6a3dad25e9	1315	Velike Lašče
00050000-5608-f7cc-5648-fbf5dae11134	8213	Veliki Gaber
00050000-5608-f7cc-3b55-a660769dc8f7	9241	Veržej
00050000-5608-f7cc-7c3c-b15985fda514	1312	Videm - Dobrepolje
00050000-5608-f7cc-1745-db0bf3bc2805	2284	Videm pri Ptuju
00050000-5608-f7cc-3445-86fa8f2eff0a	8344	Vinica
00050000-5608-f7cc-eb03-54098a9b0927	5271	Vipava
00050000-5608-f7cc-fbe3-8c53a7ac1b90	4212	Visoko
00050000-5608-f7cc-19e2-94507166a49e	1294	Višnja Gora
00050000-5608-f7cc-27c9-a125fa026b47	3205	Vitanje
00050000-5608-f7cc-26fd-12f283d310a5	2255	Vitomarci
00050000-5608-f7cc-54b8-091334469a45	1217	Vodice
00050000-5608-f7cc-1c8a-b5c4b973ca9e	3212	Vojnik\t
00050000-5608-f7cc-536b-3691c03bdcb6	5293	Volčja Draga
00050000-5608-f7cc-3913-c437b49451be	2232	Voličina
00050000-5608-f7cc-9db6-4eded60e261e	3305	Vransko
00050000-5608-f7cc-d4f6-5121c2048d74	6217	Vremski Britof
00050000-5608-f7cc-fe65-d0972622e36e	1360	Vrhnika
00050000-5608-f7cc-2f41-e007b8a445a9	2365	Vuhred
00050000-5608-f7cc-78b1-773d3db5fea3	2367	Vuzenica
00050000-5608-f7cc-e207-2b671cc8d067	8292	Zabukovje 
00050000-5608-f7cc-08a4-c94247f43f99	1410	Zagorje ob Savi
00050000-5608-f7cc-a6d2-ad23d33416e4	1303	Zagradec
00050000-5608-f7cc-817f-ad440fd4abb6	2283	Zavrč
00050000-5608-f7cc-0568-bf66e1dcf715	8272	Zdole 
00050000-5608-f7cc-cc4e-cd89b76d3087	4201	Zgornja Besnica
00050000-5608-f7cc-4cf4-4d1b59ed45e9	2242	Zgornja Korena
00050000-5608-f7cc-8836-f085232594e1	2201	Zgornja Kungota
00050000-5608-f7cc-9c4d-91cebec0f6ae	2316	Zgornja Ložnica
00050000-5608-f7cc-3a9e-57395ce36a48	2314	Zgornja Polskava
00050000-5608-f7cc-95aa-4309ed06c9ce	2213	Zgornja Velka
00050000-5608-f7cc-ebb0-fd3af0ac6816	4247	Zgornje Gorje
00050000-5608-f7cc-ea51-105654abe628	4206	Zgornje Jezersko
00050000-5608-f7cc-eca5-e6c822717500	2285	Zgornji Leskovec
00050000-5608-f7cc-53a8-34ace4751585	1432	Zidani Most
00050000-5608-f7cc-5494-77880d8ed059	3214	Zreče
00050000-5608-f7cc-51e1-cc45529b1d1f	4209	Žabnica
00050000-5608-f7cc-c28f-a571888562b8	3310	Žalec
00050000-5608-f7cc-d68f-2aa45e39677b	4228	Železniki
00050000-5608-f7cc-7cb5-10cdaac535ec	2287	Žetale
00050000-5608-f7cc-5db1-481ae41dfc7e	4226	Žiri
00050000-5608-f7cc-a0b2-d20acdb11c02	4274	Žirovnica
00050000-5608-f7cc-970d-f81df8c5173f	8360	Žužemberk
\.


--
-- TOC entry 3028 (class 0 OID 20792545)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20792167)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20791947)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5608-f7ce-156f-bd356f13e09b	00080000-5608-f7ce-41b4-cb7423b8eafa	\N	00040000-5608-f7cc-51af-df1dcd11f18c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5608-f7ce-748a-e765786e9f2b	00080000-5608-f7ce-41b4-cb7423b8eafa	\N	00040000-5608-f7cc-51af-df1dcd11f18c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5608-f7ce-c9c9-912915ee4934	00080000-5608-f7ce-0a98-8cdcb27ee38c	\N	00040000-5608-f7cc-51af-df1dcd11f18c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2990 (class 0 OID 20792051)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20792179)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20792559)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20792569)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5608-f7ce-08f7-c643e253e2d3	00080000-5608-f7ce-3278-72dd424d656a	0987	AK
00190000-5608-f7ce-b343-42bade4f5a10	00080000-5608-f7ce-0a98-8cdcb27ee38c	0989	AK
00190000-5608-f7ce-a8e0-cd9bf25d8634	00080000-5608-f7ce-6617-8623f70ad1bd	0986	AK
00190000-5608-f7ce-4c6c-771c217c3f95	00080000-5608-f7ce-88b1-e84bbcea0f96	0984	AK
00190000-5608-f7ce-f5a1-60719848595d	00080000-5608-f7ce-e632-b472f435b0d1	0983	AK
00190000-5608-f7ce-bb72-b2d0916fd819	00080000-5608-f7ce-4fb7-af1161f08807	0982	AK
00190000-5608-f7d0-3208-96282c7374c8	00080000-5608-f7d0-3cd3-2b66f2c3a1fc	1001	AK
\.


--
-- TOC entry 3027 (class 0 OID 20792502)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5608-f7ce-30f9-4f79eb402136	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 20792577)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 20792208)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5608-f7ce-d6dc-ed2c50c5b719	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5608-f7ce-661d-d57cac58b18f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5608-f7ce-5d91-16f26b68a360	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5608-f7ce-dccc-95e2aa614bde	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5608-f7ce-283b-4c47dc335d5a	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5608-f7ce-319a-e1e98cdad29b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5608-f7ce-719d-294e1bcee8ff	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2999 (class 0 OID 20792152)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20792142)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 20792352)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20792282)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 20792025)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 20791820)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5608-f7d0-3cd3-2b66f2c3a1fc	00010000-5608-f7cd-967d-c49beefe071c	2015-09-28 10:18:24	INS	a:0:{}
2	App\\Entity\\Option	00000000-5608-f7d0-c28f-f79d96403ed8	00010000-5608-f7cd-967d-c49beefe071c	2015-09-28 10:18:24	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5608-f7d0-3208-96282c7374c8	00010000-5608-f7cd-967d-c49beefe071c	2015-09-28 10:18:24	INS	a:0:{}
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 20792221)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 20791858)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5608-f7cd-5b80-0a227d070d5e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5608-f7cd-339a-6d3672da2ac6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5608-f7cd-9a40-c52d43cc895e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5608-f7cd-8da6-57d461d74cf2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5608-f7cd-963b-842feadfa449	planer	Planer dogodkov v koledarju	t
00020000-5608-f7cd-afec-2fd94e07b513	kadrovska	Kadrovska služba	t
00020000-5608-f7cd-18b6-ef6a3c87605b	arhivar	Ažuriranje arhivalij	t
00020000-5608-f7cd-05f2-94ea7ec53cdc	igralec	Igralec	t
00020000-5608-f7cd-62d4-927cc6858c3b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5608-f7ce-d409-608451ffd1f5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2973 (class 0 OID 20791842)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5608-f7cd-ddb1-c9c46c9f6aba	00020000-5608-f7cd-9a40-c52d43cc895e
00010000-5608-f7cd-967d-c49beefe071c	00020000-5608-f7cd-9a40-c52d43cc895e
00010000-5608-f7ce-2a77-7c077c5182f7	00020000-5608-f7ce-d409-608451ffd1f5
\.


--
-- TOC entry 3010 (class 0 OID 20792235)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 20792173)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20792119)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20791807)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5608-f7cc-c9ff-dbc08f13ee0d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5608-f7cc-0435-f8b627bb097f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5608-f7cc-14d0-bc0d62c3e7a1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5608-f7cc-66c9-8214089cdc08	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5608-f7cc-bf25-24a8753c3643	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2968 (class 0 OID 20791799)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5608-f7cc-5d3e-fed96aea4981	00230000-5608-f7cc-66c9-8214089cdc08	popa
00240000-5608-f7cc-0904-e6899db94a50	00230000-5608-f7cc-66c9-8214089cdc08	oseba
00240000-5608-f7cc-2fab-a5828bf39402	00230000-5608-f7cc-66c9-8214089cdc08	sezona
00240000-5608-f7cc-1d5c-9d464196d987	00230000-5608-f7cc-0435-f8b627bb097f	prostor
00240000-5608-f7cc-8344-be6305002bb4	00230000-5608-f7cc-66c9-8214089cdc08	besedilo
00240000-5608-f7cc-548f-8bb681bd24c4	00230000-5608-f7cc-66c9-8214089cdc08	uprizoritev
00240000-5608-f7cc-da8f-30e8b70c2b1b	00230000-5608-f7cc-66c9-8214089cdc08	funkcija
00240000-5608-f7cc-533b-1a33d2fbe915	00230000-5608-f7cc-66c9-8214089cdc08	tipfunkcije
00240000-5608-f7cc-3f81-a58c34e74925	00230000-5608-f7cc-66c9-8214089cdc08	alternacija
00240000-5608-f7cc-9113-2020b8131499	00230000-5608-f7cc-c9ff-dbc08f13ee0d	pogodba
00240000-5608-f7cc-e113-3da782f093f1	00230000-5608-f7cc-66c9-8214089cdc08	zaposlitev
00240000-5608-f7cc-30b7-d5822c603bc3	00230000-5608-f7cc-66c9-8214089cdc08	zvrstuprizoritve
00240000-5608-f7cc-9ba4-fd628c3072d2	00230000-5608-f7cc-c9ff-dbc08f13ee0d	programdela
00240000-5608-f7cc-d4d7-7d748ad71483	00230000-5608-f7cc-66c9-8214089cdc08	zapis
\.


--
-- TOC entry 2967 (class 0 OID 20791794)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d9222015-9a86-4d1f-9055-4355ab7fbcf5	00240000-5608-f7cc-5d3e-fed96aea4981	0	1001
\.


--
-- TOC entry 3016 (class 0 OID 20792299)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5608-f7ce-e9ee-cf79126b2bf9	000e0000-5608-f7ce-7b96-4d98f7795a26	00080000-5608-f7ce-41b4-cb7423b8eafa	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5608-f7cc-0b02-6acce597e6fc
00270000-5608-f7ce-8cc8-e94ba4372bfd	000e0000-5608-f7ce-7b96-4d98f7795a26	00080000-5608-f7ce-41b4-cb7423b8eafa	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5608-f7cc-0b02-6acce597e6fc
\.


--
-- TOC entry 2980 (class 0 OID 20791920)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20792129)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5608-f7cf-b0f0-1c0c52c9728e	00180000-5608-f7ce-7d6c-76a3df593433	000c0000-5608-f7ce-bca2-2496d321d69b	00090000-5608-f7ce-31d3-1ca24ad52f64	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-f7cf-d7b0-3e5f72ae479c	00180000-5608-f7ce-7d6c-76a3df593433	000c0000-5608-f7ce-50c2-7f924770b665	00090000-5608-f7ce-064a-cd38eb595cf3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-f7cf-41e4-6559feb111aa	00180000-5608-f7ce-7d6c-76a3df593433	000c0000-5608-f7cf-0118-1377b3e97299	00090000-5608-f7ce-783a-6026ef3e6c5b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-f7cf-f056-4918303209fb	00180000-5608-f7ce-7d6c-76a3df593433	000c0000-5608-f7cf-15bc-3a394e1cf519	00090000-5608-f7ce-1d61-58c769f6998e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-f7cf-5123-055c95b29748	00180000-5608-f7ce-7d6c-76a3df593433	000c0000-5608-f7cf-5924-625460df7e29	00090000-5608-f7ce-e7fb-05cdcea2f03d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-f7cf-0d27-3ea5759df109	00180000-5608-f7ce-b1a0-264e54ab6898	\N	00090000-5608-f7ce-e7fb-05cdcea2f03d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3019 (class 0 OID 20792340)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5608-f7cc-8c7e-5dc086b2e153	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5608-f7cc-2867-69ca5eac96ea	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5608-f7cc-ef39-7087977731c2	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5608-f7cc-15be-aa70d1f8483c	04	Režija	Režija	Režija	umetnik	30
000f0000-5608-f7cc-9a0a-e6d519d01d12	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5608-f7cc-596c-19f7f1bd3397	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5608-f7cc-19bc-5a8272188dd8	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5608-f7cc-aab8-017fdedacdd9	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5608-f7cc-26b7-a9257d6eae31	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5608-f7cc-bbb6-e5c0b204c9e3	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5608-f7cc-ae2a-6612d2039a99	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5608-f7cc-bb75-2266bd562353	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5608-f7cc-0d8d-543698398bb1	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5608-f7cc-8da0-3255334dbab3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5608-f7cc-1b38-873f8c53ed21	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5608-f7cc-8f01-b66043c1981a	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5608-f7cc-d082-591b9cb45a66	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5608-f7cc-0bc3-bdb160c78ffe	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3032 (class 0 OID 20792588)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5608-f7cc-cf0a-8b17d328fa0e	01	Velika predstava	f	1.00	1.00
002b0000-5608-f7cc-1b87-922231baeefd	02	Mala predstava	f	0.50	0.50
002b0000-5608-f7cc-e8ce-bb2fead5067d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5608-f7cc-fb80-92d0a029a13d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5608-f7cc-7559-da3281f85d3f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2985 (class 0 OID 20791982)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 20791829)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5608-f7cd-967d-c49beefe071c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROAVxPPw56H2c8qawyYykYCzziG2XikCy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-1d4f-706f00c86ef7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-4f18-ad640611ab80	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-51de-f0c72c86a199	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-8084-447bc22d7879	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-d0bc-9c830c2e9428	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-06a5-19c4c5fb6ebb	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-8612-d1961c5c62a1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-5ac1-c9cc67b00641	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-da47-a38f2f76d6d8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5608-f7ce-2a77-7c077c5182f7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5608-f7cd-ddb1-c9c46c9f6aba	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 20792390)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5608-f7ce-9824-9a9e0329a455	00160000-5608-f7ce-7a95-56100efea48c	\N	00140000-5608-f7cc-299d-8ad3a169b43c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5608-f7ce-283b-4c47dc335d5a
000e0000-5608-f7ce-7b96-4d98f7795a26	00160000-5608-f7ce-557d-482dfdd96659	\N	00140000-5608-f7cc-8459-ed3b916fc4b9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5608-f7ce-319a-e1e98cdad29b
000e0000-5608-f7ce-bf08-dfec4789e021	\N	\N	00140000-5608-f7cc-8459-ed3b916fc4b9	00190000-5608-f7ce-08f7-c643e253e2d3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5608-f7ce-283b-4c47dc335d5a
000e0000-5608-f7ce-783b-a17fad105b51	\N	\N	00140000-5608-f7cc-8459-ed3b916fc4b9	00190000-5608-f7ce-08f7-c643e253e2d3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5608-f7ce-283b-4c47dc335d5a
000e0000-5608-f7ce-e190-be08abf92c98	\N	\N	00140000-5608-f7cc-8459-ed3b916fc4b9	00190000-5608-f7ce-08f7-c643e253e2d3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5608-f7ce-d6dc-ed2c50c5b719
000e0000-5608-f7ce-217e-d4e50a1ffa96	\N	\N	00140000-5608-f7cc-8459-ed3b916fc4b9	00190000-5608-f7ce-08f7-c643e253e2d3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5608-f7ce-d6dc-ed2c50c5b719
\.


--
-- TOC entry 2992 (class 0 OID 20792072)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5608-f7ce-975f-6f462cccabe3	000e0000-5608-f7ce-7b96-4d98f7795a26	\N	1	
00200000-5608-f7ce-2c2a-c2761a837f82	000e0000-5608-f7ce-7b96-4d98f7795a26	\N	2	
00200000-5608-f7ce-09e1-1c9224a4b977	000e0000-5608-f7ce-7b96-4d98f7795a26	\N	3	
00200000-5608-f7ce-0ba2-f8ac1a417ad7	000e0000-5608-f7ce-7b96-4d98f7795a26	\N	4	
00200000-5608-f7ce-1f24-258e934cfe75	000e0000-5608-f7ce-7b96-4d98f7795a26	\N	5	
\.


--
-- TOC entry 3006 (class 0 OID 20792200)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20792313)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5608-f7cc-7bf0-ab6b0db9e3ff	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5608-f7cc-d5d4-17460768e0d9	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5608-f7cc-670b-e994e11db6b0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5608-f7cc-89a6-2b4326b55168	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5608-f7cc-df7c-79e437d8f7b5	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5608-f7cc-6d1b-8abb2081eb96	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5608-f7cc-216f-af9b1a9acadc	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5608-f7cc-08d6-a94166f28199	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5608-f7cc-0b02-6acce597e6fc	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5608-f7cc-8d89-0a2a9a5158b9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5608-f7cc-c7e8-368f087b029e	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5608-f7cc-1582-b85c60839b15	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5608-f7cc-3218-10853d82e6cb	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5608-f7cc-154c-8e8a90c5457b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5608-f7cc-1f44-ada5f654160e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5608-f7cc-f46d-a636744294ac	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5608-f7cc-e011-534ef37a5e51	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5608-f7cc-c9c1-eb38205f4e6a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5608-f7cc-786e-e448944b24e0	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5608-f7cc-c274-04c37cb7764a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5608-f7cc-8d53-02de8776223f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5608-f7cc-870f-8a65019494d5	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5608-f7cc-9b33-c2c3b7de98a6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5608-f7cc-ac5a-f7bf46d71b3f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5608-f7cc-d967-70c5da7b6c4d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5608-f7cc-2300-8914b2d9842b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5608-f7cc-7208-2c2926806d76	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5608-f7cc-dfb5-ce33aa40e34c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3035 (class 0 OID 20792635)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20792607)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20792647)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20792272)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5608-f7ce-63c6-30e768b59f08	00090000-5608-f7ce-064a-cd38eb595cf3	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-f7ce-e7c0-c6bce9d531a6	00090000-5608-f7ce-783a-6026ef3e6c5b	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-f7ce-792b-58e8bed15728	00090000-5608-f7ce-ea7f-e2e9c032c597	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-f7ce-e2ba-f2f66235a6f0	00090000-5608-f7ce-fb82-a4c6e067126e	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-f7ce-9d96-64bb84dd370e	00090000-5608-f7ce-31d3-1ca24ad52f64	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-f7ce-02b1-9c5caf67fc39	00090000-5608-f7ce-1da8-588b41b8cdc3	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2994 (class 0 OID 20792108)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 20792380)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5608-f7cc-299d-8ad3a169b43c	01	Drama	drama (SURS 01)
00140000-5608-f7cc-4488-893e3826913a	02	Opera	opera (SURS 02)
00140000-5608-f7cc-32af-e535817435b2	03	Balet	balet (SURS 03)
00140000-5608-f7cc-b8c0-1b4f3b8eda7f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5608-f7cc-6691-bce8cec73f80	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5608-f7cc-8459-ed3b916fc4b9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5608-f7cc-7018-de72cff664a7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3012 (class 0 OID 20792262)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2499 (class 2606 OID 20791883)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 20792439)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 20792429)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 20792296)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20792338)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 20792687)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 20792097)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 20792118)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 20792605)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 20792008)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 20792496)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 20792258)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20792070)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20792046)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 20792022)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20792165)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20792664)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 20792671)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 20792695)
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
-- TOC entry 2611 (class 2606 OID 20792192)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 20791980)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 20791892)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 20791916)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 20791872)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2490 (class 2606 OID 20791857)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20792198)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 20792234)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 20792375)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 20791944)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 20791968)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20792557)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20792171)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 20791958)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 20792058)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 20792183)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 20792566)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 20792574)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20792544)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 20792586)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 20792216)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 20792156)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 20792147)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 20792362)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 20792289)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 20792034)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20791828)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 20792225)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 20791846)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2492 (class 2606 OID 20791866)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 20792243)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20792178)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 20792127)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20791816)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20791804)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20791798)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20792309)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20791925)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 20792138)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 20792349)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 20792598)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 20791993)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 20791841)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 20792408)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 20792080)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 20792206)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 20792321)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 20792645)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20792629)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 20792653)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20792280)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20792112)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 20792388)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 20792270)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 20792106)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2564 (class 1259 OID 20792107)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2565 (class 1259 OID 20792105)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2566 (class 1259 OID 20792104)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 20792103)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2653 (class 1259 OID 20792310)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2654 (class 1259 OID 20792311)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 20792312)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 20792666)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 20792665)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2513 (class 1259 OID 20791946)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 20792199)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 20792633)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 20792632)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 20792634)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 20792631)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 20792630)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 20792185)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 20792184)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 20792081)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 20792259)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 20792261)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 20792260)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2538 (class 1259 OID 20792024)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 20792023)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2717 (class 1259 OID 20792587)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2669 (class 1259 OID 20792377)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 20792378)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 20792379)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 20792654)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2678 (class 1259 OID 20792413)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2679 (class 1259 OID 20792410)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2680 (class 1259 OID 20792414)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2681 (class 1259 OID 20792412)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2682 (class 1259 OID 20792411)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2528 (class 1259 OID 20791995)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 20791994)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2504 (class 1259 OID 20791919)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 20792226)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 20791873)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2495 (class 1259 OID 20791874)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 20792246)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 20792245)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 20792244)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 20792059)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 20792060)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 20791806)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 20792151)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 20792149)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 20792148)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 20792150)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 20791847)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 20791848)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 20792207)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 20792688)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2651 (class 1259 OID 20792298)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 20792297)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2750 (class 1259 OID 20792696)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 20792697)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 20792172)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 20792290)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 20792291)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 20792501)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2700 (class 1259 OID 20792500)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2701 (class 1259 OID 20792497)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 20792498)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2703 (class 1259 OID 20792499)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2517 (class 1259 OID 20791960)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 20791959)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2519 (class 1259 OID 20791961)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 20792220)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 20792219)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 20792567)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2710 (class 1259 OID 20792568)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2692 (class 1259 OID 20792443)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 20792444)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2694 (class 1259 OID 20792441)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2695 (class 1259 OID 20792442)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 20792281)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 20792160)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 20792159)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 20792157)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 20792158)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2688 (class 1259 OID 20792431)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 20792430)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 20792035)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2545 (class 1259 OID 20792049)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2546 (class 1259 OID 20792048)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2547 (class 1259 OID 20792047)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2548 (class 1259 OID 20792050)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2557 (class 1259 OID 20792071)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 20792558)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2725 (class 1259 OID 20792606)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 20792672)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 20792673)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2500 (class 1259 OID 20791894)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 20791893)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2509 (class 1259 OID 20791926)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 20791927)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 20792113)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 20792141)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 20792140)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 20792139)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2568 (class 1259 OID 20792099)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 20792100)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 20792098)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 20792102)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2572 (class 1259 OID 20792101)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2516 (class 1259 OID 20791945)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 20792009)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 20792011)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2536 (class 1259 OID 20792010)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2537 (class 1259 OID 20792012)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 20792166)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 20792376)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 20792409)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 20792350)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 20792351)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2507 (class 1259 OID 20791917)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 20791918)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 20792271)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 20791817)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 20791981)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 20791805)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2722 (class 1259 OID 20792599)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 20792218)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 20792217)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 20792440)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 20791969)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 20792389)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 20792646)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2715 (class 1259 OID 20792575)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 20792576)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 20792339)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2580 (class 1259 OID 20792128)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 20791867)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2784 (class 2606 OID 20792828)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 20792833)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2779 (class 2606 OID 20792853)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2785 (class 2606 OID 20792823)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 20792843)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 20792848)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 20792838)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 20793018)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2819 (class 2606 OID 20793023)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 20793028)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 20793193)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 20793188)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 20792753)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 20792938)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 20793173)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 20793168)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 20793178)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 20793163)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2850 (class 2606 OID 20793158)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2800 (class 2606 OID 20792933)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 20792928)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 20792818)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 20792978)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 20792988)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2811 (class 2606 OID 20792983)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 20792788)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 20792783)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 20792918)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 20793148)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 20793033)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 20793038)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 20793043)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 20793183)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 20793063)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2828 (class 2606 OID 20793048)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 20793068)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 20793058)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 20793053)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 20792778)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 20792773)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 20792738)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2762 (class 2606 OID 20792733)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 20792958)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 20792713)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 20792718)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 20792973)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2808 (class 2606 OID 20792968)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 20792963)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2776 (class 2606 OID 20792803)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 20792808)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 20792698)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 20792893)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2792 (class 2606 OID 20792883)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2793 (class 2606 OID 20792878)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2791 (class 2606 OID 20792888)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 20792703)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 20792708)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2803 (class 2606 OID 20792943)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2856 (class 2606 OID 20793208)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 20793013)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 20793008)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2858 (class 2606 OID 20793213)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2857 (class 2606 OID 20793218)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 20792923)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2815 (class 2606 OID 20792998)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2814 (class 2606 OID 20793003)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 20793123)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 20793118)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2839 (class 2606 OID 20793103)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 20793108)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2837 (class 2606 OID 20793113)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2767 (class 2606 OID 20792763)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20792758)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 20792768)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 20792953)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2805 (class 2606 OID 20792948)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20793133)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 20793138)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2832 (class 2606 OID 20793093)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 20793098)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2834 (class 2606 OID 20793083)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2833 (class 2606 OID 20793088)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2813 (class 2606 OID 20792993)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 20792913)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2795 (class 2606 OID 20792908)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2797 (class 2606 OID 20792898)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2796 (class 2606 OID 20792903)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 20793078)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 20793073)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 20792793)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2774 (class 2606 OID 20792798)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 20792813)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 20793128)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2843 (class 2606 OID 20793143)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 20793153)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2855 (class 2606 OID 20793198)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2854 (class 2606 OID 20793203)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2759 (class 2606 OID 20792728)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 20792723)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2764 (class 2606 OID 20792743)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 20792748)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 20792858)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 20792873)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 20792868)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 20792863)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-28 10:18:25 CEST

--
-- PostgreSQL database dump complete
--

