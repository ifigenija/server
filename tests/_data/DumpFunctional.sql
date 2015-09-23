--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-23 14:51:01 CEST

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
-- TOC entry 181 (class 1259 OID 20558409)
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
-- TOC entry 229 (class 1259 OID 20558966)
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
-- TOC entry 228 (class 1259 OID 20558949)
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
-- TOC entry 219 (class 1259 OID 20558826)
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
-- TOC entry 222 (class 1259 OID 20558856)
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
-- TOC entry 243 (class 1259 OID 20559205)
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
-- TOC entry 197 (class 1259 OID 20558616)
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
-- TOC entry 199 (class 1259 OID 20558648)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20559131)
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
-- TOC entry 190 (class 1259 OID 20558530)
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
-- TOC entry 230 (class 1259 OID 20558979)
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
-- TOC entry 215 (class 1259 OID 20558781)
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
-- TOC entry 195 (class 1259 OID 20558595)
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
-- TOC entry 193 (class 1259 OID 20558570)
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
-- TOC entry 191 (class 1259 OID 20558547)
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
-- TOC entry 204 (class 1259 OID 20558695)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20559186)
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
-- TOC entry 242 (class 1259 OID 20559198)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20559220)
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
-- TOC entry 208 (class 1259 OID 20558720)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20558504)
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
-- TOC entry 182 (class 1259 OID 20558418)
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
-- TOC entry 183 (class 1259 OID 20558429)
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
-- TOC entry 178 (class 1259 OID 20558383)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20558402)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20558727)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20558761)
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
-- TOC entry 225 (class 1259 OID 20558897)
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
-- TOC entry 185 (class 1259 OID 20558462)
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
-- TOC entry 187 (class 1259 OID 20558496)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20559077)
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
-- TOC entry 205 (class 1259 OID 20558701)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20558481)
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
-- TOC entry 194 (class 1259 OID 20558585)
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
-- TOC entry 207 (class 1259 OID 20558713)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20559091)
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
-- TOC entry 234 (class 1259 OID 20559101)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20559034)
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
-- TOC entry 235 (class 1259 OID 20559109)
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
-- TOC entry 211 (class 1259 OID 20558742)
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
-- TOC entry 203 (class 1259 OID 20558686)
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
-- TOC entry 202 (class 1259 OID 20558676)
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
-- TOC entry 224 (class 1259 OID 20558886)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20558816)
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
-- TOC entry 192 (class 1259 OID 20558559)
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
-- TOC entry 175 (class 1259 OID 20558354)
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
-- TOC entry 174 (class 1259 OID 20558352)
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
-- TOC entry 212 (class 1259 OID 20558755)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20558392)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20558376)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20558769)
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
-- TOC entry 206 (class 1259 OID 20558707)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20558653)
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
-- TOC entry 173 (class 1259 OID 20558341)
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
-- TOC entry 172 (class 1259 OID 20558333)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20558328)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20558833)
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
-- TOC entry 184 (class 1259 OID 20558454)
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
-- TOC entry 201 (class 1259 OID 20558663)
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
-- TOC entry 223 (class 1259 OID 20558874)
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
-- TOC entry 236 (class 1259 OID 20559119)
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
-- TOC entry 189 (class 1259 OID 20558516)
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
-- TOC entry 176 (class 1259 OID 20558363)
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
-- TOC entry 227 (class 1259 OID 20558924)
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
-- TOC entry 196 (class 1259 OID 20558606)
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
-- TOC entry 210 (class 1259 OID 20558734)
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
-- TOC entry 221 (class 1259 OID 20558847)
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
-- TOC entry 239 (class 1259 OID 20559166)
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
-- TOC entry 238 (class 1259 OID 20559138)
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
-- TOC entry 240 (class 1259 OID 20559178)
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
-- TOC entry 217 (class 1259 OID 20558806)
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
-- TOC entry 198 (class 1259 OID 20558642)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20558914)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20558796)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20558357)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2974 (class 0 OID 20558409)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 20558966)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5602-a032-8188-265418502b6a	000d0000-5602-a032-adb7-992de69fac06	\N	00090000-5602-a032-e0b5-7abc66752ab4	000b0000-5602-a032-1602-3717cfc3521f	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5602-a032-237c-f58309f99e12	000d0000-5602-a032-8c44-ae5fa55e27f0	00100000-5602-a032-33ea-8067da6c50a0	00090000-5602-a032-c782-d8522b976a16	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5602-a032-9393-8fcbf18491d2	000d0000-5602-a032-5af8-292409e71988	00100000-5602-a032-1ae2-281f33f0d984	00090000-5602-a032-14a4-d0ecaba53c44	\N	0003	t	\N	2015-09-23	\N	2	t	\N	f	f
000c0000-5602-a032-2eb5-f5b755f8392b	000d0000-5602-a032-f666-4836af0578c4	\N	00090000-5602-a032-6eec-1f2c8f4a29da	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5602-a032-cde4-e64dff3c5740	000d0000-5602-a032-6b70-67396eb7b521	\N	00090000-5602-a032-fd02-41c298bbec69	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5602-a032-f0ed-97ce4acfd815	000d0000-5602-a032-d766-4ee184b37843	\N	00090000-5602-a032-2795-af965bd6183a	000b0000-5602-a032-9511-60b4cb955783	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5602-a032-dc14-2836709d540c	000d0000-5602-a032-cb55-861096d27b18	00100000-5602-a032-edf5-1a765ef3250a	00090000-5602-a032-d7a6-0c33aa01b218	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5602-a032-bec2-bafdaea2cb45	000d0000-5602-a032-4c3f-88e9ba573d69	\N	00090000-5602-a032-0e71-945975c3c21d	000b0000-5602-a032-f4a5-19d50079d772	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5602-a032-561a-219b9bd7a9c9	000d0000-5602-a032-cb55-861096d27b18	00100000-5602-a032-b553-270fcd3eaa16	00090000-5602-a032-b2fc-fda9c9a733ec	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5602-a032-78ec-a35a53c6fa95	000d0000-5602-a032-cb55-861096d27b18	00100000-5602-a032-9801-9209a103bdc3	00090000-5602-a032-8f5c-14b4ec8b454c	\N	0010	t	\N	2015-09-23	\N	16	f	\N	f	t
000c0000-5602-a032-78e5-7e6ccfa0c3d3	000d0000-5602-a032-cb55-861096d27b18	00100000-5602-a032-66ee-5b2f5dddb7d2	00090000-5602-a032-83b6-31d8e4e2f91e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5602-a032-2be8-697edbb8e944	000d0000-5602-a032-750a-39c4344ff194	\N	00090000-5602-a032-c782-d8522b976a16	000b0000-5602-a032-6315-06e5304dfbf1	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3021 (class 0 OID 20558949)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20558826)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5602-a032-96ee-6a868618cc8e	00160000-5602-a032-729b-fca27628cb6d	00090000-5602-a032-c69c-188b2ac61e68	aizv	10	t
003d0000-5602-a032-175a-da0ac3232124	00160000-5602-a032-729b-fca27628cb6d	00090000-5602-a032-96fa-3c8d57f950cd	apri	14	t
003d0000-5602-a032-737a-1fe7938ea8b5	00160000-5602-a032-149b-0ffaa64d82b5	00090000-5602-a032-95c1-87787de96a9c	aizv	11	t
003d0000-5602-a032-d11c-9a738f87b37b	00160000-5602-a032-c182-823b5000f950	00090000-5602-a032-78d0-2a47e2aaa4a5	aizv	12	t
003d0000-5602-a032-c04f-7c8806244e1b	00160000-5602-a032-729b-fca27628cb6d	00090000-5602-a032-7075-d6a8175406d4	apri	18	f
\.


--
-- TOC entry 3015 (class 0 OID 20558856)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5602-a032-729b-fca27628cb6d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5602-a032-149b-0ffaa64d82b5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5602-a032-c182-823b5000f950	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3036 (class 0 OID 20559205)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 20558616)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5602-a032-604f-e70885644701	\N	\N	00200000-5602-a032-d5f7-06374e8fbfbb	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5602-a032-f148-5adc549fe337	\N	\N	00200000-5602-a032-dfca-b57fab4753e6	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5602-a032-32af-69c2d8ec3765	\N	\N	00200000-5602-a032-4e88-51625cb03a3f	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5602-a032-53cb-d16115fbe428	\N	\N	00200000-5602-a032-0a44-01d3be28b554	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5602-a032-c7ae-de4cfc297e9a	\N	\N	00200000-5602-a032-64e3-7d34fa1efccd	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2992 (class 0 OID 20558648)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20559131)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20558530)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5602-a030-8914-5f14f7273cee	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5602-a030-24aa-661298f940ae	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5602-a030-6f5e-fd4758262e1e	AL	ALB	008	Albania 	Albanija	\N
00040000-5602-a030-34f5-aa7ece3142b2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5602-a030-9dbd-c72e145d9157	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5602-a030-c9c5-47babc15c542	AD	AND	020	Andorra 	Andora	\N
00040000-5602-a030-6f9f-79c92dc317ff	AO	AGO	024	Angola 	Angola	\N
00040000-5602-a030-31c6-e3fa354c767d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5602-a030-c7fd-f5561a85f944	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5602-a030-2e42-d9b436d2bbcf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-a030-5f7a-a3a9827330c2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5602-a030-44be-76499c3d1f8b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5602-a030-5f11-2c25c5d1c903	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5602-a030-e4de-1389eb50b038	AU	AUS	036	Australia 	Avstralija	\N
00040000-5602-a030-2be3-23d677ff3f7a	AT	AUT	040	Austria 	Avstrija	\N
00040000-5602-a030-d677-9dcfd4dce790	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5602-a030-0d90-ec71fcb10dd8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5602-a030-4279-b72df616d366	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5602-a030-7496-5c740c975f22	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5602-a030-670c-f12bede21af2	BB	BRB	052	Barbados 	Barbados	\N
00040000-5602-a030-1ecc-911a4abb1b65	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5602-a030-a275-4981760771eb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5602-a030-71b1-773814e9a39e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5602-a030-e405-f0f67cafe680	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5602-a030-356b-6e108ba1f252	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5602-a030-2d7d-88e6e93cefdb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5602-a030-52ae-2953db202d59	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5602-a030-dbd9-d53548cd303d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5602-a030-1985-09b3eaa8bd5f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5602-a030-7093-c0ea2051423e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5602-a030-58fc-dad88ceee15d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5602-a030-b232-301d3d10e4df	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5602-a030-b1ae-9b04abf074e7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5602-a030-4317-3744dda8011d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5602-a030-1b66-c7a189afee62	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5602-a030-eada-468604adb11e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5602-a030-3b12-c692dbfea848	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5602-a030-d0f9-525507910bb9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5602-a030-cba6-41cf7f555124	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5602-a030-8722-cea279a2f87e	CA	CAN	124	Canada 	Kanada	\N
00040000-5602-a030-8ff1-9df290ee0d51	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5602-a030-93d5-4f5f80a8f50a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5602-a030-9543-30005f3747a7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5602-a030-c4ba-111e91708faa	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5602-a030-7d86-551db799c49f	CL	CHL	152	Chile 	Čile	\N
00040000-5602-a030-32e8-814f1bfac46b	CN	CHN	156	China 	Kitajska	\N
00040000-5602-a030-cb6e-85d4eb051a5e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5602-a030-c9ec-2e94efe4d0ef	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5602-a030-0d9d-6f64d04f356e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5602-a030-161b-8c2281a48382	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5602-a030-e379-08ccc681fcbc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5602-a030-c3ae-98e71ff803d1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5602-a030-a71a-72c0e7f5815d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5602-a030-008c-165140d36de9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5602-a030-9140-15dd47704ea6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5602-a030-1eb8-ea47c6dfeb62	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5602-a030-9884-4f5776f79284	CU	CUB	192	Cuba 	Kuba	\N
00040000-5602-a030-03f6-1bf27df3aacc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5602-a030-aa18-944b08fc8327	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5602-a030-05c6-db49b9f765be	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5602-a030-cfe9-6d6ef83dee2b	DK	DNK	208	Denmark 	Danska	\N
00040000-5602-a030-9c85-5632c72ba018	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5602-a030-113b-f223aab4b3e5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-a030-09f0-1d1759b691c7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5602-a030-4b6b-a36b4b3f0375	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5602-a030-8f93-e8dd67075f29	EG	EGY	818	Egypt 	Egipt	\N
00040000-5602-a030-1076-a10d1f62703d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5602-a030-c0c5-44cd2e1af439	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5602-a030-6af0-7793adc52e2f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5602-a030-f419-2011d5569792	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5602-a030-3566-5fbba2410bb3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5602-a030-2563-838fea5b6171	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5602-a030-137b-65419866dd6b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5602-a030-2353-2c509e51cd52	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5602-a030-2d53-58ec832cfbc0	FI	FIN	246	Finland 	Finska	\N
00040000-5602-a030-5304-eff84950a9bc	FR	FRA	250	France 	Francija	\N
00040000-5602-a030-521e-fecb81dd2890	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5602-a030-37e1-bac37a661050	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5602-a030-7359-dffb464a2954	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5602-a030-98dc-9426b128aa05	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5602-a030-975d-0f1f096306a3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5602-a030-5ae0-5a405f6d2b29	GM	GMB	270	Gambia 	Gambija	\N
00040000-5602-a030-0d13-ce0035370387	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5602-a030-9e21-1260e46ac33e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5602-a030-de33-73a129cba891	GH	GHA	288	Ghana 	Gana	\N
00040000-5602-a030-230d-f7650c5e405c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5602-a030-53d7-a6876c1afe1e	GR	GRC	300	Greece 	Grčija	\N
00040000-5602-a030-de50-ad592916372c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5602-a030-64b0-642ddd0e4caf	GD	GRD	308	Grenada 	Grenada	\N
00040000-5602-a030-36b8-6e6da447aff2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5602-a030-3de5-e8f277041d04	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5602-a030-caf3-95bfdc81f9c4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5602-a030-c9dc-5b632f30e235	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5602-a030-7df7-9d61ebb4bca6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5602-a030-fe71-53c82886fab4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5602-a030-03b3-af584cef1ca8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5602-a030-8553-c3186795b45d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5602-a030-a1a0-588357ef521d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5602-a030-ed5d-8b33b5624b38	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5602-a030-f157-76e7b2f87c7d	HN	HND	340	Honduras 	Honduras	\N
00040000-5602-a030-f58a-80dc95ce25e7	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5602-a030-6980-f2a80aa4b9f2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5602-a030-8126-de1e120bf814	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5602-a030-79f9-d674ce93a3eb	IN	IND	356	India 	Indija	\N
00040000-5602-a030-f89e-858199a3e602	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5602-a030-1138-b0f79fef330e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5602-a030-5aa7-1940bb6e4c86	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5602-a030-89d1-b5945f1dfaec	IE	IRL	372	Ireland 	Irska	\N
00040000-5602-a030-3390-670dce766c2c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5602-a030-a1f3-b694ba886628	IL	ISR	376	Israel 	Izrael	\N
00040000-5602-a030-1e86-16740590585c	IT	ITA	380	Italy 	Italija	\N
00040000-5602-a030-46fb-f7ac8852392e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5602-a030-24c4-87b31d03d37d	JP	JPN	392	Japan 	Japonska	\N
00040000-5602-a030-6dff-bf7c09ec694f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5602-a030-481e-426011ecde43	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5602-a030-d8e5-cfe39c3fa40a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5602-a030-cb29-c294eb98d809	KE	KEN	404	Kenya 	Kenija	\N
00040000-5602-a030-e01a-76825bdcb345	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5602-a030-2c3f-18a4aa16abfc	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5602-a030-53f7-04ecd7bab1a4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5602-a030-44c6-7765722bac94	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5602-a030-1769-155d2fdae22c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5602-a030-b981-5b4f81dd8fc2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5602-a030-2c9a-e1edcd954aaa	LV	LVA	428	Latvia 	Latvija	\N
00040000-5602-a030-c594-ca4549c89a07	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5602-a030-db71-5af82d9129cc	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5602-a030-b6d9-60c20600bad0	LR	LBR	430	Liberia 	Liberija	\N
00040000-5602-a030-8978-03e3b22cf585	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5602-a030-61cb-b55ebef68428	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5602-a030-593a-e9d5d41a92da	LT	LTU	440	Lithuania 	Litva	\N
00040000-5602-a030-6f37-7c5af90fcfd3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5602-a030-424c-24ecb1b0dfed	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5602-a030-6646-350c44d20728	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5602-a030-592e-033ee2a82b8e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5602-a030-7c7d-5b790eec3f88	MW	MWI	454	Malawi 	Malavi	\N
00040000-5602-a030-60d5-76fe856373c8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5602-a030-4005-4452d9459c3c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5602-a030-bfbe-b4105a6d8e25	ML	MLI	466	Mali 	Mali	\N
00040000-5602-a030-107c-214648071c1d	MT	MLT	470	Malta 	Malta	\N
00040000-5602-a030-cafb-94650a364204	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5602-a030-7a74-e2208c03c14d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5602-a030-9f93-a51cc681c165	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5602-a030-f6f8-cc12185cf735	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5602-a030-5d37-e721e06965d2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5602-a030-da21-e1696f02b1e7	MX	MEX	484	Mexico 	Mehika	\N
00040000-5602-a030-e3ee-ce0027b28abb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5602-a030-c8a3-ea98aa121cc4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5602-a030-5f07-1f855c8099ba	MC	MCO	492	Monaco 	Monako	\N
00040000-5602-a030-4c0e-e2bc5d7d24ff	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5602-a030-836e-59d86adc3a3a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5602-a030-9fe7-8bb67aeede49	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5602-a030-6ee2-556d446b6b3f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5602-a030-420d-78299dd9b9c9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5602-a030-3769-bb9cf20ef80f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5602-a030-250c-e557c0dfcded	NA	NAM	516	Namibia 	Namibija	\N
00040000-5602-a030-ea32-ecde14def5d0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5602-a030-9405-6f1e37ca5afb	NP	NPL	524	Nepal 	Nepal	\N
00040000-5602-a030-2a51-fa263118d75d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5602-a030-c210-adb47622dbea	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5602-a030-f7b7-3e51101fd5d3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5602-a030-536d-ad9341cdc308	NE	NER	562	Niger 	Niger 	\N
00040000-5602-a030-0039-5109d18e0335	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5602-a030-4782-f6712e1c0b1c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5602-a030-d815-ffa8aff9b12d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5602-a030-0b8e-957ffb130776	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5602-a030-7261-a50c79ce39d0	NO	NOR	578	Norway 	Norveška	\N
00040000-5602-a030-b9ba-d574be985a7c	OM	OMN	512	Oman 	Oman	\N
00040000-5602-a030-3984-4edfb62ef027	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5602-a030-8782-d6de62c92141	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5602-a030-51d7-6b11896ef519	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5602-a030-e9c2-740e0554542f	PA	PAN	591	Panama 	Panama	\N
00040000-5602-a030-f71a-1120c9f27efb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5602-a030-6010-922e326598ef	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5602-a030-75da-9b45c61226d3	PE	PER	604	Peru 	Peru	\N
00040000-5602-a030-0e2f-eedbe67fa31b	PH	PHL	608	Philippines 	Filipini	\N
00040000-5602-a030-4485-f120f1c8efe1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5602-a030-d2f0-1b7bb90977cb	PL	POL	616	Poland 	Poljska	\N
00040000-5602-a030-b008-1dc4dd74b4b6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5602-a030-2e37-a19fb4f83fca	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5602-a030-22c0-e9fabd1a3250	QA	QAT	634	Qatar 	Katar	\N
00040000-5602-a030-bf3f-3b643b7b3af8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5602-a030-5389-a47dc28f8f7d	RO	ROU	642	Romania 	Romunija	\N
00040000-5602-a030-4c94-4df87ac3d41b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5602-a030-2a00-34efa8b76637	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5602-a030-1af8-5b8d98891ffc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5602-a030-c56d-59bd46c76595	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5602-a030-b740-514e789b12f3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5602-a030-beb7-1ad17f76c540	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5602-a030-3ec9-18d244adc1d9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5602-a030-9f82-8a088a5cd3ae	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5602-a030-75ca-879967d258b9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5602-a030-5aa0-53a2d29ea43c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5602-a030-0277-836f30796bc0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5602-a030-b088-8e6363faed6f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5602-a030-3bb1-7f62c6507ad6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5602-a030-f1a5-8d4236b24018	SN	SEN	686	Senegal 	Senegal	\N
00040000-5602-a030-fd44-6fb1f7185037	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5602-a030-cc4b-a99a520cbca6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5602-a030-e0ff-c05336459689	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5602-a030-cc1b-ada164d2515e	SG	SGP	702	Singapore 	Singapur	\N
00040000-5602-a030-8760-889e2e09b40c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5602-a030-1976-30eaabf58146	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5602-a030-d06c-ade25fe24e45	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5602-a030-5930-ff381dbcd874	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5602-a030-63ad-5f254d9564fa	SO	SOM	706	Somalia 	Somalija	\N
00040000-5602-a030-2386-60801e92f650	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5602-a030-3ba1-c2de05a3687c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5602-a030-c7de-8211e6c7347e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5602-a030-d098-e3045a5bcf45	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5602-a030-1832-66bbee518ca6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5602-a030-3752-a7a8f803ece3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5602-a030-4d85-85919fc3061a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5602-a030-31c0-04f37d525752	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5602-a030-d98e-63bfa5bf261b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5602-a030-2125-6ab7c56b08a0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5602-a030-5798-89d53def1260	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5602-a030-b9eb-131a69762481	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5602-a030-0fab-1a4a302b452f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5602-a030-780d-dc841280e3aa	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5602-a030-a4df-3c8c192997c9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5602-a030-a991-40b6fbb425fb	TH	THA	764	Thailand 	Tajska	\N
00040000-5602-a030-434a-286b1c2c16cd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5602-a030-a9b5-581f51e61ed3	TG	TGO	768	Togo 	Togo	\N
00040000-5602-a030-b4b7-51f0d2c4c0f8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5602-a030-1618-168be9d335e1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5602-a030-3fe4-a2e68b8d2e9d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5602-a030-560e-4f0c497a346a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5602-a030-8fff-538340086f32	TR	TUR	792	Turkey 	Turčija	\N
00040000-5602-a030-6772-7ab94ca30be9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5602-a030-1fee-735bc69c0149	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-a030-f095-e32658436f37	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5602-a030-a783-0147c2306a17	UG	UGA	800	Uganda 	Uganda	\N
00040000-5602-a030-5a32-068b492eee59	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5602-a030-557a-30c17cf0c0a2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5602-a030-1926-df3e48ce3532	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5602-a030-e6b5-404dc10858dc	US	USA	840	United States 	Združene države Amerike	\N
00040000-5602-a030-adbc-39ab332a0c14	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5602-a030-be7d-9a20a393af13	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5602-a030-70ea-5dd069cf6402	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5602-a030-87da-1a1cabd00c72	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5602-a030-b99a-ff27d4a8b62c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5602-a030-ee84-b8be9c325aca	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5602-a030-e753-86e1d6e828e7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-a030-babc-7683643818e8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5602-a030-4e74-ed4b1f64bdd2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5602-a030-f26c-ede1bfd92ca5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5602-a030-f9b1-579124a6025b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5602-a030-086f-51a73ce4e4fc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5602-a030-2ab6-6790d0ccc028	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3023 (class 0 OID 20558979)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5602-a032-0739-3e81ed3d8dbe	000e0000-5602-a032-b0a4-bc5e088babab	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-a030-d9d0-5e645c543c68	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-a032-e43b-15a8c87e370f	000e0000-5602-a032-f476-e31c4f58b466	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-a030-8cb8-fe0bae5963f8	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-a032-878d-451a899e2b70	000e0000-5602-a032-4570-2d28f8ec2eca	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-a030-d9d0-5e645c543c68	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-a032-0d27-ee187e815e5d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-a032-07ca-44c30ae5e618	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3008 (class 0 OID 20558781)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5602-a032-adb7-992de69fac06	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-8188-265418502b6a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-a030-89ec-5c21db227b6b
000d0000-5602-a032-8c44-ae5fa55e27f0	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-237c-f58309f99e12	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5602-a030-820d-41028f09c401
000d0000-5602-a032-5af8-292409e71988	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-9393-8fcbf18491d2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5602-a030-64db-790b1767a2ec
000d0000-5602-a032-f666-4836af0578c4	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-2eb5-f5b755f8392b	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5602-a030-785c-9d12889b234f
000d0000-5602-a032-6b70-67396eb7b521	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-cde4-e64dff3c5740	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5602-a030-785c-9d12889b234f
000d0000-5602-a032-d766-4ee184b37843	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-f0ed-97ce4acfd815	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-a030-89ec-5c21db227b6b
000d0000-5602-a032-cb55-861096d27b18	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-561a-219b9bd7a9c9	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5602-a030-89ec-5c21db227b6b
000d0000-5602-a032-4c3f-88e9ba573d69	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-bec2-bafdaea2cb45	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5602-a030-a626-21e63a6327f8
000d0000-5602-a032-750a-39c4344ff194	000e0000-5602-a032-f476-e31c4f58b466	000c0000-5602-a032-2be8-697edbb8e944	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5602-a030-ea12-30440af88113
\.


--
-- TOC entry 2988 (class 0 OID 20558595)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20558570)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20558547)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5602-a032-5c01-9e5f8d9f2a0d	00080000-5602-a032-ba91-155a6c8b8576	00090000-5602-a032-8f5c-14b4ec8b454c	AK		igralka
\.


--
-- TOC entry 2997 (class 0 OID 20558695)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20559186)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20559198)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 20559220)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19946838)
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
-- TOC entry 3001 (class 0 OID 20558720)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20558504)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5602-a031-b743-1abbd915f6b1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5602-a031-7cef-6b1bd826c2b8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5602-a031-e792-56c9dbf465c1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5602-a031-76ba-a985178ae67c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5602-a031-e1a7-fb6bf00e6f60	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5602-a031-3cea-3b44bd5e89fe	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5602-a031-c751-31298c776ce3	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5602-a031-ab14-f1e5841c910f	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-a031-ac3a-157477d12a8c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-a031-b9fb-9ea6a4c552ef	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5602-a031-1298-6284700964eb	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5602-a031-3bea-076fe850729e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5602-a031-13c0-bec304fd1c23	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5602-a031-72a9-61d1c9a7843f	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5602-a031-0712-7d2b56a71d8b	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5602-a032-259e-8defb899ee84	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5602-a032-2f1e-0be54225a4ef	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5602-a032-3760-bd5570d4f50b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5602-a032-76cc-2dea908e7cbd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5602-a032-1144-73449009149a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5602-a033-6c66-f349e63e9cdc	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2975 (class 0 OID 20558418)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5602-a032-abbc-751703c7de80	00000000-5602-a032-259e-8defb899ee84	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5602-a032-1bb9-7493da46b8fd	00000000-5602-a032-259e-8defb899ee84	00010000-5602-a031-171a-645e924edaf3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5602-a032-9c72-ca1798e12d63	00000000-5602-a032-2f1e-0be54225a4ef	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2976 (class 0 OID 20558429)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5602-a032-e0b5-7abc66752ab4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5602-a032-6eec-1f2c8f4a29da	00010000-5602-a032-b76b-7af6c999e751	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5602-a032-14a4-d0ecaba53c44	00010000-5602-a032-085c-23bba68e6aff	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5602-a032-b2fc-fda9c9a733ec	00010000-5602-a032-abdd-cd3ace826fa7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5602-a032-6139-b0aea5a4edb8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5602-a032-2795-af965bd6183a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5602-a032-83b6-31d8e4e2f91e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5602-a032-d7a6-0c33aa01b218	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5602-a032-8f5c-14b4ec8b454c	00010000-5602-a032-c099-c1770a7d1700	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5602-a032-c782-d8522b976a16	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5602-a032-0a67-872aecb5b186	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-a032-fd02-41c298bbec69	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5602-a032-0e71-945975c3c21d	00010000-5602-a032-301d-e3cf29e37830	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-a032-c69c-188b2ac61e68	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-a032-96fa-3c8d57f950cd	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-a032-95c1-87787de96a9c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-a032-78d0-2a47e2aaa4a5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5602-a032-7075-d6a8175406d4	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 20558383)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5602-a030-4097-8a1ef04f10cb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5602-a030-65b8-2c1b33a5840e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5602-a030-b81b-a15f5ecb7166	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5602-a030-d59a-c8788e4b3b3c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5602-a030-45e0-b52af2233131	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5602-a030-9df7-01b718c31ac4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5602-a030-bbaf-6ee8160cd68c	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5602-a030-37d8-813f99f933f2	Abonma-read	Abonma - branje	f
00030000-5602-a030-49b9-9c65a8900927	Abonma-write	Abonma - spreminjanje	f
00030000-5602-a030-e7b1-64116c4887c6	Alternacija-read	Alternacija - branje	f
00030000-5602-a030-3b29-6c354d7660b5	Alternacija-write	Alternacija - spreminjanje	f
00030000-5602-a030-2239-7083d774dc4c	Arhivalija-read	Arhivalija - branje	f
00030000-5602-a030-b1e5-b50cbae1dde8	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5602-a030-31a2-c343aa699cf6	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5602-a030-d182-8a66849d3eba	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5602-a030-002b-96790c8fedc2	Besedilo-read	Besedilo - branje	f
00030000-5602-a030-9610-a8c337d45c9d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5602-a030-4092-ed25a50a618a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5602-a030-363e-c8c8fff5256c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5602-a030-f26d-98f03cb8f578	Dogodek-read	Dogodek - branje	f
00030000-5602-a030-1b3e-c35ffb2d3c5b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5602-a030-f96c-369707aa4c39	DrugiVir-read	DrugiVir - branje	f
00030000-5602-a030-8299-6221b1c0c87b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5602-a030-a40c-f807aa9e0200	Drzava-read	Drzava - branje	f
00030000-5602-a030-9f08-2048916950ea	Drzava-write	Drzava - spreminjanje	f
00030000-5602-a030-ad0b-62d88cade2eb	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5602-a030-ed1a-15259e5047d2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5602-a030-cd65-2301a8adba1b	Funkcija-read	Funkcija - branje	f
00030000-5602-a030-1196-c6d8f4bb9441	Funkcija-write	Funkcija - spreminjanje	f
00030000-5602-a030-47a6-5b862aa35478	Gostovanje-read	Gostovanje - branje	f
00030000-5602-a030-b000-f742adc4cd3d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5602-a030-fb60-533eff2888ad	Gostujoca-read	Gostujoca - branje	f
00030000-5602-a030-a016-67efc18de34d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5602-a030-b5eb-35f022d09d81	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5602-a030-edc4-f0c370518e4d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5602-a030-6c62-0ee7e490a851	Kupec-read	Kupec - branje	f
00030000-5602-a030-97f8-72595fc51e4c	Kupec-write	Kupec - spreminjanje	f
00030000-5602-a030-17d5-81984c053715	NacinPlacina-read	NacinPlacina - branje	f
00030000-5602-a030-aa5b-f2e47b516882	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5602-a030-db6f-95570f5bb0ca	Option-read	Option - branje	f
00030000-5602-a030-b392-012d8fc2a4cf	Option-write	Option - spreminjanje	f
00030000-5602-a030-5111-ea026c2e25b6	OptionValue-read	OptionValue - branje	f
00030000-5602-a030-b7b8-e70d3a0fb14d	OptionValue-write	OptionValue - spreminjanje	f
00030000-5602-a030-d1ea-61dda324ff0d	Oseba-read	Oseba - branje	f
00030000-5602-a030-22f4-74ae5f4bd37a	Oseba-write	Oseba - spreminjanje	f
00030000-5602-a030-7166-c6476ffc3c39	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5602-a030-7dbf-04fd62d5a655	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5602-a030-cc21-1d80c08c36b1	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5602-a030-4ed0-13e5847f8ab4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5602-a030-b311-5a569c86e71f	Pogodba-read	Pogodba - branje	f
00030000-5602-a030-cc67-e76a0466841d	Pogodba-write	Pogodba - spreminjanje	f
00030000-5602-a030-ebea-d1f91f6f6920	Popa-read	Popa - branje	f
00030000-5602-a030-d007-c3682bfb1c60	Popa-write	Popa - spreminjanje	f
00030000-5602-a030-a3af-312d5af021c5	Posta-read	Posta - branje	f
00030000-5602-a030-33d6-2c1bcf452634	Posta-write	Posta - spreminjanje	f
00030000-5602-a030-fb11-3a99d8d0ed87	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5602-a030-d185-809952b98665	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5602-a030-8702-dc3ed6df77a1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5602-a030-cd78-39e7f8654f82	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5602-a030-fa99-5bc134203f0c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5602-a030-68a2-ca7b6033f5dc	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5602-a030-9dbe-b7d5d45e01c1	Predstava-read	Predstava - branje	f
00030000-5602-a030-c86a-ab2b49dd88e1	Predstava-write	Predstava - spreminjanje	f
00030000-5602-a030-b09d-baca8ec6c6ab	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5602-a030-9778-83c52ae18bb3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5602-a030-22fc-86849c3bc22a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5602-a030-bf3c-b3932249da37	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5602-a030-32a8-4fc6f8173f8f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5602-a030-4c4e-a3c19c1d7589	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5602-a030-0fa7-d5f37fd1587f	ProgramDela-read	ProgramDela - branje	f
00030000-5602-a030-2222-e4581780cbfd	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5602-a030-9519-4f52be8a94ca	ProgramFestival-read	ProgramFestival - branje	f
00030000-5602-a030-e545-c0ec1507f11c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5602-a030-8f87-b937ba5e5b09	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5602-a030-104c-839f0e117bb2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5602-a030-d8c0-0007be836b3e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5602-a030-0c18-f4d73d7a0246	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5602-a030-2abc-f545af0a03cd	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5602-a030-3eff-0ea3efd1ba57	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5602-a030-3904-0fc2d9001afc	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5602-a030-9751-05d21642e590	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5602-a030-df35-df528938f58d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5602-a030-1aae-280c297ed426	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5602-a030-d5a9-8cbf457cf30e	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5602-a030-1b00-c6334611e7d7	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5602-a030-5ddb-bea7742b7522	ProgramRazno-read	ProgramRazno - branje	f
00030000-5602-a030-3c2f-6cc80faef3d5	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5602-a030-b792-d443752818d7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5602-a030-2e0e-3277cfeae783	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5602-a030-950f-7aec944dceed	Prostor-read	Prostor - branje	f
00030000-5602-a030-bf3c-3d6b44e1f009	Prostor-write	Prostor - spreminjanje	f
00030000-5602-a030-43ea-2b11ab061e1d	Racun-read	Racun - branje	f
00030000-5602-a030-f199-238ffd3f7921	Racun-write	Racun - spreminjanje	f
00030000-5602-a030-95dc-8836ed409741	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5602-a030-c008-e2d2a465f1bf	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5602-a030-47d5-218fae67807d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5602-a030-3fd9-249ade933e24	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5602-a030-1ea4-75da4609ddfb	Rekvizit-read	Rekvizit - branje	f
00030000-5602-a030-edd1-223d7ea23643	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5602-a030-a0cc-4ba67f2a60b7	Revizija-read	Revizija - branje	f
00030000-5602-a030-ce6a-1176d87844bc	Revizija-write	Revizija - spreminjanje	f
00030000-5602-a030-88b3-0436bcd46a26	Rezervacija-read	Rezervacija - branje	f
00030000-5602-a030-9907-f635afe3e8c3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5602-a030-cea0-4e8daec1afe9	SedezniRed-read	SedezniRed - branje	f
00030000-5602-a030-d174-ee0c6cfa2982	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5602-a030-6777-1bf0cd7bc7c8	Sedez-read	Sedez - branje	f
00030000-5602-a030-8ab3-f857c5e9c2f1	Sedez-write	Sedez - spreminjanje	f
00030000-5602-a030-9580-1c2175ef3e38	Sezona-read	Sezona - branje	f
00030000-5602-a030-3d56-87707a77620d	Sezona-write	Sezona - spreminjanje	f
00030000-5602-a030-bdca-f8185e299b9e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5602-a030-a09e-a551cae8c042	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5602-a030-6b7c-c9925ec54ba5	Stevilcenje-read	Stevilcenje - branje	f
00030000-5602-a030-9a4a-e0a2ff2a0c0f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5602-a030-7829-b95413321cf1	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5602-a030-1f56-c97ae693abba	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5602-a030-072d-9777e781043a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5602-a030-99d4-cbf52c8365ac	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5602-a030-cdbc-0a7d6fd011d4	Telefonska-read	Telefonska - branje	f
00030000-5602-a030-688e-4fd89eaad3a7	Telefonska-write	Telefonska - spreminjanje	f
00030000-5602-a030-605a-e41374f7cb13	TerminStoritve-read	TerminStoritve - branje	f
00030000-5602-a030-8bc3-3ba0292accf3	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5602-a030-faaa-acdcad6e6445	TipFunkcije-read	TipFunkcije - branje	f
00030000-5602-a030-b06b-917ceafbeddc	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5602-a030-3eb2-ad2092a6b197	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5602-a030-41b1-fd4f79e95223	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5602-a030-331d-3eb272cde8d0	Trr-read	Trr - branje	f
00030000-5602-a030-3ed1-b81aa5fec589	Trr-write	Trr - spreminjanje	f
00030000-5602-a030-899f-85775bcce5b3	Uprizoritev-read	Uprizoritev - branje	f
00030000-5602-a030-abbd-9988712d95e8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5602-a030-b9c3-7862d2bcd31d	Vaja-read	Vaja - branje	f
00030000-5602-a030-f81f-b4baec13680f	Vaja-write	Vaja - spreminjanje	f
00030000-5602-a030-fe1f-6e579cf218c0	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5602-a030-cd6d-7cf7884b93d1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5602-a030-8bca-3cfc52bb81bb	VrstaStroska-read	VrstaStroska - branje	f
00030000-5602-a030-fba4-8592ae325724	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5602-a030-2e9b-64749a8e154d	Zaposlitev-read	Zaposlitev - branje	f
00030000-5602-a030-7b54-eec562f3663d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5602-a030-a448-0d0f69563cf6	Zasedenost-read	Zasedenost - branje	f
00030000-5602-a030-bdb8-631e5f21e9f3	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5602-a030-ba67-a8c14cf39f72	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5602-a030-382b-6b20bd45a790	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5602-a030-18eb-22f1a5a04389	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5602-a030-0bec-213d1daf32cb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5602-a030-3f72-32c37e77e5c9	Job-read	Branje opravil - samo zase - branje	f
00030000-5602-a030-bf6f-e0e6917661ea	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5602-a030-b8ae-316e28958089	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5602-a030-4b78-dd356631dcfd	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5602-a030-0779-57e9409a87e9	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5602-a030-2aab-163e35fb1b6a	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5602-a030-cfeb-66d24a4b3778	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5602-a030-85a2-61f0bede4643	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-a030-c6fa-bb1e8d4d910f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-a030-5c24-7bf741dba579	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-a030-536a-bc4e3a4e29e2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-a030-c767-56b0ad405d60	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5602-a030-1c9b-654de749ea9b	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5602-a030-cfed-d9394d0320e0	Datoteka-write	Datoteka - spreminjanje	f
00030000-5602-a030-43a3-38a853581d18	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2973 (class 0 OID 20558402)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5602-a030-56fc-fd4a6df67fde	00030000-5602-a030-65b8-2c1b33a5840e
00020000-5602-a030-5fac-b11c849a0628	00030000-5602-a030-a40c-f807aa9e0200
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-37d8-813f99f933f2
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-49b9-9c65a8900927
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-e7b1-64116c4887c6
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-3b29-6c354d7660b5
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-2239-7083d774dc4c
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-f26d-98f03cb8f578
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-d59a-c8788e4b3b3c
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-1b3e-c35ffb2d3c5b
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-a40c-f807aa9e0200
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-9f08-2048916950ea
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-cd65-2301a8adba1b
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-1196-c6d8f4bb9441
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-47a6-5b862aa35478
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-b000-f742adc4cd3d
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-fb60-533eff2888ad
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-a016-67efc18de34d
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-b5eb-35f022d09d81
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-edc4-f0c370518e4d
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-db6f-95570f5bb0ca
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-5111-ea026c2e25b6
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-d1ea-61dda324ff0d
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-22f4-74ae5f4bd37a
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-ebea-d1f91f6f6920
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-d007-c3682bfb1c60
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-a3af-312d5af021c5
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-33d6-2c1bcf452634
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-fa99-5bc134203f0c
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-68a2-ca7b6033f5dc
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-9dbe-b7d5d45e01c1
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-c86a-ab2b49dd88e1
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-32a8-4fc6f8173f8f
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-4c4e-a3c19c1d7589
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-950f-7aec944dceed
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-bf3c-3d6b44e1f009
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-47d5-218fae67807d
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-3fd9-249ade933e24
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-1ea4-75da4609ddfb
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-edd1-223d7ea23643
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-9580-1c2175ef3e38
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-3d56-87707a77620d
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-faaa-acdcad6e6445
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-899f-85775bcce5b3
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-abbd-9988712d95e8
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-b9c3-7862d2bcd31d
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-f81f-b4baec13680f
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-a448-0d0f69563cf6
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-bdb8-631e5f21e9f3
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-ba67-a8c14cf39f72
00020000-5602-a031-497f-718f84bb3ec3	00030000-5602-a030-18eb-22f1a5a04389
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-37d8-813f99f933f2
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-2239-7083d774dc4c
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-f26d-98f03cb8f578
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-a40c-f807aa9e0200
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-47a6-5b862aa35478
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-fb60-533eff2888ad
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-b5eb-35f022d09d81
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-edc4-f0c370518e4d
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-db6f-95570f5bb0ca
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-5111-ea026c2e25b6
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-d1ea-61dda324ff0d
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-22f4-74ae5f4bd37a
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-ebea-d1f91f6f6920
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-a3af-312d5af021c5
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-fa99-5bc134203f0c
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-68a2-ca7b6033f5dc
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-9dbe-b7d5d45e01c1
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-950f-7aec944dceed
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-47d5-218fae67807d
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-1ea4-75da4609ddfb
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-9580-1c2175ef3e38
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-cdbc-0a7d6fd011d4
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-688e-4fd89eaad3a7
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-331d-3eb272cde8d0
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-3ed1-b81aa5fec589
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-2e9b-64749a8e154d
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-7b54-eec562f3663d
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-ba67-a8c14cf39f72
00020000-5602-a031-596b-1a432fbe13f2	00030000-5602-a030-18eb-22f1a5a04389
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-37d8-813f99f933f2
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-e7b1-64116c4887c6
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-2239-7083d774dc4c
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-b1e5-b50cbae1dde8
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-002b-96790c8fedc2
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-4092-ed25a50a618a
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-f26d-98f03cb8f578
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-a40c-f807aa9e0200
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-cd65-2301a8adba1b
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-47a6-5b862aa35478
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-fb60-533eff2888ad
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-b5eb-35f022d09d81
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-db6f-95570f5bb0ca
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-5111-ea026c2e25b6
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-d1ea-61dda324ff0d
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-ebea-d1f91f6f6920
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-a3af-312d5af021c5
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-9dbe-b7d5d45e01c1
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-32a8-4fc6f8173f8f
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-950f-7aec944dceed
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-47d5-218fae67807d
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-1ea4-75da4609ddfb
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-9580-1c2175ef3e38
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-faaa-acdcad6e6445
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-b9c3-7862d2bcd31d
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-a448-0d0f69563cf6
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-ba67-a8c14cf39f72
00020000-5602-a031-66bf-d712580bcbdd	00030000-5602-a030-18eb-22f1a5a04389
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-37d8-813f99f933f2
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-49b9-9c65a8900927
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-3b29-6c354d7660b5
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-2239-7083d774dc4c
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-f26d-98f03cb8f578
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-a40c-f807aa9e0200
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-47a6-5b862aa35478
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-fb60-533eff2888ad
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-db6f-95570f5bb0ca
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-5111-ea026c2e25b6
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-ebea-d1f91f6f6920
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-a3af-312d5af021c5
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-9dbe-b7d5d45e01c1
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-950f-7aec944dceed
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-47d5-218fae67807d
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-1ea4-75da4609ddfb
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-9580-1c2175ef3e38
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-faaa-acdcad6e6445
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-ba67-a8c14cf39f72
00020000-5602-a031-287d-fd2c83d92470	00030000-5602-a030-18eb-22f1a5a04389
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-37d8-813f99f933f2
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-2239-7083d774dc4c
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-f26d-98f03cb8f578
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-a40c-f807aa9e0200
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-47a6-5b862aa35478
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-fb60-533eff2888ad
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-db6f-95570f5bb0ca
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-5111-ea026c2e25b6
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-ebea-d1f91f6f6920
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-a3af-312d5af021c5
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-9dbe-b7d5d45e01c1
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-950f-7aec944dceed
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-47d5-218fae67807d
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-1ea4-75da4609ddfb
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-9580-1c2175ef3e38
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-605a-e41374f7cb13
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-b81b-a15f5ecb7166
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-faaa-acdcad6e6445
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-ba67-a8c14cf39f72
00020000-5602-a031-4950-46d3d5c871c0	00030000-5602-a030-18eb-22f1a5a04389
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-4097-8a1ef04f10cb
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-65b8-2c1b33a5840e
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b81b-a15f5ecb7166
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-d59a-c8788e4b3b3c
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-45e0-b52af2233131
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9df7-01b718c31ac4
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-bbaf-6ee8160cd68c
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-37d8-813f99f933f2
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-49b9-9c65a8900927
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-e7b1-64116c4887c6
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3b29-6c354d7660b5
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-2239-7083d774dc4c
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b1e5-b50cbae1dde8
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-002b-96790c8fedc2
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9610-a8c337d45c9d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-4092-ed25a50a618a
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-363e-c8c8fff5256c
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-f26d-98f03cb8f578
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-1b3e-c35ffb2d3c5b
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-a40c-f807aa9e0200
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9f08-2048916950ea
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-f96c-369707aa4c39
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-8299-6221b1c0c87b
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-ad0b-62d88cade2eb
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-ed1a-15259e5047d2
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-cd65-2301a8adba1b
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-1196-c6d8f4bb9441
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-47a6-5b862aa35478
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b000-f742adc4cd3d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-fb60-533eff2888ad
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-a016-67efc18de34d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b5eb-35f022d09d81
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-edc4-f0c370518e4d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-6c62-0ee7e490a851
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-97f8-72595fc51e4c
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-17d5-81984c053715
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-aa5b-f2e47b516882
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-db6f-95570f5bb0ca
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b392-012d8fc2a4cf
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-5111-ea026c2e25b6
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b7b8-e70d3a0fb14d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-d1ea-61dda324ff0d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-22f4-74ae5f4bd37a
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-7166-c6476ffc3c39
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-7dbf-04fd62d5a655
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-cc21-1d80c08c36b1
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-4ed0-13e5847f8ab4
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b311-5a569c86e71f
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-cc67-e76a0466841d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-ebea-d1f91f6f6920
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-d007-c3682bfb1c60
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-a3af-312d5af021c5
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-33d6-2c1bcf452634
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-fb11-3a99d8d0ed87
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-d185-809952b98665
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-8702-dc3ed6df77a1
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-cd78-39e7f8654f82
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-fa99-5bc134203f0c
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-68a2-ca7b6033f5dc
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9dbe-b7d5d45e01c1
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-c86a-ab2b49dd88e1
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b09d-baca8ec6c6ab
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9778-83c52ae18bb3
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-22fc-86849c3bc22a
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-bf3c-b3932249da37
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-32a8-4fc6f8173f8f
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-4c4e-a3c19c1d7589
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-0fa7-d5f37fd1587f
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-2222-e4581780cbfd
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9519-4f52be8a94ca
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-e545-c0ec1507f11c
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-8f87-b937ba5e5b09
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-104c-839f0e117bb2
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-d8c0-0007be836b3e
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-0c18-f4d73d7a0246
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-2abc-f545af0a03cd
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3eff-0ea3efd1ba57
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3904-0fc2d9001afc
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9751-05d21642e590
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-df35-df528938f58d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-1aae-280c297ed426
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-d5a9-8cbf457cf30e
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-1b00-c6334611e7d7
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-5ddb-bea7742b7522
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3c2f-6cc80faef3d5
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b792-d443752818d7
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-2e0e-3277cfeae783
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-950f-7aec944dceed
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-bf3c-3d6b44e1f009
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-43ea-2b11ab061e1d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-f199-238ffd3f7921
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-95dc-8836ed409741
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-c008-e2d2a465f1bf
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-47d5-218fae67807d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3fd9-249ade933e24
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-1ea4-75da4609ddfb
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-edd1-223d7ea23643
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-a0cc-4ba67f2a60b7
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-ce6a-1176d87844bc
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-88b3-0436bcd46a26
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9907-f635afe3e8c3
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-cea0-4e8daec1afe9
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-d174-ee0c6cfa2982
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-6777-1bf0cd7bc7c8
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-8ab3-f857c5e9c2f1
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9580-1c2175ef3e38
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3d56-87707a77620d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-bdca-f8185e299b9e
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-a09e-a551cae8c042
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-6b7c-c9925ec54ba5
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-9a4a-e0a2ff2a0c0f
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-7829-b95413321cf1
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-1f56-c97ae693abba
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-072d-9777e781043a
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-99d4-cbf52c8365ac
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-cdbc-0a7d6fd011d4
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-688e-4fd89eaad3a7
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-605a-e41374f7cb13
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-8bc3-3ba0292accf3
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-faaa-acdcad6e6445
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b06b-917ceafbeddc
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3eb2-ad2092a6b197
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-41b1-fd4f79e95223
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-331d-3eb272cde8d0
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-3ed1-b81aa5fec589
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-899f-85775bcce5b3
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-abbd-9988712d95e8
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-b9c3-7862d2bcd31d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-f81f-b4baec13680f
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-fe1f-6e579cf218c0
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-cd6d-7cf7884b93d1
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-8bca-3cfc52bb81bb
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-fba4-8592ae325724
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-2e9b-64749a8e154d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-7b54-eec562f3663d
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-a448-0d0f69563cf6
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-bdb8-631e5f21e9f3
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-ba67-a8c14cf39f72
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-382b-6b20bd45a790
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-18eb-22f1a5a04389
00020000-5602-a032-e886-1da15ef43186	00030000-5602-a030-0bec-213d1daf32cb
\.


--
-- TOC entry 3002 (class 0 OID 20558727)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 20558761)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20558897)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5602-a032-1602-3717cfc3521f	00090000-5602-a032-e0b5-7abc66752ab4	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5602-a032-9511-60b4cb955783	00090000-5602-a032-2795-af965bd6183a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5602-a032-f4a5-19d50079d772	00090000-5602-a032-0e71-945975c3c21d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5602-a032-6315-06e5304dfbf1	00090000-5602-a032-c782-d8522b976a16	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2978 (class 0 OID 20558462)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5602-a032-ba91-155a6c8b8576	00040000-5602-a030-d06c-ade25fe24e45	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a032-87ac-5d730507dbf1	00040000-5602-a030-d06c-ade25fe24e45	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5602-a032-83cd-fbcebf0e3666	00040000-5602-a030-d06c-ade25fe24e45	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a032-6eef-663ee7c3cb82	00040000-5602-a030-d06c-ade25fe24e45	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a032-6057-db036b8d7db4	00040000-5602-a030-d06c-ade25fe24e45	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a032-4a7a-88cb5eb16f98	00040000-5602-a030-5f7a-a3a9827330c2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a032-b665-e75d6de4d42c	00040000-5602-a030-1eb8-ea47c6dfeb62	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a032-b5bf-447ab23e333d	00040000-5602-a030-2be3-23d677ff3f7a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a032-53ae-1cf6dcf31eee	00040000-5602-a030-9e21-1260e46ac33e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-a033-6bd3-451815287c94	00040000-5602-a030-d06c-ade25fe24e45	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2980 (class 0 OID 20558496)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5602-a030-dfeb-122b9bd8d347	8341	Adlešiči
00050000-5602-a030-997a-4ce889876929	5270	Ajdovščina
00050000-5602-a030-94a6-8c85d87689a8	6280	Ankaran/Ancarano
00050000-5602-a030-23a3-34cb1bdc507c	9253	Apače
00050000-5602-a030-7860-85a01bda9c2f	8253	Artiče
00050000-5602-a030-ced5-7fac1c1c8981	4275	Begunje na Gorenjskem
00050000-5602-a030-a4c0-af72ac8d54fa	1382	Begunje pri Cerknici
00050000-5602-a030-8ed1-83215a00783f	9231	Beltinci
00050000-5602-a030-add2-b16af8019611	2234	Benedikt
00050000-5602-a030-ce74-6f07904b03d7	2345	Bistrica ob Dravi
00050000-5602-a030-8045-85615d5af402	3256	Bistrica ob Sotli
00050000-5602-a030-f0ae-ad91b0c1322c	8259	Bizeljsko
00050000-5602-a030-094f-84001339ea90	1223	Blagovica
00050000-5602-a030-48c8-d86b4e76bf80	8283	Blanca
00050000-5602-a030-635b-dbf355b452f7	4260	Bled
00050000-5602-a030-fcd0-8a738665f392	4273	Blejska Dobrava
00050000-5602-a030-c671-ee89cc961e0b	9265	Bodonci
00050000-5602-a030-aa17-f8e3c67c4498	9222	Bogojina
00050000-5602-a030-43b5-743b3c95641e	4263	Bohinjska Bela
00050000-5602-a030-45f6-40efc85b3e11	4264	Bohinjska Bistrica
00050000-5602-a030-6188-65db58a62fd7	4265	Bohinjsko jezero
00050000-5602-a030-02d2-9fe605b71e29	1353	Borovnica
00050000-5602-a030-1f5e-414dfd4e31d1	8294	Boštanj
00050000-5602-a030-5d98-695dbe7ba7f5	5230	Bovec
00050000-5602-a030-f289-743ca97edf61	5295	Branik
00050000-5602-a030-93c9-d6ae01ce9b85	3314	Braslovče
00050000-5602-a030-3cce-b56f21a43270	5223	Breginj
00050000-5602-a030-d985-cb58c865725f	8280	Brestanica
00050000-5602-a030-3d0e-a1c0801d7a06	2354	Bresternica
00050000-5602-a030-47b2-cac35aaeb233	4243	Brezje
00050000-5602-a030-0657-f03dc5c82951	1351	Brezovica pri Ljubljani
00050000-5602-a030-b470-cc07d1c9c597	8250	Brežice
00050000-5602-a030-8c4a-76bcfdc1a6e8	4210	Brnik - Aerodrom
00050000-5602-a030-8fe4-83485a9df6cf	8321	Brusnice
00050000-5602-a030-54c2-162333c62011	3255	Buče
00050000-5602-a030-c144-1e482ca75618	8276	Bučka 
00050000-5602-a030-58c4-3c84f148de3c	9261	Cankova
00050000-5602-a030-5f27-cabad684cca8	3000	Celje 
00050000-5602-a030-d2c2-8dd1de4513e4	3001	Celje - poštni predali
00050000-5602-a030-1b17-8f55cd5a0e3c	4207	Cerklje na Gorenjskem
00050000-5602-a030-f8b0-acda4f3ade7d	8263	Cerklje ob Krki
00050000-5602-a030-30cb-a9df87183db4	1380	Cerknica
00050000-5602-a030-fb84-14354d682d42	5282	Cerkno
00050000-5602-a030-ade9-b930c5b95ea6	2236	Cerkvenjak
00050000-5602-a030-f66c-79db8691966e	2215	Ceršak
00050000-5602-a030-c6e7-0805bddf46a9	2326	Cirkovce
00050000-5602-a030-1abb-44f106a5e142	2282	Cirkulane
00050000-5602-a030-8a3a-6be5aeb24b27	5273	Col
00050000-5602-a030-cb1d-23f0fdd9af5e	8251	Čatež ob Savi
00050000-5602-a030-1986-f6e4043f990f	1413	Čemšenik
00050000-5602-a030-e10a-b018ff65d80f	5253	Čepovan
00050000-5602-a030-f3c7-1c0a8f92e484	9232	Črenšovci
00050000-5602-a030-491f-d87c51717aed	2393	Črna na Koroškem
00050000-5602-a030-9f8d-08c77ed11dc6	6275	Črni Kal
00050000-5602-a030-67a8-cf7947a1d7f8	5274	Črni Vrh nad Idrijo
00050000-5602-a030-e5c4-485e641761e3	5262	Črniče
00050000-5602-a030-ae8a-6baa8673f759	8340	Črnomelj
00050000-5602-a030-4883-f20ccf99fec4	6271	Dekani
00050000-5602-a030-4b1a-335b9f266dd5	5210	Deskle
00050000-5602-a030-2d7f-340370051b1f	2253	Destrnik
00050000-5602-a030-4a5c-49b4cab9e554	6215	Divača
00050000-5602-a030-c1f9-c2fc0219c535	1233	Dob
00050000-5602-a030-390c-1ed45f39d4b4	3224	Dobje pri Planini
00050000-5602-a030-51ad-ca3c34c8370e	8257	Dobova
00050000-5602-a030-ab49-17d14199eef1	1423	Dobovec
00050000-5602-a030-7669-6123262d33b3	5263	Dobravlje
00050000-5602-a030-6516-ef59f2e1a7ff	3204	Dobrna
00050000-5602-a030-155d-8ee21a74f212	8211	Dobrnič
00050000-5602-a030-495d-a42fcb1f64a1	1356	Dobrova
00050000-5602-a030-0d42-aedb96985778	9223	Dobrovnik/Dobronak 
00050000-5602-a030-7e77-d6aed32b6602	5212	Dobrovo v Brdih
00050000-5602-a030-a3a1-8f8f91432bcf	1431	Dol pri Hrastniku
00050000-5602-a030-515b-19b0a0035259	1262	Dol pri Ljubljani
00050000-5602-a030-7d11-54adb1417496	1273	Dole pri Litiji
00050000-5602-a030-dd6d-eca80a4419a8	1331	Dolenja vas
00050000-5602-a030-ed4f-d51f52dcd904	8350	Dolenjske Toplice
00050000-5602-a030-a0d4-74ba15ecafca	1230	Domžale
00050000-5602-a030-14b9-2afa5c334467	2252	Dornava
00050000-5602-a030-77ae-5e3a58de995a	5294	Dornberk
00050000-5602-a030-1266-bb94c13a4e5a	1319	Draga
00050000-5602-a030-0352-e14359698a7d	8343	Dragatuš
00050000-5602-a030-c711-06f6597f8f90	3222	Dramlje
00050000-5602-a030-1d98-b297b880dda6	2370	Dravograd
00050000-5602-a030-8323-af36bc33984e	4203	Duplje
00050000-5602-a030-a4ea-d425de78142e	6221	Dutovlje
00050000-5602-a030-ab1d-da7e17e66b77	8361	Dvor
00050000-5602-a030-d41f-d7e31d710d89	2343	Fala
00050000-5602-a030-35e7-75b171f47200	9208	Fokovci
00050000-5602-a030-abdb-9edd395e3999	2313	Fram
00050000-5602-a030-7d79-e08ba09fd492	3213	Frankolovo
00050000-5602-a030-510d-65828ea1d501	1274	Gabrovka
00050000-5602-a030-4d94-74e3af4b79c7	8254	Globoko
00050000-5602-a030-53b0-d3db05b8ba19	5275	Godovič
00050000-5602-a030-a4f4-3207c1df5755	4204	Golnik
00050000-5602-a030-8486-d05f9835c91b	3303	Gomilsko
00050000-5602-a030-e4a8-de3f2ec0ca02	4224	Gorenja vas
00050000-5602-a030-edcf-cdb3e819206b	3263	Gorica pri Slivnici
00050000-5602-a030-edaf-b3a226a98e1b	2272	Gorišnica
00050000-5602-a030-e04c-10bb31914cf0	9250	Gornja Radgona
00050000-5602-a030-d91b-fe3c6fdc7187	3342	Gornji Grad
00050000-5602-a030-f239-13414421ca21	4282	Gozd Martuljek
00050000-5602-a030-81b1-6ae616be602a	6272	Gračišče
00050000-5602-a030-8292-95b6212dd5ea	9264	Grad
00050000-5602-a030-d368-9defc250c9fd	8332	Gradac
00050000-5602-a030-9e2a-34a3103afdc6	1384	Grahovo
00050000-5602-a030-5c2b-9edbab6de49f	5242	Grahovo ob Bači
00050000-5602-a030-3d97-1d5eb77f9abe	5251	Grgar
00050000-5602-a030-32a9-d57bcc1cbd37	3302	Griže
00050000-5602-a030-df83-25795fce115e	3231	Grobelno
00050000-5602-a030-a539-fdf95b87852a	1290	Grosuplje
00050000-5602-a030-48b6-afd251906c38	2288	Hajdina
00050000-5602-a030-a091-d5b5f5f0489e	8362	Hinje
00050000-5602-a030-8798-23ac48a0cf5c	2311	Hoče
00050000-5602-a030-a8ac-ad1854499e0c	9205	Hodoš/Hodos
00050000-5602-a030-3b82-8a7820991746	1354	Horjul
00050000-5602-a030-0194-17bba57393a0	1372	Hotedršica
00050000-5602-a030-3961-3bca490fa803	1430	Hrastnik
00050000-5602-a030-0c02-b62cfc314da8	6225	Hruševje
00050000-5602-a030-67c9-74a844cf408b	4276	Hrušica
00050000-5602-a030-a72a-af85b74a244c	5280	Idrija
00050000-5602-a030-13c0-a7347e333410	1292	Ig
00050000-5602-a030-e12c-3d219c676b3d	6250	Ilirska Bistrica
00050000-5602-a030-4ad9-991bab8834d4	6251	Ilirska Bistrica-Trnovo
00050000-5602-a030-ea7b-db56eab9b7cb	1295	Ivančna Gorica
00050000-5602-a030-2f11-8263f9e47927	2259	Ivanjkovci
00050000-5602-a030-ad8d-305bd50316ef	1411	Izlake
00050000-5602-a030-e655-253cc930c429	6310	Izola/Isola
00050000-5602-a030-8670-297bee437c7a	2222	Jakobski Dol
00050000-5602-a030-4f0b-e303b20df32a	2221	Jarenina
00050000-5602-a030-e012-b1c87e451b3f	6254	Jelšane
00050000-5602-a030-a56d-35ede79d6056	4270	Jesenice
00050000-5602-a030-69d6-235826de7124	8261	Jesenice na Dolenjskem
00050000-5602-a030-33ee-e2689fca5503	3273	Jurklošter
00050000-5602-a030-0e46-be8dd41f36da	2223	Jurovski Dol
00050000-5602-a030-9ab5-b0cc75a466e2	2256	Juršinci
00050000-5602-a030-7fdf-c7e40fe8f292	5214	Kal nad Kanalom
00050000-5602-a030-28e7-8d98e53f244a	3233	Kalobje
00050000-5602-a030-bc4d-0d6b78109fdf	4246	Kamna Gorica
00050000-5602-a030-0bcb-bd5cd32342ca	2351	Kamnica
00050000-5602-a030-0bef-8ee24d3ca7f8	1241	Kamnik
00050000-5602-a030-138d-22cadcc19892	5213	Kanal
00050000-5602-a030-5692-2bd82b6b5bb8	8258	Kapele
00050000-5602-a030-4fac-dc344853e7ea	2362	Kapla
00050000-5602-a030-0cfd-7a085fc1179e	2325	Kidričevo
00050000-5602-a030-4623-8f6430000806	1412	Kisovec
00050000-5602-a030-9c11-efb96af8d000	6253	Knežak
00050000-5602-a030-56c0-fde96585fa6c	5222	Kobarid
00050000-5602-a030-84ba-c619eaac6cac	9227	Kobilje
00050000-5602-a030-3a39-b706f967ecea	1330	Kočevje
00050000-5602-a030-d002-8e1860d28822	1338	Kočevska Reka
00050000-5602-a030-8ba9-428bd8e37b50	2276	Kog
00050000-5602-a030-8b61-7abc49062292	5211	Kojsko
00050000-5602-a030-be7f-134752b87365	6223	Komen
00050000-5602-a030-323b-0e19641ee0ff	1218	Komenda
00050000-5602-a030-564d-760a80e94525	6000	Koper/Capodistria 
00050000-5602-a030-3337-320a49b1f3ae	6001	Koper/Capodistria - poštni predali
00050000-5602-a030-de9b-4ff1c58eb066	8282	Koprivnica
00050000-5602-a030-58d2-e1ca2b5ac5ad	5296	Kostanjevica na Krasu
00050000-5602-a030-90f1-ae0ea6ae1a2c	8311	Kostanjevica na Krki
00050000-5602-a030-dd4f-4def077345b7	1336	Kostel
00050000-5602-a030-7c75-0c8f286da3b7	6256	Košana
00050000-5602-a030-dbe1-e6cff8927374	2394	Kotlje
00050000-5602-a030-9807-a2abc1579e40	6240	Kozina
00050000-5602-a030-daa1-9a157b29fd84	3260	Kozje
00050000-5602-a030-ade5-e102fdd8e0c1	4000	Kranj 
00050000-5602-a030-24e0-2e7daf64adfa	4001	Kranj - poštni predali
00050000-5602-a030-6d9e-595e9ac0f54e	4280	Kranjska Gora
00050000-5602-a030-0786-c0249d706ea0	1281	Kresnice
00050000-5602-a030-c35f-ba79007f2dd0	4294	Križe
00050000-5602-a030-a01c-588c2080045e	9206	Križevci
00050000-5602-a030-f16e-2710bf3073ec	9242	Križevci pri Ljutomeru
00050000-5602-a030-4c74-fb6f7e3b5e63	1301	Krka
00050000-5602-a030-4a9a-2ff8c3a1bf9f	8296	Krmelj
00050000-5602-a030-9ba4-113acd483f28	4245	Kropa
00050000-5602-a030-6d2d-ed76e241eb1a	8262	Krška vas
00050000-5602-a030-0c24-854c353c11ab	8270	Krško
00050000-5602-a030-bab8-ae3d62843267	9263	Kuzma
00050000-5602-a030-ed23-984e60e5acae	2318	Laporje
00050000-5602-a030-6200-986455e48562	3270	Laško
00050000-5602-a030-6275-f1237956c162	1219	Laze v Tuhinju
00050000-5602-a030-4bd1-bef54dea2279	2230	Lenart v Slovenskih goricah
00050000-5602-a030-d709-0c81d9f354ca	9220	Lendava/Lendva
00050000-5602-a030-502c-0438774e2085	4248	Lesce
00050000-5602-a030-2b1e-e747adbbf445	3261	Lesično
00050000-5602-a030-75ae-a175e6909456	8273	Leskovec pri Krškem
00050000-5602-a030-f3bc-4cc74ae173f8	2372	Libeliče
00050000-5602-a030-dc13-60ddf6ba5df3	2341	Limbuš
00050000-5602-a030-937e-7def52d9623d	1270	Litija
00050000-5602-a030-ca37-b26141c81010	3202	Ljubečna
00050000-5602-a030-aabf-2f7a3ccd3789	1000	Ljubljana 
00050000-5602-a030-e921-13fda29859a7	1001	Ljubljana - poštni predali
00050000-5602-a030-dff0-0ff37ab6422b	1231	Ljubljana - Črnuče
00050000-5602-a030-4a2f-dcc143a2a342	1261	Ljubljana - Dobrunje
00050000-5602-a030-1d41-122b5d9d3a41	1260	Ljubljana - Polje
00050000-5602-a030-9802-77f415b98ddd	1210	Ljubljana - Šentvid
00050000-5602-a030-4c28-0828997e7e6b	1211	Ljubljana - Šmartno
00050000-5602-a030-fa8f-2eded97c9c1f	3333	Ljubno ob Savinji
00050000-5602-a030-0fa3-7cb9c3119ba6	9240	Ljutomer
00050000-5602-a030-aab8-8c4cd34abc9f	3215	Loče
00050000-5602-a030-5f9d-169ecea7c458	5231	Log pod Mangartom
00050000-5602-a030-58ea-dfad0dca2f0a	1358	Log pri Brezovici
00050000-5602-a030-5b07-17539582d1d6	1370	Logatec
00050000-5602-a030-5903-ccbafa1f6929	1371	Logatec
00050000-5602-a030-d7c6-82387ff87962	1434	Loka pri Zidanem Mostu
00050000-5602-a030-e835-3706d3c94904	3223	Loka pri Žusmu
00050000-5602-a030-11c0-4f2539454062	6219	Lokev
00050000-5602-a030-6b5e-990f06a1b0a2	1318	Loški Potok
00050000-5602-a030-8180-0c1053b1b589	2324	Lovrenc na Dravskem polju
00050000-5602-a030-6f30-3701cdb7fcfc	2344	Lovrenc na Pohorju
00050000-5602-a030-e3c5-a14cdeb7daaa	3334	Luče
00050000-5602-a030-04f6-a36a86c55775	1225	Lukovica
00050000-5602-a030-7a61-acdad9eaeb4c	9202	Mačkovci
00050000-5602-a030-9c4f-12c491d6abb3	2322	Majšperk
00050000-5602-a030-85ed-5c54f3cc50bc	2321	Makole
00050000-5602-a030-f7b2-bc2a30cf8141	9243	Mala Nedelja
00050000-5602-a030-504a-0be5a04cb43a	2229	Malečnik
00050000-5602-a030-fbfe-04bf4a701b3b	6273	Marezige
00050000-5602-a030-6032-a001920b46e9	2000	Maribor 
00050000-5602-a030-ed45-b255248451fc	2001	Maribor - poštni predali
00050000-5602-a030-f1d3-03c908f24072	2206	Marjeta na Dravskem polju
00050000-5602-a030-90d5-093f4fd00663	2281	Markovci
00050000-5602-a030-9e16-af21232bc45f	9221	Martjanci
00050000-5602-a030-7f86-64b69695c4ee	6242	Materija
00050000-5602-a030-b29e-5ee17ce71006	4211	Mavčiče
00050000-5602-a030-3dce-16d812ad7d36	1215	Medvode
00050000-5602-a030-c554-659520990718	1234	Mengeš
00050000-5602-a030-e3a0-b8625332ac53	8330	Metlika
00050000-5602-a030-9f77-9dc0f296b6a6	2392	Mežica
00050000-5602-a030-c23c-879fca449af9	2204	Miklavž na Dravskem polju
00050000-5602-a030-543b-dba9ae26ad2f	2275	Miklavž pri Ormožu
00050000-5602-a030-e8ac-7bc43d24f497	5291	Miren
00050000-5602-a030-0faf-3e7c71b15460	8233	Mirna
00050000-5602-a030-9b3e-533f14b71044	8216	Mirna Peč
00050000-5602-a030-ad41-456698c0416c	2382	Mislinja
00050000-5602-a030-640a-725dda81479a	4281	Mojstrana
00050000-5602-a030-cdd6-a884158bf6a4	8230	Mokronog
00050000-5602-a030-fae1-64183a37713e	1251	Moravče
00050000-5602-a030-add9-718989c9c13b	9226	Moravske Toplice
00050000-5602-a030-0576-719842d7c910	5216	Most na Soči
00050000-5602-a030-8122-1bf8ef4931e9	1221	Motnik
00050000-5602-a030-00dd-e36a2ff840a3	3330	Mozirje
00050000-5602-a030-b429-ac8d21bbe296	9000	Murska Sobota 
00050000-5602-a030-ed72-ffe72a118d36	9001	Murska Sobota - poštni predali
00050000-5602-a030-22ff-20a1ccd3a0bf	2366	Muta
00050000-5602-a030-26be-ab2d86bc5b57	4202	Naklo
00050000-5602-a030-001b-49324c54cc55	3331	Nazarje
00050000-5602-a030-94fe-23f2b289fc92	1357	Notranje Gorice
00050000-5602-a030-c243-c9cd0ed89259	3203	Nova Cerkev
00050000-5602-a030-98c9-7019d749b4b3	5000	Nova Gorica 
00050000-5602-a030-4012-c0fd76adf5f8	5001	Nova Gorica - poštni predali
00050000-5602-a030-1f46-8e4cdb820d97	1385	Nova vas
00050000-5602-a030-bcb8-f7f519cb1ccf	8000	Novo mesto
00050000-5602-a030-6c42-52ba8fd7658f	8001	Novo mesto - poštni predali
00050000-5602-a030-3ce8-a2cddc7088e5	6243	Obrov
00050000-5602-a030-25ae-a34ce5f14bcb	9233	Odranci
00050000-5602-a030-bee6-5d20289abaa9	2317	Oplotnica
00050000-5602-a030-4ba5-15f0466e13dd	2312	Orehova vas
00050000-5602-a030-6e05-cce0bca666ef	2270	Ormož
00050000-5602-a030-2cdf-39ae5122bdba	1316	Ortnek
00050000-5602-a030-a574-f6df3611cc32	1337	Osilnica
00050000-5602-a030-2ae9-0e2b6439eecf	8222	Otočec
00050000-5602-a030-e9eb-82a7ce1a394c	2361	Ožbalt
00050000-5602-a030-6745-a9cae3681b29	2231	Pernica
00050000-5602-a030-926e-498a86954ac7	2211	Pesnica pri Mariboru
00050000-5602-a030-0d47-04482b44cb1f	9203	Petrovci
00050000-5602-a030-ea04-c139de8813c1	3301	Petrovče
00050000-5602-a030-9fd5-efe89c24552f	6330	Piran/Pirano
00050000-5602-a030-fcd7-19bf85012a46	8255	Pišece
00050000-5602-a030-c8d7-1bfa9d83748e	6257	Pivka
00050000-5602-a030-bf00-4a8102df9cf1	6232	Planina
00050000-5602-a030-d8e0-968f332db8da	3225	Planina pri Sevnici
00050000-5602-a030-2ca4-e45cb075f254	6276	Pobegi
00050000-5602-a030-f5a3-cc9f4a773b23	8312	Podbočje
00050000-5602-a030-2405-879604b76c83	5243	Podbrdo
00050000-5602-a030-082a-8c277d5b04d0	3254	Podčetrtek
00050000-5602-a030-14b3-03d28d3ca9b9	2273	Podgorci
00050000-5602-a030-97f3-bb36ea03d219	6216	Podgorje
00050000-5602-a030-3cc7-9076bc3291e9	2381	Podgorje pri Slovenj Gradcu
00050000-5602-a030-332e-41ac76f46799	6244	Podgrad
00050000-5602-a030-46a7-c7be26392471	1414	Podkum
00050000-5602-a030-de02-f21e51d9a90b	2286	Podlehnik
00050000-5602-a030-8d82-f1dd7731a699	5272	Podnanos
00050000-5602-a030-318e-48648e65d0d3	4244	Podnart
00050000-5602-a030-5d00-92ed078519ba	3241	Podplat
00050000-5602-a030-7033-199736e94aa5	3257	Podsreda
00050000-5602-a030-a6b2-2a105196ea44	2363	Podvelka
00050000-5602-a030-52b5-78ec1eda9bfa	2208	Pohorje
00050000-5602-a030-09f8-60050089c291	2257	Polenšak
00050000-5602-a030-bcc4-6ad30001cc5e	1355	Polhov Gradec
00050000-5602-a030-e035-a118c646b60a	4223	Poljane nad Škofjo Loko
00050000-5602-a030-ce3c-4a224b7e5754	2319	Poljčane
00050000-5602-a030-d5d7-158f14526c7e	1272	Polšnik
00050000-5602-a030-ccd1-0865919c7aa2	3313	Polzela
00050000-5602-a030-275c-f7128561821e	3232	Ponikva
00050000-5602-a030-3552-a7318f4eb75c	6320	Portorož/Portorose
00050000-5602-a030-ad74-c1564c0dce29	6230	Postojna
00050000-5602-a030-049f-6b90623a2482	2331	Pragersko
00050000-5602-a030-2a39-7059721ad42b	3312	Prebold
00050000-5602-a030-fccf-040693402ede	4205	Preddvor
00050000-5602-a030-13ae-ec7263e5f3fb	6255	Prem
00050000-5602-a030-349d-1be82890b94d	1352	Preserje
00050000-5602-a030-c9d7-d4154f0e4bed	6258	Prestranek
00050000-5602-a030-b3c5-bdb320abd6e0	2391	Prevalje
00050000-5602-a030-47c5-410bdc9174c6	3262	Prevorje
00050000-5602-a030-9150-df7e3ebb1e2b	1276	Primskovo 
00050000-5602-a030-6afb-a73667ca19bd	3253	Pristava pri Mestinju
00050000-5602-a030-0e4d-d7445e19ed30	9207	Prosenjakovci/Partosfalva
00050000-5602-a030-84bf-2d73a77c7cad	5297	Prvačina
00050000-5602-a030-9838-d9b06ef22e99	2250	Ptuj
00050000-5602-a030-c66f-e6350850c4a0	2323	Ptujska Gora
00050000-5602-a030-c494-ac6bed9ca1b5	9201	Puconci
00050000-5602-a030-44cb-160117234a0a	2327	Rače
00050000-5602-a030-174e-90a60703aa41	1433	Radeče
00050000-5602-a030-b61c-5b78e25af941	9252	Radenci
00050000-5602-a030-b1d2-9964c6cf799e	2360	Radlje ob Dravi
00050000-5602-a030-9047-3aa9def0a9f9	1235	Radomlje
00050000-5602-a030-3ebd-4539a705f85d	4240	Radovljica
00050000-5602-a030-8c12-c039fc6855dd	8274	Raka
00050000-5602-a030-3cc3-cd20e5a13880	1381	Rakek
00050000-5602-a030-5dc6-7a8c4178f365	4283	Rateče - Planica
00050000-5602-a030-f98c-8cd38e172d00	2390	Ravne na Koroškem
00050000-5602-a030-f6fc-7df907c5e935	9246	Razkrižje
00050000-5602-a030-1f19-39c57a6cc3b8	3332	Rečica ob Savinji
00050000-5602-a030-9b2f-5d9df3d0446c	5292	Renče
00050000-5602-a030-5bf0-55a2055f3b55	1310	Ribnica
00050000-5602-a030-61d4-6703e52809b2	2364	Ribnica na Pohorju
00050000-5602-a030-98e9-0ab113f0cd7e	3272	Rimske Toplice
00050000-5602-a030-8ff9-f30035ffec57	1314	Rob
00050000-5602-a030-dd1b-09b44f66c2eb	5215	Ročinj
00050000-5602-a030-8b3f-acca7db144ec	3250	Rogaška Slatina
00050000-5602-a030-8cac-b379fd2abe92	9262	Rogašovci
00050000-5602-a030-95cd-dc2d1af89f71	3252	Rogatec
00050000-5602-a030-b54b-46271808c970	1373	Rovte
00050000-5602-a030-0049-459f8619f626	2342	Ruše
00050000-5602-a030-c17e-e8411c944dd4	1282	Sava
00050000-5602-a030-dd4d-e705f0c7c1ce	6333	Sečovlje/Sicciole
00050000-5602-a030-8446-afd27f434865	4227	Selca
00050000-5602-a030-8eed-55e03c1b274a	2352	Selnica ob Dravi
00050000-5602-a030-ee85-63d355bd86f4	8333	Semič
00050000-5602-a030-3b6f-7ebbac844542	8281	Senovo
00050000-5602-a030-7d05-b2f42b7ca4b6	6224	Senožeče
00050000-5602-a030-5139-68ea69083260	8290	Sevnica
00050000-5602-a030-7c8b-01ff468496d2	6210	Sežana
00050000-5602-a030-3bc1-65312076da3d	2214	Sladki Vrh
00050000-5602-a030-8915-9b1e61fba46e	5283	Slap ob Idrijci
00050000-5602-a030-f0b1-196e9dde8510	2380	Slovenj Gradec
00050000-5602-a030-4a57-feec7fa49ada	2310	Slovenska Bistrica
00050000-5602-a030-de3d-44c0e3aec123	3210	Slovenske Konjice
00050000-5602-a030-572b-3b0cedd881d1	1216	Smlednik
00050000-5602-a030-952b-5f5dfd6c0f05	5232	Soča
00050000-5602-a030-fcbe-665f96a57d5a	1317	Sodražica
00050000-5602-a030-89e4-3a259e559a54	3335	Solčava
00050000-5602-a030-b692-cab306ba1cca	5250	Solkan
00050000-5602-a030-fd2b-d65f3b1cacd9	4229	Sorica
00050000-5602-a030-c4e4-71ff861d4a99	4225	Sovodenj
00050000-5602-a030-3010-4aea3a83e8bf	5281	Spodnja Idrija
00050000-5602-a030-540e-febd8738f4ca	2241	Spodnji Duplek
00050000-5602-a030-fe61-b90474798ca4	9245	Spodnji Ivanjci
00050000-5602-a030-ff0d-a6d159e57c2f	2277	Središče ob Dravi
00050000-5602-a030-7494-df98e516522f	4267	Srednja vas v Bohinju
00050000-5602-a030-8471-b5366f57b7e6	8256	Sromlje 
00050000-5602-a030-485d-1075bf326e38	5224	Srpenica
00050000-5602-a030-5770-0de68c10543e	1242	Stahovica
00050000-5602-a030-7b17-7c93ee29feec	1332	Stara Cerkev
00050000-5602-a030-4035-17556a3de945	8342	Stari trg ob Kolpi
00050000-5602-a030-efdd-d791a6e67da4	1386	Stari trg pri Ložu
00050000-5602-a030-65ad-fdf865223b30	2205	Starše
00050000-5602-a030-e79b-67c759c7917b	2289	Stoperce
00050000-5602-a030-5d8b-89b3a2f9a91f	8322	Stopiče
00050000-5602-a030-e26b-e72bddcf5000	3206	Stranice
00050000-5602-a030-4db2-7c1882e3426e	8351	Straža
00050000-5602-a030-c648-993f168c6985	1313	Struge
00050000-5602-a030-4b12-0b83f5b91238	8293	Studenec
00050000-5602-a030-1eab-56cd8939eb02	8331	Suhor
00050000-5602-a030-d9ac-bbc0e8ca0f19	2233	Sv. Ana v Slovenskih goricah
00050000-5602-a030-1d28-0f1370fa9a8b	2235	Sv. Trojica v Slovenskih goricah
00050000-5602-a030-2b38-d728875356ee	2353	Sveti Duh na Ostrem Vrhu
00050000-5602-a030-d2ed-d2078bdc3c46	9244	Sveti Jurij ob Ščavnici
00050000-5602-a030-f9fc-b6b88251f82a	3264	Sveti Štefan
00050000-5602-a030-b2d5-71317895e3e3	2258	Sveti Tomaž
00050000-5602-a030-c374-c57d07e7ec4a	9204	Šalovci
00050000-5602-a030-db1a-4272fee19cd8	5261	Šempas
00050000-5602-a030-9ac0-3827c00227bd	5290	Šempeter pri Gorici
00050000-5602-a030-8a8c-a92ea5909e9b	3311	Šempeter v Savinjski dolini
00050000-5602-a030-5aa0-ea1fdd37ae8b	4208	Šenčur
00050000-5602-a030-128b-fd9f830bcba1	2212	Šentilj v Slovenskih goricah
00050000-5602-a030-114d-1fc76a4f3daf	8297	Šentjanž
00050000-5602-a030-dc6d-82352f1a0aba	2373	Šentjanž pri Dravogradu
00050000-5602-a030-55ca-81a9b79e19f2	8310	Šentjernej
00050000-5602-a030-968a-13c2b8dffcbf	3230	Šentjur
00050000-5602-a030-d19a-8aabce6c7e91	3271	Šentrupert
00050000-5602-a030-bffb-230927ad5b65	8232	Šentrupert
00050000-5602-a030-e633-95dc1c126d07	1296	Šentvid pri Stični
00050000-5602-a030-611a-6b2690705952	8275	Škocjan
00050000-5602-a030-ab19-7f03047a3e14	6281	Škofije
00050000-5602-a030-a528-fe8dbae54d4c	4220	Škofja Loka
00050000-5602-a030-1e05-59025702424c	3211	Škofja vas
00050000-5602-a030-d123-a6942a29a100	1291	Škofljica
00050000-5602-a030-cabf-8ea94e3d2de9	6274	Šmarje
00050000-5602-a030-0586-aafcd1812aa7	1293	Šmarje - Sap
00050000-5602-a030-f8ad-c845dfa56b0d	3240	Šmarje pri Jelšah
00050000-5602-a030-f311-be05e53aea27	8220	Šmarješke Toplice
00050000-5602-a030-60c6-bf1b413e0937	2315	Šmartno na Pohorju
00050000-5602-a030-db45-a7beb0a437d3	3341	Šmartno ob Dreti
00050000-5602-a030-0cd6-b4e7ad59a572	3327	Šmartno ob Paki
00050000-5602-a030-bce6-be7825836aa5	1275	Šmartno pri Litiji
00050000-5602-a030-dbe9-c39a74094010	2383	Šmartno pri Slovenj Gradcu
00050000-5602-a030-a9ef-f73d2efd6ee3	3201	Šmartno v Rožni dolini
00050000-5602-a030-97c8-63cdb399362e	3325	Šoštanj
00050000-5602-a030-04e0-1154aa3309dc	6222	Štanjel
00050000-5602-a030-3f94-66e1f7082a52	3220	Štore
00050000-5602-a030-96c2-f113f26726a0	3304	Tabor
00050000-5602-a030-b305-e3c69e3316d2	3221	Teharje
00050000-5602-a030-d5ce-6ddbfc8e1134	9251	Tišina
00050000-5602-a030-ecc1-c80accd6677b	5220	Tolmin
00050000-5602-a030-a536-3a0b5c55c8c9	3326	Topolšica
00050000-5602-a030-0951-09e337ca385a	2371	Trbonje
00050000-5602-a030-f6f8-3bead12f7d97	1420	Trbovlje
00050000-5602-a030-1b82-6b284e0eab28	8231	Trebelno 
00050000-5602-a030-97af-aba6f8694eed	8210	Trebnje
00050000-5602-a030-1203-c32bd9bb7a46	5252	Trnovo pri Gorici
00050000-5602-a030-0613-81dd6f921a2f	2254	Trnovska vas
00050000-5602-a030-1f59-4f2c4ca32617	1222	Trojane
00050000-5602-a030-b318-acbbd73ab06b	1236	Trzin
00050000-5602-a030-3b9a-cc243f82d7fa	4290	Tržič
00050000-5602-a030-d262-0f2fa8aaee39	8295	Tržišče
00050000-5602-a030-6ae9-f7f4a67524ae	1311	Turjak
00050000-5602-a030-59f9-fa077a11b528	9224	Turnišče
00050000-5602-a030-1d7a-9452320de484	8323	Uršna sela
00050000-5602-a030-16f2-fe386a8e1dd7	1252	Vače
00050000-5602-a030-48b3-a9523f2edc53	3320	Velenje 
00050000-5602-a030-278b-b349743fe461	3322	Velenje - poštni predali
00050000-5602-a030-5b86-d7e449b8f547	8212	Velika Loka
00050000-5602-a030-29c6-78c8c9e32c7f	2274	Velika Nedelja
00050000-5602-a030-a217-20420cbfd1e6	9225	Velika Polana
00050000-5602-a030-ac2e-f216c5335538	1315	Velike Lašče
00050000-5602-a030-eaf1-6623deb69c28	8213	Veliki Gaber
00050000-5602-a030-9239-fb33379ad731	9241	Veržej
00050000-5602-a030-7ec8-ea9e1eacea4a	1312	Videm - Dobrepolje
00050000-5602-a030-ab6a-b0bfebed6c0b	2284	Videm pri Ptuju
00050000-5602-a030-54ad-bdc3071ef903	8344	Vinica
00050000-5602-a030-efd0-c6eae6119ae1	5271	Vipava
00050000-5602-a030-918f-913cc4db683f	4212	Visoko
00050000-5602-a030-b9cd-6baa264bdcd0	1294	Višnja Gora
00050000-5602-a030-0756-15036cdb4c92	3205	Vitanje
00050000-5602-a030-0708-89c5210dc314	2255	Vitomarci
00050000-5602-a030-b5c0-60fc1392d8e7	1217	Vodice
00050000-5602-a030-8574-d23f3d545bc1	3212	Vojnik\t
00050000-5602-a030-ebc2-917cad30c0ec	5293	Volčja Draga
00050000-5602-a030-9532-2469ea750358	2232	Voličina
00050000-5602-a030-4f2d-403b451e6fdb	3305	Vransko
00050000-5602-a030-9a35-9272cb8a852b	6217	Vremski Britof
00050000-5602-a030-b055-ec0ce98d8d01	1360	Vrhnika
00050000-5602-a030-61a0-0af6957c29c5	2365	Vuhred
00050000-5602-a030-881a-c74a7a2a8930	2367	Vuzenica
00050000-5602-a030-443f-98fc880c3d2a	8292	Zabukovje 
00050000-5602-a030-c2df-ab84603adf77	1410	Zagorje ob Savi
00050000-5602-a030-1fbf-e6451d107e0d	1303	Zagradec
00050000-5602-a030-01e8-e071b710dc06	2283	Zavrč
00050000-5602-a030-a6f5-ed71e49e9875	8272	Zdole 
00050000-5602-a030-28f0-c478ee9fbad3	4201	Zgornja Besnica
00050000-5602-a030-2ac0-c3e5cd3b58a8	2242	Zgornja Korena
00050000-5602-a030-1b15-abd49ef1fe8b	2201	Zgornja Kungota
00050000-5602-a030-15f4-8dde4353fbc0	2316	Zgornja Ložnica
00050000-5602-a030-1560-3864ba13d357	2314	Zgornja Polskava
00050000-5602-a030-36dd-501d26b53ae7	2213	Zgornja Velka
00050000-5602-a030-fdcd-97f36f9a8e3d	4247	Zgornje Gorje
00050000-5602-a030-f144-0d8531ef9b80	4206	Zgornje Jezersko
00050000-5602-a030-91f4-e6b4ff225a1c	2285	Zgornji Leskovec
00050000-5602-a030-144c-f327c3859a0d	1432	Zidani Most
00050000-5602-a030-4b3e-8d70e675bd09	3214	Zreče
00050000-5602-a030-577c-357679d592d9	4209	Žabnica
00050000-5602-a030-0a76-1b15157c596b	3310	Žalec
00050000-5602-a030-63a8-f59ced63dd10	4228	Železniki
00050000-5602-a030-250c-f1a0a939c57c	2287	Žetale
00050000-5602-a030-a5fa-fbaae852542a	4226	Žiri
00050000-5602-a030-6356-e2844bc1f98b	4274	Žirovnica
00050000-5602-a030-c838-289074ac60b0	8360	Žužemberk
\.


--
-- TOC entry 3025 (class 0 OID 20559077)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20558701)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20558481)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5602-a032-80d8-fde07a153ddf	00080000-5602-a032-ba91-155a6c8b8576	\N	00040000-5602-a030-d06c-ade25fe24e45	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5602-a032-b64f-1201f4f2b5bb	00080000-5602-a032-ba91-155a6c8b8576	\N	00040000-5602-a030-d06c-ade25fe24e45	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5602-a032-4edf-8dc331507e5c	00080000-5602-a032-87ac-5d730507dbf1	\N	00040000-5602-a030-d06c-ade25fe24e45	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2987 (class 0 OID 20558585)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20558713)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20559091)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20559101)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5602-a032-ac44-3888e76a443c	00080000-5602-a032-83cd-fbcebf0e3666	0987	AK
00190000-5602-a032-f20a-411edb713e59	00080000-5602-a032-87ac-5d730507dbf1	0989	AK
00190000-5602-a032-9e68-3c1d23515d02	00080000-5602-a032-6eef-663ee7c3cb82	0986	AK
00190000-5602-a032-3bf3-141b686ae001	00080000-5602-a032-4a7a-88cb5eb16f98	0984	AK
00190000-5602-a032-de2a-9149b334f981	00080000-5602-a032-b665-e75d6de4d42c	0983	AK
00190000-5602-a032-23b7-a2e2b0ba02c4	00080000-5602-a032-b5bf-447ab23e333d	0982	AK
00190000-5602-a033-0fe0-ae4adde35f71	00080000-5602-a033-6bd3-451815287c94	1001	AK
\.


--
-- TOC entry 3024 (class 0 OID 20559034)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5602-a032-a06b-5c4900735a01	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 20559109)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20558742)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5602-a032-fbcc-319db69e73ec	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5602-a032-4898-5aac854e5af4	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5602-a032-de11-441a41bcabdf	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5602-a032-13c2-8e1af1b202d0	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5602-a032-a71c-2bee7a1e68ff	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5602-a032-2094-91e881289a28	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5602-a032-d75d-3e0e958d73c7	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2996 (class 0 OID 20558686)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20558676)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20558886)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20558816)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20558559)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20558354)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5602-a033-6bd3-451815287c94	00010000-5602-a031-7f41-28573737465d	2015-09-23 14:50:59	INS	a:0:{}
2	App\\Entity\\Option	00000000-5602-a033-6c66-f349e63e9cdc	00010000-5602-a031-7f41-28573737465d	2015-09-23 14:50:59	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5602-a033-0fe0-ae4adde35f71	00010000-5602-a031-7f41-28573737465d	2015-09-23 14:50:59	INS	a:0:{}
\.


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3005 (class 0 OID 20558755)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 20558392)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5602-a030-56fc-fd4a6df67fde	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5602-a030-5fac-b11c849a0628	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5602-a030-1d0c-ca7a703707bd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5602-a030-7903-ecf73b29ad4e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5602-a031-497f-718f84bb3ec3	planer	Planer dogodkov v koledarju	t
00020000-5602-a031-596b-1a432fbe13f2	kadrovska	Kadrovska služba	t
00020000-5602-a031-66bf-d712580bcbdd	arhivar	Ažuriranje arhivalij	t
00020000-5602-a031-287d-fd2c83d92470	igralec	Igralec	t
00020000-5602-a031-4950-46d3d5c871c0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5602-a032-e886-1da15ef43186	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2970 (class 0 OID 20558376)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5602-a031-171a-645e924edaf3	00020000-5602-a030-1d0c-ca7a703707bd
00010000-5602-a031-7f41-28573737465d	00020000-5602-a030-1d0c-ca7a703707bd
00010000-5602-a032-ec5d-cc364ed4e720	00020000-5602-a032-e886-1da15ef43186
\.


--
-- TOC entry 3007 (class 0 OID 20558769)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20558707)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20558653)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20558341)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5602-a030-26da-74fbf0f1cd1d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5602-a030-4006-b0015249ff59	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5602-a030-a9c5-a78105146619	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5602-a030-2b0a-b1538e9629bb	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5602-a030-9385-fc523acd430c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 20558333)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5602-a030-bb7a-f19919a7955d	00230000-5602-a030-2b0a-b1538e9629bb	popa
00240000-5602-a030-b155-abadba05cc18	00230000-5602-a030-2b0a-b1538e9629bb	oseba
00240000-5602-a030-7613-3c712db4c4e3	00230000-5602-a030-2b0a-b1538e9629bb	sezona
00240000-5602-a030-6b4e-323fe723ea69	00230000-5602-a030-4006-b0015249ff59	prostor
00240000-5602-a030-112a-a3d17e7c6d0a	00230000-5602-a030-2b0a-b1538e9629bb	besedilo
00240000-5602-a030-979c-c2623d552f68	00230000-5602-a030-2b0a-b1538e9629bb	uprizoritev
00240000-5602-a030-e245-e74fdc980bfc	00230000-5602-a030-2b0a-b1538e9629bb	funkcija
00240000-5602-a030-a97f-f17e92b864fd	00230000-5602-a030-2b0a-b1538e9629bb	tipfunkcije
00240000-5602-a030-dfdd-4c5222583051	00230000-5602-a030-2b0a-b1538e9629bb	alternacija
00240000-5602-a030-d784-95615655c655	00230000-5602-a030-26da-74fbf0f1cd1d	pogodba
00240000-5602-a030-953e-0d176e838630	00230000-5602-a030-2b0a-b1538e9629bb	zaposlitev
00240000-5602-a030-29ed-cb0b296ede3b	00230000-5602-a030-2b0a-b1538e9629bb	zvrstuprizoritve
00240000-5602-a030-dff3-ec9b12d60b96	00230000-5602-a030-26da-74fbf0f1cd1d	programdela
00240000-5602-a030-41cf-5cb24e7d4d56	00230000-5602-a030-2b0a-b1538e9629bb	zapis
\.


--
-- TOC entry 2964 (class 0 OID 20558328)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
83d7b8fa-0546-41d4-8243-fa4195f38ed3	00240000-5602-a030-bb7a-f19919a7955d	0	1001
\.


--
-- TOC entry 3013 (class 0 OID 20558833)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5602-a032-c899-747495e52908	000e0000-5602-a032-f476-e31c4f58b466	00080000-5602-a032-ba91-155a6c8b8576	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5602-a030-c031-c12f6d2ed5e2
00270000-5602-a032-8b98-36e826d08a22	000e0000-5602-a032-f476-e31c4f58b466	00080000-5602-a032-ba91-155a6c8b8576	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5602-a030-c031-c12f6d2ed5e2
\.


--
-- TOC entry 2977 (class 0 OID 20558454)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20558663)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5602-a032-73c6-47c245e12a2e	00180000-5602-a032-604f-e70885644701	000c0000-5602-a032-8188-265418502b6a	00090000-5602-a032-8f5c-14b4ec8b454c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-a032-ccbe-add91665cf1f	00180000-5602-a032-604f-e70885644701	000c0000-5602-a032-237c-f58309f99e12	00090000-5602-a032-c782-d8522b976a16	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-a032-66d2-75fd4b60fbb1	00180000-5602-a032-604f-e70885644701	000c0000-5602-a032-9393-8fcbf18491d2	00090000-5602-a032-14a4-d0ecaba53c44	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-a032-bba1-246038d99bad	00180000-5602-a032-604f-e70885644701	000c0000-5602-a032-2eb5-f5b755f8392b	00090000-5602-a032-6eec-1f2c8f4a29da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-a032-cfc4-2957f095a0e0	00180000-5602-a032-604f-e70885644701	000c0000-5602-a032-cde4-e64dff3c5740	00090000-5602-a032-fd02-41c298bbec69	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-a032-c0b6-cb587a52c8dd	00180000-5602-a032-32af-69c2d8ec3765	\N	00090000-5602-a032-fd02-41c298bbec69	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3016 (class 0 OID 20558874)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5602-a030-ea12-30440af88113	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5602-a030-8663-049be897846e	02	Priredba	Priredba	Priredba	umetnik
000f0000-5602-a030-6b17-9ddf3d282afa	03	Prevod	Prevod	Prevod	umetnik
000f0000-5602-a030-820d-41028f09c401	04	Režija	Režija	Režija	umetnik
000f0000-5602-a030-3257-b650b204b384	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5602-a030-8e13-fbc19832dbfe	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5602-a030-316c-d4acfdc5732a	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5602-a030-eac8-bcfe0ac0c612	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5602-a030-a370-5d25354b29ba	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5602-a030-cac4-c58fadc60849	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5602-a030-a626-21e63a6327f8	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5602-a030-d196-576634fb65c5	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5602-a030-630a-2436e08d4c7b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5602-a030-5963-11190a12179c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5602-a030-89ec-5c21db227b6b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5602-a030-df65-394f800a0a22	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5602-a030-785c-9d12889b234f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5602-a030-64db-790b1767a2ec	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3029 (class 0 OID 20559119)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5602-a030-2dff-b4c353e2f4db	01	Velika predstava	f	1.00	1.00
002b0000-5602-a030-3765-e9df5205551b	02	Mala predstava	f	0.50	0.50
002b0000-5602-a030-4859-7ea4ce369569	03	Mala koprodukcija	t	0.40	1.00
002b0000-5602-a030-d9d0-5e645c543c68	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5602-a030-8cb8-fe0bae5963f8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2982 (class 0 OID 20558516)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20558363)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5602-a031-7f41-28573737465d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6Bfj/kAP4089uzaiMZ2TZe4oGrtwOiC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5602-a032-085c-23bba68e6aff	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5602-a032-b76b-7af6c999e751	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5602-a032-c099-c1770a7d1700	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5602-a032-301d-e3cf29e37830	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5602-a032-abdd-cd3ace826fa7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5602-a032-10d1-27d4f58a7461	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5602-a032-2bdb-a11bcd60924b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5602-a032-fc5f-60784e3b275f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5602-a032-1a7c-33892d6253d9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5602-a032-ec5d-cc364ed4e720	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5602-a031-171a-645e924edaf3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3020 (class 0 OID 20558924)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5602-a032-b0a4-bc5e088babab	00160000-5602-a032-729b-fca27628cb6d	\N	00140000-5602-a030-c10b-168a46e1cb16	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		00220000-5602-a032-a71c-2bee7a1e68ff
000e0000-5602-a032-f476-e31c4f58b466	00160000-5602-a032-c182-823b5000f950	\N	00140000-5602-a030-271f-489265708fcd	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		00220000-5602-a032-2094-91e881289a28
000e0000-5602-a032-4570-2d28f8ec2eca	\N	\N	00140000-5602-a030-271f-489265708fcd	00190000-5602-a032-ac44-3888e76a443c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-a032-a71c-2bee7a1e68ff
000e0000-5602-a032-d6ef-bb18ee61e222	\N	\N	00140000-5602-a030-271f-489265708fcd	00190000-5602-a032-ac44-3888e76a443c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-a032-a71c-2bee7a1e68ff
000e0000-5602-a032-12b6-4767c0821e92	\N	\N	00140000-5602-a030-271f-489265708fcd	00190000-5602-a032-ac44-3888e76a443c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5602-a032-fbcc-319db69e73ec
000e0000-5602-a032-3547-6227da4f7a1f	\N	\N	00140000-5602-a030-271f-489265708fcd	00190000-5602-a032-ac44-3888e76a443c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5602-a032-fbcc-319db69e73ec
\.


--
-- TOC entry 2989 (class 0 OID 20558606)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5602-a032-d5f7-06374e8fbfbb	000e0000-5602-a032-f476-e31c4f58b466	\N	1	
00200000-5602-a032-dfca-b57fab4753e6	000e0000-5602-a032-f476-e31c4f58b466	\N	2	
00200000-5602-a032-4e88-51625cb03a3f	000e0000-5602-a032-f476-e31c4f58b466	\N	3	
00200000-5602-a032-0a44-01d3be28b554	000e0000-5602-a032-f476-e31c4f58b466	\N	4	
00200000-5602-a032-64e3-7d34fa1efccd	000e0000-5602-a032-f476-e31c4f58b466	\N	5	
\.


--
-- TOC entry 3003 (class 0 OID 20558734)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20558847)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5602-a030-0cfd-3567ca44f497	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5602-a030-878c-1bb5b9936704	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5602-a030-dd38-b2c2a966058e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5602-a030-4904-4605c189b4de	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5602-a030-8eb2-22077ad4bff8	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5602-a030-f580-5cddb2b833ca	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5602-a030-0d86-dd1c0023d355	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5602-a030-d231-efc6a5be59d1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5602-a030-c031-c12f6d2ed5e2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5602-a030-a5ec-99500d951473	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5602-a030-8cc7-0dea0adc33e5	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5602-a030-dcfe-550eb8132042	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5602-a030-98d7-7b914f159b27	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5602-a030-cc6d-97709665731a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5602-a030-4988-ea5235299f2f	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5602-a030-a348-199ceb1c8815	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5602-a030-ae90-0674fdbe3832	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5602-a030-7243-2265c89e13a4	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5602-a030-86a2-676fd945becb	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5602-a030-cf0c-c888e3c44f59	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5602-a030-4095-b8f4fcefb3da	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5602-a030-968c-f3006d718cc6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5602-a030-49eb-25357168eac0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5602-a030-8be4-15ab692b8e67	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5602-a030-007f-57592ac34ed2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5602-a030-c3f0-84d0f856b2de	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5602-a030-49f8-bb8ce47f4a27	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5602-a030-f820-871ac5e6cb49	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3032 (class 0 OID 20559166)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20559138)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20559178)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20558806)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5602-a032-33ea-8067da6c50a0	00090000-5602-a032-c782-d8522b976a16	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-a032-1ae2-281f33f0d984	00090000-5602-a032-14a4-d0ecaba53c44	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-a032-edf5-1a765ef3250a	00090000-5602-a032-d7a6-0c33aa01b218	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-a032-b553-270fcd3eaa16	00090000-5602-a032-b2fc-fda9c9a733ec	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-a032-9801-9209a103bdc3	00090000-5602-a032-8f5c-14b4ec8b454c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-a032-66ee-5b2f5dddb7d2	00090000-5602-a032-83b6-31d8e4e2f91e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2991 (class 0 OID 20558642)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20558914)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5602-a030-c10b-168a46e1cb16	01	Drama	drama (SURS 01)
00140000-5602-a030-0fba-5c236a1e5e06	02	Opera	opera (SURS 02)
00140000-5602-a030-aca1-595cfdc8e5ed	03	Balet	balet (SURS 03)
00140000-5602-a030-bf3e-f49b0bb82441	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5602-a030-6ff4-d8611af3694e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5602-a030-271f-489265708fcd	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5602-a030-4d27-ee8df549fe14	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3009 (class 0 OID 20558796)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2496 (class 2606 OID 20558417)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 20558973)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 20558963)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 20558830)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 20558872)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 20559218)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 20558631)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 20558652)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 20559136)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20558542)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 20559028)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 20558792)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 20558604)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20558580)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 20558556)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20558699)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 20559195)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 20559202)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2750 (class 2606 OID 20559226)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2608 (class 2606 OID 20558726)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 20558514)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20558426)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 20558450)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20558406)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2487 (class 2606 OID 20558391)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20558732)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 20558768)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 20558909)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20558478)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20558502)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20559089)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 20558705)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 20558492)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 20558592)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 20558717)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 20559098)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 20559106)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20559076)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20559117)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20558750)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 20558690)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 20558681)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 20558896)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 20558823)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 20558568)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20558362)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 20558759)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20558380)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2489 (class 2606 OID 20558400)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20558777)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 20558712)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 20558661)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20558350)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20558338)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 20558332)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20558843)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 20558459)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 20558672)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20558883)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20559129)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 20558527)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 20558375)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20558942)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 20558614)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20558740)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20558855)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20559176)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 20559160)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 20559184)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 20558814)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 20558646)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 20558922)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20558804)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 1259 OID 20558640)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2561 (class 1259 OID 20558641)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2562 (class 1259 OID 20558639)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2563 (class 1259 OID 20558638)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2564 (class 1259 OID 20558637)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2650 (class 1259 OID 20558844)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2651 (class 1259 OID 20558845)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 20558846)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2736 (class 1259 OID 20559197)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2737 (class 1259 OID 20559196)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2510 (class 1259 OID 20558480)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 20558733)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2723 (class 1259 OID 20559164)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2724 (class 1259 OID 20559163)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2725 (class 1259 OID 20559165)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2726 (class 1259 OID 20559162)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2727 (class 1259 OID 20559161)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 20558719)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2604 (class 1259 OID 20558718)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2555 (class 1259 OID 20558615)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20558793)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20558795)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2635 (class 1259 OID 20558794)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2535 (class 1259 OID 20558558)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2536 (class 1259 OID 20558557)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2714 (class 1259 OID 20559118)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2666 (class 1259 OID 20558911)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2667 (class 1259 OID 20558912)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 20558913)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2733 (class 1259 OID 20559185)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2675 (class 1259 OID 20558947)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2676 (class 1259 OID 20558944)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2677 (class 1259 OID 20558948)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2678 (class 1259 OID 20558946)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2679 (class 1259 OID 20558945)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2525 (class 1259 OID 20558529)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 20558528)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 20558453)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 20558760)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2491 (class 1259 OID 20558407)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2492 (class 1259 OID 20558408)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2626 (class 1259 OID 20558780)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2627 (class 1259 OID 20558779)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2628 (class 1259 OID 20558778)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 20558593)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 20558594)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 20558340)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2583 (class 1259 OID 20558685)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2584 (class 1259 OID 20558683)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2585 (class 1259 OID 20558682)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2586 (class 1259 OID 20558684)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2482 (class 1259 OID 20558381)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2483 (class 1259 OID 20558382)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 20558741)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2746 (class 1259 OID 20559219)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2648 (class 1259 OID 20558832)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 20558831)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2747 (class 1259 OID 20559227)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2748 (class 1259 OID 20559228)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2598 (class 1259 OID 20558706)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2642 (class 1259 OID 20558824)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2643 (class 1259 OID 20558825)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 20559033)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2697 (class 1259 OID 20559032)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2698 (class 1259 OID 20559029)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 20559030)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2700 (class 1259 OID 20559031)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 20558494)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 20558493)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2516 (class 1259 OID 20558495)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 20558754)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 20558753)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2706 (class 1259 OID 20559099)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2707 (class 1259 OID 20559100)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2689 (class 1259 OID 20558977)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2690 (class 1259 OID 20558978)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2691 (class 1259 OID 20558975)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2692 (class 1259 OID 20558976)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2639 (class 1259 OID 20558815)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 20558694)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2590 (class 1259 OID 20558693)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2591 (class 1259 OID 20558691)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2592 (class 1259 OID 20558692)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2685 (class 1259 OID 20558965)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 20558964)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 20558569)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2542 (class 1259 OID 20558583)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2543 (class 1259 OID 20558582)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2544 (class 1259 OID 20558581)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2545 (class 1259 OID 20558584)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2554 (class 1259 OID 20558605)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2703 (class 1259 OID 20559090)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2722 (class 1259 OID 20559137)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2740 (class 1259 OID 20559203)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2741 (class 1259 OID 20559204)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2497 (class 1259 OID 20558428)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2498 (class 1259 OID 20558427)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2506 (class 1259 OID 20558460)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2507 (class 1259 OID 20558461)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 20558647)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20558675)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20558674)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2580 (class 1259 OID 20558673)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2565 (class 1259 OID 20558633)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2566 (class 1259 OID 20558634)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2567 (class 1259 OID 20558632)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2568 (class 1259 OID 20558636)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2569 (class 1259 OID 20558635)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2513 (class 1259 OID 20558479)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20558543)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20558545)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2533 (class 1259 OID 20558544)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2534 (class 1259 OID 20558546)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2597 (class 1259 OID 20558700)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 20558910)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 20558943)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20558884)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20558885)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2504 (class 1259 OID 20558451)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2505 (class 1259 OID 20558452)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2636 (class 1259 OID 20558805)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 20558351)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 20558515)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2474 (class 1259 OID 20558339)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2719 (class 1259 OID 20559130)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 20558752)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2620 (class 1259 OID 20558751)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 20558974)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 20558503)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 20558923)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 20559177)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2712 (class 1259 OID 20559107)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 20559108)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 20558873)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2577 (class 1259 OID 20558662)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 20558401)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2781 (class 2606 OID 20559359)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2780 (class 2606 OID 20559364)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2776 (class 2606 OID 20559384)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2782 (class 2606 OID 20559354)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2778 (class 2606 OID 20559374)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2777 (class 2606 OID 20559379)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2779 (class 2606 OID 20559369)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2817 (class 2606 OID 20559549)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2816 (class 2606 OID 20559554)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 20559559)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2849 (class 2606 OID 20559724)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2850 (class 2606 OID 20559719)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 20559284)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2799 (class 2606 OID 20559469)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2844 (class 2606 OID 20559704)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20559699)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 20559709)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 20559694)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2847 (class 2606 OID 20559689)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2797 (class 2606 OID 20559464)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2798 (class 2606 OID 20559459)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2775 (class 2606 OID 20559349)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2809 (class 2606 OID 20559509)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 20559519)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2808 (class 2606 OID 20559514)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2768 (class 2606 OID 20559319)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 20559314)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 20559449)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20559679)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 20559564)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 20559569)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 20559574)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2848 (class 2606 OID 20559714)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2822 (class 2606 OID 20559594)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2825 (class 2606 OID 20559579)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2821 (class 2606 OID 20559599)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2823 (class 2606 OID 20559589)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2824 (class 2606 OID 20559584)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2766 (class 2606 OID 20559309)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 20559304)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 20559269)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2759 (class 2606 OID 20559264)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2803 (class 2606 OID 20559489)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2755 (class 2606 OID 20559244)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2754 (class 2606 OID 20559249)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2804 (class 2606 OID 20559504)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2805 (class 2606 OID 20559499)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2806 (class 2606 OID 20559494)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2773 (class 2606 OID 20559334)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 20559339)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2751 (class 2606 OID 20559229)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2787 (class 2606 OID 20559424)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2789 (class 2606 OID 20559414)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2790 (class 2606 OID 20559409)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2788 (class 2606 OID 20559419)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 20559234)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2752 (class 2606 OID 20559239)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2800 (class 2606 OID 20559474)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2853 (class 2606 OID 20559739)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 20559544)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2814 (class 2606 OID 20559539)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2855 (class 2606 OID 20559744)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2854 (class 2606 OID 20559749)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2796 (class 2606 OID 20559454)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2812 (class 2606 OID 20559529)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2811 (class 2606 OID 20559534)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 20559654)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 20559649)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20559634)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 20559639)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2834 (class 2606 OID 20559644)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2764 (class 2606 OID 20559294)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 20559289)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 20559299)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2801 (class 2606 OID 20559484)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2802 (class 2606 OID 20559479)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20559664)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2838 (class 2606 OID 20559669)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 20559624)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 20559629)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2831 (class 2606 OID 20559614)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2830 (class 2606 OID 20559619)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2810 (class 2606 OID 20559524)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 20559444)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2792 (class 2606 OID 20559439)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2794 (class 2606 OID 20559429)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2793 (class 2606 OID 20559434)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2826 (class 2606 OID 20559609)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 20559604)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 20559324)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2771 (class 2606 OID 20559329)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 20559344)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 20559659)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2840 (class 2606 OID 20559674)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20559684)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 20559729)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2851 (class 2606 OID 20559734)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 20559259)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 20559254)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2761 (class 2606 OID 20559274)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 20559279)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 20559389)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20559404)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20559399)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2786 (class 2606 OID 20559394)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-23 14:51:01 CEST

--
-- PostgreSQL database dump complete
--

