--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-23 14:07:04 CEST

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
-- TOC entry 181 (class 1259 OID 20512637)
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
-- TOC entry 229 (class 1259 OID 20513193)
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
-- TOC entry 228 (class 1259 OID 20513176)
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
-- TOC entry 219 (class 1259 OID 20513054)
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
-- TOC entry 222 (class 1259 OID 20513084)
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
-- TOC entry 243 (class 1259 OID 20513432)
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
-- TOC entry 197 (class 1259 OID 20512844)
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
-- TOC entry 199 (class 1259 OID 20512876)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20513358)
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
-- TOC entry 190 (class 1259 OID 20512758)
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
-- TOC entry 230 (class 1259 OID 20513206)
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
-- TOC entry 215 (class 1259 OID 20513009)
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
-- TOC entry 195 (class 1259 OID 20512823)
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
-- TOC entry 193 (class 1259 OID 20512798)
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
-- TOC entry 191 (class 1259 OID 20512775)
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
-- TOC entry 204 (class 1259 OID 20512923)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20513413)
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
-- TOC entry 242 (class 1259 OID 20513425)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20513447)
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
-- TOC entry 208 (class 1259 OID 20512948)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20512732)
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
-- TOC entry 182 (class 1259 OID 20512646)
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
-- TOC entry 183 (class 1259 OID 20512657)
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
-- TOC entry 178 (class 1259 OID 20512611)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20512630)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20512955)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20512989)
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
-- TOC entry 225 (class 1259 OID 20513124)
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
-- TOC entry 185 (class 1259 OID 20512690)
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
-- TOC entry 187 (class 1259 OID 20512724)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20513304)
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
-- TOC entry 205 (class 1259 OID 20512929)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20512709)
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
-- TOC entry 194 (class 1259 OID 20512813)
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
-- TOC entry 207 (class 1259 OID 20512941)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20513318)
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
-- TOC entry 234 (class 1259 OID 20513328)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20513261)
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
-- TOC entry 235 (class 1259 OID 20513336)
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
-- TOC entry 211 (class 1259 OID 20512970)
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
-- TOC entry 203 (class 1259 OID 20512914)
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
-- TOC entry 202 (class 1259 OID 20512904)
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
-- TOC entry 224 (class 1259 OID 20513113)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20513044)
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
-- TOC entry 192 (class 1259 OID 20512787)
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
-- TOC entry 175 (class 1259 OID 20512582)
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
-- TOC entry 174 (class 1259 OID 20512580)
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
-- TOC entry 212 (class 1259 OID 20512983)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20512620)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20512604)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20512997)
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
-- TOC entry 206 (class 1259 OID 20512935)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20512881)
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
-- TOC entry 173 (class 1259 OID 20512569)
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
-- TOC entry 172 (class 1259 OID 20512561)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20512556)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20513061)
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
-- TOC entry 184 (class 1259 OID 20512682)
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
-- TOC entry 201 (class 1259 OID 20512891)
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
-- TOC entry 223 (class 1259 OID 20513101)
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
-- TOC entry 236 (class 1259 OID 20513346)
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
-- TOC entry 189 (class 1259 OID 20512744)
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
-- TOC entry 176 (class 1259 OID 20512591)
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
-- TOC entry 227 (class 1259 OID 20513151)
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
-- TOC entry 196 (class 1259 OID 20512834)
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
-- TOC entry 210 (class 1259 OID 20512962)
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
-- TOC entry 221 (class 1259 OID 20513075)
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
-- TOC entry 239 (class 1259 OID 20513393)
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
-- TOC entry 238 (class 1259 OID 20513365)
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
-- TOC entry 240 (class 1259 OID 20513405)
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
-- TOC entry 217 (class 1259 OID 20513034)
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
-- TOC entry 198 (class 1259 OID 20512870)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20513141)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20513024)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20512585)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2973 (class 0 OID 20512637)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 20513193)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5602-95e6-5b7c-7ee81e1cfc09	000d0000-5602-95e6-c38d-052b8968b3da	\N	00090000-5602-95e6-5f7b-11bec80f2cb5	000b0000-5602-95e6-97d3-933d8540e9c9	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5602-95e6-3907-df2d1ceca9ee	000d0000-5602-95e6-4875-3cbcaf37ac38	00100000-5602-95e6-4747-fa0f0ceb4899	00090000-5602-95e6-6c76-313b0420b98d	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5602-95e6-6975-613aa2679675	000d0000-5602-95e6-3d10-4a03e81307de	00100000-5602-95e6-1a62-cb0d69db1b7d	00090000-5602-95e6-5f75-e2a3cc400f35	\N	0003	t	\N	2015-09-23	\N	2	t	\N	f	f
000c0000-5602-95e6-64ea-044a68455346	000d0000-5602-95e6-dcbf-c5ecb39ed237	\N	00090000-5602-95e6-3ecd-f301fb64454a	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5602-95e6-a4a2-7c693717c47b	000d0000-5602-95e6-e622-e2c6fa75e1d6	\N	00090000-5602-95e6-c008-f7793c27af80	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5602-95e6-d24d-66156c5c643b	000d0000-5602-95e6-c457-afa37581a41a	\N	00090000-5602-95e6-03c6-e9ac0d593137	000b0000-5602-95e6-18e3-f35091549ceb	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5602-95e6-d16c-43e3d5566aca	000d0000-5602-95e6-0f3e-b5320945bbc3	00100000-5602-95e6-8e61-b84710838730	00090000-5602-95e6-fbb2-6dc7d0a6eb59	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5602-95e6-2be2-b3991903c842	000d0000-5602-95e6-229a-f413055ac836	\N	00090000-5602-95e6-dfe4-01f093b035fa	000b0000-5602-95e6-2f7b-a0c56405ca4a	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5602-95e6-a19a-21ac50dd4ee2	000d0000-5602-95e6-0f3e-b5320945bbc3	00100000-5602-95e6-9196-3b72c0b6700e	00090000-5602-95e6-6c5a-4aa4baa74c82	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5602-95e6-7571-ffee8135b7ff	000d0000-5602-95e6-0f3e-b5320945bbc3	00100000-5602-95e6-00f3-b72c5300d891	00090000-5602-95e6-bff3-38c0b315948c	\N	0010	t	\N	2015-09-23	\N	16	f	\N	f	t
000c0000-5602-95e6-8099-1f250f3aadb0	000d0000-5602-95e6-0f3e-b5320945bbc3	00100000-5602-95e6-6846-b8b858e6f680	00090000-5602-95e6-c83a-68eb0918a309	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5602-95e6-eca2-26fe7dea31db	000d0000-5602-95e6-b46d-d07b437552a0	\N	00090000-5602-95e6-6c76-313b0420b98d	000b0000-5602-95e6-64ae-44d903314179	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3020 (class 0 OID 20513176)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20513054)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5602-95e6-c3be-9dcd9c60e4df	00160000-5602-95e6-8423-4b33213c272f	00090000-5602-95e6-e962-3d5d0db6536b	Avtor originala	10	t
003d0000-5602-95e6-8835-e6271ad622e5	00160000-5602-95e6-8423-4b33213c272f	00090000-5602-95e6-0f89-48b5338be768	Predelava	14	t
003d0000-5602-95e6-134f-e063dae52edf	00160000-5602-95e6-d619-4a408d0ae4b4	00090000-5602-95e6-215f-75e84a9d3902	Avtor originala	11	t
003d0000-5602-95e6-5cb5-7a2941c48e85	00160000-5602-95e6-64f0-a709c1733a64	00090000-5602-95e6-7668-2c3f2776082c	Avtor originala	12	t
003d0000-5602-95e6-e7e7-5ec71870e610	00160000-5602-95e6-8423-4b33213c272f	00090000-5602-95e6-c3a9-3b365891f344	Predelava	18	f
\.


--
-- TOC entry 3014 (class 0 OID 20513084)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5602-95e6-8423-4b33213c272f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5602-95e6-d619-4a408d0ae4b4	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5602-95e6-64f0-a709c1733a64	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3035 (class 0 OID 20513432)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 20512844)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5602-95e6-8a4a-bb763485fe35	\N	\N	00200000-5602-95e6-f64f-cbe9ebe709ab	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5602-95e6-a41b-d51dd5ea6467	\N	\N	00200000-5602-95e6-5392-4d8a954ff897	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5602-95e6-d5a7-e1c95943d4df	\N	\N	00200000-5602-95e6-80ed-12b8967de902	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5602-95e6-7072-21d71659c512	\N	\N	00200000-5602-95e6-c1ac-1ead9db238fb	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5602-95e6-fce8-2dbf3acc86ca	\N	\N	00200000-5602-95e6-7e6b-a4d1ddefaa7c	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2991 (class 0 OID 20512876)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20513358)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20512758)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5602-95e4-d484-9198d364ba97	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5602-95e4-c99c-c93743c92930	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5602-95e4-a223-8aa5613ddea9	AL	ALB	008	Albania 	Albanija	\N
00040000-5602-95e4-d77c-ee51ff4daa12	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5602-95e4-f64a-37295754ecad	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5602-95e4-44bf-73bda466d7ba	AD	AND	020	Andorra 	Andora	\N
00040000-5602-95e4-81b0-f86ad5edc288	AO	AGO	024	Angola 	Angola	\N
00040000-5602-95e4-6c00-19b51d649a2c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5602-95e4-3d7e-9067b2efe052	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5602-95e4-117e-bf2bbf95e2f1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-95e4-65d9-1e3c09924e8b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5602-95e4-445c-c42232c07d99	AM	ARM	051	Armenia 	Armenija	\N
00040000-5602-95e4-b8e4-c78c5af5d0db	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5602-95e4-f0f2-fa16b12d8cf5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5602-95e4-1622-6b7f5c578255	AT	AUT	040	Austria 	Avstrija	\N
00040000-5602-95e4-fab3-b71204cd4028	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5602-95e4-8e42-0d45a11520e6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5602-95e4-1855-a0c08728ed45	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5602-95e4-92cd-57982720ffa0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5602-95e4-44c5-456dd94c74e9	BB	BRB	052	Barbados 	Barbados	\N
00040000-5602-95e4-60bb-b1fde57dd655	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5602-95e4-92a3-0d9d2eee4f06	BE	BEL	056	Belgium 	Belgija	\N
00040000-5602-95e4-2563-47fc146382b6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5602-95e4-7f53-52fc0f39aabb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5602-95e4-5ebb-ef71382d2fa9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5602-95e4-312e-26aa9b10e12f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5602-95e4-1fc3-92ff934c6cf3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5602-95e4-666a-95f15eb6c321	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5602-95e4-fdb8-9cdf504716fa	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5602-95e4-441f-37a5ac811a02	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5602-95e4-4679-534ad3886174	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5602-95e4-dfdd-f04a8cf4f1d7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5602-95e4-44d8-aecea5f6a0e4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5602-95e4-5dba-528cf4412399	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5602-95e4-f2d0-5685629aefe5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5602-95e4-c147-7d368934f22a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5602-95e4-e9d8-fb08861360db	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5602-95e4-d176-6439eea03579	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5602-95e4-1483-e308b52a4b16	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5602-95e4-17ae-2163e9b0185f	CA	CAN	124	Canada 	Kanada	\N
00040000-5602-95e4-ad6e-b5cf166da496	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5602-95e4-a4a0-b85860ef5ac1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5602-95e4-12cc-18fe56536c67	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5602-95e4-9849-5fdbaffed34c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5602-95e4-c196-ee52847b9c7e	CL	CHL	152	Chile 	Čile	\N
00040000-5602-95e4-9e17-bbf0cd6a8396	CN	CHN	156	China 	Kitajska	\N
00040000-5602-95e4-535c-0dde6a04afa7	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5602-95e4-5bf0-171aa5231e27	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5602-95e4-82e2-b8077d1d3118	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5602-95e4-7981-69a4d40622a4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5602-95e4-0a47-041b7b6a95ed	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5602-95e4-5257-d0553bfb18c8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5602-95e4-4db2-6341b1ca53ed	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5602-95e4-a65f-c409fd1beca0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5602-95e4-8509-6ff09f185503	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5602-95e4-f72e-e693abcfc644	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5602-95e4-4ec1-907b39da8aa0	CU	CUB	192	Cuba 	Kuba	\N
00040000-5602-95e4-06ac-5f0ab14a92da	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5602-95e4-baa9-b81f5883414c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5602-95e4-f042-59f257a4cdff	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5602-95e4-0acd-c8c88a305ded	DK	DNK	208	Denmark 	Danska	\N
00040000-5602-95e4-b9db-1e5d89a229b6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5602-95e4-1fb1-403cdc5bf35a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-95e4-20b7-6d3eba8cdde1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5602-95e4-3717-c07af0580680	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5602-95e4-0840-1caa0373b4c0	EG	EGY	818	Egypt 	Egipt	\N
00040000-5602-95e4-69b4-c6b8d89e6101	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5602-95e4-a21d-9be861e05cee	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5602-95e4-9503-2e4256b06fed	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5602-95e4-38b4-9047b870c001	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5602-95e4-537d-5db42dfc5e3c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5602-95e4-27c5-e1ce0afbcc28	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5602-95e4-1c19-5756e7c2bc21	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5602-95e4-8192-cb52f2a7f75f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5602-95e4-70a4-d7ee11749567	FI	FIN	246	Finland 	Finska	\N
00040000-5602-95e4-c242-f49d223cc56f	FR	FRA	250	France 	Francija	\N
00040000-5602-95e4-61f0-42c4f5b75771	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5602-95e4-d3a1-6bfc720c4b58	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5602-95e4-cf34-956fe23c2d5d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5602-95e4-5899-0ccfe3ecbee6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5602-95e4-a5e1-2fbfe16e9250	GA	GAB	266	Gabon 	Gabon	\N
00040000-5602-95e4-5089-165e733d1074	GM	GMB	270	Gambia 	Gambija	\N
00040000-5602-95e4-07a1-529e6fc9d64e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5602-95e4-2ca1-4279b0684366	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5602-95e4-6616-57ee9316930b	GH	GHA	288	Ghana 	Gana	\N
00040000-5602-95e4-2cbf-ba978fab0e1e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5602-95e4-103b-05be911cccd8	GR	GRC	300	Greece 	Grčija	\N
00040000-5602-95e4-3468-3b5e68e3b7ff	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5602-95e4-efa5-8af4b1532ded	GD	GRD	308	Grenada 	Grenada	\N
00040000-5602-95e4-aad2-ca1a620b1fc6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5602-95e4-0b1d-179e58921340	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5602-95e4-7c1c-c5f002ad8285	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5602-95e4-5348-6a0bc7a34f27	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5602-95e4-9cba-da44d54be76a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5602-95e4-40e3-00da314bbb46	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5602-95e4-4710-4d9e6eb05abd	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5602-95e4-b22b-6261404fe1db	HT	HTI	332	Haiti 	Haiti	\N
00040000-5602-95e4-e7ee-817ab578ec55	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5602-95e4-66a1-1946f01acefb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5602-95e4-5d40-02a0ad5b583e	HN	HND	340	Honduras 	Honduras	\N
00040000-5602-95e4-f0f3-bfe3c83c5de1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5602-95e4-afca-9756cf30d3e0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5602-95e4-4a8a-e4247e536029	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5602-95e4-d55a-dcc0b8aee357	IN	IND	356	India 	Indija	\N
00040000-5602-95e4-d8df-ce86b0c4ef79	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5602-95e4-62f6-09594c834c67	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5602-95e4-bdfa-43506f68c7e2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5602-95e4-6546-caca98c648f4	IE	IRL	372	Ireland 	Irska	\N
00040000-5602-95e4-16db-fd549869dae9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5602-95e4-f8f0-4acbbd67defd	IL	ISR	376	Israel 	Izrael	\N
00040000-5602-95e4-45c8-00ecede02849	IT	ITA	380	Italy 	Italija	\N
00040000-5602-95e4-cbd6-40951b0a5a87	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5602-95e4-a3f6-81a9af88ffd9	JP	JPN	392	Japan 	Japonska	\N
00040000-5602-95e4-7a1b-87bb5b44d068	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5602-95e4-bdef-67e4d261387b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5602-95e4-c576-2cfb5e0e35c3	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5602-95e4-6673-2f0c23f4e8cd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5602-95e4-4f5f-8977c5ce53a6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5602-95e4-f5d0-1031bde394ba	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5602-95e4-6d99-27ed7165f9e3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5602-95e4-85a7-9b16894050bf	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5602-95e4-d63e-40ddf84fbb21	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5602-95e4-aa0a-71e768d898c2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5602-95e4-d154-c13d0cc88469	LV	LVA	428	Latvia 	Latvija	\N
00040000-5602-95e4-4b78-c5df85710c74	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5602-95e4-0d63-09f4805a0cf3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5602-95e4-01e4-a918b0bbb391	LR	LBR	430	Liberia 	Liberija	\N
00040000-5602-95e4-47bf-36dedd12c02b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5602-95e4-c077-8bc1290e58ce	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5602-95e4-cb5e-aa92f4cba27e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5602-95e4-c615-e8f41ea703e2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5602-95e4-8572-118d4daf9b65	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5602-95e4-59b1-e0f341bfacea	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5602-95e4-bb58-c93414ddc190	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5602-95e4-74d6-98a320e9b924	MW	MWI	454	Malawi 	Malavi	\N
00040000-5602-95e4-5d7d-bbc3a8aa60ad	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5602-95e4-459a-cd604f39909f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5602-95e4-ef93-ede4be15311a	ML	MLI	466	Mali 	Mali	\N
00040000-5602-95e4-6c38-2ec586b739df	MT	MLT	470	Malta 	Malta	\N
00040000-5602-95e4-1eff-9cf58407cef7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5602-95e4-4e9b-a1a7cadbaffe	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5602-95e4-aab2-3620e3061286	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5602-95e4-490f-189df9e6e82a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5602-95e4-d284-618c8aa7090c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5602-95e4-76e8-5f7a060e4f0a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5602-95e4-876a-914defb0f1e4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5602-95e4-9528-34b5b0a848d0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5602-95e4-2333-f792a8c22c64	MC	MCO	492	Monaco 	Monako	\N
00040000-5602-95e4-a37e-0441b41cd554	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5602-95e4-7645-4121c86b57b4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5602-95e4-ec00-ef856558bb97	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5602-95e4-a054-4f39c0b188f1	MA	MAR	504	Morocco 	Maroko	\N
00040000-5602-95e4-2e2b-626ec2828eb2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5602-95e4-93f1-5ddc72d34bec	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5602-95e4-847f-927f65743171	NA	NAM	516	Namibia 	Namibija	\N
00040000-5602-95e4-4283-337d1331e82d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5602-95e4-a34f-b1d3dee6d38f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5602-95e4-92d4-e3eb81d279f8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5602-95e4-2c05-a136c4fa0932	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5602-95e4-fc9b-7c2643960a61	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5602-95e4-6c3a-aa14d0b46b71	NE	NER	562	Niger 	Niger 	\N
00040000-5602-95e4-6627-73c33d516b94	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5602-95e4-af3d-40fa726cba17	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5602-95e4-3b4d-c0e7a241ecad	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5602-95e4-7b53-b1f5c446b4a3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5602-95e4-e1a9-ed957818f6dd	NO	NOR	578	Norway 	Norveška	\N
00040000-5602-95e4-86d1-8458c6dd71d2	OM	OMN	512	Oman 	Oman	\N
00040000-5602-95e4-ba68-1651600cb678	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5602-95e4-75e9-f84cf0c99355	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5602-95e4-a8d5-5d08943d1af5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5602-95e4-0423-138d0e3c1607	PA	PAN	591	Panama 	Panama	\N
00040000-5602-95e4-3267-8ec5003294e9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5602-95e4-e4bc-61c7db952b58	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5602-95e4-87b4-2f6f5ca6728f	PE	PER	604	Peru 	Peru	\N
00040000-5602-95e4-d9a9-5520442b76ca	PH	PHL	608	Philippines 	Filipini	\N
00040000-5602-95e4-4b16-98c9c2ef7cf5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5602-95e4-93f2-2c4fbf116aff	PL	POL	616	Poland 	Poljska	\N
00040000-5602-95e4-e6cc-bd7da033238e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5602-95e4-3001-15107f4bc891	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5602-95e4-88ef-b280db2461ac	QA	QAT	634	Qatar 	Katar	\N
00040000-5602-95e4-475b-ca43e2336ff4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5602-95e4-410f-bca450b87311	RO	ROU	642	Romania 	Romunija	\N
00040000-5602-95e4-48a5-ff60ad5987e8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5602-95e4-60f8-238ccf28477e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5602-95e4-f6ea-f9e20edf6a49	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5602-95e4-05f4-9b0e0234fcbd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5602-95e4-d2fd-15eff1510dfa	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5602-95e4-0b0d-0c94d60dc2db	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5602-95e4-133a-383095c002ae	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5602-95e4-a080-7e13bf649736	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5602-95e4-0153-3cc775281600	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5602-95e4-c6e9-4ef628227509	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5602-95e4-277e-0ad53f9fba81	SM	SMR	674	San Marino 	San Marino	\N
00040000-5602-95e4-8330-0eb088ae2095	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5602-95e4-1db2-2339b7876c2e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5602-95e4-a8e2-b90b21ee5331	SN	SEN	686	Senegal 	Senegal	\N
00040000-5602-95e4-6348-c2bbd8b19b0f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5602-95e4-361d-978d6d5cd38a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5602-95e4-1db5-409dbbe3141c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5602-95e4-e6e0-6ce2fa53fb47	SG	SGP	702	Singapore 	Singapur	\N
00040000-5602-95e4-2dcf-f4ca46d60205	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5602-95e4-4fdb-320cd99d31c0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5602-95e4-8454-4831fdcf2f2f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5602-95e4-b720-54057a6a804b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5602-95e4-25de-674c99abd64d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5602-95e4-a881-d4f300d34c59	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5602-95e4-a542-96cf9f071244	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5602-95e4-aa74-7895cf660ec0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5602-95e4-12d6-c9fa8de30235	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5602-95e4-91c9-ed6684b1c5ef	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5602-95e4-97c0-654f3b9a4826	SD	SDN	729	Sudan 	Sudan	\N
00040000-5602-95e4-6e80-f6779f20d52f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5602-95e4-6c0a-a8f4d676f0dd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5602-95e4-bd27-9411ab70620d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5602-95e4-364c-f71906fb8690	SE	SWE	752	Sweden 	Švedska	\N
00040000-5602-95e4-c133-2ab3a138a7e3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5602-95e4-0a1b-a84ef0c5bd4c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5602-95e4-125d-6ae9ce6c5685	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5602-95e4-1df6-4c1e45aa6ef4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5602-95e4-3132-5e8f0479fd19	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5602-95e4-a213-41e3ec3422ab	TH	THA	764	Thailand 	Tajska	\N
00040000-5602-95e4-90c1-1ca168c2f5a0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5602-95e4-84f6-caf22550db37	TG	TGO	768	Togo 	Togo	\N
00040000-5602-95e4-c708-728b19ac0d05	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5602-95e4-d37c-c0205c5499cd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5602-95e4-e1c6-8d1d13a63f64	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5602-95e4-909e-0910f2b2da93	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5602-95e4-dda1-7ae9d3c008f4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5602-95e4-22f1-cf4743288d6d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5602-95e4-1b48-c0639c0d4fef	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-95e4-9870-d27293a6af62	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5602-95e4-e957-46637d6a97cd	UG	UGA	800	Uganda 	Uganda	\N
00040000-5602-95e4-d82e-f36a070f5ce1	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5602-95e4-1554-b33cc5d0a2af	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5602-95e4-6e18-b66776ca81fa	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5602-95e4-4b87-5df6ece5477c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5602-95e4-df8a-db4d234ca7fb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5602-95e4-54fe-e40a82120653	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5602-95e4-1f81-992597b0910c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5602-95e4-ec61-b6ff04eea3e4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5602-95e4-32a5-c68fa6941d94	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5602-95e4-1287-5ce874b68468	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5602-95e4-1fde-35053008e181	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-95e4-67db-e3e6dcdd414e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5602-95e4-5977-0050f41d824e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5602-95e4-bf33-9873610634cb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5602-95e4-b049-8c5888d6564f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5602-95e4-1826-e442193812ca	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5602-95e4-aa15-5d01b2280e6c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3022 (class 0 OID 20513206)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5602-95e6-60f1-27e88a80a76a	000e0000-5602-95e6-0195-3a4eb673add8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-95e4-849c-a7be38c7e2aa	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-95e6-4321-a4bf615c61b8	000e0000-5602-95e6-9d79-a351a5a1e0e2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-95e4-a1b7-882d67330909	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-95e6-3f51-9b5ec9a81d92	000e0000-5602-95e6-0afb-68e0c0f8dc03	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-95e4-849c-a7be38c7e2aa	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-95e6-3421-b6a84e58e675	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-95e6-866a-0d2dbd688eb7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3007 (class 0 OID 20513009)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5602-95e6-c38d-052b8968b3da	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-5b7c-7ee81e1cfc09	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-95e4-b189-5cf7ceee4499
000d0000-5602-95e6-4875-3cbcaf37ac38	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-3907-df2d1ceca9ee	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5602-95e4-d307-1d205b07d645
000d0000-5602-95e6-3d10-4a03e81307de	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-6975-613aa2679675	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5602-95e4-be54-01c294b88965
000d0000-5602-95e6-dcbf-c5ecb39ed237	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-64ea-044a68455346	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5602-95e4-5dfd-7444ca1be380
000d0000-5602-95e6-e622-e2c6fa75e1d6	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-a4a2-7c693717c47b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5602-95e4-5dfd-7444ca1be380
000d0000-5602-95e6-c457-afa37581a41a	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-d24d-66156c5c643b	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-95e4-b189-5cf7ceee4499
000d0000-5602-95e6-0f3e-b5320945bbc3	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-a19a-21ac50dd4ee2	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5602-95e4-b189-5cf7ceee4499
000d0000-5602-95e6-229a-f413055ac836	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-2be2-b3991903c842	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5602-95e4-14a5-c8f4c052630d
000d0000-5602-95e6-b46d-d07b437552a0	000e0000-5602-95e6-9d79-a351a5a1e0e2	000c0000-5602-95e6-eca2-26fe7dea31db	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5602-95e4-e747-fc057d23915d
\.


--
-- TOC entry 2987 (class 0 OID 20512823)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20512798)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20512775)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5602-95e6-27e1-75a3d822ec19	00080000-5602-95e6-5fcf-cc7f3b0c3661	00090000-5602-95e6-bff3-38c0b315948c	AK		igralka
\.


--
-- TOC entry 2996 (class 0 OID 20512923)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20513413)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20513425)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20513447)
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
-- TOC entry 3000 (class 0 OID 20512948)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20512732)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5602-95e4-e87b-49b73cb70769	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5602-95e4-0bdf-da157f285981	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5602-95e4-32ab-61295d79428a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5602-95e4-52b2-3666cf5dbd6e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5602-95e4-1258-7595b1b7cecc	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5602-95e4-51d0-9aa2f3583b40	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5602-95e4-3d15-db348100df4a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5602-95e4-e9c5-615490589552	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-95e4-9949-999607a27681	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-95e4-a8e9-5e04af3efb10	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5602-95e4-583e-ddb80f0ddc2f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5602-95e4-0f4c-46a1f85d3e05	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5602-95e4-f3bc-9ca894de3844	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5602-95e4-4fa6-84a1cf18d148	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5602-95e6-6b19-bd1aff963126	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5602-95e6-bed1-46046e8cdb88	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5602-95e6-4644-2f81a2a014be	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5602-95e6-87a7-2f140e8387bb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5602-95e6-e409-2867af25035c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5602-95e7-09eb-9d30809073dd	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2974 (class 0 OID 20512646)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5602-95e6-fc72-62cf64685d2d	00000000-5602-95e6-6b19-bd1aff963126	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5602-95e6-3b33-1fa2e615659c	00000000-5602-95e6-6b19-bd1aff963126	00010000-5602-95e4-e634-58457dfc3f6e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5602-95e6-d28d-4432443fc3c3	00000000-5602-95e6-bed1-46046e8cdb88	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2975 (class 0 OID 20512657)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5602-95e6-5f7b-11bec80f2cb5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5602-95e6-3ecd-f301fb64454a	00010000-5602-95e6-33c0-3f333184db75	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5602-95e6-5f75-e2a3cc400f35	00010000-5602-95e6-2697-cb21edf0ef2b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5602-95e6-6c5a-4aa4baa74c82	00010000-5602-95e6-3d0a-7f4d11a43426	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5602-95e6-42be-0f8f4f107977	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5602-95e6-03c6-e9ac0d593137	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5602-95e6-c83a-68eb0918a309	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5602-95e6-fbb2-6dc7d0a6eb59	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5602-95e6-bff3-38c0b315948c	00010000-5602-95e6-62a7-c9534cc7d09f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5602-95e6-6c76-313b0420b98d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5602-95e6-7403-9658d0868615	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-95e6-c008-f7793c27af80	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5602-95e6-dfe4-01f093b035fa	00010000-5602-95e6-34ff-b82294bd915f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-95e6-e962-3d5d0db6536b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-95e6-0f89-48b5338be768	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-95e6-215f-75e84a9d3902	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-95e6-7668-2c3f2776082c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5602-95e6-c3a9-3b365891f344	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2970 (class 0 OID 20512611)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5602-95e4-1f5d-b8be804b2272	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5602-95e4-ed7a-5dcbf52fdc5b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5602-95e4-6e83-a8e7f4b329ac	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5602-95e4-2ef4-ad462482575d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5602-95e4-388d-89e893f001f9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5602-95e4-d340-79263ac93f44	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5602-95e4-a266-eb2fac337e84	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5602-95e4-0340-ec293c013863	Abonma-read	Abonma - branje	f
00030000-5602-95e4-619c-5db43055914a	Abonma-write	Abonma - spreminjanje	f
00030000-5602-95e4-ef9d-d49718bbb690	Alternacija-read	Alternacija - branje	f
00030000-5602-95e4-d5c9-f3944c83274b	Alternacija-write	Alternacija - spreminjanje	f
00030000-5602-95e4-454e-ec56091c5d2f	Arhivalija-read	Arhivalija - branje	f
00030000-5602-95e4-12a3-14bf24b9fd5b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5602-95e4-0a1b-5e500127d900	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5602-95e4-5674-0b1d3674715a	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5602-95e4-b1f6-2078c6094b75	Besedilo-read	Besedilo - branje	f
00030000-5602-95e4-f4dc-6c77332d68ea	Besedilo-write	Besedilo - spreminjanje	f
00030000-5602-95e4-c713-93db066adffe	DogodekIzven-read	DogodekIzven - branje	f
00030000-5602-95e4-d6e5-ff8e08361149	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5602-95e4-d25f-c5697a1d6d9a	Dogodek-read	Dogodek - branje	f
00030000-5602-95e4-b7f1-bea85c487b18	Dogodek-write	Dogodek - spreminjanje	f
00030000-5602-95e4-a8cb-e2b8ca895dfe	DrugiVir-read	DrugiVir - branje	f
00030000-5602-95e4-1e85-46104c01ec5f	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5602-95e4-2dc8-8164ac96a207	Drzava-read	Drzava - branje	f
00030000-5602-95e4-a07a-b57787d6b435	Drzava-write	Drzava - spreminjanje	f
00030000-5602-95e4-2a31-9950d086a720	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5602-95e4-51c1-76d08169df60	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5602-95e4-7d24-35c026964747	Funkcija-read	Funkcija - branje	f
00030000-5602-95e4-f2fd-fcc3bdb3dca5	Funkcija-write	Funkcija - spreminjanje	f
00030000-5602-95e4-1a70-af230c9d3e87	Gostovanje-read	Gostovanje - branje	f
00030000-5602-95e4-9fd9-85a3e0765077	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5602-95e4-d263-31a5f75d855c	Gostujoca-read	Gostujoca - branje	f
00030000-5602-95e4-edf8-ef1a25a456e6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5602-95e4-956d-a0da96b7cf0f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5602-95e4-aea3-6fb98f9f535c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5602-95e4-d735-c9fa4704fcaa	Kupec-read	Kupec - branje	f
00030000-5602-95e4-8149-310b8f5f100c	Kupec-write	Kupec - spreminjanje	f
00030000-5602-95e4-8c58-a8d3b1a9d574	NacinPlacina-read	NacinPlacina - branje	f
00030000-5602-95e4-4bca-d1b105e15d68	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5602-95e4-46be-ecf304431ccd	Option-read	Option - branje	f
00030000-5602-95e4-495d-4b3dae21a39e	Option-write	Option - spreminjanje	f
00030000-5602-95e4-59ee-7a7865ebadce	OptionValue-read	OptionValue - branje	f
00030000-5602-95e4-e7d8-24a8b23501a7	OptionValue-write	OptionValue - spreminjanje	f
00030000-5602-95e4-6fb7-eda28f7f145a	Oseba-read	Oseba - branje	f
00030000-5602-95e4-46a1-f99acfdda628	Oseba-write	Oseba - spreminjanje	f
00030000-5602-95e4-f3b0-83bb444a6ba9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5602-95e4-78d5-d7f898ec6bb6	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5602-95e4-da39-8f8c91a49368	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5602-95e4-3dd0-27eeaba0fa44	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5602-95e4-fc6e-1f0a65cc88da	Pogodba-read	Pogodba - branje	f
00030000-5602-95e4-d52c-77cd3f769e6f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5602-95e4-c85c-bc918e684250	Popa-read	Popa - branje	f
00030000-5602-95e4-011d-e6b440c6f80f	Popa-write	Popa - spreminjanje	f
00030000-5602-95e4-917e-9cd47f28b257	Posta-read	Posta - branje	f
00030000-5602-95e4-ccad-b98f5c6d40dd	Posta-write	Posta - spreminjanje	f
00030000-5602-95e4-b290-1cd973d4aaaa	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5602-95e4-1cd9-dcf2606e06a5	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5602-95e4-61ab-a2e25052c3b4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5602-95e4-a886-79631f647aab	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5602-95e4-9e7f-e218953c00ff	PostniNaslov-read	PostniNaslov - branje	f
00030000-5602-95e4-8459-3a1e31588857	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5602-95e4-1d56-1cf5a43c43cc	Predstava-read	Predstava - branje	f
00030000-5602-95e4-2990-b5fc181ecbf9	Predstava-write	Predstava - spreminjanje	f
00030000-5602-95e4-87be-c66c66df368c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5602-95e4-8bab-acdbf4d1665c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5602-95e4-a46c-c16855b8f155	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5602-95e4-4172-8789a66120a6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5602-95e4-f1bc-95e432ae5c5d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5602-95e4-4b50-eda272891ed1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5602-95e4-9f04-aa97e6581a77	ProgramDela-read	ProgramDela - branje	f
00030000-5602-95e4-9e28-925e23bc3ca1	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5602-95e4-b870-fcfb4b653458	ProgramFestival-read	ProgramFestival - branje	f
00030000-5602-95e4-c287-94abfd4b834a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5602-95e4-94b9-8513c271e19e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5602-95e4-83ea-c11e75c3c22b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5602-95e4-6397-6f4c06206830	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5602-95e4-2ba5-b1e7aadb0b3b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5602-95e4-0def-925139b47b83	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5602-95e4-5b3c-86e8ce55994c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5602-95e4-4187-028d613b7c86	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5602-95e4-6327-89d4c22286d0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5602-95e4-3cd2-307858f87ab9	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5602-95e4-b312-c26b4b197596	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5602-95e4-a806-c8c30667a6b3	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5602-95e4-a40e-7fa032c67ee9	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5602-95e4-c037-721ea28a994e	ProgramRazno-read	ProgramRazno - branje	f
00030000-5602-95e4-d133-8cc8b4667f25	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5602-95e4-9309-3e19c5e32efd	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5602-95e4-416b-b9b555c4c492	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5602-95e4-5cb4-6f8c76e5abf2	Prostor-read	Prostor - branje	f
00030000-5602-95e4-ad79-f0c8c4c33d43	Prostor-write	Prostor - spreminjanje	f
00030000-5602-95e4-b362-d31ba73e7b1a	Racun-read	Racun - branje	f
00030000-5602-95e4-b2c1-475b57ff4962	Racun-write	Racun - spreminjanje	f
00030000-5602-95e4-cbc3-c013d2569b1c	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5602-95e4-d23a-49ab045e4f16	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5602-95e4-71e8-e61b1297eaf7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5602-95e4-253f-368e6624000e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5602-95e4-a6ac-3a9ad530eef5	Rekvizit-read	Rekvizit - branje	f
00030000-5602-95e4-edb7-b689dab07760	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5602-95e4-4320-1bc61c332ccc	Revizija-read	Revizija - branje	f
00030000-5602-95e4-8a4d-7c243042e4ea	Revizija-write	Revizija - spreminjanje	f
00030000-5602-95e4-4d51-d2c647be6bf9	Rezervacija-read	Rezervacija - branje	f
00030000-5602-95e4-e32b-0bc57bf4c692	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5602-95e4-8381-4383777cd84d	SedezniRed-read	SedezniRed - branje	f
00030000-5602-95e4-03a9-8e3c52c18905	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5602-95e4-356e-a4b73330ac7c	Sedez-read	Sedez - branje	f
00030000-5602-95e4-b496-792aff0f401b	Sedez-write	Sedez - spreminjanje	f
00030000-5602-95e4-7606-a65ecae28d5a	Sezona-read	Sezona - branje	f
00030000-5602-95e4-cf8c-29ba0f345ae6	Sezona-write	Sezona - spreminjanje	f
00030000-5602-95e4-0e91-8133d0fc6188	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5602-95e4-2030-931171d426e1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5602-95e4-6300-d9a55cedb7ed	Stevilcenje-read	Stevilcenje - branje	f
00030000-5602-95e4-b235-393cdaef787a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5602-95e4-2f2e-ed70e0fd0ba5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5602-95e4-62db-794b728ba7f4	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5602-95e4-463f-9a5c83f04ea4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5602-95e4-d000-aa2172fa57b8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5602-95e4-dc4a-99cebb776174	Telefonska-read	Telefonska - branje	f
00030000-5602-95e4-4e20-61935ec8076c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5602-95e4-b1de-c37eeafb44ba	TerminStoritve-read	TerminStoritve - branje	f
00030000-5602-95e4-b427-4b4d20551561	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5602-95e4-d044-c5e28f5d08b7	TipFunkcije-read	TipFunkcije - branje	f
00030000-5602-95e4-1971-0a4c4373ddef	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5602-95e4-7ced-4058cbb7e5b8	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5602-95e4-08c6-452e91b82d18	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5602-95e4-65ae-933bc248dd51	Trr-read	Trr - branje	f
00030000-5602-95e4-6750-3004bc73120b	Trr-write	Trr - spreminjanje	f
00030000-5602-95e4-638b-7b3fbceb3c76	Uprizoritev-read	Uprizoritev - branje	f
00030000-5602-95e4-074e-0dd262b83f6e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5602-95e4-bc83-340187457014	Vaja-read	Vaja - branje	f
00030000-5602-95e4-1af7-d70c90cd3458	Vaja-write	Vaja - spreminjanje	f
00030000-5602-95e4-5a6c-20ff3ac07a64	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5602-95e4-8574-a1c74616f563	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5602-95e4-3d21-7ff2bf9b61ee	VrstaStroska-read	VrstaStroska - branje	f
00030000-5602-95e4-737e-50884c1fe178	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5602-95e4-cdcb-ba5c0c045858	Zaposlitev-read	Zaposlitev - branje	f
00030000-5602-95e4-8321-41f551519896	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5602-95e4-196d-0f20ba66ae45	Zasedenost-read	Zasedenost - branje	f
00030000-5602-95e4-228d-41a961ddbfb8	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5602-95e4-9182-6766c92c98e1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5602-95e4-29e5-54105e9034eb	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5602-95e4-9d6f-04ef1391616f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5602-95e4-8728-8fa5275fb5b6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5602-95e4-6e24-de6e914d1d3c	Job-read	Branje opravil - samo zase - branje	f
00030000-5602-95e4-f2e5-17a2436ae7ac	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5602-95e4-41d6-b49bc2fe8164	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5602-95e4-2ec4-1e66f0f67885	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5602-95e4-2575-690feb5fce47	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5602-95e4-9c3f-55a169cb5c8f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5602-95e4-46c3-7e9efd2da172	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5602-95e4-0b62-9c23e1ccedfe	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-95e4-3c78-8b439db5cfe5	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-95e4-f778-ecedfb5d9b0d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-95e4-14f7-999e27ebaebb	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-95e4-b632-d617a07210e0	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5602-95e4-2c23-1543e2e70153	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5602-95e4-193b-352e4bb25808	Datoteka-write	Datoteka - spreminjanje	f
00030000-5602-95e4-2f3f-c5b5ea90978c	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2972 (class 0 OID 20512630)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5602-95e4-01e2-ba9481f12e0a	00030000-5602-95e4-ed7a-5dcbf52fdc5b
00020000-5602-95e4-3ff6-8fc6766bffd4	00030000-5602-95e4-2dc8-8164ac96a207
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-0340-ec293c013863
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-619c-5db43055914a
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-ef9d-d49718bbb690
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-d5c9-f3944c83274b
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-454e-ec56091c5d2f
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-d25f-c5697a1d6d9a
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-2ef4-ad462482575d
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-b7f1-bea85c487b18
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-2dc8-8164ac96a207
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-a07a-b57787d6b435
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-7d24-35c026964747
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-f2fd-fcc3bdb3dca5
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-1a70-af230c9d3e87
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-9fd9-85a3e0765077
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-d263-31a5f75d855c
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-edf8-ef1a25a456e6
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-956d-a0da96b7cf0f
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-aea3-6fb98f9f535c
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-46be-ecf304431ccd
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-59ee-7a7865ebadce
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-6fb7-eda28f7f145a
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-46a1-f99acfdda628
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-c85c-bc918e684250
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-011d-e6b440c6f80f
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-917e-9cd47f28b257
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-ccad-b98f5c6d40dd
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-9e7f-e218953c00ff
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-8459-3a1e31588857
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-1d56-1cf5a43c43cc
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-2990-b5fc181ecbf9
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-f1bc-95e432ae5c5d
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-4b50-eda272891ed1
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-5cb4-6f8c76e5abf2
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-ad79-f0c8c4c33d43
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-71e8-e61b1297eaf7
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-253f-368e6624000e
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-a6ac-3a9ad530eef5
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-edb7-b689dab07760
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-7606-a65ecae28d5a
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-cf8c-29ba0f345ae6
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-d044-c5e28f5d08b7
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-638b-7b3fbceb3c76
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-074e-0dd262b83f6e
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-bc83-340187457014
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-1af7-d70c90cd3458
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-196d-0f20ba66ae45
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-228d-41a961ddbfb8
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-9182-6766c92c98e1
00020000-5602-95e4-a93c-cbed427b47ca	00030000-5602-95e4-9d6f-04ef1391616f
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-0340-ec293c013863
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-454e-ec56091c5d2f
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-d25f-c5697a1d6d9a
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-2dc8-8164ac96a207
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-1a70-af230c9d3e87
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-d263-31a5f75d855c
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-956d-a0da96b7cf0f
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-aea3-6fb98f9f535c
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-46be-ecf304431ccd
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-59ee-7a7865ebadce
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-6fb7-eda28f7f145a
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-46a1-f99acfdda628
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-c85c-bc918e684250
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-917e-9cd47f28b257
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-9e7f-e218953c00ff
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-8459-3a1e31588857
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-1d56-1cf5a43c43cc
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-5cb4-6f8c76e5abf2
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-71e8-e61b1297eaf7
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-a6ac-3a9ad530eef5
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-7606-a65ecae28d5a
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-dc4a-99cebb776174
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-4e20-61935ec8076c
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-65ae-933bc248dd51
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-6750-3004bc73120b
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-cdcb-ba5c0c045858
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-8321-41f551519896
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-9182-6766c92c98e1
00020000-5602-95e4-7f8e-2030383b2da9	00030000-5602-95e4-9d6f-04ef1391616f
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-0340-ec293c013863
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-ef9d-d49718bbb690
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-454e-ec56091c5d2f
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-12a3-14bf24b9fd5b
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-b1f6-2078c6094b75
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-c713-93db066adffe
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-d25f-c5697a1d6d9a
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-2dc8-8164ac96a207
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-7d24-35c026964747
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-1a70-af230c9d3e87
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-d263-31a5f75d855c
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-956d-a0da96b7cf0f
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-46be-ecf304431ccd
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-59ee-7a7865ebadce
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-6fb7-eda28f7f145a
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-c85c-bc918e684250
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-917e-9cd47f28b257
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-1d56-1cf5a43c43cc
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-f1bc-95e432ae5c5d
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-5cb4-6f8c76e5abf2
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-71e8-e61b1297eaf7
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-a6ac-3a9ad530eef5
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-7606-a65ecae28d5a
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-d044-c5e28f5d08b7
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-bc83-340187457014
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-196d-0f20ba66ae45
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-9182-6766c92c98e1
00020000-5602-95e4-6d77-74302d178cf2	00030000-5602-95e4-9d6f-04ef1391616f
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-0340-ec293c013863
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-619c-5db43055914a
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-d5c9-f3944c83274b
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-454e-ec56091c5d2f
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-d25f-c5697a1d6d9a
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-2dc8-8164ac96a207
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-1a70-af230c9d3e87
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-d263-31a5f75d855c
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-46be-ecf304431ccd
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-59ee-7a7865ebadce
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-c85c-bc918e684250
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-917e-9cd47f28b257
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-1d56-1cf5a43c43cc
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-5cb4-6f8c76e5abf2
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-71e8-e61b1297eaf7
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-a6ac-3a9ad530eef5
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-7606-a65ecae28d5a
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-d044-c5e28f5d08b7
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-9182-6766c92c98e1
00020000-5602-95e4-0887-91b713d810cb	00030000-5602-95e4-9d6f-04ef1391616f
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-0340-ec293c013863
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-454e-ec56091c5d2f
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-d25f-c5697a1d6d9a
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-2dc8-8164ac96a207
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-1a70-af230c9d3e87
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-d263-31a5f75d855c
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-46be-ecf304431ccd
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-59ee-7a7865ebadce
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-c85c-bc918e684250
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-917e-9cd47f28b257
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-1d56-1cf5a43c43cc
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-5cb4-6f8c76e5abf2
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-71e8-e61b1297eaf7
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-a6ac-3a9ad530eef5
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-7606-a65ecae28d5a
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-b1de-c37eeafb44ba
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-6e83-a8e7f4b329ac
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-d044-c5e28f5d08b7
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-9182-6766c92c98e1
00020000-5602-95e4-f30a-06c6b1288162	00030000-5602-95e4-9d6f-04ef1391616f
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-1f5d-b8be804b2272
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-ed7a-5dcbf52fdc5b
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-6e83-a8e7f4b329ac
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-2ef4-ad462482575d
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-388d-89e893f001f9
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d340-79263ac93f44
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a266-eb2fac337e84
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-0340-ec293c013863
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-619c-5db43055914a
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-ef9d-d49718bbb690
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d5c9-f3944c83274b
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-454e-ec56091c5d2f
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-12a3-14bf24b9fd5b
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b1f6-2078c6094b75
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-f4dc-6c77332d68ea
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-c713-93db066adffe
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d6e5-ff8e08361149
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d25f-c5697a1d6d9a
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b7f1-bea85c487b18
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-2dc8-8164ac96a207
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a07a-b57787d6b435
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a8cb-e2b8ca895dfe
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-1e85-46104c01ec5f
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-2a31-9950d086a720
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-51c1-76d08169df60
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-7d24-35c026964747
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-f2fd-fcc3bdb3dca5
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-1a70-af230c9d3e87
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-9fd9-85a3e0765077
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d263-31a5f75d855c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-edf8-ef1a25a456e6
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-956d-a0da96b7cf0f
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-aea3-6fb98f9f535c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d735-c9fa4704fcaa
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8149-310b8f5f100c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8c58-a8d3b1a9d574
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-4bca-d1b105e15d68
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-46be-ecf304431ccd
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-495d-4b3dae21a39e
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-59ee-7a7865ebadce
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-e7d8-24a8b23501a7
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-6fb7-eda28f7f145a
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-46a1-f99acfdda628
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-f3b0-83bb444a6ba9
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-78d5-d7f898ec6bb6
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-da39-8f8c91a49368
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-3dd0-27eeaba0fa44
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-fc6e-1f0a65cc88da
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d52c-77cd3f769e6f
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-c85c-bc918e684250
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-011d-e6b440c6f80f
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-917e-9cd47f28b257
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-ccad-b98f5c6d40dd
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b290-1cd973d4aaaa
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-1cd9-dcf2606e06a5
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-61ab-a2e25052c3b4
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a886-79631f647aab
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-9e7f-e218953c00ff
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8459-3a1e31588857
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-1d56-1cf5a43c43cc
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-2990-b5fc181ecbf9
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-87be-c66c66df368c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8bab-acdbf4d1665c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a46c-c16855b8f155
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-4172-8789a66120a6
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-f1bc-95e432ae5c5d
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-4b50-eda272891ed1
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-9f04-aa97e6581a77
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-9e28-925e23bc3ca1
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b870-fcfb4b653458
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-c287-94abfd4b834a
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-94b9-8513c271e19e
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-83ea-c11e75c3c22b
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-6397-6f4c06206830
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-2ba5-b1e7aadb0b3b
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-0def-925139b47b83
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-5b3c-86e8ce55994c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-4187-028d613b7c86
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-6327-89d4c22286d0
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-3cd2-307858f87ab9
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b312-c26b4b197596
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a806-c8c30667a6b3
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a40e-7fa032c67ee9
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-c037-721ea28a994e
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d133-8cc8b4667f25
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-9309-3e19c5e32efd
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-416b-b9b555c4c492
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-5cb4-6f8c76e5abf2
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-ad79-f0c8c4c33d43
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b362-d31ba73e7b1a
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b2c1-475b57ff4962
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-cbc3-c013d2569b1c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d23a-49ab045e4f16
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-71e8-e61b1297eaf7
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-253f-368e6624000e
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-a6ac-3a9ad530eef5
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-edb7-b689dab07760
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-4320-1bc61c332ccc
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8a4d-7c243042e4ea
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-4d51-d2c647be6bf9
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-e32b-0bc57bf4c692
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8381-4383777cd84d
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-03a9-8e3c52c18905
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-356e-a4b73330ac7c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b496-792aff0f401b
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-7606-a65ecae28d5a
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-cf8c-29ba0f345ae6
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-0e91-8133d0fc6188
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-2030-931171d426e1
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-6300-d9a55cedb7ed
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b235-393cdaef787a
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-2f2e-ed70e0fd0ba5
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-62db-794b728ba7f4
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-463f-9a5c83f04ea4
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d000-aa2172fa57b8
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-dc4a-99cebb776174
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-4e20-61935ec8076c
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b1de-c37eeafb44ba
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-b427-4b4d20551561
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-d044-c5e28f5d08b7
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-1971-0a4c4373ddef
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-7ced-4058cbb7e5b8
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-08c6-452e91b82d18
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-65ae-933bc248dd51
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-6750-3004bc73120b
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-638b-7b3fbceb3c76
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-074e-0dd262b83f6e
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-bc83-340187457014
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-1af7-d70c90cd3458
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-5a6c-20ff3ac07a64
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8574-a1c74616f563
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-3d21-7ff2bf9b61ee
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-737e-50884c1fe178
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-cdcb-ba5c0c045858
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8321-41f551519896
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-196d-0f20ba66ae45
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-228d-41a961ddbfb8
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-9182-6766c92c98e1
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-29e5-54105e9034eb
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-9d6f-04ef1391616f
00020000-5602-95e6-3b97-f49af0eb166b	00030000-5602-95e4-8728-8fa5275fb5b6
\.


--
-- TOC entry 3001 (class 0 OID 20512955)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 20512989)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20513124)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5602-95e6-97d3-933d8540e9c9	00090000-5602-95e6-5f7b-11bec80f2cb5	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5602-95e6-18e3-f35091549ceb	00090000-5602-95e6-03c6-e9ac0d593137	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5602-95e6-2f7b-a0c56405ca4a	00090000-5602-95e6-dfe4-01f093b035fa	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5602-95e6-64ae-44d903314179	00090000-5602-95e6-6c76-313b0420b98d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2977 (class 0 OID 20512690)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5602-95e6-5fcf-cc7f3b0c3661	00040000-5602-95e4-8454-4831fdcf2f2f	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e6-56ca-0ae697af82f6	00040000-5602-95e4-8454-4831fdcf2f2f	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5602-95e6-5909-96fd59e0ede9	00040000-5602-95e4-8454-4831fdcf2f2f	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e6-b248-575bddb307c8	00040000-5602-95e4-8454-4831fdcf2f2f	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e6-f002-1a90e146b277	00040000-5602-95e4-8454-4831fdcf2f2f	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e6-2f03-20f20fce28db	00040000-5602-95e4-65d9-1e3c09924e8b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e6-a930-dc873dfe2b74	00040000-5602-95e4-f72e-e693abcfc644	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e6-8b26-cc2dd639772b	00040000-5602-95e4-1622-6b7f5c578255	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e6-73a5-3687a37727ac	00040000-5602-95e4-2ca1-4279b0684366	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-95e7-3d27-c897eb146d34	00040000-5602-95e4-8454-4831fdcf2f2f	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2979 (class 0 OID 20512724)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5602-95e3-167c-c0568582fbdc	8341	Adlešiči
00050000-5602-95e3-3abe-9dced4c8af9b	5270	Ajdovščina
00050000-5602-95e3-b5ec-8fc03b6d215c	6280	Ankaran/Ancarano
00050000-5602-95e3-d67e-0160693d1cdd	9253	Apače
00050000-5602-95e3-c316-7b1942783fed	8253	Artiče
00050000-5602-95e3-288f-93a80c93420a	4275	Begunje na Gorenjskem
00050000-5602-95e3-70bc-ce980963392e	1382	Begunje pri Cerknici
00050000-5602-95e3-cbda-11e1b7f4bd5e	9231	Beltinci
00050000-5602-95e3-13c6-e09912283b9c	2234	Benedikt
00050000-5602-95e3-dd56-ddd4ada0d201	2345	Bistrica ob Dravi
00050000-5602-95e3-3484-1834c7f1d6cf	3256	Bistrica ob Sotli
00050000-5602-95e3-57e0-4203237b38a7	8259	Bizeljsko
00050000-5602-95e3-da93-1b4e6922f835	1223	Blagovica
00050000-5602-95e3-dd67-e106971e4276	8283	Blanca
00050000-5602-95e3-9014-05f6ee0f77ec	4260	Bled
00050000-5602-95e3-58e6-d6d860b78106	4273	Blejska Dobrava
00050000-5602-95e3-5ac8-56440fc94ea6	9265	Bodonci
00050000-5602-95e3-5a03-8ce7a294626a	9222	Bogojina
00050000-5602-95e3-b524-1ede8c51f569	4263	Bohinjska Bela
00050000-5602-95e3-ab6a-90daeaeaac95	4264	Bohinjska Bistrica
00050000-5602-95e3-2765-38570833d942	4265	Bohinjsko jezero
00050000-5602-95e3-77fb-6eca1f5932ca	1353	Borovnica
00050000-5602-95e3-d0a2-5791eaf3e217	8294	Boštanj
00050000-5602-95e3-656c-2e26d1b60997	5230	Bovec
00050000-5602-95e3-91ba-7d53a5acf1bd	5295	Branik
00050000-5602-95e3-b811-02fc9c4807c1	3314	Braslovče
00050000-5602-95e3-e7ec-232b7c771e14	5223	Breginj
00050000-5602-95e3-4f27-c88f85db3dcb	8280	Brestanica
00050000-5602-95e3-ca90-78a12a174b2e	2354	Bresternica
00050000-5602-95e3-62af-09ac6df15bc6	4243	Brezje
00050000-5602-95e3-ad16-3f89f6755478	1351	Brezovica pri Ljubljani
00050000-5602-95e3-98e2-0331c9231382	8250	Brežice
00050000-5602-95e3-2684-feb8fd2f426f	4210	Brnik - Aerodrom
00050000-5602-95e3-a290-0af3c3536752	8321	Brusnice
00050000-5602-95e3-7a01-2b36cef54f30	3255	Buče
00050000-5602-95e3-7321-4bd73dbd066d	8276	Bučka 
00050000-5602-95e3-c7c2-b48ee47df361	9261	Cankova
00050000-5602-95e3-588d-e34ac2b10aaa	3000	Celje 
00050000-5602-95e3-5a55-fea2fef2a5d3	3001	Celje - poštni predali
00050000-5602-95e3-e0c2-295771dca3db	4207	Cerklje na Gorenjskem
00050000-5602-95e3-e08a-d22fbfe9e313	8263	Cerklje ob Krki
00050000-5602-95e3-69ed-df042fd5c4a1	1380	Cerknica
00050000-5602-95e3-8b49-2b041f310c44	5282	Cerkno
00050000-5602-95e3-bed2-c1164df15996	2236	Cerkvenjak
00050000-5602-95e3-5c55-f43762b2f53d	2215	Ceršak
00050000-5602-95e3-aa5e-1c31bb44744c	2326	Cirkovce
00050000-5602-95e3-2276-d00c1dd328c8	2282	Cirkulane
00050000-5602-95e3-d8df-6474adbaa514	5273	Col
00050000-5602-95e3-4f51-1cc2e8a0c52b	8251	Čatež ob Savi
00050000-5602-95e3-87f9-67a8d73da211	1413	Čemšenik
00050000-5602-95e3-0638-a5ce933068ab	5253	Čepovan
00050000-5602-95e3-6558-f2634962e9cb	9232	Črenšovci
00050000-5602-95e3-dbc0-1adfa9e9c1b0	2393	Črna na Koroškem
00050000-5602-95e3-2528-b2feaa27f67e	6275	Črni Kal
00050000-5602-95e3-5530-4c3b096b538d	5274	Črni Vrh nad Idrijo
00050000-5602-95e3-82c5-50e88553cee4	5262	Črniče
00050000-5602-95e3-e8e2-a3abd56142a8	8340	Črnomelj
00050000-5602-95e3-e45e-0251f12b9fc4	6271	Dekani
00050000-5602-95e3-cea7-7bbb1fd32a73	5210	Deskle
00050000-5602-95e3-4227-e59f262f76bb	2253	Destrnik
00050000-5602-95e3-188d-193127bca56a	6215	Divača
00050000-5602-95e3-baa1-607bd31f4284	1233	Dob
00050000-5602-95e3-3b22-e529b53a7ad0	3224	Dobje pri Planini
00050000-5602-95e3-afe0-065fa2607be3	8257	Dobova
00050000-5602-95e3-433d-423a568ce6fe	1423	Dobovec
00050000-5602-95e3-3b09-0e833faca7c6	5263	Dobravlje
00050000-5602-95e3-2909-e7a3e5379359	3204	Dobrna
00050000-5602-95e3-0ab0-c157267aef82	8211	Dobrnič
00050000-5602-95e3-d46b-ba0a8ff8e772	1356	Dobrova
00050000-5602-95e3-7d8e-3e589a7eb5b8	9223	Dobrovnik/Dobronak 
00050000-5602-95e3-305c-b71e37598c5e	5212	Dobrovo v Brdih
00050000-5602-95e3-59dd-44ebe2cbb096	1431	Dol pri Hrastniku
00050000-5602-95e3-9ced-4a35ef48486b	1262	Dol pri Ljubljani
00050000-5602-95e3-51d1-2ed96628488b	1273	Dole pri Litiji
00050000-5602-95e3-a59d-e8923bd84c88	1331	Dolenja vas
00050000-5602-95e3-02f9-c2e8c7105964	8350	Dolenjske Toplice
00050000-5602-95e3-5f8c-bfbae3e96a0c	1230	Domžale
00050000-5602-95e3-93c0-284a97a5a005	2252	Dornava
00050000-5602-95e3-78a4-d1c6b47f613e	5294	Dornberk
00050000-5602-95e3-c403-0d6510b6f746	1319	Draga
00050000-5602-95e3-9dcd-a54db4a0fa09	8343	Dragatuš
00050000-5602-95e3-6b61-d9dbd1f39e71	3222	Dramlje
00050000-5602-95e3-0cf9-abe2fc402cd5	2370	Dravograd
00050000-5602-95e3-59bd-313c7f3cb7bb	4203	Duplje
00050000-5602-95e3-e4af-8b13d05749fc	6221	Dutovlje
00050000-5602-95e3-b54d-61959574b46d	8361	Dvor
00050000-5602-95e3-0148-be40e33c5854	2343	Fala
00050000-5602-95e3-8ba3-2826608260a8	9208	Fokovci
00050000-5602-95e3-950f-45ca87d8eba2	2313	Fram
00050000-5602-95e3-79a3-6662e1eae169	3213	Frankolovo
00050000-5602-95e3-29b8-9d06022b627d	1274	Gabrovka
00050000-5602-95e3-0831-b569ef7248e6	8254	Globoko
00050000-5602-95e3-2867-25601f45ca9d	5275	Godovič
00050000-5602-95e3-2418-ff08434cdcf4	4204	Golnik
00050000-5602-95e3-b020-969e9c4e63f3	3303	Gomilsko
00050000-5602-95e3-5e78-0ccf3fcc8664	4224	Gorenja vas
00050000-5602-95e3-6e7f-3f852afa98ff	3263	Gorica pri Slivnici
00050000-5602-95e3-be27-4dedff84b26f	2272	Gorišnica
00050000-5602-95e3-4a95-da4140a4dcf2	9250	Gornja Radgona
00050000-5602-95e3-8066-b18139b4f44f	3342	Gornji Grad
00050000-5602-95e3-13cd-d202b0d93e67	4282	Gozd Martuljek
00050000-5602-95e3-efbb-439dfb141589	6272	Gračišče
00050000-5602-95e3-2438-eb757821ab6a	9264	Grad
00050000-5602-95e3-114b-e820090810cb	8332	Gradac
00050000-5602-95e3-2446-2262a906275b	1384	Grahovo
00050000-5602-95e3-190b-08c98a853bc7	5242	Grahovo ob Bači
00050000-5602-95e3-0684-ef3ba98dcefb	5251	Grgar
00050000-5602-95e3-b9f5-f4a4659c32f5	3302	Griže
00050000-5602-95e3-91b1-9c731bbcb60f	3231	Grobelno
00050000-5602-95e3-d5b2-95a9cb23404f	1290	Grosuplje
00050000-5602-95e3-5a81-314d593e487b	2288	Hajdina
00050000-5602-95e3-9da2-512f13498ea9	8362	Hinje
00050000-5602-95e3-aa2a-1b31146610ed	2311	Hoče
00050000-5602-95e3-2797-11a07a65bf38	9205	Hodoš/Hodos
00050000-5602-95e3-dd7e-c0c7affb4d15	1354	Horjul
00050000-5602-95e3-0899-a98982718d4c	1372	Hotedršica
00050000-5602-95e3-96e0-d06aaba61c70	1430	Hrastnik
00050000-5602-95e3-dcfb-d60c5c92be26	6225	Hruševje
00050000-5602-95e3-0ca2-a87c4a7c4dbb	4276	Hrušica
00050000-5602-95e3-3864-76758232270d	5280	Idrija
00050000-5602-95e3-d7c3-612f94a1745b	1292	Ig
00050000-5602-95e3-bd5e-1fabf49f3968	6250	Ilirska Bistrica
00050000-5602-95e3-062a-ab4a6da55c35	6251	Ilirska Bistrica-Trnovo
00050000-5602-95e3-bc91-81a5523a7ce1	1295	Ivančna Gorica
00050000-5602-95e3-2824-16e892ebd8bf	2259	Ivanjkovci
00050000-5602-95e3-a4a3-57b428d0690e	1411	Izlake
00050000-5602-95e3-d15c-d80717861304	6310	Izola/Isola
00050000-5602-95e3-0a51-6914bee40d93	2222	Jakobski Dol
00050000-5602-95e3-c5f4-3d1f352cd482	2221	Jarenina
00050000-5602-95e3-988d-d6d147ee97ff	6254	Jelšane
00050000-5602-95e3-4460-75335afac5a2	4270	Jesenice
00050000-5602-95e3-d02f-2a4132e2257c	8261	Jesenice na Dolenjskem
00050000-5602-95e3-6e77-e1c5ce608766	3273	Jurklošter
00050000-5602-95e3-a580-48d1d72bcecd	2223	Jurovski Dol
00050000-5602-95e3-c45e-1bb96129c55f	2256	Juršinci
00050000-5602-95e3-6885-af9874e0101b	5214	Kal nad Kanalom
00050000-5602-95e3-31a7-f5bf356e81c2	3233	Kalobje
00050000-5602-95e3-d269-747114c926b9	4246	Kamna Gorica
00050000-5602-95e3-3fad-529f988d8217	2351	Kamnica
00050000-5602-95e3-df28-c4f91cfa194e	1241	Kamnik
00050000-5602-95e3-0be6-2ac319a2b289	5213	Kanal
00050000-5602-95e3-e994-1cad81838363	8258	Kapele
00050000-5602-95e3-e805-1cd3c180b56a	2362	Kapla
00050000-5602-95e3-82ab-4e9d95c57484	2325	Kidričevo
00050000-5602-95e3-5352-7551958e973e	1412	Kisovec
00050000-5602-95e3-cc56-f2f140effe7c	6253	Knežak
00050000-5602-95e3-b766-4a051177215b	5222	Kobarid
00050000-5602-95e3-bde6-ffba7ceb9bf5	9227	Kobilje
00050000-5602-95e3-9e04-6fd62413a199	1330	Kočevje
00050000-5602-95e3-6a92-0efa85d31380	1338	Kočevska Reka
00050000-5602-95e3-500a-ddf4ac6a443e	2276	Kog
00050000-5602-95e3-1005-07cfdc820f96	5211	Kojsko
00050000-5602-95e3-c918-81b896eedbfa	6223	Komen
00050000-5602-95e3-a69b-a13a9e5fcf32	1218	Komenda
00050000-5602-95e3-cd69-5f75a1e64b34	6000	Koper/Capodistria 
00050000-5602-95e3-53df-ffcc1a6b5456	6001	Koper/Capodistria - poštni predali
00050000-5602-95e3-83ec-52dfbe354bfb	8282	Koprivnica
00050000-5602-95e3-013c-a4dabf39ffda	5296	Kostanjevica na Krasu
00050000-5602-95e3-d21e-169a1cffdf86	8311	Kostanjevica na Krki
00050000-5602-95e3-1895-9f735df68c44	1336	Kostel
00050000-5602-95e3-7b4d-fc5f06d5b480	6256	Košana
00050000-5602-95e3-dc60-4dc96ac2aa9f	2394	Kotlje
00050000-5602-95e3-7bf6-31101799efc0	6240	Kozina
00050000-5602-95e3-5d85-a15f7cc4525b	3260	Kozje
00050000-5602-95e3-6f96-3c13be306849	4000	Kranj 
00050000-5602-95e3-ab7a-ed21cc962457	4001	Kranj - poštni predali
00050000-5602-95e3-ed9c-29a0679d3311	4280	Kranjska Gora
00050000-5602-95e3-6652-ebad42b0e681	1281	Kresnice
00050000-5602-95e3-f546-4a78e42fcf88	4294	Križe
00050000-5602-95e3-7479-c7aad441837e	9206	Križevci
00050000-5602-95e3-97c4-7a6ee068a03b	9242	Križevci pri Ljutomeru
00050000-5602-95e3-d440-13e9d24b87ea	1301	Krka
00050000-5602-95e3-d7d3-ea4749800a5c	8296	Krmelj
00050000-5602-95e3-df02-814864659262	4245	Kropa
00050000-5602-95e3-6629-64b4d0d7c2d5	8262	Krška vas
00050000-5602-95e3-fd7d-254258206892	8270	Krško
00050000-5602-95e3-a483-b06c36f10338	9263	Kuzma
00050000-5602-95e3-f53d-b07f3ed24a33	2318	Laporje
00050000-5602-95e3-7987-37080b589500	3270	Laško
00050000-5602-95e3-172f-6588a531819f	1219	Laze v Tuhinju
00050000-5602-95e3-bd1a-d4108c9ea2d7	2230	Lenart v Slovenskih goricah
00050000-5602-95e3-43b0-0eb7c3b34ec3	9220	Lendava/Lendva
00050000-5602-95e3-2837-cfe57948b1b4	4248	Lesce
00050000-5602-95e3-9250-0cdd57c0fe8a	3261	Lesično
00050000-5602-95e3-1487-db8cd62f7fc2	8273	Leskovec pri Krškem
00050000-5602-95e3-2f0d-e0cfaf54a29a	2372	Libeliče
00050000-5602-95e3-d087-2ea72502d2b8	2341	Limbuš
00050000-5602-95e3-df8b-12ec5cfc5c56	1270	Litija
00050000-5602-95e3-d288-4203b7c0a73d	3202	Ljubečna
00050000-5602-95e3-368f-95c3407b397c	1000	Ljubljana 
00050000-5602-95e3-99b5-24abfdcff944	1001	Ljubljana - poštni predali
00050000-5602-95e3-c585-5403548ae210	1231	Ljubljana - Črnuče
00050000-5602-95e3-27a1-31874ecd5c82	1261	Ljubljana - Dobrunje
00050000-5602-95e3-21be-a5fd407198c1	1260	Ljubljana - Polje
00050000-5602-95e3-120a-7dc1528b1378	1210	Ljubljana - Šentvid
00050000-5602-95e3-29b6-ccf051ac334b	1211	Ljubljana - Šmartno
00050000-5602-95e3-a0b5-b49f244f72f2	3333	Ljubno ob Savinji
00050000-5602-95e3-729c-da07be0cb4f9	9240	Ljutomer
00050000-5602-95e3-2cfd-13b9103e0e62	3215	Loče
00050000-5602-95e3-0b88-5cf108916335	5231	Log pod Mangartom
00050000-5602-95e3-98e5-1d00a8e932e6	1358	Log pri Brezovici
00050000-5602-95e3-1417-fc3d5a911c9d	1370	Logatec
00050000-5602-95e3-e03b-b2837db5d3b2	1371	Logatec
00050000-5602-95e3-092b-a0ba74941edd	1434	Loka pri Zidanem Mostu
00050000-5602-95e3-d8b0-d0a38416e70f	3223	Loka pri Žusmu
00050000-5602-95e3-c14e-a44db33ab50c	6219	Lokev
00050000-5602-95e3-3a66-f003ba498e6d	1318	Loški Potok
00050000-5602-95e3-56c0-998ce5a737ce	2324	Lovrenc na Dravskem polju
00050000-5602-95e3-3eb4-2183c9206164	2344	Lovrenc na Pohorju
00050000-5602-95e3-5a92-67f98ee5c908	3334	Luče
00050000-5602-95e3-7492-105797dbabdb	1225	Lukovica
00050000-5602-95e3-a597-8b845aa3d1d0	9202	Mačkovci
00050000-5602-95e3-e925-be958185f8c9	2322	Majšperk
00050000-5602-95e3-b525-6a055c6f8ec9	2321	Makole
00050000-5602-95e3-672a-48c7b0e1ae72	9243	Mala Nedelja
00050000-5602-95e3-f025-2f47a761e03b	2229	Malečnik
00050000-5602-95e3-41b3-7034df99181e	6273	Marezige
00050000-5602-95e3-d5e3-d9b9646bfadd	2000	Maribor 
00050000-5602-95e3-e045-f8cc8e53b05e	2001	Maribor - poštni predali
00050000-5602-95e3-f0b1-252814ffa6f1	2206	Marjeta na Dravskem polju
00050000-5602-95e3-f0e1-82af49a191cf	2281	Markovci
00050000-5602-95e3-814e-5aecb3d4441a	9221	Martjanci
00050000-5602-95e3-08d6-49bb1f08d3ec	6242	Materija
00050000-5602-95e3-19ad-5e5b89bf2276	4211	Mavčiče
00050000-5602-95e3-ebda-33a851ea3641	1215	Medvode
00050000-5602-95e3-e41f-41c0303d177c	1234	Mengeš
00050000-5602-95e3-cf3d-9eb7155400d7	8330	Metlika
00050000-5602-95e3-75ec-192ddc874c63	2392	Mežica
00050000-5602-95e3-3555-7289790fb83e	2204	Miklavž na Dravskem polju
00050000-5602-95e3-956f-bb274babef62	2275	Miklavž pri Ormožu
00050000-5602-95e3-d747-3de93fe5679a	5291	Miren
00050000-5602-95e3-eb3e-57266b5edd25	8233	Mirna
00050000-5602-95e3-f2d9-3bf404cef595	8216	Mirna Peč
00050000-5602-95e3-6843-06fa7669a54b	2382	Mislinja
00050000-5602-95e3-4930-debea153b719	4281	Mojstrana
00050000-5602-95e3-a80c-48158a0286bf	8230	Mokronog
00050000-5602-95e3-120b-460a8afb5597	1251	Moravče
00050000-5602-95e3-8162-07861d51f506	9226	Moravske Toplice
00050000-5602-95e3-498f-8df47da773b7	5216	Most na Soči
00050000-5602-95e3-8539-574dc8f7b396	1221	Motnik
00050000-5602-95e3-ce08-a96fb37c4618	3330	Mozirje
00050000-5602-95e3-9265-934edd3385bb	9000	Murska Sobota 
00050000-5602-95e3-ec45-362359890b4c	9001	Murska Sobota - poštni predali
00050000-5602-95e3-0529-f26554f3b88e	2366	Muta
00050000-5602-95e3-cf18-892557ae7ebc	4202	Naklo
00050000-5602-95e3-db04-ae415db78aac	3331	Nazarje
00050000-5602-95e3-25a9-a02c093c60d4	1357	Notranje Gorice
00050000-5602-95e3-f7b8-b1627d12cfa8	3203	Nova Cerkev
00050000-5602-95e3-4e40-6fe5df82aa26	5000	Nova Gorica 
00050000-5602-95e3-b19b-2c0c1ac60dca	5001	Nova Gorica - poštni predali
00050000-5602-95e3-efe1-6bb866398c5d	1385	Nova vas
00050000-5602-95e3-cc29-59f2ac62dcf2	8000	Novo mesto
00050000-5602-95e3-e628-e56a3fab4a80	8001	Novo mesto - poštni predali
00050000-5602-95e3-1e00-08de36e3b327	6243	Obrov
00050000-5602-95e3-f662-274f9398c67d	9233	Odranci
00050000-5602-95e3-01b0-b14c93e62472	2317	Oplotnica
00050000-5602-95e3-f241-7ed7d6336797	2312	Orehova vas
00050000-5602-95e3-cf33-afcf5775f41f	2270	Ormož
00050000-5602-95e3-22ff-dc4d9d749566	1316	Ortnek
00050000-5602-95e3-ae00-ec101b3a3907	1337	Osilnica
00050000-5602-95e4-5022-3da1a482b340	8222	Otočec
00050000-5602-95e4-c48f-0068a1e68e66	2361	Ožbalt
00050000-5602-95e4-98c5-ed5410a93ee7	2231	Pernica
00050000-5602-95e4-0c53-dc790c00239d	2211	Pesnica pri Mariboru
00050000-5602-95e4-463f-925303ac5ee3	9203	Petrovci
00050000-5602-95e4-9f04-638704da745e	3301	Petrovče
00050000-5602-95e4-85e8-ef07b1c7731e	6330	Piran/Pirano
00050000-5602-95e4-42e2-f5271a6f454b	8255	Pišece
00050000-5602-95e4-ab71-53e698619bc4	6257	Pivka
00050000-5602-95e4-2d22-ff83f0493c5c	6232	Planina
00050000-5602-95e4-02d3-40700f1b6624	3225	Planina pri Sevnici
00050000-5602-95e4-6c7b-dd5eec5cbe81	6276	Pobegi
00050000-5602-95e4-ecab-b537955ebffd	8312	Podbočje
00050000-5602-95e4-f339-84ba16cc51b5	5243	Podbrdo
00050000-5602-95e4-ca2e-3091341e8815	3254	Podčetrtek
00050000-5602-95e4-2e08-acfb25603cc7	2273	Podgorci
00050000-5602-95e4-f3f9-a3525c28287c	6216	Podgorje
00050000-5602-95e4-6d48-4af805cb0291	2381	Podgorje pri Slovenj Gradcu
00050000-5602-95e4-3730-c10b245837fd	6244	Podgrad
00050000-5602-95e4-9fe8-1ea2468c1c0a	1414	Podkum
00050000-5602-95e4-0f2d-45811da02f4f	2286	Podlehnik
00050000-5602-95e4-3753-7d93173987f2	5272	Podnanos
00050000-5602-95e4-dae4-90714763efbe	4244	Podnart
00050000-5602-95e4-788c-c09a3a073ac2	3241	Podplat
00050000-5602-95e4-4c58-c0a23bb4b566	3257	Podsreda
00050000-5602-95e4-9513-ecd84958e6ec	2363	Podvelka
00050000-5602-95e4-9f1b-82cd17ea4128	2208	Pohorje
00050000-5602-95e4-136b-419803523597	2257	Polenšak
00050000-5602-95e4-dfa5-8905d3a28dfb	1355	Polhov Gradec
00050000-5602-95e4-6e9c-0408ddc10805	4223	Poljane nad Škofjo Loko
00050000-5602-95e4-3893-cdda55608de3	2319	Poljčane
00050000-5602-95e4-6c1e-42cd5700e11b	1272	Polšnik
00050000-5602-95e4-d061-7c949b9feca4	3313	Polzela
00050000-5602-95e4-1e37-0c1c0285d0f4	3232	Ponikva
00050000-5602-95e4-7241-d8800167c903	6320	Portorož/Portorose
00050000-5602-95e4-9eb4-7fb6eb39328f	6230	Postojna
00050000-5602-95e4-3d8f-b227e005c374	2331	Pragersko
00050000-5602-95e4-88a3-9c2628b59033	3312	Prebold
00050000-5602-95e4-beab-9d8dbfee153a	4205	Preddvor
00050000-5602-95e4-a9bf-1440b70cf33d	6255	Prem
00050000-5602-95e4-504d-7653177697a9	1352	Preserje
00050000-5602-95e4-f3ed-56518af3df11	6258	Prestranek
00050000-5602-95e4-33e6-779309ec37f4	2391	Prevalje
00050000-5602-95e4-d03c-1ce0070254a7	3262	Prevorje
00050000-5602-95e4-5e14-f305815d284a	1276	Primskovo 
00050000-5602-95e4-562f-d4cf759abdf1	3253	Pristava pri Mestinju
00050000-5602-95e4-fa57-1f23a0ad8e6a	9207	Prosenjakovci/Partosfalva
00050000-5602-95e4-2be0-d1e394f68ac3	5297	Prvačina
00050000-5602-95e4-dc78-f302ed440d51	2250	Ptuj
00050000-5602-95e4-633f-e1c711717a6c	2323	Ptujska Gora
00050000-5602-95e4-867c-4e70ecf883b4	9201	Puconci
00050000-5602-95e4-e16b-6749bef23e6d	2327	Rače
00050000-5602-95e4-7ba0-8bb435abf91b	1433	Radeče
00050000-5602-95e4-bed4-da771e59923e	9252	Radenci
00050000-5602-95e4-4836-9ca2d7132241	2360	Radlje ob Dravi
00050000-5602-95e4-1178-71a047136210	1235	Radomlje
00050000-5602-95e4-cbf5-dc7eb524b570	4240	Radovljica
00050000-5602-95e4-6c6e-fb3dbc89c1cf	8274	Raka
00050000-5602-95e4-a11b-7b68032d29b7	1381	Rakek
00050000-5602-95e4-d646-40bc1f2159ab	4283	Rateče - Planica
00050000-5602-95e4-6a00-54c347020824	2390	Ravne na Koroškem
00050000-5602-95e4-f7b3-73a86ce900e3	9246	Razkrižje
00050000-5602-95e4-32bd-656081ef503d	3332	Rečica ob Savinji
00050000-5602-95e4-47e0-6fda08c54de9	5292	Renče
00050000-5602-95e4-5566-7ce74ee1b1cc	1310	Ribnica
00050000-5602-95e4-5176-26f13b447cf1	2364	Ribnica na Pohorju
00050000-5602-95e4-c753-100822c571db	3272	Rimske Toplice
00050000-5602-95e4-c069-6f8262eba7d1	1314	Rob
00050000-5602-95e4-6d94-a2e2ff3484db	5215	Ročinj
00050000-5602-95e4-8a68-687baa341176	3250	Rogaška Slatina
00050000-5602-95e4-7d94-8ea1f5fb64ce	9262	Rogašovci
00050000-5602-95e4-3658-57977a2127ed	3252	Rogatec
00050000-5602-95e4-f54f-cfa294803531	1373	Rovte
00050000-5602-95e4-7d20-6382eb9ca260	2342	Ruše
00050000-5602-95e4-2e50-d57a97b92609	1282	Sava
00050000-5602-95e4-90d0-c1ff2e9f290c	6333	Sečovlje/Sicciole
00050000-5602-95e4-47ed-fd69114235ef	4227	Selca
00050000-5602-95e4-542e-f8207d2d403c	2352	Selnica ob Dravi
00050000-5602-95e4-490a-a85d0de6c72b	8333	Semič
00050000-5602-95e4-1e20-c2a839566274	8281	Senovo
00050000-5602-95e4-cdd9-4230c3f95aca	6224	Senožeče
00050000-5602-95e4-0b33-a597f36edd4d	8290	Sevnica
00050000-5602-95e4-fefd-5363674dbd6c	6210	Sežana
00050000-5602-95e4-7077-e6169a247d93	2214	Sladki Vrh
00050000-5602-95e4-1dd6-8f8db79d89ba	5283	Slap ob Idrijci
00050000-5602-95e4-4951-f789dddd84b7	2380	Slovenj Gradec
00050000-5602-95e4-3147-a8c084265b85	2310	Slovenska Bistrica
00050000-5602-95e4-bc84-0cb813abe6d1	3210	Slovenske Konjice
00050000-5602-95e4-fc93-bad6c2d9fba3	1216	Smlednik
00050000-5602-95e4-2e6d-5f4cb209c9ea	5232	Soča
00050000-5602-95e4-2dcb-48fe5016d715	1317	Sodražica
00050000-5602-95e4-df40-888e9ef51343	3335	Solčava
00050000-5602-95e4-d281-510b9bf5a764	5250	Solkan
00050000-5602-95e4-607b-917e3236e303	4229	Sorica
00050000-5602-95e4-4a88-5cc1daa153e2	4225	Sovodenj
00050000-5602-95e4-f20e-fb0452fc5922	5281	Spodnja Idrija
00050000-5602-95e4-5edc-22c4e981466e	2241	Spodnji Duplek
00050000-5602-95e4-3ed3-b36b875a6215	9245	Spodnji Ivanjci
00050000-5602-95e4-c545-73d92318346c	2277	Središče ob Dravi
00050000-5602-95e4-a439-b8b3960f6b30	4267	Srednja vas v Bohinju
00050000-5602-95e4-859f-c25fdd8f5903	8256	Sromlje 
00050000-5602-95e4-ead8-7d56c3d6683d	5224	Srpenica
00050000-5602-95e4-6fe1-f9fb20adbf18	1242	Stahovica
00050000-5602-95e4-1711-3646f1dfb2c9	1332	Stara Cerkev
00050000-5602-95e4-618d-b10c33c126d5	8342	Stari trg ob Kolpi
00050000-5602-95e4-f9b0-e39193aef1e1	1386	Stari trg pri Ložu
00050000-5602-95e4-1cc1-69261aa6f56d	2205	Starše
00050000-5602-95e4-4d3b-516ca73644da	2289	Stoperce
00050000-5602-95e4-eb6e-79a3be783dd0	8322	Stopiče
00050000-5602-95e4-9435-6801ce3e81bb	3206	Stranice
00050000-5602-95e4-e8cd-ad73d8901852	8351	Straža
00050000-5602-95e4-7d72-4d57fac9382f	1313	Struge
00050000-5602-95e4-2b2a-1679a0629c2e	8293	Studenec
00050000-5602-95e4-cb7f-d1d3cf003ed1	8331	Suhor
00050000-5602-95e4-b75a-48e7337b4a9e	2233	Sv. Ana v Slovenskih goricah
00050000-5602-95e4-031b-2d70b63ae5e7	2235	Sv. Trojica v Slovenskih goricah
00050000-5602-95e4-fc5c-ee78db45ac11	2353	Sveti Duh na Ostrem Vrhu
00050000-5602-95e4-5f53-f3285f7658d7	9244	Sveti Jurij ob Ščavnici
00050000-5602-95e4-67bc-fe67f313d220	3264	Sveti Štefan
00050000-5602-95e4-6163-42aa3a7c274c	2258	Sveti Tomaž
00050000-5602-95e4-7d10-600adf6424d6	9204	Šalovci
00050000-5602-95e4-8490-e05171926ae3	5261	Šempas
00050000-5602-95e4-5b9c-bf41ac088ba6	5290	Šempeter pri Gorici
00050000-5602-95e4-561b-6754c019afcd	3311	Šempeter v Savinjski dolini
00050000-5602-95e4-c9c4-9c5e7d7f3b6d	4208	Šenčur
00050000-5602-95e4-d317-7e6b044be26f	2212	Šentilj v Slovenskih goricah
00050000-5602-95e4-1321-2e18c47841b9	8297	Šentjanž
00050000-5602-95e4-9d70-9fa85c4c98b0	2373	Šentjanž pri Dravogradu
00050000-5602-95e4-dcd8-4c832b6df8a1	8310	Šentjernej
00050000-5602-95e4-5645-240e7c7524f0	3230	Šentjur
00050000-5602-95e4-db33-5fabf1d87814	3271	Šentrupert
00050000-5602-95e4-c0ae-297e7b64db8d	8232	Šentrupert
00050000-5602-95e4-2382-4bf8f8d16550	1296	Šentvid pri Stični
00050000-5602-95e4-5467-bc076a8caf67	8275	Škocjan
00050000-5602-95e4-15c7-e979c43f4bcd	6281	Škofije
00050000-5602-95e4-24a6-7343b568bfc0	4220	Škofja Loka
00050000-5602-95e4-9e1a-77e34fbf4cb8	3211	Škofja vas
00050000-5602-95e4-619d-82870cb61da7	1291	Škofljica
00050000-5602-95e4-d716-5fbe298f0feb	6274	Šmarje
00050000-5602-95e4-ce8d-673e9409370b	1293	Šmarje - Sap
00050000-5602-95e4-8140-ffe736bcdf70	3240	Šmarje pri Jelšah
00050000-5602-95e4-ec55-36e270ab347c	8220	Šmarješke Toplice
00050000-5602-95e4-4df9-945968d27c20	2315	Šmartno na Pohorju
00050000-5602-95e4-cdf7-2d034967cc4b	3341	Šmartno ob Dreti
00050000-5602-95e4-9dfa-a67d775485b3	3327	Šmartno ob Paki
00050000-5602-95e4-9c9c-6d0783da1d33	1275	Šmartno pri Litiji
00050000-5602-95e4-4ff5-c2eea7c24428	2383	Šmartno pri Slovenj Gradcu
00050000-5602-95e4-3aa3-e3572179f56a	3201	Šmartno v Rožni dolini
00050000-5602-95e4-11fa-369c267be022	3325	Šoštanj
00050000-5602-95e4-7e89-096029e253cd	6222	Štanjel
00050000-5602-95e4-0c58-9a8806127021	3220	Štore
00050000-5602-95e4-3a62-d9bc555a7f0d	3304	Tabor
00050000-5602-95e4-73cf-a3258b6c1d71	3221	Teharje
00050000-5602-95e4-de67-8981ee676288	9251	Tišina
00050000-5602-95e4-cefe-1828bdf76e3f	5220	Tolmin
00050000-5602-95e4-daf9-b48617d56931	3326	Topolšica
00050000-5602-95e4-14ee-12e6b969a07b	2371	Trbonje
00050000-5602-95e4-de10-8ea53bb8e77b	1420	Trbovlje
00050000-5602-95e4-bd11-c71f8e275de5	8231	Trebelno 
00050000-5602-95e4-ffff-aea6776848c1	8210	Trebnje
00050000-5602-95e4-ac73-aefcebc54edc	5252	Trnovo pri Gorici
00050000-5602-95e4-ff4c-72fa95e9809e	2254	Trnovska vas
00050000-5602-95e4-b804-7b32d9c72343	1222	Trojane
00050000-5602-95e4-93b9-7dc3badac9fa	1236	Trzin
00050000-5602-95e4-feb1-ece74e43466a	4290	Tržič
00050000-5602-95e4-2159-3622719cd0a7	8295	Tržišče
00050000-5602-95e4-4c24-444c48522294	1311	Turjak
00050000-5602-95e4-4910-49e37a951296	9224	Turnišče
00050000-5602-95e4-48f8-9c3d38e5544c	8323	Uršna sela
00050000-5602-95e4-ae43-f3020fdd26bf	1252	Vače
00050000-5602-95e4-d480-2dc5b64ac531	3320	Velenje 
00050000-5602-95e4-0439-eca865f09e77	3322	Velenje - poštni predali
00050000-5602-95e4-414e-0bcbe9c2679d	8212	Velika Loka
00050000-5602-95e4-d74a-1ffab5d37a22	2274	Velika Nedelja
00050000-5602-95e4-9315-259e0ad669b0	9225	Velika Polana
00050000-5602-95e4-3bc9-69cf9f765ad5	1315	Velike Lašče
00050000-5602-95e4-77e4-d6bd79298851	8213	Veliki Gaber
00050000-5602-95e4-b606-fe3c51629de2	9241	Veržej
00050000-5602-95e4-7439-c04caf2964ed	1312	Videm - Dobrepolje
00050000-5602-95e4-2bf0-530f090731b7	2284	Videm pri Ptuju
00050000-5602-95e4-2949-69a627ad4097	8344	Vinica
00050000-5602-95e4-5bfc-d0b390cc4c84	5271	Vipava
00050000-5602-95e4-572d-0b2ff038bee5	4212	Visoko
00050000-5602-95e4-2376-4b10465a2896	1294	Višnja Gora
00050000-5602-95e4-e4b5-4ed5058775bd	3205	Vitanje
00050000-5602-95e4-73fb-64e6144fac03	2255	Vitomarci
00050000-5602-95e4-7b20-1514f546a3df	1217	Vodice
00050000-5602-95e4-3137-dbbaf5d2a483	3212	Vojnik\t
00050000-5602-95e4-1a50-fef05c2a5bb9	5293	Volčja Draga
00050000-5602-95e4-9dd9-eb1878a3bb29	2232	Voličina
00050000-5602-95e4-f686-e524af59b01e	3305	Vransko
00050000-5602-95e4-0554-16f1ccceb865	6217	Vremski Britof
00050000-5602-95e4-592e-90f3016b578d	1360	Vrhnika
00050000-5602-95e4-c12d-71fd5cc02ac3	2365	Vuhred
00050000-5602-95e4-e239-83e615c91ea9	2367	Vuzenica
00050000-5602-95e4-e6e5-6c7f49bec806	8292	Zabukovje 
00050000-5602-95e4-9f10-b11ef909c00c	1410	Zagorje ob Savi
00050000-5602-95e4-2251-5acf0f4e68cc	1303	Zagradec
00050000-5602-95e4-68cf-dcca977ddfe6	2283	Zavrč
00050000-5602-95e4-a4f1-9dcd7f3390a4	8272	Zdole 
00050000-5602-95e4-7ac7-370ce2a1b229	4201	Zgornja Besnica
00050000-5602-95e4-07a9-df23e1222347	2242	Zgornja Korena
00050000-5602-95e4-791e-ea6e68a66984	2201	Zgornja Kungota
00050000-5602-95e4-1528-e6db3aa63d10	2316	Zgornja Ložnica
00050000-5602-95e4-e0bb-d5f3132a068c	2314	Zgornja Polskava
00050000-5602-95e4-d956-8ef699f2e649	2213	Zgornja Velka
00050000-5602-95e4-39eb-7cd54e2e4a32	4247	Zgornje Gorje
00050000-5602-95e4-2573-31c11612dee2	4206	Zgornje Jezersko
00050000-5602-95e4-4f1a-b64b2148e9fb	2285	Zgornji Leskovec
00050000-5602-95e4-710d-5eda0eb22c18	1432	Zidani Most
00050000-5602-95e4-80dc-e48e55c1f95e	3214	Zreče
00050000-5602-95e4-ab21-32de62113cb3	4209	Žabnica
00050000-5602-95e4-b59c-fd8e49a1f384	3310	Žalec
00050000-5602-95e4-6159-686521439c7f	4228	Železniki
00050000-5602-95e4-1256-5483cb11861d	2287	Žetale
00050000-5602-95e4-8580-189ef622a635	4226	Žiri
00050000-5602-95e4-396b-2de1f8155b2a	4274	Žirovnica
00050000-5602-95e4-e5fc-5d408e0371f7	8360	Žužemberk
\.


--
-- TOC entry 3024 (class 0 OID 20513304)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20512929)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 20512709)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5602-95e6-a0dd-3af7c351c2a9	00080000-5602-95e6-5fcf-cc7f3b0c3661	\N	00040000-5602-95e4-8454-4831fdcf2f2f	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5602-95e6-5c7a-f723b9513035	00080000-5602-95e6-5fcf-cc7f3b0c3661	\N	00040000-5602-95e4-8454-4831fdcf2f2f	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5602-95e6-ddb2-b274c75feb02	00080000-5602-95e6-56ca-0ae697af82f6	\N	00040000-5602-95e4-8454-4831fdcf2f2f	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2986 (class 0 OID 20512813)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20512941)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20513318)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20513328)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5602-95e6-d335-805388086b0e	00080000-5602-95e6-5909-96fd59e0ede9	0987	AK
00190000-5602-95e6-8f88-b841a1a37b2e	00080000-5602-95e6-56ca-0ae697af82f6	0989	AK
00190000-5602-95e6-157a-cf12a784bb2d	00080000-5602-95e6-b248-575bddb307c8	0986	AK
00190000-5602-95e6-6f8a-faea242e1980	00080000-5602-95e6-2f03-20f20fce28db	0984	AK
00190000-5602-95e6-61ca-b128028d9e0f	00080000-5602-95e6-a930-dc873dfe2b74	0983	AK
00190000-5602-95e6-e03f-2b365a06d79e	00080000-5602-95e6-8b26-cc2dd639772b	0982	AK
00190000-5602-95e7-b3d9-913ac83b437d	00080000-5602-95e7-3d27-c897eb146d34	1001	AK
\.


--
-- TOC entry 3023 (class 0 OID 20513261)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5602-95e6-0303-98ee6c17face	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3027 (class 0 OID 20513336)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20512970)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5602-95e6-6b62-4e2719a158b6	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5602-95e6-e80c-29a4aabae88d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5602-95e6-1123-6131b431c494	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5602-95e6-3f02-02ec69846d8a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5602-95e6-2985-183b4eb124cb	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5602-95e6-e25e-cc8ea22563cd	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5602-95e6-e5f7-f6c96f39bf43	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2995 (class 0 OID 20512914)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20512904)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20513113)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20513044)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20512787)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20512582)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5602-95e7-3d27-c897eb146d34	00010000-5602-95e4-ddf3-4c3b8b2703f1	2015-09-23 14:07:03	INS	a:0:{}
2	App\\Entity\\Option	00000000-5602-95e7-09eb-9d30809073dd	00010000-5602-95e4-ddf3-4c3b8b2703f1	2015-09-23 14:07:03	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5602-95e7-b3d9-913ac83b437d	00010000-5602-95e4-ddf3-4c3b8b2703f1	2015-09-23 14:07:03	INS	a:0:{}
\.


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3004 (class 0 OID 20512983)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 20512620)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5602-95e4-01e2-ba9481f12e0a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5602-95e4-3ff6-8fc6766bffd4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5602-95e4-0e75-523355ae78f8	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5602-95e4-48f9-1bb90bff9899	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5602-95e4-a93c-cbed427b47ca	planer	Planer dogodkov v koledarju	t
00020000-5602-95e4-7f8e-2030383b2da9	kadrovska	Kadrovska služba	t
00020000-5602-95e4-6d77-74302d178cf2	arhivar	Ažuriranje arhivalij	t
00020000-5602-95e4-0887-91b713d810cb	igralec	Igralec	t
00020000-5602-95e4-f30a-06c6b1288162	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5602-95e6-3b97-f49af0eb166b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2969 (class 0 OID 20512604)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5602-95e4-e634-58457dfc3f6e	00020000-5602-95e4-0e75-523355ae78f8
00010000-5602-95e4-ddf3-4c3b8b2703f1	00020000-5602-95e4-0e75-523355ae78f8
00010000-5602-95e6-7b76-3bcf6ada21d5	00020000-5602-95e6-3b97-f49af0eb166b
\.


--
-- TOC entry 3006 (class 0 OID 20512997)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20512935)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20512881)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 20512569)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5602-95e4-c926-d0759efc6df5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5602-95e4-bdf2-4893648e3eb3	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5602-95e4-d269-d44041395649	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5602-95e4-decb-41aa9d6365f9	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5602-95e4-533a-f4d687484378	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 20512561)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5602-95e4-4bb0-74161b2d5b08	00230000-5602-95e4-decb-41aa9d6365f9	popa
00240000-5602-95e4-f31d-9f10c8006613	00230000-5602-95e4-decb-41aa9d6365f9	oseba
00240000-5602-95e4-6221-476b41fbdada	00230000-5602-95e4-decb-41aa9d6365f9	sezona
00240000-5602-95e4-2716-cf7850316bb7	00230000-5602-95e4-bdf2-4893648e3eb3	prostor
00240000-5602-95e4-c182-69beb2180fd3	00230000-5602-95e4-decb-41aa9d6365f9	besedilo
00240000-5602-95e4-fc3b-b462a47b1df2	00230000-5602-95e4-decb-41aa9d6365f9	uprizoritev
00240000-5602-95e4-e080-844b11781b3d	00230000-5602-95e4-decb-41aa9d6365f9	funkcija
00240000-5602-95e4-b140-254be2d1ce74	00230000-5602-95e4-decb-41aa9d6365f9	tipfunkcije
00240000-5602-95e4-dffa-bfd2c72ba356	00230000-5602-95e4-decb-41aa9d6365f9	alternacija
00240000-5602-95e4-c05b-169c4add4531	00230000-5602-95e4-c926-d0759efc6df5	pogodba
00240000-5602-95e4-3c9f-de7db5c08a72	00230000-5602-95e4-decb-41aa9d6365f9	zaposlitev
00240000-5602-95e4-0c51-ab398f40df53	00230000-5602-95e4-decb-41aa9d6365f9	zvrstuprizoritve
00240000-5602-95e4-4c3d-c49a2a59c6f2	00230000-5602-95e4-c926-d0759efc6df5	programdela
00240000-5602-95e4-226f-14bae2131d89	00230000-5602-95e4-decb-41aa9d6365f9	zapis
\.


--
-- TOC entry 2963 (class 0 OID 20512556)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
11bfdfb4-79e5-46d4-b0f5-f837d21b0980	00240000-5602-95e4-4bb0-74161b2d5b08	0	1001
\.


--
-- TOC entry 3012 (class 0 OID 20513061)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5602-95e6-8942-8a7f9a526f25	000e0000-5602-95e6-9d79-a351a5a1e0e2	00080000-5602-95e6-5fcf-cc7f3b0c3661	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5602-95e4-099f-6624e19577fa
00270000-5602-95e6-baed-80acf20e71d9	000e0000-5602-95e6-9d79-a351a5a1e0e2	00080000-5602-95e6-5fcf-cc7f3b0c3661	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5602-95e4-099f-6624e19577fa
\.


--
-- TOC entry 2976 (class 0 OID 20512682)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20512891)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5602-95e6-7d65-30d20c2c25fb	00180000-5602-95e6-8a4a-bb763485fe35	000c0000-5602-95e6-5b7c-7ee81e1cfc09	00090000-5602-95e6-bff3-38c0b315948c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-95e6-1da1-d130516dd178	00180000-5602-95e6-8a4a-bb763485fe35	000c0000-5602-95e6-3907-df2d1ceca9ee	00090000-5602-95e6-6c76-313b0420b98d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-95e6-86af-533dc5817979	00180000-5602-95e6-8a4a-bb763485fe35	000c0000-5602-95e6-6975-613aa2679675	00090000-5602-95e6-5f75-e2a3cc400f35	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-95e6-2c91-a11c9e334696	00180000-5602-95e6-8a4a-bb763485fe35	000c0000-5602-95e6-64ea-044a68455346	00090000-5602-95e6-3ecd-f301fb64454a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-95e6-7bef-975ae9df4e59	00180000-5602-95e6-8a4a-bb763485fe35	000c0000-5602-95e6-a4a2-7c693717c47b	00090000-5602-95e6-c008-f7793c27af80	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-95e6-a5e4-9c22c16a84af	00180000-5602-95e6-d5a7-e1c95943d4df	\N	00090000-5602-95e6-c008-f7793c27af80	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3015 (class 0 OID 20513101)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5602-95e4-e747-fc057d23915d	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5602-95e4-bdd5-060060aab565	02	Priredba	Priredba	Priredba	umetnik
000f0000-5602-95e4-6e3e-60f734442852	03	Prevod	Prevod	Prevod	umetnik
000f0000-5602-95e4-d307-1d205b07d645	04	Režija	Režija	Režija	umetnik
000f0000-5602-95e4-2f41-8d699f95bef8	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5602-95e4-1248-542e13c802df	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5602-95e4-cf36-b7eeac28de0b	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5602-95e4-ae40-2dd7b562d5bc	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5602-95e4-53fa-8101385e869b	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5602-95e4-3ec6-a6324103baf0	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5602-95e4-14a5-c8f4c052630d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5602-95e4-0725-1526b7dd4c0d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5602-95e4-5a03-1e717a9886d3	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5602-95e4-3dee-0c9c3e7902a3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5602-95e4-b189-5cf7ceee4499	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5602-95e4-a670-c8a0a219ffe1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5602-95e4-5dfd-7444ca1be380	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5602-95e4-be54-01c294b88965	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3028 (class 0 OID 20513346)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5602-95e4-cd8f-8ed2e9c1391c	01	Velika predstava	f	1.00	1.00
002b0000-5602-95e4-40e5-4e23cf7fc2fc	02	Mala predstava	f	0.50	0.50
002b0000-5602-95e4-6009-732d40f1912c	03	Mala koprodukcija	t	0.40	1.00
002b0000-5602-95e4-849c-a7be38c7e2aa	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5602-95e4-a1b7-882d67330909	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2981 (class 0 OID 20512744)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20512591)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5602-95e4-ddf3-4c3b8b2703f1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROOjKJqFSuA2pFHgvtnXaoIeAaEmwCAsO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5602-95e6-2697-cb21edf0ef2b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5602-95e6-33c0-3f333184db75	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5602-95e6-62a7-c9534cc7d09f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5602-95e6-34ff-b82294bd915f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5602-95e6-3d0a-7f4d11a43426	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5602-95e6-0773-5136758ac91b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5602-95e6-9149-8048fedb0c5c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5602-95e6-0aec-d93a31a65f86	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5602-95e6-08e4-e3889184be33	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5602-95e6-7b76-3bcf6ada21d5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5602-95e4-e634-58457dfc3f6e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3019 (class 0 OID 20513151)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5602-95e6-0195-3a4eb673add8	00160000-5602-95e6-8423-4b33213c272f	\N	00140000-5602-95e4-7b1c-0ae393d8e9ba	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		00220000-5602-95e6-2985-183b4eb124cb
000e0000-5602-95e6-9d79-a351a5a1e0e2	00160000-5602-95e6-64f0-a709c1733a64	\N	00140000-5602-95e4-1f49-a8e91ac30db7	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		00220000-5602-95e6-e25e-cc8ea22563cd
000e0000-5602-95e6-0afb-68e0c0f8dc03	\N	\N	00140000-5602-95e4-1f49-a8e91ac30db7	00190000-5602-95e6-d335-805388086b0e	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-95e6-2985-183b4eb124cb
000e0000-5602-95e6-77ae-4880efbed069	\N	\N	00140000-5602-95e4-1f49-a8e91ac30db7	00190000-5602-95e6-d335-805388086b0e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-95e6-2985-183b4eb124cb
000e0000-5602-95e6-f394-2599603a479c	\N	\N	00140000-5602-95e4-1f49-a8e91ac30db7	00190000-5602-95e6-d335-805388086b0e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5602-95e6-6b62-4e2719a158b6
000e0000-5602-95e6-8ced-c02fe2591fe0	\N	\N	00140000-5602-95e4-1f49-a8e91ac30db7	00190000-5602-95e6-d335-805388086b0e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5602-95e6-6b62-4e2719a158b6
\.


--
-- TOC entry 2988 (class 0 OID 20512834)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5602-95e6-f64f-cbe9ebe709ab	000e0000-5602-95e6-9d79-a351a5a1e0e2	\N	1	
00200000-5602-95e6-5392-4d8a954ff897	000e0000-5602-95e6-9d79-a351a5a1e0e2	\N	2	
00200000-5602-95e6-80ed-12b8967de902	000e0000-5602-95e6-9d79-a351a5a1e0e2	\N	3	
00200000-5602-95e6-c1ac-1ead9db238fb	000e0000-5602-95e6-9d79-a351a5a1e0e2	\N	4	
00200000-5602-95e6-7e6b-a4d1ddefaa7c	000e0000-5602-95e6-9d79-a351a5a1e0e2	\N	5	
\.


--
-- TOC entry 3002 (class 0 OID 20512962)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20513075)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5602-95e4-18bc-f034754a76ba	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5602-95e4-0dd5-97483aeee7a2	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5602-95e4-d4da-b12cf27c3f64	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5602-95e4-b3a0-760f42a1a886	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5602-95e4-fbc5-3d08a31dc68b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5602-95e4-2955-a039c43799e6	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5602-95e4-082d-f3292aef82d8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5602-95e4-aa18-d50b4f823901	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5602-95e4-099f-6624e19577fa	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5602-95e4-594f-9d74c9576bc8	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5602-95e4-f851-02a0a4b2db07	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5602-95e4-4fdb-4640c7ce2ec6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5602-95e4-affd-bca8fa6f6858	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5602-95e4-a8c9-d56ebaa5582f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5602-95e4-1c3c-31d9ef6e554a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5602-95e4-c05b-0c1b40e30355	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5602-95e4-b30c-140ebace4866	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5602-95e4-05ee-ced6f5a2f4df	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5602-95e4-ccfb-647c3215e872	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5602-95e4-fd57-a15eb2530d64	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5602-95e4-58f6-bc2ab678f4d3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5602-95e4-7bc6-44d71e821b31	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5602-95e4-9ee9-8cd086ae4a0e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5602-95e4-6bec-bbce5348223f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5602-95e4-1c2f-265ad5a897d9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5602-95e4-0dd7-6f353b01bac1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5602-95e4-4b43-5979c85c582c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5602-95e4-fb03-93aac76883d3	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3031 (class 0 OID 20513393)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20513365)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20513405)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20513034)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5602-95e6-4747-fa0f0ceb4899	00090000-5602-95e6-6c76-313b0420b98d	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-95e6-1a62-cb0d69db1b7d	00090000-5602-95e6-5f75-e2a3cc400f35	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-95e6-8e61-b84710838730	00090000-5602-95e6-fbb2-6dc7d0a6eb59	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-95e6-9196-3b72c0b6700e	00090000-5602-95e6-6c5a-4aa4baa74c82	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-95e6-00f3-b72c5300d891	00090000-5602-95e6-bff3-38c0b315948c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-95e6-6846-b8b858e6f680	00090000-5602-95e6-c83a-68eb0918a309	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2990 (class 0 OID 20512870)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20513141)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5602-95e4-7b1c-0ae393d8e9ba	01	Drama	drama (SURS 01)
00140000-5602-95e4-a5b2-ffd4936ad71f	02	Opera	opera (SURS 02)
00140000-5602-95e4-3dc4-7dc2e93429c0	03	Balet	balet (SURS 03)
00140000-5602-95e4-f676-0bba46f1f24b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5602-95e4-de80-4a4d130f39e4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5602-95e4-1f49-a8e91ac30db7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5602-95e4-d5c4-21fc21ecd8d1	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3008 (class 0 OID 20513024)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2495 (class 2606 OID 20512645)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 20513200)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20513190)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20513058)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20513099)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 20513445)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 20512859)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20512880)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 20513363)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 20512770)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 20513255)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20513020)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 20512832)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 20512808)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 20512784)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 20512927)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 20513422)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20513429)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 20513453)
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
-- TOC entry 2607 (class 2606 OID 20512954)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 20512742)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 20512654)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 20512678)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 20512634)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2486 (class 2606 OID 20512619)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 20512960)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 20512996)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 20513136)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 20512706)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 20512730)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 20513316)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20512933)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 20512720)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20512820)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20512945)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20513325)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 20513333)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 20513303)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 20513344)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 20512978)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 20512918)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 20512909)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 20513123)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20513051)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 20512796)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 20512590)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 20512987)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 20512608)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2488 (class 2606 OID 20512628)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20513005)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 20512940)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20512889)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 20512578)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 20512566)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 20512560)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 20513071)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 20512687)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 20512900)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 20513110)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20513356)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 20512755)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 20512603)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 20513169)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20512842)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 20512968)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20513083)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 20513403)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 20513387)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 20513411)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 20513042)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 20512874)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 20513149)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 20513032)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 1259 OID 20512868)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2560 (class 1259 OID 20512869)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2561 (class 1259 OID 20512867)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2562 (class 1259 OID 20512866)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2563 (class 1259 OID 20512865)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2649 (class 1259 OID 20513072)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2650 (class 1259 OID 20513073)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2651 (class 1259 OID 20513074)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 20513424)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 20513423)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2509 (class 1259 OID 20512708)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2608 (class 1259 OID 20512961)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 20513391)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 20513390)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 20513392)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 20513389)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 20513388)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2602 (class 1259 OID 20512947)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2603 (class 1259 OID 20512946)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2554 (class 1259 OID 20512843)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 20513021)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20513023)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2634 (class 1259 OID 20513022)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2534 (class 1259 OID 20512786)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 20512785)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2713 (class 1259 OID 20513345)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2665 (class 1259 OID 20513138)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2666 (class 1259 OID 20513139)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 20513140)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 20513412)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2674 (class 1259 OID 20513174)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2675 (class 1259 OID 20513171)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2676 (class 1259 OID 20513175)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2677 (class 1259 OID 20513173)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2678 (class 1259 OID 20513172)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2524 (class 1259 OID 20512757)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 20512756)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2500 (class 1259 OID 20512681)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2620 (class 1259 OID 20512988)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2490 (class 1259 OID 20512635)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 20512636)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2625 (class 1259 OID 20513008)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2626 (class 1259 OID 20513007)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2627 (class 1259 OID 20513006)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2547 (class 1259 OID 20512821)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 20512822)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2470 (class 1259 OID 20512568)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2582 (class 1259 OID 20512913)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2583 (class 1259 OID 20512911)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2584 (class 1259 OID 20512910)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2585 (class 1259 OID 20512912)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2481 (class 1259 OID 20512609)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2482 (class 1259 OID 20512610)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2611 (class 1259 OID 20512969)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 20513446)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2647 (class 1259 OID 20513060)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 20513059)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2746 (class 1259 OID 20513454)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 20513455)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2597 (class 1259 OID 20512934)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2641 (class 1259 OID 20513052)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2642 (class 1259 OID 20513053)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2695 (class 1259 OID 20513260)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2696 (class 1259 OID 20513259)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2697 (class 1259 OID 20513256)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2698 (class 1259 OID 20513257)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2699 (class 1259 OID 20513258)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2513 (class 1259 OID 20512722)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 20512721)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2515 (class 1259 OID 20512723)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 20512982)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 20512981)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 20513326)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2706 (class 1259 OID 20513327)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2688 (class 1259 OID 20513204)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 20513205)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2690 (class 1259 OID 20513202)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2691 (class 1259 OID 20513203)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2638 (class 1259 OID 20513043)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 20512922)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2589 (class 1259 OID 20512921)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2590 (class 1259 OID 20512919)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2591 (class 1259 OID 20512920)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2684 (class 1259 OID 20513192)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 20513191)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2538 (class 1259 OID 20512797)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2541 (class 1259 OID 20512811)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2542 (class 1259 OID 20512810)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2543 (class 1259 OID 20512809)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2544 (class 1259 OID 20512812)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2553 (class 1259 OID 20512833)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2702 (class 1259 OID 20513317)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2721 (class 1259 OID 20513364)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 20513430)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 20513431)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2496 (class 1259 OID 20512656)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2497 (class 1259 OID 20512655)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2505 (class 1259 OID 20512688)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 20512689)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2569 (class 1259 OID 20512875)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 20512903)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20512902)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2579 (class 1259 OID 20512901)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2564 (class 1259 OID 20512861)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2565 (class 1259 OID 20512862)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2566 (class 1259 OID 20512860)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2567 (class 1259 OID 20512864)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2568 (class 1259 OID 20512863)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2512 (class 1259 OID 20512707)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 20512771)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20512773)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2532 (class 1259 OID 20512772)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2533 (class 1259 OID 20512774)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2596 (class 1259 OID 20512928)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2670 (class 1259 OID 20513137)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 20513170)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 20513111)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20513112)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2503 (class 1259 OID 20512679)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 20512680)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2635 (class 1259 OID 20513033)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 20512579)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 20512743)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2473 (class 1259 OID 20512567)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2718 (class 1259 OID 20513357)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 20512980)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2619 (class 1259 OID 20512979)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 20513201)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 20512731)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 20513150)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 20513404)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2711 (class 1259 OID 20513334)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 20513335)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2658 (class 1259 OID 20513100)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2576 (class 1259 OID 20512890)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 20512629)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2780 (class 2606 OID 20513586)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2779 (class 2606 OID 20513591)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2775 (class 2606 OID 20513611)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2781 (class 2606 OID 20513581)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2777 (class 2606 OID 20513601)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2776 (class 2606 OID 20513606)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2778 (class 2606 OID 20513596)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2816 (class 2606 OID 20513776)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2815 (class 2606 OID 20513781)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2814 (class 2606 OID 20513786)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 20513951)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 20513946)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2761 (class 2606 OID 20513511)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 20513696)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2843 (class 2606 OID 20513931)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 20513926)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2842 (class 2606 OID 20513936)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20513921)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2846 (class 2606 OID 20513916)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2796 (class 2606 OID 20513691)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2797 (class 2606 OID 20513686)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2774 (class 2606 OID 20513576)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 20513736)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20513746)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2807 (class 2606 OID 20513741)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2767 (class 2606 OID 20513546)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20513541)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 20513676)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20513906)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2819 (class 2606 OID 20513791)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 20513796)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 20513801)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2847 (class 2606 OID 20513941)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2821 (class 2606 OID 20513821)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2824 (class 2606 OID 20513806)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2820 (class 2606 OID 20513826)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2822 (class 2606 OID 20513816)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2823 (class 2606 OID 20513811)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2765 (class 2606 OID 20513536)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20513531)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 20513496)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2758 (class 2606 OID 20513491)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2802 (class 2606 OID 20513716)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2754 (class 2606 OID 20513471)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2753 (class 2606 OID 20513476)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2803 (class 2606 OID 20513731)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2804 (class 2606 OID 20513726)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2805 (class 2606 OID 20513721)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2772 (class 2606 OID 20513561)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2771 (class 2606 OID 20513566)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2750 (class 2606 OID 20513456)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2786 (class 2606 OID 20513651)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2788 (class 2606 OID 20513641)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2789 (class 2606 OID 20513636)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2787 (class 2606 OID 20513646)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2752 (class 2606 OID 20513461)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2751 (class 2606 OID 20513466)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2799 (class 2606 OID 20513701)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2852 (class 2606 OID 20513966)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2812 (class 2606 OID 20513771)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2813 (class 2606 OID 20513766)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2854 (class 2606 OID 20513971)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 20513976)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2795 (class 2606 OID 20513681)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2811 (class 2606 OID 20513756)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2810 (class 2606 OID 20513761)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 20513881)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 20513876)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2835 (class 2606 OID 20513861)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2834 (class 2606 OID 20513866)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2833 (class 2606 OID 20513871)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2763 (class 2606 OID 20513521)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 20513516)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 20513526)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 20513711)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2801 (class 2606 OID 20513706)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 20513891)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2837 (class 2606 OID 20513896)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2828 (class 2606 OID 20513851)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 20513856)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2830 (class 2606 OID 20513841)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2829 (class 2606 OID 20513846)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2809 (class 2606 OID 20513751)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 20513671)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2791 (class 2606 OID 20513666)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2793 (class 2606 OID 20513656)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2792 (class 2606 OID 20513661)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 20513836)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2826 (class 2606 OID 20513831)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 20513551)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2770 (class 2606 OID 20513556)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 20513571)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20513886)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2839 (class 2606 OID 20513901)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20513911)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2851 (class 2606 OID 20513956)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2850 (class 2606 OID 20513961)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2755 (class 2606 OID 20513486)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2756 (class 2606 OID 20513481)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2760 (class 2606 OID 20513501)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 20513506)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 20513616)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2783 (class 2606 OID 20513631)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20513626)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2785 (class 2606 OID 20513621)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-23 14:07:05 CEST

--
-- PostgreSQL database dump complete
--

