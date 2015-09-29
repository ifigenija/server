--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-29 10:26:42 CEST

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
-- TOC entry 181 (class 1259 OID 21019167)
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
-- TOC entry 229 (class 1259 OID 21019724)
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
-- TOC entry 228 (class 1259 OID 21019707)
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
-- TOC entry 219 (class 1259 OID 21019584)
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
-- TOC entry 222 (class 1259 OID 21019614)
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
-- TOC entry 243 (class 1259 OID 21019966)
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
-- TOC entry 197 (class 1259 OID 21019374)
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
-- TOC entry 199 (class 1259 OID 21019406)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21019892)
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
-- TOC entry 190 (class 1259 OID 21019288)
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
-- TOC entry 230 (class 1259 OID 21019737)
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
-- TOC entry 215 (class 1259 OID 21019539)
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
-- TOC entry 195 (class 1259 OID 21019353)
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
-- TOC entry 193 (class 1259 OID 21019328)
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
-- TOC entry 191 (class 1259 OID 21019305)
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
-- TOC entry 204 (class 1259 OID 21019453)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21019947)
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
-- TOC entry 242 (class 1259 OID 21019959)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21019981)
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
-- TOC entry 208 (class 1259 OID 21019478)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21019262)
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
-- TOC entry 182 (class 1259 OID 21019176)
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
-- TOC entry 183 (class 1259 OID 21019187)
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
-- TOC entry 178 (class 1259 OID 21019141)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21019160)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21019485)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21019519)
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
-- TOC entry 225 (class 1259 OID 21019655)
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
-- TOC entry 185 (class 1259 OID 21019220)
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
-- TOC entry 187 (class 1259 OID 21019254)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21019837)
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
-- TOC entry 205 (class 1259 OID 21019459)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21019239)
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
-- TOC entry 194 (class 1259 OID 21019343)
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
-- TOC entry 207 (class 1259 OID 21019471)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21019851)
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
-- TOC entry 234 (class 1259 OID 21019861)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21019794)
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
-- TOC entry 235 (class 1259 OID 21019869)
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
-- TOC entry 211 (class 1259 OID 21019500)
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
-- TOC entry 203 (class 1259 OID 21019444)
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
-- TOC entry 202 (class 1259 OID 21019434)
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
-- TOC entry 224 (class 1259 OID 21019644)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21019574)
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
-- TOC entry 192 (class 1259 OID 21019317)
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
-- TOC entry 175 (class 1259 OID 21019112)
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
-- TOC entry 174 (class 1259 OID 21019110)
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
-- TOC entry 212 (class 1259 OID 21019513)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21019150)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21019134)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21019527)
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
-- TOC entry 206 (class 1259 OID 21019465)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21019411)
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
-- TOC entry 173 (class 1259 OID 21019099)
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
-- TOC entry 172 (class 1259 OID 21019091)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21019086)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21019591)
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
-- TOC entry 184 (class 1259 OID 21019212)
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
-- TOC entry 201 (class 1259 OID 21019421)
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
-- TOC entry 223 (class 1259 OID 21019632)
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
-- TOC entry 236 (class 1259 OID 21019880)
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
-- TOC entry 189 (class 1259 OID 21019274)
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
-- TOC entry 176 (class 1259 OID 21019121)
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
-- TOC entry 227 (class 1259 OID 21019682)
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
-- TOC entry 196 (class 1259 OID 21019364)
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
-- TOC entry 210 (class 1259 OID 21019492)
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
-- TOC entry 221 (class 1259 OID 21019605)
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
-- TOC entry 239 (class 1259 OID 21019927)
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
-- TOC entry 238 (class 1259 OID 21019899)
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
-- TOC entry 240 (class 1259 OID 21019939)
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
-- TOC entry 217 (class 1259 OID 21019564)
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
-- TOC entry 198 (class 1259 OID 21019400)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21019672)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21019554)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21019115)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 21019167)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21019724)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-560a-4b3f-14ce-0bfb5e45ab1b	000d0000-560a-4b3f-833a-a3954993eba8	\N	00090000-560a-4b3f-817d-846e965eab29	000b0000-560a-4b3f-314f-78871a5fe2d2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-560a-4b3f-bfbe-50318b244a19	000d0000-560a-4b3f-94ca-2b6be13f95b9	00100000-560a-4b3f-5a38-6c9846ce82c5	00090000-560a-4b3f-f385-fbb5cbdeff1a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-560a-4b3f-7e43-3d8e74044fcc	000d0000-560a-4b3f-95ea-b0f910e4cee9	00100000-560a-4b3f-7e70-3e8f2dd6e4d8	00090000-560a-4b3f-6d44-f866c454f557	\N	0003	t	\N	2015-09-29	\N	2	t	\N	f	f
000c0000-560a-4b3f-b465-8188b24b6e57	000d0000-560a-4b3f-d75f-401d4d840cb1	\N	00090000-560a-4b3f-7c5f-e9eef1b04a5e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-560a-4b3f-b632-456bff7cd804	000d0000-560a-4b3f-4684-6357417752c0	\N	00090000-560a-4b3f-3de3-cbea06cd3088	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-560a-4b3f-0235-82565e0a79bb	000d0000-560a-4b3f-28ff-f7fddefc2135	\N	00090000-560a-4b3f-d906-d770c01b9392	000b0000-560a-4b3f-0117-a3fc1cc95085	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-560a-4b3f-6dd8-ba3a9fde8a0c	000d0000-560a-4b3f-0cc3-117bc3778025	00100000-560a-4b3f-ffc4-18000ce7ad69	00090000-560a-4b3f-3ad4-fcd9226da130	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-560a-4b3f-6e0b-b93f4da3136e	000d0000-560a-4b3f-7b66-183ca2922d8f	\N	00090000-560a-4b3f-6075-ab93eaa54da8	000b0000-560a-4b3f-9c02-f151806f42bd	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-560a-4b3f-bfaa-65ceeeb5e582	000d0000-560a-4b3f-0cc3-117bc3778025	00100000-560a-4b3f-3890-d867b7351535	00090000-560a-4b3f-0ed2-b54859127625	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-560a-4b3f-f537-1d6711693eff	000d0000-560a-4b3f-0cc3-117bc3778025	00100000-560a-4b3f-e884-6320ad167b9a	00090000-560a-4b3f-352f-01011e5a35ed	\N	0010	t	\N	2015-09-29	\N	16	f	\N	f	t
000c0000-560a-4b3f-087d-1db173c7e05e	000d0000-560a-4b3f-0cc3-117bc3778025	00100000-560a-4b3f-62ca-1098e8c0a226	00090000-560a-4b3f-e461-3fad8b5496f9	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-560a-4b3f-fb6f-39ec55abb3cf	000d0000-560a-4b3f-77a6-c20b78bc488e	\N	00090000-560a-4b3f-f385-fbb5cbdeff1a	000b0000-560a-4b3f-6001-f6297f59e8d3	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3024 (class 0 OID 21019707)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21019584)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-560a-4b3f-0619-ecbb3f3049b6	00160000-560a-4b3f-38e0-d4f1b933941f	00090000-560a-4b3f-6dfb-1d156151ff3d	aizv	10	t
003d0000-560a-4b3f-bdf8-8e9569ffb341	00160000-560a-4b3f-38e0-d4f1b933941f	00090000-560a-4b3f-9cbf-a7128ffae6a9	apri	14	t
003d0000-560a-4b3f-b6e0-6a470a9feb15	00160000-560a-4b3f-fffc-5aa7d2201d06	00090000-560a-4b3f-d315-c51fe34b7242	aizv	11	t
003d0000-560a-4b3f-89de-7327c4b83a25	00160000-560a-4b3f-729a-f4c695284636	00090000-560a-4b3f-377d-a9d21a12da82	aizv	12	t
003d0000-560a-4b3f-9332-570d9fb1c1bc	00160000-560a-4b3f-38e0-d4f1b933941f	00090000-560a-4b3f-939c-16341682036e	apri	18	f
\.


--
-- TOC entry 3018 (class 0 OID 21019614)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-560a-4b3f-38e0-d4f1b933941f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-560a-4b3f-fffc-5aa7d2201d06	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-560a-4b3f-729a-f4c695284636	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 21019966)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 21019374)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-560a-4b3f-68ed-80781508bcfd	\N	\N	00200000-560a-4b3f-f078-e834bc1ca761	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-560a-4b3f-97f8-6557d9bdd7d2	\N	\N	00200000-560a-4b3f-faae-933634b966f5	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-560a-4b3f-0a03-f55de7ef5235	\N	\N	00200000-560a-4b3f-03bf-264278165b68	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-560a-4b3f-180d-fa64ed966b2c	\N	\N	00200000-560a-4b3f-c9ce-42865eb6bb45	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-560a-4b3f-fcac-9ec2d9294360	\N	\N	00200000-560a-4b3f-ea16-2952f3a58f29	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 21019406)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21019892)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21019288)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-560a-4b3d-fe92-6b16ac6a8144	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-560a-4b3d-7e46-9e13066b83a2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-560a-4b3d-7fae-70e6999e0818	AL	ALB	008	Albania 	Albanija	\N
00040000-560a-4b3d-4519-8d9f89de4e05	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-560a-4b3d-8771-2b4599e50e18	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-560a-4b3d-653f-14e13dd795a6	AD	AND	020	Andorra 	Andora	\N
00040000-560a-4b3d-4b34-091236186b56	AO	AGO	024	Angola 	Angola	\N
00040000-560a-4b3d-6cfa-18a5e97f7474	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-560a-4b3d-7aea-0c918a46369c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-560a-4b3d-875c-1fd85aa58fcc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-4b3d-e563-24f68fbe4b4a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-560a-4b3d-f8f4-542cd4a6672a	AM	ARM	051	Armenia 	Armenija	\N
00040000-560a-4b3d-0223-1806427e0d07	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-560a-4b3d-3fdc-7098a3b6ec23	AU	AUS	036	Australia 	Avstralija	\N
00040000-560a-4b3d-1db4-9f0b4b3d69d7	AT	AUT	040	Austria 	Avstrija	\N
00040000-560a-4b3d-e9f0-582c3a074277	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-560a-4b3d-301d-ce524439ada5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-560a-4b3d-5e38-791a6153cd8f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-560a-4b3d-cbc8-32b6c4459eb1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-560a-4b3d-573d-81ec9043e240	BB	BRB	052	Barbados 	Barbados	\N
00040000-560a-4b3d-7d85-600b5d1af942	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-560a-4b3d-1038-d04a703bd47f	BE	BEL	056	Belgium 	Belgija	\N
00040000-560a-4b3d-dd61-39e0b42e193c	BZ	BLZ	084	Belize 	Belize	\N
00040000-560a-4b3d-d2b7-f95b43d92776	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-560a-4b3d-23da-edd978cd124b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-560a-4b3d-64ff-13efff699228	BT	BTN	064	Bhutan 	Butan	\N
00040000-560a-4b3d-e2de-618b0db4e13c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-560a-4b3d-bc33-887e19b1eaeb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-560a-4b3d-bb9b-778d57cd9508	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-560a-4b3d-5087-1556ca57d936	BW	BWA	072	Botswana 	Bocvana	\N
00040000-560a-4b3d-090e-938f364f9122	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-560a-4b3d-9dca-ca770df2bbca	BR	BRA	076	Brazil 	Brazilija	\N
00040000-560a-4b3d-09c0-c4930d8d911e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-560a-4b3d-2ef2-8fb5b580b741	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-560a-4b3d-2c6a-76aecf9cddbe	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-560a-4b3d-ceb8-bd4d351472b0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-560a-4b3d-110f-7211ebee5182	BI	BDI	108	Burundi 	Burundi 	\N
00040000-560a-4b3d-ed37-5f75d3d13a12	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-560a-4b3d-037e-401865c858a2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-560a-4b3d-8af8-c863344ca4c2	CA	CAN	124	Canada 	Kanada	\N
00040000-560a-4b3d-b2ed-24c5fdf3d169	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-560a-4b3d-fb0b-a678724dfe1d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-560a-4b3d-cb1f-2b724a7d8332	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-560a-4b3d-bcf2-d82b14f01c8e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-560a-4b3d-5df0-904618e3e4ca	CL	CHL	152	Chile 	Čile	\N
00040000-560a-4b3d-65e1-6cb5cfdf0c39	CN	CHN	156	China 	Kitajska	\N
00040000-560a-4b3d-2a0b-8bead2e470f8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-560a-4b3d-3162-9e54de2b98c4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-560a-4b3d-a191-9f00d5a24742	CO	COL	170	Colombia 	Kolumbija	\N
00040000-560a-4b3d-cab2-32ebbc0c9093	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-560a-4b3d-231f-8535ace6d2cf	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-560a-4b3d-164d-d59be0234edc	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-560a-4b3d-b8d5-26628d20a52b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-560a-4b3d-0e0f-b05fedc12f86	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-560a-4b3d-b21b-0d79a35daae3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-560a-4b3d-bd9d-d08dae2d285f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-560a-4b3d-7fc6-03fd84227932	CU	CUB	192	Cuba 	Kuba	\N
00040000-560a-4b3d-a8f2-322997f4b70d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-560a-4b3d-533b-ac21b0684aa8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-560a-4b3d-36c5-ebb9b2d71733	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-560a-4b3d-01b5-5dea50d1a6e5	DK	DNK	208	Denmark 	Danska	\N
00040000-560a-4b3d-9bfb-17c29c6f7fb3	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-560a-4b3d-4bde-de6e3ebdd9b2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-4b3d-f9da-5421b50aa4dd	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-560a-4b3d-8b50-a19e5b07bf16	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-560a-4b3d-8cae-eca0f78b8ad5	EG	EGY	818	Egypt 	Egipt	\N
00040000-560a-4b3d-df53-9555f24605db	SV	SLV	222	El Salvador 	Salvador	\N
00040000-560a-4b3d-cb44-b65f9893295b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-560a-4b3d-bbdd-41ebe506e80a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-560a-4b3d-c22d-e911dc985a2b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-560a-4b3d-a56e-b1cbb6b39c58	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-560a-4b3d-9af5-33b7c09f2eb5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-560a-4b3d-11b6-045438a205fc	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-560a-4b3d-fecf-7c30efafa0b3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-560a-4b3d-9b7d-322290583317	FI	FIN	246	Finland 	Finska	\N
00040000-560a-4b3d-57fd-d11003e39b5b	FR	FRA	250	France 	Francija	\N
00040000-560a-4b3d-d3b4-1d32b863a8c9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-560a-4b3d-d89c-baeb909aefa3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-560a-4b3d-e307-15e0d4bebc45	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-560a-4b3d-4504-f6c38a7ee4fe	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-560a-4b3d-6db8-b2a092374f26	GA	GAB	266	Gabon 	Gabon	\N
00040000-560a-4b3d-bc6e-f8a923fba349	GM	GMB	270	Gambia 	Gambija	\N
00040000-560a-4b3d-0646-c4d1edf6f320	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-560a-4b3d-6cc6-04815c843585	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-560a-4b3d-1504-e288b9d930a0	GH	GHA	288	Ghana 	Gana	\N
00040000-560a-4b3d-736e-17967ea72685	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-560a-4b3d-cd30-54bb473c0b52	GR	GRC	300	Greece 	Grčija	\N
00040000-560a-4b3d-7401-c620b58fcf5e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-560a-4b3d-c578-7cc534aa7058	GD	GRD	308	Grenada 	Grenada	\N
00040000-560a-4b3d-85ae-84e520939da7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-560a-4b3d-437c-8284e32ea1ce	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-560a-4b3d-065a-ea4fe48f099a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-560a-4b3d-38c7-2f4340ea04d9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-560a-4b3d-0cde-f0b819c3cab7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-560a-4b3d-86b8-f39705e1554d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-560a-4b3d-c5c6-5500ae4a2000	GY	GUY	328	Guyana 	Gvajana	\N
00040000-560a-4b3d-e587-565c2c831193	HT	HTI	332	Haiti 	Haiti	\N
00040000-560a-4b3d-7d75-fb2966ce9ac0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-560a-4b3d-1dbf-58dacf5bb5c6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-560a-4b3d-219f-4fd62be032f5	HN	HND	340	Honduras 	Honduras	\N
00040000-560a-4b3d-c5db-06ac23578d9a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-560a-4b3d-ea4f-4853416282c0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-560a-4b3d-e45d-e769956eeaa8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-560a-4b3d-3851-88c61b4aeb79	IN	IND	356	India 	Indija	\N
00040000-560a-4b3d-38b9-924af0fe3627	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-560a-4b3d-391c-76ee4851ff7f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-560a-4b3d-9084-a0787bdd3a55	IQ	IRQ	368	Iraq 	Irak	\N
00040000-560a-4b3d-f8d4-3f1b40952d74	IE	IRL	372	Ireland 	Irska	\N
00040000-560a-4b3d-52d7-c74227dba15d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-560a-4b3d-09eb-66b2b583e232	IL	ISR	376	Israel 	Izrael	\N
00040000-560a-4b3d-91ca-9584745d4160	IT	ITA	380	Italy 	Italija	\N
00040000-560a-4b3d-6997-7709e85c01bf	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-560a-4b3d-fe72-7ea56c2b45dc	JP	JPN	392	Japan 	Japonska	\N
00040000-560a-4b3d-2d56-b593ec0e413e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-560a-4b3d-b226-5b2ac78ceccd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-560a-4b3d-cadc-608c8b265776	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-560a-4b3d-f1ce-e011d377eba4	KE	KEN	404	Kenya 	Kenija	\N
00040000-560a-4b3d-058f-259ea9e8acce	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-560a-4b3d-e5d3-7ecd4e339a8c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-560a-4b3d-f8ca-a9ce58d0007f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-560a-4b3d-5823-1a0ea4428f59	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-560a-4b3d-09af-a440814d566c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-560a-4b3d-d504-52f6df105996	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-560a-4b3d-66a5-3abb83e918cc	LV	LVA	428	Latvia 	Latvija	\N
00040000-560a-4b3d-08b2-4da079459a15	LB	LBN	422	Lebanon 	Libanon	\N
00040000-560a-4b3d-2658-eaa278e3414f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-560a-4b3d-7599-3ffb761c5d1e	LR	LBR	430	Liberia 	Liberija	\N
00040000-560a-4b3d-b38f-c79a1314b804	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-560a-4b3d-b9f3-2acc49e6fe98	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-560a-4b3d-5bf4-2b6046ad80e9	LT	LTU	440	Lithuania 	Litva	\N
00040000-560a-4b3d-edb3-71215a0bb533	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-560a-4b3d-a848-319d1ef846ad	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-560a-4b3d-eefd-2843f6066fd7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-560a-4b3d-4992-d0e7a48f3782	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-560a-4b3d-e39d-028988c9113b	MW	MWI	454	Malawi 	Malavi	\N
00040000-560a-4b3d-b67c-80baf0dee3ba	MY	MYS	458	Malaysia 	Malezija	\N
00040000-560a-4b3d-0566-a6be6898d27e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-560a-4b3d-79ef-5ccaa40da592	ML	MLI	466	Mali 	Mali	\N
00040000-560a-4b3d-627d-19f74f507a93	MT	MLT	470	Malta 	Malta	\N
00040000-560a-4b3d-28e8-ff306c52308e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-560a-4b3d-c8bf-e4231f26a52f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-560a-4b3d-1854-006dc5d2fefe	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-560a-4b3d-4456-4a6f2577d04e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-560a-4b3d-4963-94e6c58e05f8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-560a-4b3d-3283-8a5b0d52b394	MX	MEX	484	Mexico 	Mehika	\N
00040000-560a-4b3d-18f5-fab943cc2f85	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-560a-4b3d-4d02-21955450e696	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-560a-4b3d-bca1-720ac1838604	MC	MCO	492	Monaco 	Monako	\N
00040000-560a-4b3d-bb44-b19c53eaf6c5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-560a-4b3d-d2d9-4f547f22e356	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-560a-4b3d-96d8-d908ecca8de5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-560a-4b3d-e9fa-4de95c62b3b3	MA	MAR	504	Morocco 	Maroko	\N
00040000-560a-4b3d-632d-dea86b5a9bbb	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-560a-4b3d-d497-c365b166b0db	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-560a-4b3d-7b3c-03e9f23da4c4	NA	NAM	516	Namibia 	Namibija	\N
00040000-560a-4b3d-ea45-5e4035dfd46c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-560a-4b3d-fa05-9720ad1c0a27	NP	NPL	524	Nepal 	Nepal	\N
00040000-560a-4b3d-4d64-48fb3a9ca1d8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-560a-4b3d-b00e-4a9a1dd65729	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-560a-4b3d-8ea0-66de9a62ade6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-560a-4b3d-0c66-352f355ce49d	NE	NER	562	Niger 	Niger 	\N
00040000-560a-4b3d-9a71-3f03145e2d0a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-560a-4b3d-b8e2-6747fdc8c2ac	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-560a-4b3d-47c0-195e2dfe76c6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-560a-4b3d-e050-3b97ada76c40	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-560a-4b3d-cc2d-5afeb6edc3e0	NO	NOR	578	Norway 	Norveška	\N
00040000-560a-4b3d-9668-5f3bf674ac4e	OM	OMN	512	Oman 	Oman	\N
00040000-560a-4b3d-cbda-8d67f656bec2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-560a-4b3d-ee0f-25b4deb3ad3a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-560a-4b3d-2ee5-dd07a39f9167	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-560a-4b3d-9833-44f4ab344b38	PA	PAN	591	Panama 	Panama	\N
00040000-560a-4b3d-906c-95d539005692	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-560a-4b3d-da9e-38b1d7729d8e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-560a-4b3d-1389-c4e1ce72f067	PE	PER	604	Peru 	Peru	\N
00040000-560a-4b3d-a607-1c70a797b445	PH	PHL	608	Philippines 	Filipini	\N
00040000-560a-4b3d-8942-0791894759f2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-560a-4b3d-f248-5d20be299970	PL	POL	616	Poland 	Poljska	\N
00040000-560a-4b3d-c2f7-ab6d689acd14	PT	PRT	620	Portugal 	Portugalska	\N
00040000-560a-4b3d-17d2-02d4f5fff857	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-560a-4b3d-9771-acf8482f802d	QA	QAT	634	Qatar 	Katar	\N
00040000-560a-4b3d-828d-4cca10669f35	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-560a-4b3d-aa91-08bb26c07cda	RO	ROU	642	Romania 	Romunija	\N
00040000-560a-4b3d-e5f7-60cc4835ea39	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-560a-4b3d-2d61-463305b09c03	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-560a-4b3d-910d-5b0a5de1aad4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-560a-4b3d-2646-8e47147a2476	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-560a-4b3d-465f-ec12e42b5bc7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-560a-4b3d-868c-c47251b70344	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-560a-4b3d-a96d-7c8a9ef409d1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-560a-4b3d-74b5-262d0001d117	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-560a-4b3d-a0e5-c0a37d63e3b0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-560a-4b3d-bb34-da8179168599	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-560a-4b3d-ccb9-e5de60c4064f	SM	SMR	674	San Marino 	San Marino	\N
00040000-560a-4b3d-f640-543c0a80f2d8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-560a-4b3d-a786-c080f8f99443	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-560a-4b3d-df65-b2ee18d8213b	SN	SEN	686	Senegal 	Senegal	\N
00040000-560a-4b3d-0276-8805eb2829bf	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-560a-4b3d-91bc-b62defe5f416	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-560a-4b3d-57f7-69e88f8ebbff	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-560a-4b3d-3fa0-817a07c196da	SG	SGP	702	Singapore 	Singapur	\N
00040000-560a-4b3d-59d3-6992c442021b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-560a-4b3d-6f9d-48b842e45b3e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-560a-4b3d-bc24-406c9a9a57d0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-560a-4b3d-5487-7a342b218d14	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-560a-4b3d-718d-2fed26fb2926	SO	SOM	706	Somalia 	Somalija	\N
00040000-560a-4b3d-0992-7b53a954c0a8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-560a-4b3d-1555-9b53e2614d3d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-560a-4b3d-e54c-9bcba5660899	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-560a-4b3d-66a9-806e4c5766bf	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-560a-4b3d-830b-0703c31421a4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-560a-4b3d-20e4-da8b0ef58b40	SD	SDN	729	Sudan 	Sudan	\N
00040000-560a-4b3d-ab00-04da0c2e83f3	SR	SUR	740	Suriname 	Surinam	\N
00040000-560a-4b3d-b495-672043b457e6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-560a-4b3d-3530-5191d4b08130	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-560a-4b3d-a315-ca5f217d7d06	SE	SWE	752	Sweden 	Švedska	\N
00040000-560a-4b3d-ccd0-4961196826b3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-560a-4b3d-e371-7ec14e4b6a8b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-560a-4b3d-47b6-5c72f4e2619a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-560a-4b3d-ed0a-488b69fea7b6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-560a-4b3d-4fb5-aa070286d072	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-560a-4b3d-1966-e499b5aeda7b	TH	THA	764	Thailand 	Tajska	\N
00040000-560a-4b3d-842e-f95ee95f35f5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-560a-4b3d-74d1-b7699bb8a7e0	TG	TGO	768	Togo 	Togo	\N
00040000-560a-4b3d-2725-5b201978a7f7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-560a-4b3d-e138-c1fe3e91f19f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-560a-4b3d-ff3f-4bf9d9b2ebdf	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-560a-4b3d-4576-fc1e86d3d5b9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-560a-4b3d-7225-f0be9bd06cc2	TR	TUR	792	Turkey 	Turčija	\N
00040000-560a-4b3d-4f72-43730bc04277	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-560a-4b3d-ec13-4a2ff810fdda	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-4b3d-af67-772f28266174	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-560a-4b3d-79e1-83f4b204b917	UG	UGA	800	Uganda 	Uganda	\N
00040000-560a-4b3d-20c0-a8592783b876	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-560a-4b3d-fe4f-7fcfbc567c65	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-560a-4b3d-170b-2702045d4ba9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-560a-4b3d-eeef-06ef42d22e56	US	USA	840	United States 	Združene države Amerike	\N
00040000-560a-4b3d-ec0b-5b46498933cc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-560a-4b3d-a850-302780c30762	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-560a-4b3d-7435-121db3682e30	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-560a-4b3d-4d62-b23037aa47ac	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-560a-4b3d-a293-4d73d1025171	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-560a-4b3d-12ee-45f0d4770903	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-560a-4b3d-7ea7-3d07969131b9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-4b3d-f384-0852d5bb1fd1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-560a-4b3d-d338-97fd0569ba25	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-560a-4b3d-39b0-0e3482eaf39a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-560a-4b3d-05d1-9c55bd9626e9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-560a-4b3d-96f5-4dda83407bfa	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-560a-4b3d-75e5-138f95b2c234	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3026 (class 0 OID 21019737)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-560a-4b3f-dbec-e8451e7a0a52	000e0000-560a-4b3f-1eed-a78889f844cd	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-4b3d-1a33-f7104a073237	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-4b3f-e58d-f02338e3469e	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-4b3d-8ce2-a324108ed2fd	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-4b3f-85c4-0343523462ae	000e0000-560a-4b3f-f8bd-1157d04d20ab	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-4b3d-1a33-f7104a073237	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-4b3f-a99a-11e3a2cb7bbb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-4b3f-0aff-0f830c690dd5	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 21019539)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-560a-4b3f-833a-a3954993eba8	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-14ce-0bfb5e45ab1b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-4b3d-8c81-40afdec539d4
000d0000-560a-4b3f-94ca-2b6be13f95b9	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-bfbe-50318b244a19	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-560a-4b3d-3ee9-69d950c99554
000d0000-560a-4b3f-95ea-b0f910e4cee9	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-7e43-3d8e74044fcc	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-560a-4b3d-763c-cdc56daaf9f9
000d0000-560a-4b3f-d75f-401d4d840cb1	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-b465-8188b24b6e57	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-560a-4b3d-2a97-e9e6d35199f8
000d0000-560a-4b3f-4684-6357417752c0	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-b632-456bff7cd804	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-560a-4b3d-2a97-e9e6d35199f8
000d0000-560a-4b3f-28ff-f7fddefc2135	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-0235-82565e0a79bb	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-4b3d-8c81-40afdec539d4
000d0000-560a-4b3f-0cc3-117bc3778025	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-bfaa-65ceeeb5e582	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-560a-4b3d-8c81-40afdec539d4
000d0000-560a-4b3f-7b66-183ca2922d8f	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-6e0b-b93f4da3136e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-560a-4b3d-3ba5-9b383d48655e
000d0000-560a-4b3f-77a6-c20b78bc488e	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	000c0000-560a-4b3f-fb6f-39ec55abb3cf	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-560a-4b3d-108f-26ed50346517
\.


--
-- TOC entry 2991 (class 0 OID 21019353)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21019328)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21019305)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-560a-4b3f-aba8-3e9d96995648	00080000-560a-4b3f-13c9-fb7f154a84e2	00090000-560a-4b3f-352f-01011e5a35ed	AK		igralka
\.


--
-- TOC entry 3000 (class 0 OID 21019453)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21019947)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21019959)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21019981)
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
-- TOC entry 3004 (class 0 OID 21019478)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21019262)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-560a-4b3d-e578-20cc865b0505	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-560a-4b3d-e24f-6421c7ae7c90	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-560a-4b3d-5ca3-30007435defb	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-560a-4b3d-02a4-930b158faf2e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-560a-4b3d-f7c0-3bf0a8264839	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-560a-4b3d-6bda-0dcbdebec6ed	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-560a-4b3d-f43c-2ceb1fd76bea	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-560a-4b3d-c734-c47c567d269c	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-4b3d-4a51-a51d8ac588cc	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-4b3d-1f99-181187267ffd	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-560a-4b3d-9745-916e10e7e5eb	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-560a-4b3d-daaa-b2f9699c63a2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-560a-4b3d-c957-ebec0b1b8601	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-560a-4b3d-5490-83eff992bc92	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-560a-4b3d-f6ef-7c2af940fafc	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-560a-4b3f-ff41-41b21ccecbfd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-560a-4b3f-b653-f7de3b15ba6a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-560a-4b3f-7add-02e85fb1eec8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-560a-4b3f-f945-b1409f2e04f2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-560a-4b3f-a258-2234623e3d13	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-560a-4b40-6791-40e98aef49f3	application.tenant.maticnopodjetje	string	s:36:"00080000-560a-4b40-de73-de58f4e6ef33";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2978 (class 0 OID 21019176)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-560a-4b3f-cc63-054ea8207d19	00000000-560a-4b3f-ff41-41b21ccecbfd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-560a-4b3f-d195-ee9e7b72c91d	00000000-560a-4b3f-ff41-41b21ccecbfd	00010000-560a-4b3d-7420-cec5321fc368	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-560a-4b3f-9ee9-6c72ac2b23b4	00000000-560a-4b3f-b653-f7de3b15ba6a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2979 (class 0 OID 21019187)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-560a-4b3f-817d-846e965eab29	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-560a-4b3f-7c5f-e9eef1b04a5e	00010000-560a-4b3f-e9e5-cf754a63f50b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-560a-4b3f-6d44-f866c454f557	00010000-560a-4b3f-9b12-34fdf9911931	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-560a-4b3f-0ed2-b54859127625	00010000-560a-4b3f-6257-e8068ab75522	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-560a-4b3f-1f2d-2eaad70bc0c8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-560a-4b3f-d906-d770c01b9392	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-560a-4b3f-e461-3fad8b5496f9	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-560a-4b3f-3ad4-fcd9226da130	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-560a-4b3f-352f-01011e5a35ed	00010000-560a-4b3f-9a08-de2317923aa9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-560a-4b3f-f385-fbb5cbdeff1a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-560a-4b3f-0a50-e07573af1d83	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-4b3f-3de3-cbea06cd3088	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-560a-4b3f-6075-ab93eaa54da8	00010000-560a-4b3f-7a40-ab99a7940bb0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-4b3f-6dfb-1d156151ff3d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-4b3f-9cbf-a7128ffae6a9	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-4b3f-d315-c51fe34b7242	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-4b3f-377d-a9d21a12da82	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-560a-4b3f-939c-16341682036e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 21019141)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-560a-4b3d-187a-971a42891381	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-560a-4b3d-c769-e93c54d33fb0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-560a-4b3d-5200-cce708e19c2e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-560a-4b3d-f1e2-686750d83b3e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-560a-4b3d-a4ed-e7197552ad0e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-560a-4b3d-ab14-0a8d0c026947	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-560a-4b3d-ad41-0ddc6943a8d3	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-560a-4b3d-9285-20e2659dc7d2	Abonma-read	Abonma - branje	f
00030000-560a-4b3d-0d9d-e6a5d0270d5b	Abonma-write	Abonma - spreminjanje	f
00030000-560a-4b3d-ac39-fbe6efe436c4	Alternacija-read	Alternacija - branje	f
00030000-560a-4b3d-afa7-4306fb90a0f1	Alternacija-write	Alternacija - spreminjanje	f
00030000-560a-4b3d-f5db-60142bdb5ba7	Arhivalija-read	Arhivalija - branje	f
00030000-560a-4b3d-b584-46d732d772f0	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-560a-4b3d-086e-7230a5aae983	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-560a-4b3d-df91-2a5063f0ddd6	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-560a-4b3d-43ca-9c4870e9d03c	Besedilo-read	Besedilo - branje	f
00030000-560a-4b3d-cacf-a69dc831b5d5	Besedilo-write	Besedilo - spreminjanje	f
00030000-560a-4b3d-3ba4-d261676be3dd	DogodekIzven-read	DogodekIzven - branje	f
00030000-560a-4b3d-7aed-0c035b528a0d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-560a-4b3d-c805-19d33aafe89a	Dogodek-read	Dogodek - branje	f
00030000-560a-4b3d-e07f-41e9cb968370	Dogodek-write	Dogodek - spreminjanje	f
00030000-560a-4b3d-34da-fa751bf57763	DrugiVir-read	DrugiVir - branje	f
00030000-560a-4b3d-23b1-75155d940dde	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-560a-4b3d-623b-5e652668359b	Drzava-read	Drzava - branje	f
00030000-560a-4b3d-0191-6b10c0468da7	Drzava-write	Drzava - spreminjanje	f
00030000-560a-4b3d-897d-3b040ab36833	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-560a-4b3d-a6a8-d60815372c82	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-560a-4b3d-b83f-5df3b1cbfc51	Funkcija-read	Funkcija - branje	f
00030000-560a-4b3d-6376-9a92982add18	Funkcija-write	Funkcija - spreminjanje	f
00030000-560a-4b3d-8656-6c1f48a39257	Gostovanje-read	Gostovanje - branje	f
00030000-560a-4b3d-abf1-87578f81656d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-560a-4b3d-d5d1-d87feab74126	Gostujoca-read	Gostujoca - branje	f
00030000-560a-4b3d-9175-62817db3a445	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-560a-4b3d-1c37-a24c06efc191	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-560a-4b3d-fad9-0c5ba5e42f18	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-560a-4b3d-3401-8f3b410efd09	Kupec-read	Kupec - branje	f
00030000-560a-4b3d-9b33-4d0070db2e47	Kupec-write	Kupec - spreminjanje	f
00030000-560a-4b3d-14a8-38a3dd796bf3	NacinPlacina-read	NacinPlacina - branje	f
00030000-560a-4b3d-6e30-5044088ccd81	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-560a-4b3d-881b-4513749a52c7	Option-read	Option - branje	f
00030000-560a-4b3d-bcdb-5c99024259af	Option-write	Option - spreminjanje	f
00030000-560a-4b3d-d871-6e1e83308b31	OptionValue-read	OptionValue - branje	f
00030000-560a-4b3d-9450-831b3621426a	OptionValue-write	OptionValue - spreminjanje	f
00030000-560a-4b3d-93e6-0f835f72665a	Oseba-read	Oseba - branje	f
00030000-560a-4b3d-4abc-1dbdbde25454	Oseba-write	Oseba - spreminjanje	f
00030000-560a-4b3d-e10b-0aead3d7bbd4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-560a-4b3d-4672-c7b62a52d41f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-560a-4b3d-7489-5d61b2623446	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-560a-4b3d-e6a2-8a1c79094188	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-560a-4b3d-de6f-09cf82629c0b	Pogodba-read	Pogodba - branje	f
00030000-560a-4b3d-10cc-369abb1dbe9a	Pogodba-write	Pogodba - spreminjanje	f
00030000-560a-4b3d-40d6-97e08cbf11e3	Popa-read	Popa - branje	f
00030000-560a-4b3d-ffdd-3de2673afc78	Popa-write	Popa - spreminjanje	f
00030000-560a-4b3d-7518-abe1b82d02ad	Posta-read	Posta - branje	f
00030000-560a-4b3d-9c14-25226c3a06a9	Posta-write	Posta - spreminjanje	f
00030000-560a-4b3d-89b5-35677ffb8ecd	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-560a-4b3d-05bd-d5550e2dbb79	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-560a-4b3d-1aae-49d5e68db2b9	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-560a-4b3d-2443-64e07a797052	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-560a-4b3d-1de0-608908e78032	PostniNaslov-read	PostniNaslov - branje	f
00030000-560a-4b3d-2f02-a794a8f61990	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-560a-4b3d-c97a-6020e19b0a13	Predstava-read	Predstava - branje	f
00030000-560a-4b3d-d629-6fcc2e104c86	Predstava-write	Predstava - spreminjanje	f
00030000-560a-4b3d-d921-e39e2ebdbee1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-560a-4b3d-2f55-207b83698b0d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-560a-4b3d-4780-7c21070752d8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-560a-4b3d-5b72-3ea09b613f9e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-560a-4b3d-bde9-d8c6ea9c4a02	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-560a-4b3d-217f-c01744fbc3f2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-560a-4b3d-4f59-0283e3d02086	ProgramDela-read	ProgramDela - branje	f
00030000-560a-4b3d-d2f7-65e4ed3538e9	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-560a-4b3d-1a11-adcdf18c6f1e	ProgramFestival-read	ProgramFestival - branje	f
00030000-560a-4b3d-98c6-5a69d21ba69f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-560a-4b3d-d548-0143d70351c1	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-560a-4b3d-f1da-a57ab084ba75	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-560a-4b3d-a4d6-b838b0ccee70	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-560a-4b3d-b3d1-09610fe6b33d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-560a-4b3d-79d6-9fa67eeac3da	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-560a-4b3d-c0d7-41f94f84c59c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-560a-4b3d-6a2a-a08c47787a6e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-560a-4b3d-32dc-a58d3f991c4c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-560a-4b3d-dc7c-b40d939c8cd3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-560a-4b3d-a58a-e2dc83a2d5cc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-560a-4b3d-7bb7-b20e9d0c0fc2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-560a-4b3d-2791-5d79ec0941a0	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-560a-4b3d-c4e4-2035e888ba73	ProgramRazno-read	ProgramRazno - branje	f
00030000-560a-4b3d-edb8-581473a3cf66	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-560a-4b3d-c34f-6da9ca3c6378	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-560a-4b3d-1e75-a8a3f5a260b9	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-560a-4b3d-0c18-a504c63f757f	Prostor-read	Prostor - branje	f
00030000-560a-4b3d-62f9-18866c0eb6ff	Prostor-write	Prostor - spreminjanje	f
00030000-560a-4b3d-fd93-791d21f155f2	Racun-read	Racun - branje	f
00030000-560a-4b3d-7ad5-c44f9e2a7ae5	Racun-write	Racun - spreminjanje	f
00030000-560a-4b3d-658b-7b510903cafb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-560a-4b3d-8052-a61f96e5657b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-560a-4b3d-632c-e71248a36f04	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-560a-4b3d-a956-9f17499082c8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-560a-4b3d-30e1-bb885b141b5f	Rekvizit-read	Rekvizit - branje	f
00030000-560a-4b3d-e5f3-c0b84b5ed5db	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-560a-4b3d-41e2-45679376a75f	Revizija-read	Revizija - branje	f
00030000-560a-4b3d-e4b8-809eb27c2455	Revizija-write	Revizija - spreminjanje	f
00030000-560a-4b3d-51e0-a045aa421877	Rezervacija-read	Rezervacija - branje	f
00030000-560a-4b3d-5844-c0c2a5d244e2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-560a-4b3d-4c65-c83bfa0771f7	SedezniRed-read	SedezniRed - branje	f
00030000-560a-4b3d-91b8-37891025b262	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-560a-4b3d-adb7-e95b0dea12a9	Sedez-read	Sedez - branje	f
00030000-560a-4b3d-f933-048bb5ae5b69	Sedez-write	Sedez - spreminjanje	f
00030000-560a-4b3d-98ec-7ea8af0090e7	Sezona-read	Sezona - branje	f
00030000-560a-4b3d-1c80-15e3bd558567	Sezona-write	Sezona - spreminjanje	f
00030000-560a-4b3d-d9b5-f314e760f016	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-560a-4b3d-9cf5-a5d1c90fd41d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-560a-4b3d-30f4-5eab558b9232	Stevilcenje-read	Stevilcenje - branje	f
00030000-560a-4b3d-92b3-12b935a600e4	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-560a-4b3d-efd7-bbfffe6a4d5c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-560a-4b3d-be91-0d91a29c345a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-560a-4b3d-7f51-1b445560e1fb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-560a-4b3d-5f50-19502e857cc0	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-560a-4b3d-9c20-88e058fc4b3c	Telefonska-read	Telefonska - branje	f
00030000-560a-4b3d-2bfa-43e92716b350	Telefonska-write	Telefonska - spreminjanje	f
00030000-560a-4b3d-b7e5-5606cba9ce7b	TerminStoritve-read	TerminStoritve - branje	f
00030000-560a-4b3d-bb69-1c792e6cadf8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-560a-4b3d-5832-aa42f2cc6881	TipFunkcije-read	TipFunkcije - branje	f
00030000-560a-4b3d-7c60-31f6fd923078	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-560a-4b3d-23e4-88d0facbddb9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-560a-4b3d-7ee8-2dda7019e83d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-560a-4b3d-5c6f-caaaa418102e	Trr-read	Trr - branje	f
00030000-560a-4b3d-fbaf-ecc7bf478a1c	Trr-write	Trr - spreminjanje	f
00030000-560a-4b3d-ad1e-59631e721faf	Uprizoritev-read	Uprizoritev - branje	f
00030000-560a-4b3d-ae07-e10664a0059a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-560a-4b3d-c49e-96e43efb2334	Vaja-read	Vaja - branje	f
00030000-560a-4b3d-85ff-5751de9bc41e	Vaja-write	Vaja - spreminjanje	f
00030000-560a-4b3d-3ced-f275e9ad34b0	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-560a-4b3d-b3e4-ceb9a5e07c53	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-560a-4b3d-b4ae-847b1a694dd5	VrstaStroska-read	VrstaStroska - branje	f
00030000-560a-4b3d-79a8-31d3c20b7dfd	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-560a-4b3d-854e-340dfab17d32	Zaposlitev-read	Zaposlitev - branje	f
00030000-560a-4b3d-fef1-9eac88b85e25	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-560a-4b3d-8720-4b504760424d	Zasedenost-read	Zasedenost - branje	f
00030000-560a-4b3d-bd4d-334db633ebf9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-560a-4b3d-4265-1c46dbdc6c6b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-560a-4b3d-f628-bc5fcd81859f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-560a-4b3d-a4c5-55bcd4991e19	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-560a-4b3d-24aa-9e29c178afc6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-560a-4b3d-68f3-feb19a147e2d	Job-read	Branje opravil - samo zase - branje	f
00030000-560a-4b3d-b0a5-f62b80c05be9	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-560a-4b3d-a137-972e7edb1a60	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-560a-4b3d-259d-73e16c00eeac	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-560a-4b3d-7313-0a8aa8e66f3e	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-560a-4b3d-54e5-15d127c28496	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-560a-4b3d-26ce-b075cbce4f93	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-560a-4b3d-e731-7931e95416e1	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-4b3d-1f2e-06f0861c4f2a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-4b3d-5b24-225724164f19	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-4b3d-cdab-7568260be2ab	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-4b3d-333c-8317e9f91d0a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-560a-4b3d-df6a-232b8eafb375	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-560a-4b3d-6cf7-88389393bb75	Datoteka-write	Datoteka - spreminjanje	f
00030000-560a-4b3d-1065-6ec42646820b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2976 (class 0 OID 21019160)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-560a-4b3d-1af8-5c8a3b6f5ad6	00030000-560a-4b3d-c769-e93c54d33fb0
00020000-560a-4b3d-148f-797c4993cb94	00030000-560a-4b3d-623b-5e652668359b
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-9285-20e2659dc7d2
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-0d9d-e6a5d0270d5b
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-ac39-fbe6efe436c4
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-afa7-4306fb90a0f1
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-f5db-60142bdb5ba7
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-c805-19d33aafe89a
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-f1e2-686750d83b3e
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-e07f-41e9cb968370
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-623b-5e652668359b
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-0191-6b10c0468da7
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-b83f-5df3b1cbfc51
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-6376-9a92982add18
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-8656-6c1f48a39257
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-abf1-87578f81656d
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-d5d1-d87feab74126
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-9175-62817db3a445
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-1c37-a24c06efc191
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-fad9-0c5ba5e42f18
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-881b-4513749a52c7
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-d871-6e1e83308b31
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-93e6-0f835f72665a
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-4abc-1dbdbde25454
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-40d6-97e08cbf11e3
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-ffdd-3de2673afc78
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-7518-abe1b82d02ad
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-9c14-25226c3a06a9
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-1de0-608908e78032
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-2f02-a794a8f61990
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-c97a-6020e19b0a13
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-d629-6fcc2e104c86
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-bde9-d8c6ea9c4a02
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-217f-c01744fbc3f2
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-0c18-a504c63f757f
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-62f9-18866c0eb6ff
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-632c-e71248a36f04
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-a956-9f17499082c8
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-30e1-bb885b141b5f
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-e5f3-c0b84b5ed5db
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-98ec-7ea8af0090e7
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-1c80-15e3bd558567
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-5832-aa42f2cc6881
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-ad1e-59631e721faf
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-ae07-e10664a0059a
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-c49e-96e43efb2334
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-85ff-5751de9bc41e
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-8720-4b504760424d
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-bd4d-334db633ebf9
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-4265-1c46dbdc6c6b
00020000-560a-4b3d-9216-0bad07bcd365	00030000-560a-4b3d-a4c5-55bcd4991e19
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-9285-20e2659dc7d2
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-f5db-60142bdb5ba7
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-c805-19d33aafe89a
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-623b-5e652668359b
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-8656-6c1f48a39257
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-d5d1-d87feab74126
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-1c37-a24c06efc191
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-fad9-0c5ba5e42f18
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-881b-4513749a52c7
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-d871-6e1e83308b31
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-93e6-0f835f72665a
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-4abc-1dbdbde25454
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-40d6-97e08cbf11e3
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-7518-abe1b82d02ad
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-1de0-608908e78032
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-2f02-a794a8f61990
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-c97a-6020e19b0a13
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-0c18-a504c63f757f
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-632c-e71248a36f04
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-30e1-bb885b141b5f
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-98ec-7ea8af0090e7
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-9c20-88e058fc4b3c
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-2bfa-43e92716b350
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-5c6f-caaaa418102e
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-fbaf-ecc7bf478a1c
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-854e-340dfab17d32
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-fef1-9eac88b85e25
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-4265-1c46dbdc6c6b
00020000-560a-4b3d-ce72-d45235b7ef5c	00030000-560a-4b3d-a4c5-55bcd4991e19
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-9285-20e2659dc7d2
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-ac39-fbe6efe436c4
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-f5db-60142bdb5ba7
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-b584-46d732d772f0
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-43ca-9c4870e9d03c
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-3ba4-d261676be3dd
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-c805-19d33aafe89a
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-623b-5e652668359b
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-b83f-5df3b1cbfc51
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-8656-6c1f48a39257
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-d5d1-d87feab74126
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-1c37-a24c06efc191
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-881b-4513749a52c7
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-d871-6e1e83308b31
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-93e6-0f835f72665a
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-40d6-97e08cbf11e3
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-7518-abe1b82d02ad
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-c97a-6020e19b0a13
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-bde9-d8c6ea9c4a02
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-0c18-a504c63f757f
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-632c-e71248a36f04
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-30e1-bb885b141b5f
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-98ec-7ea8af0090e7
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-5832-aa42f2cc6881
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-c49e-96e43efb2334
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-8720-4b504760424d
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-4265-1c46dbdc6c6b
00020000-560a-4b3d-d5e8-51fa99f02d03	00030000-560a-4b3d-a4c5-55bcd4991e19
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-9285-20e2659dc7d2
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-0d9d-e6a5d0270d5b
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-afa7-4306fb90a0f1
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-f5db-60142bdb5ba7
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-c805-19d33aafe89a
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-623b-5e652668359b
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-8656-6c1f48a39257
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-d5d1-d87feab74126
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-881b-4513749a52c7
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-d871-6e1e83308b31
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-40d6-97e08cbf11e3
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-7518-abe1b82d02ad
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-c97a-6020e19b0a13
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-0c18-a504c63f757f
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-632c-e71248a36f04
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-30e1-bb885b141b5f
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-98ec-7ea8af0090e7
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-5832-aa42f2cc6881
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-4265-1c46dbdc6c6b
00020000-560a-4b3d-3f19-74421ba657ca	00030000-560a-4b3d-a4c5-55bcd4991e19
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-9285-20e2659dc7d2
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-f5db-60142bdb5ba7
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-c805-19d33aafe89a
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-623b-5e652668359b
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-8656-6c1f48a39257
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-d5d1-d87feab74126
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-881b-4513749a52c7
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-d871-6e1e83308b31
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-40d6-97e08cbf11e3
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-7518-abe1b82d02ad
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-c97a-6020e19b0a13
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-0c18-a504c63f757f
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-632c-e71248a36f04
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-30e1-bb885b141b5f
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-98ec-7ea8af0090e7
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-b7e5-5606cba9ce7b
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-5200-cce708e19c2e
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-5832-aa42f2cc6881
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-4265-1c46dbdc6c6b
00020000-560a-4b3d-7abf-980443520ca9	00030000-560a-4b3d-a4c5-55bcd4991e19
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-187a-971a42891381
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-c769-e93c54d33fb0
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-5200-cce708e19c2e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-f1e2-686750d83b3e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-a4ed-e7197552ad0e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-ab14-0a8d0c026947
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-ad41-0ddc6943a8d3
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-9285-20e2659dc7d2
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-0d9d-e6a5d0270d5b
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-ac39-fbe6efe436c4
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-afa7-4306fb90a0f1
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-f5db-60142bdb5ba7
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-b584-46d732d772f0
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-43ca-9c4870e9d03c
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-cacf-a69dc831b5d5
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-3ba4-d261676be3dd
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7aed-0c035b528a0d
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-c805-19d33aafe89a
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-e07f-41e9cb968370
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-623b-5e652668359b
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-0191-6b10c0468da7
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-34da-fa751bf57763
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-23b1-75155d940dde
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-897d-3b040ab36833
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-a6a8-d60815372c82
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-b83f-5df3b1cbfc51
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-6376-9a92982add18
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-8656-6c1f48a39257
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-abf1-87578f81656d
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-d5d1-d87feab74126
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-9175-62817db3a445
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-1c37-a24c06efc191
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-fad9-0c5ba5e42f18
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-3401-8f3b410efd09
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-9b33-4d0070db2e47
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-14a8-38a3dd796bf3
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-6e30-5044088ccd81
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-881b-4513749a52c7
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-bcdb-5c99024259af
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-d871-6e1e83308b31
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-9450-831b3621426a
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-93e6-0f835f72665a
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-4abc-1dbdbde25454
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-e10b-0aead3d7bbd4
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-4672-c7b62a52d41f
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7489-5d61b2623446
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-e6a2-8a1c79094188
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-de6f-09cf82629c0b
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-10cc-369abb1dbe9a
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-40d6-97e08cbf11e3
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-ffdd-3de2673afc78
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7518-abe1b82d02ad
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-9c14-25226c3a06a9
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-89b5-35677ffb8ecd
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-05bd-d5550e2dbb79
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-1aae-49d5e68db2b9
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-2443-64e07a797052
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-1de0-608908e78032
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-2f02-a794a8f61990
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-c97a-6020e19b0a13
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-d629-6fcc2e104c86
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-d921-e39e2ebdbee1
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-2f55-207b83698b0d
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-4780-7c21070752d8
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-5b72-3ea09b613f9e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-bde9-d8c6ea9c4a02
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-217f-c01744fbc3f2
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-4f59-0283e3d02086
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-d2f7-65e4ed3538e9
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-1a11-adcdf18c6f1e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-98c6-5a69d21ba69f
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-d548-0143d70351c1
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-f1da-a57ab084ba75
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-a4d6-b838b0ccee70
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-b3d1-09610fe6b33d
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-79d6-9fa67eeac3da
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-c0d7-41f94f84c59c
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-6a2a-a08c47787a6e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-32dc-a58d3f991c4c
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-dc7c-b40d939c8cd3
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-a58a-e2dc83a2d5cc
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7bb7-b20e9d0c0fc2
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-2791-5d79ec0941a0
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-c4e4-2035e888ba73
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-edb8-581473a3cf66
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-c34f-6da9ca3c6378
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-1e75-a8a3f5a260b9
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-0c18-a504c63f757f
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-62f9-18866c0eb6ff
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-fd93-791d21f155f2
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7ad5-c44f9e2a7ae5
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-658b-7b510903cafb
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-8052-a61f96e5657b
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-632c-e71248a36f04
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-a956-9f17499082c8
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-30e1-bb885b141b5f
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-e5f3-c0b84b5ed5db
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-41e2-45679376a75f
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-e4b8-809eb27c2455
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-51e0-a045aa421877
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-5844-c0c2a5d244e2
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-4c65-c83bfa0771f7
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-91b8-37891025b262
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-adb7-e95b0dea12a9
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-f933-048bb5ae5b69
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-98ec-7ea8af0090e7
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-1c80-15e3bd558567
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-d9b5-f314e760f016
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-9cf5-a5d1c90fd41d
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-30f4-5eab558b9232
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-92b3-12b935a600e4
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-efd7-bbfffe6a4d5c
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-be91-0d91a29c345a
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7f51-1b445560e1fb
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-5f50-19502e857cc0
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-9c20-88e058fc4b3c
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-2bfa-43e92716b350
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-b7e5-5606cba9ce7b
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-bb69-1c792e6cadf8
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-5832-aa42f2cc6881
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7c60-31f6fd923078
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-23e4-88d0facbddb9
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-7ee8-2dda7019e83d
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-5c6f-caaaa418102e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-fbaf-ecc7bf478a1c
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-ad1e-59631e721faf
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-ae07-e10664a0059a
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-c49e-96e43efb2334
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-85ff-5751de9bc41e
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-3ced-f275e9ad34b0
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-b3e4-ceb9a5e07c53
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-b4ae-847b1a694dd5
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-79a8-31d3c20b7dfd
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-854e-340dfab17d32
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-fef1-9eac88b85e25
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-8720-4b504760424d
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-bd4d-334db633ebf9
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-4265-1c46dbdc6c6b
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-f628-bc5fcd81859f
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-a4c5-55bcd4991e19
00020000-560a-4b3f-1d6a-cc21ad305a49	00030000-560a-4b3d-24aa-9e29c178afc6
\.


--
-- TOC entry 3005 (class 0 OID 21019485)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21019519)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 21019655)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-560a-4b3f-314f-78871a5fe2d2	00090000-560a-4b3f-817d-846e965eab29	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-560a-4b3f-0117-a3fc1cc95085	00090000-560a-4b3f-d906-d770c01b9392	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-560a-4b3f-9c02-f151806f42bd	00090000-560a-4b3f-6075-ab93eaa54da8	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-560a-4b3f-6001-f6297f59e8d3	00090000-560a-4b3f-f385-fbb5cbdeff1a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2981 (class 0 OID 21019220)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-560a-4b3f-13c9-fb7f154a84e2	00040000-560a-4b3d-bc24-406c9a9a57d0	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b3f-2460-afbff63619cc	00040000-560a-4b3d-bc24-406c9a9a57d0	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-560a-4b3f-66b3-ac43401f093c	00040000-560a-4b3d-bc24-406c9a9a57d0	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b3f-0112-7d1465cec673	00040000-560a-4b3d-bc24-406c9a9a57d0	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b3f-a669-787c72e6352d	00040000-560a-4b3d-bc24-406c9a9a57d0	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b3f-aa0e-e0f91a39d89a	00040000-560a-4b3d-e563-24f68fbe4b4a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b3f-1517-c9983e2a996c	00040000-560a-4b3d-bd9d-d08dae2d285f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b3f-363e-cd4c1c278db9	00040000-560a-4b3d-1db4-9f0b4b3d69d7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b3f-248a-1e3b922bec51	00040000-560a-4b3d-6cc6-04815c843585	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-4b40-de73-de58f4e6ef33	00040000-560a-4b3d-bc24-406c9a9a57d0	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2983 (class 0 OID 21019254)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-560a-4b3c-0e57-9f063e46bc45	8341	Adlešiči
00050000-560a-4b3c-2de8-52131d2334bc	5270	Ajdovščina
00050000-560a-4b3c-1529-b06538cd9eb3	6280	Ankaran/Ancarano
00050000-560a-4b3c-54a9-07087a85a3b0	9253	Apače
00050000-560a-4b3c-d1bb-dd072dee7ca1	8253	Artiče
00050000-560a-4b3c-1070-de7a87625184	4275	Begunje na Gorenjskem
00050000-560a-4b3c-6ad8-4d8dacf2c279	1382	Begunje pri Cerknici
00050000-560a-4b3c-8461-5978e2babed3	9231	Beltinci
00050000-560a-4b3c-5515-e9b18e29b0e3	2234	Benedikt
00050000-560a-4b3c-ef9a-33b8397283b0	2345	Bistrica ob Dravi
00050000-560a-4b3c-11a1-bef080d76927	3256	Bistrica ob Sotli
00050000-560a-4b3c-53dd-11382f51999d	8259	Bizeljsko
00050000-560a-4b3c-21f9-1632522f2ada	1223	Blagovica
00050000-560a-4b3c-ce72-138954d2172b	8283	Blanca
00050000-560a-4b3c-a346-3195d7b09585	4260	Bled
00050000-560a-4b3c-509f-289e3bd5521b	4273	Blejska Dobrava
00050000-560a-4b3c-d774-75a99ae1bc0b	9265	Bodonci
00050000-560a-4b3c-ab2e-e31eba1fa4b2	9222	Bogojina
00050000-560a-4b3c-99b1-27630f70e49b	4263	Bohinjska Bela
00050000-560a-4b3c-a3cf-2bd6c690e7cd	4264	Bohinjska Bistrica
00050000-560a-4b3c-d4b3-ed1b38c9ca6a	4265	Bohinjsko jezero
00050000-560a-4b3c-9dde-dd5772fa23ad	1353	Borovnica
00050000-560a-4b3c-c027-b913fa78ee05	8294	Boštanj
00050000-560a-4b3c-a968-19c206abd029	5230	Bovec
00050000-560a-4b3c-86f3-f6cd488e0ca7	5295	Branik
00050000-560a-4b3c-8a57-483262ae8835	3314	Braslovče
00050000-560a-4b3c-c299-e205d7bdd439	5223	Breginj
00050000-560a-4b3c-c281-9630d2df2480	8280	Brestanica
00050000-560a-4b3c-8296-40f4faf43cb4	2354	Bresternica
00050000-560a-4b3c-220e-417caa38b7d4	4243	Brezje
00050000-560a-4b3c-681f-7cf6b37e13d2	1351	Brezovica pri Ljubljani
00050000-560a-4b3c-4395-d6efa1f41efb	8250	Brežice
00050000-560a-4b3c-9455-f4113528e629	4210	Brnik - Aerodrom
00050000-560a-4b3c-ede6-68cdf4f6f961	8321	Brusnice
00050000-560a-4b3c-82e6-23d22aefecdb	3255	Buče
00050000-560a-4b3c-5b30-79e0613d0da5	8276	Bučka 
00050000-560a-4b3c-df0e-a73e71faf15a	9261	Cankova
00050000-560a-4b3c-46c7-b47d63a80668	3000	Celje 
00050000-560a-4b3c-b501-b2bcb3bed766	3001	Celje - poštni predali
00050000-560a-4b3c-f77f-0c0bcf8ae75b	4207	Cerklje na Gorenjskem
00050000-560a-4b3c-a0dc-9c1fbcd804b5	8263	Cerklje ob Krki
00050000-560a-4b3c-d5a8-8a46a62a0fa3	1380	Cerknica
00050000-560a-4b3c-d5f6-85473669b237	5282	Cerkno
00050000-560a-4b3c-9c4b-eb43b92a4c49	2236	Cerkvenjak
00050000-560a-4b3c-97a4-5a4016301c94	2215	Ceršak
00050000-560a-4b3c-08ed-c1db253dea3f	2326	Cirkovce
00050000-560a-4b3c-6f29-031a10e249a4	2282	Cirkulane
00050000-560a-4b3c-b6d3-262a5e8060d7	5273	Col
00050000-560a-4b3c-7753-a07e0090d2e7	8251	Čatež ob Savi
00050000-560a-4b3c-6f96-9fb5e2490ffb	1413	Čemšenik
00050000-560a-4b3c-e47a-d714cbd39823	5253	Čepovan
00050000-560a-4b3c-d1bf-f2ab87e8ca18	9232	Črenšovci
00050000-560a-4b3c-e91d-976532026d7c	2393	Črna na Koroškem
00050000-560a-4b3c-ee91-37536ad3792f	6275	Črni Kal
00050000-560a-4b3c-706d-ed7dc7013fa0	5274	Črni Vrh nad Idrijo
00050000-560a-4b3c-82ad-ae2627774477	5262	Črniče
00050000-560a-4b3c-5318-3ae0bf3c0890	8340	Črnomelj
00050000-560a-4b3c-3662-f416aea7b968	6271	Dekani
00050000-560a-4b3c-4f2a-a9c488fb0dc3	5210	Deskle
00050000-560a-4b3c-629e-6d1fa056bc31	2253	Destrnik
00050000-560a-4b3c-3de1-faa429ea24b9	6215	Divača
00050000-560a-4b3c-084a-fd47331545c8	1233	Dob
00050000-560a-4b3c-509b-01d56618aff4	3224	Dobje pri Planini
00050000-560a-4b3c-b195-3a2939022655	8257	Dobova
00050000-560a-4b3c-aa81-809ddaf16d03	1423	Dobovec
00050000-560a-4b3c-9c92-5530e12c71fc	5263	Dobravlje
00050000-560a-4b3c-cc0a-a5f080189333	3204	Dobrna
00050000-560a-4b3c-4ac0-85ac27e26efe	8211	Dobrnič
00050000-560a-4b3c-6854-30d7eda856ce	1356	Dobrova
00050000-560a-4b3c-c0f1-1cee56fa6138	9223	Dobrovnik/Dobronak 
00050000-560a-4b3c-4c52-3ca66a4675e7	5212	Dobrovo v Brdih
00050000-560a-4b3c-4170-c43701147c7f	1431	Dol pri Hrastniku
00050000-560a-4b3c-d1ba-cfdb1dbb7be9	1262	Dol pri Ljubljani
00050000-560a-4b3c-a794-4fcd669b0cd7	1273	Dole pri Litiji
00050000-560a-4b3c-5940-7816c59ea1f5	1331	Dolenja vas
00050000-560a-4b3c-a298-4ffa05cedea0	8350	Dolenjske Toplice
00050000-560a-4b3c-4c24-61ac8773d112	1230	Domžale
00050000-560a-4b3c-924d-c7198e26908c	2252	Dornava
00050000-560a-4b3c-adc5-268551579993	5294	Dornberk
00050000-560a-4b3c-5955-02d423cff9fa	1319	Draga
00050000-560a-4b3c-4f92-1b0be49e5432	8343	Dragatuš
00050000-560a-4b3c-e1ad-9e8fc0dfba4a	3222	Dramlje
00050000-560a-4b3c-108a-52aa059c00d8	2370	Dravograd
00050000-560a-4b3c-894d-24196c376bd8	4203	Duplje
00050000-560a-4b3c-e773-f9ea92ff164d	6221	Dutovlje
00050000-560a-4b3c-8666-b861897a5d13	8361	Dvor
00050000-560a-4b3c-41b8-6621d46b317f	2343	Fala
00050000-560a-4b3c-b2f7-588b30ad3a74	9208	Fokovci
00050000-560a-4b3c-7b8e-0efe6f5506b5	2313	Fram
00050000-560a-4b3c-cb03-4f24a68f555e	3213	Frankolovo
00050000-560a-4b3c-7b34-9a75f066ca60	1274	Gabrovka
00050000-560a-4b3c-e15e-9655e5f5903f	8254	Globoko
00050000-560a-4b3c-f1e8-3e7c46d047e8	5275	Godovič
00050000-560a-4b3c-b8bb-d2bde6250a1d	4204	Golnik
00050000-560a-4b3c-6656-ea5dd8111e28	3303	Gomilsko
00050000-560a-4b3c-524a-835d25590e85	4224	Gorenja vas
00050000-560a-4b3c-6533-650cccbaee1e	3263	Gorica pri Slivnici
00050000-560a-4b3c-5c53-9897fb9e6a86	2272	Gorišnica
00050000-560a-4b3c-12d9-9b6aee41092b	9250	Gornja Radgona
00050000-560a-4b3c-4fe7-678fde03e50b	3342	Gornji Grad
00050000-560a-4b3c-0316-1e4cd93a52d0	4282	Gozd Martuljek
00050000-560a-4b3c-2c7f-e269cbf2a35e	6272	Gračišče
00050000-560a-4b3c-6210-09b0b73f339f	9264	Grad
00050000-560a-4b3c-4e6d-f835d855fcef	8332	Gradac
00050000-560a-4b3c-baf1-9b9f49b98ef5	1384	Grahovo
00050000-560a-4b3c-de6f-8f497b78a531	5242	Grahovo ob Bači
00050000-560a-4b3c-9eaa-318af7e6b348	5251	Grgar
00050000-560a-4b3c-c8ff-d2e198428e42	3302	Griže
00050000-560a-4b3c-c086-30a2bcf4a539	3231	Grobelno
00050000-560a-4b3c-af0e-54f8bdebf33b	1290	Grosuplje
00050000-560a-4b3c-85ad-03f56c40aae1	2288	Hajdina
00050000-560a-4b3c-c42d-a887e65bbcbd	8362	Hinje
00050000-560a-4b3c-60d8-c3f839b48e55	2311	Hoče
00050000-560a-4b3c-82cf-79970bd6473b	9205	Hodoš/Hodos
00050000-560a-4b3c-8c5e-cd2dba0fd7d2	1354	Horjul
00050000-560a-4b3c-34c5-fddec7c07056	1372	Hotedršica
00050000-560a-4b3c-07a0-3d2269924da9	1430	Hrastnik
00050000-560a-4b3c-fad6-fc82124fc6b7	6225	Hruševje
00050000-560a-4b3c-2e15-8a37f1a55b06	4276	Hrušica
00050000-560a-4b3c-c23b-1e16c7bcad17	5280	Idrija
00050000-560a-4b3c-c6b4-e96aa00daa35	1292	Ig
00050000-560a-4b3c-5726-1def12fde3de	6250	Ilirska Bistrica
00050000-560a-4b3c-9cf5-a16fb7782ea7	6251	Ilirska Bistrica-Trnovo
00050000-560a-4b3c-1bd6-10efea145887	1295	Ivančna Gorica
00050000-560a-4b3c-e52e-2f9167fd9518	2259	Ivanjkovci
00050000-560a-4b3c-0f94-04248b9ab931	1411	Izlake
00050000-560a-4b3c-66b4-ed4edfc54cdb	6310	Izola/Isola
00050000-560a-4b3c-462c-36eeffb0d668	2222	Jakobski Dol
00050000-560a-4b3c-c106-53995f223852	2221	Jarenina
00050000-560a-4b3c-36ad-b064a1179a6a	6254	Jelšane
00050000-560a-4b3c-ecf8-4766810ba160	4270	Jesenice
00050000-560a-4b3c-10c9-f3ab9e3bd923	8261	Jesenice na Dolenjskem
00050000-560a-4b3c-6e56-1389f56ab66c	3273	Jurklošter
00050000-560a-4b3c-b802-7fa283350271	2223	Jurovski Dol
00050000-560a-4b3c-150e-ccf8f898f6cf	2256	Juršinci
00050000-560a-4b3c-880a-b22dd959a509	5214	Kal nad Kanalom
00050000-560a-4b3c-bcf3-c4225e15edae	3233	Kalobje
00050000-560a-4b3c-2f41-4f865dcea018	4246	Kamna Gorica
00050000-560a-4b3c-e66a-869ad89c9526	2351	Kamnica
00050000-560a-4b3c-0591-0041dd72aefb	1241	Kamnik
00050000-560a-4b3c-5093-f681f626fbb3	5213	Kanal
00050000-560a-4b3c-e758-bbd71fbda620	8258	Kapele
00050000-560a-4b3c-f270-112782a84f1f	2362	Kapla
00050000-560a-4b3c-b0aa-56c19aeeede1	2325	Kidričevo
00050000-560a-4b3c-db55-6b42af01969a	1412	Kisovec
00050000-560a-4b3c-cb56-53d31d73f4a8	6253	Knežak
00050000-560a-4b3c-fe55-c29df9d66abd	5222	Kobarid
00050000-560a-4b3c-53f0-d207fda9aafd	9227	Kobilje
00050000-560a-4b3c-d643-cb49e3abef87	1330	Kočevje
00050000-560a-4b3c-942d-9875416e7fe2	1338	Kočevska Reka
00050000-560a-4b3c-47c7-f9b06a036353	2276	Kog
00050000-560a-4b3c-2b6f-c5710bdd45e0	5211	Kojsko
00050000-560a-4b3c-4c7d-b8cc19961491	6223	Komen
00050000-560a-4b3c-1d1c-7fff62f3cfae	1218	Komenda
00050000-560a-4b3c-511a-bd6793f96258	6000	Koper/Capodistria 
00050000-560a-4b3c-3de0-257c2be3d1c6	6001	Koper/Capodistria - poštni predali
00050000-560a-4b3c-e6d4-8782cb7d20a4	8282	Koprivnica
00050000-560a-4b3c-dad8-2e5bfa0ad5ec	5296	Kostanjevica na Krasu
00050000-560a-4b3c-6468-a31f82eb752a	8311	Kostanjevica na Krki
00050000-560a-4b3c-ff21-64e2888e50b1	1336	Kostel
00050000-560a-4b3c-dc46-c1d3249a2c7e	6256	Košana
00050000-560a-4b3c-d256-5bc4d4c6af3c	2394	Kotlje
00050000-560a-4b3c-7332-79b7eee25326	6240	Kozina
00050000-560a-4b3c-1cf7-6f26f3c3b277	3260	Kozje
00050000-560a-4b3c-8c34-74d174962a28	4000	Kranj 
00050000-560a-4b3c-513b-8ab81da604a8	4001	Kranj - poštni predali
00050000-560a-4b3c-94cc-a819930ea333	4280	Kranjska Gora
00050000-560a-4b3c-dc73-becfb44606ed	1281	Kresnice
00050000-560a-4b3c-8fc5-b20977cfcc89	4294	Križe
00050000-560a-4b3c-0ee0-86d7d6894b69	9206	Križevci
00050000-560a-4b3c-fa88-c7366c48b5c3	9242	Križevci pri Ljutomeru
00050000-560a-4b3c-ea21-bc4f38378d86	1301	Krka
00050000-560a-4b3c-1e61-1d0648c80e68	8296	Krmelj
00050000-560a-4b3c-c83f-0db5cebd60b7	4245	Kropa
00050000-560a-4b3c-4faf-d2a0cdc93722	8262	Krška vas
00050000-560a-4b3c-c9c4-c36a84927aab	8270	Krško
00050000-560a-4b3c-dcac-69fe149f6e5e	9263	Kuzma
00050000-560a-4b3c-a4ed-17681f7c0ff6	2318	Laporje
00050000-560a-4b3c-3ab1-0f5573206cfb	3270	Laško
00050000-560a-4b3c-e534-0364adeeb4d1	1219	Laze v Tuhinju
00050000-560a-4b3c-907f-e509c3169da4	2230	Lenart v Slovenskih goricah
00050000-560a-4b3c-e9aa-bc35d5071c35	9220	Lendava/Lendva
00050000-560a-4b3c-09fa-55849e3eaf9f	4248	Lesce
00050000-560a-4b3c-2022-051c12937178	3261	Lesično
00050000-560a-4b3c-f19a-1bfb9249c255	8273	Leskovec pri Krškem
00050000-560a-4b3c-e596-ceff33af57e9	2372	Libeliče
00050000-560a-4b3c-6e08-1324741f93d6	2341	Limbuš
00050000-560a-4b3c-502c-d45092de9d16	1270	Litija
00050000-560a-4b3c-945c-2c0ff1f652c0	3202	Ljubečna
00050000-560a-4b3c-7564-36574497befe	1000	Ljubljana 
00050000-560a-4b3c-5a5f-c3237f0a7bc6	1001	Ljubljana - poštni predali
00050000-560a-4b3c-62bf-11e5aeb5e825	1231	Ljubljana - Črnuče
00050000-560a-4b3c-b9b8-8ead82aaadc6	1261	Ljubljana - Dobrunje
00050000-560a-4b3c-8303-ea3fddc682c7	1260	Ljubljana - Polje
00050000-560a-4b3c-dfec-fc50d6ce5e8c	1210	Ljubljana - Šentvid
00050000-560a-4b3c-5e83-0149d5aef041	1211	Ljubljana - Šmartno
00050000-560a-4b3c-287e-2d982ae9360d	3333	Ljubno ob Savinji
00050000-560a-4b3c-8106-e1a6c549cb24	9240	Ljutomer
00050000-560a-4b3c-13da-a71d0cf6cada	3215	Loče
00050000-560a-4b3c-a4a3-0b3119c77315	5231	Log pod Mangartom
00050000-560a-4b3c-f4ec-be2dbeeaf228	1358	Log pri Brezovici
00050000-560a-4b3c-ec2a-26d4c06f0721	1370	Logatec
00050000-560a-4b3c-7c18-d9c1f4ed10e2	1371	Logatec
00050000-560a-4b3c-96f7-28dc51ab0c8e	1434	Loka pri Zidanem Mostu
00050000-560a-4b3c-cf9d-953b46f4152c	3223	Loka pri Žusmu
00050000-560a-4b3c-5e51-d5dca07e163f	6219	Lokev
00050000-560a-4b3c-257b-f7fecc8cac38	1318	Loški Potok
00050000-560a-4b3c-1370-a8bd7f0ca898	2324	Lovrenc na Dravskem polju
00050000-560a-4b3c-3698-225f7c3c584b	2344	Lovrenc na Pohorju
00050000-560a-4b3c-fe02-65b366a39f91	3334	Luče
00050000-560a-4b3c-7d64-24d08c3c92ac	1225	Lukovica
00050000-560a-4b3c-f8ab-c88589f00ac2	9202	Mačkovci
00050000-560a-4b3c-8a20-301b943927ad	2322	Majšperk
00050000-560a-4b3c-cd44-152d723199b1	2321	Makole
00050000-560a-4b3c-e163-6afac29c5e44	9243	Mala Nedelja
00050000-560a-4b3c-0d6f-1b7d2cac9297	2229	Malečnik
00050000-560a-4b3c-79c7-0f4d18162297	6273	Marezige
00050000-560a-4b3c-26ef-f7d2dd52c7c1	2000	Maribor 
00050000-560a-4b3c-5d12-b3418c36be11	2001	Maribor - poštni predali
00050000-560a-4b3c-9394-4310c44386a0	2206	Marjeta na Dravskem polju
00050000-560a-4b3c-ba65-0d09333fb524	2281	Markovci
00050000-560a-4b3c-5d39-865d76513a51	9221	Martjanci
00050000-560a-4b3c-7903-01acf6625835	6242	Materija
00050000-560a-4b3c-47e8-364f2e671a00	4211	Mavčiče
00050000-560a-4b3c-e861-f6c78193a535	1215	Medvode
00050000-560a-4b3c-4581-a1a9b94300ac	1234	Mengeš
00050000-560a-4b3c-9689-87bdd324e8df	8330	Metlika
00050000-560a-4b3c-a216-ea5069db4bfb	2392	Mežica
00050000-560a-4b3c-3dfc-a7daca411331	2204	Miklavž na Dravskem polju
00050000-560a-4b3c-3e75-9a32481cc21a	2275	Miklavž pri Ormožu
00050000-560a-4b3c-4c4f-7e6592f1e380	5291	Miren
00050000-560a-4b3c-e439-938d688e3fd5	8233	Mirna
00050000-560a-4b3c-74c1-626542227d7d	8216	Mirna Peč
00050000-560a-4b3c-4c5a-24f4bfb94296	2382	Mislinja
00050000-560a-4b3c-6363-017dae0a42e5	4281	Mojstrana
00050000-560a-4b3c-6b24-bd53028207e8	8230	Mokronog
00050000-560a-4b3c-a552-67a5bc33c2b5	1251	Moravče
00050000-560a-4b3c-a5d9-b71411b05c93	9226	Moravske Toplice
00050000-560a-4b3c-d0cc-687990c89aaf	5216	Most na Soči
00050000-560a-4b3c-7448-21c14c731995	1221	Motnik
00050000-560a-4b3c-0e1d-f17935559449	3330	Mozirje
00050000-560a-4b3c-98a5-107e129819e9	9000	Murska Sobota 
00050000-560a-4b3c-2b42-e387e3d72bb6	9001	Murska Sobota - poštni predali
00050000-560a-4b3c-35f4-41e6411f4572	2366	Muta
00050000-560a-4b3c-c0fc-8275ded8407c	4202	Naklo
00050000-560a-4b3c-e152-8e330e020134	3331	Nazarje
00050000-560a-4b3c-4f2c-baf7de1f4edb	1357	Notranje Gorice
00050000-560a-4b3c-8499-4633c6dbe3ff	3203	Nova Cerkev
00050000-560a-4b3c-ffef-f036f2e7c80a	5000	Nova Gorica 
00050000-560a-4b3c-e60c-baf6d08cafe3	5001	Nova Gorica - poštni predali
00050000-560a-4b3c-782f-99ca101a7305	1385	Nova vas
00050000-560a-4b3c-01cc-a71735abb82b	8000	Novo mesto
00050000-560a-4b3c-ba2d-4e42d28d6143	8001	Novo mesto - poštni predali
00050000-560a-4b3c-863d-c49b41b8740b	6243	Obrov
00050000-560a-4b3c-6e70-000a5256ed88	9233	Odranci
00050000-560a-4b3c-8f20-9c9a1bfcbb63	2317	Oplotnica
00050000-560a-4b3c-019e-97d9eb800056	2312	Orehova vas
00050000-560a-4b3c-f3df-ec2b47969cf5	2270	Ormož
00050000-560a-4b3c-700c-beedaf921864	1316	Ortnek
00050000-560a-4b3c-553e-03a460b3a739	1337	Osilnica
00050000-560a-4b3c-8469-8eb81bd5fc1f	8222	Otočec
00050000-560a-4b3c-25e5-07888fc11516	2361	Ožbalt
00050000-560a-4b3c-a678-d2a5f841aa23	2231	Pernica
00050000-560a-4b3c-7353-de0b2948e157	2211	Pesnica pri Mariboru
00050000-560a-4b3c-4851-54089909c488	9203	Petrovci
00050000-560a-4b3c-e129-da6d0f7372ab	3301	Petrovče
00050000-560a-4b3c-f588-ef26252baf60	6330	Piran/Pirano
00050000-560a-4b3c-9259-88efae725dad	8255	Pišece
00050000-560a-4b3c-303e-776c2d3d1edd	6257	Pivka
00050000-560a-4b3c-8284-8364933837f0	6232	Planina
00050000-560a-4b3c-cad5-1e3601ef1137	3225	Planina pri Sevnici
00050000-560a-4b3c-7cf7-c83cb465d3d5	6276	Pobegi
00050000-560a-4b3c-b7ab-b1c2e019a60a	8312	Podbočje
00050000-560a-4b3c-ac45-ee2373c5c2fb	5243	Podbrdo
00050000-560a-4b3c-3941-26bd7f12d6c4	3254	Podčetrtek
00050000-560a-4b3c-34ee-f3fe4095cf71	2273	Podgorci
00050000-560a-4b3c-4167-a68b15924a84	6216	Podgorje
00050000-560a-4b3c-0e8d-9ebdda80369c	2381	Podgorje pri Slovenj Gradcu
00050000-560a-4b3c-2c46-8a659e14751b	6244	Podgrad
00050000-560a-4b3c-0099-c53cd84da012	1414	Podkum
00050000-560a-4b3c-82ae-65c2db534863	2286	Podlehnik
00050000-560a-4b3c-2a12-9e2395b2708f	5272	Podnanos
00050000-560a-4b3c-dc8a-b5bda034a15a	4244	Podnart
00050000-560a-4b3c-dc80-e63f68ba32c8	3241	Podplat
00050000-560a-4b3c-fb00-7a7399b27e33	3257	Podsreda
00050000-560a-4b3c-8f29-34cb66d7737a	2363	Podvelka
00050000-560a-4b3c-a4d2-941e9e9f1490	2208	Pohorje
00050000-560a-4b3c-48ec-2ee85463f5b6	2257	Polenšak
00050000-560a-4b3c-9a8b-7b6b2c896e9f	1355	Polhov Gradec
00050000-560a-4b3c-2ba0-0dcd6aa95ef1	4223	Poljane nad Škofjo Loko
00050000-560a-4b3c-13a1-a3710cfcb5d7	2319	Poljčane
00050000-560a-4b3c-9b49-064bed0a4326	1272	Polšnik
00050000-560a-4b3c-e204-78fbf88c9bba	3313	Polzela
00050000-560a-4b3c-0ffd-6d9c37cc6786	3232	Ponikva
00050000-560a-4b3c-4443-c81384998ce8	6320	Portorož/Portorose
00050000-560a-4b3c-9a95-af4a8d8152a6	6230	Postojna
00050000-560a-4b3c-0eba-076da1f9aa0c	2331	Pragersko
00050000-560a-4b3c-707b-4afeee6e637c	3312	Prebold
00050000-560a-4b3c-349f-1731104b5e44	4205	Preddvor
00050000-560a-4b3c-3243-ddc8e344b2c7	6255	Prem
00050000-560a-4b3c-e9da-cf9934bdc197	1352	Preserje
00050000-560a-4b3c-ab4f-7fb92ee694c7	6258	Prestranek
00050000-560a-4b3c-b00c-f2815f9325be	2391	Prevalje
00050000-560a-4b3c-b3b7-92371d025dfc	3262	Prevorje
00050000-560a-4b3c-879a-fcd27774cc25	1276	Primskovo 
00050000-560a-4b3c-0765-807de5c790a2	3253	Pristava pri Mestinju
00050000-560a-4b3c-f3d6-2ada3c8cc0d3	9207	Prosenjakovci/Partosfalva
00050000-560a-4b3c-ea7d-5a6525fb227f	5297	Prvačina
00050000-560a-4b3c-a404-3f3c5c4fe67c	2250	Ptuj
00050000-560a-4b3c-0bac-af783a9883bf	2323	Ptujska Gora
00050000-560a-4b3c-c289-686ed25bf0d8	9201	Puconci
00050000-560a-4b3c-2a99-30e3f6bebc03	2327	Rače
00050000-560a-4b3c-e330-26d97869ceb3	1433	Radeče
00050000-560a-4b3c-625a-c99a9e7cca53	9252	Radenci
00050000-560a-4b3c-8a18-985912943076	2360	Radlje ob Dravi
00050000-560a-4b3c-f51f-b9a2ba7bfa6b	1235	Radomlje
00050000-560a-4b3c-4393-a69059288c3a	4240	Radovljica
00050000-560a-4b3c-4321-c41dc6f1b13b	8274	Raka
00050000-560a-4b3c-e600-e263d0604158	1381	Rakek
00050000-560a-4b3c-e36f-53ecec8896c0	4283	Rateče - Planica
00050000-560a-4b3c-0a46-e51a8680c1ba	2390	Ravne na Koroškem
00050000-560a-4b3c-9cf5-4f1103f3f4e7	9246	Razkrižje
00050000-560a-4b3c-c62d-c9f42656fbe8	3332	Rečica ob Savinji
00050000-560a-4b3c-2a06-9d90662a07f9	5292	Renče
00050000-560a-4b3c-c1a8-4f8361fd3558	1310	Ribnica
00050000-560a-4b3c-3688-1d2399fa5992	2364	Ribnica na Pohorju
00050000-560a-4b3c-777a-b81aef89773c	3272	Rimske Toplice
00050000-560a-4b3c-60e8-034b78ffebeb	1314	Rob
00050000-560a-4b3c-0391-6749cc354372	5215	Ročinj
00050000-560a-4b3c-12ef-64272f4707c9	3250	Rogaška Slatina
00050000-560a-4b3c-cc99-6324c864e972	9262	Rogašovci
00050000-560a-4b3c-d7ae-a6395e18e513	3252	Rogatec
00050000-560a-4b3c-851f-f30a2f439199	1373	Rovte
00050000-560a-4b3c-b033-59825a61304e	2342	Ruše
00050000-560a-4b3c-ba92-392db3d834f5	1282	Sava
00050000-560a-4b3c-19ec-450549edcd86	6333	Sečovlje/Sicciole
00050000-560a-4b3c-4cb8-3563cf798c37	4227	Selca
00050000-560a-4b3c-f3e5-1d6f79012bce	2352	Selnica ob Dravi
00050000-560a-4b3c-3ce0-32506366d5a0	8333	Semič
00050000-560a-4b3c-34b7-7b0bff9dc43a	8281	Senovo
00050000-560a-4b3c-27d9-df2225c654c7	6224	Senožeče
00050000-560a-4b3c-690a-fd4335585fdb	8290	Sevnica
00050000-560a-4b3c-a761-d8262126c607	6210	Sežana
00050000-560a-4b3c-e23c-69a91e2da68a	2214	Sladki Vrh
00050000-560a-4b3c-4f90-72f2fc59a5d2	5283	Slap ob Idrijci
00050000-560a-4b3c-8cd9-31774dfe4f67	2380	Slovenj Gradec
00050000-560a-4b3c-5235-0fa03c1ddb5b	2310	Slovenska Bistrica
00050000-560a-4b3c-7f8e-3151dcf85af4	3210	Slovenske Konjice
00050000-560a-4b3c-324b-41fbb94c4135	1216	Smlednik
00050000-560a-4b3c-937a-7bdbe386929b	5232	Soča
00050000-560a-4b3c-40f9-22757e3bdfe8	1317	Sodražica
00050000-560a-4b3c-eca8-06dd335461a6	3335	Solčava
00050000-560a-4b3c-3ac4-37be9327a830	5250	Solkan
00050000-560a-4b3c-ba68-866d587b47fc	4229	Sorica
00050000-560a-4b3c-ebd8-53dabe23878f	4225	Sovodenj
00050000-560a-4b3c-cb9b-4be00b62fa57	5281	Spodnja Idrija
00050000-560a-4b3c-b82d-dc58631d0482	2241	Spodnji Duplek
00050000-560a-4b3c-f427-43aaab72055a	9245	Spodnji Ivanjci
00050000-560a-4b3c-d8fb-1f6119381ea9	2277	Središče ob Dravi
00050000-560a-4b3c-e51c-a6228d744f69	4267	Srednja vas v Bohinju
00050000-560a-4b3c-6c9e-a408ac95017b	8256	Sromlje 
00050000-560a-4b3c-94a3-55f1c3cdf0fa	5224	Srpenica
00050000-560a-4b3c-9ab9-5d8ff81aa966	1242	Stahovica
00050000-560a-4b3c-7165-0d85febbd846	1332	Stara Cerkev
00050000-560a-4b3c-ac3a-905d4be85f74	8342	Stari trg ob Kolpi
00050000-560a-4b3c-38e3-154a20e5a445	1386	Stari trg pri Ložu
00050000-560a-4b3c-ed9a-fca02e22b209	2205	Starše
00050000-560a-4b3c-25c3-f3a2e127b11b	2289	Stoperce
00050000-560a-4b3c-ce9e-c27f9ef7d232	8322	Stopiče
00050000-560a-4b3c-6e67-d7e27332352f	3206	Stranice
00050000-560a-4b3c-d413-fd00a76a1857	8351	Straža
00050000-560a-4b3c-8a14-e65c927f13a6	1313	Struge
00050000-560a-4b3c-e4bc-83a35e40ebc2	8293	Studenec
00050000-560a-4b3c-9cd3-7ac7aa14856a	8331	Suhor
00050000-560a-4b3c-8e07-c7dd617e284b	2233	Sv. Ana v Slovenskih goricah
00050000-560a-4b3c-91a5-8ffaf9bb7f73	2235	Sv. Trojica v Slovenskih goricah
00050000-560a-4b3c-aa4c-61e8205201d8	2353	Sveti Duh na Ostrem Vrhu
00050000-560a-4b3c-50c2-9e5a3e59119e	9244	Sveti Jurij ob Ščavnici
00050000-560a-4b3c-780a-5e56b1e2f2fc	3264	Sveti Štefan
00050000-560a-4b3c-62f9-21b351760227	2258	Sveti Tomaž
00050000-560a-4b3c-6737-c4f6aacdd27e	9204	Šalovci
00050000-560a-4b3c-df79-446be6984358	5261	Šempas
00050000-560a-4b3c-9807-02fb6d3bd0c6	5290	Šempeter pri Gorici
00050000-560a-4b3c-1be0-b16405a1c89a	3311	Šempeter v Savinjski dolini
00050000-560a-4b3c-087f-1701cf00f625	4208	Šenčur
00050000-560a-4b3c-184b-7fc09480af6c	2212	Šentilj v Slovenskih goricah
00050000-560a-4b3c-ca6a-c1f9ae98261b	8297	Šentjanž
00050000-560a-4b3c-02ad-cc660a05ff92	2373	Šentjanž pri Dravogradu
00050000-560a-4b3c-f70d-364e3127a800	8310	Šentjernej
00050000-560a-4b3c-b37f-bd9eeeca0b64	3230	Šentjur
00050000-560a-4b3c-7390-53748d63b0e4	3271	Šentrupert
00050000-560a-4b3c-2f13-77a6982674ba	8232	Šentrupert
00050000-560a-4b3c-2a42-82b9fbf091b8	1296	Šentvid pri Stični
00050000-560a-4b3c-4fcc-620e41e5b624	8275	Škocjan
00050000-560a-4b3c-8682-7a0abcb88b3a	6281	Škofije
00050000-560a-4b3c-39d7-f4794422162a	4220	Škofja Loka
00050000-560a-4b3c-b71a-2aaa95fe0f97	3211	Škofja vas
00050000-560a-4b3c-deb7-dadb79a1fa84	1291	Škofljica
00050000-560a-4b3c-5db1-08e72425c95a	6274	Šmarje
00050000-560a-4b3c-b72b-eb3ce28e6fa2	1293	Šmarje - Sap
00050000-560a-4b3c-671c-329dbea5a6d4	3240	Šmarje pri Jelšah
00050000-560a-4b3c-598f-99c20858bdac	8220	Šmarješke Toplice
00050000-560a-4b3c-2892-fcdb2f5ecae4	2315	Šmartno na Pohorju
00050000-560a-4b3c-652b-86a65a655fd0	3341	Šmartno ob Dreti
00050000-560a-4b3c-35ab-3f8126600380	3327	Šmartno ob Paki
00050000-560a-4b3c-2939-34a5f11769e8	1275	Šmartno pri Litiji
00050000-560a-4b3c-619c-ecf232a401cb	2383	Šmartno pri Slovenj Gradcu
00050000-560a-4b3c-4d4b-f761df2e11db	3201	Šmartno v Rožni dolini
00050000-560a-4b3c-c118-d76ae6435c22	3325	Šoštanj
00050000-560a-4b3c-caf5-8d40744e0d36	6222	Štanjel
00050000-560a-4b3c-cc30-e3f2a921cd6a	3220	Štore
00050000-560a-4b3c-ec68-3a33dccb34f9	3304	Tabor
00050000-560a-4b3c-aa3e-c793fac1c8d5	3221	Teharje
00050000-560a-4b3c-ff52-16395a063bff	9251	Tišina
00050000-560a-4b3c-a261-28bc0eef6ce7	5220	Tolmin
00050000-560a-4b3c-449a-ee88d1390c3e	3326	Topolšica
00050000-560a-4b3c-66a5-90fa431cb9e0	2371	Trbonje
00050000-560a-4b3c-0dfb-994bc0f3b41c	1420	Trbovlje
00050000-560a-4b3c-ac53-ee5c42c7539e	8231	Trebelno 
00050000-560a-4b3c-420d-b721d23df3da	8210	Trebnje
00050000-560a-4b3c-ce92-9e58d01827fb	5252	Trnovo pri Gorici
00050000-560a-4b3c-9140-39b1dc1a1727	2254	Trnovska vas
00050000-560a-4b3c-66a1-ea5d52b8f90e	1222	Trojane
00050000-560a-4b3c-c84b-5893b4b05d44	1236	Trzin
00050000-560a-4b3c-5b11-421ae8536d64	4290	Tržič
00050000-560a-4b3c-7b00-a1ba86180c00	8295	Tržišče
00050000-560a-4b3c-92a9-3c7c7668b49e	1311	Turjak
00050000-560a-4b3c-9f3d-6a878d7eaaa2	9224	Turnišče
00050000-560a-4b3c-c7c9-d53dce5eba16	8323	Uršna sela
00050000-560a-4b3c-0a31-63df7d1f1cec	1252	Vače
00050000-560a-4b3c-5ab4-ac3dc3a0945d	3320	Velenje 
00050000-560a-4b3d-ba8e-dffd5442f8c1	3322	Velenje - poštni predali
00050000-560a-4b3d-6573-7bfd50e6883c	8212	Velika Loka
00050000-560a-4b3d-c53e-3ea82ea6e088	2274	Velika Nedelja
00050000-560a-4b3d-05fa-814bcc9823cd	9225	Velika Polana
00050000-560a-4b3d-806e-b8551a6daa4c	1315	Velike Lašče
00050000-560a-4b3d-af79-0deaffc8add7	8213	Veliki Gaber
00050000-560a-4b3d-f142-c0ee77963d90	9241	Veržej
00050000-560a-4b3d-9d8d-8d4ab442fa51	1312	Videm - Dobrepolje
00050000-560a-4b3d-da4a-2a72e69f8564	2284	Videm pri Ptuju
00050000-560a-4b3d-0c68-0df0eda93bae	8344	Vinica
00050000-560a-4b3d-8e20-29cb9c593482	5271	Vipava
00050000-560a-4b3d-734a-926e08bdc131	4212	Visoko
00050000-560a-4b3d-c982-b5ef60f305e2	1294	Višnja Gora
00050000-560a-4b3d-2343-4675682dca3d	3205	Vitanje
00050000-560a-4b3d-493a-282b5b05eeff	2255	Vitomarci
00050000-560a-4b3d-8242-55256639c1ad	1217	Vodice
00050000-560a-4b3d-bf44-7bc4ddae355d	3212	Vojnik\t
00050000-560a-4b3d-f032-718b2eb97e72	5293	Volčja Draga
00050000-560a-4b3d-a6ff-38fc8940c0a9	2232	Voličina
00050000-560a-4b3d-20a2-0f76a3214c64	3305	Vransko
00050000-560a-4b3d-b841-52cb29ed9183	6217	Vremski Britof
00050000-560a-4b3d-a1dc-ace17ab5ddd4	1360	Vrhnika
00050000-560a-4b3d-afb5-6e50d1026b27	2365	Vuhred
00050000-560a-4b3d-a837-948c150e3dec	2367	Vuzenica
00050000-560a-4b3d-1f8e-6eaa81e1af7b	8292	Zabukovje 
00050000-560a-4b3d-d550-dbd2ae08e7fd	1410	Zagorje ob Savi
00050000-560a-4b3d-e3b6-c4b4637f782d	1303	Zagradec
00050000-560a-4b3d-b8e8-bd34a8b96771	2283	Zavrč
00050000-560a-4b3d-939d-e2a0eeeea03c	8272	Zdole 
00050000-560a-4b3d-0b81-ca6e839e1d02	4201	Zgornja Besnica
00050000-560a-4b3d-03a0-22d0281447a8	2242	Zgornja Korena
00050000-560a-4b3d-3061-1cb89526a369	2201	Zgornja Kungota
00050000-560a-4b3d-7587-a8c86a06bd1e	2316	Zgornja Ložnica
00050000-560a-4b3d-e50b-11d6a0bb7bba	2314	Zgornja Polskava
00050000-560a-4b3d-8890-3bbfedac22c9	2213	Zgornja Velka
00050000-560a-4b3d-354b-d1b01104c4d1	4247	Zgornje Gorje
00050000-560a-4b3d-51d2-4030ea2f769f	4206	Zgornje Jezersko
00050000-560a-4b3d-ec05-213feddef521	2285	Zgornji Leskovec
00050000-560a-4b3d-18f4-4815b32c77d7	1432	Zidani Most
00050000-560a-4b3d-3757-9a2de7f9503c	3214	Zreče
00050000-560a-4b3d-3855-780bba3b3cc9	4209	Žabnica
00050000-560a-4b3d-e7d9-92c8957708be	3310	Žalec
00050000-560a-4b3d-de76-628415f5025b	4228	Železniki
00050000-560a-4b3d-73b7-7290d388dc35	2287	Žetale
00050000-560a-4b3d-f656-ea199950c7e5	4226	Žiri
00050000-560a-4b3d-d399-5996f26585f5	4274	Žirovnica
00050000-560a-4b3d-a9df-9c2feb9bbbf6	8360	Žužemberk
\.


--
-- TOC entry 3028 (class 0 OID 21019837)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21019459)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 21019239)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-560a-4b3f-45c4-78fcc30f3f2e	00080000-560a-4b3f-13c9-fb7f154a84e2	\N	00040000-560a-4b3d-bc24-406c9a9a57d0	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-560a-4b3f-7d54-fffc637b5c26	00080000-560a-4b3f-13c9-fb7f154a84e2	\N	00040000-560a-4b3d-bc24-406c9a9a57d0	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-560a-4b3f-2442-ccd9d1769584	00080000-560a-4b3f-2460-afbff63619cc	\N	00040000-560a-4b3d-bc24-406c9a9a57d0	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2990 (class 0 OID 21019343)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21019471)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21019851)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21019861)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-560a-4b3f-466c-aab48659f0b5	00080000-560a-4b3f-66b3-ac43401f093c	0987	AK
00190000-560a-4b3f-2131-534cf87b66ad	00080000-560a-4b3f-2460-afbff63619cc	0989	AK
00190000-560a-4b3f-5498-27cbc934fc6a	00080000-560a-4b3f-0112-7d1465cec673	0986	AK
00190000-560a-4b3f-2520-acffb90f0ae7	00080000-560a-4b3f-aa0e-e0f91a39d89a	0984	AK
00190000-560a-4b3f-d446-182dfc8bd26e	00080000-560a-4b3f-1517-c9983e2a996c	0983	AK
00190000-560a-4b3f-9271-d530daa7514a	00080000-560a-4b3f-363e-cd4c1c278db9	0982	AK
00190000-560a-4b40-fb14-db1d8dd06716	00080000-560a-4b40-de73-de58f4e6ef33	1001	AK
\.


--
-- TOC entry 3027 (class 0 OID 21019794)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-560a-4b3f-a721-19b4caff7229	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 21019869)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 21019500)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-560a-4b3f-6c91-700d027d0925	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-560a-4b3f-9c67-ff80c61096eb	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-560a-4b3f-0684-db3eca66c65e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-560a-4b3f-7000-416e279ecb86	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-560a-4b3f-a2e6-359d897fbe21	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-560a-4b3f-282c-35514a515edb	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-560a-4b3f-6a6a-fb7dc74cfdfb	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2999 (class 0 OID 21019444)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21019434)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21019644)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21019574)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21019317)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21019112)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-560a-4b40-de73-de58f4e6ef33	00010000-560a-4b3d-9287-8705c4f49ab4	2015-09-29 10:26:40	INS	a:0:{}
2	App\\Entity\\Option	00000000-560a-4b40-6791-40e98aef49f3	00010000-560a-4b3d-9287-8705c4f49ab4	2015-09-29 10:26:40	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-560a-4b40-fb14-db1d8dd06716	00010000-560a-4b3d-9287-8705c4f49ab4	2015-09-29 10:26:40	INS	a:0:{}
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 21019513)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21019150)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-560a-4b3d-1af8-5c8a3b6f5ad6	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-560a-4b3d-148f-797c4993cb94	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-560a-4b3d-08e5-6130459240d4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-560a-4b3d-6ffe-3fa8da820eef	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-560a-4b3d-9216-0bad07bcd365	planer	Planer dogodkov v koledarju	t
00020000-560a-4b3d-ce72-d45235b7ef5c	kadrovska	Kadrovska služba	t
00020000-560a-4b3d-d5e8-51fa99f02d03	arhivar	Ažuriranje arhivalij	t
00020000-560a-4b3d-3f19-74421ba657ca	igralec	Igralec	t
00020000-560a-4b3d-7abf-980443520ca9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-560a-4b3f-1d6a-cc21ad305a49	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2973 (class 0 OID 21019134)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-560a-4b3d-7420-cec5321fc368	00020000-560a-4b3d-08e5-6130459240d4
00010000-560a-4b3d-9287-8705c4f49ab4	00020000-560a-4b3d-08e5-6130459240d4
00010000-560a-4b3f-8446-28c0854f27c5	00020000-560a-4b3f-1d6a-cc21ad305a49
\.


--
-- TOC entry 3010 (class 0 OID 21019527)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 21019465)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21019411)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21019099)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-560a-4b3d-cea1-0b4f67e09281	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-560a-4b3d-753a-5df13a5d4406	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-560a-4b3d-9e31-fa9659be33dc	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-560a-4b3d-f82a-1734f385b258	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-560a-4b3d-aca0-0f0d5d01ae72	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2968 (class 0 OID 21019091)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-560a-4b3d-79b1-427f9633c50d	00230000-560a-4b3d-f82a-1734f385b258	popa
00240000-560a-4b3d-922a-f1153fe03b71	00230000-560a-4b3d-f82a-1734f385b258	oseba
00240000-560a-4b3d-7a43-294a1bbb7dd8	00230000-560a-4b3d-f82a-1734f385b258	sezona
00240000-560a-4b3d-9744-072363928f72	00230000-560a-4b3d-753a-5df13a5d4406	prostor
00240000-560a-4b3d-9bea-3141659474ad	00230000-560a-4b3d-f82a-1734f385b258	besedilo
00240000-560a-4b3d-2ba7-f34aa4b311af	00230000-560a-4b3d-f82a-1734f385b258	uprizoritev
00240000-560a-4b3d-c7b0-ac6bc1bda535	00230000-560a-4b3d-f82a-1734f385b258	funkcija
00240000-560a-4b3d-daf8-d3b358db5a4c	00230000-560a-4b3d-f82a-1734f385b258	tipfunkcije
00240000-560a-4b3d-1ff3-27b10be24930	00230000-560a-4b3d-f82a-1734f385b258	alternacija
00240000-560a-4b3d-2dd8-5f266bd64855	00230000-560a-4b3d-cea1-0b4f67e09281	pogodba
00240000-560a-4b3d-96ef-dcc986e08089	00230000-560a-4b3d-f82a-1734f385b258	zaposlitev
00240000-560a-4b3d-6403-0fff0030f4c1	00230000-560a-4b3d-f82a-1734f385b258	zvrstuprizoritve
00240000-560a-4b3d-a2cd-9fab476ab27c	00230000-560a-4b3d-cea1-0b4f67e09281	programdela
00240000-560a-4b3d-fb9c-ea71fdda78a3	00230000-560a-4b3d-f82a-1734f385b258	zapis
\.


--
-- TOC entry 2967 (class 0 OID 21019086)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
fa6e400c-cad7-4ecd-8fd4-d89e45ac8720	00240000-560a-4b3d-79b1-427f9633c50d	0	1001
\.


--
-- TOC entry 3016 (class 0 OID 21019591)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-560a-4b3f-408d-acb81a6ad2f4	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	00080000-560a-4b3f-13c9-fb7f154a84e2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-560a-4b3d-d489-3d8671081ba5
00270000-560a-4b3f-68fc-626ffff573e8	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	00080000-560a-4b3f-13c9-fb7f154a84e2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-560a-4b3d-d489-3d8671081ba5
\.


--
-- TOC entry 2980 (class 0 OID 21019212)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 21019421)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-560a-4b3f-bccc-08be8f2fd769	00180000-560a-4b3f-68ed-80781508bcfd	000c0000-560a-4b3f-14ce-0bfb5e45ab1b	00090000-560a-4b3f-352f-01011e5a35ed	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-4b3f-5555-87d30ab610af	00180000-560a-4b3f-68ed-80781508bcfd	000c0000-560a-4b3f-bfbe-50318b244a19	00090000-560a-4b3f-f385-fbb5cbdeff1a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-4b3f-3662-b73a74611d96	00180000-560a-4b3f-68ed-80781508bcfd	000c0000-560a-4b3f-7e43-3d8e74044fcc	00090000-560a-4b3f-6d44-f866c454f557	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-4b3f-b475-a773d1b4fe44	00180000-560a-4b3f-68ed-80781508bcfd	000c0000-560a-4b3f-b465-8188b24b6e57	00090000-560a-4b3f-7c5f-e9eef1b04a5e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-4b3f-f1b8-546a893bcab0	00180000-560a-4b3f-68ed-80781508bcfd	000c0000-560a-4b3f-b632-456bff7cd804	00090000-560a-4b3f-3de3-cbea06cd3088	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-4b3f-581c-41dbe406ce1f	00180000-560a-4b3f-0a03-f55de7ef5235	\N	00090000-560a-4b3f-3de3-cbea06cd3088	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3019 (class 0 OID 21019632)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-560a-4b3d-108f-26ed50346517	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-560a-4b3d-0366-c04979f74473	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-560a-4b3d-4bcc-1ec96dea9996	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-560a-4b3d-3ee9-69d950c99554	04	Režija	Režija	Režija	umetnik	30
000f0000-560a-4b3d-c562-a1d8035e6afe	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-560a-4b3d-7e07-28dd32b59d3c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-560a-4b3d-6df1-35c2c83d8ff1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-560a-4b3d-cf57-ac764b60ded0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-560a-4b3d-8677-0729ea6e751a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-560a-4b3d-d021-737749fa2147	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-560a-4b3d-3ba5-9b383d48655e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-560a-4b3d-5472-16ef51fe3221	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-560a-4b3d-ab44-6dfea7c61439	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-560a-4b3d-2cb0-afdc27431995	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-560a-4b3d-8c81-40afdec539d4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-560a-4b3d-dbf3-03c18697c2df	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-560a-4b3d-2a97-e9e6d35199f8	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-560a-4b3d-763c-cdc56daaf9f9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3032 (class 0 OID 21019880)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-560a-4b3d-e5f9-5454d9e26bc1	01	Velika predstava	f	1.00	1.00
002b0000-560a-4b3d-d39c-144f524cd243	02	Mala predstava	f	0.50	0.50
002b0000-560a-4b3d-7ab5-70073ff92fb3	03	Mala koprodukcija	t	0.40	1.00
002b0000-560a-4b3d-1a33-f7104a073237	04	Srednja koprodukcija	t	0.70	2.00
002b0000-560a-4b3d-8ce2-a324108ed2fd	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2985 (class 0 OID 21019274)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21019121)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-560a-4b3d-9287-8705c4f49ab4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuq6oqrxjUszoTs9QHqv0a8RkDfBtHbm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-9b12-34fdf9911931	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-e9e5-cf754a63f50b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-9a08-de2317923aa9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-7a40-ab99a7940bb0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-6257-e8068ab75522	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-c6c3-5b436748ea6f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-fb0f-4b28526be43f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-5339-cdb92259d335	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-b3a5-f935a7ba1497	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-560a-4b3f-8446-28c0854f27c5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-560a-4b3d-7420-cec5321fc368	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 21019682)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-560a-4b3f-1eed-a78889f844cd	00160000-560a-4b3f-38e0-d4f1b933941f	\N	00140000-560a-4b3d-cba6-33a6344d23d6	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-560a-4b3f-a2e6-359d897fbe21
000e0000-560a-4b3f-2d2e-fd5da4e5f24f	00160000-560a-4b3f-729a-f4c695284636	\N	00140000-560a-4b3d-b6a0-6acbb5361a5b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-560a-4b3f-282c-35514a515edb
000e0000-560a-4b3f-f8bd-1157d04d20ab	\N	\N	00140000-560a-4b3d-b6a0-6acbb5361a5b	00190000-560a-4b3f-466c-aab48659f0b5	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-4b3f-a2e6-359d897fbe21
000e0000-560a-4b3f-c1f0-64c1d6e6a7a2	\N	\N	00140000-560a-4b3d-b6a0-6acbb5361a5b	00190000-560a-4b3f-466c-aab48659f0b5	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-4b3f-a2e6-359d897fbe21
000e0000-560a-4b3f-0eb9-fc648e57f348	\N	\N	00140000-560a-4b3d-b6a0-6acbb5361a5b	00190000-560a-4b3f-466c-aab48659f0b5	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-4b3f-6c91-700d027d0925
000e0000-560a-4b3f-a1df-18940b574772	\N	\N	00140000-560a-4b3d-b6a0-6acbb5361a5b	00190000-560a-4b3f-466c-aab48659f0b5	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-4b3f-6c91-700d027d0925
\.


--
-- TOC entry 2992 (class 0 OID 21019364)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-560a-4b3f-f078-e834bc1ca761	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	\N	1	
00200000-560a-4b3f-faae-933634b966f5	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	\N	2	
00200000-560a-4b3f-03bf-264278165b68	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	\N	3	
00200000-560a-4b3f-c9ce-42865eb6bb45	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	\N	4	
00200000-560a-4b3f-ea16-2952f3a58f29	000e0000-560a-4b3f-2d2e-fd5da4e5f24f	\N	5	
\.


--
-- TOC entry 3006 (class 0 OID 21019492)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21019605)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-560a-4b3d-355a-856cc96f9d50	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-560a-4b3d-e09e-b89331ab3859	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-560a-4b3d-9c34-f3420868aabe	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-560a-4b3d-c01a-c3b6e2d5cb6a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-560a-4b3d-e781-4e617fb067a4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-560a-4b3d-64e6-46de070dbfae	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-560a-4b3d-3f50-c89579f632d5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-560a-4b3d-9aec-866a8eedc915	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-560a-4b3d-d489-3d8671081ba5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-560a-4b3d-3adb-94fe1b724ff3	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-560a-4b3d-4c85-461898d7cd27	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-560a-4b3d-08b7-b0a8ff24a84a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-560a-4b3d-c158-96e058ff2e36	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-560a-4b3d-a18b-1838b2e29e20	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-560a-4b3d-2b2c-7228d896d355	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-560a-4b3d-5518-36d800582a13	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-560a-4b3d-1886-b3f1d77b761c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-560a-4b3d-cdf6-f876e9b1ebc6	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-560a-4b3d-1794-656d25bfde37	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-560a-4b3d-2c6e-85f1ace8d0cf	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-560a-4b3d-b778-8c8bf48f3981	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-560a-4b3d-766b-59a454a8de49	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-560a-4b3d-1d7f-dbcb9b32a2de	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-560a-4b3d-7cdb-bec6c9d763a6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-560a-4b3d-6bde-7e8bd44844f2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-560a-4b3d-2637-d9acbbf861c1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-560a-4b3d-2acf-0cadb33718be	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-560a-4b3d-62e5-b072e8d28fa2	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3035 (class 0 OID 21019927)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21019899)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21019939)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21019564)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-560a-4b3f-5a38-6c9846ce82c5	00090000-560a-4b3f-f385-fbb5cbdeff1a	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-4b3f-7e70-3e8f2dd6e4d8	00090000-560a-4b3f-6d44-f866c454f557	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-4b3f-ffc4-18000ce7ad69	00090000-560a-4b3f-3ad4-fcd9226da130	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-4b3f-3890-d867b7351535	00090000-560a-4b3f-0ed2-b54859127625	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-4b3f-e884-6320ad167b9a	00090000-560a-4b3f-352f-01011e5a35ed	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-4b3f-62ca-1098e8c0a226	00090000-560a-4b3f-e461-3fad8b5496f9	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2994 (class 0 OID 21019400)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21019672)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-560a-4b3d-cba6-33a6344d23d6	01	Drama	drama (SURS 01)
00140000-560a-4b3d-b14a-e6513285125c	02	Opera	opera (SURS 02)
00140000-560a-4b3d-ecd0-88eb25f55ea4	03	Balet	balet (SURS 03)
00140000-560a-4b3d-f8df-5642e62b9b3e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-560a-4b3d-3376-d68cada9a952	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-560a-4b3d-b6a0-6acbb5361a5b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-560a-4b3d-36f0-ed94e269e217	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3012 (class 0 OID 21019554)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2499 (class 2606 OID 21019175)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 21019731)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21019721)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21019588)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21019630)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21019979)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21019389)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21019410)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21019897)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21019300)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 21019788)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21019550)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21019362)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21019338)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21019314)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21019457)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 21019956)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 21019963)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 21019987)
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
-- TOC entry 2611 (class 2606 OID 21019484)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21019272)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 21019184)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21019208)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 21019164)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2490 (class 2606 OID 21019149)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21019490)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21019526)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21019667)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21019236)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21019260)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21019849)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 21019463)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 21019250)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 21019350)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 21019475)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 21019858)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21019866)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 21019836)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 21019878)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 21019508)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 21019448)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21019439)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 21019654)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 21019581)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21019326)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21019120)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21019517)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21019138)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2492 (class 2606 OID 21019158)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 21019535)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21019470)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21019419)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21019108)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21019096)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21019090)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21019601)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 21019217)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21019430)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21019641)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21019890)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 21019285)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21019133)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21019700)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21019372)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21019498)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21019613)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21019937)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 21019921)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21019945)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21019572)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 21019404)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21019680)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 21019562)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 21019398)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2564 (class 1259 OID 21019399)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2565 (class 1259 OID 21019397)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2566 (class 1259 OID 21019396)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 21019395)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2653 (class 1259 OID 21019602)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2654 (class 1259 OID 21019603)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 21019604)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 21019958)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 21019957)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2513 (class 1259 OID 21019238)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 21019491)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 21019925)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 21019924)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 21019926)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 21019923)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 21019922)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 21019477)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 21019476)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 21019373)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 21019551)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 21019553)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 21019552)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2538 (class 1259 OID 21019316)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21019315)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2717 (class 1259 OID 21019879)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2669 (class 1259 OID 21019669)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 21019670)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 21019671)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 21019946)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2678 (class 1259 OID 21019705)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2679 (class 1259 OID 21019702)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2680 (class 1259 OID 21019706)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2681 (class 1259 OID 21019704)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2682 (class 1259 OID 21019703)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2528 (class 1259 OID 21019287)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 21019286)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2504 (class 1259 OID 21019211)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 21019518)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 21019165)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2495 (class 1259 OID 21019166)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 21019538)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 21019537)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 21019536)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 21019351)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 21019352)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 21019098)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 21019443)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 21019441)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 21019440)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 21019442)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 21019139)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 21019140)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 21019499)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 21019980)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2651 (class 1259 OID 21019590)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 21019589)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2750 (class 1259 OID 21019988)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 21019989)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 21019464)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 21019582)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 21019583)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 21019793)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2700 (class 1259 OID 21019792)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2701 (class 1259 OID 21019789)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21019790)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2703 (class 1259 OID 21019791)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2517 (class 1259 OID 21019252)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 21019251)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2519 (class 1259 OID 21019253)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 21019512)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 21019511)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 21019859)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2710 (class 1259 OID 21019860)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2692 (class 1259 OID 21019735)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 21019736)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2694 (class 1259 OID 21019733)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2695 (class 1259 OID 21019734)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 21019573)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 21019452)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 21019451)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 21019449)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 21019450)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2688 (class 1259 OID 21019723)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 21019722)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 21019327)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2545 (class 1259 OID 21019341)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2546 (class 1259 OID 21019340)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2547 (class 1259 OID 21019339)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2548 (class 1259 OID 21019342)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2557 (class 1259 OID 21019363)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 21019850)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2725 (class 1259 OID 21019898)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 21019964)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 21019965)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2500 (class 1259 OID 21019186)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 21019185)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2509 (class 1259 OID 21019218)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 21019219)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 21019405)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 21019433)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 21019432)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 21019431)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2568 (class 1259 OID 21019391)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 21019392)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 21019390)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 21019394)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2572 (class 1259 OID 21019393)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2516 (class 1259 OID 21019237)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 21019301)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 21019303)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2536 (class 1259 OID 21019302)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2537 (class 1259 OID 21019304)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 21019458)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21019668)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21019701)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 21019642)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 21019643)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2507 (class 1259 OID 21019209)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 21019210)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 21019563)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 21019109)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21019273)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 21019097)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2722 (class 1259 OID 21019891)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 21019510)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 21019509)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 21019732)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 21019261)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 21019681)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21019938)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2715 (class 1259 OID 21019867)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 21019868)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 21019631)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2580 (class 1259 OID 21019420)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 21019159)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2784 (class 2606 OID 21020120)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 21020125)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2779 (class 2606 OID 21020145)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2785 (class 2606 OID 21020115)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 21020135)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 21020140)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 21020130)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 21020310)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2819 (class 2606 OID 21020315)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 21020320)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 21020485)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 21020480)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 21020045)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 21020230)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 21020465)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 21020460)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 21020470)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 21020455)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2850 (class 2606 OID 21020450)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2800 (class 2606 OID 21020225)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 21020220)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 21020110)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21020270)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 21020280)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2811 (class 2606 OID 21020275)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 21020080)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 21020075)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 21020210)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 21020440)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 21020325)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 21020330)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 21020335)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 21020475)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 21020355)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2828 (class 2606 OID 21020340)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 21020360)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 21020350)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 21020345)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 21020070)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 21020065)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 21020030)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2762 (class 2606 OID 21020025)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21020250)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 21020005)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 21020010)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 21020265)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2808 (class 2606 OID 21020260)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 21020255)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2776 (class 2606 OID 21020095)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 21020100)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 21019990)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 21020185)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2792 (class 2606 OID 21020175)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2793 (class 2606 OID 21020170)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2791 (class 2606 OID 21020180)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 21019995)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 21020000)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2803 (class 2606 OID 21020235)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2856 (class 2606 OID 21020500)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 21020305)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21020300)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2858 (class 2606 OID 21020505)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2857 (class 2606 OID 21020510)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 21020215)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2815 (class 2606 OID 21020290)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2814 (class 2606 OID 21020295)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21020415)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 21020410)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2839 (class 2606 OID 21020395)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21020400)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2837 (class 2606 OID 21020405)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2767 (class 2606 OID 21020055)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 21020050)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 21020060)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21020245)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2805 (class 2606 OID 21020240)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 21020425)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 21020430)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2832 (class 2606 OID 21020385)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 21020390)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2834 (class 2606 OID 21020375)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2833 (class 2606 OID 21020380)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2813 (class 2606 OID 21020285)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 21020205)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2795 (class 2606 OID 21020200)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2797 (class 2606 OID 21020190)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2796 (class 2606 OID 21020195)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 21020370)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 21020365)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 21020085)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2774 (class 2606 OID 21020090)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21020105)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 21020420)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2843 (class 2606 OID 21020435)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21020445)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2855 (class 2606 OID 21020490)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2854 (class 2606 OID 21020495)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2759 (class 2606 OID 21020020)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 21020015)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2764 (class 2606 OID 21020035)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 21020040)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 21020150)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21020165)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 21020160)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 21020155)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-29 10:26:42 CEST

--
-- PostgreSQL database dump complete
--

