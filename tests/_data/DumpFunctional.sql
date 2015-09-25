--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-25 11:55:45 CEST

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
-- TOC entry 181 (class 1259 OID 20638737)
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
-- TOC entry 229 (class 1259 OID 20639294)
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
-- TOC entry 228 (class 1259 OID 20639277)
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
-- TOC entry 219 (class 1259 OID 20639154)
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
-- TOC entry 222 (class 1259 OID 20639184)
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
-- TOC entry 243 (class 1259 OID 20639533)
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
-- TOC entry 197 (class 1259 OID 20638944)
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
-- TOC entry 199 (class 1259 OID 20638976)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20639459)
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
-- TOC entry 190 (class 1259 OID 20638858)
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
-- TOC entry 230 (class 1259 OID 20639307)
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
-- TOC entry 215 (class 1259 OID 20639109)
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
-- TOC entry 195 (class 1259 OID 20638923)
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
-- TOC entry 193 (class 1259 OID 20638898)
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
-- TOC entry 191 (class 1259 OID 20638875)
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
-- TOC entry 204 (class 1259 OID 20639023)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20639514)
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
-- TOC entry 242 (class 1259 OID 20639526)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20639548)
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
-- TOC entry 208 (class 1259 OID 20639048)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20638832)
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
-- TOC entry 182 (class 1259 OID 20638746)
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
-- TOC entry 183 (class 1259 OID 20638757)
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
-- TOC entry 178 (class 1259 OID 20638711)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20638730)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20639055)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20639089)
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
-- TOC entry 225 (class 1259 OID 20639225)
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
-- TOC entry 185 (class 1259 OID 20638790)
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
-- TOC entry 187 (class 1259 OID 20638824)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20639405)
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
-- TOC entry 205 (class 1259 OID 20639029)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20638809)
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
-- TOC entry 194 (class 1259 OID 20638913)
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
-- TOC entry 207 (class 1259 OID 20639041)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20639419)
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
-- TOC entry 234 (class 1259 OID 20639429)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20639362)
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
-- TOC entry 235 (class 1259 OID 20639437)
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
-- TOC entry 211 (class 1259 OID 20639070)
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
-- TOC entry 203 (class 1259 OID 20639014)
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
-- TOC entry 202 (class 1259 OID 20639004)
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
-- TOC entry 224 (class 1259 OID 20639214)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20639144)
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
-- TOC entry 192 (class 1259 OID 20638887)
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
-- TOC entry 175 (class 1259 OID 20638682)
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
-- TOC entry 174 (class 1259 OID 20638680)
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
-- TOC entry 212 (class 1259 OID 20639083)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20638720)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20638704)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20639097)
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
-- TOC entry 206 (class 1259 OID 20639035)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20638981)
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
-- TOC entry 173 (class 1259 OID 20638669)
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
-- TOC entry 172 (class 1259 OID 20638661)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20638656)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20639161)
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
-- TOC entry 184 (class 1259 OID 20638782)
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
-- TOC entry 201 (class 1259 OID 20638991)
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
-- TOC entry 223 (class 1259 OID 20639202)
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
-- TOC entry 236 (class 1259 OID 20639447)
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
-- TOC entry 189 (class 1259 OID 20638844)
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
-- TOC entry 176 (class 1259 OID 20638691)
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
-- TOC entry 227 (class 1259 OID 20639252)
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
-- TOC entry 196 (class 1259 OID 20638934)
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
-- TOC entry 210 (class 1259 OID 20639062)
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
-- TOC entry 221 (class 1259 OID 20639175)
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
-- TOC entry 239 (class 1259 OID 20639494)
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
-- TOC entry 238 (class 1259 OID 20639466)
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
-- TOC entry 240 (class 1259 OID 20639506)
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
-- TOC entry 217 (class 1259 OID 20639134)
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
-- TOC entry 198 (class 1259 OID 20638970)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20639242)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20639124)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20638685)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2974 (class 0 OID 20638737)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 20639294)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5605-1a1f-6776-8ceb7a8270ee	000d0000-5605-1a1f-b048-3725c0f0b2e1	\N	00090000-5605-1a1f-1173-1eb8ef95409a	000b0000-5605-1a1f-7dd8-39e9521593b5	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5605-1a1f-c679-7d6afd6ff0c4	000d0000-5605-1a1f-5a74-8a92a4c3f52a	00100000-5605-1a1f-5dbb-9348e602c1cd	00090000-5605-1a1f-07c2-b7db271d1b76	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5605-1a1f-90f7-fa2f0bb1fad5	000d0000-5605-1a1f-6c6a-ea21ccf55921	00100000-5605-1a1f-a58c-59b0bde47667	00090000-5605-1a1f-a532-2d0671139f7a	\N	0003	t	\N	2015-09-25	\N	2	t	\N	f	f
000c0000-5605-1a1f-f590-7239ea9f8bbd	000d0000-5605-1a1f-8f93-698eb05af1a8	\N	00090000-5605-1a1f-5cbf-b6060fcfa578	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5605-1a1f-99ec-d06b07efce92	000d0000-5605-1a1f-a0d8-25240bf14445	\N	00090000-5605-1a1f-2c5f-2dc6fc7fa101	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5605-1a1f-3619-842f8d1fbe6e	000d0000-5605-1a1f-e87b-66387999113c	\N	00090000-5605-1a1f-b0b8-b251cb19dfe1	000b0000-5605-1a1f-3b7d-20af20a8a728	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5605-1a1f-bfc7-38e662322cec	000d0000-5605-1a1f-e751-b0356c1c62dc	00100000-5605-1a1f-fe4d-bc4c52aa89ec	00090000-5605-1a1f-bfd8-1615b35fcdcd	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5605-1a1f-0079-ef76165f7ba5	000d0000-5605-1a1f-d9db-96a931b2ad4d	\N	00090000-5605-1a1f-dc12-737026f856df	000b0000-5605-1a1f-fb3d-55f548e3fc4c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5605-1a1f-fc2b-f9c9e62f37fc	000d0000-5605-1a1f-e751-b0356c1c62dc	00100000-5605-1a1f-e77b-42dcfa739ea0	00090000-5605-1a1f-618d-6cb8a9473f84	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5605-1a1f-19ce-46ee3a992a08	000d0000-5605-1a1f-e751-b0356c1c62dc	00100000-5605-1a1f-9868-523e8a7384cc	00090000-5605-1a1f-8d0a-c5f71f3bfda5	\N	0010	t	\N	2015-09-25	\N	16	f	\N	f	t
000c0000-5605-1a1f-4d7b-db311ebc4c65	000d0000-5605-1a1f-e751-b0356c1c62dc	00100000-5605-1a1f-5172-041366b0c1d5	00090000-5605-1a1f-b4e4-15ccf122a1c8	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5605-1a1f-5c69-c1d600333036	000d0000-5605-1a1f-77b4-c55504f08730	\N	00090000-5605-1a1f-07c2-b7db271d1b76	000b0000-5605-1a1f-8c31-227955e3dfc6	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3021 (class 0 OID 20639277)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20639154)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5605-1a1f-13e8-d9e703e17621	00160000-5605-1a1e-67fa-16ccf0e5b64e	00090000-5605-1a1f-81b6-13c5215f6923	aizv	10	t
003d0000-5605-1a1f-51d1-32e952e4c573	00160000-5605-1a1e-67fa-16ccf0e5b64e	00090000-5605-1a1f-f410-406b5257de4f	apri	14	t
003d0000-5605-1a1f-cc89-613a1dbdcb63	00160000-5605-1a1e-1154-25b7a6404dc7	00090000-5605-1a1f-9fad-3004e36a21f4	aizv	11	t
003d0000-5605-1a1f-c57f-98e565be9fdb	00160000-5605-1a1e-55c8-53116d357068	00090000-5605-1a1f-150c-ddeef3dc40e2	aizv	12	t
003d0000-5605-1a1f-d904-713274bf8abf	00160000-5605-1a1e-67fa-16ccf0e5b64e	00090000-5605-1a1f-f8cc-31f6e5653292	apri	18	f
\.


--
-- TOC entry 3015 (class 0 OID 20639184)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5605-1a1e-67fa-16ccf0e5b64e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5605-1a1e-1154-25b7a6404dc7	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5605-1a1e-55c8-53116d357068	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3036 (class 0 OID 20639533)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 20638944)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5605-1a1f-21bf-b9887d369f30	\N	\N	00200000-5605-1a1f-c385-f2080e6b2219	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5605-1a1f-aeff-1cdad378fa0f	\N	\N	00200000-5605-1a1f-1eb7-48daf2c96026	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5605-1a1f-22cc-fe985be8c6b2	\N	\N	00200000-5605-1a1f-c8c1-c0f509d70974	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5605-1a1f-a425-1b3da1195c87	\N	\N	00200000-5605-1a1f-2f74-59be7467d21f	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5605-1a1f-561c-681b26e6498a	\N	\N	00200000-5605-1a1f-4bb2-726c83ff7241	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2992 (class 0 OID 20638976)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20639459)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20638858)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5605-1a1c-4d28-6f54d1ff945b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5605-1a1c-4e42-75bcb987b9ab	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5605-1a1c-3c16-b8794493ab33	AL	ALB	008	Albania 	Albanija	\N
00040000-5605-1a1c-9178-c388423656e2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5605-1a1c-ce87-609a2e1fefd3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5605-1a1c-bb4f-ff2dbb35f2f6	AD	AND	020	Andorra 	Andora	\N
00040000-5605-1a1c-3d75-5f2340ad0fda	AO	AGO	024	Angola 	Angola	\N
00040000-5605-1a1c-735d-f3786a14703d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5605-1a1c-0a96-44df889dd613	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5605-1a1c-3afa-08ec246a8e65	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-1a1c-a64e-0d8057ca3470	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5605-1a1c-0f0d-9fb488013122	AM	ARM	051	Armenia 	Armenija	\N
00040000-5605-1a1c-2583-849602faa2ad	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5605-1a1c-2034-9f6389e62417	AU	AUS	036	Australia 	Avstralija	\N
00040000-5605-1a1c-5951-745e6d0cdee2	AT	AUT	040	Austria 	Avstrija	\N
00040000-5605-1a1c-9cbb-ba63dbca9b50	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5605-1a1c-484e-caf0f9479acc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5605-1a1c-c6c9-3cae58a60c89	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5605-1a1c-dc4a-3819af7e3b53	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5605-1a1c-9459-e734b97c85dd	BB	BRB	052	Barbados 	Barbados	\N
00040000-5605-1a1c-b737-42a5f2fdf6f8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5605-1a1c-acbd-930adbbb8081	BE	BEL	056	Belgium 	Belgija	\N
00040000-5605-1a1c-0b98-0bfb027ea0f6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5605-1a1c-da09-4a6054c9c481	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5605-1a1c-2cd7-b27af101dfd3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5605-1a1c-81f7-0eae6dc75280	BT	BTN	064	Bhutan 	Butan	\N
00040000-5605-1a1c-8659-ac7e2b03b690	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5605-1a1c-9f91-0e640ea352c7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5605-1a1c-8682-3ecaa0370bf7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5605-1a1c-634b-8a324bb012fb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5605-1a1c-c8ad-c138040ff70e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5605-1a1c-b65c-c66a0c060022	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5605-1a1c-832d-3040b912f700	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5605-1a1c-53d8-09df28285d6a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5605-1a1c-baf2-fec3f2265a1c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5605-1a1c-6ac7-1d6d6e3d4b82	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5605-1a1c-378c-20fca8f5e708	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5605-1a1c-a972-8913b0f40eb2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5605-1a1c-ae26-04559955c3cd	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5605-1a1c-e95a-4e660f9e3a26	CA	CAN	124	Canada 	Kanada	\N
00040000-5605-1a1c-7dde-36376aefeb03	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5605-1a1c-553a-d07796153627	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5605-1a1c-341e-aa3ff4b00427	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5605-1a1c-c2bf-7210f6d693c2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5605-1a1c-b67f-d34998397bf0	CL	CHL	152	Chile 	Čile	\N
00040000-5605-1a1c-b424-24911f8dc4e6	CN	CHN	156	China 	Kitajska	\N
00040000-5605-1a1c-3532-41922d84cee8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5605-1a1c-f63e-c6dc8c88a3d6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5605-1a1c-662e-b2ff2db2307d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5605-1a1c-b042-9b782db828ec	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5605-1a1c-7801-711d8508189f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5605-1a1c-5296-027fc0ce674a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5605-1a1c-57d3-2f5b770514ae	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5605-1a1c-fd10-8415e6c943a4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5605-1a1c-884a-ed83d738daa5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5605-1a1c-7b53-71fb988b4893	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5605-1a1c-8b6c-4c8273a1277d	CU	CUB	192	Cuba 	Kuba	\N
00040000-5605-1a1c-706f-6355575622ae	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5605-1a1c-e164-61d06d1a4d97	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5605-1a1c-b6e6-08b6f9287071	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5605-1a1c-8428-932c215b0667	DK	DNK	208	Denmark 	Danska	\N
00040000-5605-1a1c-4e8f-4d6c3056e042	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5605-1a1c-a298-e315f3143c68	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-1a1c-3ec2-6d8a7bd5e15e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5605-1a1c-aa4f-6559bda1323d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5605-1a1c-c8e4-7cde529db1fa	EG	EGY	818	Egypt 	Egipt	\N
00040000-5605-1a1c-286f-ec21b45e8c4c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5605-1a1c-3610-8ab6511f1b51	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5605-1a1c-2c36-4c9bd02fe81b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5605-1a1c-5886-1cdf140fcebc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5605-1a1c-eb47-2bcc77859035	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5605-1a1c-63bf-432acac1bf5b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5605-1a1c-65c8-194428c86c75	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5605-1a1c-45b4-813f7f06d32d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5605-1a1c-a90d-d1fbb6e31c38	FI	FIN	246	Finland 	Finska	\N
00040000-5605-1a1c-5cdc-f0d8a29e7db9	FR	FRA	250	France 	Francija	\N
00040000-5605-1a1c-38a0-ccfb8d3d31a1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5605-1a1c-3aa9-6008c54b97a8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5605-1a1c-ac26-49ffa3bea42f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5605-1a1c-4525-41db071453b8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5605-1a1c-d2c8-c22ecab12778	GA	GAB	266	Gabon 	Gabon	\N
00040000-5605-1a1c-7c89-276e9afe4d6a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5605-1a1c-e53e-a2ce302d32f2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5605-1a1c-385e-8712226294f1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5605-1a1c-8c55-fcc3330b6aac	GH	GHA	288	Ghana 	Gana	\N
00040000-5605-1a1c-5489-585e57b655dd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5605-1a1c-e8c1-cd84e0657cf8	GR	GRC	300	Greece 	Grčija	\N
00040000-5605-1a1c-052a-98953d1ac82e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5605-1a1c-04c8-cb8ec8a0e8ca	GD	GRD	308	Grenada 	Grenada	\N
00040000-5605-1a1c-4b28-52955d0befab	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5605-1a1c-944f-789be1bd471e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5605-1a1c-9fcf-c7b85049fbea	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5605-1a1c-f26c-53a4c2f5cde0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5605-1a1c-c813-8ef3bef4849b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5605-1a1c-6a54-0b68f61b47f7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5605-1a1c-0cba-c1b28425d240	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5605-1a1c-a311-c7ebc2cfac5a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5605-1a1c-b0d4-5a0f7cd34169	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5605-1a1c-26e4-4164d3841e83	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5605-1a1c-a3c5-5978c36840e3	HN	HND	340	Honduras 	Honduras	\N
00040000-5605-1a1c-d13a-b9ad4f945ed3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5605-1a1c-0aa5-dcc3f2c7c0de	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5605-1a1c-483f-84596437075c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5605-1a1c-c756-834a60c64064	IN	IND	356	India 	Indija	\N
00040000-5605-1a1c-efc3-463f23510414	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5605-1a1c-0ceb-73f66f253a07	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5605-1a1c-50c6-bc194b77c75e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5605-1a1c-19d1-2d2c92278643	IE	IRL	372	Ireland 	Irska	\N
00040000-5605-1a1c-c5e6-63a90510ed53	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5605-1a1c-7455-76bfd0ddfa62	IL	ISR	376	Israel 	Izrael	\N
00040000-5605-1a1c-1c60-f68f5d77d99a	IT	ITA	380	Italy 	Italija	\N
00040000-5605-1a1c-270b-b3cf4839f720	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5605-1a1c-ea1c-6f8f80c47a6a	JP	JPN	392	Japan 	Japonska	\N
00040000-5605-1a1c-240e-af3d248a1bc3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5605-1a1c-e0f2-89ce489f5fe5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5605-1a1c-8fa7-691f0ef29cab	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5605-1a1c-e08c-4e1515f7076d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5605-1a1c-85ad-240c0e323b71	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5605-1a1c-2d8a-7c68dc8d3514	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5605-1a1c-7148-915fbe0694b4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5605-1a1c-313a-f3d879d71dc5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5605-1a1c-50c4-f950c55405ae	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5605-1a1c-d29e-6b616f850312	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5605-1a1c-8e23-607cea0e2bc1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5605-1a1c-19ac-c39426c923eb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5605-1a1c-7c73-438ebbffddb7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5605-1a1c-2d75-c9d33c561f73	LR	LBR	430	Liberia 	Liberija	\N
00040000-5605-1a1c-e16d-abea8d77c71e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5605-1a1c-53b7-40b7d8f1310a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5605-1a1c-535b-a8f22cc2863f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5605-1a1c-155d-89a750162050	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5605-1a1c-58f7-5dd46dd48192	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5605-1a1c-0bce-4458335fc7dd	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5605-1a1c-4eff-b6be04661e3c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5605-1a1c-d1b6-a6d9f2487b7f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5605-1a1c-251c-eb54095798a9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5605-1a1c-2898-72d4b60f66c5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5605-1a1c-ae59-05e3dc778225	ML	MLI	466	Mali 	Mali	\N
00040000-5605-1a1c-15c8-8aa6d251eea4	MT	MLT	470	Malta 	Malta	\N
00040000-5605-1a1c-0a2f-cb2656f14ad1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5605-1a1c-7cde-1bb31b3dc0ae	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5605-1a1c-ed1a-dd4ae15acd0d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5605-1a1c-a3db-f15fc155a6ff	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5605-1a1c-36ed-46afe5141e77	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5605-1a1c-ebcf-6995b39ecc36	MX	MEX	484	Mexico 	Mehika	\N
00040000-5605-1a1c-269d-d1f0fdd76cc3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5605-1a1c-36df-58d646eeded6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5605-1a1c-18e8-54dfdc3273a4	MC	MCO	492	Monaco 	Monako	\N
00040000-5605-1a1c-19ef-34a6c3daa27b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5605-1a1c-624e-ef2fd0096754	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5605-1a1c-d770-00671054c8b0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5605-1a1c-fd66-a8bb02cdfed0	MA	MAR	504	Morocco 	Maroko	\N
00040000-5605-1a1c-bc93-b355b5dfca3d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5605-1a1c-ed2e-65f04f7a60f2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5605-1a1c-83c1-60faa470ff3d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5605-1a1c-7dad-4d47b0f72a73	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5605-1a1c-0fa2-19536c8a2f02	NP	NPL	524	Nepal 	Nepal	\N
00040000-5605-1a1c-1c33-c1b0f18569be	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5605-1a1c-351d-85a6071e8d37	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5605-1a1c-f4d6-dd409ee357b8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5605-1a1c-5299-66ac12114080	NE	NER	562	Niger 	Niger 	\N
00040000-5605-1a1c-ad52-c93e0633860c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5605-1a1c-61a5-762b376fdf6e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5605-1a1c-5668-74aa28802599	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5605-1a1c-cde6-9821bb9d515c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5605-1a1c-3d6f-18bcd08e1625	NO	NOR	578	Norway 	Norveška	\N
00040000-5605-1a1c-73f4-112b4f03a70e	OM	OMN	512	Oman 	Oman	\N
00040000-5605-1a1c-e001-e7a2473a8473	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5605-1a1c-4ad8-beaf30ba68e4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5605-1a1c-c647-03fe64d5b038	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5605-1a1c-5403-3cf694b3380e	PA	PAN	591	Panama 	Panama	\N
00040000-5605-1a1c-b681-914716f7dd95	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5605-1a1c-2d04-a2c7d7879e84	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5605-1a1c-c0d5-b06f471cea7e	PE	PER	604	Peru 	Peru	\N
00040000-5605-1a1c-a2ea-644d19da93cc	PH	PHL	608	Philippines 	Filipini	\N
00040000-5605-1a1c-4c58-40235aa462eb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5605-1a1c-6f2a-c5475781a523	PL	POL	616	Poland 	Poljska	\N
00040000-5605-1a1c-957a-3e9e9378db14	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5605-1a1c-17b8-e41f7acfe49c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5605-1a1c-3249-163caa71e52e	QA	QAT	634	Qatar 	Katar	\N
00040000-5605-1a1c-a597-f74e91214a91	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5605-1a1c-bdb2-cc45d6565417	RO	ROU	642	Romania 	Romunija	\N
00040000-5605-1a1c-6cf7-c9b79a1455d4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5605-1a1c-fca7-c25917c153fa	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5605-1a1c-0c6b-90603841fe43	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5605-1a1c-e974-5911e166f825	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5605-1a1c-466b-a92d72f77881	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5605-1a1c-dcff-51d6fde6007e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5605-1a1c-02d6-db40bffc9ced	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5605-1a1c-b3e7-3b335e2fa583	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5605-1a1c-77b4-89ed69acca0a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5605-1a1c-81d2-b89d6abee27f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5605-1a1c-0260-bac0f0ef14e9	SM	SMR	674	San Marino 	San Marino	\N
00040000-5605-1a1c-8e06-5fd3a2bd3eae	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5605-1a1c-c42a-ae5698f15360	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5605-1a1c-9d4b-f019292b6aa8	SN	SEN	686	Senegal 	Senegal	\N
00040000-5605-1a1c-6003-2c17dd4d6d1d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5605-1a1c-440d-08efe257bcba	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5605-1a1c-53d5-d9e53cc2b340	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5605-1a1c-8ca1-5c99de342c23	SG	SGP	702	Singapore 	Singapur	\N
00040000-5605-1a1c-2ae5-0cd3d686ec9d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5605-1a1c-5ca0-de6b4b68c5b0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5605-1a1c-d78c-712e416c6afe	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5605-1a1c-51c8-9f4103395e70	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5605-1a1c-2c93-77bb1c6a93d0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5605-1a1c-b4ba-b103436069c4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5605-1a1c-32c1-383edeb03c11	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5605-1a1c-cd4e-b8c3c4d18ac8	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5605-1a1c-0eb2-8152d8c3af6a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5605-1a1c-9ef6-0ec16a6a1f57	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5605-1a1c-9d3b-bc4f29e09cd6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5605-1a1c-40d8-96b23b0983b4	SR	SUR	740	Suriname 	Surinam	\N
00040000-5605-1a1c-cb95-09e3809a25f1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5605-1a1c-d0d1-c841c966686d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5605-1a1c-fede-d844b4353d3c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5605-1a1c-f768-7c0ceb5379d8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5605-1a1c-2a7c-35e8e324e4dc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5605-1a1c-d3db-e430ab48ac7c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5605-1a1c-ea2a-86d962488f82	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5605-1a1c-280f-14e568ea7464	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5605-1a1c-4d6b-48263dd4be21	TH	THA	764	Thailand 	Tajska	\N
00040000-5605-1a1c-c34e-0394342ef3eb	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5605-1a1c-b48d-07bd121ecc25	TG	TGO	768	Togo 	Togo	\N
00040000-5605-1a1c-8a60-de5346609d17	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5605-1a1c-2830-063ac6c95614	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5605-1a1c-3fbb-639e484c0dad	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5605-1a1c-c144-c166c8ed7e6f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5605-1a1c-96f8-2e4dde832184	TR	TUR	792	Turkey 	Turčija	\N
00040000-5605-1a1c-921a-b0feeac254e3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5605-1a1c-6d6a-fcebc44a2b74	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-1a1c-1e27-cfcdbab1b687	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5605-1a1c-2a3c-1b3ec1a333b4	UG	UGA	800	Uganda 	Uganda	\N
00040000-5605-1a1c-8472-92355463009a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5605-1a1c-6f47-415927490cd2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5605-1a1c-fb6a-78e49c8f3140	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5605-1a1c-b873-abcfca42e426	US	USA	840	United States 	Združene države Amerike	\N
00040000-5605-1a1c-4f47-da05fa52ca8f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5605-1a1c-2d8c-a9f0cd282161	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5605-1a1c-0e6f-557912dff99f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5605-1a1c-f777-d66fe69cb66b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5605-1a1c-4304-7d3d9d958fa4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5605-1a1c-c733-b3a78161f04c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5605-1a1c-0c54-7436b6b05b9a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-1a1c-b393-b86384f8b54f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5605-1a1c-01bc-d4fb028bc29a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5605-1a1c-1df4-067b71360a73	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5605-1a1c-3646-69feb2f549e7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5605-1a1c-b313-371eeb11f7a8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5605-1a1c-8e50-714ef2b73192	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3023 (class 0 OID 20639307)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5605-1a1f-552f-59903b8486dd	000e0000-5605-1a1f-3c59-0a6542e285c6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-1a1c-b137-98b0f52dd26c	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-1a1f-faa6-d7c05366403a	000e0000-5605-1a1f-1201-c6a02d8603f1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-1a1c-6992-0d9c762fd718	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-1a1f-dd52-ed1c2c98a6d9	000e0000-5605-1a1f-8d06-7d67f200e4d2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-1a1c-b137-98b0f52dd26c	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-1a1f-6e17-11cd8c8bf127	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-1a1f-c702-a5661f44199a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3008 (class 0 OID 20639109)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5605-1a1f-b048-3725c0f0b2e1	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-6776-8ceb7a8270ee	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-1a1c-e599-4aef82c6bdf9
000d0000-5605-1a1f-5a74-8a92a4c3f52a	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-c679-7d6afd6ff0c4	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5605-1a1c-d3c9-d7b93f17f41c
000d0000-5605-1a1f-6c6a-ea21ccf55921	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-90f7-fa2f0bb1fad5	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5605-1a1c-f699-5ad6742defc2
000d0000-5605-1a1f-8f93-698eb05af1a8	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-f590-7239ea9f8bbd	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5605-1a1c-ecbd-5648ae34c204
000d0000-5605-1a1f-a0d8-25240bf14445	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-99ec-d06b07efce92	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5605-1a1c-ecbd-5648ae34c204
000d0000-5605-1a1f-e87b-66387999113c	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-3619-842f8d1fbe6e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-1a1c-e599-4aef82c6bdf9
000d0000-5605-1a1f-e751-b0356c1c62dc	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-fc2b-f9c9e62f37fc	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5605-1a1c-e599-4aef82c6bdf9
000d0000-5605-1a1f-d9db-96a931b2ad4d	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-0079-ef76165f7ba5	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5605-1a1c-6e84-fcf06201d439
000d0000-5605-1a1f-77b4-c55504f08730	000e0000-5605-1a1f-1201-c6a02d8603f1	000c0000-5605-1a1f-5c69-c1d600333036	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5605-1a1c-aa0f-50fe846a97b6
\.


--
-- TOC entry 2988 (class 0 OID 20638923)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20638898)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20638875)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5605-1a1f-132a-6a22f1f8670e	00080000-5605-1a1e-9543-d560d75f5214	00090000-5605-1a1f-8d0a-c5f71f3bfda5	AK		igralka
\.


--
-- TOC entry 2997 (class 0 OID 20639023)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20639514)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20639526)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 20639548)
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
-- TOC entry 3001 (class 0 OID 20639048)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20638832)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5605-1a1d-606a-b897c1816d6d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5605-1a1d-3db3-d0cde29f0ad9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5605-1a1d-2d59-20f84e58854c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5605-1a1d-67dc-78e761a7fccb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5605-1a1d-5926-1951250b7f7b	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5605-1a1d-4469-eb915af20040	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5605-1a1d-8aeb-2ba4b3a17340	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5605-1a1d-3aba-1c3d6454dac7	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-1a1d-f2fe-fee24d3a42ba	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-1a1d-2e1b-7d28a3679339	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5605-1a1d-853d-b3cadee4ba7f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5605-1a1d-3434-806a917d5ee3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5605-1a1d-b768-6b08c0f3aa91	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5605-1a1d-39b7-459940c90228	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5605-1a1d-8f77-4a94f7b844a8	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5605-1a1e-b87f-c94b3e6730c6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5605-1a1e-03c4-9fdb3dbc602a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5605-1a1e-140a-32804868a43c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5605-1a1e-178a-145ab451e606	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5605-1a1e-78bd-85d91e3b7dd2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5605-1a20-77b9-5c80b7bc191f	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2975 (class 0 OID 20638746)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5605-1a1e-8cc5-c5d37924d048	00000000-5605-1a1e-b87f-c94b3e6730c6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5605-1a1e-88d6-1ad7e3df882f	00000000-5605-1a1e-b87f-c94b3e6730c6	00010000-5605-1a1d-0b2f-b1c67b5caf6d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5605-1a1e-d95f-44a170bd031b	00000000-5605-1a1e-03c4-9fdb3dbc602a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2976 (class 0 OID 20638757)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5605-1a1f-1173-1eb8ef95409a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5605-1a1f-5cbf-b6060fcfa578	00010000-5605-1a1f-9414-bd664ff672f7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5605-1a1f-a532-2d0671139f7a	00010000-5605-1a1f-493d-4db9f397666f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5605-1a1f-618d-6cb8a9473f84	00010000-5605-1a1f-0702-3f8065017109	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5605-1a1f-207e-fc4e23a68359	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5605-1a1f-b0b8-b251cb19dfe1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5605-1a1f-b4e4-15ccf122a1c8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5605-1a1f-bfd8-1615b35fcdcd	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5605-1a1f-8d0a-c5f71f3bfda5	00010000-5605-1a1f-1416-9769e6996ee6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5605-1a1f-07c2-b7db271d1b76	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5605-1a1f-6f40-6bd6741a9af1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-1a1f-2c5f-2dc6fc7fa101	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5605-1a1f-dc12-737026f856df	00010000-5605-1a1f-f218-fb23b443bbe6	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-1a1f-81b6-13c5215f6923	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-1a1f-f410-406b5257de4f	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-1a1f-9fad-3004e36a21f4	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-1a1f-150c-ddeef3dc40e2	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5605-1a1f-f8cc-31f6e5653292	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 20638711)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5605-1a1c-c0f1-4f9c93ef56c3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5605-1a1c-83f7-0acc15cc48d5	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5605-1a1c-e434-899b026e4252	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5605-1a1c-acfc-f6a3ae9ded62	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5605-1a1c-5803-feef057df330	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5605-1a1c-f96c-34ed4a879fe6	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5605-1a1c-4a97-bfccb7f11089	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5605-1a1c-07c9-aa6a81dcb10f	Abonma-read	Abonma - branje	f
00030000-5605-1a1c-4103-64b53493b1ec	Abonma-write	Abonma - spreminjanje	f
00030000-5605-1a1c-a63c-f6488f574750	Alternacija-read	Alternacija - branje	f
00030000-5605-1a1c-e92c-0c6ca83071f1	Alternacija-write	Alternacija - spreminjanje	f
00030000-5605-1a1c-61b3-38e86f3121fb	Arhivalija-read	Arhivalija - branje	f
00030000-5605-1a1c-426a-597b402a7515	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5605-1a1c-e076-0c7edc92eb7e	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5605-1a1c-bce4-1f6b1ca1c780	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5605-1a1c-1236-25b71a2e4367	Besedilo-read	Besedilo - branje	f
00030000-5605-1a1c-bb33-59dbb339a400	Besedilo-write	Besedilo - spreminjanje	f
00030000-5605-1a1c-2c45-cc7a0e3bb64f	DogodekIzven-read	DogodekIzven - branje	f
00030000-5605-1a1c-a1b8-bab13019bde6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5605-1a1c-993e-a6a242f1354c	Dogodek-read	Dogodek - branje	f
00030000-5605-1a1c-3896-50f0aded4bca	Dogodek-write	Dogodek - spreminjanje	f
00030000-5605-1a1c-b077-9f21fce6740f	DrugiVir-read	DrugiVir - branje	f
00030000-5605-1a1c-89fe-17e15b78491e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5605-1a1c-5b79-485045ded182	Drzava-read	Drzava - branje	f
00030000-5605-1a1c-e789-330caf9615f1	Drzava-write	Drzava - spreminjanje	f
00030000-5605-1a1c-99f6-ced8f084cd0f	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5605-1a1c-56e4-e858f5a4375a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5605-1a1c-29aa-9ed1c67d3d56	Funkcija-read	Funkcija - branje	f
00030000-5605-1a1c-0a61-4c44fe3aa86c	Funkcija-write	Funkcija - spreminjanje	f
00030000-5605-1a1c-c2a7-ba6229136aca	Gostovanje-read	Gostovanje - branje	f
00030000-5605-1a1c-5e3d-16d93d225252	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5605-1a1c-40db-5f4f55f8212e	Gostujoca-read	Gostujoca - branje	f
00030000-5605-1a1c-6810-b63c0a50cc90	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5605-1a1c-5da9-be488c343211	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5605-1a1c-03c2-dc5ca71f1d18	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5605-1a1c-f210-71ed6252cc4c	Kupec-read	Kupec - branje	f
00030000-5605-1a1c-c794-fb1e7706905a	Kupec-write	Kupec - spreminjanje	f
00030000-5605-1a1c-f3c6-1ae3dd2c3a85	NacinPlacina-read	NacinPlacina - branje	f
00030000-5605-1a1c-d860-73fe085a83b2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5605-1a1c-849e-545c2a6de68f	Option-read	Option - branje	f
00030000-5605-1a1c-73a7-ad4407f40be7	Option-write	Option - spreminjanje	f
00030000-5605-1a1c-a27c-fbc3ca39c55b	OptionValue-read	OptionValue - branje	f
00030000-5605-1a1c-b0bd-66270f1d5560	OptionValue-write	OptionValue - spreminjanje	f
00030000-5605-1a1c-436d-0684f20401f6	Oseba-read	Oseba - branje	f
00030000-5605-1a1c-7086-c4d87579aa68	Oseba-write	Oseba - spreminjanje	f
00030000-5605-1a1c-1598-4c338dd862b5	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5605-1a1c-9438-dba383180c8a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5605-1a1c-0e26-2b43164d8f67	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5605-1a1c-ca41-09b017495a14	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5605-1a1c-e689-dbe49aa781ec	Pogodba-read	Pogodba - branje	f
00030000-5605-1a1c-27f1-47b4bb9160b2	Pogodba-write	Pogodba - spreminjanje	f
00030000-5605-1a1c-c045-cc1b2913f0c5	Popa-read	Popa - branje	f
00030000-5605-1a1c-dabb-a83525cd4ac8	Popa-write	Popa - spreminjanje	f
00030000-5605-1a1c-c9c5-ef97f6556603	Posta-read	Posta - branje	f
00030000-5605-1a1c-75ec-88b2e99bb4fe	Posta-write	Posta - spreminjanje	f
00030000-5605-1a1c-a15c-f0833bf6f10c	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5605-1a1c-1f26-91efe290251a	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5605-1a1c-66c6-936bd72fb0f7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5605-1a1c-c62f-bcdadd275447	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5605-1a1c-9b17-61f18e04e7c0	PostniNaslov-read	PostniNaslov - branje	f
00030000-5605-1a1c-0d28-31cc90a9e503	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5605-1a1c-1ac7-5c7e140bbd42	Predstava-read	Predstava - branje	f
00030000-5605-1a1c-c251-e2d363a1fcca	Predstava-write	Predstava - spreminjanje	f
00030000-5605-1a1c-dc16-2e67ed9f2b41	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5605-1a1c-dc2c-8cf8a31c4c82	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5605-1a1c-ba84-655fa6c5a090	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5605-1a1c-9ff1-fa5111568cd9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5605-1a1c-a71d-6b818f71b2a7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5605-1a1c-41db-490ef12a0cda	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5605-1a1c-c5b1-d178cadbaa8d	ProgramDela-read	ProgramDela - branje	f
00030000-5605-1a1c-8b62-136db2cff6e9	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5605-1a1c-0d5a-61bc82932e61	ProgramFestival-read	ProgramFestival - branje	f
00030000-5605-1a1c-7767-3d31556ef2bf	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5605-1a1c-8148-4695c326150b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5605-1a1c-77f7-f35779388066	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5605-1a1c-c343-a90568c547a0	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5605-1a1c-0ac0-99ed6dcc4639	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5605-1a1c-829e-13d1bf449804	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5605-1a1c-1514-a0e9d17f69e1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5605-1a1c-5ce4-4fc1868b27e4	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5605-1a1c-931c-c4226b95b82f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5605-1a1c-73d9-4887b4f7efa6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5605-1a1c-d1d0-2be0bb222ba2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5605-1a1c-6974-6c3e3226cb84	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5605-1a1c-535f-29a8b57387b4	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5605-1a1c-da40-2a0a20783d57	ProgramRazno-read	ProgramRazno - branje	f
00030000-5605-1a1c-a286-33d4dff2ca59	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5605-1a1c-680d-a02d50a01a7f	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5605-1a1c-b023-1e1375c5d6f5	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5605-1a1c-5ef8-14c732089bb4	Prostor-read	Prostor - branje	f
00030000-5605-1a1c-3701-7839ff9b0377	Prostor-write	Prostor - spreminjanje	f
00030000-5605-1a1c-95b2-af11f1d8a30a	Racun-read	Racun - branje	f
00030000-5605-1a1c-036c-d69ae2eda88d	Racun-write	Racun - spreminjanje	f
00030000-5605-1a1c-6269-31e340f75fcf	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5605-1a1c-259e-6c7c131c074e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5605-1a1d-31e6-59861bc45f3d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5605-1a1d-bb80-69b7fa0ce689	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5605-1a1d-eac7-7607c4ae49b7	Rekvizit-read	Rekvizit - branje	f
00030000-5605-1a1d-e4b0-37cc10aad2d5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5605-1a1d-234c-a3b23387c69e	Revizija-read	Revizija - branje	f
00030000-5605-1a1d-8421-db1b36f2b0b1	Revizija-write	Revizija - spreminjanje	f
00030000-5605-1a1d-a974-6e348129fd6c	Rezervacija-read	Rezervacija - branje	f
00030000-5605-1a1d-a6a5-cf21ba16003c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5605-1a1d-ca22-16c6a00cc608	SedezniRed-read	SedezniRed - branje	f
00030000-5605-1a1d-b3e8-4d27ff916410	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5605-1a1d-66af-167fc762348c	Sedez-read	Sedez - branje	f
00030000-5605-1a1d-38d0-6d4088eed8aa	Sedez-write	Sedez - spreminjanje	f
00030000-5605-1a1d-b771-3e369fa657b5	Sezona-read	Sezona - branje	f
00030000-5605-1a1d-7a7b-bc22228f1905	Sezona-write	Sezona - spreminjanje	f
00030000-5605-1a1d-a80a-b32df3fde15f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5605-1a1d-48cb-8866afb942ef	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5605-1a1d-6cb4-dd633a030523	Stevilcenje-read	Stevilcenje - branje	f
00030000-5605-1a1d-1672-2f02a8c5e3bd	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5605-1a1d-0b09-091245d30fb8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5605-1a1d-1ddc-0bad0a900c51	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5605-1a1d-15c4-c1a3206a343c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5605-1a1d-4f23-e8b09fafbbf1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5605-1a1d-43d6-1677cb2b4dfb	Telefonska-read	Telefonska - branje	f
00030000-5605-1a1d-3a5b-be19784dc682	Telefonska-write	Telefonska - spreminjanje	f
00030000-5605-1a1d-ca64-105f877eb8c0	TerminStoritve-read	TerminStoritve - branje	f
00030000-5605-1a1d-7ef3-70bc0b16a53c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5605-1a1d-b50b-f365f766327f	TipFunkcije-read	TipFunkcije - branje	f
00030000-5605-1a1d-ad07-f8069b6b4cf9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5605-1a1d-78f0-006cfe843ad5	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5605-1a1d-bcaa-5571b65cf1f8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5605-1a1d-eedb-4bb9a7b5cc90	Trr-read	Trr - branje	f
00030000-5605-1a1d-8817-66334a4a881b	Trr-write	Trr - spreminjanje	f
00030000-5605-1a1d-03bc-c3e704e3c43c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5605-1a1d-abdf-7b989dce7cce	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5605-1a1d-ffab-f241e7988c57	Vaja-read	Vaja - branje	f
00030000-5605-1a1d-a5b4-fda8bb1e895a	Vaja-write	Vaja - spreminjanje	f
00030000-5605-1a1d-82f7-ab34cd56ff1e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5605-1a1d-a270-8e2c7c46c367	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5605-1a1d-17f8-d95e54a03726	VrstaStroska-read	VrstaStroska - branje	f
00030000-5605-1a1d-2b03-d71055fac03f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5605-1a1d-8309-e069edfd0b59	Zaposlitev-read	Zaposlitev - branje	f
00030000-5605-1a1d-6845-9995af542dd6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5605-1a1d-74a2-c4aea7376cd1	Zasedenost-read	Zasedenost - branje	f
00030000-5605-1a1d-31bb-8d483c777ec5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5605-1a1d-3d48-902e444e3d8e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5605-1a1d-c0a2-a3b5b61bfa43	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5605-1a1d-b3b5-34c070742346	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5605-1a1d-7f1c-812ecaab8f1b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5605-1a1d-ad9b-20a1d28a2999	Job-read	Branje opravil - samo zase - branje	f
00030000-5605-1a1d-58c0-2698a7aa3fb4	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5605-1a1d-4de5-12598908c7a3	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5605-1a1d-e625-59a45cb92a5e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5605-1a1d-b7d2-c0ff65d314e5	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5605-1a1d-f92b-02adb27e99c8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5605-1a1d-b86d-de0c6c56a462	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5605-1a1d-6586-6bef224f7cd7	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-1a1d-49a3-3f906b971148	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-1a1d-7426-69101f9dfb2b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-1a1d-ba74-e664d55f1e7b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-1a1d-7f1d-e75bbc45658a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5605-1a1d-e402-3a81ebcac9a2	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5605-1a1d-56de-ec9a1b18c17c	Datoteka-write	Datoteka - spreminjanje	f
00030000-5605-1a1d-4593-5644c544e672	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2973 (class 0 OID 20638730)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5605-1a1d-422b-716880075489	00030000-5605-1a1c-83f7-0acc15cc48d5
00020000-5605-1a1d-b078-37f5514a5b89	00030000-5605-1a1c-5b79-485045ded182
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-07c9-aa6a81dcb10f
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-4103-64b53493b1ec
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-a63c-f6488f574750
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-e92c-0c6ca83071f1
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-61b3-38e86f3121fb
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-993e-a6a242f1354c
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-acfc-f6a3ae9ded62
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-3896-50f0aded4bca
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-5b79-485045ded182
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-e789-330caf9615f1
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-29aa-9ed1c67d3d56
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-0a61-4c44fe3aa86c
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-c2a7-ba6229136aca
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-5e3d-16d93d225252
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-40db-5f4f55f8212e
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-6810-b63c0a50cc90
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-5da9-be488c343211
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-03c2-dc5ca71f1d18
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-849e-545c2a6de68f
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-a27c-fbc3ca39c55b
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-436d-0684f20401f6
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-7086-c4d87579aa68
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-c045-cc1b2913f0c5
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-dabb-a83525cd4ac8
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-c9c5-ef97f6556603
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-75ec-88b2e99bb4fe
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-9b17-61f18e04e7c0
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-0d28-31cc90a9e503
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-1ac7-5c7e140bbd42
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-c251-e2d363a1fcca
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-a71d-6b818f71b2a7
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-41db-490ef12a0cda
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-5ef8-14c732089bb4
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1c-3701-7839ff9b0377
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-31e6-59861bc45f3d
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-bb80-69b7fa0ce689
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-eac7-7607c4ae49b7
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-e4b0-37cc10aad2d5
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-b771-3e369fa657b5
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-7a7b-bc22228f1905
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-b50b-f365f766327f
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-03bc-c3e704e3c43c
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-abdf-7b989dce7cce
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-ffab-f241e7988c57
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-a5b4-fda8bb1e895a
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-74a2-c4aea7376cd1
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-31bb-8d483c777ec5
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-3d48-902e444e3d8e
00020000-5605-1a1d-9915-98c7ab1514ea	00030000-5605-1a1d-b3b5-34c070742346
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-07c9-aa6a81dcb10f
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-61b3-38e86f3121fb
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-993e-a6a242f1354c
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-5b79-485045ded182
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-c2a7-ba6229136aca
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-40db-5f4f55f8212e
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-5da9-be488c343211
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-03c2-dc5ca71f1d18
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-849e-545c2a6de68f
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-a27c-fbc3ca39c55b
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-436d-0684f20401f6
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-7086-c4d87579aa68
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-c045-cc1b2913f0c5
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-c9c5-ef97f6556603
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-9b17-61f18e04e7c0
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-0d28-31cc90a9e503
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-1ac7-5c7e140bbd42
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1c-5ef8-14c732089bb4
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-31e6-59861bc45f3d
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-eac7-7607c4ae49b7
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-b771-3e369fa657b5
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-43d6-1677cb2b4dfb
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-3a5b-be19784dc682
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-eedb-4bb9a7b5cc90
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-8817-66334a4a881b
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-8309-e069edfd0b59
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-6845-9995af542dd6
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-3d48-902e444e3d8e
00020000-5605-1a1d-c1e5-e56142fee410	00030000-5605-1a1d-b3b5-34c070742346
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-07c9-aa6a81dcb10f
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-a63c-f6488f574750
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-61b3-38e86f3121fb
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-426a-597b402a7515
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-1236-25b71a2e4367
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-2c45-cc7a0e3bb64f
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-993e-a6a242f1354c
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-5b79-485045ded182
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-29aa-9ed1c67d3d56
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-c2a7-ba6229136aca
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-40db-5f4f55f8212e
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-5da9-be488c343211
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-849e-545c2a6de68f
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-a27c-fbc3ca39c55b
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-436d-0684f20401f6
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-c045-cc1b2913f0c5
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-c9c5-ef97f6556603
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-1ac7-5c7e140bbd42
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-a71d-6b818f71b2a7
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1c-5ef8-14c732089bb4
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-31e6-59861bc45f3d
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-eac7-7607c4ae49b7
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-b771-3e369fa657b5
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-b50b-f365f766327f
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-ffab-f241e7988c57
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-74a2-c4aea7376cd1
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-3d48-902e444e3d8e
00020000-5605-1a1d-62ed-168e4df9bc9f	00030000-5605-1a1d-b3b5-34c070742346
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-07c9-aa6a81dcb10f
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-4103-64b53493b1ec
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-e92c-0c6ca83071f1
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-61b3-38e86f3121fb
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-993e-a6a242f1354c
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-5b79-485045ded182
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-c2a7-ba6229136aca
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-40db-5f4f55f8212e
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-849e-545c2a6de68f
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-a27c-fbc3ca39c55b
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-c045-cc1b2913f0c5
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-c9c5-ef97f6556603
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-1ac7-5c7e140bbd42
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1c-5ef8-14c732089bb4
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1d-31e6-59861bc45f3d
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1d-eac7-7607c4ae49b7
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1d-b771-3e369fa657b5
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1d-b50b-f365f766327f
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1d-3d48-902e444e3d8e
00020000-5605-1a1d-4e61-7e5d6608c260	00030000-5605-1a1d-b3b5-34c070742346
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-07c9-aa6a81dcb10f
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-61b3-38e86f3121fb
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-993e-a6a242f1354c
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-5b79-485045ded182
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-c2a7-ba6229136aca
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-40db-5f4f55f8212e
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-849e-545c2a6de68f
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-a27c-fbc3ca39c55b
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-c045-cc1b2913f0c5
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-c9c5-ef97f6556603
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-1ac7-5c7e140bbd42
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-5ef8-14c732089bb4
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1d-31e6-59861bc45f3d
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1d-eac7-7607c4ae49b7
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1d-b771-3e369fa657b5
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1d-ca64-105f877eb8c0
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1c-e434-899b026e4252
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1d-b50b-f365f766327f
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1d-3d48-902e444e3d8e
00020000-5605-1a1d-7550-75719c29e259	00030000-5605-1a1d-b3b5-34c070742346
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c0f1-4f9c93ef56c3
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-83f7-0acc15cc48d5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-e434-899b026e4252
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-acfc-f6a3ae9ded62
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-5803-feef057df330
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-f96c-34ed4a879fe6
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-4a97-bfccb7f11089
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-07c9-aa6a81dcb10f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-4103-64b53493b1ec
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-a63c-f6488f574750
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-e92c-0c6ca83071f1
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-61b3-38e86f3121fb
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-426a-597b402a7515
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-1236-25b71a2e4367
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-bb33-59dbb339a400
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-2c45-cc7a0e3bb64f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-a1b8-bab13019bde6
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-993e-a6a242f1354c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-3896-50f0aded4bca
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-5b79-485045ded182
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-e789-330caf9615f1
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-b077-9f21fce6740f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-89fe-17e15b78491e
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-99f6-ced8f084cd0f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-56e4-e858f5a4375a
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-29aa-9ed1c67d3d56
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-0a61-4c44fe3aa86c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c2a7-ba6229136aca
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-5e3d-16d93d225252
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-40db-5f4f55f8212e
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-6810-b63c0a50cc90
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-5da9-be488c343211
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-03c2-dc5ca71f1d18
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-f210-71ed6252cc4c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c794-fb1e7706905a
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-f3c6-1ae3dd2c3a85
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-d860-73fe085a83b2
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-849e-545c2a6de68f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-73a7-ad4407f40be7
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-a27c-fbc3ca39c55b
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-b0bd-66270f1d5560
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-436d-0684f20401f6
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-7086-c4d87579aa68
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-1598-4c338dd862b5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-9438-dba383180c8a
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-0e26-2b43164d8f67
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-ca41-09b017495a14
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-e689-dbe49aa781ec
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-27f1-47b4bb9160b2
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c045-cc1b2913f0c5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-dabb-a83525cd4ac8
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c9c5-ef97f6556603
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-75ec-88b2e99bb4fe
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-a15c-f0833bf6f10c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-1f26-91efe290251a
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-66c6-936bd72fb0f7
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c62f-bcdadd275447
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-9b17-61f18e04e7c0
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-0d28-31cc90a9e503
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-1ac7-5c7e140bbd42
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c251-e2d363a1fcca
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-dc16-2e67ed9f2b41
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-dc2c-8cf8a31c4c82
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-ba84-655fa6c5a090
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-9ff1-fa5111568cd9
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-a71d-6b818f71b2a7
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-41db-490ef12a0cda
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c5b1-d178cadbaa8d
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-8b62-136db2cff6e9
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-0d5a-61bc82932e61
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-7767-3d31556ef2bf
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-8148-4695c326150b
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-77f7-f35779388066
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-c343-a90568c547a0
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-0ac0-99ed6dcc4639
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-829e-13d1bf449804
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-1514-a0e9d17f69e1
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-5ce4-4fc1868b27e4
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-931c-c4226b95b82f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-73d9-4887b4f7efa6
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-d1d0-2be0bb222ba2
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-6974-6c3e3226cb84
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-535f-29a8b57387b4
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-da40-2a0a20783d57
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-a286-33d4dff2ca59
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-680d-a02d50a01a7f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-b023-1e1375c5d6f5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-5ef8-14c732089bb4
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-3701-7839ff9b0377
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-95b2-af11f1d8a30a
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-036c-d69ae2eda88d
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-6269-31e340f75fcf
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1c-259e-6c7c131c074e
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-31e6-59861bc45f3d
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-bb80-69b7fa0ce689
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-eac7-7607c4ae49b7
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-e4b0-37cc10aad2d5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-234c-a3b23387c69e
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-8421-db1b36f2b0b1
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-a974-6e348129fd6c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-a6a5-cf21ba16003c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-ca22-16c6a00cc608
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-b3e8-4d27ff916410
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-66af-167fc762348c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-38d0-6d4088eed8aa
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-b771-3e369fa657b5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-7a7b-bc22228f1905
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-a80a-b32df3fde15f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-48cb-8866afb942ef
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-6cb4-dd633a030523
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-1672-2f02a8c5e3bd
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-0b09-091245d30fb8
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-1ddc-0bad0a900c51
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-15c4-c1a3206a343c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-4f23-e8b09fafbbf1
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-43d6-1677cb2b4dfb
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-3a5b-be19784dc682
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-ca64-105f877eb8c0
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-7ef3-70bc0b16a53c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-b50b-f365f766327f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-ad07-f8069b6b4cf9
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-78f0-006cfe843ad5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-bcaa-5571b65cf1f8
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-eedb-4bb9a7b5cc90
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-8817-66334a4a881b
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-03bc-c3e704e3c43c
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-abdf-7b989dce7cce
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-ffab-f241e7988c57
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-a5b4-fda8bb1e895a
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-82f7-ab34cd56ff1e
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-a270-8e2c7c46c367
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-17f8-d95e54a03726
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-2b03-d71055fac03f
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-8309-e069edfd0b59
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-6845-9995af542dd6
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-74a2-c4aea7376cd1
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-31bb-8d483c777ec5
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-3d48-902e444e3d8e
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-c0a2-a3b5b61bfa43
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-b3b5-34c070742346
00020000-5605-1a1e-1264-45893e967ade	00030000-5605-1a1d-7f1c-812ecaab8f1b
\.


--
-- TOC entry 3002 (class 0 OID 20639055)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 20639089)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20639225)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5605-1a1f-7dd8-39e9521593b5	00090000-5605-1a1f-1173-1eb8ef95409a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5605-1a1f-3b7d-20af20a8a728	00090000-5605-1a1f-b0b8-b251cb19dfe1	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5605-1a1f-fb3d-55f548e3fc4c	00090000-5605-1a1f-dc12-737026f856df	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5605-1a1f-8c31-227955e3dfc6	00090000-5605-1a1f-07c2-b7db271d1b76	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2978 (class 0 OID 20638790)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5605-1a1e-9543-d560d75f5214	00040000-5605-1a1c-d78c-712e416c6afe	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a1e-26a9-ed7955882127	00040000-5605-1a1c-d78c-712e416c6afe	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5605-1a1e-6346-e5c86f4a32c0	00040000-5605-1a1c-d78c-712e416c6afe	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a1e-621d-9ef9c93e7895	00040000-5605-1a1c-d78c-712e416c6afe	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a1e-926b-abb47ef41b13	00040000-5605-1a1c-d78c-712e416c6afe	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a1e-8e9f-70ba20582578	00040000-5605-1a1c-a64e-0d8057ca3470	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a1e-c66a-d1a6cdb7aeb3	00040000-5605-1a1c-7b53-71fb988b4893	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a1e-cbf1-fc27845e7a7f	00040000-5605-1a1c-5951-745e6d0cdee2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a1e-e92d-a6107673187c	00040000-5605-1a1c-385e-8712226294f1	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1a20-53b0-bda5d082f379	00040000-5605-1a1c-d78c-712e416c6afe	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2980 (class 0 OID 20638824)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5605-1a1c-32f9-c5d272fdf64b	8341	Adlešiči
00050000-5605-1a1c-09ad-30c1975f19f2	5270	Ajdovščina
00050000-5605-1a1c-19e3-05f8574a2d51	6280	Ankaran/Ancarano
00050000-5605-1a1c-cfc3-d423c560f9fc	9253	Apače
00050000-5605-1a1c-4036-19a36249bd20	8253	Artiče
00050000-5605-1a1c-ad42-fb46f1701b34	4275	Begunje na Gorenjskem
00050000-5605-1a1c-fcdf-3f482eea1e0a	1382	Begunje pri Cerknici
00050000-5605-1a1c-5caa-299d564d2513	9231	Beltinci
00050000-5605-1a1c-5160-ef4583843619	2234	Benedikt
00050000-5605-1a1c-c233-3868480cec06	2345	Bistrica ob Dravi
00050000-5605-1a1c-405b-4856fe94d653	3256	Bistrica ob Sotli
00050000-5605-1a1c-c703-e4a6ebba2d70	8259	Bizeljsko
00050000-5605-1a1c-6395-8eb74cc818fb	1223	Blagovica
00050000-5605-1a1c-ad41-e8587b1c4d6a	8283	Blanca
00050000-5605-1a1c-fcd1-23b03e11b1b6	4260	Bled
00050000-5605-1a1c-b7ef-c45d010d0651	4273	Blejska Dobrava
00050000-5605-1a1c-ecdf-fe7e8f81176c	9265	Bodonci
00050000-5605-1a1c-f8a1-de1d7632ef75	9222	Bogojina
00050000-5605-1a1c-a525-f2973cd79650	4263	Bohinjska Bela
00050000-5605-1a1c-a296-7a2f1d3b5b55	4264	Bohinjska Bistrica
00050000-5605-1a1c-7421-aedccaf3430b	4265	Bohinjsko jezero
00050000-5605-1a1c-7be4-ff5d1cab7d56	1353	Borovnica
00050000-5605-1a1c-68c9-f50986ebf548	8294	Boštanj
00050000-5605-1a1c-5955-cb96e3e64fbc	5230	Bovec
00050000-5605-1a1c-4a28-eb33d20740e9	5295	Branik
00050000-5605-1a1c-08bd-986d39e45573	3314	Braslovče
00050000-5605-1a1c-4377-0b2292a72a93	5223	Breginj
00050000-5605-1a1c-edfd-fe0a8ae0eaae	8280	Brestanica
00050000-5605-1a1c-060e-f5d4b7295f1d	2354	Bresternica
00050000-5605-1a1c-5736-049f579d1e95	4243	Brezje
00050000-5605-1a1c-a15b-147272180076	1351	Brezovica pri Ljubljani
00050000-5605-1a1c-27ab-ecc8ad97a4eb	8250	Brežice
00050000-5605-1a1c-bd5b-fddff13190c2	4210	Brnik - Aerodrom
00050000-5605-1a1c-81a8-df6496140a7d	8321	Brusnice
00050000-5605-1a1c-33ac-b55fef0ff4f6	3255	Buče
00050000-5605-1a1c-0fd2-96b6e2509bfb	8276	Bučka 
00050000-5605-1a1c-4ad5-08aeab76b10f	9261	Cankova
00050000-5605-1a1c-e2ce-8e8314ffc3a0	3000	Celje 
00050000-5605-1a1c-1543-3379fa67322a	3001	Celje - poštni predali
00050000-5605-1a1c-012f-6439dd15ea04	4207	Cerklje na Gorenjskem
00050000-5605-1a1c-2abc-fc2eee09121c	8263	Cerklje ob Krki
00050000-5605-1a1c-e122-6a570431341e	1380	Cerknica
00050000-5605-1a1c-8215-4cbf6a14f327	5282	Cerkno
00050000-5605-1a1c-26c9-155d4427ea23	2236	Cerkvenjak
00050000-5605-1a1c-349d-5f1299e13435	2215	Ceršak
00050000-5605-1a1c-33de-e142619d9178	2326	Cirkovce
00050000-5605-1a1c-85b0-b345b5ad1758	2282	Cirkulane
00050000-5605-1a1c-3fe2-059e14bf4fd2	5273	Col
00050000-5605-1a1c-70db-14ff4a95e32c	8251	Čatež ob Savi
00050000-5605-1a1c-ae23-9b1e1bf12c9a	1413	Čemšenik
00050000-5605-1a1c-1304-8bc5aec19dfc	5253	Čepovan
00050000-5605-1a1c-feaa-4502f7abd6f1	9232	Črenšovci
00050000-5605-1a1c-8f94-739741021f0f	2393	Črna na Koroškem
00050000-5605-1a1c-5de4-8b24b969c1de	6275	Črni Kal
00050000-5605-1a1c-610f-4ea5813efa4d	5274	Črni Vrh nad Idrijo
00050000-5605-1a1c-8895-abd8bbd18117	5262	Črniče
00050000-5605-1a1c-4cf6-34e36fa1d436	8340	Črnomelj
00050000-5605-1a1c-fefc-9d0e49fc9359	6271	Dekani
00050000-5605-1a1c-6dec-76c4852843bf	5210	Deskle
00050000-5605-1a1c-a336-228024cc1489	2253	Destrnik
00050000-5605-1a1c-e5b1-41fb1627fe4b	6215	Divača
00050000-5605-1a1c-2513-22eb622c16c1	1233	Dob
00050000-5605-1a1c-917c-0e98e1334c37	3224	Dobje pri Planini
00050000-5605-1a1c-5353-b26ecdc83451	8257	Dobova
00050000-5605-1a1c-6bb7-b12af8591238	1423	Dobovec
00050000-5605-1a1c-540d-fd8e265b44f4	5263	Dobravlje
00050000-5605-1a1c-eccc-3a2afbff21de	3204	Dobrna
00050000-5605-1a1c-c8cc-4c101115a456	8211	Dobrnič
00050000-5605-1a1c-1609-c2454994808a	1356	Dobrova
00050000-5605-1a1c-6035-fd1622e0f832	9223	Dobrovnik/Dobronak 
00050000-5605-1a1c-6ea0-a6c79aa80d66	5212	Dobrovo v Brdih
00050000-5605-1a1c-0f22-5a657062c5af	1431	Dol pri Hrastniku
00050000-5605-1a1c-7803-70cbc8880b9e	1262	Dol pri Ljubljani
00050000-5605-1a1c-eb10-9b0325ca7a50	1273	Dole pri Litiji
00050000-5605-1a1c-2012-311dac81b289	1331	Dolenja vas
00050000-5605-1a1c-0178-93443fcaaa44	8350	Dolenjske Toplice
00050000-5605-1a1c-eef6-5242db104920	1230	Domžale
00050000-5605-1a1c-72af-c9e787719fef	2252	Dornava
00050000-5605-1a1c-5ee6-b6f525d84b51	5294	Dornberk
00050000-5605-1a1c-acb3-4f8c1e22ac49	1319	Draga
00050000-5605-1a1c-12fb-987272ed8351	8343	Dragatuš
00050000-5605-1a1c-31aa-0fc3505acadb	3222	Dramlje
00050000-5605-1a1c-ad74-84f76bbfbefa	2370	Dravograd
00050000-5605-1a1c-04dd-a8155ba5a9c3	4203	Duplje
00050000-5605-1a1c-dbd9-67051bf538cb	6221	Dutovlje
00050000-5605-1a1c-b6c9-c4e69d32487f	8361	Dvor
00050000-5605-1a1c-9ded-08d69d2c4f4b	2343	Fala
00050000-5605-1a1c-e1d4-660dad201629	9208	Fokovci
00050000-5605-1a1c-486d-960ff986a9ae	2313	Fram
00050000-5605-1a1c-58ab-60c293e938e0	3213	Frankolovo
00050000-5605-1a1c-e7db-d1caca27627d	1274	Gabrovka
00050000-5605-1a1c-56ce-d812f349245d	8254	Globoko
00050000-5605-1a1c-32dd-fbaf0427cb67	5275	Godovič
00050000-5605-1a1c-6068-54f7ac687527	4204	Golnik
00050000-5605-1a1c-5998-c4282b682e0c	3303	Gomilsko
00050000-5605-1a1c-bf1f-4226a711ee6c	4224	Gorenja vas
00050000-5605-1a1c-4692-115a19b86956	3263	Gorica pri Slivnici
00050000-5605-1a1c-2f17-50be898b151a	2272	Gorišnica
00050000-5605-1a1c-50f1-6099ca984639	9250	Gornja Radgona
00050000-5605-1a1c-56b2-1deaebbb271b	3342	Gornji Grad
00050000-5605-1a1c-b05c-e81ae6e08a0d	4282	Gozd Martuljek
00050000-5605-1a1c-1589-0a6ab9850046	6272	Gračišče
00050000-5605-1a1c-c109-90c357c03c9f	9264	Grad
00050000-5605-1a1c-3d0d-256dbe1a0d8b	8332	Gradac
00050000-5605-1a1c-1265-c6a409439ff9	1384	Grahovo
00050000-5605-1a1c-9289-1b7042582656	5242	Grahovo ob Bači
00050000-5605-1a1c-b27c-3ccad45dfb66	5251	Grgar
00050000-5605-1a1c-16e6-ce7cfcf1dea8	3302	Griže
00050000-5605-1a1c-3955-5c33ab671443	3231	Grobelno
00050000-5605-1a1c-e976-4a12f461d46c	1290	Grosuplje
00050000-5605-1a1c-1c67-f38a98d08903	2288	Hajdina
00050000-5605-1a1c-e913-d5a757d22e0c	8362	Hinje
00050000-5605-1a1c-a877-45672ac95526	2311	Hoče
00050000-5605-1a1c-0e21-f2650cd5cb8e	9205	Hodoš/Hodos
00050000-5605-1a1c-4f13-715aeeb9ba04	1354	Horjul
00050000-5605-1a1c-0276-fbb8f5204f12	1372	Hotedršica
00050000-5605-1a1c-f68f-cb9e04490e14	1430	Hrastnik
00050000-5605-1a1c-b79b-5cc1af1fda9c	6225	Hruševje
00050000-5605-1a1c-f88e-66d61190b202	4276	Hrušica
00050000-5605-1a1c-8f6e-fd1b055a88f8	5280	Idrija
00050000-5605-1a1c-09ff-a205845b3022	1292	Ig
00050000-5605-1a1c-e258-a20543ef202f	6250	Ilirska Bistrica
00050000-5605-1a1c-07d4-d6086969c9a9	6251	Ilirska Bistrica-Trnovo
00050000-5605-1a1c-377d-0cb17d784f04	1295	Ivančna Gorica
00050000-5605-1a1c-89e3-3f798bc6c369	2259	Ivanjkovci
00050000-5605-1a1c-d6dd-5ed9f372068a	1411	Izlake
00050000-5605-1a1c-4eab-c56efec40fad	6310	Izola/Isola
00050000-5605-1a1c-7ea8-49ce0879cd1f	2222	Jakobski Dol
00050000-5605-1a1c-295c-671c8e95ef42	2221	Jarenina
00050000-5605-1a1c-0a37-afbc6aac751d	6254	Jelšane
00050000-5605-1a1c-ba57-b6c4b0767bd1	4270	Jesenice
00050000-5605-1a1c-402c-cc003155f02f	8261	Jesenice na Dolenjskem
00050000-5605-1a1c-5a35-fae5fcad3bf8	3273	Jurklošter
00050000-5605-1a1c-6fc4-ad14a8ea89ce	2223	Jurovski Dol
00050000-5605-1a1c-1534-d0f124d47e10	2256	Juršinci
00050000-5605-1a1c-8fb1-6eabead06cf6	5214	Kal nad Kanalom
00050000-5605-1a1c-6eb9-ff6fda6c5537	3233	Kalobje
00050000-5605-1a1c-911b-6aa1b43073ac	4246	Kamna Gorica
00050000-5605-1a1c-7fb3-b0290c072339	2351	Kamnica
00050000-5605-1a1c-33e7-f57fc5ba1939	1241	Kamnik
00050000-5605-1a1c-e58e-305390215449	5213	Kanal
00050000-5605-1a1c-10eb-d5f5a97cb78e	8258	Kapele
00050000-5605-1a1c-0495-8bab06354cfd	2362	Kapla
00050000-5605-1a1c-e797-ca5ecb2558f6	2325	Kidričevo
00050000-5605-1a1c-db91-39ba8f5b1aca	1412	Kisovec
00050000-5605-1a1c-a5a6-e0c90a7ab9a8	6253	Knežak
00050000-5605-1a1c-ccbf-79a2402b291e	5222	Kobarid
00050000-5605-1a1c-eccf-129d10919c3e	9227	Kobilje
00050000-5605-1a1c-b109-e7ab38979854	1330	Kočevje
00050000-5605-1a1c-da29-368ccf109a7a	1338	Kočevska Reka
00050000-5605-1a1c-9eb6-6b57a61b8a15	2276	Kog
00050000-5605-1a1c-f9d5-b06009272456	5211	Kojsko
00050000-5605-1a1c-bf1c-acf120907d7d	6223	Komen
00050000-5605-1a1c-5f28-7211aaeeb84f	1218	Komenda
00050000-5605-1a1c-19e3-11b6d1cf6de2	6000	Koper/Capodistria 
00050000-5605-1a1c-197a-258c10e1d963	6001	Koper/Capodistria - poštni predali
00050000-5605-1a1c-9a3f-94661655e81c	8282	Koprivnica
00050000-5605-1a1c-c1f6-590b66ab6bdb	5296	Kostanjevica na Krasu
00050000-5605-1a1c-3464-6ba26e696509	8311	Kostanjevica na Krki
00050000-5605-1a1c-3523-d47b2501a4eb	1336	Kostel
00050000-5605-1a1c-da16-6846668ca484	6256	Košana
00050000-5605-1a1c-b721-ed95101ad1f5	2394	Kotlje
00050000-5605-1a1c-e7a6-977801e5e333	6240	Kozina
00050000-5605-1a1c-6468-220f9d36f195	3260	Kozje
00050000-5605-1a1c-ffda-85e238c9a29b	4000	Kranj 
00050000-5605-1a1c-82ba-741fceba3278	4001	Kranj - poštni predali
00050000-5605-1a1c-b3ac-8dd7aebfe678	4280	Kranjska Gora
00050000-5605-1a1c-c822-b09145f5eeed	1281	Kresnice
00050000-5605-1a1c-b4bc-124f8517c3e6	4294	Križe
00050000-5605-1a1c-e16e-34efc8354f33	9206	Križevci
00050000-5605-1a1c-2c3d-6aadad6246a7	9242	Križevci pri Ljutomeru
00050000-5605-1a1c-b28f-632a2b50dd44	1301	Krka
00050000-5605-1a1c-0d8f-f64fa17263cf	8296	Krmelj
00050000-5605-1a1c-27d0-ce1c3232322e	4245	Kropa
00050000-5605-1a1c-aba9-32a42e46b8b5	8262	Krška vas
00050000-5605-1a1c-dae7-6b0f692e932d	8270	Krško
00050000-5605-1a1c-5d86-be72c9fe20f0	9263	Kuzma
00050000-5605-1a1c-d1e9-b0ff865b1a69	2318	Laporje
00050000-5605-1a1c-44cd-40689f62bfb5	3270	Laško
00050000-5605-1a1c-0abb-4849ecae0dab	1219	Laze v Tuhinju
00050000-5605-1a1c-5241-a79835d40265	2230	Lenart v Slovenskih goricah
00050000-5605-1a1c-7434-dfa23bcafe42	9220	Lendava/Lendva
00050000-5605-1a1c-ee1b-9d022fcdfdbc	4248	Lesce
00050000-5605-1a1c-c7fb-81065cae431f	3261	Lesično
00050000-5605-1a1c-a4a5-877c2b100203	8273	Leskovec pri Krškem
00050000-5605-1a1c-7ba1-cb67110269fd	2372	Libeliče
00050000-5605-1a1c-e463-acc21b70ce52	2341	Limbuš
00050000-5605-1a1c-8598-8626b4ae2e09	1270	Litija
00050000-5605-1a1c-8fa9-2a6db266a816	3202	Ljubečna
00050000-5605-1a1c-8f4c-2e875402a00d	1000	Ljubljana 
00050000-5605-1a1c-4644-d382f7c267e3	1001	Ljubljana - poštni predali
00050000-5605-1a1c-a026-afb8cbe33877	1231	Ljubljana - Črnuče
00050000-5605-1a1c-9e58-980a1182fcd6	1261	Ljubljana - Dobrunje
00050000-5605-1a1c-642d-fa7d4584e3aa	1260	Ljubljana - Polje
00050000-5605-1a1c-5ba5-0acc12f20cce	1210	Ljubljana - Šentvid
00050000-5605-1a1c-de03-ca33b8a2e82d	1211	Ljubljana - Šmartno
00050000-5605-1a1c-f254-140038d23253	3333	Ljubno ob Savinji
00050000-5605-1a1c-244d-c79dfa23fbd6	9240	Ljutomer
00050000-5605-1a1c-d39f-77c639bb1527	3215	Loče
00050000-5605-1a1c-d3c3-c336dc6ad15e	5231	Log pod Mangartom
00050000-5605-1a1c-81c8-e76d1bf2fa77	1358	Log pri Brezovici
00050000-5605-1a1c-be46-cbb495348f50	1370	Logatec
00050000-5605-1a1c-74d4-ba472e4bd5f7	1371	Logatec
00050000-5605-1a1c-597b-8b808abf7cc9	1434	Loka pri Zidanem Mostu
00050000-5605-1a1c-bbdb-f447f331aba2	3223	Loka pri Žusmu
00050000-5605-1a1c-f09b-d06aa127b291	6219	Lokev
00050000-5605-1a1c-0ca3-955430cc62e2	1318	Loški Potok
00050000-5605-1a1c-fbb9-9603b3e3874c	2324	Lovrenc na Dravskem polju
00050000-5605-1a1c-a365-9d9812b7ec29	2344	Lovrenc na Pohorju
00050000-5605-1a1c-521d-f2fdfcc2ee99	3334	Luče
00050000-5605-1a1c-c2d9-021df922cc17	1225	Lukovica
00050000-5605-1a1c-e781-beb9b002a997	9202	Mačkovci
00050000-5605-1a1c-694d-c80f5f82a03b	2322	Majšperk
00050000-5605-1a1c-873e-c3e388208b48	2321	Makole
00050000-5605-1a1c-1523-00286f68d652	9243	Mala Nedelja
00050000-5605-1a1c-28e2-f6e2b4f5f15e	2229	Malečnik
00050000-5605-1a1c-9a6f-7ec5aa804cbe	6273	Marezige
00050000-5605-1a1c-5c92-23d7e1ed3393	2000	Maribor 
00050000-5605-1a1c-45a7-31e4cd635261	2001	Maribor - poštni predali
00050000-5605-1a1c-ce9a-674ad3ee7d74	2206	Marjeta na Dravskem polju
00050000-5605-1a1c-6d19-45fea50c834c	2281	Markovci
00050000-5605-1a1c-1da2-426b6c8efc33	9221	Martjanci
00050000-5605-1a1c-9a93-2e915ad0ab7e	6242	Materija
00050000-5605-1a1c-ed69-7cdf91a06231	4211	Mavčiče
00050000-5605-1a1c-3b84-236415ba57c3	1215	Medvode
00050000-5605-1a1c-9abf-b381f43013cc	1234	Mengeš
00050000-5605-1a1c-7d30-899709b4ebf0	8330	Metlika
00050000-5605-1a1c-3957-db6a659eb895	2392	Mežica
00050000-5605-1a1c-de9a-77f81ef5e844	2204	Miklavž na Dravskem polju
00050000-5605-1a1c-d812-b710f4eb5e5f	2275	Miklavž pri Ormožu
00050000-5605-1a1c-0b35-6e541f66c0d4	5291	Miren
00050000-5605-1a1c-bec8-273f12ee2d5c	8233	Mirna
00050000-5605-1a1c-0af8-dcdceaaea5b1	8216	Mirna Peč
00050000-5605-1a1c-8ad8-48aaaf1f1e39	2382	Mislinja
00050000-5605-1a1c-2b46-d9e5109c558c	4281	Mojstrana
00050000-5605-1a1c-a1a1-0288f98ce238	8230	Mokronog
00050000-5605-1a1c-80f7-42f8fdd3ecc2	1251	Moravče
00050000-5605-1a1c-3bb3-c3be898b06ce	9226	Moravske Toplice
00050000-5605-1a1c-1fd0-e6c6355ac2bd	5216	Most na Soči
00050000-5605-1a1c-7355-75eb33737b5f	1221	Motnik
00050000-5605-1a1c-c1eb-2031f71a6f6b	3330	Mozirje
00050000-5605-1a1c-fcac-dc9d4440a486	9000	Murska Sobota 
00050000-5605-1a1c-2e0e-169ba4eb6bc1	9001	Murska Sobota - poštni predali
00050000-5605-1a1c-a6a9-0a3a06912bfc	2366	Muta
00050000-5605-1a1c-4841-fc294bb741b8	4202	Naklo
00050000-5605-1a1c-2e38-463e3c5a587f	3331	Nazarje
00050000-5605-1a1c-dabc-334fd2058180	1357	Notranje Gorice
00050000-5605-1a1c-37d5-e3bfab73c499	3203	Nova Cerkev
00050000-5605-1a1c-8c86-1e477480ce06	5000	Nova Gorica 
00050000-5605-1a1c-7b87-0a15b4a8728c	5001	Nova Gorica - poštni predali
00050000-5605-1a1c-be42-c33c28c7d622	1385	Nova vas
00050000-5605-1a1c-e930-b131326ddc7c	8000	Novo mesto
00050000-5605-1a1c-282a-665d8e958dc3	8001	Novo mesto - poštni predali
00050000-5605-1a1c-91db-8dc9f8216806	6243	Obrov
00050000-5605-1a1c-2eae-fdcd3f56905c	9233	Odranci
00050000-5605-1a1c-291b-e2cea0f6a9f3	2317	Oplotnica
00050000-5605-1a1c-a559-848dbbb826c5	2312	Orehova vas
00050000-5605-1a1c-9c46-385e862650f6	2270	Ormož
00050000-5605-1a1c-4be0-c0eef2dd3e47	1316	Ortnek
00050000-5605-1a1c-5a1b-5415a3f1c8ba	1337	Osilnica
00050000-5605-1a1c-bcb3-98712b657ca9	8222	Otočec
00050000-5605-1a1c-8bbf-e1954c564620	2361	Ožbalt
00050000-5605-1a1c-8234-497f8316451a	2231	Pernica
00050000-5605-1a1c-59c6-496394da6960	2211	Pesnica pri Mariboru
00050000-5605-1a1c-85bd-7c318a96c3c4	9203	Petrovci
00050000-5605-1a1c-3f30-53e1203304f0	3301	Petrovče
00050000-5605-1a1c-a4ea-6d4b86d8ac6f	6330	Piran/Pirano
00050000-5605-1a1c-1397-56bcb42c7b45	8255	Pišece
00050000-5605-1a1c-008c-1665749c21ed	6257	Pivka
00050000-5605-1a1c-5873-212e37adaa17	6232	Planina
00050000-5605-1a1c-a68b-49c5d65b4ba6	3225	Planina pri Sevnici
00050000-5605-1a1c-46a5-441116a41b2c	6276	Pobegi
00050000-5605-1a1c-4566-2aff25512b18	8312	Podbočje
00050000-5605-1a1c-b873-f75a2511eec1	5243	Podbrdo
00050000-5605-1a1c-101b-8bc8fcd3a41b	3254	Podčetrtek
00050000-5605-1a1c-43fc-316fb17b2141	2273	Podgorci
00050000-5605-1a1c-e711-499e5e2b9faf	6216	Podgorje
00050000-5605-1a1c-84ce-53d7684a5bcf	2381	Podgorje pri Slovenj Gradcu
00050000-5605-1a1c-4bd5-d46fd7ce91da	6244	Podgrad
00050000-5605-1a1c-ed23-d431e412a9b8	1414	Podkum
00050000-5605-1a1c-4695-b6a7923f3698	2286	Podlehnik
00050000-5605-1a1c-efc0-28e149ceb706	5272	Podnanos
00050000-5605-1a1c-5f8f-3800dcb3cfe8	4244	Podnart
00050000-5605-1a1c-0e24-4bbe03dfd793	3241	Podplat
00050000-5605-1a1c-0348-8c87ff80650d	3257	Podsreda
00050000-5605-1a1c-aec0-37232a099aab	2363	Podvelka
00050000-5605-1a1c-602d-780924bd2e0d	2208	Pohorje
00050000-5605-1a1c-5962-e4b5910c57c8	2257	Polenšak
00050000-5605-1a1c-7d34-3da727d54b14	1355	Polhov Gradec
00050000-5605-1a1c-c27b-c0ce3854ae8f	4223	Poljane nad Škofjo Loko
00050000-5605-1a1c-d561-64965b2db083	2319	Poljčane
00050000-5605-1a1c-f448-ae407069ee1b	1272	Polšnik
00050000-5605-1a1c-f3db-216baad4f8ea	3313	Polzela
00050000-5605-1a1c-1195-a066a71165e4	3232	Ponikva
00050000-5605-1a1c-8651-a02850b65c2d	6320	Portorož/Portorose
00050000-5605-1a1c-f7ab-3fa26517aa48	6230	Postojna
00050000-5605-1a1c-be9a-9b1fdec78eee	2331	Pragersko
00050000-5605-1a1c-b816-5a2c8b273e0e	3312	Prebold
00050000-5605-1a1c-a55e-a89b9c8720be	4205	Preddvor
00050000-5605-1a1c-6d46-16141e99cd51	6255	Prem
00050000-5605-1a1c-5af7-08ab1bc6f31a	1352	Preserje
00050000-5605-1a1c-dc63-df9dc64e8cd0	6258	Prestranek
00050000-5605-1a1c-2989-b5f09d8a119c	2391	Prevalje
00050000-5605-1a1c-69a1-7368eae0d103	3262	Prevorje
00050000-5605-1a1c-0c12-1475da686b45	1276	Primskovo 
00050000-5605-1a1c-0d9e-2790271454d0	3253	Pristava pri Mestinju
00050000-5605-1a1c-76e1-2f1ac0343791	9207	Prosenjakovci/Partosfalva
00050000-5605-1a1c-68f6-460624a37b9b	5297	Prvačina
00050000-5605-1a1c-d180-996e3944fb91	2250	Ptuj
00050000-5605-1a1c-c7f4-4a60e12232bc	2323	Ptujska Gora
00050000-5605-1a1c-5d3d-3332e8b1f7fc	9201	Puconci
00050000-5605-1a1c-5eee-f850f858d54e	2327	Rače
00050000-5605-1a1c-f9ef-029f76017009	1433	Radeče
00050000-5605-1a1c-10f0-949be72e3227	9252	Radenci
00050000-5605-1a1c-8a5b-02f6411d8c98	2360	Radlje ob Dravi
00050000-5605-1a1c-4019-f59e43fd96ff	1235	Radomlje
00050000-5605-1a1c-c4cf-a7cbda429c1d	4240	Radovljica
00050000-5605-1a1c-17f8-a8c73e6f553f	8274	Raka
00050000-5605-1a1c-518e-ef4d6d4239a6	1381	Rakek
00050000-5605-1a1c-2d92-cb52c4bd7f3e	4283	Rateče - Planica
00050000-5605-1a1c-78d9-2e2c5cb3f15c	2390	Ravne na Koroškem
00050000-5605-1a1c-06cb-3eab11672202	9246	Razkrižje
00050000-5605-1a1c-4403-7bc0c03f91c7	3332	Rečica ob Savinji
00050000-5605-1a1c-b5eb-34d40f3c7776	5292	Renče
00050000-5605-1a1c-7ae8-1bf6e01c857e	1310	Ribnica
00050000-5605-1a1c-a4f0-c933487afa71	2364	Ribnica na Pohorju
00050000-5605-1a1c-0e9f-176442ed702f	3272	Rimske Toplice
00050000-5605-1a1c-4b8a-0dea5394fb6b	1314	Rob
00050000-5605-1a1c-1be2-8236ee575b55	5215	Ročinj
00050000-5605-1a1c-a81e-6b3b1ed87042	3250	Rogaška Slatina
00050000-5605-1a1c-3fdb-958f3ceda4a7	9262	Rogašovci
00050000-5605-1a1c-e068-d25c2ae69231	3252	Rogatec
00050000-5605-1a1c-f773-4cba11b3f431	1373	Rovte
00050000-5605-1a1c-c0c0-d6f748ca618a	2342	Ruše
00050000-5605-1a1c-0ad3-084bb19b1460	1282	Sava
00050000-5605-1a1c-52ed-910c5c118454	6333	Sečovlje/Sicciole
00050000-5605-1a1c-4858-60e2ad6bda3c	4227	Selca
00050000-5605-1a1c-6c4e-d192fea78303	2352	Selnica ob Dravi
00050000-5605-1a1c-e98c-903d7d285e6b	8333	Semič
00050000-5605-1a1c-c63f-e218404eb826	8281	Senovo
00050000-5605-1a1c-b411-08dbf1c0043c	6224	Senožeče
00050000-5605-1a1c-dfe8-fb37f5d8ab2a	8290	Sevnica
00050000-5605-1a1c-bc42-1b2b4d254222	6210	Sežana
00050000-5605-1a1c-c19b-a7179a292ee4	2214	Sladki Vrh
00050000-5605-1a1c-ab33-5caf1f4ba0b9	5283	Slap ob Idrijci
00050000-5605-1a1c-dbfc-3c5775d9e61d	2380	Slovenj Gradec
00050000-5605-1a1c-444e-dd1b58d38cea	2310	Slovenska Bistrica
00050000-5605-1a1c-8ca9-6704465db4b2	3210	Slovenske Konjice
00050000-5605-1a1c-3872-ffc23fe04581	1216	Smlednik
00050000-5605-1a1c-296c-daad9771eebe	5232	Soča
00050000-5605-1a1c-8ee0-a26c45a36d12	1317	Sodražica
00050000-5605-1a1c-09ce-80b56ee368a6	3335	Solčava
00050000-5605-1a1c-a1c2-75d0caf32c67	5250	Solkan
00050000-5605-1a1c-edc7-db617e35f61f	4229	Sorica
00050000-5605-1a1c-9fb4-6a7826285871	4225	Sovodenj
00050000-5605-1a1c-f102-0f47e87bc2f2	5281	Spodnja Idrija
00050000-5605-1a1c-ea9a-0164527b3947	2241	Spodnji Duplek
00050000-5605-1a1c-3029-4320201ec38a	9245	Spodnji Ivanjci
00050000-5605-1a1c-3803-1133f7512829	2277	Središče ob Dravi
00050000-5605-1a1c-448c-a1ca3411e06d	4267	Srednja vas v Bohinju
00050000-5605-1a1c-bf9d-359388304a6d	8256	Sromlje 
00050000-5605-1a1c-04c9-ce5c2a683f66	5224	Srpenica
00050000-5605-1a1c-6c0a-5fcac0adac79	1242	Stahovica
00050000-5605-1a1c-e4fb-8a10ddc8e609	1332	Stara Cerkev
00050000-5605-1a1c-afe1-c42effb4f256	8342	Stari trg ob Kolpi
00050000-5605-1a1c-f842-b0e7b586094f	1386	Stari trg pri Ložu
00050000-5605-1a1c-0124-170fe6dc3953	2205	Starše
00050000-5605-1a1c-cbd9-36fae45b6604	2289	Stoperce
00050000-5605-1a1c-91bd-c3309826028c	8322	Stopiče
00050000-5605-1a1c-e238-27a34e99959e	3206	Stranice
00050000-5605-1a1c-5700-b3ee91225e6b	8351	Straža
00050000-5605-1a1c-52d5-7beb0f540a98	1313	Struge
00050000-5605-1a1c-a8e2-6c97a962a020	8293	Studenec
00050000-5605-1a1c-ac1a-9168376f14e6	8331	Suhor
00050000-5605-1a1c-ac19-b82f120d3895	2233	Sv. Ana v Slovenskih goricah
00050000-5605-1a1c-d971-4ae0c7c4fd20	2235	Sv. Trojica v Slovenskih goricah
00050000-5605-1a1c-0207-6a4a24792b3d	2353	Sveti Duh na Ostrem Vrhu
00050000-5605-1a1c-60c8-7daf47c82612	9244	Sveti Jurij ob Ščavnici
00050000-5605-1a1c-0988-f4911a3a236a	3264	Sveti Štefan
00050000-5605-1a1c-5e4c-c349f02b6a0e	2258	Sveti Tomaž
00050000-5605-1a1c-2079-82beb8f41958	9204	Šalovci
00050000-5605-1a1c-2b2d-d8d16da38e2b	5261	Šempas
00050000-5605-1a1c-bd22-37688871c32d	5290	Šempeter pri Gorici
00050000-5605-1a1c-1929-4001b8080c5c	3311	Šempeter v Savinjski dolini
00050000-5605-1a1c-794a-188e243e7595	4208	Šenčur
00050000-5605-1a1c-9e40-c00d4094f94f	2212	Šentilj v Slovenskih goricah
00050000-5605-1a1c-77cf-582bf6cd0e02	8297	Šentjanž
00050000-5605-1a1c-b3ab-ac362ff0d29c	2373	Šentjanž pri Dravogradu
00050000-5605-1a1c-4087-28818b34b529	8310	Šentjernej
00050000-5605-1a1c-7b8c-54c3a8850a43	3230	Šentjur
00050000-5605-1a1c-a952-a82b6d004d69	3271	Šentrupert
00050000-5605-1a1c-c354-3dbb94283f70	8232	Šentrupert
00050000-5605-1a1c-3dc6-e51d6cb0f3ba	1296	Šentvid pri Stični
00050000-5605-1a1c-8906-ed92cf7d852c	8275	Škocjan
00050000-5605-1a1c-56cb-3a35ac6bd3a8	6281	Škofije
00050000-5605-1a1c-fe24-e21a51553a90	4220	Škofja Loka
00050000-5605-1a1c-a10e-8d99632daa1b	3211	Škofja vas
00050000-5605-1a1c-3de4-e654d2cf4ec8	1291	Škofljica
00050000-5605-1a1c-e115-fe5f7a14ebe6	6274	Šmarje
00050000-5605-1a1c-3547-125d260fe77a	1293	Šmarje - Sap
00050000-5605-1a1c-9724-f8597a0551ec	3240	Šmarje pri Jelšah
00050000-5605-1a1c-06eb-88ecaf04aa80	8220	Šmarješke Toplice
00050000-5605-1a1c-dc2a-d6b0357c7f9c	2315	Šmartno na Pohorju
00050000-5605-1a1c-905c-0a33a11aa6c0	3341	Šmartno ob Dreti
00050000-5605-1a1c-cf86-d30fe67f121e	3327	Šmartno ob Paki
00050000-5605-1a1c-49a2-d45aaecde895	1275	Šmartno pri Litiji
00050000-5605-1a1c-cf08-65a94cb659f0	2383	Šmartno pri Slovenj Gradcu
00050000-5605-1a1c-1e96-9f28a8894d91	3201	Šmartno v Rožni dolini
00050000-5605-1a1c-080c-9efd253528e7	3325	Šoštanj
00050000-5605-1a1c-9a22-e21b8ef5605a	6222	Štanjel
00050000-5605-1a1c-f6d4-dcecb3428115	3220	Štore
00050000-5605-1a1c-3b91-d48990e7f058	3304	Tabor
00050000-5605-1a1c-e2c2-723058ea9967	3221	Teharje
00050000-5605-1a1c-7d66-cbb71f994f2d	9251	Tišina
00050000-5605-1a1c-ca88-787a70444ec2	5220	Tolmin
00050000-5605-1a1c-17f2-2dbfe574fe03	3326	Topolšica
00050000-5605-1a1c-0a6d-36df1634cf96	2371	Trbonje
00050000-5605-1a1c-0a41-dd28317f7bd8	1420	Trbovlje
00050000-5605-1a1c-8c42-9c5c6afbd1bd	8231	Trebelno 
00050000-5605-1a1c-8f52-bae502d30303	8210	Trebnje
00050000-5605-1a1c-624b-76be8cef220d	5252	Trnovo pri Gorici
00050000-5605-1a1c-4a2b-e72507e87df9	2254	Trnovska vas
00050000-5605-1a1c-1f23-f18946078b06	1222	Trojane
00050000-5605-1a1c-334f-ded04805eb0e	1236	Trzin
00050000-5605-1a1c-d4d5-2ec7ddc4e3d2	4290	Tržič
00050000-5605-1a1c-9efe-2b1102d6ebd9	8295	Tržišče
00050000-5605-1a1c-ed6d-425177bfd084	1311	Turjak
00050000-5605-1a1c-7c25-304e5f472e05	9224	Turnišče
00050000-5605-1a1c-99a5-d44fa32b7b2b	8323	Uršna sela
00050000-5605-1a1c-8382-929605b75177	1252	Vače
00050000-5605-1a1c-b945-a211fc0f122c	3320	Velenje 
00050000-5605-1a1c-2d0d-92b380a48523	3322	Velenje - poštni predali
00050000-5605-1a1c-a9e4-ce57d71c13fe	8212	Velika Loka
00050000-5605-1a1c-1133-373c9466d317	2274	Velika Nedelja
00050000-5605-1a1c-0d00-655422f13538	9225	Velika Polana
00050000-5605-1a1c-2d47-b8f7a085ed93	1315	Velike Lašče
00050000-5605-1a1c-c331-73a8b8d67f61	8213	Veliki Gaber
00050000-5605-1a1c-77bf-ec8536b9d0ab	9241	Veržej
00050000-5605-1a1c-d70f-72777ad49cbe	1312	Videm - Dobrepolje
00050000-5605-1a1c-95c8-414016f92192	2284	Videm pri Ptuju
00050000-5605-1a1c-c303-029f1ac0d786	8344	Vinica
00050000-5605-1a1c-eb32-fc76591aa855	5271	Vipava
00050000-5605-1a1c-125c-1d053587512a	4212	Visoko
00050000-5605-1a1c-9a4c-1f48af77cb60	1294	Višnja Gora
00050000-5605-1a1c-6a34-9b0f0c29b2c8	3205	Vitanje
00050000-5605-1a1c-c76a-421a75d46ede	2255	Vitomarci
00050000-5605-1a1c-ba5f-389b6adbb129	1217	Vodice
00050000-5605-1a1c-cdfc-1bea50794cfa	3212	Vojnik\t
00050000-5605-1a1c-6b67-94a060e1dee6	5293	Volčja Draga
00050000-5605-1a1c-0acf-8142ca62f619	2232	Voličina
00050000-5605-1a1c-1234-7152f1cd1482	3305	Vransko
00050000-5605-1a1c-d4fe-e2448c1b044c	6217	Vremski Britof
00050000-5605-1a1c-bc28-845e3c6e48ab	1360	Vrhnika
00050000-5605-1a1c-7ead-cd7d239427ea	2365	Vuhred
00050000-5605-1a1c-6e16-c6f9ba1b116a	2367	Vuzenica
00050000-5605-1a1c-e8e0-6115921f7302	8292	Zabukovje 
00050000-5605-1a1c-39c8-ddb2320d8a93	1410	Zagorje ob Savi
00050000-5605-1a1c-f922-c083f9b8d102	1303	Zagradec
00050000-5605-1a1c-d25a-2ebe9d44904a	2283	Zavrč
00050000-5605-1a1c-a4b7-103238841492	8272	Zdole 
00050000-5605-1a1c-7f6e-56322fcecfe9	4201	Zgornja Besnica
00050000-5605-1a1c-6923-2b00d2a0d839	2242	Zgornja Korena
00050000-5605-1a1c-d9dc-d183b5417287	2201	Zgornja Kungota
00050000-5605-1a1c-77f1-0f4590e2f313	2316	Zgornja Ložnica
00050000-5605-1a1c-f3fc-d1f87d6d04c7	2314	Zgornja Polskava
00050000-5605-1a1c-5c96-1bf2d2e97ead	2213	Zgornja Velka
00050000-5605-1a1c-47cc-76ecd615e9f6	4247	Zgornje Gorje
00050000-5605-1a1c-c9b5-7d67216f0d3b	4206	Zgornje Jezersko
00050000-5605-1a1c-9971-d15365406157	2285	Zgornji Leskovec
00050000-5605-1a1c-c2b1-fbdbe3feca4b	1432	Zidani Most
00050000-5605-1a1c-7461-43cbeb435269	3214	Zreče
00050000-5605-1a1c-c12e-c13a9536c104	4209	Žabnica
00050000-5605-1a1c-c7c6-0d186ecca2fc	3310	Žalec
00050000-5605-1a1c-e195-150032d175b2	4228	Železniki
00050000-5605-1a1c-9c16-200f30d1c211	2287	Žetale
00050000-5605-1a1c-f4b1-8ad0d87afc0b	4226	Žiri
00050000-5605-1a1c-ae02-a71597b280b0	4274	Žirovnica
00050000-5605-1a1c-de21-d5dbac13ad72	8360	Žužemberk
\.


--
-- TOC entry 3025 (class 0 OID 20639405)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20639029)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20638809)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5605-1a1f-309b-e4463c1a5b45	00080000-5605-1a1e-9543-d560d75f5214	\N	00040000-5605-1a1c-d78c-712e416c6afe	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5605-1a1f-631b-0ad53f41b0d9	00080000-5605-1a1e-9543-d560d75f5214	\N	00040000-5605-1a1c-d78c-712e416c6afe	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5605-1a1f-cb19-21b1d27f98fb	00080000-5605-1a1e-26a9-ed7955882127	\N	00040000-5605-1a1c-d78c-712e416c6afe	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2987 (class 0 OID 20638913)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20639041)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20639419)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20639429)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5605-1a1f-bca6-cfe9b1b98180	00080000-5605-1a1e-6346-e5c86f4a32c0	0987	AK
00190000-5605-1a1f-66f1-c946fa9f4fdb	00080000-5605-1a1e-26a9-ed7955882127	0989	AK
00190000-5605-1a1f-c2e1-99545916d0e1	00080000-5605-1a1e-621d-9ef9c93e7895	0986	AK
00190000-5605-1a1f-6e10-7b056ee74fe1	00080000-5605-1a1e-8e9f-70ba20582578	0984	AK
00190000-5605-1a1f-9b17-680d52f17d0b	00080000-5605-1a1e-c66a-d1a6cdb7aeb3	0983	AK
00190000-5605-1a1f-35bc-a62746eb8441	00080000-5605-1a1e-cbf1-fc27845e7a7f	0982	AK
00190000-5605-1a20-3e4c-b555a1850244	00080000-5605-1a20-53b0-bda5d082f379	1001	AK
\.


--
-- TOC entry 3024 (class 0 OID 20639362)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5605-1a1f-d04b-513de8b95aa3	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 20639437)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20639070)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5605-1a1e-3852-819872d357b4	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5605-1a1e-517e-6971c7f6f7a0	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5605-1a1e-25e7-838a633ff1af	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5605-1a1e-9b67-3397df3b290b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5605-1a1e-a34c-7a8ad26e790a	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5605-1a1e-65d9-a35974b8b60e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5605-1a1e-9e4f-56db19e03b50	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2996 (class 0 OID 20639014)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20639004)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20639214)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20639144)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20638887)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20638682)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5605-1a20-53b0-bda5d082f379	00010000-5605-1a1d-9aa8-db313d168b09	2015-09-25 11:55:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-5605-1a20-77b9-5c80b7bc191f	00010000-5605-1a1d-9aa8-db313d168b09	2015-09-25 11:55:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5605-1a20-3e4c-b555a1850244	00010000-5605-1a1d-9aa8-db313d168b09	2015-09-25 11:55:44	INS	a:0:{}
\.


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3005 (class 0 OID 20639083)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 20638720)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5605-1a1d-422b-716880075489	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5605-1a1d-b078-37f5514a5b89	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5605-1a1d-1fbf-7bad193dee3e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5605-1a1d-bf5a-e11f3e2c9747	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5605-1a1d-9915-98c7ab1514ea	planer	Planer dogodkov v koledarju	t
00020000-5605-1a1d-c1e5-e56142fee410	kadrovska	Kadrovska služba	t
00020000-5605-1a1d-62ed-168e4df9bc9f	arhivar	Ažuriranje arhivalij	t
00020000-5605-1a1d-4e61-7e5d6608c260	igralec	Igralec	t
00020000-5605-1a1d-7550-75719c29e259	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5605-1a1e-1264-45893e967ade	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2970 (class 0 OID 20638704)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5605-1a1d-0b2f-b1c67b5caf6d	00020000-5605-1a1d-1fbf-7bad193dee3e
00010000-5605-1a1d-9aa8-db313d168b09	00020000-5605-1a1d-1fbf-7bad193dee3e
00010000-5605-1a1f-085e-d2e721fdc6c5	00020000-5605-1a1e-1264-45893e967ade
\.


--
-- TOC entry 3007 (class 0 OID 20639097)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20639035)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20638981)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20638669)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5605-1a1c-d6c9-404c200c6a46	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5605-1a1c-659d-fbe393c52159	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5605-1a1c-d803-37cd31c073b4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5605-1a1c-07b9-3ab5216b0fe5	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5605-1a1c-691b-a25365525514	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 20638661)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5605-1a1c-39d2-dc618a6f6e35	00230000-5605-1a1c-07b9-3ab5216b0fe5	popa
00240000-5605-1a1c-0194-6f8b03b649b6	00230000-5605-1a1c-07b9-3ab5216b0fe5	oseba
00240000-5605-1a1c-2b18-a57d4dd29847	00230000-5605-1a1c-07b9-3ab5216b0fe5	sezona
00240000-5605-1a1c-94ce-de246cb21c4e	00230000-5605-1a1c-659d-fbe393c52159	prostor
00240000-5605-1a1c-4f08-e4624ce4f27a	00230000-5605-1a1c-07b9-3ab5216b0fe5	besedilo
00240000-5605-1a1c-eefd-a4fd4b4da137	00230000-5605-1a1c-07b9-3ab5216b0fe5	uprizoritev
00240000-5605-1a1c-0bbb-e1665aef4c23	00230000-5605-1a1c-07b9-3ab5216b0fe5	funkcija
00240000-5605-1a1c-88d1-2928ce6b8353	00230000-5605-1a1c-07b9-3ab5216b0fe5	tipfunkcije
00240000-5605-1a1c-6b73-c26c432bb5b6	00230000-5605-1a1c-07b9-3ab5216b0fe5	alternacija
00240000-5605-1a1c-98a7-354aacf7f2ea	00230000-5605-1a1c-d6c9-404c200c6a46	pogodba
00240000-5605-1a1c-7f77-2f2feabf7a13	00230000-5605-1a1c-07b9-3ab5216b0fe5	zaposlitev
00240000-5605-1a1c-a462-8b879e29e85e	00230000-5605-1a1c-07b9-3ab5216b0fe5	zvrstuprizoritve
00240000-5605-1a1c-dafa-f1c96e5601ba	00230000-5605-1a1c-d6c9-404c200c6a46	programdela
00240000-5605-1a1c-fd11-88b156abf62d	00230000-5605-1a1c-07b9-3ab5216b0fe5	zapis
\.


--
-- TOC entry 2964 (class 0 OID 20638656)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0335e589-6c8f-4843-8026-06ef3ce099e0	00240000-5605-1a1c-39d2-dc618a6f6e35	0	1001
\.


--
-- TOC entry 3013 (class 0 OID 20639161)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5605-1a1f-7377-b965bdb8167b	000e0000-5605-1a1f-1201-c6a02d8603f1	00080000-5605-1a1e-9543-d560d75f5214	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5605-1a1c-4181-f8ce2ad4c5dd
00270000-5605-1a1f-f3fa-3ab262c2875f	000e0000-5605-1a1f-1201-c6a02d8603f1	00080000-5605-1a1e-9543-d560d75f5214	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5605-1a1c-4181-f8ce2ad4c5dd
\.


--
-- TOC entry 2977 (class 0 OID 20638782)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20638991)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5605-1a1f-fd3c-7dd748642edd	00180000-5605-1a1f-21bf-b9887d369f30	000c0000-5605-1a1f-6776-8ceb7a8270ee	00090000-5605-1a1f-8d0a-c5f71f3bfda5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1a1f-0250-5a33cf34645e	00180000-5605-1a1f-21bf-b9887d369f30	000c0000-5605-1a1f-c679-7d6afd6ff0c4	00090000-5605-1a1f-07c2-b7db271d1b76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1a1f-4ddb-3423797f43f6	00180000-5605-1a1f-21bf-b9887d369f30	000c0000-5605-1a1f-90f7-fa2f0bb1fad5	00090000-5605-1a1f-a532-2d0671139f7a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1a1f-fa48-963ec6daf9e2	00180000-5605-1a1f-21bf-b9887d369f30	000c0000-5605-1a1f-f590-7239ea9f8bbd	00090000-5605-1a1f-5cbf-b6060fcfa578	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1a1f-1f38-06b1c9b5be29	00180000-5605-1a1f-21bf-b9887d369f30	000c0000-5605-1a1f-99ec-d06b07efce92	00090000-5605-1a1f-2c5f-2dc6fc7fa101	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1a1f-7cac-44ce342598d4	00180000-5605-1a1f-22cc-fe985be8c6b2	\N	00090000-5605-1a1f-2c5f-2dc6fc7fa101	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3016 (class 0 OID 20639202)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5605-1a1c-aa0f-50fe846a97b6	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5605-1a1c-13ff-fb774bf26797	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5605-1a1c-e5d2-4f28cffe64f3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5605-1a1c-d3c9-d7b93f17f41c	04	Režija	Režija	Režija	umetnik	30
000f0000-5605-1a1c-5b6b-a4c19008602f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5605-1a1c-793a-28831087bcf4	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5605-1a1c-24ef-cd4dd9130c64	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5605-1a1c-cb46-0f413e9dd23c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5605-1a1c-0158-dc0c2ce492a3	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5605-1a1c-ed44-cf960fb8f44d	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5605-1a1c-6e84-fcf06201d439	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5605-1a1c-b475-849564dedd7f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5605-1a1c-f9c8-347cb6010ad7	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5605-1a1c-89a6-67e79c595707	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5605-1a1c-e599-4aef82c6bdf9	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5605-1a1c-36d8-4f2ee9c58d3f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5605-1a1c-ecbd-5648ae34c204	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5605-1a1c-f699-5ad6742defc2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3029 (class 0 OID 20639447)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5605-1a1c-1177-532beb821479	01	Velika predstava	f	1.00	1.00
002b0000-5605-1a1c-7fd3-e5888de89180	02	Mala predstava	f	0.50	0.50
002b0000-5605-1a1c-7f07-2dd10436238e	03	Mala koprodukcija	t	0.40	1.00
002b0000-5605-1a1c-b137-98b0f52dd26c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5605-1a1c-6992-0d9c762fd718	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2982 (class 0 OID 20638844)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20638691)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5605-1a1d-9aa8-db313d168b09	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROGtq2xPWOJ9wtZ5lZBZFDcXsn2TCSC1e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-493d-4db9f397666f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-9414-bd664ff672f7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-1416-9769e6996ee6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-f218-fb23b443bbe6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-0702-3f8065017109	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-f90f-f55eadbb6e41	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-bfbe-4ff5db328e45	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-d368-d649d667e899	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-9f35-20bc55ce66c8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5605-1a1f-085e-d2e721fdc6c5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5605-1a1d-0b2f-b1c67b5caf6d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3020 (class 0 OID 20639252)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5605-1a1f-3c59-0a6542e285c6	00160000-5605-1a1e-67fa-16ccf0e5b64e	\N	00140000-5605-1a1c-8fdf-823a62269b3b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5605-1a1e-a34c-7a8ad26e790a
000e0000-5605-1a1f-1201-c6a02d8603f1	00160000-5605-1a1e-55c8-53116d357068	\N	00140000-5605-1a1c-0870-1b274ebdfde9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5605-1a1e-65d9-a35974b8b60e
000e0000-5605-1a1f-8d06-7d67f200e4d2	\N	\N	00140000-5605-1a1c-0870-1b274ebdfde9	00190000-5605-1a1f-bca6-cfe9b1b98180	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-1a1e-a34c-7a8ad26e790a
000e0000-5605-1a1f-3fda-4dd078fae784	\N	\N	00140000-5605-1a1c-0870-1b274ebdfde9	00190000-5605-1a1f-bca6-cfe9b1b98180	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-1a1e-a34c-7a8ad26e790a
000e0000-5605-1a1f-c94a-3620d4805e5b	\N	\N	00140000-5605-1a1c-0870-1b274ebdfde9	00190000-5605-1a1f-bca6-cfe9b1b98180	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-1a1e-3852-819872d357b4
000e0000-5605-1a1f-5873-821229f7b6b7	\N	\N	00140000-5605-1a1c-0870-1b274ebdfde9	00190000-5605-1a1f-bca6-cfe9b1b98180	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-1a1e-3852-819872d357b4
\.


--
-- TOC entry 2989 (class 0 OID 20638934)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5605-1a1f-c385-f2080e6b2219	000e0000-5605-1a1f-1201-c6a02d8603f1	\N	1	
00200000-5605-1a1f-1eb7-48daf2c96026	000e0000-5605-1a1f-1201-c6a02d8603f1	\N	2	
00200000-5605-1a1f-c8c1-c0f509d70974	000e0000-5605-1a1f-1201-c6a02d8603f1	\N	3	
00200000-5605-1a1f-2f74-59be7467d21f	000e0000-5605-1a1f-1201-c6a02d8603f1	\N	4	
00200000-5605-1a1f-4bb2-726c83ff7241	000e0000-5605-1a1f-1201-c6a02d8603f1	\N	5	
\.


--
-- TOC entry 3003 (class 0 OID 20639062)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20639175)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5605-1a1c-69a2-5d10f4a693c9	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5605-1a1c-2467-d5dde8320181	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5605-1a1c-48c1-32e5f054f644	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5605-1a1c-cb51-d3e45d5af126	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5605-1a1c-a230-331fa56e3001	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5605-1a1c-295f-137c1bb88b42	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5605-1a1c-0ad5-5fa4c68dce35	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5605-1a1c-ada3-c7e38c64acd9	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5605-1a1c-4181-f8ce2ad4c5dd	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5605-1a1c-d090-2bb5c86ec989	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5605-1a1c-3213-cc3f4768153c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5605-1a1c-4838-97f90c3e4d29	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5605-1a1c-8e6e-86ff50e2439d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5605-1a1c-fea0-2afd01b62f5c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5605-1a1c-d8fd-2541f9fb5c42	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5605-1a1c-38dc-ffdf85b3e0ee	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5605-1a1c-ac4f-611b616cde60	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5605-1a1c-34b7-b2969d2d2dcb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5605-1a1c-8b18-250952445796	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5605-1a1c-f359-697cfd2e93b5	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5605-1a1c-dba6-46c43b52badf	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5605-1a1c-bd76-cb2066acfa4f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5605-1a1c-f19d-7798b4b3bced	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5605-1a1c-4d0c-3e4f495566e2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5605-1a1c-b030-b60d046b2f58	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5605-1a1c-a2b8-e68cae11938e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5605-1a1c-b1aa-7efaff9f5bb7	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5605-1a1c-2795-6d4d0372fe18	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3032 (class 0 OID 20639494)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20639466)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20639506)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20639134)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5605-1a1f-5dbb-9348e602c1cd	00090000-5605-1a1f-07c2-b7db271d1b76	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1a1f-a58c-59b0bde47667	00090000-5605-1a1f-a532-2d0671139f7a	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1a1f-fe4d-bc4c52aa89ec	00090000-5605-1a1f-bfd8-1615b35fcdcd	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1a1f-e77b-42dcfa739ea0	00090000-5605-1a1f-618d-6cb8a9473f84	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1a1f-9868-523e8a7384cc	00090000-5605-1a1f-8d0a-c5f71f3bfda5	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1a1f-5172-041366b0c1d5	00090000-5605-1a1f-b4e4-15ccf122a1c8	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2991 (class 0 OID 20638970)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20639242)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5605-1a1c-8fdf-823a62269b3b	01	Drama	drama (SURS 01)
00140000-5605-1a1c-0149-94745feee043	02	Opera	opera (SURS 02)
00140000-5605-1a1c-b0ac-ade0ac7b906e	03	Balet	balet (SURS 03)
00140000-5605-1a1c-74bd-e54421287c8a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5605-1a1c-04a6-6c3eff360911	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5605-1a1c-0870-1b274ebdfde9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5605-1a1c-d00e-1921e5c4ca61	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3009 (class 0 OID 20639124)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2496 (class 2606 OID 20638745)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 20639301)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 20639291)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 20639158)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 20639200)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 20639546)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 20638959)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 20638980)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 20639464)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20638870)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 20639356)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 20639120)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 20638932)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20638908)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 20638884)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20639027)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 20639523)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 20639530)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2750 (class 2606 OID 20639554)
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
-- TOC entry 2608 (class 2606 OID 20639054)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 20638842)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20638754)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 20638778)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20638734)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2487 (class 2606 OID 20638719)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20639060)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 20639096)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 20639237)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20638806)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20638830)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20639417)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 20639033)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 20638820)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 20638920)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 20639045)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 20639426)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 20639434)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20639404)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20639445)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20639078)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 20639018)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 20639009)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 20639224)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 20639151)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 20638896)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20638690)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 20639087)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20638708)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2489 (class 2606 OID 20638728)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20639105)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 20639040)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 20638989)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20638678)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20638666)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 20638660)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20639171)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 20638787)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 20639000)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20639211)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20639457)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 20638855)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 20638703)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20639270)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 20638942)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20639068)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20639183)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20639504)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 20639488)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 20639512)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 20639142)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 20638974)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 20639250)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20639132)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 1259 OID 20638968)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2561 (class 1259 OID 20638969)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2562 (class 1259 OID 20638967)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2563 (class 1259 OID 20638966)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2564 (class 1259 OID 20638965)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2650 (class 1259 OID 20639172)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2651 (class 1259 OID 20639173)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 20639174)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2736 (class 1259 OID 20639525)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2737 (class 1259 OID 20639524)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2510 (class 1259 OID 20638808)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 20639061)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2723 (class 1259 OID 20639492)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2724 (class 1259 OID 20639491)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2725 (class 1259 OID 20639493)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2726 (class 1259 OID 20639490)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2727 (class 1259 OID 20639489)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 20639047)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2604 (class 1259 OID 20639046)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2555 (class 1259 OID 20638943)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20639121)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20639123)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2635 (class 1259 OID 20639122)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2535 (class 1259 OID 20638886)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2536 (class 1259 OID 20638885)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2714 (class 1259 OID 20639446)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2666 (class 1259 OID 20639239)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2667 (class 1259 OID 20639240)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 20639241)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2733 (class 1259 OID 20639513)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2675 (class 1259 OID 20639275)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2676 (class 1259 OID 20639272)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2677 (class 1259 OID 20639276)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2678 (class 1259 OID 20639274)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2679 (class 1259 OID 20639273)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2525 (class 1259 OID 20638857)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 20638856)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 20638781)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 20639088)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2491 (class 1259 OID 20638735)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2492 (class 1259 OID 20638736)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2626 (class 1259 OID 20639108)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2627 (class 1259 OID 20639107)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2628 (class 1259 OID 20639106)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 20638921)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 20638922)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 20638668)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2583 (class 1259 OID 20639013)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2584 (class 1259 OID 20639011)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2585 (class 1259 OID 20639010)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2586 (class 1259 OID 20639012)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2482 (class 1259 OID 20638709)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2483 (class 1259 OID 20638710)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 20639069)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2746 (class 1259 OID 20639547)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2648 (class 1259 OID 20639160)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 20639159)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2747 (class 1259 OID 20639555)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2748 (class 1259 OID 20639556)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2598 (class 1259 OID 20639034)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2642 (class 1259 OID 20639152)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2643 (class 1259 OID 20639153)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 20639361)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2697 (class 1259 OID 20639360)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2698 (class 1259 OID 20639357)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 20639358)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2700 (class 1259 OID 20639359)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 20638822)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 20638821)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2516 (class 1259 OID 20638823)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 20639082)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 20639081)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2706 (class 1259 OID 20639427)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2707 (class 1259 OID 20639428)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2689 (class 1259 OID 20639305)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2690 (class 1259 OID 20639306)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2691 (class 1259 OID 20639303)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2692 (class 1259 OID 20639304)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2639 (class 1259 OID 20639143)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 20639022)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2590 (class 1259 OID 20639021)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2591 (class 1259 OID 20639019)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2592 (class 1259 OID 20639020)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2685 (class 1259 OID 20639293)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 20639292)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 20638897)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2542 (class 1259 OID 20638911)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2543 (class 1259 OID 20638910)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2544 (class 1259 OID 20638909)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2545 (class 1259 OID 20638912)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2554 (class 1259 OID 20638933)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2703 (class 1259 OID 20639418)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2722 (class 1259 OID 20639465)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2740 (class 1259 OID 20639531)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2741 (class 1259 OID 20639532)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2497 (class 1259 OID 20638756)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2498 (class 1259 OID 20638755)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2506 (class 1259 OID 20638788)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2507 (class 1259 OID 20638789)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 20638975)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20639003)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20639002)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2580 (class 1259 OID 20639001)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2565 (class 1259 OID 20638961)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2566 (class 1259 OID 20638962)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2567 (class 1259 OID 20638960)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2568 (class 1259 OID 20638964)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2569 (class 1259 OID 20638963)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2513 (class 1259 OID 20638807)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20638871)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20638873)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2533 (class 1259 OID 20638872)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2534 (class 1259 OID 20638874)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2597 (class 1259 OID 20639028)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 20639238)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 20639271)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20639212)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20639213)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2504 (class 1259 OID 20638779)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2505 (class 1259 OID 20638780)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2636 (class 1259 OID 20639133)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 20638679)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 20638843)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2474 (class 1259 OID 20638667)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2719 (class 1259 OID 20639458)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 20639080)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2620 (class 1259 OID 20639079)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 20639302)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 20638831)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 20639251)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 20639505)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2712 (class 1259 OID 20639435)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 20639436)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 20639201)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2577 (class 1259 OID 20638990)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 20638729)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2781 (class 2606 OID 20639687)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2780 (class 2606 OID 20639692)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2776 (class 2606 OID 20639712)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2782 (class 2606 OID 20639682)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2778 (class 2606 OID 20639702)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2777 (class 2606 OID 20639707)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2779 (class 2606 OID 20639697)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2817 (class 2606 OID 20639877)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2816 (class 2606 OID 20639882)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 20639887)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2849 (class 2606 OID 20640052)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2850 (class 2606 OID 20640047)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 20639612)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2799 (class 2606 OID 20639797)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2844 (class 2606 OID 20640032)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20640027)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 20640037)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 20640022)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2847 (class 2606 OID 20640017)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2797 (class 2606 OID 20639792)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2798 (class 2606 OID 20639787)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2775 (class 2606 OID 20639677)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2809 (class 2606 OID 20639837)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 20639847)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2808 (class 2606 OID 20639842)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2768 (class 2606 OID 20639647)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 20639642)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 20639777)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20640007)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 20639892)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 20639897)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 20639902)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2848 (class 2606 OID 20640042)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2822 (class 2606 OID 20639922)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2825 (class 2606 OID 20639907)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2821 (class 2606 OID 20639927)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2823 (class 2606 OID 20639917)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2824 (class 2606 OID 20639912)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2766 (class 2606 OID 20639637)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 20639632)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 20639597)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2759 (class 2606 OID 20639592)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2803 (class 2606 OID 20639817)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2755 (class 2606 OID 20639572)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2754 (class 2606 OID 20639577)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2804 (class 2606 OID 20639832)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2805 (class 2606 OID 20639827)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2806 (class 2606 OID 20639822)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2773 (class 2606 OID 20639662)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 20639667)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2751 (class 2606 OID 20639557)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2787 (class 2606 OID 20639752)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2789 (class 2606 OID 20639742)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2790 (class 2606 OID 20639737)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2788 (class 2606 OID 20639747)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 20639562)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2752 (class 2606 OID 20639567)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2800 (class 2606 OID 20639802)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2853 (class 2606 OID 20640067)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 20639872)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2814 (class 2606 OID 20639867)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2855 (class 2606 OID 20640072)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2854 (class 2606 OID 20640077)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2796 (class 2606 OID 20639782)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2812 (class 2606 OID 20639857)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2811 (class 2606 OID 20639862)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 20639982)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 20639977)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20639962)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 20639967)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2834 (class 2606 OID 20639972)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2764 (class 2606 OID 20639622)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 20639617)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 20639627)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2801 (class 2606 OID 20639812)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2802 (class 2606 OID 20639807)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20639992)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2838 (class 2606 OID 20639997)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 20639952)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 20639957)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2831 (class 2606 OID 20639942)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2830 (class 2606 OID 20639947)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2810 (class 2606 OID 20639852)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 20639772)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2792 (class 2606 OID 20639767)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2794 (class 2606 OID 20639757)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2793 (class 2606 OID 20639762)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2826 (class 2606 OID 20639937)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 20639932)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 20639652)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2771 (class 2606 OID 20639657)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 20639672)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 20639987)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2840 (class 2606 OID 20640002)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20640012)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 20640057)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2851 (class 2606 OID 20640062)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 20639587)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 20639582)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2761 (class 2606 OID 20639602)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 20639607)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 20639717)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20639732)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20639727)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2786 (class 2606 OID 20639722)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-25 11:55:46 CEST

--
-- PostgreSQL database dump complete
--

