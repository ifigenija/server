--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-21 17:04:13 CEST

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
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20349964)
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
-- TOC entry 229 (class 1259 OID 20350519)
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
-- TOC entry 228 (class 1259 OID 20350502)
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
-- TOC entry 219 (class 1259 OID 20350381)
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
-- TOC entry 222 (class 1259 OID 20350411)
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
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 20350758)
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
-- TOC entry 197 (class 1259 OID 20350171)
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
-- TOC entry 199 (class 1259 OID 20350203)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20350684)
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
-- TOC entry 190 (class 1259 OID 20350085)
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
-- TOC entry 230 (class 1259 OID 20350532)
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
-- TOC entry 215 (class 1259 OID 20350336)
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
-- TOC entry 195 (class 1259 OID 20350150)
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
-- TOC entry 193 (class 1259 OID 20350125)
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
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20350102)
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
-- TOC entry 204 (class 1259 OID 20350250)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20350739)
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
-- TOC entry 242 (class 1259 OID 20350751)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20350773)
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
-- TOC entry 208 (class 1259 OID 20350275)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20350059)
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
-- TOC entry 182 (class 1259 OID 20349973)
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
-- TOC entry 183 (class 1259 OID 20349984)
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
-- TOC entry 178 (class 1259 OID 20349938)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20349957)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20350282)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20350316)
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
-- TOC entry 225 (class 1259 OID 20350450)
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
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 20350017)
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
-- TOC entry 187 (class 1259 OID 20350051)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20350630)
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
-- TOC entry 205 (class 1259 OID 20350256)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20350036)
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
-- TOC entry 194 (class 1259 OID 20350140)
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
-- TOC entry 207 (class 1259 OID 20350268)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20350644)
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
-- TOC entry 234 (class 1259 OID 20350654)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20350587)
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
-- TOC entry 235 (class 1259 OID 20350662)
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
-- TOC entry 211 (class 1259 OID 20350297)
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
-- TOC entry 203 (class 1259 OID 20350241)
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
-- TOC entry 202 (class 1259 OID 20350231)
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
-- TOC entry 224 (class 1259 OID 20350439)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20350371)
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
-- TOC entry 192 (class 1259 OID 20350114)
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
-- TOC entry 175 (class 1259 OID 20349909)
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
-- TOC entry 174 (class 1259 OID 20349907)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20350310)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20349947)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20349931)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20350324)
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
-- TOC entry 206 (class 1259 OID 20350262)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20350208)
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
-- TOC entry 173 (class 1259 OID 20349896)
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
-- TOC entry 172 (class 1259 OID 20349888)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20349883)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20350388)
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
-- TOC entry 184 (class 1259 OID 20350009)
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
-- TOC entry 201 (class 1259 OID 20350218)
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
-- TOC entry 223 (class 1259 OID 20350427)
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
-- TOC entry 236 (class 1259 OID 20350672)
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
-- TOC entry 189 (class 1259 OID 20350071)
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
-- TOC entry 176 (class 1259 OID 20349918)
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
-- TOC entry 227 (class 1259 OID 20350477)
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
-- TOC entry 196 (class 1259 OID 20350161)
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
-- TOC entry 210 (class 1259 OID 20350289)
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
-- TOC entry 221 (class 1259 OID 20350402)
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
-- TOC entry 239 (class 1259 OID 20350719)
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
-- TOC entry 238 (class 1259 OID 20350691)
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
-- TOC entry 240 (class 1259 OID 20350731)
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
-- TOC entry 217 (class 1259 OID 20350361)
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
-- TOC entry 198 (class 1259 OID 20350197)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20350467)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20350351)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20349912)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2972 (class 0 OID 20349964)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 20350519)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5600-1c6b-c6e4-d9b215b68f1c	000d0000-5600-1c6b-61de-130eba68c23e	\N	00090000-5600-1c6b-7a64-a821e2655459	000b0000-5600-1c6b-a499-6f3263638189	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5600-1c6b-d591-bc2fb2bb6674	000d0000-5600-1c6b-db44-97bd737d9c27	00100000-5600-1c6b-0ab8-c750c6b02882	00090000-5600-1c6b-3076-744908d6a8dc	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5600-1c6b-886f-3d2151040f4c	000d0000-5600-1c6b-1372-3e3bb02e62cd	00100000-5600-1c6b-a23a-d28bd6790cf5	00090000-5600-1c6b-cdd0-ace0ad980ce5	\N	0003	t	\N	2015-09-21	\N	2	t	\N	f	f
000c0000-5600-1c6b-3fd1-502ebbba2896	000d0000-5600-1c6b-98f1-2f30df2d62e2	\N	00090000-5600-1c6b-c4cd-d418a3b6f373	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5600-1c6b-b410-4f405d2f6844	000d0000-5600-1c6b-7815-ad2d2775f9b9	\N	00090000-5600-1c6b-7d59-9991498934ab	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5600-1c6b-3274-430b5e49fe09	000d0000-5600-1c6b-b124-a3685515d829	\N	00090000-5600-1c6b-36d8-7b67d45c847a	000b0000-5600-1c6b-5b06-92500c601a4b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5600-1c6b-8156-f61fc6f56c6f	000d0000-5600-1c6b-d95a-6be1143de8d0	00100000-5600-1c6b-a11c-41e0294fb72b	00090000-5600-1c6b-13f1-92e8d3309c63	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5600-1c6b-ff29-473e79dc92bf	000d0000-5600-1c6b-459a-8c928f571aaa	\N	00090000-5600-1c6b-0d1a-50b50b30d06b	000b0000-5600-1c6b-7926-5b31c18f5df3	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5600-1c6b-e9f8-6a959cb0993c	000d0000-5600-1c6b-d95a-6be1143de8d0	00100000-5600-1c6b-1f86-c90883c10c43	00090000-5600-1c6b-bf7f-bb996480043d	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5600-1c6b-508f-9fbc4f680832	000d0000-5600-1c6b-d95a-6be1143de8d0	00100000-5600-1c6b-55f7-546481c6298a	00090000-5600-1c6b-44d4-fe00e4cc2c6a	\N	0010	t	\N	2015-09-21	\N	16	f	\N	f	t
000c0000-5600-1c6b-47a4-9b2310aad1b6	000d0000-5600-1c6b-d95a-6be1143de8d0	00100000-5600-1c6b-d06a-81a8fa17b39c	00090000-5600-1c6b-d959-fbc28c57f75f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5600-1c6b-846b-5fa930286a0a	000d0000-5600-1c6b-d447-519ae60c3e2f	\N	00090000-5600-1c6b-3076-744908d6a8dc	000b0000-5600-1c6b-f8fe-e0e46e255093	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3019 (class 0 OID 20350502)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20350381)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5600-1c6b-4013-da6b8fd050a3	00160000-5600-1c6a-0c20-47ac6168ab97	00090000-5600-1c6b-a8b8-d79308a07722	Avtor originala	10	t
003d0000-5600-1c6b-6b96-7c76e35be4ec	00160000-5600-1c6a-0c20-47ac6168ab97	00090000-5600-1c6b-398b-b767615cfd3b	Predelava	14	t
003d0000-5600-1c6b-6aef-387c2f35ecb5	00160000-5600-1c6a-2b1a-62908a14c170	00090000-5600-1c6b-67e5-cf6d13ac8208	Avtor originala	11	t
003d0000-5600-1c6b-e806-c2331e5bb5e1	00160000-5600-1c6a-7b4c-00a9d2f388b9	00090000-5600-1c6b-aff4-3551d8007405	Avtor originala	12	t
003d0000-5600-1c6b-7611-1601be59c851	00160000-5600-1c6a-0c20-47ac6168ab97	00090000-5600-1c6b-be6e-5bdba0ed72ca	Predelava	18	f
\.


--
-- TOC entry 3013 (class 0 OID 20350411)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5600-1c6a-0c20-47ac6168ab97	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5600-1c6a-2b1a-62908a14c170	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N
00160000-5600-1c6a-7b4c-00a9d2f388b9	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N
\.


--
-- TOC entry 3034 (class 0 OID 20350758)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 20350171)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5600-1c6b-2320-901643899565	\N	\N	00200000-5600-1c6b-8342-761347f6a9a8	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5600-1c6b-5290-d48e1c608614	\N	\N	00200000-5600-1c6b-c923-b383baeb3fca	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5600-1c6b-e54a-d18420e9489b	\N	\N	00200000-5600-1c6b-e0fe-6abc8f1a81b7	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5600-1c6b-66b7-9304fcecffe6	\N	\N	00200000-5600-1c6b-8055-2d59fa33bcce	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5600-1c6b-15d8-85d8a43a259e	\N	\N	00200000-5600-1c6b-7a5d-0836971d3c7f	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2990 (class 0 OID 20350203)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 20350684)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20350085)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5600-1c69-05e8-c0b8b5f2ca67	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5600-1c69-11ed-c0bfd906a030	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5600-1c69-a8df-ab6ae4ea1201	AL	ALB	008	Albania 	Albanija	\N
00040000-5600-1c69-6628-7fe6d238bb0b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5600-1c69-7a49-fb68faf6263e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5600-1c69-3b33-e5aac00460de	AD	AND	020	Andorra 	Andora	\N
00040000-5600-1c69-eb41-1a3726385839	AO	AGO	024	Angola 	Angola	\N
00040000-5600-1c69-e0e3-b1a320d4f194	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5600-1c69-7ab2-42ca52edf0e5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5600-1c69-cb4d-7bc3976d1130	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5600-1c69-e55b-4b4cfe7fbded	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5600-1c69-7ed9-c2548cc21678	AM	ARM	051	Armenia 	Armenija	\N
00040000-5600-1c69-413a-270c73ec5484	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5600-1c69-c99f-11c9fb2399ec	AU	AUS	036	Australia 	Avstralija	\N
00040000-5600-1c69-d680-f6aeaeec05f7	AT	AUT	040	Austria 	Avstrija	\N
00040000-5600-1c69-c1e3-2e0f0adc2e7b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5600-1c69-223e-8b7c050e1e09	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5600-1c69-5ef1-6b8cc60a5691	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5600-1c69-1e47-ccd9bc5e36a0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5600-1c69-3666-b3b912c9b9a8	BB	BRB	052	Barbados 	Barbados	\N
00040000-5600-1c69-67e5-a81936f54b4e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5600-1c69-bc32-17368a99fee9	BE	BEL	056	Belgium 	Belgija	\N
00040000-5600-1c69-d9ff-ff08c2dc89bd	BZ	BLZ	084	Belize 	Belize	\N
00040000-5600-1c69-139a-c1d56d7bd66f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5600-1c69-50c9-fdf8e50d0e13	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5600-1c69-5552-1e72a3abcd16	BT	BTN	064	Bhutan 	Butan	\N
00040000-5600-1c69-fbf9-5fb81f88c93f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5600-1c69-23d4-63a0df74b625	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5600-1c69-b258-462829ebcc8c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5600-1c69-bc96-8627c2d9b16b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5600-1c69-2f7a-951e5f37a506	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5600-1c69-fa4a-8d8f2e86cd14	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5600-1c69-619b-ee3c02740c4d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5600-1c69-3d7e-314abb28fc22	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5600-1c69-cfee-d4bb4b109deb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5600-1c69-422e-2e76bcad1b41	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5600-1c69-f686-39f689015ca9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5600-1c69-d61d-0f7a9a985a2e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5600-1c69-8941-cbaad17d9636	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5600-1c69-b35d-8cb476232163	CA	CAN	124	Canada 	Kanada	\N
00040000-5600-1c69-1efd-41b0bda09c71	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5600-1c69-472b-2b7c33493bb1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5600-1c69-aae7-6ae5afebfbb0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5600-1c69-e6f6-eb0480317bb5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5600-1c69-4e9d-05879711be29	CL	CHL	152	Chile 	Čile	\N
00040000-5600-1c69-65c3-b934373aab03	CN	CHN	156	China 	Kitajska	\N
00040000-5600-1c69-138c-2b31908899be	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5600-1c69-1af2-c206437aecde	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5600-1c69-8c67-050028b88acb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5600-1c69-65f2-faf6cc1ffb93	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5600-1c69-c6ca-a65f83875a22	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5600-1c69-7129-c3ba87a8b38a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5600-1c69-62e4-6511730a3c71	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5600-1c69-3219-a5065dd14434	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5600-1c69-f45b-d7d689e374ea	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5600-1c69-72c2-acadfa6734c4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5600-1c69-8dad-c2d4df0f69ff	CU	CUB	192	Cuba 	Kuba	\N
00040000-5600-1c69-2179-a7986e6260d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5600-1c69-9e6f-d312a4401a69	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5600-1c69-4f7b-3903072b4d3a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5600-1c69-2526-4bcdac1420f1	DK	DNK	208	Denmark 	Danska	\N
00040000-5600-1c69-4a6a-4f39226d3807	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5600-1c69-d66d-60522e6e0778	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5600-1c69-8fbb-f8381d170883	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5600-1c69-0886-809f53180f77	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5600-1c69-c629-bbb05eb9704d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5600-1c69-a3a8-65344d5b09e3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5600-1c69-802a-24aeebd2d070	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5600-1c69-7aae-8f6b8e86e74b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5600-1c69-08b0-4d84440c1b46	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5600-1c69-2ba0-b63c1c783b01	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5600-1c69-079e-b5e060b0fb73	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5600-1c69-b2ac-21e4b859e1ea	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5600-1c69-7438-62d0163f99ff	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5600-1c69-f4f3-0286ccafc518	FI	FIN	246	Finland 	Finska	\N
00040000-5600-1c69-efa9-d5030d7792e5	FR	FRA	250	France 	Francija	\N
00040000-5600-1c69-0772-6c10b2a316dc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5600-1c69-17bc-86a260b5211a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5600-1c69-2566-eed698b59e5a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5600-1c69-41e5-e462b5f87c1e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5600-1c69-f34e-9d7cb9904b64	GA	GAB	266	Gabon 	Gabon	\N
00040000-5600-1c69-e474-e431f769e3a8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5600-1c69-414d-a978e64f7dd0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5600-1c69-3881-71c0ac0c94c2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5600-1c69-605c-a222bced27e1	GH	GHA	288	Ghana 	Gana	\N
00040000-5600-1c69-ab83-2a8cb742467a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5600-1c69-b9b5-f8e8f8064863	GR	GRC	300	Greece 	Grčija	\N
00040000-5600-1c69-a691-fc0c9cd9429b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5600-1c69-8c13-978f574d1642	GD	GRD	308	Grenada 	Grenada	\N
00040000-5600-1c69-9308-90890b57e7fb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5600-1c69-89fc-37872b08cffd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5600-1c69-2e0d-0333ade2ef5e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5600-1c69-adad-edc9888c9802	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5600-1c69-9428-b5ac515d0b8f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5600-1c69-02c3-75ccf0a45408	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5600-1c69-e535-3d774afdb8cb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5600-1c69-e6de-0992cb58fb17	HT	HTI	332	Haiti 	Haiti	\N
00040000-5600-1c69-ccae-0cc5dcac9d73	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5600-1c69-69cb-aba13c9e5022	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5600-1c69-9964-1321b591a79a	HN	HND	340	Honduras 	Honduras	\N
00040000-5600-1c69-b613-2f3dd4eee216	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5600-1c69-ba4a-67722bb1a0c3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5600-1c69-48a5-34c270f40b79	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5600-1c69-fd6c-54e7ae2f1675	IN	IND	356	India 	Indija	\N
00040000-5600-1c69-c2ac-58ee64d9e126	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5600-1c69-a6b8-c5009b434365	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5600-1c69-f170-72bed751e2e6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5600-1c69-4444-f63f20820d86	IE	IRL	372	Ireland 	Irska	\N
00040000-5600-1c69-036d-20c8388140d3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5600-1c69-41e5-9075c34fbe5e	IL	ISR	376	Israel 	Izrael	\N
00040000-5600-1c69-54b5-b6008af6d598	IT	ITA	380	Italy 	Italija	\N
00040000-5600-1c69-bd05-d6adcebfd7a8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5600-1c69-ad48-0700f1946f50	JP	JPN	392	Japan 	Japonska	\N
00040000-5600-1c69-8eaa-1710a8361370	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5600-1c69-927b-af8e1f12f84a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5600-1c69-7ec1-9d459feac3f0	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5600-1c69-f8b4-56f434905af9	KE	KEN	404	Kenya 	Kenija	\N
00040000-5600-1c69-d241-4d9f105de770	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5600-1c69-7b53-6372d72ce73d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5600-1c69-da92-d719fbc6b836	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5600-1c69-990d-418c939a461a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5600-1c69-3d80-561e00060a39	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5600-1c69-f535-89367f2879d0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5600-1c69-fa33-7ce29932c55d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5600-1c69-e433-8cd5aedc3604	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5600-1c69-709d-e8bb1286aafc	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5600-1c69-33e3-e85f53406e00	LR	LBR	430	Liberia 	Liberija	\N
00040000-5600-1c69-0775-e57c8f8d7097	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5600-1c69-2048-a464394a1808	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5600-1c69-7860-e1273dd637f7	LT	LTU	440	Lithuania 	Litva	\N
00040000-5600-1c69-e390-91e95ba60ca6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5600-1c69-84d3-4544fd15e7f6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5600-1c69-5f0b-04c41d887af1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5600-1c69-5a25-eb1c187f1843	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5600-1c69-cba6-857a9d81f3d5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5600-1c69-002f-8c8ea9c7bfc1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5600-1c69-6b35-19f266a65c96	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5600-1c69-c9b1-99fad1520aab	ML	MLI	466	Mali 	Mali	\N
00040000-5600-1c69-a91f-4f29495c19e7	MT	MLT	470	Malta 	Malta	\N
00040000-5600-1c69-78c5-7322f85f7a64	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5600-1c69-23e1-b1f9103b89eb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5600-1c69-d07a-684efe58d0f0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5600-1c69-f633-521caea7b60b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5600-1c69-d34b-c9e8e47806d3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5600-1c69-8e5a-c9c6bf2eefff	MX	MEX	484	Mexico 	Mehika	\N
00040000-5600-1c69-4e4b-214b1f4ea5ec	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5600-1c69-81a5-9d8806a83514	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5600-1c69-3ac7-c1e479f64f8b	MC	MCO	492	Monaco 	Monako	\N
00040000-5600-1c69-3a95-b210a88f95c3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5600-1c69-3253-4ddedac8fa16	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5600-1c69-1ff7-08663d904bc0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5600-1c69-59f0-1bf3ce646b01	MA	MAR	504	Morocco 	Maroko	\N
00040000-5600-1c69-ecc1-819e185a0d30	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5600-1c69-2bd9-44553efa879e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5600-1c69-188f-99838b27f717	NA	NAM	516	Namibia 	Namibija	\N
00040000-5600-1c69-54a3-c392600f4e92	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5600-1c69-1916-19fed474febd	NP	NPL	524	Nepal 	Nepal	\N
00040000-5600-1c69-beab-da31f4806be1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5600-1c69-e63e-d112d3b8236b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5600-1c69-a622-9dbdf919bdd6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5600-1c69-85f1-71f1ec3bd920	NE	NER	562	Niger 	Niger 	\N
00040000-5600-1c69-7359-544452f2cd36	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5600-1c69-508b-c014d1ca39df	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5600-1c69-42de-c4ab5ccdee53	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5600-1c69-73e8-19ad193655c6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5600-1c69-95a7-07e26f9d47b2	NO	NOR	578	Norway 	Norveška	\N
00040000-5600-1c69-8d46-98144c29cf8d	OM	OMN	512	Oman 	Oman	\N
00040000-5600-1c69-4f04-c43fd8b1c972	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5600-1c69-6065-ba7f83db473a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5600-1c69-d25b-ba3522e2b8f5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5600-1c69-03ca-13d775293b4c	PA	PAN	591	Panama 	Panama	\N
00040000-5600-1c69-0172-b71792a5e9bc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5600-1c69-3dbd-ea0fefda59c9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5600-1c69-c336-2053836d9e65	PE	PER	604	Peru 	Peru	\N
00040000-5600-1c69-d95b-faa327da1242	PH	PHL	608	Philippines 	Filipini	\N
00040000-5600-1c69-be62-5ef73f8f617a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5600-1c69-8cfe-f351a52bccb6	PL	POL	616	Poland 	Poljska	\N
00040000-5600-1c69-0b06-ef82b1016a3e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5600-1c69-1e2b-79bd94357ab3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5600-1c69-e0a2-85b4f5c32b6e	QA	QAT	634	Qatar 	Katar	\N
00040000-5600-1c69-12c8-d2591e0849e9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5600-1c69-b73d-c83b70001257	RO	ROU	642	Romania 	Romunija	\N
00040000-5600-1c69-091e-1cf5a9d358cb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5600-1c69-dddb-1cf972d09660	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5600-1c69-0d51-b018e301f7d8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5600-1c69-ade3-ac8d16b158c1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5600-1c69-7033-896e1feb0168	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5600-1c69-bd9b-0f0da261fc9b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5600-1c69-ed2a-b17de95a6135	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5600-1c69-c192-a0f4a01ac4a3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5600-1c69-d744-f16371d56f82	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5600-1c69-2293-54cb5c274adc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5600-1c69-caab-e18dae81fe89	SM	SMR	674	San Marino 	San Marino	\N
00040000-5600-1c69-7309-4377161c9084	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5600-1c69-4978-27df33725fe8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5600-1c69-c1f2-d8a7fa9e35aa	SN	SEN	686	Senegal 	Senegal	\N
00040000-5600-1c69-cde5-0f8018e747de	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5600-1c69-3990-1394cadcbf69	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5600-1c69-4d8a-9deb5591b1cc	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5600-1c69-5c1e-be2231c47d6e	SG	SGP	702	Singapore 	Singapur	\N
00040000-5600-1c69-6b8b-8365efbde7c3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5600-1c69-c1c9-712caa443fde	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5600-1c69-0a0b-f21d60ea00c3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5600-1c69-8e59-733b163d052f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5600-1c69-b6a4-8383d428c333	SO	SOM	706	Somalia 	Somalija	\N
00040000-5600-1c69-b39f-548a8984a7c3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5600-1c69-1a5d-d39b4754f27d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5600-1c69-cc22-e835487f4fdf	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5600-1c69-f473-2198f192f26a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5600-1c69-5b64-1861d7ce5415	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5600-1c69-0cfe-8154654c73e8	SD	SDN	729	Sudan 	Sudan	\N
00040000-5600-1c69-8cf6-459c83d9aa21	SR	SUR	740	Suriname 	Surinam	\N
00040000-5600-1c69-fee6-8462b8109514	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5600-1c69-936a-0ecde92ef2b4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5600-1c69-d861-4de583d2a950	SE	SWE	752	Sweden 	Švedska	\N
00040000-5600-1c69-7a54-6a59aa198013	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5600-1c69-9174-f968363347ac	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5600-1c69-9d07-ea41576a1330	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5600-1c69-3dcc-767321e0af8d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5600-1c69-c745-eb76a078f1b3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5600-1c69-2585-368db86da702	TH	THA	764	Thailand 	Tajska	\N
00040000-5600-1c69-c8f6-5d813db464f3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5600-1c69-8e4f-814689ad9b41	TG	TGO	768	Togo 	Togo	\N
00040000-5600-1c69-c2c8-e03c3e6cf0f9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5600-1c69-441c-d39ffa649887	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5600-1c69-3feb-819d8d081416	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5600-1c69-d67e-995bc17ca955	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5600-1c69-8007-c03a312380d5	TR	TUR	792	Turkey 	Turčija	\N
00040000-5600-1c69-c792-a13947e48759	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5600-1c69-f13b-00aa167e8b20	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5600-1c69-a657-713e82422cf2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5600-1c69-66c4-cafdcfd85587	UG	UGA	800	Uganda 	Uganda	\N
00040000-5600-1c69-726b-0dfbe57f6b6f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5600-1c69-388f-bab210f9e431	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5600-1c69-9838-fe060d31d043	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5600-1c69-6521-e95af0164816	US	USA	840	United States 	Združene države Amerike	\N
00040000-5600-1c69-15a5-8c289ef7b197	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5600-1c69-9926-3d31af439f34	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5600-1c69-92ec-92e4af0d3e45	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5600-1c69-0bd3-0f6f22dd3d72	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5600-1c69-f268-a3c40c0ff6c5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5600-1c69-3fbf-ae71e1da5e77	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5600-1c69-ec11-fca9850c5392	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5600-1c69-1f5f-f6940624e2a1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5600-1c69-863b-c95cc731d547	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5600-1c69-59d2-17cccf149304	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5600-1c69-17a5-8c020c983880	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5600-1c69-ab2d-6af954a7c213	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5600-1c69-f324-219c141fa78b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3021 (class 0 OID 20350532)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5600-1c6b-bc25-3f2d6d525696	000e0000-5600-1c6b-d4e6-f77c58168aa3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5600-1c69-5ada-5fb39a01f2e0	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5600-1c6b-cfde-ad2206ed5957	000e0000-5600-1c6b-ead1-e771e5169279	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5600-1c69-3647-0bb3a9b87488	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5600-1c6b-8b9d-4392d797ec69	000e0000-5600-1c6b-874c-9bb30a819d2b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5600-1c69-5ada-5fb39a01f2e0	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5600-1c6b-dc92-4da982bb867a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5600-1c6b-1874-e3f827f3b481	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3006 (class 0 OID 20350336)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5600-1c6b-61de-130eba68c23e	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-c6e4-d9b215b68f1c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5600-1c69-4fb2-f1e7c67488c1
000d0000-5600-1c6b-db44-97bd737d9c27	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-d591-bc2fb2bb6674	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5600-1c69-55dd-3e546235412c
000d0000-5600-1c6b-1372-3e3bb02e62cd	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-886f-3d2151040f4c	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5600-1c69-6639-b1da9d871de7
000d0000-5600-1c6b-98f1-2f30df2d62e2	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-3fd1-502ebbba2896	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5600-1c69-535e-c79a40f06c32
000d0000-5600-1c6b-7815-ad2d2775f9b9	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-b410-4f405d2f6844	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5600-1c69-535e-c79a40f06c32
000d0000-5600-1c6b-b124-a3685515d829	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-3274-430b5e49fe09	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5600-1c69-4fb2-f1e7c67488c1
000d0000-5600-1c6b-d95a-6be1143de8d0	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-e9f8-6a959cb0993c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5600-1c69-4fb2-f1e7c67488c1
000d0000-5600-1c6b-459a-8c928f571aaa	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-ff29-473e79dc92bf	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5600-1c69-ba75-2052391ce2e2
000d0000-5600-1c6b-d447-519ae60c3e2f	000e0000-5600-1c6b-ead1-e771e5169279	000c0000-5600-1c6b-846b-5fa930286a0a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5600-1c69-1ef1-8edf5e79a9e6
\.


--
-- TOC entry 2986 (class 0 OID 20350150)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20350125)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20350102)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5600-1c6b-ee69-3832d8862590	00080000-5600-1c6a-b66b-461062474815	00090000-5600-1c6b-44d4-fe00e4cc2c6a	AK		igralka
\.


--
-- TOC entry 2995 (class 0 OID 20350250)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20350739)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20350751)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20350773)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19946838)
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
-- TOC entry 2999 (class 0 OID 20350275)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20350059)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5600-1c6a-fffa-0377e1abeddb	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5600-1c6a-b65e-a90778ca300f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5600-1c6a-b125-2f04d6a94438	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5600-1c6a-1ac5-5acaab80648c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5600-1c6a-c2dc-4bf1bd89c56c	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5600-1c6a-eeb3-b092dc869d71	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5600-1c6a-2054-d1c8fd58c381	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5600-1c6a-e885-efae4b1ddad1	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5600-1c6a-4429-18a6bd1f8b90	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5600-1c6a-84d6-34e2a85c1c28	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5600-1c6a-13cb-5da25b787316	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5600-1c6a-8748-165a1f6bc5e0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5600-1c6a-1cbb-27dd0301b524	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5600-1c6a-c330-faf241ccb4b3	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5600-1c6a-04a6-172e1a2c6850	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5600-1c6a-182b-dc9d4e9a408c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5600-1c6a-2efa-c55c306e5ea3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5600-1c6a-95b6-f091c04cbe32	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5600-1c6a-f85b-5a1751280d69	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5600-1c6c-a198-c8d1b9c64171	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2973 (class 0 OID 20349973)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5600-1c6a-3eb9-7aa38958a092	00000000-5600-1c6a-04a6-172e1a2c6850	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5600-1c6a-c482-bc4ce38dd580	00000000-5600-1c6a-04a6-172e1a2c6850	00010000-5600-1c6a-b87b-a10f44ccc609	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5600-1c6a-d39f-fa981ba684bf	00000000-5600-1c6a-182b-dc9d4e9a408c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2974 (class 0 OID 20349984)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5600-1c6b-7a64-a821e2655459	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5600-1c6b-c4cd-d418a3b6f373	00010000-5600-1c6b-6c2c-f901155bf908	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5600-1c6b-cdd0-ace0ad980ce5	00010000-5600-1c6b-b94b-a355b8cab4cc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5600-1c6b-bf7f-bb996480043d	00010000-5600-1c6b-2785-1083f3b7872f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5600-1c6b-6323-b5f538df5b21	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5600-1c6b-36d8-7b67d45c847a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5600-1c6b-d959-fbc28c57f75f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5600-1c6b-13f1-92e8d3309c63	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5600-1c6b-44d4-fe00e4cc2c6a	00010000-5600-1c6b-3337-4367bbb5f77b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5600-1c6b-3076-744908d6a8dc	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5600-1c6b-75bb-9630b2242bb9	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5600-1c6b-7d59-9991498934ab	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5600-1c6b-0d1a-50b50b30d06b	00010000-5600-1c6b-53b0-a1d923ebb755	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5600-1c6b-a8b8-d79308a07722	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5600-1c6b-398b-b767615cfd3b	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5600-1c6b-67e5-cf6d13ac8208	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5600-1c6b-aff4-3551d8007405	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5600-1c6b-be6e-5bdba0ed72ca	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2969 (class 0 OID 20349938)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5600-1c69-21c2-0aed773fcd73	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5600-1c69-5095-a23022a0b603	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5600-1c69-1ffe-991ff564a6c2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5600-1c69-d25a-b1521cf2f16f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5600-1c69-0832-06bebf9aa65c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5600-1c69-86de-9def22886e47	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5600-1c69-bc21-6b3217222b8f	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5600-1c69-ee7d-032c4b38c7e6	Abonma-read	Abonma - branje	f
00030000-5600-1c69-77c4-2fdc5fef5722	Abonma-write	Abonma - spreminjanje	f
00030000-5600-1c69-89ff-fb00220d5558	Alternacija-read	Alternacija - branje	f
00030000-5600-1c69-3c8e-8fad082e899f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5600-1c69-3a0e-d83f0d0c38a3	Arhivalija-read	Arhivalija - branje	f
00030000-5600-1c69-d00a-0cdd91bb053c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5600-1c69-323e-5af8e9312dd6	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5600-1c69-f48e-ac26658d7391	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5600-1c69-f679-bf47ff11b083	Besedilo-read	Besedilo - branje	f
00030000-5600-1c69-fd14-92d3bc8ee648	Besedilo-write	Besedilo - spreminjanje	f
00030000-5600-1c69-11d5-a204af436b02	DogodekIzven-read	DogodekIzven - branje	f
00030000-5600-1c69-6126-35401026abc8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5600-1c69-0cf0-48be8a459396	Dogodek-read	Dogodek - branje	f
00030000-5600-1c69-2087-051cb0a38f16	Dogodek-write	Dogodek - spreminjanje	f
00030000-5600-1c69-c4d3-17eeac532934	DrugiVir-read	DrugiVir - branje	f
00030000-5600-1c69-6cfc-72505f0fb11c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5600-1c69-7d96-52216c48d608	Drzava-read	Drzava - branje	f
00030000-5600-1c69-f9d7-aa62696b5963	Drzava-write	Drzava - spreminjanje	f
00030000-5600-1c69-ea70-9e57b5f07818	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5600-1c69-309d-d30dcb6d3bc6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5600-1c69-6d0c-375f4c857116	Funkcija-read	Funkcija - branje	f
00030000-5600-1c69-c5bd-417c7f1a3eea	Funkcija-write	Funkcija - spreminjanje	f
00030000-5600-1c69-bfa4-8e0f565953e8	Gostovanje-read	Gostovanje - branje	f
00030000-5600-1c69-bb9d-3ef2e61f27db	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5600-1c69-fc41-77fd9cb31649	Gostujoca-read	Gostujoca - branje	f
00030000-5600-1c69-1de9-79a30f792b75	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5600-1c69-53bb-40cd59b79e9c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5600-1c69-3fef-0162e8647296	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5600-1c69-2ff5-df1779d031d7	Kupec-read	Kupec - branje	f
00030000-5600-1c69-2b10-ebbe11aee923	Kupec-write	Kupec - spreminjanje	f
00030000-5600-1c69-701d-cd308eaf1310	NacinPlacina-read	NacinPlacina - branje	f
00030000-5600-1c69-7157-3797812d0c30	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5600-1c69-a07b-41937a8e7f1f	Option-read	Option - branje	f
00030000-5600-1c69-2dc9-1de93d40b6c1	Option-write	Option - spreminjanje	f
00030000-5600-1c69-9d6f-e39ce7c61ca7	OptionValue-read	OptionValue - branje	f
00030000-5600-1c69-33c8-9754737c6497	OptionValue-write	OptionValue - spreminjanje	f
00030000-5600-1c69-93d0-cd123539c4df	Oseba-read	Oseba - branje	f
00030000-5600-1c69-6148-35c6fdf59bcb	Oseba-write	Oseba - spreminjanje	f
00030000-5600-1c69-d380-24f521e79a8c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5600-1c69-e665-2ec92b32c4e1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5600-1c69-92d9-f89c93890617	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5600-1c69-f3cd-917828c13bc7	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5600-1c69-71f1-f094d2c29d37	Pogodba-read	Pogodba - branje	f
00030000-5600-1c69-f572-2dd07d73d052	Pogodba-write	Pogodba - spreminjanje	f
00030000-5600-1c69-d0dc-6999e7e983d5	Popa-read	Popa - branje	f
00030000-5600-1c69-938f-a65c3f6317b3	Popa-write	Popa - spreminjanje	f
00030000-5600-1c69-f344-41d10a93bd78	Posta-read	Posta - branje	f
00030000-5600-1c69-e282-020c8fd155c9	Posta-write	Posta - spreminjanje	f
00030000-5600-1c69-009d-f29085fcce33	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5600-1c69-f258-69b4d0aaf53c	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5600-1c69-3e23-7520110187f8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5600-1c69-c077-6bc7e2b8684b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5600-1c69-1483-a3574680a6b3	PostniNaslov-read	PostniNaslov - branje	f
00030000-5600-1c69-98f5-3090da5bf9a7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5600-1c69-59cc-8b0e8a124420	Predstava-read	Predstava - branje	f
00030000-5600-1c69-f376-6664614dfc95	Predstava-write	Predstava - spreminjanje	f
00030000-5600-1c69-4221-152715b26411	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5600-1c69-bcd0-989865a9bb4f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5600-1c69-4c33-b7c4964bad9e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5600-1c69-d166-5198c706d6aa	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5600-1c69-cbb1-48190635188d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5600-1c69-92fa-dc4b61ef0242	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5600-1c69-9da6-a3b44455f6de	ProgramDela-read	ProgramDela - branje	f
00030000-5600-1c69-7f5e-bde065da1eb9	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5600-1c69-cb13-09141912a5e2	ProgramFestival-read	ProgramFestival - branje	f
00030000-5600-1c69-cc69-82eb67a081b4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5600-1c69-33ce-1d69fbb5aab7	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5600-1c69-6660-37d9d8badf1e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5600-1c69-e2ab-3eeab60e5f3b	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5600-1c69-020d-42bf9c693670	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5600-1c69-1978-043833d5d396	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5600-1c69-25f3-3f688189e21e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5600-1c69-0009-63a6be8954e7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5600-1c69-d65a-7056c53223fd	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5600-1c69-5de7-1933acd060a1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5600-1c69-7bb9-5a0bca3bdac3	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5600-1c69-0413-a553f645aa87	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5600-1c69-202e-be58f489b764	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5600-1c69-34b4-a4a6c3b2bf11	ProgramRazno-read	ProgramRazno - branje	f
00030000-5600-1c69-66f8-3964af413e82	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5600-1c69-9b6e-deec2e350720	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5600-1c69-ef12-66255d4d663f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5600-1c69-26c1-327e287a2018	Prostor-read	Prostor - branje	f
00030000-5600-1c69-5d45-ba8c68799556	Prostor-write	Prostor - spreminjanje	f
00030000-5600-1c69-bd71-6f12470aa3e4	Racun-read	Racun - branje	f
00030000-5600-1c69-d164-6fbaceb0d5cc	Racun-write	Racun - spreminjanje	f
00030000-5600-1c69-774a-5c184dc09b9e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5600-1c69-169c-7f532ea8b72c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5600-1c69-ae53-c050e60595f0	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5600-1c69-c987-9592ac0a22bd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5600-1c69-bae8-e0990886034f	Rekvizit-read	Rekvizit - branje	f
00030000-5600-1c69-1e01-616c6a0cf502	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5600-1c69-401f-e726d27fd8f9	Revizija-read	Revizija - branje	f
00030000-5600-1c69-71ef-d1efc777e968	Revizija-write	Revizija - spreminjanje	f
00030000-5600-1c69-86e4-c646de50a9c6	Rezervacija-read	Rezervacija - branje	f
00030000-5600-1c69-c19d-ff26f13d85eb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5600-1c69-4165-13829e1c08df	SedezniRed-read	SedezniRed - branje	f
00030000-5600-1c69-968f-f8a9f4d06a98	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5600-1c69-6ff8-03bac3946a79	Sedez-read	Sedez - branje	f
00030000-5600-1c69-d0ff-2e3309c1e5f2	Sedez-write	Sedez - spreminjanje	f
00030000-5600-1c69-e385-976634ab8169	Sezona-read	Sezona - branje	f
00030000-5600-1c69-3f4d-2ea6781e7adf	Sezona-write	Sezona - spreminjanje	f
00030000-5600-1c69-47b4-43a399a7354a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5600-1c69-b148-7fff0b5b2080	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5600-1c69-4125-95f0d12d6f10	Stevilcenje-read	Stevilcenje - branje	f
00030000-5600-1c69-f17d-9f2df7b65d75	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5600-1c69-ac93-95af9e2a7134	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5600-1c69-ba3f-20c7900dad76	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5600-1c69-729e-63bb7bdcf39e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5600-1c69-af0e-c73e802a9643	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5600-1c69-03d7-66e255faabb1	Telefonska-read	Telefonska - branje	f
00030000-5600-1c69-ecaf-dab810e65832	Telefonska-write	Telefonska - spreminjanje	f
00030000-5600-1c69-d252-b1bb2b554fef	TerminStoritve-read	TerminStoritve - branje	f
00030000-5600-1c69-bb09-790ca8c4fc03	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5600-1c69-d587-7785cc96b54e	TipFunkcije-read	TipFunkcije - branje	f
00030000-5600-1c69-2ecc-e12c68b4419a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5600-1c69-1d18-3d92b88b7d90	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5600-1c69-3446-0f1065a6883a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5600-1c69-f8d1-7c147fe7c1bb	Trr-read	Trr - branje	f
00030000-5600-1c69-b193-eeca2c8e47f9	Trr-write	Trr - spreminjanje	f
00030000-5600-1c69-5483-f640902723cd	Uprizoritev-read	Uprizoritev - branje	f
00030000-5600-1c69-dec0-09a76dd8fe94	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5600-1c69-924a-f92574b8e254	Vaja-read	Vaja - branje	f
00030000-5600-1c69-b192-bd8b8d081af1	Vaja-write	Vaja - spreminjanje	f
00030000-5600-1c69-1493-1b88265d3d69	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5600-1c69-9826-3f28e24f2a18	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5600-1c69-5204-404ae82674c9	VrstaStroska-read	VrstaStroska - branje	f
00030000-5600-1c69-68b6-ba0b3384af89	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5600-1c69-b65e-7d2d75ef4b76	Zaposlitev-read	Zaposlitev - branje	f
00030000-5600-1c69-506b-40d8f7799951	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5600-1c69-afdb-11c6bb91b136	Zasedenost-read	Zasedenost - branje	f
00030000-5600-1c69-3a38-5e9648eed5a4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5600-1c69-bbeb-e0e0bbf0c3f4	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5600-1c69-c397-4cdb5d0e942f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5600-1c69-4423-8c62fe4e94aa	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5600-1c69-87d0-7d0acdeda8a2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5600-1c69-a75d-69aa740c7f82	Job-read	Branje opravil - samo zase - branje	f
00030000-5600-1c69-1535-5413edd54b0f	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5600-1c69-45cb-6a3bde5f8353	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5600-1c69-c5b3-3daee57952c6	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5600-1c69-62dc-4ddaed829a4a	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5600-1c69-1dad-cc7a645fb208	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5600-1c69-7ad4-986c403e7d7b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5600-1c69-91fa-7a4f4539a14b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5600-1c69-fb47-056fc44c6147	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5600-1c69-b26d-6c260def1118	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5600-1c69-ba7d-edc66c449ea4	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5600-1c69-3c62-a325204cf071	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5600-1c69-f148-fd8416d6765b	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5600-1c69-33a6-a5860600e39c	Datoteka-write	Datoteka - spreminjanje	f
00030000-5600-1c69-3e68-f252b77b9a5c	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2971 (class 0 OID 20349957)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5600-1c6a-9d4f-49355c000c7a	00030000-5600-1c69-5095-a23022a0b603
00020000-5600-1c6a-aa5f-af59e0dad20e	00030000-5600-1c69-7d96-52216c48d608
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-ee7d-032c4b38c7e6
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-77c4-2fdc5fef5722
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-89ff-fb00220d5558
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-3c8e-8fad082e899f
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-3a0e-d83f0d0c38a3
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-0cf0-48be8a459396
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-d25a-b1521cf2f16f
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-2087-051cb0a38f16
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-7d96-52216c48d608
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-f9d7-aa62696b5963
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-6d0c-375f4c857116
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-c5bd-417c7f1a3eea
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-bfa4-8e0f565953e8
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-bb9d-3ef2e61f27db
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-fc41-77fd9cb31649
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-1de9-79a30f792b75
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-53bb-40cd59b79e9c
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-3fef-0162e8647296
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-a07b-41937a8e7f1f
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-9d6f-e39ce7c61ca7
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-93d0-cd123539c4df
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-6148-35c6fdf59bcb
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-d0dc-6999e7e983d5
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-938f-a65c3f6317b3
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-f344-41d10a93bd78
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-e282-020c8fd155c9
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-1483-a3574680a6b3
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-98f5-3090da5bf9a7
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-59cc-8b0e8a124420
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-f376-6664614dfc95
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-cbb1-48190635188d
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-92fa-dc4b61ef0242
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-26c1-327e287a2018
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-5d45-ba8c68799556
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-ae53-c050e60595f0
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-c987-9592ac0a22bd
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-bae8-e0990886034f
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-1e01-616c6a0cf502
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-e385-976634ab8169
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-3f4d-2ea6781e7adf
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-d587-7785cc96b54e
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-5483-f640902723cd
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-dec0-09a76dd8fe94
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-924a-f92574b8e254
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-b192-bd8b8d081af1
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-afdb-11c6bb91b136
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-3a38-5e9648eed5a4
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-bbeb-e0e0bbf0c3f4
00020000-5600-1c6a-d4a4-59217b7f17a1	00030000-5600-1c69-4423-8c62fe4e94aa
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-ee7d-032c4b38c7e6
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-3a0e-d83f0d0c38a3
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-0cf0-48be8a459396
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-7d96-52216c48d608
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-bfa4-8e0f565953e8
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-fc41-77fd9cb31649
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-53bb-40cd59b79e9c
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-3fef-0162e8647296
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-a07b-41937a8e7f1f
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-9d6f-e39ce7c61ca7
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-93d0-cd123539c4df
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-6148-35c6fdf59bcb
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-d0dc-6999e7e983d5
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-f344-41d10a93bd78
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-1483-a3574680a6b3
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-98f5-3090da5bf9a7
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-59cc-8b0e8a124420
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-26c1-327e287a2018
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-ae53-c050e60595f0
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-bae8-e0990886034f
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-e385-976634ab8169
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-03d7-66e255faabb1
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-ecaf-dab810e65832
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-f8d1-7c147fe7c1bb
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-b193-eeca2c8e47f9
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-b65e-7d2d75ef4b76
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-506b-40d8f7799951
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-bbeb-e0e0bbf0c3f4
00020000-5600-1c6a-44d1-43be922a7341	00030000-5600-1c69-4423-8c62fe4e94aa
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-ee7d-032c4b38c7e6
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-89ff-fb00220d5558
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-3a0e-d83f0d0c38a3
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-d00a-0cdd91bb053c
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-f679-bf47ff11b083
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-11d5-a204af436b02
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-0cf0-48be8a459396
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-7d96-52216c48d608
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-6d0c-375f4c857116
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-bfa4-8e0f565953e8
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-fc41-77fd9cb31649
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-53bb-40cd59b79e9c
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-a07b-41937a8e7f1f
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-9d6f-e39ce7c61ca7
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-93d0-cd123539c4df
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-d0dc-6999e7e983d5
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-f344-41d10a93bd78
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-59cc-8b0e8a124420
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-cbb1-48190635188d
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-26c1-327e287a2018
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-ae53-c050e60595f0
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-bae8-e0990886034f
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-e385-976634ab8169
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-d587-7785cc96b54e
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-924a-f92574b8e254
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-afdb-11c6bb91b136
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-bbeb-e0e0bbf0c3f4
00020000-5600-1c6a-899d-56f827bd3bb0	00030000-5600-1c69-4423-8c62fe4e94aa
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-ee7d-032c4b38c7e6
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-77c4-2fdc5fef5722
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-3c8e-8fad082e899f
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-3a0e-d83f0d0c38a3
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-0cf0-48be8a459396
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-7d96-52216c48d608
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-bfa4-8e0f565953e8
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-fc41-77fd9cb31649
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-a07b-41937a8e7f1f
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-9d6f-e39ce7c61ca7
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-d0dc-6999e7e983d5
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-f344-41d10a93bd78
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-59cc-8b0e8a124420
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-26c1-327e287a2018
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-ae53-c050e60595f0
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-bae8-e0990886034f
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-e385-976634ab8169
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-d587-7785cc96b54e
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-bbeb-e0e0bbf0c3f4
00020000-5600-1c6a-8397-43e4d8bf4969	00030000-5600-1c69-4423-8c62fe4e94aa
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-ee7d-032c4b38c7e6
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-3a0e-d83f0d0c38a3
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-0cf0-48be8a459396
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-7d96-52216c48d608
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-bfa4-8e0f565953e8
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-fc41-77fd9cb31649
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-a07b-41937a8e7f1f
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-9d6f-e39ce7c61ca7
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-d0dc-6999e7e983d5
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-f344-41d10a93bd78
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-59cc-8b0e8a124420
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-26c1-327e287a2018
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-ae53-c050e60595f0
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-bae8-e0990886034f
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-e385-976634ab8169
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-d252-b1bb2b554fef
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-1ffe-991ff564a6c2
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-d587-7785cc96b54e
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-bbeb-e0e0bbf0c3f4
00020000-5600-1c6a-e6db-ec3c41261444	00030000-5600-1c69-4423-8c62fe4e94aa
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-21c2-0aed773fcd73
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-5095-a23022a0b603
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-1ffe-991ff564a6c2
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d25a-b1521cf2f16f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-0832-06bebf9aa65c
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-86de-9def22886e47
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bc21-6b3217222b8f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-ee7d-032c4b38c7e6
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-77c4-2fdc5fef5722
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-89ff-fb00220d5558
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-3c8e-8fad082e899f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-3a0e-d83f0d0c38a3
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d00a-0cdd91bb053c
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f679-bf47ff11b083
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-fd14-92d3bc8ee648
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-11d5-a204af436b02
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-6126-35401026abc8
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-0cf0-48be8a459396
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-2087-051cb0a38f16
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-7d96-52216c48d608
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f9d7-aa62696b5963
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-c4d3-17eeac532934
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-6cfc-72505f0fb11c
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-ea70-9e57b5f07818
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-309d-d30dcb6d3bc6
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-6d0c-375f4c857116
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-c5bd-417c7f1a3eea
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bfa4-8e0f565953e8
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bb9d-3ef2e61f27db
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-fc41-77fd9cb31649
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-1de9-79a30f792b75
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-53bb-40cd59b79e9c
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-3fef-0162e8647296
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-2ff5-df1779d031d7
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-2b10-ebbe11aee923
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-701d-cd308eaf1310
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-7157-3797812d0c30
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-a07b-41937a8e7f1f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-2dc9-1de93d40b6c1
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-9d6f-e39ce7c61ca7
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-33c8-9754737c6497
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-93d0-cd123539c4df
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-6148-35c6fdf59bcb
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d380-24f521e79a8c
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-e665-2ec92b32c4e1
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-92d9-f89c93890617
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f3cd-917828c13bc7
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-71f1-f094d2c29d37
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f572-2dd07d73d052
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d0dc-6999e7e983d5
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-938f-a65c3f6317b3
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f344-41d10a93bd78
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-e282-020c8fd155c9
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-009d-f29085fcce33
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f258-69b4d0aaf53c
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-3e23-7520110187f8
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-c077-6bc7e2b8684b
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-1483-a3574680a6b3
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-98f5-3090da5bf9a7
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-59cc-8b0e8a124420
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f376-6664614dfc95
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-4221-152715b26411
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bcd0-989865a9bb4f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-4c33-b7c4964bad9e
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d166-5198c706d6aa
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-cbb1-48190635188d
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-92fa-dc4b61ef0242
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-9da6-a3b44455f6de
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-7f5e-bde065da1eb9
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-cb13-09141912a5e2
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-cc69-82eb67a081b4
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-33ce-1d69fbb5aab7
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-6660-37d9d8badf1e
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-e2ab-3eeab60e5f3b
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-020d-42bf9c693670
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-1978-043833d5d396
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-25f3-3f688189e21e
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-0009-63a6be8954e7
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d65a-7056c53223fd
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-5de7-1933acd060a1
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-7bb9-5a0bca3bdac3
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-0413-a553f645aa87
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-202e-be58f489b764
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-34b4-a4a6c3b2bf11
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-66f8-3964af413e82
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-9b6e-deec2e350720
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-ef12-66255d4d663f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-26c1-327e287a2018
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-5d45-ba8c68799556
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bd71-6f12470aa3e4
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d164-6fbaceb0d5cc
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-774a-5c184dc09b9e
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-169c-7f532ea8b72c
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-ae53-c050e60595f0
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-c987-9592ac0a22bd
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bae8-e0990886034f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-1e01-616c6a0cf502
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-401f-e726d27fd8f9
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-71ef-d1efc777e968
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-86e4-c646de50a9c6
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-c19d-ff26f13d85eb
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-4165-13829e1c08df
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-968f-f8a9f4d06a98
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-6ff8-03bac3946a79
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d0ff-2e3309c1e5f2
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-e385-976634ab8169
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-3f4d-2ea6781e7adf
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-47b4-43a399a7354a
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-b148-7fff0b5b2080
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-4125-95f0d12d6f10
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f17d-9f2df7b65d75
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-ac93-95af9e2a7134
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-ba3f-20c7900dad76
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-729e-63bb7bdcf39e
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-af0e-c73e802a9643
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-03d7-66e255faabb1
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-ecaf-dab810e65832
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d252-b1bb2b554fef
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bb09-790ca8c4fc03
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-d587-7785cc96b54e
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-2ecc-e12c68b4419a
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-1d18-3d92b88b7d90
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-3446-0f1065a6883a
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-f8d1-7c147fe7c1bb
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-b193-eeca2c8e47f9
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-5483-f640902723cd
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-dec0-09a76dd8fe94
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-924a-f92574b8e254
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-b192-bd8b8d081af1
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-1493-1b88265d3d69
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-9826-3f28e24f2a18
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-5204-404ae82674c9
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-68b6-ba0b3384af89
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-b65e-7d2d75ef4b76
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-506b-40d8f7799951
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-afdb-11c6bb91b136
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-3a38-5e9648eed5a4
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-bbeb-e0e0bbf0c3f4
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-c397-4cdb5d0e942f
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-4423-8c62fe4e94aa
00020000-5600-1c6b-2e32-5fc938d83cc9	00030000-5600-1c69-87d0-7d0acdeda8a2
\.


--
-- TOC entry 3000 (class 0 OID 20350282)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20350316)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20350450)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5600-1c6b-a499-6f3263638189	00090000-5600-1c6b-7a64-a821e2655459	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-5600-1c6b-5b06-92500c601a4b	00090000-5600-1c6b-36d8-7b67d45c847a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-5600-1c6b-7926-5b31c18f5df3	00090000-5600-1c6b-0d1a-50b50b30d06b	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-5600-1c6b-f8fe-e0e46e255093	00090000-5600-1c6b-3076-744908d6a8dc	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2976 (class 0 OID 20350017)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5600-1c6a-b66b-461062474815	00040000-5600-1c69-0a0b-f21d60ea00c3	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6a-d40c-81a5eb58cc6d	00040000-5600-1c69-0a0b-f21d60ea00c3	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5600-1c6a-5856-1bf4ca7af969	00040000-5600-1c69-0a0b-f21d60ea00c3	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6a-4893-486056a04858	00040000-5600-1c69-0a0b-f21d60ea00c3	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6a-1fec-f0f8cb5c7bdf	00040000-5600-1c69-0a0b-f21d60ea00c3	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6a-d60f-292ac56e6e63	00040000-5600-1c69-e55b-4b4cfe7fbded	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6a-9aaa-67aac8cb0417	00040000-5600-1c69-72c2-acadfa6734c4	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6a-8dd0-44bb2af8751e	00040000-5600-1c69-d680-f6aeaeec05f7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6a-a8a4-89254d172b04	00040000-5600-1c69-3881-71c0ac0c94c2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5600-1c6c-2cc9-646d1b0f9949	00040000-5600-1c69-0a0b-f21d60ea00c3	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2978 (class 0 OID 20350051)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5600-1c69-8e69-c2ecff1cfffd	8341	Adlešiči
00050000-5600-1c69-321b-d8ba45e791c0	5270	Ajdovščina
00050000-5600-1c69-e280-ebf021a932a4	6280	Ankaran/Ancarano
00050000-5600-1c69-e6aa-4d8493e04a2c	9253	Apače
00050000-5600-1c69-f089-9b15c127a109	8253	Artiče
00050000-5600-1c69-a840-3500d3925d4d	4275	Begunje na Gorenjskem
00050000-5600-1c69-e9ec-a83a35776e21	1382	Begunje pri Cerknici
00050000-5600-1c69-600d-0b9d95121447	9231	Beltinci
00050000-5600-1c69-ce96-9aa63c3135c6	2234	Benedikt
00050000-5600-1c69-df02-f83d35b9dd90	2345	Bistrica ob Dravi
00050000-5600-1c69-8654-133fea878800	3256	Bistrica ob Sotli
00050000-5600-1c69-d4e3-b63cd81a4ac9	8259	Bizeljsko
00050000-5600-1c69-fef2-34d5e937d38b	1223	Blagovica
00050000-5600-1c69-3519-33c45d38f64c	8283	Blanca
00050000-5600-1c69-9d59-c5a8092e3b9f	4260	Bled
00050000-5600-1c69-acd3-31df0543baf7	4273	Blejska Dobrava
00050000-5600-1c69-ea75-72072ad575ac	9265	Bodonci
00050000-5600-1c69-f14d-8ebd0bf96260	9222	Bogojina
00050000-5600-1c69-21d7-b5043aa310d1	4263	Bohinjska Bela
00050000-5600-1c69-28dc-6500d5d64d25	4264	Bohinjska Bistrica
00050000-5600-1c69-f164-af8c8593a323	4265	Bohinjsko jezero
00050000-5600-1c69-8c7e-a4991927ae3a	1353	Borovnica
00050000-5600-1c69-1321-2ed0c1d07cfb	8294	Boštanj
00050000-5600-1c69-7829-b062f41fef1e	5230	Bovec
00050000-5600-1c69-4383-e20e98e777ec	5295	Branik
00050000-5600-1c69-f9b0-f8356b86db16	3314	Braslovče
00050000-5600-1c69-d9ab-d9655a99f1bd	5223	Breginj
00050000-5600-1c69-f740-cd1e7def6e61	8280	Brestanica
00050000-5600-1c69-85a4-752f67dc6aa2	2354	Bresternica
00050000-5600-1c69-bec7-1ed759a73234	4243	Brezje
00050000-5600-1c69-c18d-52d5027559cc	1351	Brezovica pri Ljubljani
00050000-5600-1c69-b80c-880417f30d2a	8250	Brežice
00050000-5600-1c69-e78e-be264d3b7fb8	4210	Brnik - Aerodrom
00050000-5600-1c69-960c-92aa697c4948	8321	Brusnice
00050000-5600-1c69-686d-afab4aa95a4c	3255	Buče
00050000-5600-1c69-927e-1981576ae955	8276	Bučka 
00050000-5600-1c69-ce3a-87d15e845190	9261	Cankova
00050000-5600-1c69-1a99-3a4de8058820	3000	Celje 
00050000-5600-1c69-b604-a9c89a30634a	3001	Celje - poštni predali
00050000-5600-1c69-65fb-04971b1a190f	4207	Cerklje na Gorenjskem
00050000-5600-1c69-f06c-7b2114ee808b	8263	Cerklje ob Krki
00050000-5600-1c69-6fff-8da8fccfa71a	1380	Cerknica
00050000-5600-1c69-3b1f-559ec264d3fa	5282	Cerkno
00050000-5600-1c69-c9e9-5b9cf85c8f41	2236	Cerkvenjak
00050000-5600-1c69-baf1-b320dafa27e7	2215	Ceršak
00050000-5600-1c69-2500-71eee5964e8b	2326	Cirkovce
00050000-5600-1c69-36d7-0f56b4899045	2282	Cirkulane
00050000-5600-1c69-3d69-a1bc0e25e934	5273	Col
00050000-5600-1c69-965e-37dcd4bb0ae5	8251	Čatež ob Savi
00050000-5600-1c69-5385-24d20d6b373c	1413	Čemšenik
00050000-5600-1c69-82c4-85994c92d476	5253	Čepovan
00050000-5600-1c69-23bf-b7ff1c6e4733	9232	Črenšovci
00050000-5600-1c69-699f-475d8cf115b4	2393	Črna na Koroškem
00050000-5600-1c69-23b3-4dccdbb12744	6275	Črni Kal
00050000-5600-1c69-6689-bd68f3f69a0d	5274	Črni Vrh nad Idrijo
00050000-5600-1c69-3187-0a8c4b247bb2	5262	Črniče
00050000-5600-1c69-cb0b-fb49c6f5696a	8340	Črnomelj
00050000-5600-1c69-2512-317e0b06c50a	6271	Dekani
00050000-5600-1c69-f58b-219bbec7f862	5210	Deskle
00050000-5600-1c69-830f-e94ebe99c59d	2253	Destrnik
00050000-5600-1c69-35a2-335ee362593a	6215	Divača
00050000-5600-1c69-14ff-57d0611e1a35	1233	Dob
00050000-5600-1c69-252e-12cfacfed118	3224	Dobje pri Planini
00050000-5600-1c69-b13c-8c79b635638b	8257	Dobova
00050000-5600-1c69-240e-ed9c8b20050d	1423	Dobovec
00050000-5600-1c69-1d5e-4294fc9ddd68	5263	Dobravlje
00050000-5600-1c69-1bbe-edbe4872ab4c	3204	Dobrna
00050000-5600-1c69-50e3-7c17ae84e2af	8211	Dobrnič
00050000-5600-1c69-5d2e-f4c3ced8d122	1356	Dobrova
00050000-5600-1c69-cc6c-9bfd6ddb6bf9	9223	Dobrovnik/Dobronak 
00050000-5600-1c69-ceb6-32ac3a55b73b	5212	Dobrovo v Brdih
00050000-5600-1c69-ff42-dcaca3169356	1431	Dol pri Hrastniku
00050000-5600-1c69-d0ae-a8b8a466621a	1262	Dol pri Ljubljani
00050000-5600-1c69-9730-a90890c41054	1273	Dole pri Litiji
00050000-5600-1c69-df0f-ea2bea2761de	1331	Dolenja vas
00050000-5600-1c69-f20b-6d2bba1251c9	8350	Dolenjske Toplice
00050000-5600-1c69-b5f8-adb0c0887685	1230	Domžale
00050000-5600-1c69-9fc6-6f5d1a48ea9f	2252	Dornava
00050000-5600-1c69-63b9-7a946863928d	5294	Dornberk
00050000-5600-1c69-bb3c-24eea73ab78e	1319	Draga
00050000-5600-1c69-597c-83081ae5acad	8343	Dragatuš
00050000-5600-1c69-2d5f-c06f2f911076	3222	Dramlje
00050000-5600-1c69-d07d-992b3cf77cbf	2370	Dravograd
00050000-5600-1c69-7a36-95daadd9c1c6	4203	Duplje
00050000-5600-1c69-214e-8ce86fb6733d	6221	Dutovlje
00050000-5600-1c69-4ec8-5c931d497a51	8361	Dvor
00050000-5600-1c69-9c10-2f369757e547	2343	Fala
00050000-5600-1c69-8481-b4f06e79aa7b	9208	Fokovci
00050000-5600-1c69-b2da-2f08bfc467db	2313	Fram
00050000-5600-1c69-51b5-0a9bd424e937	3213	Frankolovo
00050000-5600-1c69-60f5-4e2105c34f06	1274	Gabrovka
00050000-5600-1c69-fdcf-1a31ae463271	8254	Globoko
00050000-5600-1c69-c7ce-1144da457817	5275	Godovič
00050000-5600-1c69-2db2-898915e0e21d	4204	Golnik
00050000-5600-1c69-d4f3-73a77ffbb355	3303	Gomilsko
00050000-5600-1c69-9ca1-8b04850de406	4224	Gorenja vas
00050000-5600-1c69-14b6-9ec8b5ebde70	3263	Gorica pri Slivnici
00050000-5600-1c69-bea0-9ac808391c2e	2272	Gorišnica
00050000-5600-1c69-07d2-53b3aef438ba	9250	Gornja Radgona
00050000-5600-1c69-f0fe-ab8ee3124a53	3342	Gornji Grad
00050000-5600-1c69-7dfd-768328ef96e2	4282	Gozd Martuljek
00050000-5600-1c69-70fc-f89eadfb60e9	6272	Gračišče
00050000-5600-1c69-aace-684313d7191d	9264	Grad
00050000-5600-1c69-d00e-4bcb1d6673f8	8332	Gradac
00050000-5600-1c69-5cad-19b0881f96fc	1384	Grahovo
00050000-5600-1c69-f4a8-55bb02df16fc	5242	Grahovo ob Bači
00050000-5600-1c69-f08d-de6bd6f8554c	5251	Grgar
00050000-5600-1c69-39b1-26dc1611c49e	3302	Griže
00050000-5600-1c69-1dcb-faffc8261ff2	3231	Grobelno
00050000-5600-1c69-7608-bd44ab2c4a8e	1290	Grosuplje
00050000-5600-1c69-cec0-c21fb6b97ddf	2288	Hajdina
00050000-5600-1c69-0ede-2c832bfd16c8	8362	Hinje
00050000-5600-1c69-38ff-dbdb0d9fa3c1	2311	Hoče
00050000-5600-1c69-d399-f77bf78aaf06	9205	Hodoš/Hodos
00050000-5600-1c69-1233-313d5f58393c	1354	Horjul
00050000-5600-1c69-1433-14b16a5809a1	1372	Hotedršica
00050000-5600-1c69-52a6-1c807bff9805	1430	Hrastnik
00050000-5600-1c69-4204-3099a7273ea3	6225	Hruševje
00050000-5600-1c69-3a9b-5ef009491e81	4276	Hrušica
00050000-5600-1c69-c33e-a27e1eea08a8	5280	Idrija
00050000-5600-1c69-90e3-f313facc4221	1292	Ig
00050000-5600-1c69-5ebb-11cef31ca994	6250	Ilirska Bistrica
00050000-5600-1c69-8a40-9c42c607aece	6251	Ilirska Bistrica-Trnovo
00050000-5600-1c69-6e5b-3882507fdad6	1295	Ivančna Gorica
00050000-5600-1c69-d0f1-369c50199c20	2259	Ivanjkovci
00050000-5600-1c69-765d-957ab2def257	1411	Izlake
00050000-5600-1c69-0b11-d39a9ac0541e	6310	Izola/Isola
00050000-5600-1c69-58ff-c8b09f872ef7	2222	Jakobski Dol
00050000-5600-1c69-026c-532876716c02	2221	Jarenina
00050000-5600-1c69-5c60-c5a633520bdf	6254	Jelšane
00050000-5600-1c69-481e-82f9d7c2414a	4270	Jesenice
00050000-5600-1c69-4913-4d25ba73c45a	8261	Jesenice na Dolenjskem
00050000-5600-1c69-9e0c-c9cddc6286af	3273	Jurklošter
00050000-5600-1c69-bb5d-61d8e9480f89	2223	Jurovski Dol
00050000-5600-1c69-4154-acf57bf0de99	2256	Juršinci
00050000-5600-1c69-6b9f-7ba3033b3741	5214	Kal nad Kanalom
00050000-5600-1c69-99cd-48ee91303a3a	3233	Kalobje
00050000-5600-1c69-b78b-9e3485d3935a	4246	Kamna Gorica
00050000-5600-1c69-d448-769e79b9eb69	2351	Kamnica
00050000-5600-1c69-1b94-1d4fca63f3ed	1241	Kamnik
00050000-5600-1c69-31bd-687d29308965	5213	Kanal
00050000-5600-1c69-bc0d-9adc68bfbac5	8258	Kapele
00050000-5600-1c69-e00e-b549d71d3e94	2362	Kapla
00050000-5600-1c69-408f-89d9943ebe6d	2325	Kidričevo
00050000-5600-1c69-7535-522354a90359	1412	Kisovec
00050000-5600-1c69-483c-a7a8064a7ad2	6253	Knežak
00050000-5600-1c69-dde0-2690dd2da377	5222	Kobarid
00050000-5600-1c69-5b51-37680bd7f6b4	9227	Kobilje
00050000-5600-1c69-36d2-9cfa02119226	1330	Kočevje
00050000-5600-1c69-10cc-55ff233a5ed0	1338	Kočevska Reka
00050000-5600-1c69-b15a-a731a19dd6a1	2276	Kog
00050000-5600-1c69-6589-3ae0f76796d5	5211	Kojsko
00050000-5600-1c69-cf59-737512d42b4a	6223	Komen
00050000-5600-1c69-36ef-ec47df189449	1218	Komenda
00050000-5600-1c69-d95b-21e3293b8bce	6000	Koper/Capodistria 
00050000-5600-1c69-29ea-f375240ad373	6001	Koper/Capodistria - poštni predali
00050000-5600-1c69-8e52-f6715eb7eed0	8282	Koprivnica
00050000-5600-1c69-cd47-f6cb5a618a37	5296	Kostanjevica na Krasu
00050000-5600-1c69-456e-7bf32d4a30c6	8311	Kostanjevica na Krki
00050000-5600-1c69-dc63-55ee32c831e7	1336	Kostel
00050000-5600-1c69-f31e-2d5de7b14167	6256	Košana
00050000-5600-1c69-4394-b32742f696d4	2394	Kotlje
00050000-5600-1c69-b8cb-b321388d2202	6240	Kozina
00050000-5600-1c69-23e9-377d8f790714	3260	Kozje
00050000-5600-1c69-fe1b-bb38eb7bb486	4000	Kranj 
00050000-5600-1c69-8fd1-77bf30ea5cd1	4001	Kranj - poštni predali
00050000-5600-1c69-415a-12a333fd2257	4280	Kranjska Gora
00050000-5600-1c69-523b-29febeb5b4d2	1281	Kresnice
00050000-5600-1c69-d717-8a609368739b	4294	Križe
00050000-5600-1c69-c48c-d2474af93869	9206	Križevci
00050000-5600-1c69-8984-885d184eab44	9242	Križevci pri Ljutomeru
00050000-5600-1c69-b311-3e823c1bbe24	1301	Krka
00050000-5600-1c69-e813-5b4d7a3a7284	8296	Krmelj
00050000-5600-1c69-2757-c39a38ed7923	4245	Kropa
00050000-5600-1c69-dba4-663a9c3e2844	8262	Krška vas
00050000-5600-1c69-a4dc-e470fa4e4bed	8270	Krško
00050000-5600-1c69-d298-05471c919597	9263	Kuzma
00050000-5600-1c69-59c1-a7275880e72f	2318	Laporje
00050000-5600-1c69-f2aa-ea9fc2bb71be	3270	Laško
00050000-5600-1c69-2712-cb60700b7d58	1219	Laze v Tuhinju
00050000-5600-1c69-05b1-358d419361fe	2230	Lenart v Slovenskih goricah
00050000-5600-1c69-5b6b-ad23a8c8eca8	9220	Lendava/Lendva
00050000-5600-1c69-95f1-fa8535b4a6c3	4248	Lesce
00050000-5600-1c69-c424-93e16d59beb2	3261	Lesično
00050000-5600-1c69-21ce-346aae78ed90	8273	Leskovec pri Krškem
00050000-5600-1c69-ff26-779433c5abdd	2372	Libeliče
00050000-5600-1c69-fc1a-10840aa0c343	2341	Limbuš
00050000-5600-1c69-143e-69fd4f7103b0	1270	Litija
00050000-5600-1c69-c7ad-cddfbd7158a6	3202	Ljubečna
00050000-5600-1c69-52cd-42d08bf0c59f	1000	Ljubljana 
00050000-5600-1c69-71d6-aea0f6284ca5	1001	Ljubljana - poštni predali
00050000-5600-1c69-f929-bf82d599f468	1231	Ljubljana - Črnuče
00050000-5600-1c69-d8b3-7bc24962fdd7	1261	Ljubljana - Dobrunje
00050000-5600-1c69-4c31-0548ca9f6905	1260	Ljubljana - Polje
00050000-5600-1c69-c22b-78a5925eb3be	1210	Ljubljana - Šentvid
00050000-5600-1c69-f81e-da4119144e49	1211	Ljubljana - Šmartno
00050000-5600-1c69-4547-2d6b12501b6c	3333	Ljubno ob Savinji
00050000-5600-1c69-9c80-6b3569701e6f	9240	Ljutomer
00050000-5600-1c69-9312-99467aff787f	3215	Loče
00050000-5600-1c69-bec5-1fdf98ab82bf	5231	Log pod Mangartom
00050000-5600-1c69-eb2c-d459dadfa1c1	1358	Log pri Brezovici
00050000-5600-1c69-0979-cfd8faa97db1	1370	Logatec
00050000-5600-1c69-e24d-6e9fe07beaaa	1371	Logatec
00050000-5600-1c69-a570-24ec5fed19ee	1434	Loka pri Zidanem Mostu
00050000-5600-1c69-6a75-fb1d7454ce02	3223	Loka pri Žusmu
00050000-5600-1c69-6d48-e07e9735520e	6219	Lokev
00050000-5600-1c69-565c-a48c252950fd	1318	Loški Potok
00050000-5600-1c69-49e7-69855d75fb10	2324	Lovrenc na Dravskem polju
00050000-5600-1c69-ae16-d8ed19545265	2344	Lovrenc na Pohorju
00050000-5600-1c69-2ff9-f3662dbf6742	3334	Luče
00050000-5600-1c69-6bed-9ef46130d9b7	1225	Lukovica
00050000-5600-1c69-1778-9f8339f81de0	9202	Mačkovci
00050000-5600-1c69-eaa9-96d9d3138bfd	2322	Majšperk
00050000-5600-1c69-5bc9-596e56d1f696	2321	Makole
00050000-5600-1c69-9d7b-844e15ae06f6	9243	Mala Nedelja
00050000-5600-1c69-979f-7f2e7b7768a3	2229	Malečnik
00050000-5600-1c69-1d1e-5674bf1bd888	6273	Marezige
00050000-5600-1c69-b59d-e94a9cda235b	2000	Maribor 
00050000-5600-1c69-cd74-e8866ec60e1e	2001	Maribor - poštni predali
00050000-5600-1c69-8ccb-3d1d43dad439	2206	Marjeta na Dravskem polju
00050000-5600-1c69-6f00-e6f178240365	2281	Markovci
00050000-5600-1c69-42cd-b5063f9e69d4	9221	Martjanci
00050000-5600-1c69-706c-db6bf65a3f07	6242	Materija
00050000-5600-1c69-7a46-7194777a1435	4211	Mavčiče
00050000-5600-1c69-f184-5b09cad61ab3	1215	Medvode
00050000-5600-1c69-a670-def3b9fc5026	1234	Mengeš
00050000-5600-1c69-87a3-5be9827908d7	8330	Metlika
00050000-5600-1c69-f22f-74da49291396	2392	Mežica
00050000-5600-1c69-463d-baf5fdebea44	2204	Miklavž na Dravskem polju
00050000-5600-1c69-44ac-32bb666022b1	2275	Miklavž pri Ormožu
00050000-5600-1c69-6d35-75eda8c582f1	5291	Miren
00050000-5600-1c69-4417-2337b0630799	8233	Mirna
00050000-5600-1c69-5d2e-90b42f423acd	8216	Mirna Peč
00050000-5600-1c69-6b95-c890a9b9e06c	2382	Mislinja
00050000-5600-1c69-2406-30077e1aba5c	4281	Mojstrana
00050000-5600-1c69-d74c-895e7e5686f9	8230	Mokronog
00050000-5600-1c69-16ff-8b90188019e3	1251	Moravče
00050000-5600-1c69-17d5-875ae34b4a21	9226	Moravske Toplice
00050000-5600-1c69-2b19-ea6598653341	5216	Most na Soči
00050000-5600-1c69-6418-d9c9c212892d	1221	Motnik
00050000-5600-1c69-448f-c977ba054bc2	3330	Mozirje
00050000-5600-1c69-63a8-cbe1ee683846	9000	Murska Sobota 
00050000-5600-1c69-16b3-2c260767dd2e	9001	Murska Sobota - poštni predali
00050000-5600-1c69-8205-f03cc4021ba5	2366	Muta
00050000-5600-1c69-b971-dc831e5a519f	4202	Naklo
00050000-5600-1c69-aa96-00636c9acce7	3331	Nazarje
00050000-5600-1c69-c804-9dd80457684d	1357	Notranje Gorice
00050000-5600-1c69-79d7-148200e7168d	3203	Nova Cerkev
00050000-5600-1c69-ed6e-535f9f417df9	5000	Nova Gorica 
00050000-5600-1c69-83f0-8d5fc69b958f	5001	Nova Gorica - poštni predali
00050000-5600-1c69-e885-7e2217b46d45	1385	Nova vas
00050000-5600-1c69-b188-64b6286330af	8000	Novo mesto
00050000-5600-1c69-46d1-5fe9247ceca2	8001	Novo mesto - poštni predali
00050000-5600-1c69-1084-f9594a3b2677	6243	Obrov
00050000-5600-1c69-4c5d-e8516250a57a	9233	Odranci
00050000-5600-1c69-22fe-f5e43a22f8c7	2317	Oplotnica
00050000-5600-1c69-d767-152f6086cb99	2312	Orehova vas
00050000-5600-1c69-618b-6c58248e8107	2270	Ormož
00050000-5600-1c69-41c0-741b6c2479ff	1316	Ortnek
00050000-5600-1c69-d11a-da0fa13aaacf	1337	Osilnica
00050000-5600-1c69-070f-b5447b0d0199	8222	Otočec
00050000-5600-1c69-f179-dd3c02aca4fa	2361	Ožbalt
00050000-5600-1c69-ca5f-1be49be3bcc9	2231	Pernica
00050000-5600-1c69-1adb-921e43b370c8	2211	Pesnica pri Mariboru
00050000-5600-1c69-ef91-017038be4905	9203	Petrovci
00050000-5600-1c69-e336-f7a1bc1f0c52	3301	Petrovče
00050000-5600-1c69-8804-f86fe9726f81	6330	Piran/Pirano
00050000-5600-1c69-3979-d60ba0f4c849	8255	Pišece
00050000-5600-1c69-f834-ee8e0bbb743d	6257	Pivka
00050000-5600-1c69-1b22-2aa451b3a4af	6232	Planina
00050000-5600-1c69-20b5-022ad1bca049	3225	Planina pri Sevnici
00050000-5600-1c69-769f-17557ed69af2	6276	Pobegi
00050000-5600-1c69-bec4-b580db160cee	8312	Podbočje
00050000-5600-1c69-6414-72e2a365aa07	5243	Podbrdo
00050000-5600-1c69-cf08-05868bf3cbc3	3254	Podčetrtek
00050000-5600-1c69-368f-73404dfce8c8	2273	Podgorci
00050000-5600-1c69-bf34-7073d7d11806	6216	Podgorje
00050000-5600-1c69-eea6-0ce48ed5dda6	2381	Podgorje pri Slovenj Gradcu
00050000-5600-1c69-82f8-3e987811b831	6244	Podgrad
00050000-5600-1c69-7788-87689489c411	1414	Podkum
00050000-5600-1c69-2826-594f2a299f98	2286	Podlehnik
00050000-5600-1c69-bd15-bf520a3dc10e	5272	Podnanos
00050000-5600-1c69-e763-c1bc4dd8865f	4244	Podnart
00050000-5600-1c69-4e43-2407cb72ee10	3241	Podplat
00050000-5600-1c69-a264-de7fd7c4bf18	3257	Podsreda
00050000-5600-1c69-1d33-6cbeea77d183	2363	Podvelka
00050000-5600-1c69-a0bf-a353399b565b	2208	Pohorje
00050000-5600-1c69-b88b-e1d05dfff988	2257	Polenšak
00050000-5600-1c69-e412-1ecd0ae7b37d	1355	Polhov Gradec
00050000-5600-1c69-fc03-01d9ec4fbc76	4223	Poljane nad Škofjo Loko
00050000-5600-1c69-7e99-6b2853f86c5f	2319	Poljčane
00050000-5600-1c69-30ce-37bde35d5635	1272	Polšnik
00050000-5600-1c69-5698-baff357813da	3313	Polzela
00050000-5600-1c69-21a3-3afac2a364b8	3232	Ponikva
00050000-5600-1c69-8f96-12ed2bd2501c	6320	Portorož/Portorose
00050000-5600-1c69-c7a8-89cb237830b0	6230	Postojna
00050000-5600-1c69-e3c6-a4fd91285301	2331	Pragersko
00050000-5600-1c69-fd52-a389e3cdf5ab	3312	Prebold
00050000-5600-1c69-5737-dd208da87d47	4205	Preddvor
00050000-5600-1c69-70fe-520359be880c	6255	Prem
00050000-5600-1c69-756d-eda64451d6fc	1352	Preserje
00050000-5600-1c69-865c-d7b894a23c44	6258	Prestranek
00050000-5600-1c69-2e38-98766f77ac07	2391	Prevalje
00050000-5600-1c69-13a3-347bec263cd6	3262	Prevorje
00050000-5600-1c69-e109-979cfa8a264d	1276	Primskovo 
00050000-5600-1c69-040b-ee46fa9438b8	3253	Pristava pri Mestinju
00050000-5600-1c69-e4c4-714dc46a7fb9	9207	Prosenjakovci/Partosfalva
00050000-5600-1c69-516b-862a12dfd2ef	5297	Prvačina
00050000-5600-1c69-086e-14ae53e0fa47	2250	Ptuj
00050000-5600-1c69-7b81-36a17f531175	2323	Ptujska Gora
00050000-5600-1c69-6e68-3b2d86856749	9201	Puconci
00050000-5600-1c69-9e54-b2c114d369e3	2327	Rače
00050000-5600-1c69-eec0-ef8f48365b78	1433	Radeče
00050000-5600-1c69-c254-6a0f17cea8bd	9252	Radenci
00050000-5600-1c69-3513-6333d969f224	2360	Radlje ob Dravi
00050000-5600-1c69-2c0c-9df531121d15	1235	Radomlje
00050000-5600-1c69-5e44-138b05ebaa26	4240	Radovljica
00050000-5600-1c69-6f80-71be3802443e	8274	Raka
00050000-5600-1c69-0a12-c1637308ff81	1381	Rakek
00050000-5600-1c69-2f00-30e09ca60df6	4283	Rateče - Planica
00050000-5600-1c69-f0f6-387901fa072b	2390	Ravne na Koroškem
00050000-5600-1c69-555b-08772d7a3638	9246	Razkrižje
00050000-5600-1c69-d614-f2836b37f479	3332	Rečica ob Savinji
00050000-5600-1c69-c1cd-987c095602db	5292	Renče
00050000-5600-1c69-cc94-f2cd9e13aeb8	1310	Ribnica
00050000-5600-1c69-3f9a-1162b0ffff65	2364	Ribnica na Pohorju
00050000-5600-1c69-b539-66174d381320	3272	Rimske Toplice
00050000-5600-1c69-6f87-b140fe0f0cef	1314	Rob
00050000-5600-1c69-405a-d2cf0a7ad65f	5215	Ročinj
00050000-5600-1c69-19d4-4e345ca6cc57	3250	Rogaška Slatina
00050000-5600-1c69-2cca-1170e3e15380	9262	Rogašovci
00050000-5600-1c69-6df2-33725b4f4f55	3252	Rogatec
00050000-5600-1c69-b842-50b8ad410533	1373	Rovte
00050000-5600-1c69-f9ee-8effc2d8de71	2342	Ruše
00050000-5600-1c69-f4b6-10be7a6c3f23	1282	Sava
00050000-5600-1c69-5653-f4fc82c1262e	6333	Sečovlje/Sicciole
00050000-5600-1c69-007f-4a9a1df5b267	4227	Selca
00050000-5600-1c69-2d16-04719934798d	2352	Selnica ob Dravi
00050000-5600-1c69-e1a0-d19cf9b5e783	8333	Semič
00050000-5600-1c69-335b-2e4cb5297009	8281	Senovo
00050000-5600-1c69-1f5a-ef0e709ba6ff	6224	Senožeče
00050000-5600-1c69-241e-f2422821bd74	8290	Sevnica
00050000-5600-1c69-7c6f-605c30f4bfeb	6210	Sežana
00050000-5600-1c69-b642-f43d95b1607f	2214	Sladki Vrh
00050000-5600-1c69-9d29-54417a085e84	5283	Slap ob Idrijci
00050000-5600-1c69-1312-69a9f40ef367	2380	Slovenj Gradec
00050000-5600-1c69-04fd-d7937c5121c6	2310	Slovenska Bistrica
00050000-5600-1c69-0142-82392d765975	3210	Slovenske Konjice
00050000-5600-1c69-9ff3-84e7f066892d	1216	Smlednik
00050000-5600-1c69-b84e-7590ea73dbaa	5232	Soča
00050000-5600-1c69-a733-d380989df456	1317	Sodražica
00050000-5600-1c69-d2a8-b2bc77f1d6a2	3335	Solčava
00050000-5600-1c69-1276-5d3b1c143458	5250	Solkan
00050000-5600-1c69-8d73-320633df94a6	4229	Sorica
00050000-5600-1c69-2ec0-6a845606bb2b	4225	Sovodenj
00050000-5600-1c69-a95e-2ace5eb03b9e	5281	Spodnja Idrija
00050000-5600-1c69-6bbb-f64b665babf0	2241	Spodnji Duplek
00050000-5600-1c69-d514-8d27eb874297	9245	Spodnji Ivanjci
00050000-5600-1c69-fda6-6de43a416f84	2277	Središče ob Dravi
00050000-5600-1c69-af51-6eb4a3d58ce8	4267	Srednja vas v Bohinju
00050000-5600-1c69-46d1-fa47258ae902	8256	Sromlje 
00050000-5600-1c69-636b-2e0553536d42	5224	Srpenica
00050000-5600-1c69-9f44-ba34334ad6bb	1242	Stahovica
00050000-5600-1c69-4e0b-39dda72da9e9	1332	Stara Cerkev
00050000-5600-1c69-a69c-00733a401173	8342	Stari trg ob Kolpi
00050000-5600-1c69-5ea8-74be2726e72b	1386	Stari trg pri Ložu
00050000-5600-1c69-03a5-35f92dc15687	2205	Starše
00050000-5600-1c69-a87c-fd1bfbb8de85	2289	Stoperce
00050000-5600-1c69-f31b-a08de8f83610	8322	Stopiče
00050000-5600-1c69-ea2a-4ccde9602056	3206	Stranice
00050000-5600-1c69-da4a-1fedcc784497	8351	Straža
00050000-5600-1c69-0d8b-fbb29e0845c0	1313	Struge
00050000-5600-1c69-cff3-5f1b8a2f5558	8293	Studenec
00050000-5600-1c69-140a-71bdd43f1cbe	8331	Suhor
00050000-5600-1c69-718f-4654ef5fed34	2233	Sv. Ana v Slovenskih goricah
00050000-5600-1c69-d90b-9bb47471fef7	2235	Sv. Trojica v Slovenskih goricah
00050000-5600-1c69-c903-729e0127d5fb	2353	Sveti Duh na Ostrem Vrhu
00050000-5600-1c69-56cb-1cb38d1513eb	9244	Sveti Jurij ob Ščavnici
00050000-5600-1c69-2c7d-5425ae6d015c	3264	Sveti Štefan
00050000-5600-1c69-b5f9-36384fe05dd8	2258	Sveti Tomaž
00050000-5600-1c69-4e5a-22d302c7d9fc	9204	Šalovci
00050000-5600-1c69-d249-4cff25a34e33	5261	Šempas
00050000-5600-1c69-df07-ea702e97c69b	5290	Šempeter pri Gorici
00050000-5600-1c69-2440-a384645d1470	3311	Šempeter v Savinjski dolini
00050000-5600-1c69-b528-d23f001790ce	4208	Šenčur
00050000-5600-1c69-beb7-e1efe19f3f67	2212	Šentilj v Slovenskih goricah
00050000-5600-1c69-7d8f-1421824e1f45	8297	Šentjanž
00050000-5600-1c69-b515-26bec89c1b43	2373	Šentjanž pri Dravogradu
00050000-5600-1c69-4e5c-c70da894f3b5	8310	Šentjernej
00050000-5600-1c69-c83e-5c5c4333c622	3230	Šentjur
00050000-5600-1c69-8839-1a41b4e864ab	3271	Šentrupert
00050000-5600-1c69-bbcb-1d5f796a040f	8232	Šentrupert
00050000-5600-1c69-54e9-5a837de11a53	1296	Šentvid pri Stični
00050000-5600-1c69-b194-edc8173bd6b5	8275	Škocjan
00050000-5600-1c69-38f6-8c41d79dbef0	6281	Škofije
00050000-5600-1c69-c595-5123886d4295	4220	Škofja Loka
00050000-5600-1c69-7133-64c275766bb1	3211	Škofja vas
00050000-5600-1c69-a1e5-4693297ad0d2	1291	Škofljica
00050000-5600-1c69-ca72-1c64970f7944	6274	Šmarje
00050000-5600-1c69-9b47-36f31fd1d683	1293	Šmarje - Sap
00050000-5600-1c69-aeef-b2ab8cebe82f	3240	Šmarje pri Jelšah
00050000-5600-1c69-6e7b-3663ac3bb0d1	8220	Šmarješke Toplice
00050000-5600-1c69-092c-3c8a34aab0bf	2315	Šmartno na Pohorju
00050000-5600-1c69-397d-505c9dfb44f5	3341	Šmartno ob Dreti
00050000-5600-1c69-26fd-e8a5a71af6df	3327	Šmartno ob Paki
00050000-5600-1c69-8de9-148f0a2421f1	1275	Šmartno pri Litiji
00050000-5600-1c69-bc7a-a1c12f9a83e8	2383	Šmartno pri Slovenj Gradcu
00050000-5600-1c69-fc7c-0c59926bd24c	3201	Šmartno v Rožni dolini
00050000-5600-1c69-7050-f459d7f40b86	3325	Šoštanj
00050000-5600-1c69-482c-fbee07cdb4bc	6222	Štanjel
00050000-5600-1c69-64d6-7d4b2e657452	3220	Štore
00050000-5600-1c69-e9e3-04ed1fd6ea9c	3304	Tabor
00050000-5600-1c69-8b35-fe8c2408e1bd	3221	Teharje
00050000-5600-1c69-fe80-887d294a0fbd	9251	Tišina
00050000-5600-1c69-2e8f-30d2f5f81d2f	5220	Tolmin
00050000-5600-1c69-6ad2-c50d65402c71	3326	Topolšica
00050000-5600-1c69-50a2-4ecb4217d71f	2371	Trbonje
00050000-5600-1c69-3110-cb74bc21df6f	1420	Trbovlje
00050000-5600-1c69-dcc8-c97175357b10	8231	Trebelno 
00050000-5600-1c69-c647-3bb8297c1fe4	8210	Trebnje
00050000-5600-1c69-3588-8bd80ba4f90f	5252	Trnovo pri Gorici
00050000-5600-1c69-e4e0-49592b035f91	2254	Trnovska vas
00050000-5600-1c69-a573-2e3fac2446df	1222	Trojane
00050000-5600-1c69-327c-113fe931c5b1	1236	Trzin
00050000-5600-1c69-dfdc-8fcbf42f3a49	4290	Tržič
00050000-5600-1c69-7f7f-9b3a79cff08e	8295	Tržišče
00050000-5600-1c69-a481-3c819152e57a	1311	Turjak
00050000-5600-1c69-1a20-304bda45f69e	9224	Turnišče
00050000-5600-1c69-e1cb-fdfa1636dacf	8323	Uršna sela
00050000-5600-1c69-1e3e-1fe139d16cb5	1252	Vače
00050000-5600-1c69-5588-490c6926906f	3320	Velenje 
00050000-5600-1c69-2da7-73109af305fb	3322	Velenje - poštni predali
00050000-5600-1c69-bceb-fd818096fadb	8212	Velika Loka
00050000-5600-1c69-3bf7-e7909ea0224c	2274	Velika Nedelja
00050000-5600-1c69-777a-5a46768e8eab	9225	Velika Polana
00050000-5600-1c69-2242-4b0611deb237	1315	Velike Lašče
00050000-5600-1c69-2fda-de457ae8c993	8213	Veliki Gaber
00050000-5600-1c69-83d2-0d5e7dd71d30	9241	Veržej
00050000-5600-1c69-581a-3d9f0323dffd	1312	Videm - Dobrepolje
00050000-5600-1c69-8491-ed3ebb63286b	2284	Videm pri Ptuju
00050000-5600-1c69-05b7-721493d7252c	8344	Vinica
00050000-5600-1c69-5583-517aa03ab8dc	5271	Vipava
00050000-5600-1c69-d368-ff2c00a78afd	4212	Visoko
00050000-5600-1c69-e543-d9f80ba1455d	1294	Višnja Gora
00050000-5600-1c69-dbf2-9c1c1eeb534d	3205	Vitanje
00050000-5600-1c69-7a5e-a707ce65df53	2255	Vitomarci
00050000-5600-1c69-17cd-aca29a5060d7	1217	Vodice
00050000-5600-1c69-40fd-255db9a9803a	3212	Vojnik\t
00050000-5600-1c69-1070-7ad907c1b115	5293	Volčja Draga
00050000-5600-1c69-57a2-05ec45be759d	2232	Voličina
00050000-5600-1c69-25b8-07dc2202c178	3305	Vransko
00050000-5600-1c69-f620-b8b550730976	6217	Vremski Britof
00050000-5600-1c69-341f-b4aaaaf4d886	1360	Vrhnika
00050000-5600-1c69-8d80-03f85ea902e4	2365	Vuhred
00050000-5600-1c69-2ce9-ac77d0959d91	2367	Vuzenica
00050000-5600-1c69-cd2c-a1d5a1e9ae0a	8292	Zabukovje 
00050000-5600-1c69-f172-4d05b40b7588	1410	Zagorje ob Savi
00050000-5600-1c69-99a7-9dbed6f98790	1303	Zagradec
00050000-5600-1c69-f966-b2c837be452d	2283	Zavrč
00050000-5600-1c69-e3e4-04bcad9da943	8272	Zdole 
00050000-5600-1c69-0a37-402abc3dd357	4201	Zgornja Besnica
00050000-5600-1c69-29cd-05a1c693857a	2242	Zgornja Korena
00050000-5600-1c69-fe01-59c6c1a2fb56	2201	Zgornja Kungota
00050000-5600-1c69-90bb-ce0074998de5	2316	Zgornja Ložnica
00050000-5600-1c69-b14e-08fb5b03d308	2314	Zgornja Polskava
00050000-5600-1c69-6ec8-d4c1f57d6da8	2213	Zgornja Velka
00050000-5600-1c69-daca-2b8cffa087bb	4247	Zgornje Gorje
00050000-5600-1c69-bb91-04880619ce97	4206	Zgornje Jezersko
00050000-5600-1c69-16ec-b0ce13c03028	2285	Zgornji Leskovec
00050000-5600-1c69-6cf2-2a7a82ccd4f4	1432	Zidani Most
00050000-5600-1c69-31cb-8cca0fa1e4b9	3214	Zreče
00050000-5600-1c69-ecd1-4786730ba953	4209	Žabnica
00050000-5600-1c69-2140-6e6b55e42bc6	3310	Žalec
00050000-5600-1c69-5b85-c7bf78b9c9b7	4228	Železniki
00050000-5600-1c69-2bc4-6b9bcf03dfd9	2287	Žetale
00050000-5600-1c69-ab4e-817b2a996b47	4226	Žiri
00050000-5600-1c69-58a6-1fb503f06f66	4274	Žirovnica
00050000-5600-1c69-4e61-c13b427ad19f	8360	Žužemberk
\.


--
-- TOC entry 3023 (class 0 OID 20350630)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20350256)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 20350036)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5600-1c6b-010b-1ac4afb7473d	00080000-5600-1c6a-b66b-461062474815	\N	00040000-5600-1c69-0a0b-f21d60ea00c3	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5600-1c6b-b480-ca9919e44231	00080000-5600-1c6a-b66b-461062474815	\N	00040000-5600-1c69-0a0b-f21d60ea00c3	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5600-1c6b-45c4-9924f7b28e00	00080000-5600-1c6a-d40c-81a5eb58cc6d	\N	00040000-5600-1c69-0a0b-f21d60ea00c3	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2985 (class 0 OID 20350140)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20350268)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 20350644)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20350654)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5600-1c6b-febc-934d933e5842	00080000-5600-1c6a-5856-1bf4ca7af969	0987	AK
00190000-5600-1c6b-3a48-5b263db6cfd3	00080000-5600-1c6a-d40c-81a5eb58cc6d	0989	AK
00190000-5600-1c6b-bc9a-8b29d38a2c72	00080000-5600-1c6a-4893-486056a04858	0986	AK
00190000-5600-1c6b-2c90-c193234863c5	00080000-5600-1c6a-d60f-292ac56e6e63	0984	AK
00190000-5600-1c6b-868d-53c1a293c34d	00080000-5600-1c6a-9aaa-67aac8cb0417	0983	AK
00190000-5600-1c6b-bf57-fd6f4d64de37	00080000-5600-1c6a-8dd0-44bb2af8751e	0982	AK
00190000-5600-1c6c-76ef-17b426e0bb6b	00080000-5600-1c6c-2cc9-646d1b0f9949	1001	AK
\.


--
-- TOC entry 3022 (class 0 OID 20350587)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5600-1c6b-b4db-aedb218704a9	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3026 (class 0 OID 20350662)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 20350297)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5600-1c6a-1aea-8e934653dd58	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5600-1c6a-1bc4-9836fbe0af18	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5600-1c6a-92dc-8feddae67a8a	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5600-1c6a-d5a6-f0d366c0552c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5600-1c6a-f91c-fc63dec8e502	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5600-1c6a-6786-d6e44c2a328b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5600-1c6a-b53f-886f50513d7b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2994 (class 0 OID 20350241)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20350231)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20350439)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20350371)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20350114)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20349909)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5600-1c6c-2cc9-646d1b0f9949	00010000-5600-1c6a-c4ae-629ea3538335	2015-09-21 17:04:12	INS	a:0:{}
2	App\\Entity\\Option	00000000-5600-1c6c-a198-c8d1b9c64171	00010000-5600-1c6a-c4ae-629ea3538335	2015-09-21 17:04:12	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5600-1c6c-76ef-17b426e0bb6b	00010000-5600-1c6a-c4ae-629ea3538335	2015-09-21 17:04:12	INS	a:0:{}
\.


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3003 (class 0 OID 20350310)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 20349947)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5600-1c6a-9d4f-49355c000c7a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5600-1c6a-aa5f-af59e0dad20e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5600-1c6a-c160-40b6827426b4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5600-1c6a-0c16-eb163ea9c2c4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5600-1c6a-d4a4-59217b7f17a1	planer	Planer dogodkov v koledarju	t
00020000-5600-1c6a-44d1-43be922a7341	kadrovska	Kadrovska služba	t
00020000-5600-1c6a-899d-56f827bd3bb0	arhivar	Ažuriranje arhivalij	t
00020000-5600-1c6a-8397-43e4d8bf4969	igralec	Igralec	t
00020000-5600-1c6a-e6db-ec3c41261444	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5600-1c6b-2e32-5fc938d83cc9	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2968 (class 0 OID 20349931)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5600-1c6a-b87b-a10f44ccc609	00020000-5600-1c6a-c160-40b6827426b4
00010000-5600-1c6a-c4ae-629ea3538335	00020000-5600-1c6a-c160-40b6827426b4
00010000-5600-1c6b-3f26-243de0d0f9d8	00020000-5600-1c6b-2e32-5fc938d83cc9
\.


--
-- TOC entry 3005 (class 0 OID 20350324)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20350262)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20350208)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 20349896)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5600-1c69-e34c-a17e5d8b51b3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5600-1c69-3d09-5157eca38791	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5600-1c69-2d84-7c4ec46091a0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5600-1c69-1eb6-37b4a5942957	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5600-1c69-e05b-4eaab5878ef0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2963 (class 0 OID 20349888)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5600-1c69-e2bc-24569407ae89	00230000-5600-1c69-1eb6-37b4a5942957	popa
00240000-5600-1c69-f0fc-6158c5ade7e9	00230000-5600-1c69-1eb6-37b4a5942957	oseba
00240000-5600-1c69-83f1-660ec3b14ac4	00230000-5600-1c69-1eb6-37b4a5942957	sezona
00240000-5600-1c69-73a0-b516c2d6a4c8	00230000-5600-1c69-3d09-5157eca38791	prostor
00240000-5600-1c69-da18-e7560bc22de3	00230000-5600-1c69-1eb6-37b4a5942957	besedilo
00240000-5600-1c69-9340-7ea45989b45d	00230000-5600-1c69-1eb6-37b4a5942957	uprizoritev
00240000-5600-1c69-7d52-62643f61a214	00230000-5600-1c69-1eb6-37b4a5942957	funkcija
00240000-5600-1c69-577a-790ab327eb23	00230000-5600-1c69-1eb6-37b4a5942957	tipfunkcije
00240000-5600-1c69-2048-fe79ea2f4b2a	00230000-5600-1c69-1eb6-37b4a5942957	alternacija
00240000-5600-1c69-4205-c928a16e4ffe	00230000-5600-1c69-e34c-a17e5d8b51b3	pogodba
00240000-5600-1c69-ad4d-261803d2668c	00230000-5600-1c69-1eb6-37b4a5942957	zaposlitev
00240000-5600-1c69-c340-58e4caa4e4a2	00230000-5600-1c69-1eb6-37b4a5942957	zvrstuprizoritve
00240000-5600-1c69-0760-bf625ce8494e	00230000-5600-1c69-e34c-a17e5d8b51b3	programdela
00240000-5600-1c69-f494-30841dc98748	00230000-5600-1c69-1eb6-37b4a5942957	zapis
\.


--
-- TOC entry 2962 (class 0 OID 20349883)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f715a3b8-532a-42aa-ac73-2f6cdbdb3d7d	00240000-5600-1c69-e2bc-24569407ae89	0	1001
\.


--
-- TOC entry 3011 (class 0 OID 20350388)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5600-1c6b-aa18-94416c05da94	000e0000-5600-1c6b-ead1-e771e5169279	00080000-5600-1c6a-b66b-461062474815	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5600-1c69-9e0f-465ade0349b3
00270000-5600-1c6b-0abd-0fb60cb52d7f	000e0000-5600-1c6b-ead1-e771e5169279	00080000-5600-1c6a-b66b-461062474815	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5600-1c69-9e0f-465ade0349b3
\.


--
-- TOC entry 2975 (class 0 OID 20350009)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20350218)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5600-1c6b-eab7-47fa35394ad4	00180000-5600-1c6b-2320-901643899565	000c0000-5600-1c6b-c6e4-d9b215b68f1c	00090000-5600-1c6b-44d4-fe00e4cc2c6a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5600-1c6b-79de-4ed27e184df4	00180000-5600-1c6b-2320-901643899565	000c0000-5600-1c6b-d591-bc2fb2bb6674	00090000-5600-1c6b-3076-744908d6a8dc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5600-1c6b-d76b-289c515167b4	00180000-5600-1c6b-2320-901643899565	000c0000-5600-1c6b-886f-3d2151040f4c	00090000-5600-1c6b-cdd0-ace0ad980ce5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5600-1c6b-53df-6e44ccd612c4	00180000-5600-1c6b-2320-901643899565	000c0000-5600-1c6b-3fd1-502ebbba2896	00090000-5600-1c6b-c4cd-d418a3b6f373	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5600-1c6b-3ad7-cad8e04cad03	00180000-5600-1c6b-2320-901643899565	000c0000-5600-1c6b-b410-4f405d2f6844	00090000-5600-1c6b-7d59-9991498934ab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5600-1c6b-c44d-3842d344817a	00180000-5600-1c6b-e54a-d18420e9489b	\N	00090000-5600-1c6b-7d59-9991498934ab	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3014 (class 0 OID 20350427)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5600-1c69-1ef1-8edf5e79a9e6	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5600-1c69-03bf-108f589225cb	02	Priredba	Priredba	Priredba	umetnik
000f0000-5600-1c69-b505-6b8c254f73bc	03	Prevod	Prevod	Prevod	umetnik
000f0000-5600-1c69-55dd-3e546235412c	04	Režija	Režija	Režija	umetnik
000f0000-5600-1c69-d1e9-16c346aec1be	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5600-1c69-ffdc-48318c079f03	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5600-1c69-ab68-ff2b1b71530a	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5600-1c69-d442-f00ac1f4e8b5	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5600-1c69-37d6-c53874a12135	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5600-1c69-4254-3b94f47db7a1	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5600-1c69-ba75-2052391ce2e2	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5600-1c69-53f1-841b4f72a3cb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5600-1c69-3c42-1ca94c5e590b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5600-1c69-3d27-bb1b1d6928ac	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5600-1c69-4fb2-f1e7c67488c1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5600-1c69-7c63-2b7d293b505b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5600-1c69-535e-c79a40f06c32	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5600-1c69-6639-b1da9d871de7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3027 (class 0 OID 20350672)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5600-1c69-a00f-f6a0f4dc01ea	01	Velika predstava	f	1.00	1.00
002b0000-5600-1c69-0d87-ef6c72433a2b	02	Mala predstava	f	0.50	0.50
002b0000-5600-1c69-b0d3-ebeb57ea8892	03	Mala koprodukcija	t	0.40	1.00
002b0000-5600-1c69-5ada-5fb39a01f2e0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5600-1c69-3647-0bb3a9b87488	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2980 (class 0 OID 20350071)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20349918)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5600-1c6a-c4ae-629ea3538335	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6dkE3Txjet.X148bWKJDjYiwGI/dW9e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-b94b-a355b8cab4cc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-6c2c-f901155bf908	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-3337-4367bbb5f77b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-53b0-a1d923ebb755	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-2785-1083f3b7872f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-2c46-a559b5e6e0fb	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-363c-1fc4e13de84c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-332f-40038de3f18a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-868f-5e6d58540cc8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5600-1c6b-3f26-243de0d0f9d8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5600-1c6a-b87b-a10f44ccc609	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3018 (class 0 OID 20350477)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5600-1c6b-d4e6-f77c58168aa3	00160000-5600-1c6a-0c20-47ac6168ab97	\N	00140000-5600-1c69-0443-f6040b68fdaa	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		00220000-5600-1c6a-f91c-fc63dec8e502
000e0000-5600-1c6b-ead1-e771e5169279	00160000-5600-1c6a-7b4c-00a9d2f388b9	\N	00140000-5600-1c69-302c-f3375bf5e578	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		00220000-5600-1c6a-6786-d6e44c2a328b
000e0000-5600-1c6b-874c-9bb30a819d2b	\N	\N	00140000-5600-1c69-302c-f3375bf5e578	00190000-5600-1c6b-febc-934d933e5842	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5600-1c6a-f91c-fc63dec8e502
000e0000-5600-1c6b-e87d-a69adcf47bee	\N	\N	00140000-5600-1c69-302c-f3375bf5e578	00190000-5600-1c6b-febc-934d933e5842	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5600-1c6a-f91c-fc63dec8e502
000e0000-5600-1c6b-790c-e6a056f31a67	\N	\N	00140000-5600-1c69-302c-f3375bf5e578	00190000-5600-1c6b-febc-934d933e5842	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5600-1c6a-1aea-8e934653dd58
000e0000-5600-1c6b-6e30-24d1accd6136	\N	\N	00140000-5600-1c69-302c-f3375bf5e578	00190000-5600-1c6b-febc-934d933e5842	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5600-1c6a-1aea-8e934653dd58
\.


--
-- TOC entry 2987 (class 0 OID 20350161)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5600-1c6b-8342-761347f6a9a8	000e0000-5600-1c6b-ead1-e771e5169279	\N	1	
00200000-5600-1c6b-c923-b383baeb3fca	000e0000-5600-1c6b-ead1-e771e5169279	\N	2	
00200000-5600-1c6b-e0fe-6abc8f1a81b7	000e0000-5600-1c6b-ead1-e771e5169279	\N	3	
00200000-5600-1c6b-8055-2d59fa33bcce	000e0000-5600-1c6b-ead1-e771e5169279	\N	4	
00200000-5600-1c6b-7a5d-0836971d3c7f	000e0000-5600-1c6b-ead1-e771e5169279	\N	5	
\.


--
-- TOC entry 3001 (class 0 OID 20350289)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20350402)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5600-1c69-8709-e48e307b5d3a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5600-1c69-a26f-683570ace5ec	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5600-1c69-1d4c-9ea99286c50b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5600-1c69-ad58-24b95c5fdab7	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5600-1c69-3011-f38d032d5ffb	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5600-1c69-0f55-cfe8d835d1be	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5600-1c69-faef-df81d278db25	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5600-1c69-395e-abb7f92e9bd5	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5600-1c69-9e0f-465ade0349b3	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5600-1c69-bd17-9a9a5315078e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5600-1c69-2af4-c80796af2f31	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5600-1c69-3479-bc3c6487f372	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5600-1c69-35fe-eaa450d7de31	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5600-1c69-f35d-172ebf410fd7	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5600-1c69-b472-925fbe9ae6d0	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5600-1c69-393d-8d5c9cd69743	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5600-1c69-8e9b-ecf6acbcf37d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5600-1c69-0d58-89d3b1c7b479	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5600-1c69-e402-fe14cdbc2ced	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5600-1c69-d979-b6fc7997ffb1	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5600-1c69-4a87-2b885c114ba8	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5600-1c69-6dbc-1261d7133c87	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5600-1c69-8ba2-f6f76b4302b0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5600-1c69-2ea9-f9724965028b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5600-1c69-c1a2-9b5fc9578561	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5600-1c69-3dfa-361890139a8f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5600-1c69-3c81-e98beb204c64	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5600-1c69-ac23-a86067bb6674	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3030 (class 0 OID 20350719)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20350691)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20350731)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 20350361)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5600-1c6b-0ab8-c750c6b02882	00090000-5600-1c6b-3076-744908d6a8dc	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5600-1c6b-a23a-d28bd6790cf5	00090000-5600-1c6b-cdd0-ace0ad980ce5	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5600-1c6b-a11c-41e0294fb72b	00090000-5600-1c6b-13f1-92e8d3309c63	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5600-1c6b-1f86-c90883c10c43	00090000-5600-1c6b-bf7f-bb996480043d	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5600-1c6b-55f7-546481c6298a	00090000-5600-1c6b-44d4-fe00e4cc2c6a	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5600-1c6b-d06a-81a8fa17b39c	00090000-5600-1c6b-d959-fbc28c57f75f	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2989 (class 0 OID 20350197)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20350467)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5600-1c69-0443-f6040b68fdaa	01	Drama	drama (SURS 01)
00140000-5600-1c69-7d81-6d6d852e0e40	02	Opera	opera (SURS 02)
00140000-5600-1c69-3789-32dbb1180c6a	03	Balet	balet (SURS 03)
00140000-5600-1c69-7115-111517ae1f40	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5600-1c69-f988-b55fbe8a7e55	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5600-1c69-302c-f3375bf5e578	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5600-1c69-98be-f965696328aa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3007 (class 0 OID 20350351)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2494 (class 2606 OID 20349972)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 20350526)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20350516)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 20350385)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20350425)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 20350771)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 20350186)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 20350207)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 20350689)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 20350097)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 20350581)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20350347)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 20350159)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 20350135)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 20350111)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 20350254)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 20350748)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 20350755)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2748 (class 2606 OID 20350779)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2606 (class 2606 OID 20350281)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 20350069)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 20349981)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 20350005)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 20349961)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2485 (class 2606 OID 20349946)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 20350287)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 20350323)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 20350462)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20350033)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 20350057)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 20350642)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 20350260)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 20350047)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 20350147)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 20350272)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 20350651)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 20350659)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 20350629)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 20350670)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 20350305)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 20350245)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 20350236)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 20350449)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 20350378)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 20350123)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 20349917)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 20350314)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 20349935)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2487 (class 2606 OID 20349955)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 20350332)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 20350267)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 20350216)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 20349905)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 20349893)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 20349887)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 20350398)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 20350014)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 20350227)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 20350436)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20350682)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 20350082)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20349930)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 20350495)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 20350169)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 20350295)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20350410)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 20350729)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 20350713)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 20350737)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 20350369)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 20350201)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 20350475)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 20350359)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 1259 OID 20350195)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2559 (class 1259 OID 20350196)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2560 (class 1259 OID 20350194)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2561 (class 1259 OID 20350193)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2562 (class 1259 OID 20350192)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2648 (class 1259 OID 20350399)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2649 (class 1259 OID 20350400)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 20350401)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 20350750)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2735 (class 1259 OID 20350749)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2508 (class 1259 OID 20350035)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2607 (class 1259 OID 20350288)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2721 (class 1259 OID 20350717)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2722 (class 1259 OID 20350716)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2723 (class 1259 OID 20350718)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2724 (class 1259 OID 20350715)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2725 (class 1259 OID 20350714)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2601 (class 1259 OID 20350274)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 20350273)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2553 (class 1259 OID 20350170)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 20350348)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 20350350)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2633 (class 1259 OID 20350349)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2533 (class 1259 OID 20350113)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 20350112)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 20350671)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2664 (class 1259 OID 20350464)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 20350465)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2666 (class 1259 OID 20350466)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2731 (class 1259 OID 20350738)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2673 (class 1259 OID 20350500)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2674 (class 1259 OID 20350497)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2675 (class 1259 OID 20350501)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2676 (class 1259 OID 20350499)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2677 (class 1259 OID 20350498)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2523 (class 1259 OID 20350084)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 20350083)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2499 (class 1259 OID 20350008)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 20350315)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2489 (class 1259 OID 20349962)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2490 (class 1259 OID 20349963)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2624 (class 1259 OID 20350335)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2625 (class 1259 OID 20350334)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2626 (class 1259 OID 20350333)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 20350148)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2547 (class 1259 OID 20350149)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2469 (class 1259 OID 20349895)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2581 (class 1259 OID 20350240)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2582 (class 1259 OID 20350238)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2583 (class 1259 OID 20350237)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2584 (class 1259 OID 20350239)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2480 (class 1259 OID 20349936)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2481 (class 1259 OID 20349937)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2610 (class 1259 OID 20350296)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2744 (class 1259 OID 20350772)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2646 (class 1259 OID 20350387)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2647 (class 1259 OID 20350386)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2745 (class 1259 OID 20350780)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2746 (class 1259 OID 20350781)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2596 (class 1259 OID 20350261)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2640 (class 1259 OID 20350379)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2641 (class 1259 OID 20350380)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 20350586)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2695 (class 1259 OID 20350585)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2696 (class 1259 OID 20350582)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 20350583)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2698 (class 1259 OID 20350584)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2512 (class 1259 OID 20350049)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2513 (class 1259 OID 20350048)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2514 (class 1259 OID 20350050)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 20350309)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 20350308)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2704 (class 1259 OID 20350652)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2705 (class 1259 OID 20350653)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2687 (class 1259 OID 20350530)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2688 (class 1259 OID 20350531)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2689 (class 1259 OID 20350528)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2690 (class 1259 OID 20350529)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2637 (class 1259 OID 20350370)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2587 (class 1259 OID 20350249)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2588 (class 1259 OID 20350248)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2589 (class 1259 OID 20350246)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2590 (class 1259 OID 20350247)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2683 (class 1259 OID 20350518)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2684 (class 1259 OID 20350517)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 20350124)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2540 (class 1259 OID 20350138)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2541 (class 1259 OID 20350137)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2542 (class 1259 OID 20350136)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2543 (class 1259 OID 20350139)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2552 (class 1259 OID 20350160)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2701 (class 1259 OID 20350643)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2720 (class 1259 OID 20350690)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2738 (class 1259 OID 20350756)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2739 (class 1259 OID 20350757)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2495 (class 1259 OID 20349983)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 20349982)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2504 (class 1259 OID 20350015)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2505 (class 1259 OID 20350016)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2568 (class 1259 OID 20350202)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2576 (class 1259 OID 20350230)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 20350229)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2578 (class 1259 OID 20350228)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2563 (class 1259 OID 20350188)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2564 (class 1259 OID 20350189)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2565 (class 1259 OID 20350187)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2566 (class 1259 OID 20350191)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2567 (class 1259 OID 20350190)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2511 (class 1259 OID 20350034)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 20350098)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 20350100)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2531 (class 1259 OID 20350099)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2532 (class 1259 OID 20350101)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2595 (class 1259 OID 20350255)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2669 (class 1259 OID 20350463)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2678 (class 1259 OID 20350496)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 20350437)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 20350438)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2502 (class 1259 OID 20350006)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2503 (class 1259 OID 20350007)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2634 (class 1259 OID 20350360)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 20349906)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 20350070)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2472 (class 1259 OID 20349894)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2717 (class 1259 OID 20350683)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2617 (class 1259 OID 20350307)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2618 (class 1259 OID 20350306)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 20350527)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 20350058)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2670 (class 1259 OID 20350476)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 20350730)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2710 (class 1259 OID 20350660)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 20350661)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2657 (class 1259 OID 20350426)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2575 (class 1259 OID 20350217)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2488 (class 1259 OID 20349956)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2779 (class 2606 OID 20350912)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2778 (class 2606 OID 20350917)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2774 (class 2606 OID 20350937)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2780 (class 2606 OID 20350907)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2776 (class 2606 OID 20350927)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2775 (class 2606 OID 20350932)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2777 (class 2606 OID 20350922)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2815 (class 2606 OID 20351102)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2814 (class 2606 OID 20351107)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2813 (class 2606 OID 20351112)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 20351277)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2848 (class 2606 OID 20351272)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 20350837)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2797 (class 2606 OID 20351022)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2842 (class 2606 OID 20351257)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2843 (class 2606 OID 20351252)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2841 (class 2606 OID 20351262)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 20351247)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2845 (class 2606 OID 20351242)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2795 (class 2606 OID 20351017)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2796 (class 2606 OID 20351012)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2773 (class 2606 OID 20350902)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 20351062)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2805 (class 2606 OID 20351072)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2806 (class 2606 OID 20351067)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 20350872)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 20350867)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2793 (class 2606 OID 20351002)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20351232)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2818 (class 2606 OID 20351117)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 20351122)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2816 (class 2606 OID 20351127)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2846 (class 2606 OID 20351267)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2820 (class 2606 OID 20351147)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2823 (class 2606 OID 20351132)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2819 (class 2606 OID 20351152)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 20351142)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2822 (class 2606 OID 20351137)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 20350862)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 20350857)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 20350822)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 20350817)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2801 (class 2606 OID 20351042)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 20350797)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 20350802)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2802 (class 2606 OID 20351057)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2803 (class 2606 OID 20351052)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2804 (class 2606 OID 20351047)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2771 (class 2606 OID 20350887)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 20350892)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2749 (class 2606 OID 20350782)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2785 (class 2606 OID 20350977)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2787 (class 2606 OID 20350967)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2788 (class 2606 OID 20350962)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2786 (class 2606 OID 20350972)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 20350787)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 20350792)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2798 (class 2606 OID 20351027)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2851 (class 2606 OID 20351292)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2811 (class 2606 OID 20351097)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2812 (class 2606 OID 20351092)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2853 (class 2606 OID 20351297)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2852 (class 2606 OID 20351302)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2794 (class 2606 OID 20351007)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2810 (class 2606 OID 20351082)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2809 (class 2606 OID 20351087)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 20351207)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 20351202)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2834 (class 2606 OID 20351187)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 20351192)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2832 (class 2606 OID 20351197)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 20350847)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 20350842)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 20350852)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2799 (class 2606 OID 20351037)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2800 (class 2606 OID 20351032)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2837 (class 2606 OID 20351217)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2836 (class 2606 OID 20351222)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2827 (class 2606 OID 20351177)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2826 (class 2606 OID 20351182)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2829 (class 2606 OID 20351167)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2828 (class 2606 OID 20351172)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2808 (class 2606 OID 20351077)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 20350997)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2790 (class 2606 OID 20350992)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2792 (class 2606 OID 20350982)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2791 (class 2606 OID 20350987)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2824 (class 2606 OID 20351162)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2825 (class 2606 OID 20351157)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 20350877)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2769 (class 2606 OID 20350882)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 20350897)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2835 (class 2606 OID 20351212)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2838 (class 2606 OID 20351227)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20351237)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2850 (class 2606 OID 20351282)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2849 (class 2606 OID 20351287)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 20350812)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 20350807)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 20350827)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 20350832)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 20350942)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 20350957)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2783 (class 2606 OID 20350952)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2784 (class 2606 OID 20350947)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-21 17:04:13 CEST

--
-- PostgreSQL database dump complete
--

