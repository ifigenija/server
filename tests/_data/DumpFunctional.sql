--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-29 20:57:14 CEST

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
-- TOC entry 181 (class 1259 OID 21084930)
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
-- TOC entry 229 (class 1259 OID 21085487)
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
-- TOC entry 228 (class 1259 OID 21085470)
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
-- TOC entry 219 (class 1259 OID 21085347)
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
-- TOC entry 222 (class 1259 OID 21085377)
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
-- TOC entry 243 (class 1259 OID 21085729)
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
-- TOC entry 197 (class 1259 OID 21085138)
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
-- TOC entry 199 (class 1259 OID 21085169)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21085655)
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
-- TOC entry 190 (class 1259 OID 21085051)
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
-- TOC entry 230 (class 1259 OID 21085500)
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
-- TOC entry 215 (class 1259 OID 21085302)
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
-- TOC entry 195 (class 1259 OID 21085117)
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
-- TOC entry 193 (class 1259 OID 21085091)
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
-- TOC entry 191 (class 1259 OID 21085068)
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
-- TOC entry 204 (class 1259 OID 21085216)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21085710)
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
-- TOC entry 242 (class 1259 OID 21085722)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21085744)
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
-- TOC entry 170 (class 1259 OID 21083192)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21085241)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21085025)
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
-- TOC entry 182 (class 1259 OID 21084939)
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
-- TOC entry 183 (class 1259 OID 21084950)
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
-- TOC entry 178 (class 1259 OID 21084904)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21084923)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21085248)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21085282)
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
-- TOC entry 225 (class 1259 OID 21085418)
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
-- TOC entry 185 (class 1259 OID 21084983)
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
-- TOC entry 187 (class 1259 OID 21085017)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21085600)
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
-- TOC entry 205 (class 1259 OID 21085222)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21085002)
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
-- TOC entry 194 (class 1259 OID 21085106)
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
-- TOC entry 207 (class 1259 OID 21085234)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21085614)
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
-- TOC entry 234 (class 1259 OID 21085624)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21085557)
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
-- TOC entry 235 (class 1259 OID 21085632)
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
-- TOC entry 211 (class 1259 OID 21085263)
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
-- TOC entry 203 (class 1259 OID 21085207)
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
-- TOC entry 202 (class 1259 OID 21085197)
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
-- TOC entry 224 (class 1259 OID 21085407)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21085337)
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
-- TOC entry 192 (class 1259 OID 21085080)
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
-- TOC entry 175 (class 1259 OID 21084875)
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
-- TOC entry 174 (class 1259 OID 21084873)
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
-- TOC entry 212 (class 1259 OID 21085276)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21084913)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21084897)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21085290)
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
-- TOC entry 206 (class 1259 OID 21085228)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21085174)
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
-- TOC entry 173 (class 1259 OID 21084862)
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
-- TOC entry 172 (class 1259 OID 21084854)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21084849)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21085354)
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
-- TOC entry 184 (class 1259 OID 21084975)
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
-- TOC entry 201 (class 1259 OID 21085184)
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
-- TOC entry 223 (class 1259 OID 21085395)
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
-- TOC entry 236 (class 1259 OID 21085643)
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
-- TOC entry 189 (class 1259 OID 21085037)
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
-- TOC entry 176 (class 1259 OID 21084884)
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
-- TOC entry 227 (class 1259 OID 21085445)
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
-- TOC entry 196 (class 1259 OID 21085128)
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
-- TOC entry 210 (class 1259 OID 21085255)
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
-- TOC entry 221 (class 1259 OID 21085368)
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
-- TOC entry 239 (class 1259 OID 21085690)
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
-- TOC entry 238 (class 1259 OID 21085662)
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
-- TOC entry 240 (class 1259 OID 21085702)
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
-- TOC entry 217 (class 1259 OID 21085327)
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
-- TOC entry 198 (class 1259 OID 21085163)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21085435)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21085317)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21084878)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 21084930)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21085487)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-560a-df07-26de-d98c57dd80cc	000d0000-560a-df07-73de-5c32acfa5b00	\N	00090000-560a-df07-e4ec-f257f43e0dbb	000b0000-560a-df07-5edc-8581b45edc09	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-560a-df07-1b85-11b9fbd96c06	000d0000-560a-df07-96b1-054bf28e39ac	00100000-560a-df07-a039-f20912c0a8d1	00090000-560a-df07-06d2-125a64a0aa64	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-560a-df07-f58f-05b18ae324e0	000d0000-560a-df07-d1a2-b505b4b1eff2	00100000-560a-df07-e264-c667f1e37f51	00090000-560a-df07-44d7-cab6c2e5c5c6	\N	0003	t	\N	2015-09-29	\N	2	t	\N	f	f
000c0000-560a-df07-fb08-c52dc49c7f87	000d0000-560a-df07-57b9-8643fda4128d	\N	00090000-560a-df07-f17d-d5a82ce93cc5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-560a-df07-fe85-8b86d7afd6cf	000d0000-560a-df07-17df-3f62a27acf71	\N	00090000-560a-df07-7a57-7328e7020020	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-560a-df07-e0de-bbd8eb37a39a	000d0000-560a-df07-aa97-b413a0480403	\N	00090000-560a-df07-a916-db37d8811caa	000b0000-560a-df07-0fa5-b60c35becef6	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-560a-df07-5cfe-4b73b62a9663	000d0000-560a-df07-ed6c-8b8926faa232	00100000-560a-df07-f8fb-03ab3199483e	00090000-560a-df07-1f7f-039e99b28174	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-560a-df07-6ac2-f6738de1e9c9	000d0000-560a-df07-eb71-988fc3f16819	\N	00090000-560a-df07-93c3-052a09b9bccb	000b0000-560a-df07-59b8-be9b079726a4	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-560a-df07-af05-19227336c834	000d0000-560a-df07-ed6c-8b8926faa232	00100000-560a-df07-f475-6dfe1c810ea7	00090000-560a-df07-9a0c-45dc84ecd192	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-560a-df07-6960-e28a61b324aa	000d0000-560a-df07-ed6c-8b8926faa232	00100000-560a-df07-9ae3-7c2629844f49	00090000-560a-df07-1d49-0651d00838aa	\N	0010	t	\N	2015-09-29	\N	16	f	\N	f	t
000c0000-560a-df07-ca4b-67d3d0eb922b	000d0000-560a-df07-ed6c-8b8926faa232	00100000-560a-df07-5113-2e1ff80f626f	00090000-560a-df07-f0ed-5351f099b359	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-560a-df07-6e58-ed1929eb0b24	000d0000-560a-df07-9079-f9dfa2cf38e6	\N	00090000-560a-df07-06d2-125a64a0aa64	000b0000-560a-df07-92d1-ae9d102ce96e	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3024 (class 0 OID 21085470)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21085347)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-560a-df07-1017-74235626972c	00160000-560a-df07-d224-7439d3c1bc69	00090000-560a-df07-e52b-51d4168c2ca1	aizv	10	t
003d0000-560a-df07-7657-ffaeb2d92d1d	00160000-560a-df07-d224-7439d3c1bc69	00090000-560a-df07-0500-78151e77f4d4	apri	14	t
003d0000-560a-df07-949b-f5bed8abac46	00160000-560a-df07-aa5a-69884cf16524	00090000-560a-df07-a3a7-9e43233b560c	aizv	11	t
003d0000-560a-df07-be30-cc7bd8b41a60	00160000-560a-df07-3be8-8d645484ed31	00090000-560a-df07-0d57-85552a4e16c9	aizv	12	t
003d0000-560a-df07-3e18-f316848f747b	00160000-560a-df07-d224-7439d3c1bc69	00090000-560a-df07-83e3-e09a96e49711	apri	18	f
\.


--
-- TOC entry 3018 (class 0 OID 21085377)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-560a-df07-d224-7439d3c1bc69	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-560a-df07-aa5a-69884cf16524	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-560a-df07-3be8-8d645484ed31	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 21085729)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 21085138)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-560a-df07-1373-1ae49800ac32	\N	\N	00200000-560a-df07-846a-1d8101dea6e7	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-560a-df07-8d05-ccb90ea681d3	\N	\N	00200000-560a-df07-c82d-1c5d1d40873b	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-560a-df07-5347-457954dcaf65	\N	\N	00200000-560a-df07-cd22-8b327b49aa42	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-560a-df07-dce1-1287c43a8147	\N	\N	00200000-560a-df07-fa79-52e2cc46c74d	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-560a-df07-1d62-85922d8ecd14	\N	\N	00200000-560a-df07-1466-1e1e1d563995	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 21085169)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21085655)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21085051)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-560a-df04-a348-c7e99109b94c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-560a-df04-a57f-be8b0915c96a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-560a-df04-aa25-4430e8602617	AL	ALB	008	Albania 	Albanija	\N
00040000-560a-df04-e4fd-e4a2ad5910cd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-560a-df04-88e7-30a65b556640	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-560a-df04-5257-a18aeb2a74c2	AD	AND	020	Andorra 	Andora	\N
00040000-560a-df04-594d-f02195b0354a	AO	AGO	024	Angola 	Angola	\N
00040000-560a-df04-dc7c-1b9fbd4a0c2a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-560a-df04-3989-a7f70a4d3670	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-560a-df04-fed1-630aaf2b98e9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-df04-4806-ece11d56a02e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-560a-df04-ee45-dbb7915ffe95	AM	ARM	051	Armenia 	Armenija	\N
00040000-560a-df04-2570-fa1d03007b66	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-560a-df04-5ef1-e9aa0b30da75	AU	AUS	036	Australia 	Avstralija	\N
00040000-560a-df04-d821-575189f22baa	AT	AUT	040	Austria 	Avstrija	\N
00040000-560a-df04-5fa2-62e75a8a1530	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-560a-df04-3676-8e471e75474b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-560a-df04-3d72-765ee44d089c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-560a-df04-fb73-047a326f908c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-560a-df04-38b4-86e2e040e68a	BB	BRB	052	Barbados 	Barbados	\N
00040000-560a-df04-1b09-4d954b42293c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-560a-df04-dcc9-9d3b633895c4	BE	BEL	056	Belgium 	Belgija	\N
00040000-560a-df04-77a4-bed579bcd3af	BZ	BLZ	084	Belize 	Belize	\N
00040000-560a-df04-df2b-11a54d619b89	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-560a-df04-ee93-2093b63c9946	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-560a-df04-8a27-ac00a0a84875	BT	BTN	064	Bhutan 	Butan	\N
00040000-560a-df04-899b-ff6f2f3243dd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-560a-df04-7b68-6b2e5bbfc09f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-560a-df04-72d2-633c04429a2a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-560a-df04-852d-4418a298ddf2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-560a-df04-4b9a-5c3ac0182f21	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-560a-df04-cae3-d596f041896e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-560a-df04-9511-43f3397319dc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-560a-df04-9c97-c9fb9b718f01	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-560a-df04-cf5e-b01328f485e0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-560a-df04-7e0c-3d95d2fd39b3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-560a-df04-4116-944ccf835ecf	BI	BDI	108	Burundi 	Burundi 	\N
00040000-560a-df04-0633-afbaae7812c1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-560a-df04-f495-11dee226be49	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-560a-df04-664e-42a97d29f21b	CA	CAN	124	Canada 	Kanada	\N
00040000-560a-df04-a053-a1240580e419	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-560a-df04-c208-3425b202e0d1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-560a-df04-402d-85d793d77034	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-560a-df04-7eb2-6849d1f4d94f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-560a-df04-558b-73a408e35e4d	CL	CHL	152	Chile 	Čile	\N
00040000-560a-df04-50c5-67ae1c8f8d6a	CN	CHN	156	China 	Kitajska	\N
00040000-560a-df04-5fa2-d7115b86c530	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-560a-df04-46ce-343bc344fec5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-560a-df04-9a14-874c2a2ed905	CO	COL	170	Colombia 	Kolumbija	\N
00040000-560a-df04-0d86-c54b9d6f3bbc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-560a-df04-9133-0bd3f29e53fd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-560a-df04-0515-2a9d7d6c5940	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-560a-df04-69e1-7a209b696586	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-560a-df04-5fc1-b57c7c332151	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-560a-df04-b01c-b5a69b02d99a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-560a-df04-6ed9-99ac6e767a30	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-560a-df04-0aa5-2696825a67c1	CU	CUB	192	Cuba 	Kuba	\N
00040000-560a-df04-1361-c6fd79856587	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-560a-df04-a9d5-f3ba0ff4745d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-560a-df04-62cd-90ba8ecbb8b8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-560a-df04-e367-d51cf91f7ca8	DK	DNK	208	Denmark 	Danska	\N
00040000-560a-df04-f891-8ceb4c11bc32	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-560a-df04-bdfb-56c832ebbcf0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-df04-d531-39747ce0e122	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-560a-df04-93b2-f87bb0dbc8a0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-560a-df04-0832-b74fd0fe0c43	EG	EGY	818	Egypt 	Egipt	\N
00040000-560a-df04-c593-33a965915579	SV	SLV	222	El Salvador 	Salvador	\N
00040000-560a-df04-183b-d6388f4b632e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-560a-df04-2bd3-4f9411703a1a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-560a-df04-966e-4a8dbca5c5e7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-560a-df04-b3ea-d72d1eb0b971	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-560a-df04-92a4-a1c11eaec1b3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-560a-df04-4bcc-8b12cfad0b9a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-560a-df04-2eb0-50119b02aa5a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-560a-df04-4d1b-356e84d3e099	FI	FIN	246	Finland 	Finska	\N
00040000-560a-df04-14d5-91d100e863a6	FR	FRA	250	France 	Francija	\N
00040000-560a-df04-c7d3-1968127d4d4e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-560a-df04-e97c-4c1b4260ed9a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-560a-df04-f1ea-85587e39e89f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-560a-df04-0dbf-f37ff7ddf9de	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-560a-df04-b846-25e83af9ab12	GA	GAB	266	Gabon 	Gabon	\N
00040000-560a-df04-68a5-79878e3126f1	GM	GMB	270	Gambia 	Gambija	\N
00040000-560a-df04-125b-27cf6636ca10	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-560a-df04-2d61-2d7175e22202	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-560a-df04-6f4f-5a42a367ab3b	GH	GHA	288	Ghana 	Gana	\N
00040000-560a-df04-11ed-5309f851f508	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-560a-df04-a137-9efcc263d073	GR	GRC	300	Greece 	Grčija	\N
00040000-560a-df04-db12-097fdfe04bf5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-560a-df04-ca7d-b73307ede855	GD	GRD	308	Grenada 	Grenada	\N
00040000-560a-df04-8843-19e7e29fad5a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-560a-df04-7267-292afc6e3f2c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-560a-df04-09c1-d2995b03cfe6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-560a-df04-0f23-734cf4a6e0fd	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-560a-df04-004d-d4c4fe403d89	GN	GIN	324	Guinea 	Gvineja	\N
00040000-560a-df04-3dde-f86206bf46c7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-560a-df04-7ee2-e82ab8ed93d3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-560a-df04-eca0-8a432c51e586	HT	HTI	332	Haiti 	Haiti	\N
00040000-560a-df04-e7dc-16dc06eecc2e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-560a-df04-8419-78114c19d40b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-560a-df04-24d3-a697d2fb1e23	HN	HND	340	Honduras 	Honduras	\N
00040000-560a-df04-f452-d10ef09fd977	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-560a-df04-d109-2d1cdc1e8d0f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-560a-df04-967d-da7ac1883ed2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-560a-df04-63f0-e7ec05f64381	IN	IND	356	India 	Indija	\N
00040000-560a-df04-60cd-0c77c8ee2cdb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-560a-df04-4de8-95cdc78769a7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-560a-df04-ea32-adca02dacbc8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-560a-df04-ab47-62b280505500	IE	IRL	372	Ireland 	Irska	\N
00040000-560a-df04-de1a-10d4439cc82f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-560a-df04-0988-1547d63ae11a	IL	ISR	376	Israel 	Izrael	\N
00040000-560a-df04-e95e-dd00b10f4362	IT	ITA	380	Italy 	Italija	\N
00040000-560a-df04-406d-f140b63fc08b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-560a-df04-2ab2-0994e707a39a	JP	JPN	392	Japan 	Japonska	\N
00040000-560a-df04-a63b-92d995464319	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-560a-df04-3319-0cd94d3f5b90	JO	JOR	400	Jordan 	Jordanija	\N
00040000-560a-df04-19e7-4335f3865654	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-560a-df04-d882-c6292f6976f6	KE	KEN	404	Kenya 	Kenija	\N
00040000-560a-df04-8264-94621c1277c8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-560a-df04-56b0-cca5f2cf9bbb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-560a-df04-5bce-d10ca470fe21	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-560a-df04-bb71-e504300b284a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-560a-df04-2420-3e9b88cccb0b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-560a-df04-0ca0-b2dbc8de0271	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-560a-df04-279c-e7129215ef5a	LV	LVA	428	Latvia 	Latvija	\N
00040000-560a-df04-3381-1cd0a5e82215	LB	LBN	422	Lebanon 	Libanon	\N
00040000-560a-df04-9340-86edda1c41c5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-560a-df04-ffab-b8e9a1debe0c	LR	LBR	430	Liberia 	Liberija	\N
00040000-560a-df04-4865-acf7aa65930d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-560a-df04-d681-3cd57619c0c3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-560a-df04-5e9a-989f9a9143ea	LT	LTU	440	Lithuania 	Litva	\N
00040000-560a-df04-31f5-ca2bb290cbde	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-560a-df04-7ed8-cd5cba73e997	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-560a-df04-194d-53a992c10cb7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-560a-df04-ea35-35c89e38e501	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-560a-df04-37b8-9b31df2857fa	MW	MWI	454	Malawi 	Malavi	\N
00040000-560a-df04-cbc2-bebc187bb071	MY	MYS	458	Malaysia 	Malezija	\N
00040000-560a-df04-d95c-207417eda853	MV	MDV	462	Maldives 	Maldivi	\N
00040000-560a-df04-7e7f-2b34c124dd40	ML	MLI	466	Mali 	Mali	\N
00040000-560a-df04-146f-ce933e4db87b	MT	MLT	470	Malta 	Malta	\N
00040000-560a-df04-cb5c-8bf6e0955c98	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-560a-df04-1576-63859c9be305	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-560a-df04-e6bb-e77f5dc2b9ba	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-560a-df04-d0be-b902745a7535	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-560a-df04-0daf-157f0d83d44b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-560a-df04-37e7-38e59c648b08	MX	MEX	484	Mexico 	Mehika	\N
00040000-560a-df04-ec48-c7c5bd97ad68	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-560a-df04-1cc4-087240fa253d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-560a-df04-7fe4-75d6a985d61b	MC	MCO	492	Monaco 	Monako	\N
00040000-560a-df04-0259-4111ad15cbee	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-560a-df04-205c-7a2637964fea	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-560a-df04-b449-9f10225f04cf	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-560a-df04-f1cd-1d42657a279a	MA	MAR	504	Morocco 	Maroko	\N
00040000-560a-df04-9564-7683ba5bd639	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-560a-df04-9bbd-5325150bf5e5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-560a-df04-108b-fe6f3ccb43ab	NA	NAM	516	Namibia 	Namibija	\N
00040000-560a-df04-9584-3feb47f54fe8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-560a-df04-5c29-6f9200e0c400	NP	NPL	524	Nepal 	Nepal	\N
00040000-560a-df04-413d-7e5970e5d348	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-560a-df04-a2c5-fe3a4e55c624	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-560a-df04-3093-b1dbeb5b182d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-560a-df04-72a0-c7cb4d5b0269	NE	NER	562	Niger 	Niger 	\N
00040000-560a-df04-7fa1-0b485f0c0bd3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-560a-df04-e5a3-1214366d39f7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-560a-df04-896b-1a52245c0339	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-560a-df04-3f83-e4878c71256a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-560a-df04-abc0-69f1e9fb0d5d	NO	NOR	578	Norway 	Norveška	\N
00040000-560a-df04-174b-a49e84dbe52f	OM	OMN	512	Oman 	Oman	\N
00040000-560a-df04-52a7-a81b2816124c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-560a-df04-8640-21281caef303	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-560a-df04-3bc6-e7beca5a446b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-560a-df04-467e-593f8afb7fc9	PA	PAN	591	Panama 	Panama	\N
00040000-560a-df04-9d80-6ba00b9dddf4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-560a-df04-f0cc-eefa2c67dc5e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-560a-df04-03c9-6ae5d621d806	PE	PER	604	Peru 	Peru	\N
00040000-560a-df04-53ea-40c08bff3f0a	PH	PHL	608	Philippines 	Filipini	\N
00040000-560a-df04-ba02-8fc426d2e4fa	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-560a-df04-6279-c772fb0e51f6	PL	POL	616	Poland 	Poljska	\N
00040000-560a-df04-f6e8-ef9d2ee6adc1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-560a-df04-4887-a379941ebac4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-560a-df04-1bf1-e4aa166d3a85	QA	QAT	634	Qatar 	Katar	\N
00040000-560a-df04-a528-c0a35dd0a0e7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-560a-df04-0639-816a6d0cce28	RO	ROU	642	Romania 	Romunija	\N
00040000-560a-df04-388e-44f43054fcd7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-560a-df04-18a9-2b6e58e0f54c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-560a-df04-cbeb-2ea41bd10cd2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-560a-df04-755d-3e9b3915c44c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-560a-df04-9dd9-6a152758bf1e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-560a-df04-ec36-f55976670ffd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-560a-df04-35cd-f7d90c468b27	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-560a-df04-fee9-c72938a2b73f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-560a-df04-cfcf-1e08da493f69	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-560a-df04-427d-2c13250825f7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-560a-df04-f7dd-5ed39c3ee972	SM	SMR	674	San Marino 	San Marino	\N
00040000-560a-df04-82b3-64c0b5326136	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-560a-df04-f2c2-f5a8daa4f86b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-560a-df04-8d16-375bdfe4dd01	SN	SEN	686	Senegal 	Senegal	\N
00040000-560a-df04-1d26-f14002f317ee	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-560a-df04-c698-ecd94e0e7c38	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-560a-df04-64bf-9518b663faea	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-560a-df04-2971-7f53c03e551b	SG	SGP	702	Singapore 	Singapur	\N
00040000-560a-df04-1593-fc9914bc9ccb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-560a-df04-256c-7f132fb6f619	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-560a-df04-aed6-d65a0ab299c2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-560a-df04-de5f-e629765dc06e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-560a-df04-269a-476e5dcf4b49	SO	SOM	706	Somalia 	Somalija	\N
00040000-560a-df04-f944-f4f78c3b009f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-560a-df04-9559-44b6eda43da6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-560a-df04-c6f2-04faa14f6fca	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-560a-df04-6420-44322c4a977e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-560a-df04-f87a-39b4eb8217a3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-560a-df04-96ca-9810b3069135	SD	SDN	729	Sudan 	Sudan	\N
00040000-560a-df04-e0a1-98f55c64ed6b	SR	SUR	740	Suriname 	Surinam	\N
00040000-560a-df04-92b7-4fcf68b8d38e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-560a-df04-9b4b-4f6482fd55d2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-560a-df04-3372-946ac21a5ebf	SE	SWE	752	Sweden 	Švedska	\N
00040000-560a-df04-bcd9-0956002dc7b6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-560a-df04-dbc1-ebc87aa7e1a9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-560a-df04-c129-4aa4839d3d9f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-560a-df04-4da2-f4d2ab43d4a5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-560a-df04-4051-9edf38207149	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-560a-df04-1e6f-1cd7d792ff6e	TH	THA	764	Thailand 	Tajska	\N
00040000-560a-df04-e408-34c5b4f0a871	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-560a-df04-2764-cf436853d2be	TG	TGO	768	Togo 	Togo	\N
00040000-560a-df04-25c5-695414a07c44	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-560a-df04-e731-916b7a90a000	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-560a-df04-7b64-f0bfe044c19c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-560a-df04-2861-31e49eb849ed	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-560a-df04-86ad-5d6b2eb3157b	TR	TUR	792	Turkey 	Turčija	\N
00040000-560a-df04-7114-b9888616be5f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-560a-df04-4049-d9b9cdfe78e3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-df04-6c53-f3bb782a132d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-560a-df04-6eb1-0e2ef6d1d98e	UG	UGA	800	Uganda 	Uganda	\N
00040000-560a-df04-f4fc-91e61f8fd1de	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-560a-df04-c952-4dc1b1f35318	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-560a-df04-73ef-b4348007a609	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-560a-df04-1e33-4e9090f64580	US	USA	840	United States 	Združene države Amerike	\N
00040000-560a-df04-3cf5-442117fee9be	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-560a-df04-ebf7-006fbe332c27	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-560a-df04-9105-438beb0eb170	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-560a-df04-bc1a-720a7cee071b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-560a-df04-fcba-c100f6ce346a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-560a-df04-76c8-ce70be015247	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-560a-df04-b60d-c097875d010a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-df04-cd35-28af0f3d108a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-560a-df04-bbb8-56323349cc33	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-560a-df04-1f9c-2e8e12736761	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-560a-df04-4add-5d4c75c0452c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-560a-df04-4514-dd08e013ad9b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-560a-df04-ee14-e388dbd3f23f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3026 (class 0 OID 21085500)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-560a-df07-4441-25e46bd0ec34	000e0000-560a-df07-61ac-f970c1bec2da	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-df04-2c30-059e3275bfc6	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-df07-54d9-65af9aacbe27	000e0000-560a-df07-d0f0-9b83bb32956b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-df04-d1bb-5eab2b4708d8	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-df07-fad2-c18fb7e00ffa	000e0000-560a-df07-26d9-52fb90382b85	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-df04-2c30-059e3275bfc6	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-df07-0621-dd2d819b0fa4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-df07-f9ac-56d219c8968d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 21085302)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-560a-df07-73de-5c32acfa5b00	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-26de-d98c57dd80cc	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-df04-cded-3d4b4695f314
000d0000-560a-df07-96b1-054bf28e39ac	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-1b85-11b9fbd96c06	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-560a-df04-7940-f7a2bd7f7a5a
000d0000-560a-df07-d1a2-b505b4b1eff2	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-f58f-05b18ae324e0	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-560a-df04-738d-98e06a54df3c
000d0000-560a-df07-57b9-8643fda4128d	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-fb08-c52dc49c7f87	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-560a-df04-89f9-e2d4cfa28ae8
000d0000-560a-df07-17df-3f62a27acf71	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-fe85-8b86d7afd6cf	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-560a-df04-89f9-e2d4cfa28ae8
000d0000-560a-df07-aa97-b413a0480403	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-e0de-bbd8eb37a39a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-df04-cded-3d4b4695f314
000d0000-560a-df07-ed6c-8b8926faa232	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-af05-19227336c834	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-560a-df04-cded-3d4b4695f314
000d0000-560a-df07-eb71-988fc3f16819	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-6ac2-f6738de1e9c9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-560a-df04-3128-b8ec4fd21a84
000d0000-560a-df07-9079-f9dfa2cf38e6	000e0000-560a-df07-d0f0-9b83bb32956b	000c0000-560a-df07-6e58-ed1929eb0b24	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-560a-df04-6a85-9d44ea964b7c
\.


--
-- TOC entry 2991 (class 0 OID 21085117)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21085091)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21085068)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-560a-df07-0fdf-ce9fa6bc9894	00080000-560a-df07-955f-8e9fc4c58b37	00090000-560a-df07-1d49-0651d00838aa	AK		igralka
\.


--
-- TOC entry 3000 (class 0 OID 21085216)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21085710)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21085722)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21085744)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 21083192)
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
\.


--
-- TOC entry 3004 (class 0 OID 21085241)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21085025)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-560a-df05-a4de-d11263c8e9c2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-560a-df05-1603-fa1c3d62f047	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-560a-df05-94e0-20ac7a2e49b0	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-560a-df05-f629-ae02ed04e114	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-560a-df05-f455-f35746ffd26a	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-560a-df05-4436-30cba308c15f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-560a-df05-99f8-7676a3453dd4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-560a-df05-bde0-3f7a0b7b32d4	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-df05-3bbc-a96b94ea2526	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-df05-711a-543ffe1b1456	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-560a-df05-3d4d-5093bba95797	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-560a-df05-8db5-80e72d636c07	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-560a-df05-b594-7aa8007c1ec3	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-560a-df05-ecb6-e05fe7b797eb	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-560a-df05-7af6-7e31972004e9	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-560a-df07-d681-0af2a846eaaa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-560a-df07-2a4c-6411ac59f974	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-560a-df07-a18a-73cc0257e01c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-560a-df07-634e-348625eabd4d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-560a-df07-67bf-323b4072b726	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-560a-df09-11dc-00b50ac16f16	application.tenant.maticnopodjetje	string	s:36:"00080000-560a-df09-d02e-cb46115515d9";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2978 (class 0 OID 21084939)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-560a-df07-db4a-9197b40661d7	00000000-560a-df07-d681-0af2a846eaaa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-560a-df07-7edc-73c6c4de001f	00000000-560a-df07-d681-0af2a846eaaa	00010000-560a-df05-186c-2208067a9070	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-560a-df07-cec2-ae60319a18bd	00000000-560a-df07-2a4c-6411ac59f974	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2979 (class 0 OID 21084950)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-560a-df07-e4ec-f257f43e0dbb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-560a-df07-f17d-d5a82ce93cc5	00010000-560a-df07-5a6f-ae1ec24af6db	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-560a-df07-44d7-cab6c2e5c5c6	00010000-560a-df07-303c-63fa68d0ec2b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-560a-df07-9a0c-45dc84ecd192	00010000-560a-df07-0f95-2e0027bd6013	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-560a-df07-1d24-62f5299c56e6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-560a-df07-a916-db37d8811caa	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-560a-df07-f0ed-5351f099b359	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-560a-df07-1f7f-039e99b28174	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-560a-df07-1d49-0651d00838aa	00010000-560a-df07-50e0-630acf8158e9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-560a-df07-06d2-125a64a0aa64	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-560a-df07-a0ab-ca96094d095e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-df07-7a57-7328e7020020	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-560a-df07-93c3-052a09b9bccb	00010000-560a-df07-8c3b-54170afc8382	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-df07-e52b-51d4168c2ca1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-df07-0500-78151e77f4d4	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-df07-a3a7-9e43233b560c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-df07-0d57-85552a4e16c9	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-560a-df07-83e3-e09a96e49711	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 21084904)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-560a-df05-6e7e-170d9e145776	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-560a-df05-0a1b-f6c13e3074e9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-560a-df05-1e04-a90d67367b2f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-560a-df05-4a05-56ac81a285df	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-560a-df05-70ba-f758be145351	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-560a-df05-3192-abc62fa16910	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-560a-df05-ee39-ba34f4722dc6	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-560a-df05-cdf6-1e64e3e7c863	Abonma-read	Abonma - branje	f
00030000-560a-df05-d2b0-05a3c80008d9	Abonma-write	Abonma - spreminjanje	f
00030000-560a-df05-6d49-1affa9c494ac	Alternacija-read	Alternacija - branje	f
00030000-560a-df05-0483-b2ccdfd5c26b	Alternacija-write	Alternacija - spreminjanje	f
00030000-560a-df05-2da9-3c286a0bf88e	Arhivalija-read	Arhivalija - branje	f
00030000-560a-df05-d461-1228172aedbb	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-560a-df05-645a-cf2bc03fedfb	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-560a-df05-bede-d4f9ab8a400a	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-560a-df05-53af-910f3496fc14	Besedilo-read	Besedilo - branje	f
00030000-560a-df05-58d8-5183f3a7b03e	Besedilo-write	Besedilo - spreminjanje	f
00030000-560a-df05-2104-4838621f3b31	DogodekIzven-read	DogodekIzven - branje	f
00030000-560a-df05-e7a1-cde45913eafb	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-560a-df05-c9b9-e15eb33e8ca6	Dogodek-read	Dogodek - branje	f
00030000-560a-df05-be09-f6cf2cee371f	Dogodek-write	Dogodek - spreminjanje	f
00030000-560a-df05-8559-c29350152c87	DrugiVir-read	DrugiVir - branje	f
00030000-560a-df05-6e7e-697ddc398ece	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-560a-df05-54a9-a2388738d98d	Drzava-read	Drzava - branje	f
00030000-560a-df05-f0a8-ac7d7f5a12c7	Drzava-write	Drzava - spreminjanje	f
00030000-560a-df05-ea9b-d9c0d2fd77a3	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-560a-df05-a83c-7ab0cd610b08	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-560a-df05-6a96-3669a9415bd9	Funkcija-read	Funkcija - branje	f
00030000-560a-df05-5ad0-f74abd96ed4f	Funkcija-write	Funkcija - spreminjanje	f
00030000-560a-df05-f7b7-f2970262152c	Gostovanje-read	Gostovanje - branje	f
00030000-560a-df05-dc81-1fc78ba3769e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-560a-df05-02ee-7787cfef15b3	Gostujoca-read	Gostujoca - branje	f
00030000-560a-df05-1063-82f39d6d9e7c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-560a-df05-8fa1-1ffcc5371326	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-560a-df05-2e36-e27d954775da	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-560a-df05-e62f-80ecbfe64929	Kupec-read	Kupec - branje	f
00030000-560a-df05-e1b5-be4bccf474c1	Kupec-write	Kupec - spreminjanje	f
00030000-560a-df05-d6ae-4087fc6181d0	NacinPlacina-read	NacinPlacina - branje	f
00030000-560a-df05-d43a-c5375cf68780	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-560a-df05-eb35-32ca22027e6b	Option-read	Option - branje	f
00030000-560a-df05-08f5-0311c13fc1b5	Option-write	Option - spreminjanje	f
00030000-560a-df05-4b21-5468fbe2a7db	OptionValue-read	OptionValue - branje	f
00030000-560a-df05-8070-9b252e556e92	OptionValue-write	OptionValue - spreminjanje	f
00030000-560a-df05-4475-97292df7b464	Oseba-read	Oseba - branje	f
00030000-560a-df05-0b4e-dc8ba46a43c6	Oseba-write	Oseba - spreminjanje	f
00030000-560a-df05-65dc-702a01db7cbb	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-560a-df05-637b-cfe1e03cb887	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-560a-df05-9288-5af7e50fd2d8	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-560a-df05-9a88-57b4349c3d4e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-560a-df05-60c4-9ca65335e488	Pogodba-read	Pogodba - branje	f
00030000-560a-df05-52fa-ee4181696cb4	Pogodba-write	Pogodba - spreminjanje	f
00030000-560a-df05-75f6-34243f8e5332	Popa-read	Popa - branje	f
00030000-560a-df05-075b-7e6e8a13861f	Popa-write	Popa - spreminjanje	f
00030000-560a-df05-4e75-f706c0345826	Posta-read	Posta - branje	f
00030000-560a-df05-7e13-9550480346f1	Posta-write	Posta - spreminjanje	f
00030000-560a-df05-f35e-4c6bf1dc54ee	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-560a-df05-73af-fdd2d7c448ea	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-560a-df05-512a-9fc57ad2befe	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-560a-df05-7658-acd3cbcbd769	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-560a-df05-aa2d-6f8b3a9335d0	PostniNaslov-read	PostniNaslov - branje	f
00030000-560a-df05-2210-5aaa949acc6b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-560a-df05-d7fa-83666e324a76	Predstava-read	Predstava - branje	f
00030000-560a-df05-0978-e5fc5f974928	Predstava-write	Predstava - spreminjanje	f
00030000-560a-df05-0af2-fae2944f61f6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-560a-df05-d92a-1751c8a9f1bd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-560a-df05-f073-588cb5e29049	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-560a-df05-51f9-5b2d9f3b64f4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-560a-df05-1a70-a89a2500939d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-560a-df05-9a6c-72b0dbcd10dd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-560a-df05-3726-88e175172268	ProgramDela-read	ProgramDela - branje	f
00030000-560a-df05-f86d-5d16c7ed90f8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-560a-df05-fa7d-23ccf2451114	ProgramFestival-read	ProgramFestival - branje	f
00030000-560a-df05-33c2-0d3953362321	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-560a-df05-ce14-027a8c292bda	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-560a-df05-b7f1-783782f8d73d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-560a-df05-961d-70c14a510a40	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-560a-df05-f087-3602840fb50d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-560a-df05-acb2-9b452a2114dc	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-560a-df05-5aec-bc57d1cb0df2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-560a-df05-343d-dc1cf9fc208f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-560a-df05-5835-fdd41188884f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-560a-df05-678c-c222e4af6adc	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-560a-df05-7906-b7715d9d2d68	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-560a-df05-6ca9-85a04399c94d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-560a-df05-aaaa-96b6f1c91104	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-560a-df05-9ca0-1536cec0a977	ProgramRazno-read	ProgramRazno - branje	f
00030000-560a-df05-b4e6-9836155e16ef	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-560a-df05-8345-518de02d7501	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-560a-df05-d496-b5465e231c43	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-560a-df05-bcc0-6e8996a9b514	Prostor-read	Prostor - branje	f
00030000-560a-df05-628c-79a6f896c9b0	Prostor-write	Prostor - spreminjanje	f
00030000-560a-df05-7def-1c05ea50777f	Racun-read	Racun - branje	f
00030000-560a-df05-4b6c-7ddf4a8b7c02	Racun-write	Racun - spreminjanje	f
00030000-560a-df05-ade9-44d3e16d6575	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-560a-df05-f857-9e9f7b2da995	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-560a-df05-6cde-9e95233c3c37	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-560a-df05-fa3d-37f96303940b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-560a-df05-dc75-5a9b4d361294	Rekvizit-read	Rekvizit - branje	f
00030000-560a-df05-2e35-d2b7efca65f2	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-560a-df05-c565-7a88deaa3f9d	Revizija-read	Revizija - branje	f
00030000-560a-df05-472a-0411969fdd1a	Revizija-write	Revizija - spreminjanje	f
00030000-560a-df05-a038-26489ccc34f6	Rezervacija-read	Rezervacija - branje	f
00030000-560a-df05-8d65-d9ab054a2ac8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-560a-df05-1325-e5e3199e21cf	SedezniRed-read	SedezniRed - branje	f
00030000-560a-df05-a605-3de7d15806bb	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-560a-df05-85f2-ebd9ad755561	Sedez-read	Sedez - branje	f
00030000-560a-df05-27f3-a31c46891707	Sedez-write	Sedez - spreminjanje	f
00030000-560a-df05-94aa-32dab8bbeb8b	Sezona-read	Sezona - branje	f
00030000-560a-df05-c22c-cfe88a5d4573	Sezona-write	Sezona - spreminjanje	f
00030000-560a-df05-0784-f4c2f41f984b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-560a-df05-e7a2-fefbffc69044	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-560a-df05-b6a6-952ad5ad29ce	Stevilcenje-read	Stevilcenje - branje	f
00030000-560a-df05-e5d1-d89be5c0e0ac	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-560a-df05-28a3-c80d29c04dc4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-560a-df05-8c01-a7895861cbe6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-560a-df05-448a-9397fe225e7a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-560a-df05-7bdb-149ab8d0461f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-560a-df05-e794-22651ff12cc5	Telefonska-read	Telefonska - branje	f
00030000-560a-df05-37ff-ccffb0d9e987	Telefonska-write	Telefonska - spreminjanje	f
00030000-560a-df05-8721-1d6de634ff13	TerminStoritve-read	TerminStoritve - branje	f
00030000-560a-df05-663d-bdafe1a0d01e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-560a-df05-c606-765bdf60ea67	TipFunkcije-read	TipFunkcije - branje	f
00030000-560a-df05-cf8b-5829ce4970e4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-560a-df05-8f9c-d1d72b24cce4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-560a-df05-875e-83371de3329d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-560a-df05-ffe1-521aad56ac40	Trr-read	Trr - branje	f
00030000-560a-df05-4479-269c8acfdbe7	Trr-write	Trr - spreminjanje	f
00030000-560a-df05-db1f-f801c6b4c28d	Uprizoritev-read	Uprizoritev - branje	f
00030000-560a-df05-2faa-3b1fc822209b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-560a-df05-8ef7-b2a46bc66565	Vaja-read	Vaja - branje	f
00030000-560a-df05-de07-b97fd59f672b	Vaja-write	Vaja - spreminjanje	f
00030000-560a-df05-9e40-4d1237021979	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-560a-df05-e2e7-de15df2eae51	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-560a-df05-ede7-1fc1c765b5a9	VrstaStroska-read	VrstaStroska - branje	f
00030000-560a-df05-2c19-ffc9bf6a9567	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-560a-df05-a9a9-7a4a24cdbdda	Zaposlitev-read	Zaposlitev - branje	f
00030000-560a-df05-e069-fb9b069295a2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-560a-df05-f0db-0cc6ae676896	Zasedenost-read	Zasedenost - branje	f
00030000-560a-df05-3817-90daeb5994d1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-560a-df05-cbe2-28ab7ba253dd	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-560a-df05-f757-aec330dfc516	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-560a-df05-d9ad-4208febc4689	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-560a-df05-583b-1cc07a26f07d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-560a-df05-d81f-16f989f887d7	Job-read	Branje opravil - samo zase - branje	f
00030000-560a-df05-6b5c-ac0ac42a8631	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-560a-df05-d5e2-96d1a7b8cb41	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-560a-df05-70a3-3236b2699c96	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-560a-df05-765b-82275cca0b08	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-560a-df05-fa75-329dc66adc31	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-560a-df05-a42d-8210f692592e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-560a-df05-56b9-5616262f50ab	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-df05-2638-0cb2867440dc	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-df05-7a6b-a4c31242944e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-df05-182f-6c3c2e26a424	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-df05-deb4-56a11bdae6d4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-560a-df05-e759-38c526fc7856	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-560a-df05-5a91-d08af7243b66	Datoteka-write	Datoteka - spreminjanje	f
00030000-560a-df05-9b9c-bec256cc28e8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2976 (class 0 OID 21084923)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-560a-df05-4f87-57d8579090c2	00030000-560a-df05-0a1b-f6c13e3074e9
00020000-560a-df05-99ec-8f7dd0a7f401	00030000-560a-df05-54a9-a2388738d98d
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-cdf6-1e64e3e7c863
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-d2b0-05a3c80008d9
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-6d49-1affa9c494ac
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-0483-b2ccdfd5c26b
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-2da9-3c286a0bf88e
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-c9b9-e15eb33e8ca6
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-4a05-56ac81a285df
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-be09-f6cf2cee371f
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-54a9-a2388738d98d
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-f0a8-ac7d7f5a12c7
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-6a96-3669a9415bd9
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-5ad0-f74abd96ed4f
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-f7b7-f2970262152c
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-dc81-1fc78ba3769e
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-02ee-7787cfef15b3
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-1063-82f39d6d9e7c
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-8fa1-1ffcc5371326
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-2e36-e27d954775da
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-eb35-32ca22027e6b
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-4b21-5468fbe2a7db
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-4475-97292df7b464
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-0b4e-dc8ba46a43c6
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-75f6-34243f8e5332
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-075b-7e6e8a13861f
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-4e75-f706c0345826
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-7e13-9550480346f1
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-aa2d-6f8b3a9335d0
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-2210-5aaa949acc6b
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-d7fa-83666e324a76
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-0978-e5fc5f974928
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-1a70-a89a2500939d
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-9a6c-72b0dbcd10dd
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-bcc0-6e8996a9b514
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-628c-79a6f896c9b0
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-6cde-9e95233c3c37
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-fa3d-37f96303940b
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-dc75-5a9b4d361294
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-2e35-d2b7efca65f2
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-94aa-32dab8bbeb8b
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-c22c-cfe88a5d4573
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-c606-765bdf60ea67
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-db1f-f801c6b4c28d
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-2faa-3b1fc822209b
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-8ef7-b2a46bc66565
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-de07-b97fd59f672b
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-f0db-0cc6ae676896
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-3817-90daeb5994d1
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-cbe2-28ab7ba253dd
00020000-560a-df05-dbb6-a4177a36d67d	00030000-560a-df05-d9ad-4208febc4689
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-cdf6-1e64e3e7c863
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-2da9-3c286a0bf88e
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-c9b9-e15eb33e8ca6
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-54a9-a2388738d98d
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-f7b7-f2970262152c
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-02ee-7787cfef15b3
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-8fa1-1ffcc5371326
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-2e36-e27d954775da
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-eb35-32ca22027e6b
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-4b21-5468fbe2a7db
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-4475-97292df7b464
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-0b4e-dc8ba46a43c6
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-75f6-34243f8e5332
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-4e75-f706c0345826
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-aa2d-6f8b3a9335d0
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-2210-5aaa949acc6b
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-d7fa-83666e324a76
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-bcc0-6e8996a9b514
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-6cde-9e95233c3c37
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-dc75-5a9b4d361294
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-94aa-32dab8bbeb8b
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-e794-22651ff12cc5
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-37ff-ccffb0d9e987
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-ffe1-521aad56ac40
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-4479-269c8acfdbe7
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-a9a9-7a4a24cdbdda
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-e069-fb9b069295a2
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-cbe2-28ab7ba253dd
00020000-560a-df05-4452-4a7941ca4371	00030000-560a-df05-d9ad-4208febc4689
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-cdf6-1e64e3e7c863
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-6d49-1affa9c494ac
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-2da9-3c286a0bf88e
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-d461-1228172aedbb
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-53af-910f3496fc14
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-2104-4838621f3b31
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-c9b9-e15eb33e8ca6
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-54a9-a2388738d98d
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-6a96-3669a9415bd9
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-f7b7-f2970262152c
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-02ee-7787cfef15b3
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-8fa1-1ffcc5371326
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-eb35-32ca22027e6b
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-4b21-5468fbe2a7db
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-4475-97292df7b464
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-75f6-34243f8e5332
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-4e75-f706c0345826
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-d7fa-83666e324a76
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-1a70-a89a2500939d
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-bcc0-6e8996a9b514
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-6cde-9e95233c3c37
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-dc75-5a9b4d361294
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-94aa-32dab8bbeb8b
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-c606-765bdf60ea67
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-8ef7-b2a46bc66565
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-f0db-0cc6ae676896
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-cbe2-28ab7ba253dd
00020000-560a-df05-5801-6c1f8363487a	00030000-560a-df05-d9ad-4208febc4689
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-cdf6-1e64e3e7c863
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-d2b0-05a3c80008d9
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-0483-b2ccdfd5c26b
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-2da9-3c286a0bf88e
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-c9b9-e15eb33e8ca6
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-54a9-a2388738d98d
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-f7b7-f2970262152c
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-02ee-7787cfef15b3
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-eb35-32ca22027e6b
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-4b21-5468fbe2a7db
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-75f6-34243f8e5332
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-4e75-f706c0345826
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-d7fa-83666e324a76
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-bcc0-6e8996a9b514
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-6cde-9e95233c3c37
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-dc75-5a9b4d361294
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-94aa-32dab8bbeb8b
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-c606-765bdf60ea67
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-cbe2-28ab7ba253dd
00020000-560a-df05-db75-848841dfb926	00030000-560a-df05-d9ad-4208febc4689
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-cdf6-1e64e3e7c863
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-2da9-3c286a0bf88e
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-c9b9-e15eb33e8ca6
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-54a9-a2388738d98d
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-f7b7-f2970262152c
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-02ee-7787cfef15b3
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-eb35-32ca22027e6b
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-4b21-5468fbe2a7db
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-75f6-34243f8e5332
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-4e75-f706c0345826
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-d7fa-83666e324a76
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-bcc0-6e8996a9b514
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-6cde-9e95233c3c37
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-dc75-5a9b4d361294
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-94aa-32dab8bbeb8b
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-8721-1d6de634ff13
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-1e04-a90d67367b2f
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-c606-765bdf60ea67
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-cbe2-28ab7ba253dd
00020000-560a-df05-391e-9d8ee6dda098	00030000-560a-df05-d9ad-4208febc4689
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-6e7e-170d9e145776
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-0a1b-f6c13e3074e9
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-1e04-a90d67367b2f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-4a05-56ac81a285df
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-70ba-f758be145351
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-3192-abc62fa16910
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-ee39-ba34f4722dc6
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-cdf6-1e64e3e7c863
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d2b0-05a3c80008d9
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-6d49-1affa9c494ac
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-0483-b2ccdfd5c26b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-2da9-3c286a0bf88e
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d461-1228172aedbb
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-53af-910f3496fc14
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-58d8-5183f3a7b03e
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-2104-4838621f3b31
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e7a1-cde45913eafb
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-c9b9-e15eb33e8ca6
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-be09-f6cf2cee371f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-54a9-a2388738d98d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f0a8-ac7d7f5a12c7
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8559-c29350152c87
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-6e7e-697ddc398ece
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-ea9b-d9c0d2fd77a3
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-a83c-7ab0cd610b08
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-6a96-3669a9415bd9
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-5ad0-f74abd96ed4f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f7b7-f2970262152c
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-dc81-1fc78ba3769e
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-02ee-7787cfef15b3
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-1063-82f39d6d9e7c
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8fa1-1ffcc5371326
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-2e36-e27d954775da
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e62f-80ecbfe64929
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e1b5-be4bccf474c1
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d6ae-4087fc6181d0
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d43a-c5375cf68780
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-eb35-32ca22027e6b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-08f5-0311c13fc1b5
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-4b21-5468fbe2a7db
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8070-9b252e556e92
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-4475-97292df7b464
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-0b4e-dc8ba46a43c6
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-65dc-702a01db7cbb
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-637b-cfe1e03cb887
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-9288-5af7e50fd2d8
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-9a88-57b4349c3d4e
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-60c4-9ca65335e488
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-52fa-ee4181696cb4
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-75f6-34243f8e5332
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-075b-7e6e8a13861f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-4e75-f706c0345826
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-7e13-9550480346f1
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f35e-4c6bf1dc54ee
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-73af-fdd2d7c448ea
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-512a-9fc57ad2befe
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-7658-acd3cbcbd769
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-aa2d-6f8b3a9335d0
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-2210-5aaa949acc6b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d7fa-83666e324a76
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-0978-e5fc5f974928
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-0af2-fae2944f61f6
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d92a-1751c8a9f1bd
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f073-588cb5e29049
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-51f9-5b2d9f3b64f4
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-1a70-a89a2500939d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-9a6c-72b0dbcd10dd
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-3726-88e175172268
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f86d-5d16c7ed90f8
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-fa7d-23ccf2451114
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-33c2-0d3953362321
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-ce14-027a8c292bda
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-b7f1-783782f8d73d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-961d-70c14a510a40
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f087-3602840fb50d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-acb2-9b452a2114dc
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-5aec-bc57d1cb0df2
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-343d-dc1cf9fc208f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-5835-fdd41188884f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-678c-c222e4af6adc
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-7906-b7715d9d2d68
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-6ca9-85a04399c94d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-aaaa-96b6f1c91104
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-9ca0-1536cec0a977
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-b4e6-9836155e16ef
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8345-518de02d7501
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d496-b5465e231c43
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-bcc0-6e8996a9b514
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-628c-79a6f896c9b0
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-7def-1c05ea50777f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-4b6c-7ddf4a8b7c02
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-ade9-44d3e16d6575
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f857-9e9f7b2da995
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-6cde-9e95233c3c37
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-fa3d-37f96303940b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-dc75-5a9b4d361294
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-2e35-d2b7efca65f2
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-c565-7a88deaa3f9d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-472a-0411969fdd1a
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-a038-26489ccc34f6
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8d65-d9ab054a2ac8
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-1325-e5e3199e21cf
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-a605-3de7d15806bb
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-85f2-ebd9ad755561
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-27f3-a31c46891707
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-94aa-32dab8bbeb8b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-c22c-cfe88a5d4573
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-0784-f4c2f41f984b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e7a2-fefbffc69044
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-b6a6-952ad5ad29ce
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e5d1-d89be5c0e0ac
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-28a3-c80d29c04dc4
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8c01-a7895861cbe6
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-448a-9397fe225e7a
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-7bdb-149ab8d0461f
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e794-22651ff12cc5
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-37ff-ccffb0d9e987
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8721-1d6de634ff13
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-663d-bdafe1a0d01e
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-c606-765bdf60ea67
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-cf8b-5829ce4970e4
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8f9c-d1d72b24cce4
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-875e-83371de3329d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-ffe1-521aad56ac40
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-4479-269c8acfdbe7
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-db1f-f801c6b4c28d
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-2faa-3b1fc822209b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-8ef7-b2a46bc66565
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-de07-b97fd59f672b
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-9e40-4d1237021979
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e2e7-de15df2eae51
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-ede7-1fc1c765b5a9
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-2c19-ffc9bf6a9567
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-a9a9-7a4a24cdbdda
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-e069-fb9b069295a2
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f0db-0cc6ae676896
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-3817-90daeb5994d1
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-cbe2-28ab7ba253dd
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-f757-aec330dfc516
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-d9ad-4208febc4689
00020000-560a-df07-68ab-a1e3c3783a5f	00030000-560a-df05-583b-1cc07a26f07d
\.


--
-- TOC entry 3005 (class 0 OID 21085248)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21085282)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 21085418)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-560a-df07-5edc-8581b45edc09	00090000-560a-df07-e4ec-f257f43e0dbb	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-560a-df07-0fa5-b60c35becef6	00090000-560a-df07-a916-db37d8811caa	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-560a-df07-59b8-be9b079726a4	00090000-560a-df07-93c3-052a09b9bccb	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-560a-df07-92d1-ae9d102ce96e	00090000-560a-df07-06d2-125a64a0aa64	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2981 (class 0 OID 21084983)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-560a-df07-955f-8e9fc4c58b37	00040000-560a-df04-aed6-d65a0ab299c2	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df07-bfcc-0bc18dc0d619	00040000-560a-df04-aed6-d65a0ab299c2	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-560a-df07-1d83-f4d4fef02acb	00040000-560a-df04-aed6-d65a0ab299c2	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df07-c454-fc64dfda5096	00040000-560a-df04-aed6-d65a0ab299c2	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df07-771d-af8773d4177e	00040000-560a-df04-aed6-d65a0ab299c2	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df07-f000-c2ba0eb25034	00040000-560a-df04-4806-ece11d56a02e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df07-fd98-3bc197382d46	00040000-560a-df04-6ed9-99ac6e767a30	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df07-3886-b87835cdb212	00040000-560a-df04-d821-575189f22baa	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df07-4c17-c54a05110ea3	00040000-560a-df04-2d61-2d7175e22202	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-df09-d02e-cb46115515d9	00040000-560a-df04-aed6-d65a0ab299c2	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2983 (class 0 OID 21085017)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-560a-df04-a1b0-bc3c831dc1f5	8341	Adlešiči
00050000-560a-df04-74ab-716c0fb879aa	5270	Ajdovščina
00050000-560a-df04-b231-c04ceaad5742	6280	Ankaran/Ancarano
00050000-560a-df04-7d33-8ea17df26918	9253	Apače
00050000-560a-df04-9d3f-85e6425e4109	8253	Artiče
00050000-560a-df04-0b4e-feab7067e7c3	4275	Begunje na Gorenjskem
00050000-560a-df04-2627-fcf30cdfd86d	1382	Begunje pri Cerknici
00050000-560a-df04-b39f-a2d2547428c0	9231	Beltinci
00050000-560a-df04-0210-e1914b75e1d7	2234	Benedikt
00050000-560a-df04-dbf4-953a63004ed9	2345	Bistrica ob Dravi
00050000-560a-df04-77ac-3b3c1ed41c56	3256	Bistrica ob Sotli
00050000-560a-df04-7028-edb80ceaed61	8259	Bizeljsko
00050000-560a-df04-7fa5-d1c6a458a1e5	1223	Blagovica
00050000-560a-df04-bb99-267db75e6b9c	8283	Blanca
00050000-560a-df04-9c5a-adf7e10468bd	4260	Bled
00050000-560a-df04-f958-acaf6828cc83	4273	Blejska Dobrava
00050000-560a-df04-d4ee-9260f203f981	9265	Bodonci
00050000-560a-df04-e664-d1220e0f21d4	9222	Bogojina
00050000-560a-df04-64fc-0ad2efe9ac3c	4263	Bohinjska Bela
00050000-560a-df04-3c35-adf07ddf3a1c	4264	Bohinjska Bistrica
00050000-560a-df04-b853-dddcd8b9087c	4265	Bohinjsko jezero
00050000-560a-df04-4d18-034300114732	1353	Borovnica
00050000-560a-df04-0c6e-98869c5b1cc5	8294	Boštanj
00050000-560a-df04-842e-e8233257ff2b	5230	Bovec
00050000-560a-df04-b1e3-b412c2d4d73e	5295	Branik
00050000-560a-df04-2bd0-42b143908bfa	3314	Braslovče
00050000-560a-df04-0120-2422faf7fde6	5223	Breginj
00050000-560a-df04-edd7-87db6ba79782	8280	Brestanica
00050000-560a-df04-b442-eace56d195fc	2354	Bresternica
00050000-560a-df04-c33c-66d374ef8c27	4243	Brezje
00050000-560a-df04-5b4d-5777eda375a8	1351	Brezovica pri Ljubljani
00050000-560a-df04-bd11-872e527cea91	8250	Brežice
00050000-560a-df04-926c-e481618349f3	4210	Brnik - Aerodrom
00050000-560a-df04-d6f5-4364ea07f929	8321	Brusnice
00050000-560a-df04-58fc-54601a5a4b98	3255	Buče
00050000-560a-df04-d6e5-8792402e499a	8276	Bučka 
00050000-560a-df04-07b8-44000b9dff59	9261	Cankova
00050000-560a-df04-7f76-e30808669686	3000	Celje 
00050000-560a-df04-2aa7-760d2d5edbeb	3001	Celje - poštni predali
00050000-560a-df04-b84c-13e505d8af92	4207	Cerklje na Gorenjskem
00050000-560a-df04-9b08-c16c9ab273da	8263	Cerklje ob Krki
00050000-560a-df04-f486-d0ec25f00f2b	1380	Cerknica
00050000-560a-df04-0cb2-9abadace3070	5282	Cerkno
00050000-560a-df04-b8ad-de527c118612	2236	Cerkvenjak
00050000-560a-df04-7d56-1110ac1e68db	2215	Ceršak
00050000-560a-df04-f0e2-3f6b4987dcb5	2326	Cirkovce
00050000-560a-df04-5d77-2906f10f6890	2282	Cirkulane
00050000-560a-df04-237e-d19edb4c5b84	5273	Col
00050000-560a-df04-05cc-3e0150accc86	8251	Čatež ob Savi
00050000-560a-df04-1010-2e28a3617414	1413	Čemšenik
00050000-560a-df04-6afb-0886bfd0787a	5253	Čepovan
00050000-560a-df04-c99a-5eb73fea4917	9232	Črenšovci
00050000-560a-df04-ff95-06ba622e0342	2393	Črna na Koroškem
00050000-560a-df04-14d1-f905e30b30b3	6275	Črni Kal
00050000-560a-df04-8f11-10c2661ca40a	5274	Črni Vrh nad Idrijo
00050000-560a-df04-faa6-2cbbe191257d	5262	Črniče
00050000-560a-df04-9e5c-854a154133a2	8340	Črnomelj
00050000-560a-df04-8871-284fcad868ea	6271	Dekani
00050000-560a-df04-3b4b-0435ebec73bb	5210	Deskle
00050000-560a-df04-8da7-fa3bab65b7b4	2253	Destrnik
00050000-560a-df04-91ea-da4f040194fb	6215	Divača
00050000-560a-df04-aca9-569db58ab3fd	1233	Dob
00050000-560a-df04-b1bf-ed4ccef406fa	3224	Dobje pri Planini
00050000-560a-df04-47f8-73eac32ae7f0	8257	Dobova
00050000-560a-df04-d684-6d384b314b66	1423	Dobovec
00050000-560a-df04-5892-1c48ab3d6b28	5263	Dobravlje
00050000-560a-df04-97ec-d00905b23676	3204	Dobrna
00050000-560a-df04-7af0-755ea50d4568	8211	Dobrnič
00050000-560a-df04-a232-f087110df57d	1356	Dobrova
00050000-560a-df04-305c-4c103337b75d	9223	Dobrovnik/Dobronak 
00050000-560a-df04-22be-93330fcd671a	5212	Dobrovo v Brdih
00050000-560a-df04-b8d8-d427e7cf7927	1431	Dol pri Hrastniku
00050000-560a-df04-5831-0dfa262fa146	1262	Dol pri Ljubljani
00050000-560a-df04-8e2b-2b11cb1ac7bf	1273	Dole pri Litiji
00050000-560a-df04-ee22-1dbbccad3849	1331	Dolenja vas
00050000-560a-df04-4009-c0915f9e34ae	8350	Dolenjske Toplice
00050000-560a-df04-0964-cd0538269513	1230	Domžale
00050000-560a-df04-6e1d-96f98e1f889c	2252	Dornava
00050000-560a-df04-6d98-eb8eef7c66ea	5294	Dornberk
00050000-560a-df04-c036-232f43576617	1319	Draga
00050000-560a-df04-6f18-23b2d3b425ec	8343	Dragatuš
00050000-560a-df04-9394-9cd90cb4fa8c	3222	Dramlje
00050000-560a-df04-ba13-a1bce9b42c08	2370	Dravograd
00050000-560a-df04-9ba4-47236c746a96	4203	Duplje
00050000-560a-df04-6697-801d1b8f02de	6221	Dutovlje
00050000-560a-df04-cfb1-777ea398a472	8361	Dvor
00050000-560a-df04-b4ea-6ef7c9d42859	2343	Fala
00050000-560a-df04-cf17-2911b628b3a0	9208	Fokovci
00050000-560a-df04-4d0d-83cc62883862	2313	Fram
00050000-560a-df04-94b0-65ccd36a3ba6	3213	Frankolovo
00050000-560a-df04-6858-6af8bd887fbc	1274	Gabrovka
00050000-560a-df04-067e-6d55bc3240f5	8254	Globoko
00050000-560a-df04-ed19-b4ea227240d7	5275	Godovič
00050000-560a-df04-edf6-b703ef60cfce	4204	Golnik
00050000-560a-df04-2d88-a9fea7897fae	3303	Gomilsko
00050000-560a-df04-5a0e-10b352f15f20	4224	Gorenja vas
00050000-560a-df04-7ac7-9d0e151a73d2	3263	Gorica pri Slivnici
00050000-560a-df04-eaaa-48a2b30284af	2272	Gorišnica
00050000-560a-df04-ec33-f6dcde7a1f87	9250	Gornja Radgona
00050000-560a-df04-e91b-471e32d3390c	3342	Gornji Grad
00050000-560a-df04-7257-67a458ab08e4	4282	Gozd Martuljek
00050000-560a-df04-ff0d-d3f400d27764	6272	Gračišče
00050000-560a-df04-5600-dcedf255131a	9264	Grad
00050000-560a-df04-8482-dfd4d9398df1	8332	Gradac
00050000-560a-df04-d813-e5083b17cbce	1384	Grahovo
00050000-560a-df04-7bfe-6f310ccc389a	5242	Grahovo ob Bači
00050000-560a-df04-78e7-52d5ca7789a5	5251	Grgar
00050000-560a-df04-bc7c-982f5a0d58bf	3302	Griže
00050000-560a-df04-d062-a2c0629d0916	3231	Grobelno
00050000-560a-df04-6dd0-83ef055438f0	1290	Grosuplje
00050000-560a-df04-d1c1-4f017728350e	2288	Hajdina
00050000-560a-df04-fde9-bf5a877a84a8	8362	Hinje
00050000-560a-df04-a2f4-d7e860db3132	2311	Hoče
00050000-560a-df04-bd47-de91d5fbb879	9205	Hodoš/Hodos
00050000-560a-df04-a212-1f44707f131e	1354	Horjul
00050000-560a-df04-ebb1-ebc97307e4ec	1372	Hotedršica
00050000-560a-df04-8091-2109f9d8415d	1430	Hrastnik
00050000-560a-df04-453c-157bd00202fb	6225	Hruševje
00050000-560a-df04-3e60-953af28c17b5	4276	Hrušica
00050000-560a-df04-0bd4-d0beff430594	5280	Idrija
00050000-560a-df04-89c0-e1c45ff9c55a	1292	Ig
00050000-560a-df04-be37-ff26179da6cb	6250	Ilirska Bistrica
00050000-560a-df04-a4be-dbb9f456f01f	6251	Ilirska Bistrica-Trnovo
00050000-560a-df04-fada-1646781ce843	1295	Ivančna Gorica
00050000-560a-df04-d6a5-8f0faf5e6bd5	2259	Ivanjkovci
00050000-560a-df04-d8fb-dfc009f3a7c2	1411	Izlake
00050000-560a-df04-f46f-b08b82723860	6310	Izola/Isola
00050000-560a-df04-ce10-24ead365596d	2222	Jakobski Dol
00050000-560a-df04-f5b3-39129973d256	2221	Jarenina
00050000-560a-df04-4d02-8cfbe09955be	6254	Jelšane
00050000-560a-df04-f162-d9bf59c9c454	4270	Jesenice
00050000-560a-df04-fd37-eafa2647f985	8261	Jesenice na Dolenjskem
00050000-560a-df04-8fc5-b6c10b3f4816	3273	Jurklošter
00050000-560a-df04-c0de-449abf89425a	2223	Jurovski Dol
00050000-560a-df04-f0ec-9d72b7d12bb7	2256	Juršinci
00050000-560a-df04-d436-786d675e4e94	5214	Kal nad Kanalom
00050000-560a-df04-700b-c4ca134590c6	3233	Kalobje
00050000-560a-df04-7d59-b03da7ee356d	4246	Kamna Gorica
00050000-560a-df04-a357-49ee80c532a0	2351	Kamnica
00050000-560a-df04-f123-7ce3f5866fcd	1241	Kamnik
00050000-560a-df04-80e3-543f4c04d912	5213	Kanal
00050000-560a-df04-67ca-3c9954924f9b	8258	Kapele
00050000-560a-df04-dc96-cc6c6223f73d	2362	Kapla
00050000-560a-df04-8ece-8edf5a7aa1a5	2325	Kidričevo
00050000-560a-df04-c97e-9da8985979b2	1412	Kisovec
00050000-560a-df04-4bda-dd92c839015f	6253	Knežak
00050000-560a-df04-fca3-ec6603f3640e	5222	Kobarid
00050000-560a-df04-8a7e-56523b67a98d	9227	Kobilje
00050000-560a-df04-103c-bab090c520ff	1330	Kočevje
00050000-560a-df04-a399-22eb4fb5b66b	1338	Kočevska Reka
00050000-560a-df04-c3a9-874aae471650	2276	Kog
00050000-560a-df04-5a34-7fa8ee201f9f	5211	Kojsko
00050000-560a-df04-cd8a-2f841e9f802b	6223	Komen
00050000-560a-df04-5d89-c50e377d9ead	1218	Komenda
00050000-560a-df04-d50e-c0d7c6a7deb3	6000	Koper/Capodistria 
00050000-560a-df04-d0e3-27f182cb6a44	6001	Koper/Capodistria - poštni predali
00050000-560a-df04-91cc-119f6b07e5b9	8282	Koprivnica
00050000-560a-df04-06b6-aa2e89eae2d6	5296	Kostanjevica na Krasu
00050000-560a-df04-09ca-3839dbec45e1	8311	Kostanjevica na Krki
00050000-560a-df04-d1ac-a9d4792aac84	1336	Kostel
00050000-560a-df04-5f46-1d0c92aa6cad	6256	Košana
00050000-560a-df04-6b3f-ff74b78d8dc9	2394	Kotlje
00050000-560a-df04-8018-cd7d7b8d698b	6240	Kozina
00050000-560a-df04-5d1d-9f0ee9083bd5	3260	Kozje
00050000-560a-df04-d3e6-bee9807c43c4	4000	Kranj 
00050000-560a-df04-a0ba-e12816e0fa4f	4001	Kranj - poštni predali
00050000-560a-df04-488f-4a541db61cc9	4280	Kranjska Gora
00050000-560a-df04-2787-90a35f164293	1281	Kresnice
00050000-560a-df04-5b1e-648950bdff74	4294	Križe
00050000-560a-df04-7780-4021da5d47b1	9206	Križevci
00050000-560a-df04-8c0a-c20bc175acc4	9242	Križevci pri Ljutomeru
00050000-560a-df04-21b8-0c473d265987	1301	Krka
00050000-560a-df04-8701-df8a45b83031	8296	Krmelj
00050000-560a-df04-401b-1f7a3cbba071	4245	Kropa
00050000-560a-df04-a9e6-15ff2f0a1fd2	8262	Krška vas
00050000-560a-df04-0279-a0098f43fedf	8270	Krško
00050000-560a-df04-27b2-2bfd9859f2eb	9263	Kuzma
00050000-560a-df04-d32e-8b371e9c5849	2318	Laporje
00050000-560a-df04-6f08-aed0140a4a3a	3270	Laško
00050000-560a-df04-2da5-9ea74548270e	1219	Laze v Tuhinju
00050000-560a-df04-a39a-067e18aa4e5a	2230	Lenart v Slovenskih goricah
00050000-560a-df04-da8b-6638628fd77e	9220	Lendava/Lendva
00050000-560a-df04-dd4a-3c102f95b5f0	4248	Lesce
00050000-560a-df04-cb5e-f9eef098d78d	3261	Lesično
00050000-560a-df04-9579-51839ec94780	8273	Leskovec pri Krškem
00050000-560a-df04-109e-bce378adf856	2372	Libeliče
00050000-560a-df04-8a8e-4646a2e7df4c	2341	Limbuš
00050000-560a-df04-17e9-ab6a0a7f02f3	1270	Litija
00050000-560a-df04-8ef0-d4f568e42e93	3202	Ljubečna
00050000-560a-df04-6438-cf12ebda47b6	1000	Ljubljana 
00050000-560a-df04-7761-4715aa0864c4	1001	Ljubljana - poštni predali
00050000-560a-df04-6698-b66878786d3c	1231	Ljubljana - Črnuče
00050000-560a-df04-7079-928c17e2c36b	1261	Ljubljana - Dobrunje
00050000-560a-df04-d131-e9c78c2548b7	1260	Ljubljana - Polje
00050000-560a-df04-9c89-bb8acd602698	1210	Ljubljana - Šentvid
00050000-560a-df04-47ac-eb99d191748a	1211	Ljubljana - Šmartno
00050000-560a-df04-8935-4a3346984489	3333	Ljubno ob Savinji
00050000-560a-df04-fab1-c66ee6935e8e	9240	Ljutomer
00050000-560a-df04-9299-d31b3a44e734	3215	Loče
00050000-560a-df04-0b62-ff9d96a76015	5231	Log pod Mangartom
00050000-560a-df04-01ea-fec1fc303b60	1358	Log pri Brezovici
00050000-560a-df04-a054-5169264907ca	1370	Logatec
00050000-560a-df04-7a3f-ee066038ccc7	1371	Logatec
00050000-560a-df04-6bc1-999d1c53fd64	1434	Loka pri Zidanem Mostu
00050000-560a-df04-430d-e70b3babc2bd	3223	Loka pri Žusmu
00050000-560a-df04-fb6e-033a8d1b733c	6219	Lokev
00050000-560a-df04-b2fa-6f7e6db988a2	1318	Loški Potok
00050000-560a-df04-4cb5-236e6d95714f	2324	Lovrenc na Dravskem polju
00050000-560a-df04-87b8-f46102eb319b	2344	Lovrenc na Pohorju
00050000-560a-df04-6f1f-0ca6c3c23a24	3334	Luče
00050000-560a-df04-9e7b-125c394bf40f	1225	Lukovica
00050000-560a-df04-9eca-ca2ae81b9bb1	9202	Mačkovci
00050000-560a-df04-c712-b8cd35155225	2322	Majšperk
00050000-560a-df04-c2fa-99a05df70396	2321	Makole
00050000-560a-df04-47c2-401cfc39d675	9243	Mala Nedelja
00050000-560a-df04-2697-2aa8934bc8ec	2229	Malečnik
00050000-560a-df04-3c4e-42e34d924e75	6273	Marezige
00050000-560a-df04-b06a-b0ad6c3e02ef	2000	Maribor 
00050000-560a-df04-12df-ab32ab8f7179	2001	Maribor - poštni predali
00050000-560a-df04-df85-c3cd79d8da73	2206	Marjeta na Dravskem polju
00050000-560a-df04-97f3-d2e422d01ec8	2281	Markovci
00050000-560a-df04-b0ea-6f857de1fbfe	9221	Martjanci
00050000-560a-df04-19b7-255671d6596a	6242	Materija
00050000-560a-df04-4330-31128ccb8f35	4211	Mavčiče
00050000-560a-df04-80cf-8d8c4d1c6bc6	1215	Medvode
00050000-560a-df04-cbdb-a263ae4865f9	1234	Mengeš
00050000-560a-df04-812c-95ca57cb7dc2	8330	Metlika
00050000-560a-df04-7d04-388c7ce03986	2392	Mežica
00050000-560a-df04-2b7b-17aa3dfb4f8c	2204	Miklavž na Dravskem polju
00050000-560a-df04-8b45-9e4d47453b26	2275	Miklavž pri Ormožu
00050000-560a-df04-2172-a3b59473e3da	5291	Miren
00050000-560a-df04-e711-9078ba860c56	8233	Mirna
00050000-560a-df04-813b-6902f670b50d	8216	Mirna Peč
00050000-560a-df04-0d1c-f06c62d872c1	2382	Mislinja
00050000-560a-df04-8af5-cc9973a774a3	4281	Mojstrana
00050000-560a-df04-e0bf-1c01576d5259	8230	Mokronog
00050000-560a-df04-8d92-727cf346186f	1251	Moravče
00050000-560a-df04-0d95-0ce3d39b6870	9226	Moravske Toplice
00050000-560a-df04-5451-347373f39f40	5216	Most na Soči
00050000-560a-df04-4674-af58bf3535a5	1221	Motnik
00050000-560a-df04-e9ff-cdf3533ff1ce	3330	Mozirje
00050000-560a-df04-6f29-18766802ac24	9000	Murska Sobota 
00050000-560a-df04-d3df-a4d29c9e58a4	9001	Murska Sobota - poštni predali
00050000-560a-df04-66bb-9365b50f6233	2366	Muta
00050000-560a-df04-d0a7-530266129fc5	4202	Naklo
00050000-560a-df04-d43e-b7baa58987d1	3331	Nazarje
00050000-560a-df04-87f8-560916114c44	1357	Notranje Gorice
00050000-560a-df04-6844-3924f036ceca	3203	Nova Cerkev
00050000-560a-df04-1631-b80297ee74ef	5000	Nova Gorica 
00050000-560a-df04-d7d4-ec381003d4b4	5001	Nova Gorica - poštni predali
00050000-560a-df04-d4db-1e3f01ca8ef1	1385	Nova vas
00050000-560a-df04-a1d5-3aade6c06457	8000	Novo mesto
00050000-560a-df04-7a47-66a4a42c78fa	8001	Novo mesto - poštni predali
00050000-560a-df04-b866-3a5799e02a59	6243	Obrov
00050000-560a-df04-ba51-267d75f55fd9	9233	Odranci
00050000-560a-df04-02f1-0c437e51b960	2317	Oplotnica
00050000-560a-df04-9296-8daa4e84ad08	2312	Orehova vas
00050000-560a-df04-40a0-9c4cea8c2c7a	2270	Ormož
00050000-560a-df04-3d2e-6c2dc164650b	1316	Ortnek
00050000-560a-df04-d615-f48f7eab9818	1337	Osilnica
00050000-560a-df04-8400-ab0d86536fb7	8222	Otočec
00050000-560a-df04-baa7-6d3f1c83d5f3	2361	Ožbalt
00050000-560a-df04-e1df-cdfecdd15594	2231	Pernica
00050000-560a-df04-9f7c-ca9d932b6282	2211	Pesnica pri Mariboru
00050000-560a-df04-5805-7efb79210b01	9203	Petrovci
00050000-560a-df04-a645-06d292024eb6	3301	Petrovče
00050000-560a-df04-c365-d16d4d527710	6330	Piran/Pirano
00050000-560a-df04-f0b5-11fdcd9ae9d0	8255	Pišece
00050000-560a-df04-25b8-d476d7e24e61	6257	Pivka
00050000-560a-df04-1dae-00aec0b4eba7	6232	Planina
00050000-560a-df04-1cdc-bfba0183324b	3225	Planina pri Sevnici
00050000-560a-df04-9587-cb7402839e08	6276	Pobegi
00050000-560a-df04-243a-6fc0973268d7	8312	Podbočje
00050000-560a-df04-9a06-056a4d0a3214	5243	Podbrdo
00050000-560a-df04-8d3c-e099aa4b28f2	3254	Podčetrtek
00050000-560a-df04-b314-fd6e7bc5477c	2273	Podgorci
00050000-560a-df04-cda0-8a2ed62ee061	6216	Podgorje
00050000-560a-df04-fdeb-1df0b1941ee2	2381	Podgorje pri Slovenj Gradcu
00050000-560a-df04-25f3-0ebab6f3c5c0	6244	Podgrad
00050000-560a-df04-f6ab-b8644925d824	1414	Podkum
00050000-560a-df04-160e-7a2c00ed560c	2286	Podlehnik
00050000-560a-df04-05ea-68d61e68134b	5272	Podnanos
00050000-560a-df04-fd3d-2b7824618f04	4244	Podnart
00050000-560a-df04-20aa-6df0a760f168	3241	Podplat
00050000-560a-df04-4695-adea677bb3f4	3257	Podsreda
00050000-560a-df04-02cd-64a3cbd292df	2363	Podvelka
00050000-560a-df04-40be-22b7d826fb3e	2208	Pohorje
00050000-560a-df04-6729-e04b9e0ed975	2257	Polenšak
00050000-560a-df04-96dc-cfc6480ba183	1355	Polhov Gradec
00050000-560a-df04-824b-e10381acf0fd	4223	Poljane nad Škofjo Loko
00050000-560a-df04-5e04-beca0eca6277	2319	Poljčane
00050000-560a-df04-b025-adb64216baad	1272	Polšnik
00050000-560a-df04-e7a6-b43208d280a9	3313	Polzela
00050000-560a-df04-26d4-2773dab2efd6	3232	Ponikva
00050000-560a-df04-9d24-4ec01ea1f2c2	6320	Portorož/Portorose
00050000-560a-df04-13a1-a1007989df47	6230	Postojna
00050000-560a-df04-f853-3e385acc9114	2331	Pragersko
00050000-560a-df04-da9d-7dcead6f5535	3312	Prebold
00050000-560a-df04-c8a6-5515f4ad91a1	4205	Preddvor
00050000-560a-df04-fafa-eb4b2df3f8f4	6255	Prem
00050000-560a-df04-ef58-b209e4cb584f	1352	Preserje
00050000-560a-df04-c4de-8debf7d7254f	6258	Prestranek
00050000-560a-df04-a486-66c08d15281d	2391	Prevalje
00050000-560a-df04-eaa9-262d0cd1ff0c	3262	Prevorje
00050000-560a-df04-4139-cafb4709bc18	1276	Primskovo 
00050000-560a-df04-5e65-968a7fbcdae6	3253	Pristava pri Mestinju
00050000-560a-df04-c0e8-5ff65b776134	9207	Prosenjakovci/Partosfalva
00050000-560a-df04-d42c-0785ac64186c	5297	Prvačina
00050000-560a-df04-6219-e573f5edda39	2250	Ptuj
00050000-560a-df04-182a-6706c37990ef	2323	Ptujska Gora
00050000-560a-df04-3c25-308a8c6b867b	9201	Puconci
00050000-560a-df04-4b90-4635fdb75109	2327	Rače
00050000-560a-df04-be0c-6197da571052	1433	Radeče
00050000-560a-df04-93a6-7a5cdb83d4fc	9252	Radenci
00050000-560a-df04-517f-3cad774742af	2360	Radlje ob Dravi
00050000-560a-df04-6fc1-bc02f16e0d6a	1235	Radomlje
00050000-560a-df04-a4d7-c1dd7baa267d	4240	Radovljica
00050000-560a-df04-1096-ecffbbc5cacf	8274	Raka
00050000-560a-df04-8374-66719729bd9c	1381	Rakek
00050000-560a-df04-fef4-66ea08219756	4283	Rateče - Planica
00050000-560a-df04-1243-c20311e37325	2390	Ravne na Koroškem
00050000-560a-df04-f2b0-82eddc3f79ae	9246	Razkrižje
00050000-560a-df04-4f53-11bd22be67cf	3332	Rečica ob Savinji
00050000-560a-df04-a58f-6fda4d2eb1b3	5292	Renče
00050000-560a-df04-632b-c51a99915835	1310	Ribnica
00050000-560a-df04-147a-ed0d64398bd3	2364	Ribnica na Pohorju
00050000-560a-df04-e9fa-a43b108b9e9c	3272	Rimske Toplice
00050000-560a-df04-1078-b883a26366bb	1314	Rob
00050000-560a-df04-c554-13265b91986a	5215	Ročinj
00050000-560a-df04-15ce-112ead36c521	3250	Rogaška Slatina
00050000-560a-df04-3e28-969fafeb2199	9262	Rogašovci
00050000-560a-df04-9f80-d6773e93b859	3252	Rogatec
00050000-560a-df04-a5b9-41bdeb892f13	1373	Rovte
00050000-560a-df04-f4e6-1006a6d1c7ca	2342	Ruše
00050000-560a-df04-5d89-29a5fdde5cba	1282	Sava
00050000-560a-df04-f7ae-fa43eeec43e9	6333	Sečovlje/Sicciole
00050000-560a-df04-7b65-af60ca9d92bf	4227	Selca
00050000-560a-df04-ff86-04c287c79c14	2352	Selnica ob Dravi
00050000-560a-df04-3150-57cbbbedf749	8333	Semič
00050000-560a-df04-b70c-90938de346be	8281	Senovo
00050000-560a-df04-797b-44b0541d2895	6224	Senožeče
00050000-560a-df04-c87f-3ccdb18a3dbb	8290	Sevnica
00050000-560a-df04-3de5-f328910fc79c	6210	Sežana
00050000-560a-df04-948b-714e1dc9762b	2214	Sladki Vrh
00050000-560a-df04-7a33-85f85d0b9ac0	5283	Slap ob Idrijci
00050000-560a-df04-9341-76b15e2746dd	2380	Slovenj Gradec
00050000-560a-df04-dcca-3cf9aabccb3d	2310	Slovenska Bistrica
00050000-560a-df04-d33d-6854d8b210a3	3210	Slovenske Konjice
00050000-560a-df04-1444-d9e4b56b9bb2	1216	Smlednik
00050000-560a-df04-d9d7-abaa16ba91c9	5232	Soča
00050000-560a-df04-2a0c-20f52d466c21	1317	Sodražica
00050000-560a-df04-9847-0b6f5d46803a	3335	Solčava
00050000-560a-df04-3a29-2b7763e7a568	5250	Solkan
00050000-560a-df04-e4d0-e9b367ea3cf1	4229	Sorica
00050000-560a-df04-dce1-3ea2628cc85f	4225	Sovodenj
00050000-560a-df04-9c1c-b989224ad9cb	5281	Spodnja Idrija
00050000-560a-df04-1070-bc55ff10cca6	2241	Spodnji Duplek
00050000-560a-df04-cff6-cdc829f114b0	9245	Spodnji Ivanjci
00050000-560a-df04-342f-66a4fe533b2f	2277	Središče ob Dravi
00050000-560a-df04-39f4-28ed53b0a6f0	4267	Srednja vas v Bohinju
00050000-560a-df04-688e-9c46e61b20a0	8256	Sromlje 
00050000-560a-df04-8f97-96cb7cd77e67	5224	Srpenica
00050000-560a-df04-a271-a35764548850	1242	Stahovica
00050000-560a-df04-003e-4b85a341aeba	1332	Stara Cerkev
00050000-560a-df04-00b8-bdbafaa35429	8342	Stari trg ob Kolpi
00050000-560a-df04-d944-0a9822d39342	1386	Stari trg pri Ložu
00050000-560a-df04-5075-335c80088f06	2205	Starše
00050000-560a-df04-e04f-980158d6a84d	2289	Stoperce
00050000-560a-df04-4fab-df6f621f86ad	8322	Stopiče
00050000-560a-df04-1c38-43c5516e0734	3206	Stranice
00050000-560a-df04-3cd4-a935f2a0a24c	8351	Straža
00050000-560a-df04-1fd2-a51834d335ba	1313	Struge
00050000-560a-df04-4627-2a3d9ed53d1a	8293	Studenec
00050000-560a-df04-c9b8-db8127fcb912	8331	Suhor
00050000-560a-df04-080e-5eb4da839479	2233	Sv. Ana v Slovenskih goricah
00050000-560a-df04-ab41-58fe7b407657	2235	Sv. Trojica v Slovenskih goricah
00050000-560a-df04-c83f-f0bf2a7c4855	2353	Sveti Duh na Ostrem Vrhu
00050000-560a-df04-66b1-da0f3de4c202	9244	Sveti Jurij ob Ščavnici
00050000-560a-df04-f9e6-04c143989bba	3264	Sveti Štefan
00050000-560a-df04-0354-bcda91d436db	2258	Sveti Tomaž
00050000-560a-df04-f22f-c68edb90fce0	9204	Šalovci
00050000-560a-df04-bcc7-3a2b3ede6fc2	5261	Šempas
00050000-560a-df04-da75-3201c6ada0ce	5290	Šempeter pri Gorici
00050000-560a-df04-32ac-94e72d509263	3311	Šempeter v Savinjski dolini
00050000-560a-df04-a49e-3b2fb46b22d1	4208	Šenčur
00050000-560a-df04-fe30-f5dc46e3d133	2212	Šentilj v Slovenskih goricah
00050000-560a-df04-5e88-5353d493646a	8297	Šentjanž
00050000-560a-df04-dbe1-f1098abb2fe3	2373	Šentjanž pri Dravogradu
00050000-560a-df04-66ab-ecdea6c87f0a	8310	Šentjernej
00050000-560a-df04-569b-18078897e3ec	3230	Šentjur
00050000-560a-df04-4f0e-9945af84655f	3271	Šentrupert
00050000-560a-df04-a982-3a32f42b7d04	8232	Šentrupert
00050000-560a-df04-111c-ada76121d430	1296	Šentvid pri Stični
00050000-560a-df04-06d0-b7e186d557a0	8275	Škocjan
00050000-560a-df04-333c-257bbd9b6e34	6281	Škofije
00050000-560a-df04-7a13-2a04bae8aa9f	4220	Škofja Loka
00050000-560a-df04-cb51-a8a1d025cf28	3211	Škofja vas
00050000-560a-df04-31db-6e459c9c3977	1291	Škofljica
00050000-560a-df04-3071-bc7e4b106b24	6274	Šmarje
00050000-560a-df04-3d6e-0a59e8427e21	1293	Šmarje - Sap
00050000-560a-df04-8cf2-57d51dd238c9	3240	Šmarje pri Jelšah
00050000-560a-df04-7ce7-431fb18d0a52	8220	Šmarješke Toplice
00050000-560a-df04-e604-361a2f356cab	2315	Šmartno na Pohorju
00050000-560a-df04-8bab-5ccb2afb068d	3341	Šmartno ob Dreti
00050000-560a-df04-9edd-5a6e20fe1acf	3327	Šmartno ob Paki
00050000-560a-df04-5d5e-deee041584ef	1275	Šmartno pri Litiji
00050000-560a-df04-3806-173b39e65e23	2383	Šmartno pri Slovenj Gradcu
00050000-560a-df04-0bf6-da33ddf9c192	3201	Šmartno v Rožni dolini
00050000-560a-df04-ff8b-5512a5d5ca7b	3325	Šoštanj
00050000-560a-df04-16a6-951299453f4c	6222	Štanjel
00050000-560a-df04-5777-7e20f75ce7bd	3220	Štore
00050000-560a-df04-4816-bd3ebe1892a5	3304	Tabor
00050000-560a-df04-08d8-6161b0110d65	3221	Teharje
00050000-560a-df04-f6ee-469167eb2b54	9251	Tišina
00050000-560a-df04-215f-e29d1076e6d6	5220	Tolmin
00050000-560a-df04-a1d4-25224afa9777	3326	Topolšica
00050000-560a-df04-76d4-da3bdb55daeb	2371	Trbonje
00050000-560a-df04-f163-4524ee7fb5a9	1420	Trbovlje
00050000-560a-df04-14cf-8db17348f784	8231	Trebelno 
00050000-560a-df04-db91-af0d0d3367b8	8210	Trebnje
00050000-560a-df04-0bc2-f0f4a53a9bda	5252	Trnovo pri Gorici
00050000-560a-df04-5773-e62dca809e63	2254	Trnovska vas
00050000-560a-df04-2844-d75c08b7fb2e	1222	Trojane
00050000-560a-df04-b09f-dbbe34a088f2	1236	Trzin
00050000-560a-df04-c22a-08ff52309373	4290	Tržič
00050000-560a-df04-03a9-aee9cf72e1db	8295	Tržišče
00050000-560a-df04-32b7-68cec33a196c	1311	Turjak
00050000-560a-df04-d8b2-0bf04292c953	9224	Turnišče
00050000-560a-df04-e070-5cf815fbff2d	8323	Uršna sela
00050000-560a-df04-7fd1-673120c5bb67	1252	Vače
00050000-560a-df04-c362-c80e971744ed	3320	Velenje 
00050000-560a-df04-b4cd-2ca31fc761e5	3322	Velenje - poštni predali
00050000-560a-df04-fa7d-debe67fcfa61	8212	Velika Loka
00050000-560a-df04-5457-8c782ac1d462	2274	Velika Nedelja
00050000-560a-df04-3eaf-b37aca78f4a2	9225	Velika Polana
00050000-560a-df04-d51f-a0e041641a6d	1315	Velike Lašče
00050000-560a-df04-7b1e-c1b2b6e6238b	8213	Veliki Gaber
00050000-560a-df04-015e-c1ece9aa4d1c	9241	Veržej
00050000-560a-df04-1993-9ea15d431f14	1312	Videm - Dobrepolje
00050000-560a-df04-961c-3a9647904409	2284	Videm pri Ptuju
00050000-560a-df04-10e6-d1ef62db4f42	8344	Vinica
00050000-560a-df04-3b49-4d65fd3cfc12	5271	Vipava
00050000-560a-df04-6a5b-f5789d826fa4	4212	Visoko
00050000-560a-df04-b434-16f8245c8810	1294	Višnja Gora
00050000-560a-df04-00bc-48e8363b2497	3205	Vitanje
00050000-560a-df04-4219-7d934851625a	2255	Vitomarci
00050000-560a-df04-c44f-613519fb6ca8	1217	Vodice
00050000-560a-df04-526b-65294281bccc	3212	Vojnik\t
00050000-560a-df04-7a5a-f440c13f8976	5293	Volčja Draga
00050000-560a-df04-e7cf-32d539f293ff	2232	Voličina
00050000-560a-df04-a047-306215a63550	3305	Vransko
00050000-560a-df04-84d5-b619a39fd99b	6217	Vremski Britof
00050000-560a-df04-fb85-514d47ba658a	1360	Vrhnika
00050000-560a-df04-5a83-f41f9542d414	2365	Vuhred
00050000-560a-df04-87eb-4415fbdf68c5	2367	Vuzenica
00050000-560a-df04-1d58-a61067d49427	8292	Zabukovje 
00050000-560a-df04-93a3-43c727409186	1410	Zagorje ob Savi
00050000-560a-df04-6aac-99f74b6ef348	1303	Zagradec
00050000-560a-df04-cb8d-b3e0312cf1b2	2283	Zavrč
00050000-560a-df04-0ffd-84c919c26da4	8272	Zdole 
00050000-560a-df04-7fdb-d478da9ce0b2	4201	Zgornja Besnica
00050000-560a-df04-a851-90d683a67f0d	2242	Zgornja Korena
00050000-560a-df04-e900-c8f39205993a	2201	Zgornja Kungota
00050000-560a-df04-c2c8-9a7a10b2300d	2316	Zgornja Ložnica
00050000-560a-df04-5512-c5183b802821	2314	Zgornja Polskava
00050000-560a-df04-f5a4-965fdca1074b	2213	Zgornja Velka
00050000-560a-df04-c463-78fc38456b05	4247	Zgornje Gorje
00050000-560a-df04-424c-69e12391dc00	4206	Zgornje Jezersko
00050000-560a-df04-5dcf-7f4f2cbe2783	2285	Zgornji Leskovec
00050000-560a-df04-c91b-eb34e0937d2c	1432	Zidani Most
00050000-560a-df04-8c1a-6416f24506a8	3214	Zreče
00050000-560a-df04-fd2b-42c6bc9c9660	4209	Žabnica
00050000-560a-df04-be50-f52f91d31362	3310	Žalec
00050000-560a-df04-f6c1-ac278fa2e0fb	4228	Železniki
00050000-560a-df04-c747-b757e18b3a30	2287	Žetale
00050000-560a-df04-f942-b568c03f6e5e	4226	Žiri
00050000-560a-df04-5152-d4e3cbb86e34	4274	Žirovnica
00050000-560a-df04-cbd4-a2325d40b3c8	8360	Žužemberk
\.


--
-- TOC entry 3028 (class 0 OID 21085600)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21085222)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 21085002)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-560a-df07-fc88-73580926fa3f	00080000-560a-df07-955f-8e9fc4c58b37	\N	00040000-560a-df04-aed6-d65a0ab299c2	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-560a-df07-1d8a-e5ed2ea85893	00080000-560a-df07-955f-8e9fc4c58b37	\N	00040000-560a-df04-aed6-d65a0ab299c2	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-560a-df07-96b4-81aa8775a647	00080000-560a-df07-bfcc-0bc18dc0d619	\N	00040000-560a-df04-aed6-d65a0ab299c2	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2990 (class 0 OID 21085106)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21085234)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21085614)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21085624)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-560a-df07-c076-94a3c305c34b	00080000-560a-df07-1d83-f4d4fef02acb	0987	AK
00190000-560a-df07-5d12-e98d8370c4db	00080000-560a-df07-bfcc-0bc18dc0d619	0989	AK
00190000-560a-df07-28a2-4780492a3ab6	00080000-560a-df07-c454-fc64dfda5096	0986	AK
00190000-560a-df07-41a9-0447de0e998c	00080000-560a-df07-f000-c2ba0eb25034	0984	AK
00190000-560a-df07-054c-7d60cbe5cf79	00080000-560a-df07-fd98-3bc197382d46	0983	AK
00190000-560a-df07-d51a-99e9e61a12a4	00080000-560a-df07-3886-b87835cdb212	0982	AK
00190000-560a-df09-0da5-fa23a1328086	00080000-560a-df09-d02e-cb46115515d9	1001	AK
\.


--
-- TOC entry 3027 (class 0 OID 21085557)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-560a-df07-25b1-536007258af1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 21085632)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 21085263)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-560a-df07-e4ca-0c3baf50e6cc	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-560a-df07-9c29-7248468e9b40	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-560a-df07-24ef-61a8004d27f8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-560a-df07-df62-58dd6230204f	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-560a-df07-cf9c-7fd49d277327	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-560a-df07-fb56-9daefb15d88f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-560a-df07-fdaf-d1defd0364e3	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2999 (class 0 OID 21085207)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21085197)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21085407)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21085337)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21085080)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21084875)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-560a-df09-d02e-cb46115515d9	00010000-560a-df05-79ae-973ab7f12ebf	2015-09-29 20:57:13	INS	a:0:{}
2	App\\Entity\\Option	00000000-560a-df09-11dc-00b50ac16f16	00010000-560a-df05-79ae-973ab7f12ebf	2015-09-29 20:57:13	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-560a-df09-0da5-fa23a1328086	00010000-560a-df05-79ae-973ab7f12ebf	2015-09-29 20:57:13	INS	a:0:{}
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 21085276)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21084913)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-560a-df05-4f87-57d8579090c2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-560a-df05-99ec-8f7dd0a7f401	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-560a-df05-2bd4-891d37637cae	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-560a-df05-033c-845561f1d9f7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-560a-df05-dbb6-a4177a36d67d	planer	Planer dogodkov v koledarju	t
00020000-560a-df05-4452-4a7941ca4371	kadrovska	Kadrovska služba	t
00020000-560a-df05-5801-6c1f8363487a	arhivar	Ažuriranje arhivalij	t
00020000-560a-df05-db75-848841dfb926	igralec	Igralec	t
00020000-560a-df05-391e-9d8ee6dda098	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-560a-df07-68ab-a1e3c3783a5f	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2973 (class 0 OID 21084897)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-560a-df05-186c-2208067a9070	00020000-560a-df05-2bd4-891d37637cae
00010000-560a-df05-79ae-973ab7f12ebf	00020000-560a-df05-2bd4-891d37637cae
00010000-560a-df07-48eb-232e50b3bb39	00020000-560a-df07-68ab-a1e3c3783a5f
\.


--
-- TOC entry 3010 (class 0 OID 21085290)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 21085228)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21085174)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21084862)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-560a-df04-25d2-13954cefc5ef	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-560a-df04-e03c-fcd99c59fd7c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-560a-df04-c014-c2f8e1a786df	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-560a-df04-c2f5-d39f76f36b29	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-560a-df04-33ae-bdef12f54783	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2968 (class 0 OID 21084854)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-560a-df04-a3a8-1e1cb377135e	00230000-560a-df04-c2f5-d39f76f36b29	popa
00240000-560a-df04-cb27-b886a9843b23	00230000-560a-df04-c2f5-d39f76f36b29	oseba
00240000-560a-df04-7203-54a810f4fcaa	00230000-560a-df04-c2f5-d39f76f36b29	sezona
00240000-560a-df04-4cbd-f936d9764e85	00230000-560a-df04-e03c-fcd99c59fd7c	prostor
00240000-560a-df04-c961-1a3befc7987d	00230000-560a-df04-c2f5-d39f76f36b29	besedilo
00240000-560a-df04-e81b-3f0dbde2e33a	00230000-560a-df04-c2f5-d39f76f36b29	uprizoritev
00240000-560a-df04-df2e-ca755cdf126c	00230000-560a-df04-c2f5-d39f76f36b29	funkcija
00240000-560a-df04-9404-df66bee5efdc	00230000-560a-df04-c2f5-d39f76f36b29	tipfunkcije
00240000-560a-df04-1828-267dd649d3d9	00230000-560a-df04-c2f5-d39f76f36b29	alternacija
00240000-560a-df04-5002-be4ced973e96	00230000-560a-df04-25d2-13954cefc5ef	pogodba
00240000-560a-df04-ff26-8458c4220a0b	00230000-560a-df04-c2f5-d39f76f36b29	zaposlitev
00240000-560a-df04-8689-b438fbc69c7f	00230000-560a-df04-c2f5-d39f76f36b29	zvrstuprizoritve
00240000-560a-df04-0c58-cac6f065232d	00230000-560a-df04-25d2-13954cefc5ef	programdela
00240000-560a-df04-51ef-027ebfcfeff2	00230000-560a-df04-c2f5-d39f76f36b29	zapis
\.


--
-- TOC entry 2967 (class 0 OID 21084849)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e8727b15-e1fd-4565-976b-fba64e7b0888	00240000-560a-df04-a3a8-1e1cb377135e	0	1001
\.


--
-- TOC entry 3016 (class 0 OID 21085354)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-560a-df07-ea5e-6319c90f1222	000e0000-560a-df07-d0f0-9b83bb32956b	00080000-560a-df07-955f-8e9fc4c58b37	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-560a-df05-267f-4018220283fd
00270000-560a-df07-9c60-7c7adf76742d	000e0000-560a-df07-d0f0-9b83bb32956b	00080000-560a-df07-955f-8e9fc4c58b37	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-560a-df05-267f-4018220283fd
\.


--
-- TOC entry 2980 (class 0 OID 21084975)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 21085184)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-560a-df07-bbaf-f17c4dccb50e	00180000-560a-df07-1373-1ae49800ac32	000c0000-560a-df07-26de-d98c57dd80cc	00090000-560a-df07-1d49-0651d00838aa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-df07-8798-5c3932e4015f	00180000-560a-df07-1373-1ae49800ac32	000c0000-560a-df07-1b85-11b9fbd96c06	00090000-560a-df07-06d2-125a64a0aa64	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-df07-0bbc-e81ca7cf3c6d	00180000-560a-df07-1373-1ae49800ac32	000c0000-560a-df07-f58f-05b18ae324e0	00090000-560a-df07-44d7-cab6c2e5c5c6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-df07-ced5-3acb01b26fed	00180000-560a-df07-1373-1ae49800ac32	000c0000-560a-df07-fb08-c52dc49c7f87	00090000-560a-df07-f17d-d5a82ce93cc5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-df07-4f08-f635965fb4f6	00180000-560a-df07-1373-1ae49800ac32	000c0000-560a-df07-fe85-8b86d7afd6cf	00090000-560a-df07-7a57-7328e7020020	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-df07-958b-79adb148e601	00180000-560a-df07-5347-457954dcaf65	\N	00090000-560a-df07-7a57-7328e7020020	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3019 (class 0 OID 21085395)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-560a-df04-6a85-9d44ea964b7c	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-560a-df04-d7a8-be23c0efb67a	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-560a-df04-a5ce-61cd17938c50	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-560a-df04-7940-f7a2bd7f7a5a	04	Režija	Režija	Režija	umetnik	30
000f0000-560a-df04-01bb-07f116aa9e2d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-560a-df04-e791-8ab77acb422b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-560a-df04-c5fa-71506e275dd4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-560a-df04-ea3f-66415d176e2b	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-560a-df04-1319-cfe6d6a2ea1c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-560a-df04-f1df-13c7baa27476	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-560a-df04-3128-b8ec4fd21a84	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-560a-df04-ea8e-18bdee27a877	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-560a-df04-f3f8-88ec9bbf92a8	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-560a-df04-4a93-38713b30a210	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-560a-df04-cded-3d4b4695f314	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-560a-df04-50da-a4354a799fbb	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-560a-df04-89f9-e2d4cfa28ae8	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-560a-df04-738d-98e06a54df3c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3032 (class 0 OID 21085643)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-560a-df04-a804-6c9054a2fe38	01	Velika predstava	f	1.00	1.00
002b0000-560a-df04-9b83-d0cc0c090edd	02	Mala predstava	f	0.50	0.50
002b0000-560a-df04-c72d-589768e11d0d	03	Mala koprodukcija	t	0.40	1.00
002b0000-560a-df04-2c30-059e3275bfc6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-560a-df04-d1bb-5eab2b4708d8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2985 (class 0 OID 21085037)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21084884)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-560a-df05-79ae-973ab7f12ebf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfmBLS88gciZ2uzjd66l9RqTbjQLgN4K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-560a-df07-303c-63fa68d0ec2b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-560a-df07-5a6f-ae1ec24af6db	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-560a-df07-50e0-630acf8158e9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-560a-df07-8c3b-54170afc8382	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-560a-df07-0f95-2e0027bd6013	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-560a-df07-abc4-be4750277143	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-560a-df07-9fd2-18f81723f504	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-560a-df07-8f52-5436c604a699	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-560a-df07-3133-3c7016a2fa18	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-560a-df07-48eb-232e50b3bb39	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-560a-df05-186c-2208067a9070	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 21085445)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-560a-df07-61ac-f970c1bec2da	00160000-560a-df07-d224-7439d3c1bc69	\N	00140000-560a-df04-8dea-18905b8f38fc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-560a-df07-cf9c-7fd49d277327
000e0000-560a-df07-d0f0-9b83bb32956b	00160000-560a-df07-3be8-8d645484ed31	\N	00140000-560a-df04-0366-cd59d3898a5a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-560a-df07-fb56-9daefb15d88f
000e0000-560a-df07-26d9-52fb90382b85	\N	\N	00140000-560a-df04-0366-cd59d3898a5a	00190000-560a-df07-c076-94a3c305c34b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-df07-cf9c-7fd49d277327
000e0000-560a-df07-b5b8-1a52a32e6c20	\N	\N	00140000-560a-df04-0366-cd59d3898a5a	00190000-560a-df07-c076-94a3c305c34b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-df07-cf9c-7fd49d277327
000e0000-560a-df07-ee8e-a04726e17316	\N	\N	00140000-560a-df04-0366-cd59d3898a5a	00190000-560a-df07-c076-94a3c305c34b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-df07-e4ca-0c3baf50e6cc
000e0000-560a-df07-8387-340a5c9b4ec9	\N	\N	00140000-560a-df04-0366-cd59d3898a5a	00190000-560a-df07-c076-94a3c305c34b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-df07-e4ca-0c3baf50e6cc
\.


--
-- TOC entry 2992 (class 0 OID 21085128)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-560a-df07-846a-1d8101dea6e7	000e0000-560a-df07-d0f0-9b83bb32956b	\N	1	
00200000-560a-df07-c82d-1c5d1d40873b	000e0000-560a-df07-d0f0-9b83bb32956b	\N	2	
00200000-560a-df07-cd22-8b327b49aa42	000e0000-560a-df07-d0f0-9b83bb32956b	\N	3	
00200000-560a-df07-fa79-52e2cc46c74d	000e0000-560a-df07-d0f0-9b83bb32956b	\N	4	
00200000-560a-df07-1466-1e1e1d563995	000e0000-560a-df07-d0f0-9b83bb32956b	\N	5	
\.


--
-- TOC entry 3006 (class 0 OID 21085255)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21085368)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-560a-df05-17f8-68ec94b20183	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-560a-df05-8e90-d80514472aa2	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-560a-df05-7109-dcae3ef342f5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-560a-df05-c32f-b2cf40fb56b4	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-560a-df05-6840-7276273dde96	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-560a-df05-7c31-bf63b923fd5e	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-560a-df05-8c18-3f44fc98ddc6	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-560a-df05-9b1f-0b1a33f19443	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-560a-df05-267f-4018220283fd	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-560a-df05-6c14-b744d1579aa3	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-560a-df05-1bd7-9abb5cfa8df9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-560a-df05-b05c-460cb0534794	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-560a-df05-9340-938303118914	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-560a-df05-4398-eb38f29d56d2	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-560a-df05-b179-de2fad1ee1b1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-560a-df05-1fac-279e03682522	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-560a-df05-282d-769cb0f5372d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-560a-df05-6b63-0512c602fb4d	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-560a-df05-c725-f3e46d6bd5de	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-560a-df05-2204-2134e778db6b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-560a-df05-750a-4bad4bc88171	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-560a-df05-1d1c-964103aa1d26	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-560a-df05-315f-fd605bd2f0e3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-560a-df05-b628-d0aaa628cec6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-560a-df05-f45b-c4f320c13479	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-560a-df05-b51b-a521e830b028	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-560a-df05-2193-5793483564d6	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-560a-df05-ffb5-79eeaa526879	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3035 (class 0 OID 21085690)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21085662)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21085702)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21085327)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-560a-df07-a039-f20912c0a8d1	00090000-560a-df07-06d2-125a64a0aa64	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-df07-e264-c667f1e37f51	00090000-560a-df07-44d7-cab6c2e5c5c6	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-df07-f8fb-03ab3199483e	00090000-560a-df07-1f7f-039e99b28174	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-df07-f475-6dfe1c810ea7	00090000-560a-df07-9a0c-45dc84ecd192	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-df07-9ae3-7c2629844f49	00090000-560a-df07-1d49-0651d00838aa	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-df07-5113-2e1ff80f626f	00090000-560a-df07-f0ed-5351f099b359	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2994 (class 0 OID 21085163)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21085435)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-560a-df04-8dea-18905b8f38fc	01	Drama	drama (SURS 01)
00140000-560a-df04-32c4-bdb9a73eb4fb	02	Opera	opera (SURS 02)
00140000-560a-df04-2952-8fa9d0e7d1f4	03	Balet	balet (SURS 03)
00140000-560a-df04-6e53-a65b2de6b428	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-560a-df04-6a97-ce83236b4a37	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-560a-df04-0366-cd59d3898a5a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-560a-df04-cdb0-99c33d8fa244	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3012 (class 0 OID 21085317)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2499 (class 2606 OID 21084938)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 21085494)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21085484)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21085351)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21085393)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21085742)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21085152)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21085173)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21085660)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21085063)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 21085551)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21085313)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21085126)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21085101)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21085077)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21085220)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 21085719)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 21085726)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 21085750)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 21083196)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2611 (class 2606 OID 21085247)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21085035)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 21084947)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21084971)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 21084927)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2490 (class 2606 OID 21084912)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21085253)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21085289)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21085430)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21084999)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21085023)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21085612)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 21085226)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 21085013)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 21085114)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 21085238)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 21085621)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21085629)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 21085599)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 21085641)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 21085271)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 21085211)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21085202)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 21085417)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 21085344)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21085089)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21084883)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21085280)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21084901)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2492 (class 2606 OID 21084921)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 21085298)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21085233)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21085182)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21084871)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21084859)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21084853)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21085364)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 21084980)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21085193)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21085404)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21085653)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 21085048)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21084896)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21085463)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21085136)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21085261)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21085376)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21085700)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 21085684)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21085708)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21085335)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 21085167)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21085443)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 21085325)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 21085161)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2564 (class 1259 OID 21085162)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2565 (class 1259 OID 21085160)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2566 (class 1259 OID 21085159)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 21085158)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2653 (class 1259 OID 21085365)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2654 (class 1259 OID 21085366)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 21085367)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 21085721)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 21085720)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2513 (class 1259 OID 21085001)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 21085254)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 21085688)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 21085687)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 21085689)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 21085686)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 21085685)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 21085240)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 21085239)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 21085137)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 21085314)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 21085316)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 21085315)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2538 (class 1259 OID 21085079)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21085078)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2717 (class 1259 OID 21085642)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2669 (class 1259 OID 21085432)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 21085433)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 21085434)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 21085709)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2678 (class 1259 OID 21085468)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2679 (class 1259 OID 21085465)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2680 (class 1259 OID 21085469)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2681 (class 1259 OID 21085467)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2682 (class 1259 OID 21085466)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2528 (class 1259 OID 21085050)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 21085049)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2504 (class 1259 OID 21084974)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 21085281)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 21084928)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2495 (class 1259 OID 21084929)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 21085301)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 21085300)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 21085299)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 21085115)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 21085116)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 21084861)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 21085206)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 21085204)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 21085203)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 21085205)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 21084902)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 21084903)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 21085262)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 21085743)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2651 (class 1259 OID 21085353)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 21085352)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2750 (class 1259 OID 21085751)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 21085752)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 21085227)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 21085345)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 21085346)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 21085556)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2700 (class 1259 OID 21085555)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2701 (class 1259 OID 21085552)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21085553)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2703 (class 1259 OID 21085554)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2517 (class 1259 OID 21085015)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 21085014)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2519 (class 1259 OID 21085016)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 21085275)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 21085274)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 21085622)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2710 (class 1259 OID 21085623)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2692 (class 1259 OID 21085498)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 21085499)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2694 (class 1259 OID 21085496)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2695 (class 1259 OID 21085497)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 21085336)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 21085215)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 21085214)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 21085212)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 21085213)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2688 (class 1259 OID 21085486)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 21085485)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 21085090)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2545 (class 1259 OID 21085104)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2546 (class 1259 OID 21085103)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2547 (class 1259 OID 21085102)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2548 (class 1259 OID 21085105)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2557 (class 1259 OID 21085127)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 21085613)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2725 (class 1259 OID 21085661)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 21085727)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 21085728)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2500 (class 1259 OID 21084949)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 21084948)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2509 (class 1259 OID 21084981)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 21084982)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 21085168)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 21085196)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 21085195)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 21085194)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2568 (class 1259 OID 21085154)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 21085155)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 21085153)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 21085157)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2572 (class 1259 OID 21085156)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2516 (class 1259 OID 21085000)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 21085064)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 21085066)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2536 (class 1259 OID 21085065)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2537 (class 1259 OID 21085067)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 21085221)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21085431)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21085464)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 21085405)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 21085406)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2507 (class 1259 OID 21084972)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 21084973)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 21085326)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 21084872)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21085036)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 21084860)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2722 (class 1259 OID 21085654)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 21085273)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 21085272)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 21085495)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 21085024)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 21085444)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21085701)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2715 (class 1259 OID 21085630)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 21085631)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 21085394)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2580 (class 1259 OID 21085183)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 21084922)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2784 (class 2606 OID 21085883)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 21085888)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2779 (class 2606 OID 21085908)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2785 (class 2606 OID 21085878)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 21085898)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 21085903)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 21085893)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 21086073)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2819 (class 2606 OID 21086078)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 21086083)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 21086248)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 21086243)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 21085808)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 21085993)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 21086228)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 21086223)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 21086233)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 21086218)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2850 (class 2606 OID 21086213)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2800 (class 2606 OID 21085988)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 21085983)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 21085873)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21086033)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 21086043)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2811 (class 2606 OID 21086038)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 21085843)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 21085838)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 21085973)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 21086203)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 21086088)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 21086093)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 21086098)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 21086238)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 21086118)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2828 (class 2606 OID 21086103)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 21086123)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 21086113)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 21086108)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 21085833)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 21085828)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 21085793)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2762 (class 2606 OID 21085788)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21086013)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 21085768)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 21085773)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 21086028)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2808 (class 2606 OID 21086023)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 21086018)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2776 (class 2606 OID 21085858)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 21085863)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 21085753)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 21085948)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2792 (class 2606 OID 21085938)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2793 (class 2606 OID 21085933)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2791 (class 2606 OID 21085943)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 21085758)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 21085763)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2803 (class 2606 OID 21085998)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2856 (class 2606 OID 21086263)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 21086068)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21086063)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2858 (class 2606 OID 21086268)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2857 (class 2606 OID 21086273)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 21085978)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2815 (class 2606 OID 21086053)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2814 (class 2606 OID 21086058)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21086178)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 21086173)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2839 (class 2606 OID 21086158)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21086163)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2837 (class 2606 OID 21086168)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2767 (class 2606 OID 21085818)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 21085813)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 21085823)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21086008)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2805 (class 2606 OID 21086003)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 21086188)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 21086193)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2832 (class 2606 OID 21086148)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 21086153)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2834 (class 2606 OID 21086138)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2833 (class 2606 OID 21086143)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2813 (class 2606 OID 21086048)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 21085968)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2795 (class 2606 OID 21085963)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2797 (class 2606 OID 21085953)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2796 (class 2606 OID 21085958)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 21086133)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 21086128)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 21085848)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2774 (class 2606 OID 21085853)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21085868)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 21086183)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2843 (class 2606 OID 21086198)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21086208)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2855 (class 2606 OID 21086253)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2854 (class 2606 OID 21086258)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2759 (class 2606 OID 21085783)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 21085778)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2764 (class 2606 OID 21085798)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 21085803)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 21085913)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21085928)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 21085923)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 21085918)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-29 20:57:14 CEST

--
-- PostgreSQL database dump complete
--

