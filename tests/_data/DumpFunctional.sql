--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-23 12:16:15 CEST

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
-- TOC entry 181 (class 1259 OID 20470145)
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
-- TOC entry 229 (class 1259 OID 20470701)
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
-- TOC entry 228 (class 1259 OID 20470684)
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
-- TOC entry 219 (class 1259 OID 20470562)
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
-- TOC entry 222 (class 1259 OID 20470592)
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
-- TOC entry 243 (class 1259 OID 20470940)
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
-- TOC entry 197 (class 1259 OID 20470352)
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
-- TOC entry 199 (class 1259 OID 20470384)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20470866)
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
-- TOC entry 190 (class 1259 OID 20470266)
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
-- TOC entry 230 (class 1259 OID 20470714)
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
-- TOC entry 215 (class 1259 OID 20470517)
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
-- TOC entry 195 (class 1259 OID 20470331)
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
-- TOC entry 193 (class 1259 OID 20470306)
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
-- TOC entry 191 (class 1259 OID 20470283)
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
-- TOC entry 204 (class 1259 OID 20470431)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20470921)
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
-- TOC entry 242 (class 1259 OID 20470933)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20470955)
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
-- TOC entry 208 (class 1259 OID 20470456)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20470240)
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
-- TOC entry 182 (class 1259 OID 20470154)
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
-- TOC entry 183 (class 1259 OID 20470165)
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
-- TOC entry 178 (class 1259 OID 20470119)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20470138)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20470463)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20470497)
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
-- TOC entry 225 (class 1259 OID 20470632)
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
-- TOC entry 185 (class 1259 OID 20470198)
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
-- TOC entry 187 (class 1259 OID 20470232)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20470812)
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
-- TOC entry 205 (class 1259 OID 20470437)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20470217)
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
-- TOC entry 194 (class 1259 OID 20470321)
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
-- TOC entry 207 (class 1259 OID 20470449)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20470826)
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
-- TOC entry 234 (class 1259 OID 20470836)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20470769)
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
-- TOC entry 235 (class 1259 OID 20470844)
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
-- TOC entry 211 (class 1259 OID 20470478)
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
-- TOC entry 203 (class 1259 OID 20470422)
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
-- TOC entry 202 (class 1259 OID 20470412)
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
-- TOC entry 224 (class 1259 OID 20470621)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20470552)
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
-- TOC entry 192 (class 1259 OID 20470295)
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
-- TOC entry 175 (class 1259 OID 20470090)
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
-- TOC entry 174 (class 1259 OID 20470088)
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
-- TOC entry 212 (class 1259 OID 20470491)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20470128)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20470112)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20470505)
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
-- TOC entry 206 (class 1259 OID 20470443)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20470389)
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
-- TOC entry 173 (class 1259 OID 20470077)
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
-- TOC entry 172 (class 1259 OID 20470069)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20470064)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20470569)
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
-- TOC entry 184 (class 1259 OID 20470190)
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
-- TOC entry 201 (class 1259 OID 20470399)
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
-- TOC entry 223 (class 1259 OID 20470609)
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
-- TOC entry 236 (class 1259 OID 20470854)
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
-- TOC entry 189 (class 1259 OID 20470252)
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
-- TOC entry 176 (class 1259 OID 20470099)
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
-- TOC entry 227 (class 1259 OID 20470659)
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
-- TOC entry 196 (class 1259 OID 20470342)
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
-- TOC entry 210 (class 1259 OID 20470470)
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
-- TOC entry 221 (class 1259 OID 20470583)
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
-- TOC entry 239 (class 1259 OID 20470901)
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
-- TOC entry 238 (class 1259 OID 20470873)
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
-- TOC entry 240 (class 1259 OID 20470913)
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
-- TOC entry 217 (class 1259 OID 20470542)
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
-- TOC entry 198 (class 1259 OID 20470378)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20470649)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20470532)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20470093)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2973 (class 0 OID 20470145)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 20470701)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5602-7bed-c21d-9164b797c0dc	000d0000-5602-7bed-b4a8-78bedfdccd9e	\N	00090000-5602-7bed-5781-e4ded51323ca	000b0000-5602-7bed-c475-3ee6047d3244	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5602-7bed-e2d5-e8540a5a49ab	000d0000-5602-7bed-236e-34478edf8ca6	00100000-5602-7bed-7e58-c9046354f8c6	00090000-5602-7bed-fb93-3d21250bfd80	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5602-7bed-b34e-5d56088c28fc	000d0000-5602-7bed-086c-f90f36555aac	00100000-5602-7bed-286e-bb99344296b9	00090000-5602-7bed-4130-99c4e594887f	\N	0003	t	\N	2015-09-23	\N	2	t	\N	f	f
000c0000-5602-7bed-956b-f17fa4ffac10	000d0000-5602-7bed-cfff-d1e4ad245ec6	\N	00090000-5602-7bed-158d-c12149f6ea83	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5602-7bed-83e1-96cd22af169c	000d0000-5602-7bed-7102-f5a9951027e6	\N	00090000-5602-7bed-a202-7ab54a59d1c2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5602-7bed-f38b-aaa41ff3152c	000d0000-5602-7bed-f0a1-ed094a1bb6fc	\N	00090000-5602-7bed-11a0-7851b4e60bb4	000b0000-5602-7bed-432f-55d05a09ab64	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5602-7bed-c774-f9c1889dfa89	000d0000-5602-7bed-9be7-03b876dd1753	00100000-5602-7bed-7d41-fdaf056d9120	00090000-5602-7bed-b6ac-24df70b6d6b5	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5602-7bed-07fc-1ea99977a42d	000d0000-5602-7bed-ad09-abc6f02d0439	\N	00090000-5602-7bed-71d0-98bd9ddfe8f7	000b0000-5602-7bed-7f9a-725ac3349289	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5602-7bed-927e-30c70f47c384	000d0000-5602-7bed-9be7-03b876dd1753	00100000-5602-7bed-9183-50ad1b4f42f1	00090000-5602-7bed-1456-df289066cfae	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5602-7bed-ab41-ed62eed26356	000d0000-5602-7bed-9be7-03b876dd1753	00100000-5602-7bed-2ed5-33a579e30d15	00090000-5602-7bed-2a47-3e4c051cdd7e	\N	0010	t	\N	2015-09-23	\N	16	f	\N	f	t
000c0000-5602-7bed-abd4-5eb51413cdd3	000d0000-5602-7bed-9be7-03b876dd1753	00100000-5602-7bed-5db3-9084310beac0	00090000-5602-7bed-98d7-5bb06f02a7fd	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5602-7bed-7c49-67f8911d1734	000d0000-5602-7bed-b639-8d33adf2ab32	\N	00090000-5602-7bed-fb93-3d21250bfd80	000b0000-5602-7bed-5485-03b0e66bf28c	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3020 (class 0 OID 20470684)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20470562)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5602-7bed-4b5e-b77868e03129	00160000-5602-7bec-6604-efa9eb52b5d4	00090000-5602-7bed-527d-c697f2755838	Avtor originala	10	t
003d0000-5602-7bed-4341-de91d4f185cc	00160000-5602-7bec-6604-efa9eb52b5d4	00090000-5602-7bed-57c2-cf1fdbe21b2a	Predelava	14	t
003d0000-5602-7bed-4184-6a3205b0c934	00160000-5602-7bec-7a3c-3afd8cd0b780	00090000-5602-7bed-79d3-b8e930980769	Avtor originala	11	t
003d0000-5602-7bed-a1dd-3c294b108759	00160000-5602-7bec-de40-76847e922eb9	00090000-5602-7bed-3d9e-e8190bc4ef0e	Avtor originala	12	t
003d0000-5602-7bed-30b1-8d0d3bcfb4c9	00160000-5602-7bec-6604-efa9eb52b5d4	00090000-5602-7bed-3ab9-ae18139cd1df	Predelava	18	f
\.


--
-- TOC entry 3014 (class 0 OID 20470592)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5602-7bec-6604-efa9eb52b5d4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5602-7bec-7a3c-3afd8cd0b780	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5602-7bec-de40-76847e922eb9	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3035 (class 0 OID 20470940)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 20470352)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5602-7bed-4f4e-a020b7e4016f	\N	\N	00200000-5602-7bed-4563-49652c97ce93	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5602-7bed-48fa-bda6f6e26148	\N	\N	00200000-5602-7bed-dcd5-f326f83451f5	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5602-7bed-3f50-0c80b3303430	\N	\N	00200000-5602-7bed-299c-2677116637cb	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5602-7bed-4c29-35723beddd4b	\N	\N	00200000-5602-7bed-fd61-d8a2f802af63	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5602-7bed-f65c-ac024029eaf2	\N	\N	00200000-5602-7bed-29bc-1da22eeffc5c	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2991 (class 0 OID 20470384)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20470866)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20470266)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5602-7beb-1fa3-ccc7095737cf	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5602-7beb-4928-9f893d6d7951	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5602-7beb-a0ba-8f3e4ba07e9c	AL	ALB	008	Albania 	Albanija	\N
00040000-5602-7beb-9309-0916be9d37d0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5602-7beb-40c3-5000f1c9e9ce	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5602-7beb-330b-d68a424cd455	AD	AND	020	Andorra 	Andora	\N
00040000-5602-7beb-2d15-d8a2469ce9a6	AO	AGO	024	Angola 	Angola	\N
00040000-5602-7beb-6d21-eff61ca48622	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5602-7beb-84ab-8a64ec340be4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5602-7beb-afaf-54423a42098a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-7beb-d31f-b5c5d7e54037	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5602-7beb-b1cb-fef5448649ee	AM	ARM	051	Armenia 	Armenija	\N
00040000-5602-7beb-8fe5-85983035f7aa	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5602-7beb-663b-d5b2cc2fae57	AU	AUS	036	Australia 	Avstralija	\N
00040000-5602-7beb-2678-86dec419529d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5602-7beb-21ea-eaf05db17bb9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5602-7beb-b2a6-9ae5180da0c4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5602-7beb-65e7-9b3b1e68400e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5602-7beb-95f0-908658b4b7d3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5602-7beb-4fa5-cde826ffd2b9	BB	BRB	052	Barbados 	Barbados	\N
00040000-5602-7beb-7c95-22ea1cbc5689	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5602-7beb-2f5f-0ed56c564bd3	BE	BEL	056	Belgium 	Belgija	\N
00040000-5602-7beb-d067-a6c02a9d746e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5602-7beb-d19d-1489bd906c0b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5602-7beb-1cae-70bbd1758c56	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5602-7beb-c1f8-26e24d0f7709	BT	BTN	064	Bhutan 	Butan	\N
00040000-5602-7beb-8dbf-c48f4af9681e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5602-7beb-fbcc-4a3d5b1f43eb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5602-7beb-fd27-d9037d43840f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5602-7beb-b35d-66a23c206528	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5602-7beb-459b-56aa264867c6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5602-7beb-db58-fe8a482cb6f6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5602-7beb-f073-072adf355b13	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5602-7beb-3a2e-8e304245da4c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5602-7beb-2ab2-c621ccd1b54f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5602-7beb-8956-e8c1bc2ede7e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5602-7beb-e8b7-5e79b4fea9d0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5602-7beb-ca07-8d069cf3f413	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5602-7beb-3fde-e5b626eb430d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5602-7beb-8ce4-753f04413d56	CA	CAN	124	Canada 	Kanada	\N
00040000-5602-7beb-20b2-61f1d44d40d1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5602-7beb-d4bd-9a2d2909e61f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5602-7beb-16ac-0a7b92a7e805	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5602-7beb-d539-da6962dfd431	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5602-7beb-e781-36c3971ed06a	CL	CHL	152	Chile 	Čile	\N
00040000-5602-7beb-946a-04a7ca47c60c	CN	CHN	156	China 	Kitajska	\N
00040000-5602-7beb-0476-7f93b6615984	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5602-7beb-4aa5-350f03dccda8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5602-7beb-13b9-f8ab20131504	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5602-7beb-fc78-d7b3981ee458	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5602-7beb-cd93-d74b5992ba8e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5602-7beb-516e-f8dd3532e47b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5602-7beb-8a88-305f49ca784a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5602-7beb-e115-d6d6e8f16fd6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5602-7beb-8aae-0091280665f6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5602-7beb-a0f6-cf7c1ac8be52	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5602-7beb-ddd6-b7f8a78160d1	CU	CUB	192	Cuba 	Kuba	\N
00040000-5602-7beb-d322-9609453f494c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5602-7beb-303b-dd8c5337c0c9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5602-7beb-85e3-cc5e885f641f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5602-7beb-929f-d0f7d054c516	DK	DNK	208	Denmark 	Danska	\N
00040000-5602-7beb-7f54-ad811beffa12	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5602-7beb-543a-5a651033cd7f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-7beb-6423-0df97970331b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5602-7beb-15df-03e3967ae990	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5602-7beb-97ab-97c0080b084f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5602-7beb-3d2b-fd75370ce88d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5602-7beb-bfcd-36bce813a010	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5602-7beb-eab7-3d54f202dd22	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5602-7beb-42a0-1f05c712ea61	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5602-7beb-fc44-8f746a1f1178	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5602-7beb-975b-6ae72202f66b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5602-7beb-dadb-ca89569faf19	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5602-7beb-27a9-c83183c3f04e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5602-7beb-0da2-e10e9de39878	FI	FIN	246	Finland 	Finska	\N
00040000-5602-7beb-fabc-30b39698b376	FR	FRA	250	France 	Francija	\N
00040000-5602-7beb-67ad-3f6318b6175c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5602-7beb-aaea-fc1c5cfb15d9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5602-7beb-9d03-e5af1f135397	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5602-7beb-93bd-5cb7a8131df7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5602-7beb-fadd-075abf085c0c	GA	GAB	266	Gabon 	Gabon	\N
00040000-5602-7beb-573e-160feff7dc6a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5602-7beb-0a93-db517879997b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5602-7beb-8314-9f6a6c0d6290	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5602-7beb-408e-77bcdbd62e95	GH	GHA	288	Ghana 	Gana	\N
00040000-5602-7beb-8081-7acc90d086ba	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5602-7beb-4dab-70367c2a3485	GR	GRC	300	Greece 	Grčija	\N
00040000-5602-7beb-9810-a402c2496950	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5602-7beb-7299-fd6c2f62a833	GD	GRD	308	Grenada 	Grenada	\N
00040000-5602-7beb-0ae5-4da6a9a6c03d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5602-7beb-1141-db7ca6de9214	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5602-7beb-3656-29d72b103578	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5602-7beb-a9da-8d7545c02b64	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5602-7beb-dd6d-38bc4aaffde1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5602-7beb-e6f8-a871147b618e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5602-7beb-4b65-f031921b2cf7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5602-7beb-47b7-3bca90a9a03e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5602-7beb-5c42-5ca67d449367	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5602-7beb-4dea-076338c63395	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5602-7beb-2afa-44d8e570ff84	HN	HND	340	Honduras 	Honduras	\N
00040000-5602-7beb-0828-1eb6a1764b4f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5602-7beb-e8fb-5288cc74571d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5602-7beb-f481-dabd75330972	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5602-7beb-c233-004305ffa72a	IN	IND	356	India 	Indija	\N
00040000-5602-7beb-6990-4d4cbae77864	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5602-7beb-e4f3-cc8dc5bd3fa5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5602-7beb-728f-c2f4740c8d4c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5602-7beb-431b-8566c07f851e	IE	IRL	372	Ireland 	Irska	\N
00040000-5602-7beb-af7c-d9406e2f3c27	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5602-7beb-7224-b27c441147a1	IL	ISR	376	Israel 	Izrael	\N
00040000-5602-7beb-e205-27f88197e7f9	IT	ITA	380	Italy 	Italija	\N
00040000-5602-7beb-ee6f-af3ccc1c38e9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5602-7beb-f1fa-e32dd95f564f	JP	JPN	392	Japan 	Japonska	\N
00040000-5602-7beb-d9eb-8fcf6df1b385	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5602-7beb-9fc8-ce25a6246c3b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5602-7beb-2653-25ebce472ec1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5602-7beb-f15b-9186eda9df2f	KE	KEN	404	Kenya 	Kenija	\N
00040000-5602-7beb-fde8-ee58bdc706b7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5602-7beb-7fa1-92967ab0910d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5602-7beb-fabc-17620d479060	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5602-7beb-6d95-5108344531d7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5602-7beb-a93c-fff96f522897	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5602-7beb-d3e0-717b078ecf66	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5602-7beb-c9d2-1708efa2985e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5602-7beb-c812-2b0e2da47093	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5602-7beb-7e69-364d7e454f23	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5602-7beb-053c-541426509eb8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5602-7beb-645a-728b6852ec5a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5602-7beb-aa8e-fd79571fd4f7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5602-7beb-d611-988073f96626	LT	LTU	440	Lithuania 	Litva	\N
00040000-5602-7beb-b720-867499483507	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5602-7beb-4e8f-50006f2e199e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5602-7beb-cff5-86de38728574	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5602-7beb-5f54-461cd365cac7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5602-7beb-f61e-09c50ad2ac6d	MW	MWI	454	Malawi 	Malavi	\N
00040000-5602-7beb-b656-46b079cb7d16	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5602-7beb-7471-e1c57d59d7d5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5602-7beb-2ba4-d550b1715904	ML	MLI	466	Mali 	Mali	\N
00040000-5602-7beb-5435-34984107477b	MT	MLT	470	Malta 	Malta	\N
00040000-5602-7beb-d87f-092a8815a21e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5602-7beb-f059-96466a22bbcc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5602-7beb-282a-68af908e014d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5602-7beb-24d8-9fad9754fd5a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5602-7beb-d606-5afee141f66c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5602-7beb-9330-fe52480a914a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5602-7beb-75f7-5d294220e4e9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5602-7beb-d573-c27032385c7e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5602-7beb-b070-f7a030105524	MC	MCO	492	Monaco 	Monako	\N
00040000-5602-7beb-4720-7836618de2c2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5602-7beb-5ad0-e95dc5af72e8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5602-7beb-e84c-d32dfbcb825b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5602-7beb-69f6-23d975963698	MA	MAR	504	Morocco 	Maroko	\N
00040000-5602-7beb-e9cb-b493756fb49c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5602-7beb-be79-a569e6214f45	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5602-7beb-600b-d2c0af6cf2d8	NA	NAM	516	Namibia 	Namibija	\N
00040000-5602-7beb-b1e3-0c0b34b703df	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5602-7beb-9a6c-33c132495a66	NP	NPL	524	Nepal 	Nepal	\N
00040000-5602-7beb-da5c-bae8e90c6975	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5602-7beb-bf23-e02a6695ae51	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5602-7beb-f61c-eb5e559de040	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5602-7beb-fdd1-267ecd173d9a	NE	NER	562	Niger 	Niger 	\N
00040000-5602-7beb-5657-201da586c4cb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5602-7beb-9e55-caefef75c8d5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5602-7beb-08ee-2b065607f08d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5602-7beb-ed67-6870320fc7e8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5602-7beb-6658-918a05136773	NO	NOR	578	Norway 	Norveška	\N
00040000-5602-7beb-08ff-c4748709b793	OM	OMN	512	Oman 	Oman	\N
00040000-5602-7beb-587d-011d22047637	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5602-7beb-5f52-1e7df0275117	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5602-7beb-b8b6-e9c8a3f3bf35	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5602-7beb-30a1-190f00d0ce38	PA	PAN	591	Panama 	Panama	\N
00040000-5602-7beb-796f-6ca837a480b7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5602-7beb-7132-adfcf3004c0d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5602-7beb-f1da-50cab010e6aa	PE	PER	604	Peru 	Peru	\N
00040000-5602-7beb-5806-0f17c2df9351	PH	PHL	608	Philippines 	Filipini	\N
00040000-5602-7beb-78dc-ea1a8637cbdb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5602-7beb-69eb-af1a6986910a	PL	POL	616	Poland 	Poljska	\N
00040000-5602-7beb-cb4f-7ce8150c2a96	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5602-7beb-72d3-27ef70994258	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5602-7beb-8d40-06d7ea3850ff	QA	QAT	634	Qatar 	Katar	\N
00040000-5602-7beb-b925-6de9f9d964da	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5602-7beb-c4be-f9d04285335b	RO	ROU	642	Romania 	Romunija	\N
00040000-5602-7beb-631d-821b95a19279	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5602-7beb-c796-8c9dd2d5b24f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5602-7beb-9abd-ff2e1547ae5f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5602-7beb-f822-8c6d2783232e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5602-7beb-a8f8-7912557eb3ed	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5602-7beb-06f0-c8f09473e086	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5602-7beb-d3cd-66398c396466	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5602-7beb-6a4a-147a0f046e23	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5602-7beb-4409-85c1746e8c33	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5602-7beb-1f53-947c19e2e0e9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5602-7beb-5ed2-f38bba36732c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5602-7beb-d8ed-33838ebce5b4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5602-7beb-7cd3-fc36be9308fb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5602-7beb-9b86-3937e08e404f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5602-7beb-f762-ad2b4d269061	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5602-7beb-e895-b3655ff19d22	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5602-7beb-f2ad-07e4d22485a5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5602-7beb-8e8f-1077dfc4f0ad	SG	SGP	702	Singapore 	Singapur	\N
00040000-5602-7beb-aeaa-4b2f2e3e324f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5602-7beb-bde4-9a6ac289080c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5602-7beb-8d6e-fa0775f70b8d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5602-7beb-a82e-cd8a400b6741	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5602-7beb-5b9e-fe5b301871d8	SO	SOM	706	Somalia 	Somalija	\N
00040000-5602-7beb-33a7-443b95e633ac	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5602-7beb-3be6-eed07bd32f35	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5602-7beb-62d7-4d910e785535	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5602-7beb-2d54-24dc544d3ab9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5602-7beb-4753-5c09527878b8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5602-7beb-8022-66cdac84679b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5602-7beb-bbbc-12ed1fe44821	SR	SUR	740	Suriname 	Surinam	\N
00040000-5602-7beb-282b-1bac1c61d9da	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5602-7beb-a8ce-f14640192e89	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5602-7beb-f2a8-b92c35401c88	SE	SWE	752	Sweden 	Švedska	\N
00040000-5602-7beb-b994-fd9e372a01ca	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5602-7beb-05a9-ed91cacefe2f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5602-7beb-530e-895308e64952	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5602-7beb-7892-7e7449c744ad	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5602-7beb-5260-0077d7ba1e8f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5602-7beb-ff39-7bb40606ab46	TH	THA	764	Thailand 	Tajska	\N
00040000-5602-7beb-8fc2-1091ec4d107a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5602-7beb-dc76-f27384faba10	TG	TGO	768	Togo 	Togo	\N
00040000-5602-7beb-05d0-c39294a55960	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5602-7beb-7f6d-a9ff50956ad3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5602-7beb-57fb-5cf72d2be8b1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5602-7beb-c9bc-3d9ee735d060	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5602-7beb-97e8-81e747312647	TR	TUR	792	Turkey 	Turčija	\N
00040000-5602-7beb-2629-7b796430a0d2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5602-7beb-dae7-699ab7d24a1b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-7beb-eb4d-dc6f095d2416	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5602-7beb-ab8e-a43dcc39e249	UG	UGA	800	Uganda 	Uganda	\N
00040000-5602-7beb-940a-8cecb6af4c16	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5602-7beb-268b-f3d12753de32	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5602-7beb-db2c-a6c55a0a2a9b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5602-7beb-8fdf-bd0bbacb2ab6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5602-7beb-031c-d7c3dd3b05f0	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5602-7beb-7a35-d4a67461785a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5602-7beb-c6a7-962da815ea9d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5602-7beb-df78-f7fc46ad9173	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5602-7beb-5d5e-0245565e4667	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5602-7beb-8995-688a1fe9f727	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5602-7beb-d86b-9455232aa331	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-7beb-8147-82e56412f67c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5602-7beb-9ebc-26cb3084bb35	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5602-7beb-9b29-5b7a928a6349	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5602-7beb-a23b-bc0d8e0a201e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5602-7beb-663f-04d4c8d0c1d8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5602-7beb-4fa6-e29a4715fe37	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3022 (class 0 OID 20470714)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5602-7bed-3595-ee7ded56e15e	000e0000-5602-7bed-124a-9b962e8560f3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-7beb-1200-ffa0fad57645	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-7bed-2378-920887723682	000e0000-5602-7bed-8032-8392238e869c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-7beb-c863-f12167c5aeb4	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-7bed-fd7b-167f6869ffdc	000e0000-5602-7bed-2ac4-1a9117deb194	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-7beb-1200-ffa0fad57645	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-7bed-8400-14873b65e2bc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-7bed-d1c7-8e8e47fd097f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3007 (class 0 OID 20470517)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5602-7bed-b4a8-78bedfdccd9e	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-c21d-9164b797c0dc	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-7beb-e71a-ded090748546
000d0000-5602-7bed-236e-34478edf8ca6	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-e2d5-e8540a5a49ab	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5602-7beb-c82f-b5d0478dd5ee
000d0000-5602-7bed-086c-f90f36555aac	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-b34e-5d56088c28fc	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5602-7beb-4bef-b8099034d19c
000d0000-5602-7bed-cfff-d1e4ad245ec6	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-956b-f17fa4ffac10	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5602-7beb-d915-19cf46603123
000d0000-5602-7bed-7102-f5a9951027e6	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-83e1-96cd22af169c	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5602-7beb-d915-19cf46603123
000d0000-5602-7bed-f0a1-ed094a1bb6fc	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-f38b-aaa41ff3152c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-7beb-e71a-ded090748546
000d0000-5602-7bed-9be7-03b876dd1753	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-927e-30c70f47c384	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5602-7beb-e71a-ded090748546
000d0000-5602-7bed-ad09-abc6f02d0439	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-07fc-1ea99977a42d	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5602-7beb-37bf-f42c4841913b
000d0000-5602-7bed-b639-8d33adf2ab32	000e0000-5602-7bed-8032-8392238e869c	000c0000-5602-7bed-7c49-67f8911d1734	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5602-7beb-fc75-fd42ee13a02c
\.


--
-- TOC entry 2987 (class 0 OID 20470331)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20470306)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20470283)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5602-7bed-11bc-dc0743d07dc7	00080000-5602-7bed-9e22-6f9d1138d669	00090000-5602-7bed-2a47-3e4c051cdd7e	AK		igralka
\.


--
-- TOC entry 2996 (class 0 OID 20470431)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20470921)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20470933)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20470955)
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
-- TOC entry 3000 (class 0 OID 20470456)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20470240)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5602-7beb-6222-63481b0221a2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5602-7beb-5479-f3102ff46289	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5602-7beb-6831-743f1910b6bd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5602-7beb-bc50-222fd2785c50	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5602-7beb-4845-9c24cf6189f6	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5602-7beb-cafc-96f761e7a52c	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5602-7beb-9c90-98dfad7692e2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5602-7beb-e33e-dc47edf61c1c	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-7beb-be57-b5ac2648a834	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-7beb-e32c-476e65194c93	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5602-7beb-4d85-b22a57707c06	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5602-7beb-dcc5-ae65751f1381	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5602-7beb-7a40-24b067250c20	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5602-7beb-ccdd-2cd378720249	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5602-7bec-ed6a-abb15123881b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5602-7bec-d54e-076adea8e5e9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5602-7bec-1584-847065c6b970	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5602-7bec-6d9b-7d387f11f8e3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5602-7bec-61b7-8c6367a3d814	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5602-7bee-05c5-5ccb643cdd39	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2974 (class 0 OID 20470154)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5602-7bec-c7ff-50e3820dc466	00000000-5602-7bec-ed6a-abb15123881b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5602-7bec-f085-b1add69ede23	00000000-5602-7bec-ed6a-abb15123881b	00010000-5602-7beb-5cd2-7cd82a437368	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5602-7bec-5a16-99dd28c75636	00000000-5602-7bec-d54e-076adea8e5e9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2975 (class 0 OID 20470165)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5602-7bed-5781-e4ded51323ca	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5602-7bed-158d-c12149f6ea83	00010000-5602-7bed-799d-32e606709ece	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5602-7bed-4130-99c4e594887f	00010000-5602-7bed-83cc-8793746bbb07	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5602-7bed-1456-df289066cfae	00010000-5602-7bed-ba4f-22e09b059210	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5602-7bed-6098-459f89254dc3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5602-7bed-11a0-7851b4e60bb4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5602-7bed-98d7-5bb06f02a7fd	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5602-7bed-b6ac-24df70b6d6b5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5602-7bed-2a47-3e4c051cdd7e	00010000-5602-7bed-5ac3-dba82e830335	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5602-7bed-fb93-3d21250bfd80	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5602-7bed-620f-d58ad939c68d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-7bed-a202-7ab54a59d1c2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5602-7bed-71d0-98bd9ddfe8f7	00010000-5602-7bed-dc30-bc3695b4a461	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-7bed-527d-c697f2755838	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-7bed-57c2-cf1fdbe21b2a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-7bed-79d3-b8e930980769	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-7bed-3d9e-e8190bc4ef0e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5602-7bed-3ab9-ae18139cd1df	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2970 (class 0 OID 20470119)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5602-7beb-3507-ac3800e2fe43	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5602-7beb-0edb-b1664ea0003a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5602-7beb-792d-0a87b89026f3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5602-7beb-079c-efd4c12fdd84	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5602-7beb-e265-6245d7bee20d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5602-7beb-b2cf-261c2f3ed229	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5602-7beb-42b6-090b616add69	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5602-7beb-1fc7-9658477b7764	Abonma-read	Abonma - branje	f
00030000-5602-7beb-cff6-d51f2bb38fe3	Abonma-write	Abonma - spreminjanje	f
00030000-5602-7beb-a927-a02e45967b74	Alternacija-read	Alternacija - branje	f
00030000-5602-7beb-40e1-5cad68b07259	Alternacija-write	Alternacija - spreminjanje	f
00030000-5602-7beb-3636-cbb7a4426527	Arhivalija-read	Arhivalija - branje	f
00030000-5602-7beb-4396-1efb2467eef2	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5602-7beb-8bff-c0882fd95a8e	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5602-7beb-e978-ae28433a264c	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5602-7beb-c706-449af34dc4bf	Besedilo-read	Besedilo - branje	f
00030000-5602-7beb-ccce-4395e85565e5	Besedilo-write	Besedilo - spreminjanje	f
00030000-5602-7beb-168e-8989c2df5858	DogodekIzven-read	DogodekIzven - branje	f
00030000-5602-7beb-5584-724fceb72f8c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5602-7beb-8e32-eac2245758b5	Dogodek-read	Dogodek - branje	f
00030000-5602-7beb-909f-cfbd09ee8716	Dogodek-write	Dogodek - spreminjanje	f
00030000-5602-7beb-6bcf-b367edd01cc5	DrugiVir-read	DrugiVir - branje	f
00030000-5602-7beb-78ec-393d4110ffce	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5602-7beb-2cd3-e112ad40b0c3	Drzava-read	Drzava - branje	f
00030000-5602-7beb-ee2a-c0ad86fd423e	Drzava-write	Drzava - spreminjanje	f
00030000-5602-7beb-4497-2bfbe3f418b5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5602-7beb-5cd1-cc71d5c65599	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5602-7beb-b3ea-22d02608c027	Funkcija-read	Funkcija - branje	f
00030000-5602-7beb-8d80-a1aa30045c33	Funkcija-write	Funkcija - spreminjanje	f
00030000-5602-7beb-51a2-0359b61b9600	Gostovanje-read	Gostovanje - branje	f
00030000-5602-7beb-b763-04fcd734df54	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5602-7beb-a3d7-025705cde99a	Gostujoca-read	Gostujoca - branje	f
00030000-5602-7beb-5b34-32fdce2c4f15	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5602-7beb-8b2e-be2c3f73d10d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5602-7beb-623a-6cd85afb09f7	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5602-7beb-e0ce-7ee3a358ff2c	Kupec-read	Kupec - branje	f
00030000-5602-7beb-020f-009a82884e40	Kupec-write	Kupec - spreminjanje	f
00030000-5602-7beb-ce3c-7da16c2c97d4	NacinPlacina-read	NacinPlacina - branje	f
00030000-5602-7beb-b2fd-d00225df2356	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5602-7beb-324c-8e3b8f1d2398	Option-read	Option - branje	f
00030000-5602-7beb-6d9e-ec9d2d481a9c	Option-write	Option - spreminjanje	f
00030000-5602-7beb-086f-b56de3790b77	OptionValue-read	OptionValue - branje	f
00030000-5602-7beb-2623-e665a7336bbe	OptionValue-write	OptionValue - spreminjanje	f
00030000-5602-7beb-373b-5bdc67a391ae	Oseba-read	Oseba - branje	f
00030000-5602-7beb-7aa7-fac2818b1e7b	Oseba-write	Oseba - spreminjanje	f
00030000-5602-7beb-556b-46023d1071c9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5602-7beb-f139-72af12a6814e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5602-7beb-f2a3-0561c2306544	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5602-7beb-bf28-248f51cec0b1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5602-7beb-6610-860e73c9e05e	Pogodba-read	Pogodba - branje	f
00030000-5602-7beb-cc8d-722449abdc87	Pogodba-write	Pogodba - spreminjanje	f
00030000-5602-7beb-b72c-f958690ad26a	Popa-read	Popa - branje	f
00030000-5602-7beb-fa5f-3b9f5a937f38	Popa-write	Popa - spreminjanje	f
00030000-5602-7beb-5131-4bf1bb1ff8b9	Posta-read	Posta - branje	f
00030000-5602-7beb-8d9c-012248029fad	Posta-write	Posta - spreminjanje	f
00030000-5602-7beb-04be-34ca1d24fa46	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5602-7beb-4c14-141dae1d9a0d	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5602-7beb-bb6f-fe1b18a52491	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5602-7beb-7e5c-4bd77b14d70b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5602-7beb-8feb-b58dba46064f	PostniNaslov-read	PostniNaslov - branje	f
00030000-5602-7beb-7b35-a02e48463fb8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5602-7beb-d550-d1b6f8512e94	Predstava-read	Predstava - branje	f
00030000-5602-7beb-3318-783756bb38f7	Predstava-write	Predstava - spreminjanje	f
00030000-5602-7beb-2e98-8240e7bf26d7	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5602-7beb-0b1e-9be46f5898d3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5602-7beb-0600-3f76efa65d04	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5602-7beb-8dcc-a67eebb4c079	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5602-7beb-ba52-bd8e56264c8e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5602-7beb-916b-d7afa96e82fc	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5602-7beb-3bd2-4633193e91a1	ProgramDela-read	ProgramDela - branje	f
00030000-5602-7beb-b420-21aea587352e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5602-7beb-9a35-b419b5cabd0e	ProgramFestival-read	ProgramFestival - branje	f
00030000-5602-7beb-db4b-efa4bd18d451	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5602-7beb-cb47-7c0ca689a3f3	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5602-7beb-156e-451fa532d9ed	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5602-7beb-4e5f-168d7dbec455	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5602-7beb-0daa-c8f1c5450547	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5602-7beb-e8c8-cd443d1bdd40	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5602-7beb-15e8-fa122e70c3c5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5602-7beb-74ae-513c9745da9f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5602-7beb-ce82-92711a751820	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5602-7beb-d07b-d99478e2e091	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5602-7beb-8b55-f6c05f8c638e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5602-7beb-5fba-5b4900258f28	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5602-7beb-a859-844e9cc17a24	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5602-7beb-6b0c-2f24233b05c8	ProgramRazno-read	ProgramRazno - branje	f
00030000-5602-7beb-16d9-bc1e93109245	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5602-7beb-7f4b-0537be403dbe	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5602-7beb-154f-1123c04115aa	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5602-7beb-f42f-49714a965c79	Prostor-read	Prostor - branje	f
00030000-5602-7beb-e032-838fcbf9dc87	Prostor-write	Prostor - spreminjanje	f
00030000-5602-7beb-0de4-61ed15771dc9	Racun-read	Racun - branje	f
00030000-5602-7beb-9c90-9c63b0a86d75	Racun-write	Racun - spreminjanje	f
00030000-5602-7beb-4694-890a012aba23	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5602-7beb-66c8-5546bdbcaaa7	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5602-7beb-df5e-5653cf776dbf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5602-7beb-a2e0-46afa54ce8a3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5602-7beb-5d46-859dfb43ce3b	Rekvizit-read	Rekvizit - branje	f
00030000-5602-7beb-b23e-febfe7dcf802	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5602-7beb-e941-1469f5e55b37	Revizija-read	Revizija - branje	f
00030000-5602-7beb-0824-68b51cfc51e9	Revizija-write	Revizija - spreminjanje	f
00030000-5602-7beb-d275-ecb005b20225	Rezervacija-read	Rezervacija - branje	f
00030000-5602-7beb-6920-297d7e3bff01	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5602-7beb-0511-f92dc027ff77	SedezniRed-read	SedezniRed - branje	f
00030000-5602-7beb-0bc4-dd83249906e7	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5602-7beb-fa14-da0ae2c564b1	Sedez-read	Sedez - branje	f
00030000-5602-7beb-e65c-bd74b68034c3	Sedez-write	Sedez - spreminjanje	f
00030000-5602-7beb-c2ad-537ac760cb72	Sezona-read	Sezona - branje	f
00030000-5602-7beb-472a-d7f5e1f24288	Sezona-write	Sezona - spreminjanje	f
00030000-5602-7beb-8433-b0128b0e9891	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5602-7beb-0e83-91d2a0a81e61	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5602-7beb-548e-b10a9d60e823	Stevilcenje-read	Stevilcenje - branje	f
00030000-5602-7beb-8249-972a692626b2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5602-7beb-af9c-3b4c32b98e5f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5602-7beb-2aa4-e2133f1d2918	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5602-7beb-27ab-e79d1c4ce9c6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5602-7beb-d0f9-435ec4f1526f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5602-7beb-15bf-1a9a53e442dd	Telefonska-read	Telefonska - branje	f
00030000-5602-7beb-0802-909c45074bd2	Telefonska-write	Telefonska - spreminjanje	f
00030000-5602-7beb-5103-e46f18455d5e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5602-7beb-4036-2fd85c8b96cb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5602-7beb-0750-549edc0da08b	TipFunkcije-read	TipFunkcije - branje	f
00030000-5602-7beb-d635-b680d88c726a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5602-7beb-b14a-98f486224570	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5602-7beb-7ac9-dbe41169251a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5602-7beb-9676-fb00cf1aa2a6	Trr-read	Trr - branje	f
00030000-5602-7beb-6f16-d6f837e49735	Trr-write	Trr - spreminjanje	f
00030000-5602-7beb-d44e-9c5b1e06993d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5602-7beb-db2b-41d42a5d8cdb	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5602-7beb-148d-a34b60d2a0a7	Vaja-read	Vaja - branje	f
00030000-5602-7beb-87a7-fc63b08c06b2	Vaja-write	Vaja - spreminjanje	f
00030000-5602-7beb-2b51-3972e2022af7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5602-7beb-ffc1-88b15c41c51e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5602-7beb-4bfa-68a741b54189	VrstaStroska-read	VrstaStroska - branje	f
00030000-5602-7beb-6085-5b2f462b683a	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5602-7beb-45a4-8dc3eb38e0c3	Zaposlitev-read	Zaposlitev - branje	f
00030000-5602-7beb-af98-9aadff3bd86c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5602-7beb-3537-85f70187a003	Zasedenost-read	Zasedenost - branje	f
00030000-5602-7beb-3bb7-a3eddd904cd2	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5602-7beb-cd08-57d3a17fe10c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5602-7beb-501e-44d703c821b6	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5602-7beb-1186-a4e4dc1d7d34	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5602-7beb-02be-a82c9821b061	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5602-7beb-af6e-96a083d47935	Job-read	Branje opravil - samo zase - branje	f
00030000-5602-7beb-35df-ee6a0764028c	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5602-7beb-e4e3-e4558b837663	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5602-7beb-a537-156fed6f879e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5602-7beb-8e0e-349f7a62981b	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5602-7beb-b8c7-ce84ffee6978	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5602-7beb-21f8-dffff92b021d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5602-7beb-ab26-1ae0403a35e3	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-7beb-63ca-a1b57ffccf34	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-7beb-5106-b1717862ec56	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-7beb-e167-e5dd3e846e73	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-7beb-154f-609ec0c5ed8d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5602-7beb-9ede-7bca4a3809ea	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5602-7beb-d2fa-e5635d003700	Datoteka-write	Datoteka - spreminjanje	f
00030000-5602-7beb-3232-b02ceb86f20b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2972 (class 0 OID 20470138)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5602-7beb-9925-f841bf03cfa1	00030000-5602-7beb-0edb-b1664ea0003a
00020000-5602-7beb-4ee0-75c10b05599b	00030000-5602-7beb-2cd3-e112ad40b0c3
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-1fc7-9658477b7764
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-cff6-d51f2bb38fe3
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-a927-a02e45967b74
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-40e1-5cad68b07259
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-3636-cbb7a4426527
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-8e32-eac2245758b5
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-079c-efd4c12fdd84
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-909f-cfbd09ee8716
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-2cd3-e112ad40b0c3
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-ee2a-c0ad86fd423e
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-b3ea-22d02608c027
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-8d80-a1aa30045c33
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-51a2-0359b61b9600
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-b763-04fcd734df54
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-a3d7-025705cde99a
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-5b34-32fdce2c4f15
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-8b2e-be2c3f73d10d
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-623a-6cd85afb09f7
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-324c-8e3b8f1d2398
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-086f-b56de3790b77
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-373b-5bdc67a391ae
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-7aa7-fac2818b1e7b
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-b72c-f958690ad26a
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-fa5f-3b9f5a937f38
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-5131-4bf1bb1ff8b9
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-8d9c-012248029fad
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-8feb-b58dba46064f
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-7b35-a02e48463fb8
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-d550-d1b6f8512e94
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-3318-783756bb38f7
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-ba52-bd8e56264c8e
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-916b-d7afa96e82fc
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-f42f-49714a965c79
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-e032-838fcbf9dc87
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-df5e-5653cf776dbf
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-a2e0-46afa54ce8a3
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-5d46-859dfb43ce3b
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-b23e-febfe7dcf802
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-c2ad-537ac760cb72
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-472a-d7f5e1f24288
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-0750-549edc0da08b
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-d44e-9c5b1e06993d
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-db2b-41d42a5d8cdb
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-148d-a34b60d2a0a7
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-87a7-fc63b08c06b2
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-3537-85f70187a003
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-3bb7-a3eddd904cd2
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-cd08-57d3a17fe10c
00020000-5602-7beb-1227-953893dfbeb7	00030000-5602-7beb-1186-a4e4dc1d7d34
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-1fc7-9658477b7764
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-3636-cbb7a4426527
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-8e32-eac2245758b5
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-2cd3-e112ad40b0c3
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-51a2-0359b61b9600
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-a3d7-025705cde99a
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-8b2e-be2c3f73d10d
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-623a-6cd85afb09f7
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-324c-8e3b8f1d2398
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-086f-b56de3790b77
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-373b-5bdc67a391ae
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-7aa7-fac2818b1e7b
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-b72c-f958690ad26a
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-5131-4bf1bb1ff8b9
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-8feb-b58dba46064f
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-7b35-a02e48463fb8
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-d550-d1b6f8512e94
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-f42f-49714a965c79
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-df5e-5653cf776dbf
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-5d46-859dfb43ce3b
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-c2ad-537ac760cb72
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-15bf-1a9a53e442dd
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-0802-909c45074bd2
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-9676-fb00cf1aa2a6
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-6f16-d6f837e49735
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-45a4-8dc3eb38e0c3
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-af98-9aadff3bd86c
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-cd08-57d3a17fe10c
00020000-5602-7beb-56f3-98dd6c1ab245	00030000-5602-7beb-1186-a4e4dc1d7d34
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-1fc7-9658477b7764
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-a927-a02e45967b74
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-3636-cbb7a4426527
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-4396-1efb2467eef2
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-c706-449af34dc4bf
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-168e-8989c2df5858
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-8e32-eac2245758b5
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-2cd3-e112ad40b0c3
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-b3ea-22d02608c027
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-51a2-0359b61b9600
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-a3d7-025705cde99a
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-8b2e-be2c3f73d10d
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-324c-8e3b8f1d2398
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-086f-b56de3790b77
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-373b-5bdc67a391ae
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-b72c-f958690ad26a
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-5131-4bf1bb1ff8b9
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-d550-d1b6f8512e94
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-ba52-bd8e56264c8e
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-f42f-49714a965c79
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-df5e-5653cf776dbf
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-5d46-859dfb43ce3b
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-c2ad-537ac760cb72
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-0750-549edc0da08b
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-148d-a34b60d2a0a7
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-3537-85f70187a003
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-cd08-57d3a17fe10c
00020000-5602-7beb-a110-5d3ece18beb2	00030000-5602-7beb-1186-a4e4dc1d7d34
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-1fc7-9658477b7764
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-cff6-d51f2bb38fe3
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-40e1-5cad68b07259
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-3636-cbb7a4426527
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-8e32-eac2245758b5
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-2cd3-e112ad40b0c3
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-51a2-0359b61b9600
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-a3d7-025705cde99a
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-324c-8e3b8f1d2398
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-086f-b56de3790b77
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-b72c-f958690ad26a
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-5131-4bf1bb1ff8b9
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-d550-d1b6f8512e94
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-f42f-49714a965c79
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-df5e-5653cf776dbf
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-5d46-859dfb43ce3b
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-c2ad-537ac760cb72
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-0750-549edc0da08b
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-cd08-57d3a17fe10c
00020000-5602-7beb-3afb-9043ef79c830	00030000-5602-7beb-1186-a4e4dc1d7d34
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-1fc7-9658477b7764
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-3636-cbb7a4426527
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-8e32-eac2245758b5
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-2cd3-e112ad40b0c3
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-51a2-0359b61b9600
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-a3d7-025705cde99a
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-324c-8e3b8f1d2398
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-086f-b56de3790b77
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-b72c-f958690ad26a
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-5131-4bf1bb1ff8b9
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-d550-d1b6f8512e94
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-f42f-49714a965c79
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-df5e-5653cf776dbf
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-5d46-859dfb43ce3b
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-c2ad-537ac760cb72
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-5103-e46f18455d5e
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-792d-0a87b89026f3
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-0750-549edc0da08b
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-cd08-57d3a17fe10c
00020000-5602-7beb-fa0a-17618d03b500	00030000-5602-7beb-1186-a4e4dc1d7d34
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-3507-ac3800e2fe43
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0edb-b1664ea0003a
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-792d-0a87b89026f3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-079c-efd4c12fdd84
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-e265-6245d7bee20d
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b2cf-261c2f3ed229
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-42b6-090b616add69
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-1fc7-9658477b7764
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-cff6-d51f2bb38fe3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-a927-a02e45967b74
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-40e1-5cad68b07259
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-3636-cbb7a4426527
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-4396-1efb2467eef2
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-c706-449af34dc4bf
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-ccce-4395e85565e5
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-168e-8989c2df5858
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-5584-724fceb72f8c
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8e32-eac2245758b5
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-909f-cfbd09ee8716
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-2cd3-e112ad40b0c3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-ee2a-c0ad86fd423e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-6bcf-b367edd01cc5
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-78ec-393d4110ffce
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-4497-2bfbe3f418b5
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-5cd1-cc71d5c65599
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b3ea-22d02608c027
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8d80-a1aa30045c33
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-51a2-0359b61b9600
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b763-04fcd734df54
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-a3d7-025705cde99a
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-5b34-32fdce2c4f15
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8b2e-be2c3f73d10d
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-623a-6cd85afb09f7
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-e0ce-7ee3a358ff2c
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-020f-009a82884e40
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-ce3c-7da16c2c97d4
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b2fd-d00225df2356
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-324c-8e3b8f1d2398
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-6d9e-ec9d2d481a9c
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-086f-b56de3790b77
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-2623-e665a7336bbe
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-373b-5bdc67a391ae
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-7aa7-fac2818b1e7b
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-556b-46023d1071c9
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-f139-72af12a6814e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-f2a3-0561c2306544
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-bf28-248f51cec0b1
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-6610-860e73c9e05e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-cc8d-722449abdc87
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b72c-f958690ad26a
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-fa5f-3b9f5a937f38
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-5131-4bf1bb1ff8b9
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8d9c-012248029fad
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-04be-34ca1d24fa46
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-4c14-141dae1d9a0d
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-bb6f-fe1b18a52491
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-7e5c-4bd77b14d70b
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8feb-b58dba46064f
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-7b35-a02e48463fb8
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-d550-d1b6f8512e94
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-3318-783756bb38f7
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-2e98-8240e7bf26d7
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0b1e-9be46f5898d3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0600-3f76efa65d04
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8dcc-a67eebb4c079
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-ba52-bd8e56264c8e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-916b-d7afa96e82fc
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-3bd2-4633193e91a1
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b420-21aea587352e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-9a35-b419b5cabd0e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-db4b-efa4bd18d451
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-cb47-7c0ca689a3f3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-156e-451fa532d9ed
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-4e5f-168d7dbec455
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0daa-c8f1c5450547
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-e8c8-cd443d1bdd40
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-15e8-fa122e70c3c5
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-74ae-513c9745da9f
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-ce82-92711a751820
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-d07b-d99478e2e091
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8b55-f6c05f8c638e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-5fba-5b4900258f28
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-a859-844e9cc17a24
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-6b0c-2f24233b05c8
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-16d9-bc1e93109245
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-7f4b-0537be403dbe
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-154f-1123c04115aa
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-f42f-49714a965c79
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-e032-838fcbf9dc87
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0de4-61ed15771dc9
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-9c90-9c63b0a86d75
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-4694-890a012aba23
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-66c8-5546bdbcaaa7
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-df5e-5653cf776dbf
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-a2e0-46afa54ce8a3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-5d46-859dfb43ce3b
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b23e-febfe7dcf802
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-e941-1469f5e55b37
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0824-68b51cfc51e9
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-d275-ecb005b20225
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-6920-297d7e3bff01
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0511-f92dc027ff77
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0bc4-dd83249906e7
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-fa14-da0ae2c564b1
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-e65c-bd74b68034c3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-c2ad-537ac760cb72
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-472a-d7f5e1f24288
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8433-b0128b0e9891
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0e83-91d2a0a81e61
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-548e-b10a9d60e823
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-8249-972a692626b2
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-af9c-3b4c32b98e5f
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-2aa4-e2133f1d2918
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-27ab-e79d1c4ce9c6
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-d0f9-435ec4f1526f
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-15bf-1a9a53e442dd
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0802-909c45074bd2
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-5103-e46f18455d5e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-4036-2fd85c8b96cb
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-0750-549edc0da08b
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-d635-b680d88c726a
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-b14a-98f486224570
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-7ac9-dbe41169251a
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-9676-fb00cf1aa2a6
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-6f16-d6f837e49735
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-d44e-9c5b1e06993d
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-db2b-41d42a5d8cdb
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-148d-a34b60d2a0a7
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-87a7-fc63b08c06b2
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-2b51-3972e2022af7
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-ffc1-88b15c41c51e
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-4bfa-68a741b54189
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-6085-5b2f462b683a
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-45a4-8dc3eb38e0c3
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-af98-9aadff3bd86c
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-3537-85f70187a003
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-3bb7-a3eddd904cd2
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-cd08-57d3a17fe10c
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-501e-44d703c821b6
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-1186-a4e4dc1d7d34
00020000-5602-7bed-ca27-1eb1c16540c5	00030000-5602-7beb-02be-a82c9821b061
\.


--
-- TOC entry 3001 (class 0 OID 20470463)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 20470497)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20470632)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5602-7bed-c475-3ee6047d3244	00090000-5602-7bed-5781-e4ded51323ca	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-5602-7bed-432f-55d05a09ab64	00090000-5602-7bed-11a0-7851b4e60bb4	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-5602-7bed-7f9a-725ac3349289	00090000-5602-7bed-71d0-98bd9ddfe8f7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-5602-7bed-5485-03b0e66bf28c	00090000-5602-7bed-fb93-3d21250bfd80	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2977 (class 0 OID 20470198)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5602-7bed-9e22-6f9d1138d669	00040000-5602-7beb-8d6e-fa0775f70b8d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bed-465f-88a8e2c8bb4b	00040000-5602-7beb-8d6e-fa0775f70b8d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5602-7bed-9800-3441b2093eb8	00040000-5602-7beb-8d6e-fa0775f70b8d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bed-71ea-a3f5e7ff3bf5	00040000-5602-7beb-8d6e-fa0775f70b8d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bed-ba91-4fef0ff6a1aa	00040000-5602-7beb-8d6e-fa0775f70b8d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bed-9370-71cbb37d6a20	00040000-5602-7beb-d31f-b5c5d7e54037	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bed-b401-f4a06da52c78	00040000-5602-7beb-a0f6-cf7c1ac8be52	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bed-05ad-b76c7f3206e9	00040000-5602-7beb-2678-86dec419529d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bed-4956-c0eac1462f89	00040000-5602-7beb-8314-9f6a6c0d6290	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-7bee-b80e-a0e49ad78021	00040000-5602-7beb-8d6e-fa0775f70b8d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2979 (class 0 OID 20470232)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5602-7bea-8b73-6dcc73dbeb25	8341	Adlešiči
00050000-5602-7bea-44b3-5df68fde519a	5270	Ajdovščina
00050000-5602-7bea-636b-2ceabd971d35	6280	Ankaran/Ancarano
00050000-5602-7bea-f1a0-5dc97ad9f17a	9253	Apače
00050000-5602-7bea-d183-bc69eced70cb	8253	Artiče
00050000-5602-7bea-cf18-be49bcc10255	4275	Begunje na Gorenjskem
00050000-5602-7bea-6850-5e385018db3f	1382	Begunje pri Cerknici
00050000-5602-7bea-5cf7-6e11afdf85d1	9231	Beltinci
00050000-5602-7bea-e826-b607e1bdba9c	2234	Benedikt
00050000-5602-7bea-93c9-a075ce5f38dd	2345	Bistrica ob Dravi
00050000-5602-7bea-5f7f-fdfe7cfe69d4	3256	Bistrica ob Sotli
00050000-5602-7bea-770e-b5cb8ee76cef	8259	Bizeljsko
00050000-5602-7bea-aca5-51d08c0157e0	1223	Blagovica
00050000-5602-7bea-9137-1d0cd06ddc62	8283	Blanca
00050000-5602-7bea-9174-e012e0ddd9a2	4260	Bled
00050000-5602-7bea-7552-87e14d248d58	4273	Blejska Dobrava
00050000-5602-7bea-7a6f-193e4e5343d3	9265	Bodonci
00050000-5602-7bea-ea78-bac8c6741ee3	9222	Bogojina
00050000-5602-7bea-e498-f945c47cf06c	4263	Bohinjska Bela
00050000-5602-7bea-b66f-3cc6b108290e	4264	Bohinjska Bistrica
00050000-5602-7bea-4f29-f98437213391	4265	Bohinjsko jezero
00050000-5602-7bea-e051-0375a9fc269a	1353	Borovnica
00050000-5602-7bea-cfed-0f9aaccc83d4	8294	Boštanj
00050000-5602-7bea-ab9a-33fd84b360e3	5230	Bovec
00050000-5602-7bea-1f23-64ff97083d09	5295	Branik
00050000-5602-7bea-4637-8161228d85cc	3314	Braslovče
00050000-5602-7bea-227b-71ffe3c835d6	5223	Breginj
00050000-5602-7bea-7d16-a6630bfe69e0	8280	Brestanica
00050000-5602-7bea-c597-7bfd95cc19bd	2354	Bresternica
00050000-5602-7bea-1c16-3ec29b41c2c2	4243	Brezje
00050000-5602-7bea-6232-add0a568baf5	1351	Brezovica pri Ljubljani
00050000-5602-7bea-22b7-982f621e725a	8250	Brežice
00050000-5602-7bea-4cb3-2ee5b178b6f1	4210	Brnik - Aerodrom
00050000-5602-7bea-1162-4599335b3174	8321	Brusnice
00050000-5602-7bea-2743-4948d1389fd0	3255	Buče
00050000-5602-7bea-a9c4-91225ec2ef88	8276	Bučka 
00050000-5602-7bea-4141-bf9251aeeec8	9261	Cankova
00050000-5602-7bea-d860-9ee96f87037e	3000	Celje 
00050000-5602-7bea-7564-134b36b83fe4	3001	Celje - poštni predali
00050000-5602-7bea-3e2c-bc270ca168d9	4207	Cerklje na Gorenjskem
00050000-5602-7bea-1360-93faf756b780	8263	Cerklje ob Krki
00050000-5602-7bea-2d59-b5857d4d090d	1380	Cerknica
00050000-5602-7bea-798d-229fbd6a0bfd	5282	Cerkno
00050000-5602-7bea-68a6-3d32dc5fc75c	2236	Cerkvenjak
00050000-5602-7bea-72bb-17297b12f27a	2215	Ceršak
00050000-5602-7bea-f23c-3b252251283e	2326	Cirkovce
00050000-5602-7bea-b45c-9b1140e56e80	2282	Cirkulane
00050000-5602-7bea-ff49-762f1b3dd068	5273	Col
00050000-5602-7bea-7f59-c3badb60dc07	8251	Čatež ob Savi
00050000-5602-7bea-6923-63fdf720cbc0	1413	Čemšenik
00050000-5602-7bea-19b2-cd192b8654ae	5253	Čepovan
00050000-5602-7bea-00cc-9fe8f31a5f9c	9232	Črenšovci
00050000-5602-7bea-f5c1-b065688114b5	2393	Črna na Koroškem
00050000-5602-7bea-b627-af5c6cd1d517	6275	Črni Kal
00050000-5602-7bea-7874-d8d5db2649c9	5274	Črni Vrh nad Idrijo
00050000-5602-7bea-10c5-fa7fc7985334	5262	Črniče
00050000-5602-7bea-4375-37c78561c78a	8340	Črnomelj
00050000-5602-7bea-15d8-cac4c0deccbb	6271	Dekani
00050000-5602-7bea-11d0-d19b247f2e87	5210	Deskle
00050000-5602-7bea-83d4-0739f936aab7	2253	Destrnik
00050000-5602-7bea-185c-75ca3db801b3	6215	Divača
00050000-5602-7bea-7b23-7468d48c9742	1233	Dob
00050000-5602-7bea-3676-119e0ebbd2f4	3224	Dobje pri Planini
00050000-5602-7bea-f213-2fac70e7999c	8257	Dobova
00050000-5602-7bea-87a7-02b60ec2521a	1423	Dobovec
00050000-5602-7bea-da3a-402a17067511	5263	Dobravlje
00050000-5602-7bea-4d25-36aa2eac3619	3204	Dobrna
00050000-5602-7bea-d1a1-e0b1f3f69dfb	8211	Dobrnič
00050000-5602-7bea-3530-720052af07cd	1356	Dobrova
00050000-5602-7bea-0c2f-ee09a8668499	9223	Dobrovnik/Dobronak 
00050000-5602-7bea-9ef4-ad39495dad05	5212	Dobrovo v Brdih
00050000-5602-7bea-f4c7-8ddf3d5a1b52	1431	Dol pri Hrastniku
00050000-5602-7bea-08b4-d09847dda586	1262	Dol pri Ljubljani
00050000-5602-7bea-97df-7aaf6356b7d6	1273	Dole pri Litiji
00050000-5602-7bea-4fea-654bd1decd38	1331	Dolenja vas
00050000-5602-7bea-fb2b-202535697b09	8350	Dolenjske Toplice
00050000-5602-7bea-9d83-d3b14f861097	1230	Domžale
00050000-5602-7bea-9442-d917d2904340	2252	Dornava
00050000-5602-7bea-ef0f-eb822b419892	5294	Dornberk
00050000-5602-7bea-792a-b71506d4cc3c	1319	Draga
00050000-5602-7bea-84fe-a9e24651080a	8343	Dragatuš
00050000-5602-7bea-ee56-fff9502be03d	3222	Dramlje
00050000-5602-7bea-9d84-0399afa6b38b	2370	Dravograd
00050000-5602-7bea-1107-e0d069db2322	4203	Duplje
00050000-5602-7bea-762c-b5f93832f985	6221	Dutovlje
00050000-5602-7bea-6977-1900019c10d5	8361	Dvor
00050000-5602-7bea-139d-d1a667823548	2343	Fala
00050000-5602-7bea-ff6a-4d2226c5b219	9208	Fokovci
00050000-5602-7bea-ad67-8a371a0b55aa	2313	Fram
00050000-5602-7bea-0503-8a03fb47519d	3213	Frankolovo
00050000-5602-7bea-6425-f885135d55d2	1274	Gabrovka
00050000-5602-7bea-6f8c-c565766f3c8d	8254	Globoko
00050000-5602-7bea-e9a3-a21a381f22f4	5275	Godovič
00050000-5602-7bea-f58f-9f2fdeefb28c	4204	Golnik
00050000-5602-7bea-bb9c-367a37008c70	3303	Gomilsko
00050000-5602-7bea-4358-62aecec6a4c4	4224	Gorenja vas
00050000-5602-7bea-1c83-767661768c26	3263	Gorica pri Slivnici
00050000-5602-7bea-1d7d-3a50fa72d700	2272	Gorišnica
00050000-5602-7bea-0649-2208f96d0fc7	9250	Gornja Radgona
00050000-5602-7bea-7447-0528d1bc699c	3342	Gornji Grad
00050000-5602-7bea-ebd4-646ca40da380	4282	Gozd Martuljek
00050000-5602-7bea-eae0-6f08d51ea3d7	6272	Gračišče
00050000-5602-7bea-68eb-620699d7bf4d	9264	Grad
00050000-5602-7bea-0d99-26d693c7766e	8332	Gradac
00050000-5602-7bea-d280-46791aa7ee78	1384	Grahovo
00050000-5602-7bea-f604-c2a8226769fb	5242	Grahovo ob Bači
00050000-5602-7bea-5f8d-a4274953242a	5251	Grgar
00050000-5602-7bea-5e00-051a32d07fde	3302	Griže
00050000-5602-7bea-88ec-5b24258e5c09	3231	Grobelno
00050000-5602-7bea-08cd-c23c29cf89d3	1290	Grosuplje
00050000-5602-7bea-93b4-91720a0bada8	2288	Hajdina
00050000-5602-7bea-a041-30db3109c13c	8362	Hinje
00050000-5602-7bea-bc88-1e5adb90b15f	2311	Hoče
00050000-5602-7bea-484f-60991b61412b	9205	Hodoš/Hodos
00050000-5602-7bea-020f-312d8893406e	1354	Horjul
00050000-5602-7bea-f257-f0391cc12b8e	1372	Hotedršica
00050000-5602-7bea-cf14-260d2145ee40	1430	Hrastnik
00050000-5602-7bea-22d5-2597af415902	6225	Hruševje
00050000-5602-7bea-3e65-5fada3334733	4276	Hrušica
00050000-5602-7bea-8318-267cbe774c78	5280	Idrija
00050000-5602-7bea-ab95-2a658d5d3e2e	1292	Ig
00050000-5602-7bea-e557-1c1e07ac83d8	6250	Ilirska Bistrica
00050000-5602-7bea-ee7d-58c7e45b3fac	6251	Ilirska Bistrica-Trnovo
00050000-5602-7bea-2b49-3b70ed5e217a	1295	Ivančna Gorica
00050000-5602-7bea-502e-66b8283cc405	2259	Ivanjkovci
00050000-5602-7bea-533b-6d172127a653	1411	Izlake
00050000-5602-7bea-0a87-e7719e892294	6310	Izola/Isola
00050000-5602-7bea-5730-1c7e41b3fa8f	2222	Jakobski Dol
00050000-5602-7bea-2f06-ae992224aef2	2221	Jarenina
00050000-5602-7bea-0796-7f1a41a50123	6254	Jelšane
00050000-5602-7bea-e0ef-c19fbf78cc30	4270	Jesenice
00050000-5602-7bea-0876-5167280719d1	8261	Jesenice na Dolenjskem
00050000-5602-7bea-21d8-2a77c8d1b2dc	3273	Jurklošter
00050000-5602-7bea-a2e3-ede5627dd699	2223	Jurovski Dol
00050000-5602-7bea-98d8-bb9b424b8991	2256	Juršinci
00050000-5602-7bea-9c58-3eba09db7de1	5214	Kal nad Kanalom
00050000-5602-7bea-ee27-5753786359af	3233	Kalobje
00050000-5602-7bea-7bd7-e24e45f4b3a1	4246	Kamna Gorica
00050000-5602-7bea-51e2-94090af36949	2351	Kamnica
00050000-5602-7bea-9453-ff49ca0d9583	1241	Kamnik
00050000-5602-7bea-5f35-48f7ae0db1a4	5213	Kanal
00050000-5602-7bea-ddcc-dc49462ffc6c	8258	Kapele
00050000-5602-7bea-f401-ebd43fe3dc8f	2362	Kapla
00050000-5602-7bea-5aa3-455a813bdfa0	2325	Kidričevo
00050000-5602-7bea-4f6b-6e7ad11dba29	1412	Kisovec
00050000-5602-7bea-831d-e36805f98eaf	6253	Knežak
00050000-5602-7bea-128d-b56926cfa2ae	5222	Kobarid
00050000-5602-7bea-d4a8-81f1ed6ae5f1	9227	Kobilje
00050000-5602-7bea-f85d-96fd14a3f087	1330	Kočevje
00050000-5602-7bea-3981-627f9253ce6f	1338	Kočevska Reka
00050000-5602-7bea-4dcf-2720ca45156b	2276	Kog
00050000-5602-7bea-76bf-770a61bec10b	5211	Kojsko
00050000-5602-7bea-eb41-e3bb2e2f22ee	6223	Komen
00050000-5602-7bea-18f6-522f6d00cb3c	1218	Komenda
00050000-5602-7bea-96b1-35b249a2d7dc	6000	Koper/Capodistria 
00050000-5602-7bea-9611-12a77f3f3482	6001	Koper/Capodistria - poštni predali
00050000-5602-7bea-ca97-bbdefb14d56d	8282	Koprivnica
00050000-5602-7bea-d5d0-49c1b84889f0	5296	Kostanjevica na Krasu
00050000-5602-7bea-939b-bbaf4852dfcd	8311	Kostanjevica na Krki
00050000-5602-7bea-8441-f9a3ac5c861b	1336	Kostel
00050000-5602-7bea-d1c3-6449684b6330	6256	Košana
00050000-5602-7bea-6cd7-a38cc94b48f3	2394	Kotlje
00050000-5602-7bea-c990-d11f6fccc320	6240	Kozina
00050000-5602-7bea-29ff-47247ea37723	3260	Kozje
00050000-5602-7bea-c25e-c2a3feade643	4000	Kranj 
00050000-5602-7bea-164d-3d12bc6a6741	4001	Kranj - poštni predali
00050000-5602-7bea-cb0f-b05bf764e3a0	4280	Kranjska Gora
00050000-5602-7bea-a75a-f2a77fc63b43	1281	Kresnice
00050000-5602-7bea-d000-22bd03485431	4294	Križe
00050000-5602-7bea-ad0d-723637e0198d	9206	Križevci
00050000-5602-7bea-94d0-b11b91e28f10	9242	Križevci pri Ljutomeru
00050000-5602-7bea-590a-b07f5fa31f53	1301	Krka
00050000-5602-7bea-2f58-8c3a2acf70d7	8296	Krmelj
00050000-5602-7bea-6d1f-c7bbf1190296	4245	Kropa
00050000-5602-7bea-020b-5d3ecfff7956	8262	Krška vas
00050000-5602-7bea-68de-197b3cac3c5f	8270	Krško
00050000-5602-7bea-58fd-a11a3eb1a9a6	9263	Kuzma
00050000-5602-7bea-4497-a6b5c940e9e7	2318	Laporje
00050000-5602-7bea-9786-6662f7fbf56b	3270	Laško
00050000-5602-7bea-36b5-da75eb64f8a5	1219	Laze v Tuhinju
00050000-5602-7bea-3e00-fe82ecee5449	2230	Lenart v Slovenskih goricah
00050000-5602-7bea-fbac-6e9cf3384c6e	9220	Lendava/Lendva
00050000-5602-7bea-f22e-b08fade1ed24	4248	Lesce
00050000-5602-7bea-951b-3180310f16fe	3261	Lesično
00050000-5602-7bea-d706-68a45ce09bbe	8273	Leskovec pri Krškem
00050000-5602-7bea-a349-df8d54b90dc4	2372	Libeliče
00050000-5602-7bea-1169-11abf2ae2800	2341	Limbuš
00050000-5602-7bea-7057-1d0bc50f1c06	1270	Litija
00050000-5602-7bea-bb01-aabce37b36b8	3202	Ljubečna
00050000-5602-7bea-ecc4-ee61fd938fbf	1000	Ljubljana 
00050000-5602-7bea-e495-0db2c3ece6ab	1001	Ljubljana - poštni predali
00050000-5602-7bea-e8d4-d6cc3ac3e8ef	1231	Ljubljana - Črnuče
00050000-5602-7bea-b780-f9f039c3b632	1261	Ljubljana - Dobrunje
00050000-5602-7bea-469a-25b721dbf075	1260	Ljubljana - Polje
00050000-5602-7bea-bbd1-020ecde8cf16	1210	Ljubljana - Šentvid
00050000-5602-7bea-fce3-16271163d102	1211	Ljubljana - Šmartno
00050000-5602-7bea-09b1-2c8485d2e0c9	3333	Ljubno ob Savinji
00050000-5602-7bea-ca75-97df713a62cb	9240	Ljutomer
00050000-5602-7bea-d060-371d6cf4fa31	3215	Loče
00050000-5602-7bea-188b-907cce5cee23	5231	Log pod Mangartom
00050000-5602-7bea-afc8-b54e08891ed7	1358	Log pri Brezovici
00050000-5602-7bea-e763-6c698393d211	1370	Logatec
00050000-5602-7bea-2405-7923e566cfc2	1371	Logatec
00050000-5602-7bea-6795-948ead9526df	1434	Loka pri Zidanem Mostu
00050000-5602-7bea-134d-20279f7f795a	3223	Loka pri Žusmu
00050000-5602-7bea-d7c2-3ff4411bfe93	6219	Lokev
00050000-5602-7bea-02cd-b04525a0f828	1318	Loški Potok
00050000-5602-7bea-e014-aa2dda65d7f6	2324	Lovrenc na Dravskem polju
00050000-5602-7bea-080e-eb5483cbac5b	2344	Lovrenc na Pohorju
00050000-5602-7bea-06c8-16e31121a234	3334	Luče
00050000-5602-7bea-5402-70b89df24eeb	1225	Lukovica
00050000-5602-7bea-232b-b7c7eac95a97	9202	Mačkovci
00050000-5602-7bea-354d-f5608bcbab7a	2322	Majšperk
00050000-5602-7bea-3c69-73501fc572ba	2321	Makole
00050000-5602-7bea-66fa-7de643578980	9243	Mala Nedelja
00050000-5602-7bea-27cb-b39ae9fbcd94	2229	Malečnik
00050000-5602-7bea-0453-40883f7de82c	6273	Marezige
00050000-5602-7bea-117b-faa2f2f8c104	2000	Maribor 
00050000-5602-7bea-629f-f2962052649a	2001	Maribor - poštni predali
00050000-5602-7bea-d46f-fa8f3db7a1a8	2206	Marjeta na Dravskem polju
00050000-5602-7bea-e25d-5c681333dc19	2281	Markovci
00050000-5602-7bea-b2e5-2cbc70b14358	9221	Martjanci
00050000-5602-7bea-5963-00619ddeed8a	6242	Materija
00050000-5602-7bea-dab7-cf8b79edd324	4211	Mavčiče
00050000-5602-7bea-4333-a8b1b32806ea	1215	Medvode
00050000-5602-7bea-402d-6ab5093f28b0	1234	Mengeš
00050000-5602-7bea-54c0-ce4aaa536686	8330	Metlika
00050000-5602-7bea-8719-2377dc6ba433	2392	Mežica
00050000-5602-7bea-52aa-b5dfcd236a05	2204	Miklavž na Dravskem polju
00050000-5602-7bea-6b0a-0b7724cd00a8	2275	Miklavž pri Ormožu
00050000-5602-7bea-3f36-abd364c8236c	5291	Miren
00050000-5602-7bea-7284-836b1785bdc0	8233	Mirna
00050000-5602-7bea-2a36-6d4aee711c57	8216	Mirna Peč
00050000-5602-7bea-25f2-c193cff6aa3c	2382	Mislinja
00050000-5602-7bea-83ac-368d9222b257	4281	Mojstrana
00050000-5602-7bea-089c-c07cd546815d	8230	Mokronog
00050000-5602-7bea-1e63-7fbb9c56a220	1251	Moravče
00050000-5602-7bea-c7df-5ddcf4185f55	9226	Moravske Toplice
00050000-5602-7bea-0383-f93db01b6872	5216	Most na Soči
00050000-5602-7bea-dab8-25f22c50fac0	1221	Motnik
00050000-5602-7bea-eaee-b8d1def04a77	3330	Mozirje
00050000-5602-7bea-711d-5f5f6140a822	9000	Murska Sobota 
00050000-5602-7bea-e65d-1eef1f2893ea	9001	Murska Sobota - poštni predali
00050000-5602-7bea-817f-ae686d6e0501	2366	Muta
00050000-5602-7bea-fcae-8c0b7c098d94	4202	Naklo
00050000-5602-7bea-8d5a-7cb39a08761d	3331	Nazarje
00050000-5602-7bea-5b0e-6412b317f0d7	1357	Notranje Gorice
00050000-5602-7bea-e7d8-295aa535b5f7	3203	Nova Cerkev
00050000-5602-7bea-a167-e45c0f7654fc	5000	Nova Gorica 
00050000-5602-7bea-3610-ec47e06ed978	5001	Nova Gorica - poštni predali
00050000-5602-7bea-5c74-a6dc98b7c5b4	1385	Nova vas
00050000-5602-7bea-d57c-ce8ad561cb0b	8000	Novo mesto
00050000-5602-7bea-2836-9e93b7a69bd8	8001	Novo mesto - poštni predali
00050000-5602-7bea-1f3a-85497b4380aa	6243	Obrov
00050000-5602-7bea-0bad-8604648a1033	9233	Odranci
00050000-5602-7bea-19cb-32e8d5414964	2317	Oplotnica
00050000-5602-7bea-5289-219e522e9678	2312	Orehova vas
00050000-5602-7bea-1c36-713a8714ad66	2270	Ormož
00050000-5602-7bea-d5dc-973386d7ba61	1316	Ortnek
00050000-5602-7bea-26a1-5a89a8e74303	1337	Osilnica
00050000-5602-7bea-959f-f77f6f78cded	8222	Otočec
00050000-5602-7bea-7eec-5d2c53c3d1d3	2361	Ožbalt
00050000-5602-7bea-44f3-efb307115571	2231	Pernica
00050000-5602-7bea-a695-05cea99ecfe6	2211	Pesnica pri Mariboru
00050000-5602-7bea-635b-6e775da4e56c	9203	Petrovci
00050000-5602-7bea-6dff-672d81e18880	3301	Petrovče
00050000-5602-7bea-3772-b71aaad368f2	6330	Piran/Pirano
00050000-5602-7bea-849c-29c6a227f86e	8255	Pišece
00050000-5602-7bea-dca3-a7f09a3e442e	6257	Pivka
00050000-5602-7bea-b40b-088850f64649	6232	Planina
00050000-5602-7bea-ca82-4fb3b3b17715	3225	Planina pri Sevnici
00050000-5602-7bea-51af-6cfec586e84c	6276	Pobegi
00050000-5602-7bea-c2e4-f8554514523e	8312	Podbočje
00050000-5602-7bea-ca48-503d4deee5f4	5243	Podbrdo
00050000-5602-7bea-a4ae-46c65bd881db	3254	Podčetrtek
00050000-5602-7bea-9446-db561ccc80e1	2273	Podgorci
00050000-5602-7bea-926a-5203f8051fa7	6216	Podgorje
00050000-5602-7bea-4982-5446db2316f8	2381	Podgorje pri Slovenj Gradcu
00050000-5602-7bea-670f-13a72648bb60	6244	Podgrad
00050000-5602-7bea-5b6b-cbe30e02431a	1414	Podkum
00050000-5602-7bea-50ac-77cdcbc45dce	2286	Podlehnik
00050000-5602-7bea-f246-80e12ba03690	5272	Podnanos
00050000-5602-7bea-ce45-c83c60cc44cf	4244	Podnart
00050000-5602-7bea-4f4e-40cc56a04fc8	3241	Podplat
00050000-5602-7bea-2479-7280c61df689	3257	Podsreda
00050000-5602-7bea-a728-88f7b97a484c	2363	Podvelka
00050000-5602-7bea-f97f-3ad38e876b3f	2208	Pohorje
00050000-5602-7bea-124a-ce024c148714	2257	Polenšak
00050000-5602-7bea-44d9-a3b9dfde056c	1355	Polhov Gradec
00050000-5602-7bea-e1fe-de84fcdd466d	4223	Poljane nad Škofjo Loko
00050000-5602-7bea-1f6e-7b852f7dac33	2319	Poljčane
00050000-5602-7bea-52f1-de40a31e375d	1272	Polšnik
00050000-5602-7bea-9926-4f3acf498850	3313	Polzela
00050000-5602-7bea-0888-e608ccd693e7	3232	Ponikva
00050000-5602-7bea-6090-6a9e561bf2dd	6320	Portorož/Portorose
00050000-5602-7bea-94b1-b0cc1b6d338a	6230	Postojna
00050000-5602-7bea-c57d-c935f1d853af	2331	Pragersko
00050000-5602-7bea-1ed5-820f3f98ebad	3312	Prebold
00050000-5602-7bea-c0d4-1398e63d663b	4205	Preddvor
00050000-5602-7bea-f608-d08fb30266e3	6255	Prem
00050000-5602-7bea-5e60-e89026cd3e69	1352	Preserje
00050000-5602-7bea-ad56-31d60a0b0560	6258	Prestranek
00050000-5602-7bea-ec13-fabd114480ad	2391	Prevalje
00050000-5602-7bea-1c9e-9c2306d0cae6	3262	Prevorje
00050000-5602-7bea-649e-c348db0f4129	1276	Primskovo 
00050000-5602-7bea-33c4-3c3a124448ab	3253	Pristava pri Mestinju
00050000-5602-7bea-261e-2981a3e89bcf	9207	Prosenjakovci/Partosfalva
00050000-5602-7bea-eda6-fb8f19706600	5297	Prvačina
00050000-5602-7bea-2aed-b314ee1f59ad	2250	Ptuj
00050000-5602-7bea-3272-59e668bdc85c	2323	Ptujska Gora
00050000-5602-7bea-a568-c3fd63c83e1c	9201	Puconci
00050000-5602-7bea-6d49-af7343cf2004	2327	Rače
00050000-5602-7bea-4b23-747aebc32886	1433	Radeče
00050000-5602-7bea-1f93-09ed28b93903	9252	Radenci
00050000-5602-7bea-45a8-e8d1ea0963f0	2360	Radlje ob Dravi
00050000-5602-7bea-478e-39ba806366e6	1235	Radomlje
00050000-5602-7bea-fe6a-893e41dcf599	4240	Radovljica
00050000-5602-7bea-92fe-f889ea8eaa14	8274	Raka
00050000-5602-7bea-e66f-09d1712fe4f4	1381	Rakek
00050000-5602-7bea-aa11-1183d88568ec	4283	Rateče - Planica
00050000-5602-7bea-9231-abd3ce200a57	2390	Ravne na Koroškem
00050000-5602-7bea-01f5-cc9129e339c4	9246	Razkrižje
00050000-5602-7bea-9e40-2f6e1b8b1297	3332	Rečica ob Savinji
00050000-5602-7bea-4589-fb1ecd80b218	5292	Renče
00050000-5602-7bea-c1c5-7c2c77ad4e7c	1310	Ribnica
00050000-5602-7bea-fc6a-16e093007da6	2364	Ribnica na Pohorju
00050000-5602-7bea-2ed6-d1678a56696d	3272	Rimske Toplice
00050000-5602-7bea-9b00-f1bcd0478ee2	1314	Rob
00050000-5602-7bea-3294-21b7ca8474a0	5215	Ročinj
00050000-5602-7bea-bdf0-7245f42a5b6f	3250	Rogaška Slatina
00050000-5602-7bea-c4a1-8043191ad1ee	9262	Rogašovci
00050000-5602-7bea-9b97-2dad9f29dcb8	3252	Rogatec
00050000-5602-7bea-b668-6ab1703ec450	1373	Rovte
00050000-5602-7bea-c2fb-503ec2b96099	2342	Ruše
00050000-5602-7bea-e83d-46810808a352	1282	Sava
00050000-5602-7bea-4883-076c7f8afac3	6333	Sečovlje/Sicciole
00050000-5602-7bea-a685-5a79a46dbe6f	4227	Selca
00050000-5602-7bea-da70-883bddd47981	2352	Selnica ob Dravi
00050000-5602-7bea-1ae8-df0d61359731	8333	Semič
00050000-5602-7bea-94a9-eaaf76a22fbd	8281	Senovo
00050000-5602-7bea-e1ce-38b27e2704c5	6224	Senožeče
00050000-5602-7bea-86ff-b2528c0842c5	8290	Sevnica
00050000-5602-7bea-28f4-f7e69e5c98fe	6210	Sežana
00050000-5602-7bea-db0b-8ec54e1193f1	2214	Sladki Vrh
00050000-5602-7bea-61d5-5657c4c47ddf	5283	Slap ob Idrijci
00050000-5602-7bea-6a40-22c20c6b56ba	2380	Slovenj Gradec
00050000-5602-7bea-6462-0e7369fe2617	2310	Slovenska Bistrica
00050000-5602-7bea-e3a6-f2de5897596c	3210	Slovenske Konjice
00050000-5602-7bea-bd19-00c4d3e41ea7	1216	Smlednik
00050000-5602-7bea-83b9-ff28f9997509	5232	Soča
00050000-5602-7bea-b8e4-dfa328df0a4e	1317	Sodražica
00050000-5602-7bea-8880-e45a6f1ae4ec	3335	Solčava
00050000-5602-7bea-d994-e15cb7755eb5	5250	Solkan
00050000-5602-7bea-3633-dc206a7f3b89	4229	Sorica
00050000-5602-7bea-3497-fb3e53025f6e	4225	Sovodenj
00050000-5602-7bea-eeb6-ac00f1443236	5281	Spodnja Idrija
00050000-5602-7bea-a8be-dc0573ce2cd9	2241	Spodnji Duplek
00050000-5602-7bea-82e6-f6bb35aec9a8	9245	Spodnji Ivanjci
00050000-5602-7bea-f61f-d4fad0d281b6	2277	Središče ob Dravi
00050000-5602-7bea-0595-81fdbabe2e44	4267	Srednja vas v Bohinju
00050000-5602-7bea-c231-64fcd2425373	8256	Sromlje 
00050000-5602-7bea-1124-4a0bf38f1e2d	5224	Srpenica
00050000-5602-7bea-5e22-cb06d254e531	1242	Stahovica
00050000-5602-7bea-51b0-82aed9eedf5b	1332	Stara Cerkev
00050000-5602-7bea-5c83-7c26cada4eb5	8342	Stari trg ob Kolpi
00050000-5602-7bea-efe9-aba0fca527ed	1386	Stari trg pri Ložu
00050000-5602-7bea-d7cc-0fb133aa0a85	2205	Starše
00050000-5602-7bea-0077-9b3f8eef0f61	2289	Stoperce
00050000-5602-7bea-ec3b-0c8f10db41af	8322	Stopiče
00050000-5602-7bea-d5cf-d7d71248c806	3206	Stranice
00050000-5602-7bea-0f82-58b99c176ccf	8351	Straža
00050000-5602-7bea-9145-64c02793e3cd	1313	Struge
00050000-5602-7bea-f385-090cbf0f8a9e	8293	Studenec
00050000-5602-7bea-a631-0adc8efd42d9	8331	Suhor
00050000-5602-7bea-aa94-490690c507cf	2233	Sv. Ana v Slovenskih goricah
00050000-5602-7bea-c7b7-5559d2ffd7ed	2235	Sv. Trojica v Slovenskih goricah
00050000-5602-7bea-bcc8-4a650e67c54f	2353	Sveti Duh na Ostrem Vrhu
00050000-5602-7bea-3087-ec32b5d1b8a2	9244	Sveti Jurij ob Ščavnici
00050000-5602-7bea-8df0-32bc6cf94c26	3264	Sveti Štefan
00050000-5602-7bea-4cc6-1d8435896687	2258	Sveti Tomaž
00050000-5602-7bea-d833-5878ca2c6561	9204	Šalovci
00050000-5602-7bea-15d2-09eeb058ca34	5261	Šempas
00050000-5602-7bea-61cc-da6f4e097070	5290	Šempeter pri Gorici
00050000-5602-7bea-7f50-5643a65b7f57	3311	Šempeter v Savinjski dolini
00050000-5602-7bea-aa6e-3e797cbe3de6	4208	Šenčur
00050000-5602-7bea-fdc8-2fb3db58cd6a	2212	Šentilj v Slovenskih goricah
00050000-5602-7bea-26df-cd6c44684c33	8297	Šentjanž
00050000-5602-7bea-2488-824716e9114d	2373	Šentjanž pri Dravogradu
00050000-5602-7bea-4f10-f2507dd8a584	8310	Šentjernej
00050000-5602-7bea-56f6-7a300cc678af	3230	Šentjur
00050000-5602-7bea-bb97-de60220a5c0c	3271	Šentrupert
00050000-5602-7bea-4fe1-b3ba51820c4b	8232	Šentrupert
00050000-5602-7bea-360d-84987249ca74	1296	Šentvid pri Stični
00050000-5602-7bea-3da5-5c7e4129476b	8275	Škocjan
00050000-5602-7bea-edf1-636895a78194	6281	Škofije
00050000-5602-7bea-7604-75cbba1cc9ef	4220	Škofja Loka
00050000-5602-7bea-b5d9-cf2a73cbb24d	3211	Škofja vas
00050000-5602-7bea-1083-747f33761a74	1291	Škofljica
00050000-5602-7bea-5857-955ed980b813	6274	Šmarje
00050000-5602-7bea-d1f4-4cf3db24430b	1293	Šmarje - Sap
00050000-5602-7bea-a036-2c1a6e5f2d0c	3240	Šmarje pri Jelšah
00050000-5602-7bea-4ac3-32db3d949cf4	8220	Šmarješke Toplice
00050000-5602-7bea-bc7e-020b71a7cde6	2315	Šmartno na Pohorju
00050000-5602-7bea-57ff-8feaebdc7264	3341	Šmartno ob Dreti
00050000-5602-7bea-c39b-f6fc8b3844b9	3327	Šmartno ob Paki
00050000-5602-7bea-aa2f-55ed4ad73550	1275	Šmartno pri Litiji
00050000-5602-7bea-e9db-8f74c4154198	2383	Šmartno pri Slovenj Gradcu
00050000-5602-7bea-c14c-9b0b533581d6	3201	Šmartno v Rožni dolini
00050000-5602-7bea-9cf9-f67e5498b370	3325	Šoštanj
00050000-5602-7bea-f50b-f06dca0e28ac	6222	Štanjel
00050000-5602-7bea-1525-dcb6b981097c	3220	Štore
00050000-5602-7bea-e344-7cd469d89876	3304	Tabor
00050000-5602-7bea-ecb2-7f3780b90e44	3221	Teharje
00050000-5602-7bea-850c-8e6d2a9023df	9251	Tišina
00050000-5602-7bea-681f-f582c280eefe	5220	Tolmin
00050000-5602-7bea-6b2c-18a5fb3cbafc	3326	Topolšica
00050000-5602-7bea-2bdf-6dc613317f66	2371	Trbonje
00050000-5602-7bea-e0a5-d7e19c218d8f	1420	Trbovlje
00050000-5602-7bea-2b60-7f8915615267	8231	Trebelno 
00050000-5602-7bea-375e-8b7b039b2c67	8210	Trebnje
00050000-5602-7bea-ada5-394fda830071	5252	Trnovo pri Gorici
00050000-5602-7bea-7399-c0eb161c29a4	2254	Trnovska vas
00050000-5602-7bea-3b52-d60bd0e00bdb	1222	Trojane
00050000-5602-7bea-34f0-1e1ce6996a4c	1236	Trzin
00050000-5602-7bea-b1c2-f3b26635c699	4290	Tržič
00050000-5602-7bea-09f0-60e6263d152b	8295	Tržišče
00050000-5602-7bea-c256-25f262583406	1311	Turjak
00050000-5602-7bea-b1ca-016ddb1bd9c3	9224	Turnišče
00050000-5602-7bea-d76c-1a5150d5ec6c	8323	Uršna sela
00050000-5602-7bea-b139-3cba0e3f90c9	1252	Vače
00050000-5602-7bea-8a19-7fc1ae868ebd	3320	Velenje 
00050000-5602-7bea-260f-47863d29101a	3322	Velenje - poštni predali
00050000-5602-7bea-7265-072e2d63618c	8212	Velika Loka
00050000-5602-7bea-9538-bf836dd5f1a0	2274	Velika Nedelja
00050000-5602-7bea-6500-aa03126b90d2	9225	Velika Polana
00050000-5602-7bea-ce5c-b22eb2b56022	1315	Velike Lašče
00050000-5602-7bea-8681-4d07850ccf83	8213	Veliki Gaber
00050000-5602-7bea-bb95-8380302929d0	9241	Veržej
00050000-5602-7bea-3dff-3bce12d085e5	1312	Videm - Dobrepolje
00050000-5602-7bea-3897-b72eeb4fb47b	2284	Videm pri Ptuju
00050000-5602-7bea-0c2b-c36e349b0408	8344	Vinica
00050000-5602-7bea-c325-3d4ad40d047a	5271	Vipava
00050000-5602-7bea-95cf-26c34db952e1	4212	Visoko
00050000-5602-7bea-0ea0-990a75ffe6fa	1294	Višnja Gora
00050000-5602-7bea-4e99-25fa5d2bb95c	3205	Vitanje
00050000-5602-7bea-1bd6-1226c4a59038	2255	Vitomarci
00050000-5602-7bea-3b41-9e4fa110b93c	1217	Vodice
00050000-5602-7bea-9b61-49b42d4e2740	3212	Vojnik\t
00050000-5602-7bea-dd90-cd24c2a35e2f	5293	Volčja Draga
00050000-5602-7bea-efec-8720a6cd0d7d	2232	Voličina
00050000-5602-7bea-adf2-bc3fdaf9cfc5	3305	Vransko
00050000-5602-7bea-2f14-873f1797845a	6217	Vremski Britof
00050000-5602-7bea-4874-1fdbf8942593	1360	Vrhnika
00050000-5602-7bea-7dfe-d4f7f6547e2f	2365	Vuhred
00050000-5602-7bea-7d5b-bf38755ffb4e	2367	Vuzenica
00050000-5602-7bea-eca9-b1a293095963	8292	Zabukovje 
00050000-5602-7bea-9686-d4f6e5b400cf	1410	Zagorje ob Savi
00050000-5602-7bea-5d16-ba2a86d7ee39	1303	Zagradec
00050000-5602-7bea-5b20-5e87a4930321	2283	Zavrč
00050000-5602-7bea-1bb6-76a472d84b7f	8272	Zdole 
00050000-5602-7bea-8f18-a08ee457fbdb	4201	Zgornja Besnica
00050000-5602-7bea-4704-377d391b05d0	2242	Zgornja Korena
00050000-5602-7bea-962e-9c616b5a81cb	2201	Zgornja Kungota
00050000-5602-7bea-fa66-87cb058c3fb5	2316	Zgornja Ložnica
00050000-5602-7bea-d393-085828c1c3b4	2314	Zgornja Polskava
00050000-5602-7bea-22d8-0af8d9178642	2213	Zgornja Velka
00050000-5602-7bea-949c-fe5fdb6b69c3	4247	Zgornje Gorje
00050000-5602-7bea-faea-cf34d1d33a2f	4206	Zgornje Jezersko
00050000-5602-7bea-531f-e2dade90619c	2285	Zgornji Leskovec
00050000-5602-7bea-d21e-8e200089dffd	1432	Zidani Most
00050000-5602-7bea-3c92-016f04693182	3214	Zreče
00050000-5602-7bea-8053-29ab2130568a	4209	Žabnica
00050000-5602-7bea-d72f-289aa106b065	3310	Žalec
00050000-5602-7bea-bfbf-5491867db3db	4228	Železniki
00050000-5602-7bea-6092-c8a545986375	2287	Žetale
00050000-5602-7bea-6822-74617d48b4f3	4226	Žiri
00050000-5602-7bea-312d-2fb0d826d159	4274	Žirovnica
00050000-5602-7bea-88bf-6fc0e9857875	8360	Žužemberk
\.


--
-- TOC entry 3024 (class 0 OID 20470812)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20470437)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 20470217)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5602-7bed-baf5-da822358b710	00080000-5602-7bed-9e22-6f9d1138d669	\N	00040000-5602-7beb-8d6e-fa0775f70b8d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5602-7bed-77a9-00f9a6539bca	00080000-5602-7bed-9e22-6f9d1138d669	\N	00040000-5602-7beb-8d6e-fa0775f70b8d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5602-7bed-8a96-7a47a01f7f37	00080000-5602-7bed-465f-88a8e2c8bb4b	\N	00040000-5602-7beb-8d6e-fa0775f70b8d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2986 (class 0 OID 20470321)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20470449)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20470826)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20470836)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5602-7bed-287d-edd349dc4e12	00080000-5602-7bed-9800-3441b2093eb8	0987	AK
00190000-5602-7bed-daed-9782a4f69636	00080000-5602-7bed-465f-88a8e2c8bb4b	0989	AK
00190000-5602-7bed-8921-1de3cea7b770	00080000-5602-7bed-71ea-a3f5e7ff3bf5	0986	AK
00190000-5602-7bed-2596-ecc7e00d1764	00080000-5602-7bed-9370-71cbb37d6a20	0984	AK
00190000-5602-7bed-132f-a997521f5979	00080000-5602-7bed-b401-f4a06da52c78	0983	AK
00190000-5602-7bed-53ab-f1bea10eab97	00080000-5602-7bed-05ad-b76c7f3206e9	0982	AK
00190000-5602-7bee-56d4-ddc476e3a063	00080000-5602-7bee-b80e-a0e49ad78021	1001	AK
\.


--
-- TOC entry 3023 (class 0 OID 20470769)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5602-7bed-be8e-32f9dd6ae150	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3027 (class 0 OID 20470844)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20470478)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5602-7bec-e371-819ab0004ef1	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5602-7bec-3f27-cf55b8b9e029	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5602-7bec-4645-84a2c233dbd4	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5602-7bec-ac94-25f1ae21dcbc	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5602-7bec-a8fc-0eef229ada52	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5602-7bec-2541-8ebe38052d46	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5602-7bec-d264-c55d77f54cd4	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2995 (class 0 OID 20470422)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20470412)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20470621)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20470552)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20470295)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20470090)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5602-7bee-b80e-a0e49ad78021	00010000-5602-7beb-051e-4f7c897fe26d	2015-09-23 12:16:14	INS	a:0:{}
2	App\\Entity\\Option	00000000-5602-7bee-05c5-5ccb643cdd39	00010000-5602-7beb-051e-4f7c897fe26d	2015-09-23 12:16:14	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5602-7bee-56d4-ddc476e3a063	00010000-5602-7beb-051e-4f7c897fe26d	2015-09-23 12:16:14	INS	a:0:{}
\.


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3004 (class 0 OID 20470491)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 20470128)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5602-7beb-9925-f841bf03cfa1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5602-7beb-4ee0-75c10b05599b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5602-7beb-9b09-b088f9a052f0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5602-7beb-0ddd-2aaad9da8473	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5602-7beb-1227-953893dfbeb7	planer	Planer dogodkov v koledarju	t
00020000-5602-7beb-56f3-98dd6c1ab245	kadrovska	Kadrovska služba	t
00020000-5602-7beb-a110-5d3ece18beb2	arhivar	Ažuriranje arhivalij	t
00020000-5602-7beb-3afb-9043ef79c830	igralec	Igralec	t
00020000-5602-7beb-fa0a-17618d03b500	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5602-7bed-ca27-1eb1c16540c5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2969 (class 0 OID 20470112)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5602-7beb-5cd2-7cd82a437368	00020000-5602-7beb-9b09-b088f9a052f0
00010000-5602-7beb-051e-4f7c897fe26d	00020000-5602-7beb-9b09-b088f9a052f0
00010000-5602-7bed-ad42-1759983253e0	00020000-5602-7bed-ca27-1eb1c16540c5
\.


--
-- TOC entry 3006 (class 0 OID 20470505)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20470443)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20470389)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 20470077)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5602-7beb-bca5-7c5361957699	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5602-7beb-cbb8-49cc3607e064	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5602-7beb-e286-fab705b47c59	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5602-7beb-c070-15ec05311ab6	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5602-7beb-343d-46a7f826d61c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 20470069)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5602-7beb-e342-493b9329e4e6	00230000-5602-7beb-c070-15ec05311ab6	popa
00240000-5602-7beb-d12b-4cdca643ce64	00230000-5602-7beb-c070-15ec05311ab6	oseba
00240000-5602-7beb-b834-83e6e4045024	00230000-5602-7beb-c070-15ec05311ab6	sezona
00240000-5602-7beb-a5d0-fef446d3cd7f	00230000-5602-7beb-cbb8-49cc3607e064	prostor
00240000-5602-7beb-09c3-c92a910b34d1	00230000-5602-7beb-c070-15ec05311ab6	besedilo
00240000-5602-7beb-e613-cc2dc13e8160	00230000-5602-7beb-c070-15ec05311ab6	uprizoritev
00240000-5602-7beb-1be3-0e53ccd01b47	00230000-5602-7beb-c070-15ec05311ab6	funkcija
00240000-5602-7beb-7ce5-8c5878b9169c	00230000-5602-7beb-c070-15ec05311ab6	tipfunkcije
00240000-5602-7beb-bde9-c253685d0e4b	00230000-5602-7beb-c070-15ec05311ab6	alternacija
00240000-5602-7beb-721d-a093b7267823	00230000-5602-7beb-bca5-7c5361957699	pogodba
00240000-5602-7beb-4a75-dd975756d38a	00230000-5602-7beb-c070-15ec05311ab6	zaposlitev
00240000-5602-7beb-3105-4ee560f992e2	00230000-5602-7beb-c070-15ec05311ab6	zvrstuprizoritve
00240000-5602-7beb-8652-6a5e29547c23	00230000-5602-7beb-bca5-7c5361957699	programdela
00240000-5602-7beb-036c-ea4d552a22b3	00230000-5602-7beb-c070-15ec05311ab6	zapis
\.


--
-- TOC entry 2963 (class 0 OID 20470064)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
886604a0-e634-482b-9fe5-24839de977f0	00240000-5602-7beb-e342-493b9329e4e6	0	1001
\.


--
-- TOC entry 3012 (class 0 OID 20470569)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5602-7bed-838c-63ff6ca13dea	000e0000-5602-7bed-8032-8392238e869c	00080000-5602-7bed-9e22-6f9d1138d669	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5602-7beb-c006-b59b4939859b
00270000-5602-7bed-e15a-57582b162b35	000e0000-5602-7bed-8032-8392238e869c	00080000-5602-7bed-9e22-6f9d1138d669	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5602-7beb-c006-b59b4939859b
\.


--
-- TOC entry 2976 (class 0 OID 20470190)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20470399)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5602-7bed-08fa-a3d7f5abde29	00180000-5602-7bed-4f4e-a020b7e4016f	000c0000-5602-7bed-c21d-9164b797c0dc	00090000-5602-7bed-2a47-3e4c051cdd7e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-7bed-67e8-ad6725e34ae8	00180000-5602-7bed-4f4e-a020b7e4016f	000c0000-5602-7bed-e2d5-e8540a5a49ab	00090000-5602-7bed-fb93-3d21250bfd80	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-7bed-7db4-3dd0a750a685	00180000-5602-7bed-4f4e-a020b7e4016f	000c0000-5602-7bed-b34e-5d56088c28fc	00090000-5602-7bed-4130-99c4e594887f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-7bed-9628-defc5dc83d98	00180000-5602-7bed-4f4e-a020b7e4016f	000c0000-5602-7bed-956b-f17fa4ffac10	00090000-5602-7bed-158d-c12149f6ea83	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-7bed-3f8d-7756c74964f3	00180000-5602-7bed-4f4e-a020b7e4016f	000c0000-5602-7bed-83e1-96cd22af169c	00090000-5602-7bed-a202-7ab54a59d1c2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-7bed-db44-13ffdf45d9f3	00180000-5602-7bed-3f50-0c80b3303430	\N	00090000-5602-7bed-a202-7ab54a59d1c2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3015 (class 0 OID 20470609)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5602-7beb-fc75-fd42ee13a02c	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5602-7beb-d5fc-e0468c252f7f	02	Priredba	Priredba	Priredba	umetnik
000f0000-5602-7beb-6aba-b4c38d7b26f8	03	Prevod	Prevod	Prevod	umetnik
000f0000-5602-7beb-c82f-b5d0478dd5ee	04	Režija	Režija	Režija	umetnik
000f0000-5602-7beb-3732-9cfe40aee5ec	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5602-7beb-54b8-22d1ea89e8d8	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5602-7beb-6476-b498f9ca13af	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5602-7beb-6814-ad0eaac49f3f	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5602-7beb-508f-3894ee4b7893	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5602-7beb-08ad-0fc89b7dd467	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5602-7beb-37bf-f42c4841913b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5602-7beb-8a99-e55b8235124d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5602-7beb-136d-09782ed5304e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5602-7beb-51b1-0c6d498aa9d5	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5602-7beb-e71a-ded090748546	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5602-7beb-1a22-75675dba2d75	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5602-7beb-d915-19cf46603123	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5602-7beb-4bef-b8099034d19c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3028 (class 0 OID 20470854)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5602-7beb-8cc8-fc29e856bb73	01	Velika predstava	f	1.00	1.00
002b0000-5602-7beb-74a1-f5b5d6cb1c40	02	Mala predstava	f	0.50	0.50
002b0000-5602-7beb-a0ab-5f4693cf1115	03	Mala koprodukcija	t	0.40	1.00
002b0000-5602-7beb-1200-ffa0fad57645	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5602-7beb-c863-f12167c5aeb4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2981 (class 0 OID 20470252)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20470099)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5602-7beb-051e-4f7c897fe26d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROoNITLMT/kD8r2uKb6aIxV1Xq.Mtg2Be	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5602-7bed-83cc-8793746bbb07	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5602-7bed-799d-32e606709ece	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5602-7bed-5ac3-dba82e830335	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5602-7bed-dc30-bc3695b4a461	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5602-7bed-ba4f-22e09b059210	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5602-7bed-d6a5-9836a8f642bf	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5602-7bed-c616-6f1474bc40e2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5602-7bed-1ace-ed7030b1fdea	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5602-7bed-06dc-3bd8e46357ce	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5602-7bed-ad42-1759983253e0	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5602-7beb-5cd2-7cd82a437368	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3019 (class 0 OID 20470659)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5602-7bed-124a-9b962e8560f3	00160000-5602-7bec-6604-efa9eb52b5d4	\N	00140000-5602-7beb-1c6d-a7891fdc05d7	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		00220000-5602-7bec-a8fc-0eef229ada52
000e0000-5602-7bed-8032-8392238e869c	00160000-5602-7bec-de40-76847e922eb9	\N	00140000-5602-7beb-3939-a842d1fd2dab	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		00220000-5602-7bec-2541-8ebe38052d46
000e0000-5602-7bed-2ac4-1a9117deb194	\N	\N	00140000-5602-7beb-3939-a842d1fd2dab	00190000-5602-7bed-287d-edd349dc4e12	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-7bec-a8fc-0eef229ada52
000e0000-5602-7bed-5d75-07951b57855b	\N	\N	00140000-5602-7beb-3939-a842d1fd2dab	00190000-5602-7bed-287d-edd349dc4e12	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-7bec-a8fc-0eef229ada52
000e0000-5602-7bed-6ee0-a79769bd8b2b	\N	\N	00140000-5602-7beb-3939-a842d1fd2dab	00190000-5602-7bed-287d-edd349dc4e12	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5602-7bec-e371-819ab0004ef1
000e0000-5602-7bed-41f7-0947812d39e6	\N	\N	00140000-5602-7beb-3939-a842d1fd2dab	00190000-5602-7bed-287d-edd349dc4e12	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5602-7bec-e371-819ab0004ef1
\.


--
-- TOC entry 2988 (class 0 OID 20470342)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5602-7bed-4563-49652c97ce93	000e0000-5602-7bed-8032-8392238e869c	\N	1	
00200000-5602-7bed-dcd5-f326f83451f5	000e0000-5602-7bed-8032-8392238e869c	\N	2	
00200000-5602-7bed-299c-2677116637cb	000e0000-5602-7bed-8032-8392238e869c	\N	3	
00200000-5602-7bed-fd61-d8a2f802af63	000e0000-5602-7bed-8032-8392238e869c	\N	4	
00200000-5602-7bed-29bc-1da22eeffc5c	000e0000-5602-7bed-8032-8392238e869c	\N	5	
\.


--
-- TOC entry 3002 (class 0 OID 20470470)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20470583)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5602-7beb-9017-03766877d4b3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5602-7beb-b590-e6bf905f58fc	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5602-7beb-f287-060acd49bf22	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5602-7beb-593f-1b3dcae2ef2d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5602-7beb-b63e-dd79392630da	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5602-7beb-b972-906817c5821f	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5602-7beb-4f2a-6be8af32479e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5602-7beb-d2f4-95a1f65217f9	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5602-7beb-c006-b59b4939859b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5602-7beb-8505-e17932c9b611	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5602-7beb-6d8c-3cca2a32c33e	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5602-7beb-92ac-db638f619846	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5602-7beb-9cdc-03a526640212	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5602-7beb-e75b-db0c71bc60db	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5602-7beb-d36b-5663c03150e1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5602-7beb-6ca3-33b15280cf6e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5602-7beb-c088-671dfdfcf8c9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5602-7beb-c941-826c3d7b3077	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5602-7beb-e8d2-210d88828ab2	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5602-7beb-34e8-481e4e4e115b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5602-7beb-c4cb-35c5b30de334	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5602-7beb-e72b-afbdf1c60ef9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5602-7beb-892d-230d216b2d3d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5602-7beb-4ced-5292aa857c68	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5602-7beb-7e3f-d2fdf690f300	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5602-7beb-6595-193846e302e9	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5602-7beb-b3fa-78919ef4752d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5602-7beb-83bf-4233ef4ff5b0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3031 (class 0 OID 20470901)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20470873)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20470913)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20470542)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5602-7bed-7e58-c9046354f8c6	00090000-5602-7bed-fb93-3d21250bfd80	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-7bed-286e-bb99344296b9	00090000-5602-7bed-4130-99c4e594887f	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-7bed-7d41-fdaf056d9120	00090000-5602-7bed-b6ac-24df70b6d6b5	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-7bed-9183-50ad1b4f42f1	00090000-5602-7bed-1456-df289066cfae	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-7bed-2ed5-33a579e30d15	00090000-5602-7bed-2a47-3e4c051cdd7e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-7bed-5db3-9084310beac0	00090000-5602-7bed-98d7-5bb06f02a7fd	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2990 (class 0 OID 20470378)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20470649)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5602-7beb-1c6d-a7891fdc05d7	01	Drama	drama (SURS 01)
00140000-5602-7beb-449b-ddf99a1dbb77	02	Opera	opera (SURS 02)
00140000-5602-7beb-d451-807c0d801d24	03	Balet	balet (SURS 03)
00140000-5602-7beb-e4c6-84716fe77fc1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5602-7beb-ea4f-45d4c2f62dcb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5602-7beb-3939-a842d1fd2dab	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5602-7beb-4c4b-1d803c22acb8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3008 (class 0 OID 20470532)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2495 (class 2606 OID 20470153)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 20470708)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20470698)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20470566)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20470607)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 20470953)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 20470367)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20470388)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 20470871)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 20470278)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 20470763)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20470528)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 20470340)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 20470316)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 20470292)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 20470435)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 20470930)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20470937)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 20470961)
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
-- TOC entry 2607 (class 2606 OID 20470462)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 20470250)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 20470162)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 20470186)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 20470142)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2486 (class 2606 OID 20470127)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 20470468)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 20470504)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 20470644)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 20470214)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 20470238)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 20470824)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20470441)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 20470228)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20470328)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20470453)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20470833)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 20470841)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 20470811)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 20470852)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 20470486)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 20470426)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 20470417)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 20470631)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20470559)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 20470304)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 20470098)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 20470495)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 20470116)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2488 (class 2606 OID 20470136)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20470513)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 20470448)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20470397)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 20470086)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 20470074)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 20470068)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 20470579)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 20470195)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 20470408)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 20470618)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20470864)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 20470263)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 20470111)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 20470677)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20470350)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 20470476)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20470591)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 20470911)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 20470895)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 20470919)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 20470550)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 20470382)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 20470657)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 20470540)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 1259 OID 20470376)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2560 (class 1259 OID 20470377)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2561 (class 1259 OID 20470375)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2562 (class 1259 OID 20470374)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2563 (class 1259 OID 20470373)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2649 (class 1259 OID 20470580)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2650 (class 1259 OID 20470581)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2651 (class 1259 OID 20470582)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 20470932)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 20470931)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2509 (class 1259 OID 20470216)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2608 (class 1259 OID 20470469)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 20470899)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 20470898)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 20470900)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 20470897)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 20470896)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2602 (class 1259 OID 20470455)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2603 (class 1259 OID 20470454)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2554 (class 1259 OID 20470351)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 20470529)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20470531)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2634 (class 1259 OID 20470530)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2534 (class 1259 OID 20470294)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 20470293)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2713 (class 1259 OID 20470853)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2665 (class 1259 OID 20470646)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2666 (class 1259 OID 20470647)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 20470648)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 20470920)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2674 (class 1259 OID 20470682)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2675 (class 1259 OID 20470679)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2676 (class 1259 OID 20470683)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2677 (class 1259 OID 20470681)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2678 (class 1259 OID 20470680)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2524 (class 1259 OID 20470265)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 20470264)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2500 (class 1259 OID 20470189)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2620 (class 1259 OID 20470496)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2490 (class 1259 OID 20470143)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 20470144)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2625 (class 1259 OID 20470516)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2626 (class 1259 OID 20470515)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2627 (class 1259 OID 20470514)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2547 (class 1259 OID 20470329)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 20470330)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2470 (class 1259 OID 20470076)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2582 (class 1259 OID 20470421)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2583 (class 1259 OID 20470419)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2584 (class 1259 OID 20470418)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2585 (class 1259 OID 20470420)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2481 (class 1259 OID 20470117)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2482 (class 1259 OID 20470118)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2611 (class 1259 OID 20470477)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 20470954)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2647 (class 1259 OID 20470568)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 20470567)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2746 (class 1259 OID 20470962)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 20470963)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2597 (class 1259 OID 20470442)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2641 (class 1259 OID 20470560)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2642 (class 1259 OID 20470561)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2695 (class 1259 OID 20470768)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2696 (class 1259 OID 20470767)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2697 (class 1259 OID 20470764)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2698 (class 1259 OID 20470765)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2699 (class 1259 OID 20470766)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2513 (class 1259 OID 20470230)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 20470229)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2515 (class 1259 OID 20470231)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 20470490)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 20470489)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 20470834)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2706 (class 1259 OID 20470835)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2688 (class 1259 OID 20470712)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 20470713)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2690 (class 1259 OID 20470710)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2691 (class 1259 OID 20470711)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2638 (class 1259 OID 20470551)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 20470430)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2589 (class 1259 OID 20470429)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2590 (class 1259 OID 20470427)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2591 (class 1259 OID 20470428)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2684 (class 1259 OID 20470700)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 20470699)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2538 (class 1259 OID 20470305)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2541 (class 1259 OID 20470319)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2542 (class 1259 OID 20470318)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2543 (class 1259 OID 20470317)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2544 (class 1259 OID 20470320)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2553 (class 1259 OID 20470341)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2702 (class 1259 OID 20470825)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2721 (class 1259 OID 20470872)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 20470938)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 20470939)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2496 (class 1259 OID 20470164)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2497 (class 1259 OID 20470163)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2505 (class 1259 OID 20470196)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 20470197)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2569 (class 1259 OID 20470383)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 20470411)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20470410)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2579 (class 1259 OID 20470409)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2564 (class 1259 OID 20470369)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2565 (class 1259 OID 20470370)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2566 (class 1259 OID 20470368)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2567 (class 1259 OID 20470372)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2568 (class 1259 OID 20470371)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2512 (class 1259 OID 20470215)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 20470279)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20470281)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2532 (class 1259 OID 20470280)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2533 (class 1259 OID 20470282)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2596 (class 1259 OID 20470436)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2670 (class 1259 OID 20470645)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 20470678)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 20470619)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20470620)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2503 (class 1259 OID 20470187)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 20470188)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2635 (class 1259 OID 20470541)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 20470087)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 20470251)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2473 (class 1259 OID 20470075)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2718 (class 1259 OID 20470865)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 20470488)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2619 (class 1259 OID 20470487)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 20470709)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 20470239)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 20470658)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 20470912)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2711 (class 1259 OID 20470842)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 20470843)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2658 (class 1259 OID 20470608)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2576 (class 1259 OID 20470398)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 20470137)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2780 (class 2606 OID 20471094)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2779 (class 2606 OID 20471099)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2775 (class 2606 OID 20471119)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2781 (class 2606 OID 20471089)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2777 (class 2606 OID 20471109)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2776 (class 2606 OID 20471114)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2778 (class 2606 OID 20471104)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2816 (class 2606 OID 20471284)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2815 (class 2606 OID 20471289)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2814 (class 2606 OID 20471294)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 20471459)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 20471454)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2761 (class 2606 OID 20471019)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 20471204)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2843 (class 2606 OID 20471439)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 20471434)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2842 (class 2606 OID 20471444)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20471429)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2846 (class 2606 OID 20471424)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2796 (class 2606 OID 20471199)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2797 (class 2606 OID 20471194)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2774 (class 2606 OID 20471084)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 20471244)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20471254)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2807 (class 2606 OID 20471249)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2767 (class 2606 OID 20471054)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20471049)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 20471184)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20471414)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2819 (class 2606 OID 20471299)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 20471304)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 20471309)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2847 (class 2606 OID 20471449)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2821 (class 2606 OID 20471329)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2824 (class 2606 OID 20471314)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2820 (class 2606 OID 20471334)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2822 (class 2606 OID 20471324)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2823 (class 2606 OID 20471319)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2765 (class 2606 OID 20471044)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20471039)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 20471004)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2758 (class 2606 OID 20470999)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2802 (class 2606 OID 20471224)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2754 (class 2606 OID 20470979)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2753 (class 2606 OID 20470984)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2803 (class 2606 OID 20471239)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2804 (class 2606 OID 20471234)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2805 (class 2606 OID 20471229)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2772 (class 2606 OID 20471069)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2771 (class 2606 OID 20471074)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2750 (class 2606 OID 20470964)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2786 (class 2606 OID 20471159)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2788 (class 2606 OID 20471149)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2789 (class 2606 OID 20471144)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2787 (class 2606 OID 20471154)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2752 (class 2606 OID 20470969)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2751 (class 2606 OID 20470974)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2799 (class 2606 OID 20471209)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2852 (class 2606 OID 20471474)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2812 (class 2606 OID 20471279)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2813 (class 2606 OID 20471274)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2854 (class 2606 OID 20471479)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 20471484)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2795 (class 2606 OID 20471189)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2811 (class 2606 OID 20471264)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2810 (class 2606 OID 20471269)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 20471389)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 20471384)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2835 (class 2606 OID 20471369)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2834 (class 2606 OID 20471374)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2833 (class 2606 OID 20471379)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2763 (class 2606 OID 20471029)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 20471024)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 20471034)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 20471219)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2801 (class 2606 OID 20471214)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 20471399)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2837 (class 2606 OID 20471404)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2828 (class 2606 OID 20471359)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 20471364)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2830 (class 2606 OID 20471349)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2829 (class 2606 OID 20471354)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2809 (class 2606 OID 20471259)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 20471179)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2791 (class 2606 OID 20471174)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2793 (class 2606 OID 20471164)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2792 (class 2606 OID 20471169)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 20471344)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2826 (class 2606 OID 20471339)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 20471059)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2770 (class 2606 OID 20471064)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 20471079)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20471394)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2839 (class 2606 OID 20471409)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20471419)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2851 (class 2606 OID 20471464)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2850 (class 2606 OID 20471469)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2755 (class 2606 OID 20470994)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2756 (class 2606 OID 20470989)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2760 (class 2606 OID 20471009)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 20471014)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 20471124)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2783 (class 2606 OID 20471139)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20471134)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2785 (class 2606 OID 20471129)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-23 12:16:16 CEST

--
-- PostgreSQL database dump complete
--

