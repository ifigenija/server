--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-29 13:24:12 CEST

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
-- TOC entry 181 (class 1259 OID 21033514)
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
-- TOC entry 229 (class 1259 OID 21034071)
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
-- TOC entry 228 (class 1259 OID 21034054)
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
-- TOC entry 219 (class 1259 OID 21033931)
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
-- TOC entry 222 (class 1259 OID 21033961)
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
-- TOC entry 243 (class 1259 OID 21034313)
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
-- TOC entry 197 (class 1259 OID 21033722)
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
-- TOC entry 199 (class 1259 OID 21033753)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21034239)
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
-- TOC entry 190 (class 1259 OID 21033635)
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
-- TOC entry 230 (class 1259 OID 21034084)
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
-- TOC entry 215 (class 1259 OID 21033886)
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
-- TOC entry 195 (class 1259 OID 21033701)
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
-- TOC entry 193 (class 1259 OID 21033675)
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
-- TOC entry 191 (class 1259 OID 21033652)
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
-- TOC entry 204 (class 1259 OID 21033800)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21034294)
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
-- TOC entry 242 (class 1259 OID 21034306)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21034328)
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
-- TOC entry 208 (class 1259 OID 21033825)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21033609)
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
-- TOC entry 182 (class 1259 OID 21033523)
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
-- TOC entry 183 (class 1259 OID 21033534)
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
-- TOC entry 178 (class 1259 OID 21033488)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21033507)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21033832)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21033866)
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
-- TOC entry 225 (class 1259 OID 21034002)
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
-- TOC entry 185 (class 1259 OID 21033567)
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
-- TOC entry 187 (class 1259 OID 21033601)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21034184)
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
-- TOC entry 205 (class 1259 OID 21033806)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21033586)
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
-- TOC entry 194 (class 1259 OID 21033690)
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
-- TOC entry 207 (class 1259 OID 21033818)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21034198)
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
-- TOC entry 234 (class 1259 OID 21034208)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21034141)
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
-- TOC entry 235 (class 1259 OID 21034216)
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
-- TOC entry 211 (class 1259 OID 21033847)
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
-- TOC entry 203 (class 1259 OID 21033791)
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
-- TOC entry 202 (class 1259 OID 21033781)
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
-- TOC entry 224 (class 1259 OID 21033991)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21033921)
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
-- TOC entry 192 (class 1259 OID 21033664)
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
-- TOC entry 175 (class 1259 OID 21033459)
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
-- TOC entry 174 (class 1259 OID 21033457)
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
-- TOC entry 212 (class 1259 OID 21033860)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21033497)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21033481)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21033874)
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
-- TOC entry 206 (class 1259 OID 21033812)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21033758)
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
-- TOC entry 173 (class 1259 OID 21033446)
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
-- TOC entry 172 (class 1259 OID 21033438)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21033433)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21033938)
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
-- TOC entry 184 (class 1259 OID 21033559)
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
-- TOC entry 201 (class 1259 OID 21033768)
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
-- TOC entry 223 (class 1259 OID 21033979)
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
-- TOC entry 236 (class 1259 OID 21034227)
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
-- TOC entry 189 (class 1259 OID 21033621)
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
-- TOC entry 176 (class 1259 OID 21033468)
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
-- TOC entry 227 (class 1259 OID 21034029)
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
-- TOC entry 196 (class 1259 OID 21033712)
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
-- TOC entry 210 (class 1259 OID 21033839)
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
-- TOC entry 221 (class 1259 OID 21033952)
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
-- TOC entry 239 (class 1259 OID 21034274)
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
-- TOC entry 238 (class 1259 OID 21034246)
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
-- TOC entry 240 (class 1259 OID 21034286)
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
-- TOC entry 217 (class 1259 OID 21033911)
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
-- TOC entry 198 (class 1259 OID 21033747)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21034019)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21033901)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21033462)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 21033514)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21034071)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-560a-74d9-8425-6d92134fd29b	000d0000-560a-74d9-83e4-08eb7b69c535	\N	00090000-560a-74d9-e005-3f11e511b1f2	000b0000-560a-74d9-bb10-958ab621eda8	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-560a-74d9-33cd-c6ce9ff24224	000d0000-560a-74d9-7bf5-ae8efc4daf35	00100000-560a-74d9-be53-8df4febede77	00090000-560a-74d9-bb1f-a923153579cd	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-560a-74d9-0a92-a6b26d6c3161	000d0000-560a-74d9-a6fe-669a871dbef9	00100000-560a-74d9-f9a0-f6889a79f211	00090000-560a-74d9-94ce-7ea621f9bce7	\N	0003	t	\N	2015-09-29	\N	2	t	\N	f	f
000c0000-560a-74d9-2a84-29c1c953862d	000d0000-560a-74d9-2a66-3380b489dec9	\N	00090000-560a-74d9-1073-8a6ffbee6c13	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-560a-74d9-b137-3b6471594cac	000d0000-560a-74d9-b9a5-8211bc7b5296	\N	00090000-560a-74d9-14ea-40307f822d54	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-560a-74d9-dfcf-fd8141951d76	000d0000-560a-74d9-74c4-0b053aa91171	\N	00090000-560a-74d9-117e-68e00edbf7b2	000b0000-560a-74d9-0f1b-2057f5d931fe	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-560a-74d9-754b-93be607100ad	000d0000-560a-74d9-c4ee-10bd5778df95	00100000-560a-74d9-bf72-a534f7f5e0d1	00090000-560a-74d9-2d1f-1169578b20e9	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-560a-74d9-2cf7-5a2031fb6ecf	000d0000-560a-74d9-b7a7-bed80c12c171	\N	00090000-560a-74d9-cd80-b9cabf0cdc57	000b0000-560a-74d9-d0fe-6342d6beeb22	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-560a-74d9-dde2-b891f957ed8d	000d0000-560a-74d9-c4ee-10bd5778df95	00100000-560a-74d9-196e-078729866302	00090000-560a-74d9-36ec-2471c1e0bd76	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-560a-74d9-920c-75da815fde3f	000d0000-560a-74d9-c4ee-10bd5778df95	00100000-560a-74d9-28fd-da9aa089976c	00090000-560a-74d9-09d6-15318cc6c135	\N	0010	t	\N	2015-09-29	\N	16	f	\N	f	t
000c0000-560a-74d9-d300-8973af52abb8	000d0000-560a-74d9-c4ee-10bd5778df95	00100000-560a-74d9-f30b-98c6773563d8	00090000-560a-74d9-4e7f-060f9d513f38	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-560a-74d9-5e35-ad11799fb519	000d0000-560a-74d9-2b93-760aa750c31c	\N	00090000-560a-74d9-bb1f-a923153579cd	000b0000-560a-74d9-8667-54b020f5888a	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3024 (class 0 OID 21034054)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21033931)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-560a-74d9-4147-a27457389d26	00160000-560a-74d9-39ce-08b0559e2d33	00090000-560a-74d9-93f7-c1bc54aeeac8	aizv	10	t
003d0000-560a-74d9-924b-1a12be8a1019	00160000-560a-74d9-39ce-08b0559e2d33	00090000-560a-74d9-abae-3ef240f4e6e2	apri	14	t
003d0000-560a-74d9-f864-3c879be27f0e	00160000-560a-74d9-fc81-0b414087bbc0	00090000-560a-74d9-54b4-a10bba10ed48	aizv	11	t
003d0000-560a-74d9-bb32-7c2c7669ac7c	00160000-560a-74d9-b368-fa30e9eb9a6b	00090000-560a-74d9-dfe7-fd38c2a653b5	aizv	12	t
003d0000-560a-74d9-7788-03a593e7834f	00160000-560a-74d9-39ce-08b0559e2d33	00090000-560a-74d9-c4cb-3b7d7ffea17b	apri	18	f
\.


--
-- TOC entry 3018 (class 0 OID 21033961)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-560a-74d9-39ce-08b0559e2d33	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-560a-74d9-fc81-0b414087bbc0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-560a-74d9-b368-fa30e9eb9a6b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 21034313)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 21033722)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-560a-74d9-bd1c-5dac2453a8ac	\N	\N	00200000-560a-74d9-ab5d-6d371186c672	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-560a-74d9-ce11-535ed85bf0dc	\N	\N	00200000-560a-74d9-f6d8-77448829ca8e	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-560a-74d9-c2d7-85b26ce0b35c	\N	\N	00200000-560a-74d9-ad31-1f6d08d053d8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-560a-74d9-8d35-031a6f3be8ef	\N	\N	00200000-560a-74d9-cdde-e960547a5496	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-560a-74d9-2585-6242e3bbac24	\N	\N	00200000-560a-74d9-21df-ac71d5c320b9	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 21033753)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21034239)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21033635)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-560a-74d7-22b3-99e055a056b9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-560a-74d7-f613-35e04558f050	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-560a-74d7-7089-0910930a4742	AL	ALB	008	Albania 	Albanija	\N
00040000-560a-74d7-2185-7a560f19c545	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-560a-74d7-5e31-8a2a2edc86f9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-560a-74d7-88d3-6aa016a666cd	AD	AND	020	Andorra 	Andora	\N
00040000-560a-74d7-efd5-0a944d7ca7c0	AO	AGO	024	Angola 	Angola	\N
00040000-560a-74d7-6443-ac55584217d2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-560a-74d7-3812-24e446137658	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-560a-74d7-8648-71d5900e514b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-74d7-0a3a-b945c53ba3c5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-560a-74d7-0917-9c59444b4b4f	AM	ARM	051	Armenia 	Armenija	\N
00040000-560a-74d7-0509-17813f219cf2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-560a-74d7-3d4f-7b1529c19dad	AU	AUS	036	Australia 	Avstralija	\N
00040000-560a-74d7-a042-b9d8cc9c090c	AT	AUT	040	Austria 	Avstrija	\N
00040000-560a-74d7-95e6-84ea03bd1e58	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-560a-74d7-df67-a934de1cf1f5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-560a-74d7-e982-eec3af2ea811	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-560a-74d7-79bd-2b64a432e1c4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-560a-74d7-efde-82d5d12f55b2	BB	BRB	052	Barbados 	Barbados	\N
00040000-560a-74d7-afe5-243c0256869c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-560a-74d7-5352-81508ad33e84	BE	BEL	056	Belgium 	Belgija	\N
00040000-560a-74d7-46c8-b00c4f0a7006	BZ	BLZ	084	Belize 	Belize	\N
00040000-560a-74d7-d135-56a09801cd2c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-560a-74d7-5261-c1ea96ae579c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-560a-74d7-53e5-c9c682aa8bc1	BT	BTN	064	Bhutan 	Butan	\N
00040000-560a-74d7-d895-de8d9c29a2e6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-560a-74d7-916d-fca62df6c779	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-560a-74d7-7b41-b34730964e19	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-560a-74d7-657d-16adee6d5447	BW	BWA	072	Botswana 	Bocvana	\N
00040000-560a-74d7-1739-555b85032666	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-560a-74d7-47de-516c7c26fea3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-560a-74d7-baa7-a351487d5afd	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-560a-74d7-02fb-7d79cfbf73ec	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-560a-74d7-eb17-90b344d20e91	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-560a-74d7-229e-46c1c77b2fb3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-560a-74d7-4cd5-f489bfb7e0cf	BI	BDI	108	Burundi 	Burundi 	\N
00040000-560a-74d7-0d89-9cbd1e642e2c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-560a-74d7-6c5c-6e656830351b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-560a-74d7-64d4-02ab46f1026b	CA	CAN	124	Canada 	Kanada	\N
00040000-560a-74d7-b1f7-22c5aec888ee	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-560a-74d7-455f-8809d9009980	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-560a-74d7-5d32-d5d00be890c3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-560a-74d7-8197-6c5e26b4c95f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-560a-74d7-3073-98cf7054206d	CL	CHL	152	Chile 	Čile	\N
00040000-560a-74d7-63d9-cc7f1363a9f8	CN	CHN	156	China 	Kitajska	\N
00040000-560a-74d7-9006-e86d58ce63e3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-560a-74d7-26ef-3ef2c93d43f6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-560a-74d7-7cca-1b0eb232fd67	CO	COL	170	Colombia 	Kolumbija	\N
00040000-560a-74d7-8c81-eceb9036e7ab	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-560a-74d7-f30f-7fe0e8929b77	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-560a-74d7-57ee-6ea1a92e6c9f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-560a-74d7-6a6e-e7e0802b4296	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-560a-74d7-22b4-a44b4210c565	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-560a-74d7-23bc-7f7cbdafb629	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-560a-74d7-c72c-9c8bda67b057	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-560a-74d7-8982-6190061ce11f	CU	CUB	192	Cuba 	Kuba	\N
00040000-560a-74d7-bbb2-7c371814df4a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-560a-74d7-b79a-659dcf1638ab	CY	CYP	196	Cyprus 	Ciper	\N
00040000-560a-74d7-0e9e-d26ad1d4551d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-560a-74d7-ad9c-268f5739ff69	DK	DNK	208	Denmark 	Danska	\N
00040000-560a-74d7-5990-e4eadd1896f1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-560a-74d7-c09a-4a5c0bd34353	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-74d7-fece-84c64016795c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-560a-74d7-efe2-e74b1df4b95a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-560a-74d7-e3c7-7fd106145147	EG	EGY	818	Egypt 	Egipt	\N
00040000-560a-74d7-6697-eb6531ad7660	SV	SLV	222	El Salvador 	Salvador	\N
00040000-560a-74d7-ac72-946875d3c367	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-560a-74d7-3192-7a78c86796c3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-560a-74d7-a807-c7cac5212adc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-560a-74d7-8a39-a6c3be6c2f1d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-560a-74d7-cde7-a992a706160e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-560a-74d7-acaa-fa02794e7062	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-560a-74d7-7aa4-09d302543685	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-560a-74d7-d4fd-704abcf6b9a5	FI	FIN	246	Finland 	Finska	\N
00040000-560a-74d7-b49c-1d6cc0a510b5	FR	FRA	250	France 	Francija	\N
00040000-560a-74d7-40b9-56339058551e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-560a-74d7-0e35-9b217af8d92a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-560a-74d7-5f35-40e2b0ee2869	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-560a-74d7-e08b-8de1a7a5c1df	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-560a-74d7-10ce-9244732e84c6	GA	GAB	266	Gabon 	Gabon	\N
00040000-560a-74d7-c700-1d10dc89ff09	GM	GMB	270	Gambia 	Gambija	\N
00040000-560a-74d7-59a2-eb5d8b4c05f9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-560a-74d7-d58b-d6b41e80b3dc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-560a-74d7-2cb5-883635676042	GH	GHA	288	Ghana 	Gana	\N
00040000-560a-74d7-2f20-af76f4946c8e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-560a-74d7-9c9a-fc4c916e327a	GR	GRC	300	Greece 	Grčija	\N
00040000-560a-74d7-82c1-4c6aed93d3e0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-560a-74d7-6c27-2fc847e56571	GD	GRD	308	Grenada 	Grenada	\N
00040000-560a-74d7-d746-7e3a1521f3e4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-560a-74d7-a7cb-baae555b05e1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-560a-74d7-41f4-c55b0da5fc2d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-560a-74d7-60a7-19275bac9665	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-560a-74d7-b603-14dc799a5824	GN	GIN	324	Guinea 	Gvineja	\N
00040000-560a-74d7-41bd-4d0c282ca8ba	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-560a-74d7-71f4-2b0b2bc7d97a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-560a-74d7-eabc-82fed84a2dc4	HT	HTI	332	Haiti 	Haiti	\N
00040000-560a-74d7-6e5d-44ea8224f9de	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-560a-74d7-1126-c7dca338f5e3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-560a-74d7-2e09-54c211539ad2	HN	HND	340	Honduras 	Honduras	\N
00040000-560a-74d7-0883-e14a1b80d217	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-560a-74d7-1ce9-b31ba99395b5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-560a-74d7-4a21-edb2014ecc1c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-560a-74d7-12c8-7e7fb43ac5bf	IN	IND	356	India 	Indija	\N
00040000-560a-74d7-83dc-9f88f77d57f9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-560a-74d7-2d14-1c1c33557729	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-560a-74d7-5749-645ba6e50463	IQ	IRQ	368	Iraq 	Irak	\N
00040000-560a-74d7-3ecd-a859750ab81d	IE	IRL	372	Ireland 	Irska	\N
00040000-560a-74d7-ad33-79d567545a63	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-560a-74d7-b3c4-e10ff0af16c0	IL	ISR	376	Israel 	Izrael	\N
00040000-560a-74d7-8cb7-2920a11761b1	IT	ITA	380	Italy 	Italija	\N
00040000-560a-74d7-c089-a0d5466d326e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-560a-74d7-faf9-b4233d221b9c	JP	JPN	392	Japan 	Japonska	\N
00040000-560a-74d7-4573-0c9fa2507fe6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-560a-74d7-1840-2ca7a990d8c1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-560a-74d7-dd2c-e08785dbeb91	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-560a-74d7-e529-dbf65e1c8e0e	KE	KEN	404	Kenya 	Kenija	\N
00040000-560a-74d7-0a19-0f63ddd24666	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-560a-74d7-01cd-f8f875b29f61	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-560a-74d7-2b59-5eea487f9a30	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-560a-74d7-9ae4-778b7d240f50	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-560a-74d7-1f27-167e91150474	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-560a-74d7-c9e4-c52c086658e8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-560a-74d7-c2dc-e771684c907e	LV	LVA	428	Latvia 	Latvija	\N
00040000-560a-74d7-0f1d-bf7006b139ab	LB	LBN	422	Lebanon 	Libanon	\N
00040000-560a-74d7-2eea-cb313013742e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-560a-74d7-f888-c40439805820	LR	LBR	430	Liberia 	Liberija	\N
00040000-560a-74d7-2765-81372723676a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-560a-74d7-ee93-8b22ff288bb5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-560a-74d7-0adf-83003038759d	LT	LTU	440	Lithuania 	Litva	\N
00040000-560a-74d7-54ec-e7290cb9b5dc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-560a-74d7-25a6-e68c9f03261f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-560a-74d7-fc94-a51161eb7c6f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-560a-74d7-b120-34eeb77e35c7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-560a-74d7-a45f-75b8a6d9fd91	MW	MWI	454	Malawi 	Malavi	\N
00040000-560a-74d7-6296-c1221960e027	MY	MYS	458	Malaysia 	Malezija	\N
00040000-560a-74d7-6c60-e7aa8a7b49c1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-560a-74d7-2230-572b063a2483	ML	MLI	466	Mali 	Mali	\N
00040000-560a-74d7-e7e1-e3f09fb22888	MT	MLT	470	Malta 	Malta	\N
00040000-560a-74d7-cfc6-a2425e3b4633	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-560a-74d7-c05d-2b0c611edbb3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-560a-74d7-7b6f-1e14e85312eb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-560a-74d7-e4e6-f1a18e70a456	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-560a-74d7-0fb2-8bc6054d2535	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-560a-74d7-b42b-bfcc6c2d63f8	MX	MEX	484	Mexico 	Mehika	\N
00040000-560a-74d7-add1-fa9370cede67	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-560a-74d7-ac5f-f67a97abe9f8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-560a-74d7-af61-370c14b7ab29	MC	MCO	492	Monaco 	Monako	\N
00040000-560a-74d7-813e-ea26eaa27103	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-560a-74d7-d2e4-0ef203f28b43	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-560a-74d7-446c-e185b38e0f90	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-560a-74d7-8fe9-7af5f2674e0a	MA	MAR	504	Morocco 	Maroko	\N
00040000-560a-74d7-bea3-0ad501047db4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-560a-74d7-2621-3638c26844a5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-560a-74d7-249c-5618538409f5	NA	NAM	516	Namibia 	Namibija	\N
00040000-560a-74d7-3dc6-6bd892ccca31	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-560a-74d7-c056-ee42baabe6ad	NP	NPL	524	Nepal 	Nepal	\N
00040000-560a-74d7-46cb-9d46d1dcabd2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-560a-74d7-2b98-bb539d733e3c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-560a-74d7-3c9a-3c990577d2ba	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-560a-74d7-4595-5f0eea29e78e	NE	NER	562	Niger 	Niger 	\N
00040000-560a-74d7-b881-a9ee92d59011	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-560a-74d7-6f95-76a1a9f8f3cd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-560a-74d7-119e-231b16ca23cc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-560a-74d7-3a89-655a19ee77cc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-560a-74d7-7bdf-c735c0579c62	NO	NOR	578	Norway 	Norveška	\N
00040000-560a-74d7-7323-e6c7167fb1e2	OM	OMN	512	Oman 	Oman	\N
00040000-560a-74d7-0017-f7fbb00e3941	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-560a-74d7-8632-9800c27b7319	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-560a-74d7-6894-c9606d4dfe2a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-560a-74d7-1056-638a8a9cfcdb	PA	PAN	591	Panama 	Panama	\N
00040000-560a-74d7-29ef-f33428aa8c85	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-560a-74d7-756f-29c02d9ebcf1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-560a-74d7-1eb7-3c75856dfe84	PE	PER	604	Peru 	Peru	\N
00040000-560a-74d7-3c04-92823e0c679a	PH	PHL	608	Philippines 	Filipini	\N
00040000-560a-74d7-55c0-2e8db121c6c1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-560a-74d7-43e7-8b7ff3d4fa44	PL	POL	616	Poland 	Poljska	\N
00040000-560a-74d7-9836-87b93a5b3a19	PT	PRT	620	Portugal 	Portugalska	\N
00040000-560a-74d7-08bc-1b6cbfd6538b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-560a-74d7-3c9b-664961685873	QA	QAT	634	Qatar 	Katar	\N
00040000-560a-74d7-e677-163262a6ec7f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-560a-74d7-9f15-098ec291e3b8	RO	ROU	642	Romania 	Romunija	\N
00040000-560a-74d7-66ae-2ed7c3b97502	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-560a-74d7-4898-cac999cdcac8	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-560a-74d7-54a7-4f744596f71f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-560a-74d7-203a-03cb225f2776	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-560a-74d7-7b31-44979659c148	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-560a-74d7-1993-fd42e6cd68c8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-560a-74d7-77df-b1d7533da09a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-560a-74d7-a4f0-b8abad4fbd30	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-560a-74d7-a000-75f572edb8b9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-560a-74d7-cdb4-2f61f8d27e60	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-560a-74d7-96ff-aae77e25fbc6	SM	SMR	674	San Marino 	San Marino	\N
00040000-560a-74d7-5b41-78c36983d81e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-560a-74d7-2113-1a68c5b9b488	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-560a-74d7-0d5f-20b26e4695aa	SN	SEN	686	Senegal 	Senegal	\N
00040000-560a-74d7-1ed7-6fc9e5ada662	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-560a-74d7-de63-a343c3777a5c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-560a-74d7-0801-fae6c6258e73	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-560a-74d7-d44f-f09c3552f316	SG	SGP	702	Singapore 	Singapur	\N
00040000-560a-74d7-03c0-140a010d80b9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-560a-74d7-8b43-c48104955b27	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-560a-74d7-7353-84af34156b77	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-560a-74d7-87e5-c87b9aa24979	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-560a-74d7-9777-4fe454128700	SO	SOM	706	Somalia 	Somalija	\N
00040000-560a-74d7-9389-e24925ab87d2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-560a-74d7-52de-78201a36e0fe	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-560a-74d7-c035-71a884a5c1c9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-560a-74d7-6c6c-c52466c52017	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-560a-74d7-92de-a0b9766a41bd	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-560a-74d7-cfc7-20bc89cc336c	SD	SDN	729	Sudan 	Sudan	\N
00040000-560a-74d7-d0a4-ffb16e6a1689	SR	SUR	740	Suriname 	Surinam	\N
00040000-560a-74d7-019c-77a52d659c91	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-560a-74d7-032c-408763ceb064	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-560a-74d7-25da-f40447728a06	SE	SWE	752	Sweden 	Švedska	\N
00040000-560a-74d7-81df-66e16dcb3998	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-560a-74d7-31ee-0208c654536e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-560a-74d7-9628-b123593b5707	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-560a-74d7-144c-d226c580a140	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-560a-74d7-1d88-34514da25a0b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-560a-74d7-6240-b86070278d22	TH	THA	764	Thailand 	Tajska	\N
00040000-560a-74d7-df5e-fbc3cc9a578f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-560a-74d7-d2f2-e5fc38151316	TG	TGO	768	Togo 	Togo	\N
00040000-560a-74d7-6c28-72ee9db92e44	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-560a-74d7-5493-36d95b195432	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-560a-74d7-c500-9b2cba489a9c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-560a-74d7-e00d-8ea3e68dffa7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-560a-74d7-d955-b9b6a2aeced0	TR	TUR	792	Turkey 	Turčija	\N
00040000-560a-74d7-54da-f3e5d2cbd834	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-560a-74d7-cb39-a2711a310f93	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-74d7-ab68-00f78f692e42	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-560a-74d7-8c68-3d38e6ac546c	UG	UGA	800	Uganda 	Uganda	\N
00040000-560a-74d7-d8fb-6d0c2129cb00	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-560a-74d7-ff39-9e789a4ce72d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-560a-74d7-91f0-e1513d083f5c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-560a-74d7-0c59-2e9d3d317ee0	US	USA	840	United States 	Združene države Amerike	\N
00040000-560a-74d7-a6a7-790890a79c35	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-560a-74d7-af0e-05547e7feed7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-560a-74d7-5dca-5ad0e7fcbe7e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-560a-74d7-dd52-101774118b38	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-560a-74d7-3c3d-1af64777323c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-560a-74d7-e1b7-48f219330d0b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-560a-74d7-2581-946acf89d113	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-74d7-a7d4-0417dc504002	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-560a-74d7-ef68-ebcc5f7194ac	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-560a-74d7-539c-daab75b06f9a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-560a-74d7-64b4-e35fea80458a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-560a-74d7-0f80-81dfb89089dc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-560a-74d7-7cf2-8a6346cb7424	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3026 (class 0 OID 21034084)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-560a-74d9-3f26-9787bf4a02c7	000e0000-560a-74d9-e84a-9db66e52d444	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-74d7-2608-6bbe9fdfeb2c	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-74d9-b489-48f7ce36fdad	000e0000-560a-74d9-3306-f347178845eb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-74d7-04bd-1f282bd0801b	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-74d9-e9ff-7f28e182cf0d	000e0000-560a-74d9-8072-dbede5b6c500	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-74d7-2608-6bbe9fdfeb2c	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-74d9-b830-e926f8d33ab5	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-74d9-c909-e12c7a1df628	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 21033886)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-560a-74d9-83e4-08eb7b69c535	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-8425-6d92134fd29b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-74d7-e151-67d4b37f5110
000d0000-560a-74d9-7bf5-ae8efc4daf35	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-33cd-c6ce9ff24224	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-560a-74d7-b684-2df23eeaffa7
000d0000-560a-74d9-a6fe-669a871dbef9	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-0a92-a6b26d6c3161	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-560a-74d7-e57f-c385c280c52b
000d0000-560a-74d9-2a66-3380b489dec9	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-2a84-29c1c953862d	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-560a-74d7-a92c-328adf6fe169
000d0000-560a-74d9-b9a5-8211bc7b5296	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-b137-3b6471594cac	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-560a-74d7-a92c-328adf6fe169
000d0000-560a-74d9-74c4-0b053aa91171	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-dfcf-fd8141951d76	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-74d7-e151-67d4b37f5110
000d0000-560a-74d9-c4ee-10bd5778df95	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-dde2-b891f957ed8d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-560a-74d7-e151-67d4b37f5110
000d0000-560a-74d9-b7a7-bed80c12c171	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-2cf7-5a2031fb6ecf	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-560a-74d7-13da-6e6e24f5d34a
000d0000-560a-74d9-2b93-760aa750c31c	000e0000-560a-74d9-3306-f347178845eb	000c0000-560a-74d9-5e35-ad11799fb519	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-560a-74d7-8338-12c4f4ef5676
\.


--
-- TOC entry 2991 (class 0 OID 21033701)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21033675)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21033652)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-560a-74d9-80cb-044a850c4eb5	00080000-560a-74d9-b9cb-90b8f7cdbe6d	00090000-560a-74d9-09d6-15318cc6c135	AK		igralka
\.


--
-- TOC entry 3000 (class 0 OID 21033800)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21034294)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21034306)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21034328)
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
-- TOC entry 3004 (class 0 OID 21033825)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21033609)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-560a-74d7-cb20-a9dbfd36bf46	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-560a-74d7-c3a3-7c951acec8bf	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-560a-74d7-242d-d4c0c23e78ce	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-560a-74d7-396e-4542f04d62ab	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-560a-74d7-3c43-5d554b9bbebb	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-560a-74d7-4af2-3d6bc174e24f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-560a-74d7-d031-a2cb6d0afbe2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-560a-74d7-9b6e-621e7b83a8a7	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-74d7-3ca5-b9a3e7aa545f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-74d7-a244-d6f8d77a44c6	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-560a-74d7-6a2c-9e408b95630d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-560a-74d7-1204-6da550ef1c7d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-560a-74d7-83bb-7f13c445ddfc	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-560a-74d7-b46d-de3ca6a30dc6	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-560a-74d7-ec6f-ba32ee2f1183	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-560a-74d9-9569-8d60dd61e8b4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-560a-74d9-8666-8d7a2a1e375f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-560a-74d9-76eb-9daf45a7d6fa	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-560a-74d9-c371-f16f283eea7d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-560a-74d9-393c-a7cf28f021ab	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-560a-74da-c92b-58ad1a04c1a1	application.tenant.maticnopodjetje	string	s:36:"00080000-560a-74da-3619-5f612d4b8b6b";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2978 (class 0 OID 21033523)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-560a-74d9-5718-69e86e460eb1	00000000-560a-74d9-9569-8d60dd61e8b4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-560a-74d9-2f61-0b9f14836bd0	00000000-560a-74d9-9569-8d60dd61e8b4	00010000-560a-74d7-ca7b-580b63d17ce1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-560a-74d9-b294-fc72bb76cfe2	00000000-560a-74d9-8666-8d7a2a1e375f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2979 (class 0 OID 21033534)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-560a-74d9-e005-3f11e511b1f2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-560a-74d9-1073-8a6ffbee6c13	00010000-560a-74d9-4a55-9f9826cb5359	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-560a-74d9-94ce-7ea621f9bce7	00010000-560a-74d9-9c7e-4f3f73210137	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-560a-74d9-36ec-2471c1e0bd76	00010000-560a-74d9-aeda-d59a8a49f679	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-560a-74d9-a9c1-f68d5eb8df59	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-560a-74d9-117e-68e00edbf7b2	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-560a-74d9-4e7f-060f9d513f38	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-560a-74d9-2d1f-1169578b20e9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-560a-74d9-09d6-15318cc6c135	00010000-560a-74d9-862d-a116978910bb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-560a-74d9-bb1f-a923153579cd	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-560a-74d9-3eb3-1c26ce120f7f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-74d9-14ea-40307f822d54	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-560a-74d9-cd80-b9cabf0cdc57	00010000-560a-74d9-57cc-3625f5472c1c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-74d9-93f7-c1bc54aeeac8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-74d9-abae-3ef240f4e6e2	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-74d9-54b4-a10bba10ed48	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-74d9-dfe7-fd38c2a653b5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-560a-74d9-c4cb-3b7d7ffea17b	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 21033488)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-560a-74d7-8146-76470c835002	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-560a-74d7-830d-22ccbeffb442	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-560a-74d7-b010-5a66225c3b3b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-560a-74d7-5a58-2f1769c6e631	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-560a-74d7-fff6-222cc1877c3c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-560a-74d7-6896-7aafc7587c7c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-560a-74d7-48c2-99a38d12df41	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-560a-74d7-456b-e430aef8bc64	Abonma-read	Abonma - branje	f
00030000-560a-74d7-8bee-cc2ebad37c66	Abonma-write	Abonma - spreminjanje	f
00030000-560a-74d7-d018-f86438b86df0	Alternacija-read	Alternacija - branje	f
00030000-560a-74d7-0514-64e1814aa08d	Alternacija-write	Alternacija - spreminjanje	f
00030000-560a-74d7-5095-6fe6ab6d2eaf	Arhivalija-read	Arhivalija - branje	f
00030000-560a-74d7-260c-20aad85b7874	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-560a-74d7-d0eb-b9d735b0f390	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-560a-74d7-30be-c30cb0584753	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-560a-74d7-e364-16f875240f27	Besedilo-read	Besedilo - branje	f
00030000-560a-74d7-b8a1-eeeac40119fb	Besedilo-write	Besedilo - spreminjanje	f
00030000-560a-74d7-73e6-39e888baee77	DogodekIzven-read	DogodekIzven - branje	f
00030000-560a-74d7-4f3a-d450b9719b21	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-560a-74d7-028b-7b757980b9f1	Dogodek-read	Dogodek - branje	f
00030000-560a-74d7-7ba4-831ca84e1b40	Dogodek-write	Dogodek - spreminjanje	f
00030000-560a-74d7-615e-6bc4118c796e	DrugiVir-read	DrugiVir - branje	f
00030000-560a-74d7-686d-44a2939b3f94	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-560a-74d7-b3bd-2d0fe3b62bd9	Drzava-read	Drzava - branje	f
00030000-560a-74d7-28fa-f303a2492665	Drzava-write	Drzava - spreminjanje	f
00030000-560a-74d7-2316-e2cf2e62e106	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-560a-74d7-8d16-77d6f0ff1c96	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-560a-74d7-a6ba-26dd922ec393	Funkcija-read	Funkcija - branje	f
00030000-560a-74d7-087a-30e7e2e33610	Funkcija-write	Funkcija - spreminjanje	f
00030000-560a-74d7-2b69-276a678ce516	Gostovanje-read	Gostovanje - branje	f
00030000-560a-74d7-91d0-276b5a4ffe01	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-560a-74d7-d985-5caefd16f15f	Gostujoca-read	Gostujoca - branje	f
00030000-560a-74d7-f898-95f28fdf191d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-560a-74d7-5d9d-01e922ea5f28	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-560a-74d7-1e61-cedea5241b63	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-560a-74d7-e727-d1a981929fd0	Kupec-read	Kupec - branje	f
00030000-560a-74d7-80d7-6bf1f2908e56	Kupec-write	Kupec - spreminjanje	f
00030000-560a-74d7-efb1-3218aa375b61	NacinPlacina-read	NacinPlacina - branje	f
00030000-560a-74d7-cc26-20f69dcad2e1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-560a-74d7-2cda-3b5b09fc4d80	Option-read	Option - branje	f
00030000-560a-74d7-65d4-c4fe24092ecf	Option-write	Option - spreminjanje	f
00030000-560a-74d7-43f6-321e0e0fd213	OptionValue-read	OptionValue - branje	f
00030000-560a-74d7-abd0-b55e2993be1e	OptionValue-write	OptionValue - spreminjanje	f
00030000-560a-74d7-30a6-4703b82e8949	Oseba-read	Oseba - branje	f
00030000-560a-74d7-d705-a95e16ba0397	Oseba-write	Oseba - spreminjanje	f
00030000-560a-74d7-5686-716d52dfbc2e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-560a-74d7-fdd6-76fe85b55598	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-560a-74d7-a818-b70b24f70b01	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-560a-74d7-0080-2c1d1d3b303e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-560a-74d7-39e1-2815e1a90835	Pogodba-read	Pogodba - branje	f
00030000-560a-74d7-7169-64243331f032	Pogodba-write	Pogodba - spreminjanje	f
00030000-560a-74d7-46f7-44c5c93b845b	Popa-read	Popa - branje	f
00030000-560a-74d7-0ef0-5770aae3dd49	Popa-write	Popa - spreminjanje	f
00030000-560a-74d7-e5e8-184582b2a9ba	Posta-read	Posta - branje	f
00030000-560a-74d7-ae53-6cb2ea460514	Posta-write	Posta - spreminjanje	f
00030000-560a-74d7-bf76-10c97d035881	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-560a-74d7-aca9-98debfb141e8	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-560a-74d7-aa5f-cab3d04a7451	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-560a-74d7-d3e4-d4c523f4b1f1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-560a-74d7-74ee-9210790f932d	PostniNaslov-read	PostniNaslov - branje	f
00030000-560a-74d7-e561-79e32ea7a849	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-560a-74d7-dc7c-34c8ff3857ec	Predstava-read	Predstava - branje	f
00030000-560a-74d7-cd95-ffbe503ec99f	Predstava-write	Predstava - spreminjanje	f
00030000-560a-74d7-a190-09e9a539958e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-560a-74d7-2650-514ac692b724	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-560a-74d7-fe3d-38cc50cf78e0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-560a-74d7-3170-b2b3def74f18	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-560a-74d7-dde2-37588b6080f7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-560a-74d7-399e-6baafb681512	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-560a-74d7-afbd-ab8885db7ed6	ProgramDela-read	ProgramDela - branje	f
00030000-560a-74d7-f2fa-8733025ff205	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-560a-74d7-43e5-3940ed9d5080	ProgramFestival-read	ProgramFestival - branje	f
00030000-560a-74d7-ca5d-306201706ed8	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-560a-74d7-f093-b6be012fd5bf	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-560a-74d7-abb8-6687a04966b9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-560a-74d7-4810-50e93c5e0474	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-560a-74d7-46f7-c4c1df53338a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-560a-74d7-9b29-4acf19a8a69c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-560a-74d7-1c6b-db0010fc6647	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-560a-74d7-4041-4bdf50091633	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-560a-74d7-0dd9-0f6f5bcab68e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-560a-74d7-1f74-f39e7c9d63e8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-560a-74d7-2f6f-ff30eb7bf0f7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-560a-74d7-e1a9-80beff85d93e	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-560a-74d7-f876-ff036e2e53c1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-560a-74d7-c943-0fda627fbfb4	ProgramRazno-read	ProgramRazno - branje	f
00030000-560a-74d7-e200-97a325474a72	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-560a-74d7-255b-36a5afa0fe7c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-560a-74d7-4f3d-9a9c6feb01d4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-560a-74d7-e92a-ce89f344dd4a	Prostor-read	Prostor - branje	f
00030000-560a-74d7-e8a7-e6be71e341ec	Prostor-write	Prostor - spreminjanje	f
00030000-560a-74d7-ff07-59a7831d5368	Racun-read	Racun - branje	f
00030000-560a-74d7-2589-436459820c76	Racun-write	Racun - spreminjanje	f
00030000-560a-74d7-b438-4ad206c834e3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-560a-74d7-baef-ae75f013c756	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-560a-74d7-945f-1b07435052b1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-560a-74d7-3b0a-8f3ea93767b8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-560a-74d7-2aba-81b955892fb1	Rekvizit-read	Rekvizit - branje	f
00030000-560a-74d7-524a-895f0698d539	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-560a-74d7-2241-9499ce2a19b1	Revizija-read	Revizija - branje	f
00030000-560a-74d7-ab15-d6283518f45c	Revizija-write	Revizija - spreminjanje	f
00030000-560a-74d7-7f01-ba40863bb1b7	Rezervacija-read	Rezervacija - branje	f
00030000-560a-74d7-d4ee-836525d692c8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-560a-74d7-2550-7caaac5f924d	SedezniRed-read	SedezniRed - branje	f
00030000-560a-74d7-7c0e-de81cbe3f43e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-560a-74d7-f75c-aff29d3834ab	Sedez-read	Sedez - branje	f
00030000-560a-74d7-6e54-9fae19a064a0	Sedez-write	Sedez - spreminjanje	f
00030000-560a-74d7-8d17-7a01ad8b7bee	Sezona-read	Sezona - branje	f
00030000-560a-74d7-77ef-5a185dbca517	Sezona-write	Sezona - spreminjanje	f
00030000-560a-74d7-3beb-0e1a197c965f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-560a-74d7-e29e-750955677e05	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-560a-74d7-5ed7-af8453ec5024	Stevilcenje-read	Stevilcenje - branje	f
00030000-560a-74d7-a63d-d333e748341e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-560a-74d7-50b8-327cacd17d16	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-560a-74d7-f9bb-f996842e4a16	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-560a-74d7-da5a-e19692fae687	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-560a-74d7-a7b5-dff5b206e504	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-560a-74d7-9aa5-f44136f533cb	Telefonska-read	Telefonska - branje	f
00030000-560a-74d7-b778-a6d755d15ed3	Telefonska-write	Telefonska - spreminjanje	f
00030000-560a-74d7-1282-49a86a8135e5	TerminStoritve-read	TerminStoritve - branje	f
00030000-560a-74d7-0340-c56b9700bc2e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-560a-74d7-7077-af4a30476a37	TipFunkcije-read	TipFunkcije - branje	f
00030000-560a-74d7-4223-652745b3b4c4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-560a-74d7-778d-8fc51bb3bf2f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-560a-74d7-1487-0b58c0500aef	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-560a-74d7-6ea7-602f309affb4	Trr-read	Trr - branje	f
00030000-560a-74d7-db34-b3849b4e27ab	Trr-write	Trr - spreminjanje	f
00030000-560a-74d7-048f-27d62b2c802c	Uprizoritev-read	Uprizoritev - branje	f
00030000-560a-74d7-63c8-9a1be4f393c9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-560a-74d7-71dd-ade050693e60	Vaja-read	Vaja - branje	f
00030000-560a-74d7-4875-13d0e5117f45	Vaja-write	Vaja - spreminjanje	f
00030000-560a-74d7-cd57-b65119565eed	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-560a-74d7-fc0a-c309f88241a0	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-560a-74d7-882c-c2e7be0072e6	VrstaStroska-read	VrstaStroska - branje	f
00030000-560a-74d7-3e0b-4f2a86943f91	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-560a-74d7-9bc5-1a661455463e	Zaposlitev-read	Zaposlitev - branje	f
00030000-560a-74d7-2ee8-91653f8df668	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-560a-74d7-5c71-cc1c5f37370d	Zasedenost-read	Zasedenost - branje	f
00030000-560a-74d7-29ca-272764e25ab6	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-560a-74d7-59f2-71339bf85204	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-560a-74d7-74e5-178765048e10	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-560a-74d7-0dc6-d40f329f475b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-560a-74d7-56bf-4e6019b15050	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-560a-74d7-2657-5c2495ff807a	Job-read	Branje opravil - samo zase - branje	f
00030000-560a-74d7-412f-82c92c47e100	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-560a-74d7-73ec-493c1258c64d	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-560a-74d7-ea86-4df225aa64c0	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-560a-74d7-8fab-0d58e9486797	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-560a-74d7-2f6d-b3166c930ec5	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-560a-74d7-cee8-4bc0db3d4ad6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-560a-74d7-f92a-e120f91b88e6	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-74d7-f58d-4a23f9e0fd38	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-74d7-28d4-20a0bbce64a5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-74d7-2f7e-441f76937f34	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-74d7-9b2e-cb2395f9939e	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-560a-74d7-7f49-74f078dbda87	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-560a-74d7-5784-91caa0abe1f8	Datoteka-write	Datoteka - spreminjanje	f
00030000-560a-74d7-f83f-fc629348ef03	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2976 (class 0 OID 21033507)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-560a-74d7-03d0-b4ea80ffa898	00030000-560a-74d7-830d-22ccbeffb442
00020000-560a-74d7-1bde-f684ace28412	00030000-560a-74d7-b3bd-2d0fe3b62bd9
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-456b-e430aef8bc64
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-8bee-cc2ebad37c66
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-d018-f86438b86df0
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-0514-64e1814aa08d
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-5095-6fe6ab6d2eaf
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-028b-7b757980b9f1
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-5a58-2f1769c6e631
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-7ba4-831ca84e1b40
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-b3bd-2d0fe3b62bd9
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-28fa-f303a2492665
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-a6ba-26dd922ec393
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-087a-30e7e2e33610
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-2b69-276a678ce516
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-91d0-276b5a4ffe01
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-d985-5caefd16f15f
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-f898-95f28fdf191d
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-5d9d-01e922ea5f28
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-1e61-cedea5241b63
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-2cda-3b5b09fc4d80
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-43f6-321e0e0fd213
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-30a6-4703b82e8949
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-d705-a95e16ba0397
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-46f7-44c5c93b845b
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-0ef0-5770aae3dd49
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-e5e8-184582b2a9ba
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-ae53-6cb2ea460514
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-74ee-9210790f932d
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-e561-79e32ea7a849
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-dc7c-34c8ff3857ec
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-cd95-ffbe503ec99f
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-dde2-37588b6080f7
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-399e-6baafb681512
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-e92a-ce89f344dd4a
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-e8a7-e6be71e341ec
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-945f-1b07435052b1
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-3b0a-8f3ea93767b8
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-2aba-81b955892fb1
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-524a-895f0698d539
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-8d17-7a01ad8b7bee
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-77ef-5a185dbca517
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-7077-af4a30476a37
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-048f-27d62b2c802c
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-63c8-9a1be4f393c9
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-71dd-ade050693e60
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-4875-13d0e5117f45
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-5c71-cc1c5f37370d
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-29ca-272764e25ab6
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-59f2-71339bf85204
00020000-560a-74d7-1e62-c79e47740528	00030000-560a-74d7-0dc6-d40f329f475b
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-456b-e430aef8bc64
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-5095-6fe6ab6d2eaf
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-028b-7b757980b9f1
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-b3bd-2d0fe3b62bd9
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-2b69-276a678ce516
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-d985-5caefd16f15f
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-5d9d-01e922ea5f28
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-1e61-cedea5241b63
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-2cda-3b5b09fc4d80
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-43f6-321e0e0fd213
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-30a6-4703b82e8949
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-d705-a95e16ba0397
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-46f7-44c5c93b845b
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-e5e8-184582b2a9ba
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-74ee-9210790f932d
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-e561-79e32ea7a849
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-dc7c-34c8ff3857ec
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-e92a-ce89f344dd4a
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-945f-1b07435052b1
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-2aba-81b955892fb1
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-8d17-7a01ad8b7bee
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-9aa5-f44136f533cb
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-b778-a6d755d15ed3
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-6ea7-602f309affb4
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-db34-b3849b4e27ab
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-9bc5-1a661455463e
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-2ee8-91653f8df668
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-59f2-71339bf85204
00020000-560a-74d7-25b5-467af649c882	00030000-560a-74d7-0dc6-d40f329f475b
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-456b-e430aef8bc64
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-d018-f86438b86df0
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-5095-6fe6ab6d2eaf
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-260c-20aad85b7874
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-e364-16f875240f27
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-73e6-39e888baee77
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-028b-7b757980b9f1
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-b3bd-2d0fe3b62bd9
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-a6ba-26dd922ec393
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-2b69-276a678ce516
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-d985-5caefd16f15f
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-5d9d-01e922ea5f28
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-2cda-3b5b09fc4d80
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-43f6-321e0e0fd213
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-30a6-4703b82e8949
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-46f7-44c5c93b845b
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-e5e8-184582b2a9ba
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-dc7c-34c8ff3857ec
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-dde2-37588b6080f7
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-e92a-ce89f344dd4a
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-945f-1b07435052b1
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-2aba-81b955892fb1
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-8d17-7a01ad8b7bee
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-7077-af4a30476a37
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-71dd-ade050693e60
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-5c71-cc1c5f37370d
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-59f2-71339bf85204
00020000-560a-74d7-60f7-4bbe506dfa23	00030000-560a-74d7-0dc6-d40f329f475b
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-456b-e430aef8bc64
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-8bee-cc2ebad37c66
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-0514-64e1814aa08d
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-5095-6fe6ab6d2eaf
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-028b-7b757980b9f1
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-b3bd-2d0fe3b62bd9
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-2b69-276a678ce516
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-d985-5caefd16f15f
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-2cda-3b5b09fc4d80
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-43f6-321e0e0fd213
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-46f7-44c5c93b845b
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-e5e8-184582b2a9ba
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-dc7c-34c8ff3857ec
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-e92a-ce89f344dd4a
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-945f-1b07435052b1
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-2aba-81b955892fb1
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-8d17-7a01ad8b7bee
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-7077-af4a30476a37
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-59f2-71339bf85204
00020000-560a-74d7-c1a9-0089bd6aaad8	00030000-560a-74d7-0dc6-d40f329f475b
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-456b-e430aef8bc64
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-5095-6fe6ab6d2eaf
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-028b-7b757980b9f1
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-b3bd-2d0fe3b62bd9
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-2b69-276a678ce516
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-d985-5caefd16f15f
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-2cda-3b5b09fc4d80
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-43f6-321e0e0fd213
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-46f7-44c5c93b845b
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-e5e8-184582b2a9ba
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-dc7c-34c8ff3857ec
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-e92a-ce89f344dd4a
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-945f-1b07435052b1
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-2aba-81b955892fb1
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-8d17-7a01ad8b7bee
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-1282-49a86a8135e5
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-b010-5a66225c3b3b
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-7077-af4a30476a37
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-59f2-71339bf85204
00020000-560a-74d7-0b3d-556e48c8bb1d	00030000-560a-74d7-0dc6-d40f329f475b
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-8146-76470c835002
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-830d-22ccbeffb442
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-b010-5a66225c3b3b
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-5a58-2f1769c6e631
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-fff6-222cc1877c3c
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-6896-7aafc7587c7c
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-48c2-99a38d12df41
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-456b-e430aef8bc64
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-8bee-cc2ebad37c66
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-d018-f86438b86df0
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-0514-64e1814aa08d
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-5095-6fe6ab6d2eaf
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-260c-20aad85b7874
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e364-16f875240f27
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-b8a1-eeeac40119fb
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-73e6-39e888baee77
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-4f3a-d450b9719b21
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-028b-7b757980b9f1
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-7ba4-831ca84e1b40
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-b3bd-2d0fe3b62bd9
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-28fa-f303a2492665
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-615e-6bc4118c796e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-686d-44a2939b3f94
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2316-e2cf2e62e106
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-8d16-77d6f0ff1c96
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-a6ba-26dd922ec393
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-087a-30e7e2e33610
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2b69-276a678ce516
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-91d0-276b5a4ffe01
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-d985-5caefd16f15f
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-f898-95f28fdf191d
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-5d9d-01e922ea5f28
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-1e61-cedea5241b63
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e727-d1a981929fd0
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-80d7-6bf1f2908e56
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-efb1-3218aa375b61
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-cc26-20f69dcad2e1
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2cda-3b5b09fc4d80
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-65d4-c4fe24092ecf
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-43f6-321e0e0fd213
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-abd0-b55e2993be1e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-30a6-4703b82e8949
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-d705-a95e16ba0397
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-5686-716d52dfbc2e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-fdd6-76fe85b55598
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-a818-b70b24f70b01
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-0080-2c1d1d3b303e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-39e1-2815e1a90835
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-7169-64243331f032
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-46f7-44c5c93b845b
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-0ef0-5770aae3dd49
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e5e8-184582b2a9ba
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-ae53-6cb2ea460514
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-bf76-10c97d035881
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-aca9-98debfb141e8
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-aa5f-cab3d04a7451
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-d3e4-d4c523f4b1f1
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-74ee-9210790f932d
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e561-79e32ea7a849
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-dc7c-34c8ff3857ec
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-cd95-ffbe503ec99f
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-a190-09e9a539958e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2650-514ac692b724
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-fe3d-38cc50cf78e0
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-3170-b2b3def74f18
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-dde2-37588b6080f7
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-399e-6baafb681512
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-afbd-ab8885db7ed6
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-f2fa-8733025ff205
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-43e5-3940ed9d5080
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-ca5d-306201706ed8
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-f093-b6be012fd5bf
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-abb8-6687a04966b9
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-4810-50e93c5e0474
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-46f7-c4c1df53338a
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-9b29-4acf19a8a69c
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-1c6b-db0010fc6647
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-4041-4bdf50091633
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-0dd9-0f6f5bcab68e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-1f74-f39e7c9d63e8
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2f6f-ff30eb7bf0f7
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e1a9-80beff85d93e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-f876-ff036e2e53c1
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-c943-0fda627fbfb4
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e200-97a325474a72
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-255b-36a5afa0fe7c
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-4f3d-9a9c6feb01d4
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e92a-ce89f344dd4a
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e8a7-e6be71e341ec
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-ff07-59a7831d5368
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2589-436459820c76
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-b438-4ad206c834e3
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-baef-ae75f013c756
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-945f-1b07435052b1
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-3b0a-8f3ea93767b8
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2aba-81b955892fb1
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-524a-895f0698d539
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2241-9499ce2a19b1
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-ab15-d6283518f45c
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-7f01-ba40863bb1b7
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-d4ee-836525d692c8
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2550-7caaac5f924d
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-7c0e-de81cbe3f43e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-f75c-aff29d3834ab
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-6e54-9fae19a064a0
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-8d17-7a01ad8b7bee
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-77ef-5a185dbca517
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-3beb-0e1a197c965f
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-e29e-750955677e05
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-5ed7-af8453ec5024
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-a63d-d333e748341e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-50b8-327cacd17d16
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-f9bb-f996842e4a16
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-da5a-e19692fae687
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-a7b5-dff5b206e504
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-9aa5-f44136f533cb
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-b778-a6d755d15ed3
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-1282-49a86a8135e5
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-0340-c56b9700bc2e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-7077-af4a30476a37
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-4223-652745b3b4c4
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-778d-8fc51bb3bf2f
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-1487-0b58c0500aef
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-6ea7-602f309affb4
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-db34-b3849b4e27ab
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-048f-27d62b2c802c
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-63c8-9a1be4f393c9
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-71dd-ade050693e60
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-4875-13d0e5117f45
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-cd57-b65119565eed
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-fc0a-c309f88241a0
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-882c-c2e7be0072e6
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-3e0b-4f2a86943f91
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-9bc5-1a661455463e
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-2ee8-91653f8df668
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-5c71-cc1c5f37370d
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-29ca-272764e25ab6
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-59f2-71339bf85204
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-74e5-178765048e10
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-0dc6-d40f329f475b
00020000-560a-74d9-15de-2b07647193a6	00030000-560a-74d7-56bf-4e6019b15050
\.


--
-- TOC entry 3005 (class 0 OID 21033832)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21033866)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 21034002)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-560a-74d9-bb10-958ab621eda8	00090000-560a-74d9-e005-3f11e511b1f2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-560a-74d9-0f1b-2057f5d931fe	00090000-560a-74d9-117e-68e00edbf7b2	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-560a-74d9-d0fe-6342d6beeb22	00090000-560a-74d9-cd80-b9cabf0cdc57	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-560a-74d9-8667-54b020f5888a	00090000-560a-74d9-bb1f-a923153579cd	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2981 (class 0 OID 21033567)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-560a-74d9-b9cb-90b8f7cdbe6d	00040000-560a-74d7-7353-84af34156b77	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74d9-0292-5f9011ac5bd8	00040000-560a-74d7-7353-84af34156b77	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-560a-74d9-9d55-f8871e97c5c7	00040000-560a-74d7-7353-84af34156b77	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74d9-7263-79aace9d48f7	00040000-560a-74d7-7353-84af34156b77	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74d9-fbdf-3a25993aedf7	00040000-560a-74d7-7353-84af34156b77	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74d9-21b4-34f7d32d7958	00040000-560a-74d7-0a3a-b945c53ba3c5	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74d9-645d-3069c29c9f5e	00040000-560a-74d7-c72c-9c8bda67b057	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74d9-2ed4-f9b8522f615c	00040000-560a-74d7-a042-b9d8cc9c090c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74d9-633a-402bc06452a3	00040000-560a-74d7-d58b-d6b41e80b3dc	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-74da-3619-5f612d4b8b6b	00040000-560a-74d7-7353-84af34156b77	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2983 (class 0 OID 21033601)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-560a-74d6-6519-a24f2ff2805f	8341	Adlešiči
00050000-560a-74d6-c28b-61a6688c800b	5270	Ajdovščina
00050000-560a-74d6-96b0-1ae90729f02e	6280	Ankaran/Ancarano
00050000-560a-74d6-ebf1-39d1be2ed55c	9253	Apače
00050000-560a-74d6-9a00-9e2c743ba8aa	8253	Artiče
00050000-560a-74d6-eba1-3b6bd83f0986	4275	Begunje na Gorenjskem
00050000-560a-74d6-0a39-cec025d979e6	1382	Begunje pri Cerknici
00050000-560a-74d6-c6b1-0eddb0a6409f	9231	Beltinci
00050000-560a-74d6-0c73-634839192e33	2234	Benedikt
00050000-560a-74d6-f8e4-b17cdc4357e1	2345	Bistrica ob Dravi
00050000-560a-74d6-478f-73674149e8ea	3256	Bistrica ob Sotli
00050000-560a-74d6-e4d2-e1bff8d46729	8259	Bizeljsko
00050000-560a-74d6-8125-b5f7f39d5f45	1223	Blagovica
00050000-560a-74d6-1a42-3ccfa7c13954	8283	Blanca
00050000-560a-74d6-a9f9-8d9fa6c8d601	4260	Bled
00050000-560a-74d6-7b50-4c547f9729aa	4273	Blejska Dobrava
00050000-560a-74d6-52d8-cd0f59dde561	9265	Bodonci
00050000-560a-74d6-faaa-6d3d22fda105	9222	Bogojina
00050000-560a-74d6-ca45-0fa43f49ee58	4263	Bohinjska Bela
00050000-560a-74d6-2701-6ea79461f84b	4264	Bohinjska Bistrica
00050000-560a-74d6-8657-10b4c3921005	4265	Bohinjsko jezero
00050000-560a-74d6-214b-ec1fa6397c73	1353	Borovnica
00050000-560a-74d6-1ce7-881dc55ad027	8294	Boštanj
00050000-560a-74d6-a102-a88696c7e430	5230	Bovec
00050000-560a-74d6-8b56-f7312c7e7bad	5295	Branik
00050000-560a-74d6-ed6b-fc96446df07c	3314	Braslovče
00050000-560a-74d6-f9d9-6a5cec4b151f	5223	Breginj
00050000-560a-74d6-9198-25e49beca082	8280	Brestanica
00050000-560a-74d6-586d-56fb78be72db	2354	Bresternica
00050000-560a-74d6-6640-0dee9470e20c	4243	Brezje
00050000-560a-74d6-145b-369673bd2e8e	1351	Brezovica pri Ljubljani
00050000-560a-74d6-7eea-0009cfb16449	8250	Brežice
00050000-560a-74d6-1ad7-d4de9e7cbbf0	4210	Brnik - Aerodrom
00050000-560a-74d6-b85b-4a7a6c378156	8321	Brusnice
00050000-560a-74d6-ea45-6d65cac214b5	3255	Buče
00050000-560a-74d6-c369-c706ba12ded5	8276	Bučka 
00050000-560a-74d6-09c6-72e1e9614984	9261	Cankova
00050000-560a-74d6-d881-1682f1de34fc	3000	Celje 
00050000-560a-74d6-8b79-88744bd31a6a	3001	Celje - poštni predali
00050000-560a-74d6-b108-c091c3420873	4207	Cerklje na Gorenjskem
00050000-560a-74d6-53b3-2db90e7b0e68	8263	Cerklje ob Krki
00050000-560a-74d6-32e1-3c3eebc454f0	1380	Cerknica
00050000-560a-74d6-f035-c0a9e8357172	5282	Cerkno
00050000-560a-74d6-c889-896e99c3f237	2236	Cerkvenjak
00050000-560a-74d6-a303-2f079008473d	2215	Ceršak
00050000-560a-74d6-348d-33fc8aa36399	2326	Cirkovce
00050000-560a-74d6-ed9b-8e9b6d722e48	2282	Cirkulane
00050000-560a-74d6-f2b0-94396b2403ad	5273	Col
00050000-560a-74d6-cfdd-7c81c0afb9a3	8251	Čatež ob Savi
00050000-560a-74d6-457c-b59cb81a629d	1413	Čemšenik
00050000-560a-74d6-7a7d-19a015b0dfbb	5253	Čepovan
00050000-560a-74d6-8225-354b4d97ba9f	9232	Črenšovci
00050000-560a-74d6-91d7-14b6ae929ab9	2393	Črna na Koroškem
00050000-560a-74d6-66be-cd9db3c13f91	6275	Črni Kal
00050000-560a-74d6-e63c-0609c63f533f	5274	Črni Vrh nad Idrijo
00050000-560a-74d6-d106-72def92fd445	5262	Črniče
00050000-560a-74d6-c39e-a26ba2e134e2	8340	Črnomelj
00050000-560a-74d6-c121-4d1380b3c86e	6271	Dekani
00050000-560a-74d6-6b5c-e0b7335b8b4b	5210	Deskle
00050000-560a-74d6-9794-b6ac9ce8aaa0	2253	Destrnik
00050000-560a-74d6-1516-86685cb0726e	6215	Divača
00050000-560a-74d6-3a3c-f060624e2f61	1233	Dob
00050000-560a-74d6-6386-523cc0865827	3224	Dobje pri Planini
00050000-560a-74d6-29d0-113b25ecb4bc	8257	Dobova
00050000-560a-74d6-0987-754a28ba6169	1423	Dobovec
00050000-560a-74d6-54e5-59e5e7914ea1	5263	Dobravlje
00050000-560a-74d6-5cdd-a54426462552	3204	Dobrna
00050000-560a-74d6-0684-d0864989d1b1	8211	Dobrnič
00050000-560a-74d6-2cad-55cef4c4454b	1356	Dobrova
00050000-560a-74d6-d14f-266182a79e59	9223	Dobrovnik/Dobronak 
00050000-560a-74d6-ce53-ce0c12601a7b	5212	Dobrovo v Brdih
00050000-560a-74d6-561a-dfe517c06055	1431	Dol pri Hrastniku
00050000-560a-74d6-8f76-f502c917b6d4	1262	Dol pri Ljubljani
00050000-560a-74d6-6b08-b6a38ac91367	1273	Dole pri Litiji
00050000-560a-74d6-323e-7a32a9f5dfb7	1331	Dolenja vas
00050000-560a-74d6-4999-4025f1ddad00	8350	Dolenjske Toplice
00050000-560a-74d6-219c-068ca30e4c1d	1230	Domžale
00050000-560a-74d6-a017-6244ab72ec75	2252	Dornava
00050000-560a-74d6-301d-ac1edf05e4ae	5294	Dornberk
00050000-560a-74d6-c490-7ca83d28bb90	1319	Draga
00050000-560a-74d6-9ae7-b64cca4a7743	8343	Dragatuš
00050000-560a-74d6-f787-aab621f764c1	3222	Dramlje
00050000-560a-74d6-0115-d3dd11f8e409	2370	Dravograd
00050000-560a-74d6-0eef-eb7d3f0d508a	4203	Duplje
00050000-560a-74d6-162b-62784261ee52	6221	Dutovlje
00050000-560a-74d6-a9c6-e62c0cf5b819	8361	Dvor
00050000-560a-74d6-0f73-a19cc3356ab4	2343	Fala
00050000-560a-74d6-43ad-ec2a71bb358f	9208	Fokovci
00050000-560a-74d6-4871-41614e92d4e1	2313	Fram
00050000-560a-74d6-ed12-965abaa3fe57	3213	Frankolovo
00050000-560a-74d6-f69d-f8cdf437955f	1274	Gabrovka
00050000-560a-74d6-7416-a58aed4b5023	8254	Globoko
00050000-560a-74d6-b036-fd9bcc343857	5275	Godovič
00050000-560a-74d6-4854-3c54782ec311	4204	Golnik
00050000-560a-74d6-d52a-9e233f8dd56c	3303	Gomilsko
00050000-560a-74d6-f617-eb896e14f1ee	4224	Gorenja vas
00050000-560a-74d6-627f-b63cae663538	3263	Gorica pri Slivnici
00050000-560a-74d6-e12d-a7242d470a2e	2272	Gorišnica
00050000-560a-74d6-ad7e-1d9d011417a9	9250	Gornja Radgona
00050000-560a-74d6-c0f3-01020aecfaef	3342	Gornji Grad
00050000-560a-74d6-2a3f-4c5cd7e8fd15	4282	Gozd Martuljek
00050000-560a-74d6-90c5-77379265373a	6272	Gračišče
00050000-560a-74d6-5edd-778862a6431c	9264	Grad
00050000-560a-74d6-f1a3-0a14a73f5956	8332	Gradac
00050000-560a-74d6-c2ca-d2cfe9515747	1384	Grahovo
00050000-560a-74d6-1cc6-f72785aa86fa	5242	Grahovo ob Bači
00050000-560a-74d6-1a05-e690221ba091	5251	Grgar
00050000-560a-74d6-ff8e-63514aa356c6	3302	Griže
00050000-560a-74d6-6475-6ab71a022bd4	3231	Grobelno
00050000-560a-74d6-f2b4-32488391135e	1290	Grosuplje
00050000-560a-74d6-04c6-983539645ee3	2288	Hajdina
00050000-560a-74d6-10f9-e40b164ac9a3	8362	Hinje
00050000-560a-74d6-12dc-ef3ab3b460c1	2311	Hoče
00050000-560a-74d6-caab-d31c687ddaa4	9205	Hodoš/Hodos
00050000-560a-74d6-efd1-52fe6b3fa91d	1354	Horjul
00050000-560a-74d6-1ae2-93775dd3b5e4	1372	Hotedršica
00050000-560a-74d6-c330-48b9c88b7ce3	1430	Hrastnik
00050000-560a-74d6-9aa5-f1f98aefa3c5	6225	Hruševje
00050000-560a-74d6-abe1-88f1b7300d4b	4276	Hrušica
00050000-560a-74d6-bd48-d86dab80c59f	5280	Idrija
00050000-560a-74d6-639d-922e6174347b	1292	Ig
00050000-560a-74d6-1034-2dd1c58e7de4	6250	Ilirska Bistrica
00050000-560a-74d6-fffc-6fb9380220a4	6251	Ilirska Bistrica-Trnovo
00050000-560a-74d6-5088-a97c8dde709c	1295	Ivančna Gorica
00050000-560a-74d6-9f0f-f9d7c30822ce	2259	Ivanjkovci
00050000-560a-74d6-54f5-ab06bfe50310	1411	Izlake
00050000-560a-74d6-290c-092bdba193ef	6310	Izola/Isola
00050000-560a-74d6-fce6-bca3e66cb02b	2222	Jakobski Dol
00050000-560a-74d6-763c-95cf6bda6273	2221	Jarenina
00050000-560a-74d6-8131-e673d9a1cb45	6254	Jelšane
00050000-560a-74d6-e230-d68a3c0388b5	4270	Jesenice
00050000-560a-74d6-88b5-10a4c98ece76	8261	Jesenice na Dolenjskem
00050000-560a-74d6-b74a-d55f0ef23cf3	3273	Jurklošter
00050000-560a-74d6-d625-9166cc736013	2223	Jurovski Dol
00050000-560a-74d6-0ece-73fb84ca3093	2256	Juršinci
00050000-560a-74d6-45b4-ffbd53cd99d2	5214	Kal nad Kanalom
00050000-560a-74d6-1c0b-30dee55357ac	3233	Kalobje
00050000-560a-74d6-550e-d7ad18762b50	4246	Kamna Gorica
00050000-560a-74d6-f5e5-553e2a84cc80	2351	Kamnica
00050000-560a-74d6-9eca-dab49ce41c21	1241	Kamnik
00050000-560a-74d6-f86a-7ac6cdde5c46	5213	Kanal
00050000-560a-74d6-7456-ca9bb1a992f9	8258	Kapele
00050000-560a-74d6-39ea-eec7538004d1	2362	Kapla
00050000-560a-74d6-7022-9ea6b47eb4cb	2325	Kidričevo
00050000-560a-74d6-b192-6c975ee29029	1412	Kisovec
00050000-560a-74d6-d061-a319474e3b0c	6253	Knežak
00050000-560a-74d6-3076-487a8d60be74	5222	Kobarid
00050000-560a-74d6-420b-62fce2adfd1f	9227	Kobilje
00050000-560a-74d6-547e-a2a697f99381	1330	Kočevje
00050000-560a-74d6-7db9-2912e9c279f3	1338	Kočevska Reka
00050000-560a-74d6-e8dc-ae750a3e7669	2276	Kog
00050000-560a-74d6-3108-8ed20ba586ad	5211	Kojsko
00050000-560a-74d6-3063-f2642c79c96a	6223	Komen
00050000-560a-74d6-b434-4a6f8e128267	1218	Komenda
00050000-560a-74d6-847d-e6a3080e841d	6000	Koper/Capodistria 
00050000-560a-74d6-f16f-745c5ff573e8	6001	Koper/Capodistria - poštni predali
00050000-560a-74d6-85b3-dd88876cae22	8282	Koprivnica
00050000-560a-74d6-48d0-f3af95ac0af5	5296	Kostanjevica na Krasu
00050000-560a-74d6-5f36-da28f5670516	8311	Kostanjevica na Krki
00050000-560a-74d7-2c6d-fd4eaed233a4	1336	Kostel
00050000-560a-74d7-fa56-96c644fd129b	6256	Košana
00050000-560a-74d7-edfd-58e8d372f345	2394	Kotlje
00050000-560a-74d7-d1ec-e593414e5228	6240	Kozina
00050000-560a-74d7-d8ad-a7592f9d94b4	3260	Kozje
00050000-560a-74d7-ddb4-43a99ea1201d	4000	Kranj 
00050000-560a-74d7-698b-3a172aaf046b	4001	Kranj - poštni predali
00050000-560a-74d7-38e1-079b6915d849	4280	Kranjska Gora
00050000-560a-74d7-0e2f-46794e305ed4	1281	Kresnice
00050000-560a-74d7-f2b4-885f4be09841	4294	Križe
00050000-560a-74d7-80f7-69edfab8465e	9206	Križevci
00050000-560a-74d7-f0c4-866df57c57d5	9242	Križevci pri Ljutomeru
00050000-560a-74d7-b24d-79651653a45c	1301	Krka
00050000-560a-74d7-0d92-709debb05356	8296	Krmelj
00050000-560a-74d7-b3a9-783a6b79d7b4	4245	Kropa
00050000-560a-74d7-7940-43c66a09f355	8262	Krška vas
00050000-560a-74d7-8429-af7ae72e8b00	8270	Krško
00050000-560a-74d7-4878-d80ddd77087d	9263	Kuzma
00050000-560a-74d7-067e-7ec4dd0c767a	2318	Laporje
00050000-560a-74d7-425d-d08ac2b57978	3270	Laško
00050000-560a-74d7-87e4-230e78b1c1a3	1219	Laze v Tuhinju
00050000-560a-74d7-0198-8ccc2228d762	2230	Lenart v Slovenskih goricah
00050000-560a-74d7-f9f4-eb3f6505841c	9220	Lendava/Lendva
00050000-560a-74d7-d0cf-49d2645e129d	4248	Lesce
00050000-560a-74d7-9207-c9f7e9d1fcec	3261	Lesično
00050000-560a-74d7-ae77-89d3b198e346	8273	Leskovec pri Krškem
00050000-560a-74d7-63d9-0b0fab51d928	2372	Libeliče
00050000-560a-74d7-a415-795dc2eac93a	2341	Limbuš
00050000-560a-74d7-e951-be2d9372856a	1270	Litija
00050000-560a-74d7-7d32-018ae0faafdc	3202	Ljubečna
00050000-560a-74d7-b227-0bce8f2caea3	1000	Ljubljana 
00050000-560a-74d7-4244-be9835c1d1cd	1001	Ljubljana - poštni predali
00050000-560a-74d7-b25a-021b7a3505cf	1231	Ljubljana - Črnuče
00050000-560a-74d7-49e7-630e4d5d791d	1261	Ljubljana - Dobrunje
00050000-560a-74d7-3aa2-4f421d70599d	1260	Ljubljana - Polje
00050000-560a-74d7-4a12-376efd7803dc	1210	Ljubljana - Šentvid
00050000-560a-74d7-1dc9-61ba36b3d874	1211	Ljubljana - Šmartno
00050000-560a-74d7-9189-10eb6669360e	3333	Ljubno ob Savinji
00050000-560a-74d7-b744-83954b3f0e74	9240	Ljutomer
00050000-560a-74d7-25f8-2ee54a48d837	3215	Loče
00050000-560a-74d7-c5a0-a0c7e2b85220	5231	Log pod Mangartom
00050000-560a-74d7-dfd5-6eb54914f28a	1358	Log pri Brezovici
00050000-560a-74d7-fb2b-d1448c7bd511	1370	Logatec
00050000-560a-74d7-43c8-36f82b154789	1371	Logatec
00050000-560a-74d7-f536-f4bd83fe9470	1434	Loka pri Zidanem Mostu
00050000-560a-74d7-1445-6cf90e2c7214	3223	Loka pri Žusmu
00050000-560a-74d7-68c0-ae7cdb37c93c	6219	Lokev
00050000-560a-74d7-103b-f70b5244538e	1318	Loški Potok
00050000-560a-74d7-841e-a9495b240033	2324	Lovrenc na Dravskem polju
00050000-560a-74d7-769d-7ce05e922aa0	2344	Lovrenc na Pohorju
00050000-560a-74d7-1e97-cc889802e618	3334	Luče
00050000-560a-74d7-ccd2-1e224690093a	1225	Lukovica
00050000-560a-74d7-77c5-7efa41435af4	9202	Mačkovci
00050000-560a-74d7-5efd-59209ca36483	2322	Majšperk
00050000-560a-74d7-3336-6551ce5618a4	2321	Makole
00050000-560a-74d7-0e4f-3e3133ac3f1c	9243	Mala Nedelja
00050000-560a-74d7-f851-73fb10480621	2229	Malečnik
00050000-560a-74d7-3960-cbcde3e347db	6273	Marezige
00050000-560a-74d7-29de-1b041ddc1f73	2000	Maribor 
00050000-560a-74d7-e50d-f45058e9a0ec	2001	Maribor - poštni predali
00050000-560a-74d7-135d-2cac191c3405	2206	Marjeta na Dravskem polju
00050000-560a-74d7-5571-6f585cda697d	2281	Markovci
00050000-560a-74d7-39ae-421f235269d6	9221	Martjanci
00050000-560a-74d7-1ad2-b5089734697b	6242	Materija
00050000-560a-74d7-20fa-b8690220d5f2	4211	Mavčiče
00050000-560a-74d7-74d7-6be71b6ab026	1215	Medvode
00050000-560a-74d7-5311-2a37b44b05af	1234	Mengeš
00050000-560a-74d7-a125-d6f930070e85	8330	Metlika
00050000-560a-74d7-3d4a-a59cb67b118b	2392	Mežica
00050000-560a-74d7-476c-909e27964878	2204	Miklavž na Dravskem polju
00050000-560a-74d7-238e-9e4ac291e292	2275	Miklavž pri Ormožu
00050000-560a-74d7-1560-bc5269ef4b0a	5291	Miren
00050000-560a-74d7-fc3f-5455e5b0f898	8233	Mirna
00050000-560a-74d7-2fb8-3b6835c54ad1	8216	Mirna Peč
00050000-560a-74d7-948c-0ad5aa90b439	2382	Mislinja
00050000-560a-74d7-b99c-e3b3b9d21903	4281	Mojstrana
00050000-560a-74d7-ad95-f47d2158a2a7	8230	Mokronog
00050000-560a-74d7-81a6-c5a30b3d7d5f	1251	Moravče
00050000-560a-74d7-718f-9f858eb42c03	9226	Moravske Toplice
00050000-560a-74d7-53d8-2edbf2aaec44	5216	Most na Soči
00050000-560a-74d7-cbe0-38eca49512d8	1221	Motnik
00050000-560a-74d7-8b53-8bfc4c25a93b	3330	Mozirje
00050000-560a-74d7-49da-a872645ba7c3	9000	Murska Sobota 
00050000-560a-74d7-9279-5d78bfea8902	9001	Murska Sobota - poštni predali
00050000-560a-74d7-6ff4-e374cc90fb4d	2366	Muta
00050000-560a-74d7-3d6d-0b7b55d2a38a	4202	Naklo
00050000-560a-74d7-8f35-7cdb6482b0d2	3331	Nazarje
00050000-560a-74d7-fcef-a4b92401e569	1357	Notranje Gorice
00050000-560a-74d7-3142-ad99c804d582	3203	Nova Cerkev
00050000-560a-74d7-c2a6-7d088ec85e99	5000	Nova Gorica 
00050000-560a-74d7-7597-8f69dee299a1	5001	Nova Gorica - poštni predali
00050000-560a-74d7-0b4a-5e36d052e770	1385	Nova vas
00050000-560a-74d7-3049-da2f32447a46	8000	Novo mesto
00050000-560a-74d7-6997-d163b75ac931	8001	Novo mesto - poštni predali
00050000-560a-74d7-f8b4-bc8fa74a40be	6243	Obrov
00050000-560a-74d7-2eeb-95ba9893eaf1	9233	Odranci
00050000-560a-74d7-5918-3842a0132e73	2317	Oplotnica
00050000-560a-74d7-ff30-914471be968b	2312	Orehova vas
00050000-560a-74d7-8ee5-4249e99a6ca8	2270	Ormož
00050000-560a-74d7-0cc9-6c0f058afe0c	1316	Ortnek
00050000-560a-74d7-2669-7d52f26fe6be	1337	Osilnica
00050000-560a-74d7-9fac-0276e20424da	8222	Otočec
00050000-560a-74d7-c5a5-a468832c8956	2361	Ožbalt
00050000-560a-74d7-3547-d6e8024116b8	2231	Pernica
00050000-560a-74d7-e534-d28c69d339a2	2211	Pesnica pri Mariboru
00050000-560a-74d7-6800-7e560c0999bb	9203	Petrovci
00050000-560a-74d7-3a40-0ae1f41383ff	3301	Petrovče
00050000-560a-74d7-8653-b6d0e56ad624	6330	Piran/Pirano
00050000-560a-74d7-d59a-e7a9b688d946	8255	Pišece
00050000-560a-74d7-48d7-24f0ce35d234	6257	Pivka
00050000-560a-74d7-98e0-e722630bec5e	6232	Planina
00050000-560a-74d7-ef55-27a62648f4db	3225	Planina pri Sevnici
00050000-560a-74d7-fa06-9c4c570a055d	6276	Pobegi
00050000-560a-74d7-e460-3aa4a079fb17	8312	Podbočje
00050000-560a-74d7-bbd5-0e4092cd49e2	5243	Podbrdo
00050000-560a-74d7-f8b6-7af298146877	3254	Podčetrtek
00050000-560a-74d7-978f-1136981f13df	2273	Podgorci
00050000-560a-74d7-367f-9d37cae60422	6216	Podgorje
00050000-560a-74d7-c8d1-4c3e9a5c4eb3	2381	Podgorje pri Slovenj Gradcu
00050000-560a-74d7-3bb1-4e9fec993097	6244	Podgrad
00050000-560a-74d7-bc2b-1e9354e47c2e	1414	Podkum
00050000-560a-74d7-0489-7a3536324d67	2286	Podlehnik
00050000-560a-74d7-9f95-8cd274a42bae	5272	Podnanos
00050000-560a-74d7-8cea-91a06b2a4175	4244	Podnart
00050000-560a-74d7-a443-415ffd1b3b2a	3241	Podplat
00050000-560a-74d7-5c8a-235aa76ba614	3257	Podsreda
00050000-560a-74d7-b9d5-587155cdb8cd	2363	Podvelka
00050000-560a-74d7-ee0e-febe5bc33a3a	2208	Pohorje
00050000-560a-74d7-1786-3894d7cabf6f	2257	Polenšak
00050000-560a-74d7-33eb-ccb29308e3b3	1355	Polhov Gradec
00050000-560a-74d7-47b4-e107e9096762	4223	Poljane nad Škofjo Loko
00050000-560a-74d7-f25e-6b00d8897473	2319	Poljčane
00050000-560a-74d7-d9b3-3952127d748a	1272	Polšnik
00050000-560a-74d7-80c4-01e4f9f50eb3	3313	Polzela
00050000-560a-74d7-820c-12bfde89c338	3232	Ponikva
00050000-560a-74d7-451d-06d1480f9e1e	6320	Portorož/Portorose
00050000-560a-74d7-79f4-3099b9508b84	6230	Postojna
00050000-560a-74d7-a869-8eede27163d9	2331	Pragersko
00050000-560a-74d7-cf3d-ae60f908523b	3312	Prebold
00050000-560a-74d7-fb91-cda3a24926cb	4205	Preddvor
00050000-560a-74d7-6189-2fde9d396cca	6255	Prem
00050000-560a-74d7-bb48-f0203939bfed	1352	Preserje
00050000-560a-74d7-6809-befbbc29f8eb	6258	Prestranek
00050000-560a-74d7-fbf2-9ef7f4286414	2391	Prevalje
00050000-560a-74d7-6b1a-d786ee91a5b3	3262	Prevorje
00050000-560a-74d7-5161-05981de77e44	1276	Primskovo 
00050000-560a-74d7-9c2f-72b797d63702	3253	Pristava pri Mestinju
00050000-560a-74d7-b129-bd1adb124f96	9207	Prosenjakovci/Partosfalva
00050000-560a-74d7-7675-b76e8f3e9d92	5297	Prvačina
00050000-560a-74d7-e486-08b95ec952a9	2250	Ptuj
00050000-560a-74d7-55e6-5f88d4a62570	2323	Ptujska Gora
00050000-560a-74d7-46f2-0b7d888a46dd	9201	Puconci
00050000-560a-74d7-44bc-93698d5bb388	2327	Rače
00050000-560a-74d7-62a4-9762c347cd86	1433	Radeče
00050000-560a-74d7-f440-8f743e7f31c8	9252	Radenci
00050000-560a-74d7-7ebd-086eff19de44	2360	Radlje ob Dravi
00050000-560a-74d7-cc64-a4d5c2880057	1235	Radomlje
00050000-560a-74d7-9f69-b4f0270e3fff	4240	Radovljica
00050000-560a-74d7-6213-eb442f9ddf11	8274	Raka
00050000-560a-74d7-6284-29d28c24999e	1381	Rakek
00050000-560a-74d7-731b-ed1127bc2593	4283	Rateče - Planica
00050000-560a-74d7-35b3-fb6c8c9d1b97	2390	Ravne na Koroškem
00050000-560a-74d7-d94f-9114bd82f0e2	9246	Razkrižje
00050000-560a-74d7-2f5f-6bd4005d09f5	3332	Rečica ob Savinji
00050000-560a-74d7-edf5-0e93d36e3cb7	5292	Renče
00050000-560a-74d7-362d-c425d08eb11b	1310	Ribnica
00050000-560a-74d7-f2d4-8c6c6ae955d0	2364	Ribnica na Pohorju
00050000-560a-74d7-54aa-07a59cfdb619	3272	Rimske Toplice
00050000-560a-74d7-553c-aaffaced193c	1314	Rob
00050000-560a-74d7-0167-7b4d5c46d998	5215	Ročinj
00050000-560a-74d7-a738-8cc93d277675	3250	Rogaška Slatina
00050000-560a-74d7-d3d7-dcf369a1242b	9262	Rogašovci
00050000-560a-74d7-5af5-e514dc96fb20	3252	Rogatec
00050000-560a-74d7-cdcd-40c114008a34	1373	Rovte
00050000-560a-74d7-a92e-9077dd475141	2342	Ruše
00050000-560a-74d7-59b2-770478f14142	1282	Sava
00050000-560a-74d7-3d48-1927b041a773	6333	Sečovlje/Sicciole
00050000-560a-74d7-69bd-659b8563e1aa	4227	Selca
00050000-560a-74d7-23c6-2a9c03688624	2352	Selnica ob Dravi
00050000-560a-74d7-2083-1df852110ecf	8333	Semič
00050000-560a-74d7-2c3a-0ea798321b47	8281	Senovo
00050000-560a-74d7-aaef-41e162ebe4d7	6224	Senožeče
00050000-560a-74d7-7010-eca3738cb4a1	8290	Sevnica
00050000-560a-74d7-79d7-031ebda78714	6210	Sežana
00050000-560a-74d7-68e2-43ca5abb3f75	2214	Sladki Vrh
00050000-560a-74d7-74f4-fa51ae088359	5283	Slap ob Idrijci
00050000-560a-74d7-2d36-b9355800b2af	2380	Slovenj Gradec
00050000-560a-74d7-59b9-d1cb258baf7a	2310	Slovenska Bistrica
00050000-560a-74d7-9acf-0499bb3495af	3210	Slovenske Konjice
00050000-560a-74d7-7b6e-2c0436809ece	1216	Smlednik
00050000-560a-74d7-9662-771d1817bcfb	5232	Soča
00050000-560a-74d7-0d70-38d2ae23b478	1317	Sodražica
00050000-560a-74d7-814d-be4f182ed1dc	3335	Solčava
00050000-560a-74d7-1ddb-02717afbd264	5250	Solkan
00050000-560a-74d7-0c90-ef8e39e92020	4229	Sorica
00050000-560a-74d7-59be-df0221858e55	4225	Sovodenj
00050000-560a-74d7-2778-79ad4ab61e4e	5281	Spodnja Idrija
00050000-560a-74d7-5639-a63091f6e99a	2241	Spodnji Duplek
00050000-560a-74d7-738e-68b97182b18b	9245	Spodnji Ivanjci
00050000-560a-74d7-2f1f-b1d1bac971cf	2277	Središče ob Dravi
00050000-560a-74d7-031a-0daacac817e4	4267	Srednja vas v Bohinju
00050000-560a-74d7-6022-7b4a278b8ce3	8256	Sromlje 
00050000-560a-74d7-68fd-6f22f2d6190f	5224	Srpenica
00050000-560a-74d7-db6f-e5036712a16a	1242	Stahovica
00050000-560a-74d7-2ee3-795463f4566a	1332	Stara Cerkev
00050000-560a-74d7-d08f-3926280716bd	8342	Stari trg ob Kolpi
00050000-560a-74d7-ca61-5f91aaa68c17	1386	Stari trg pri Ložu
00050000-560a-74d7-afcf-73a51b1a600d	2205	Starše
00050000-560a-74d7-07be-e6365dc8c26a	2289	Stoperce
00050000-560a-74d7-71d9-8d268dfcecab	8322	Stopiče
00050000-560a-74d7-7de3-06e597582d46	3206	Stranice
00050000-560a-74d7-65ae-ff9011374218	8351	Straža
00050000-560a-74d7-6eb7-f10ba6b9bf03	1313	Struge
00050000-560a-74d7-e5e1-26e46c0b3dc5	8293	Studenec
00050000-560a-74d7-d51e-e20462428ca7	8331	Suhor
00050000-560a-74d7-be3e-81fa45711838	2233	Sv. Ana v Slovenskih goricah
00050000-560a-74d7-e77b-c4784db17c23	2235	Sv. Trojica v Slovenskih goricah
00050000-560a-74d7-663d-9e75aae0c50b	2353	Sveti Duh na Ostrem Vrhu
00050000-560a-74d7-833c-115d7fe13e64	9244	Sveti Jurij ob Ščavnici
00050000-560a-74d7-6c5d-2d291b676c8c	3264	Sveti Štefan
00050000-560a-74d7-06ff-ef4beb107339	2258	Sveti Tomaž
00050000-560a-74d7-3b87-71ed66d6379d	9204	Šalovci
00050000-560a-74d7-53e4-af4259542849	5261	Šempas
00050000-560a-74d7-9cd3-137ad82f3fb0	5290	Šempeter pri Gorici
00050000-560a-74d7-64e7-f77e4db77c29	3311	Šempeter v Savinjski dolini
00050000-560a-74d7-eb5f-07e267edc911	4208	Šenčur
00050000-560a-74d7-1027-8c684f21f6a1	2212	Šentilj v Slovenskih goricah
00050000-560a-74d7-5afc-0001f4859ea6	8297	Šentjanž
00050000-560a-74d7-c882-8d799fa29cd3	2373	Šentjanž pri Dravogradu
00050000-560a-74d7-48cd-1106b5f5afd1	8310	Šentjernej
00050000-560a-74d7-16df-6d3994a1a1b3	3230	Šentjur
00050000-560a-74d7-b2dc-ee2c1c53c5d2	3271	Šentrupert
00050000-560a-74d7-a030-d6d30dd02aa7	8232	Šentrupert
00050000-560a-74d7-5503-6c5fa0a5e051	1296	Šentvid pri Stični
00050000-560a-74d7-e754-940413a0a8b4	8275	Škocjan
00050000-560a-74d7-984d-924167e11908	6281	Škofije
00050000-560a-74d7-2a4b-e41e739e6119	4220	Škofja Loka
00050000-560a-74d7-14da-8026a7b077a3	3211	Škofja vas
00050000-560a-74d7-4811-37c161715bb9	1291	Škofljica
00050000-560a-74d7-0d59-002595c4bc82	6274	Šmarje
00050000-560a-74d7-b512-3e10698f14e3	1293	Šmarje - Sap
00050000-560a-74d7-180a-6b1dfaef55ca	3240	Šmarje pri Jelšah
00050000-560a-74d7-cb05-db7672102dea	8220	Šmarješke Toplice
00050000-560a-74d7-0b62-03d57d7877fc	2315	Šmartno na Pohorju
00050000-560a-74d7-fdd4-793874e5d4a4	3341	Šmartno ob Dreti
00050000-560a-74d7-12fb-950128985807	3327	Šmartno ob Paki
00050000-560a-74d7-444a-2933364e8ade	1275	Šmartno pri Litiji
00050000-560a-74d7-c82f-9384813f1480	2383	Šmartno pri Slovenj Gradcu
00050000-560a-74d7-0442-46c4e36f458a	3201	Šmartno v Rožni dolini
00050000-560a-74d7-77a3-217220b0beb0	3325	Šoštanj
00050000-560a-74d7-efa9-41114c194b83	6222	Štanjel
00050000-560a-74d7-417f-8654a9d703da	3220	Štore
00050000-560a-74d7-3a8b-78373c405254	3304	Tabor
00050000-560a-74d7-893a-9eaeae1b10b1	3221	Teharje
00050000-560a-74d7-58d3-8085c7390f29	9251	Tišina
00050000-560a-74d7-5296-a45497428ab7	5220	Tolmin
00050000-560a-74d7-b388-d5bb96684b30	3326	Topolšica
00050000-560a-74d7-e272-9ee6b5cc35fb	2371	Trbonje
00050000-560a-74d7-b14e-fdabb66c0ed0	1420	Trbovlje
00050000-560a-74d7-3504-a997b02887ae	8231	Trebelno 
00050000-560a-74d7-9b60-63664b8b09ef	8210	Trebnje
00050000-560a-74d7-293f-b37e35471e68	5252	Trnovo pri Gorici
00050000-560a-74d7-5f35-d89b73af844a	2254	Trnovska vas
00050000-560a-74d7-bc3b-9b1703614586	1222	Trojane
00050000-560a-74d7-fed6-e7320bab1a6c	1236	Trzin
00050000-560a-74d7-0815-d42f4fc99089	4290	Tržič
00050000-560a-74d7-d8a1-2b9ca75d6974	8295	Tržišče
00050000-560a-74d7-7c21-674f774b024e	1311	Turjak
00050000-560a-74d7-d93c-179847efcf8f	9224	Turnišče
00050000-560a-74d7-1107-83caad20e10f	8323	Uršna sela
00050000-560a-74d7-69fc-77812a9a70d6	1252	Vače
00050000-560a-74d7-d96f-b0c6e851cd22	3320	Velenje 
00050000-560a-74d7-ee26-05822579368a	3322	Velenje - poštni predali
00050000-560a-74d7-c28d-f5d9a9426233	8212	Velika Loka
00050000-560a-74d7-4c68-96233402dcbd	2274	Velika Nedelja
00050000-560a-74d7-cb6c-b86921393a9b	9225	Velika Polana
00050000-560a-74d7-14b8-729e9eb2790e	1315	Velike Lašče
00050000-560a-74d7-46d2-3eec34e806fd	8213	Veliki Gaber
00050000-560a-74d7-d8a2-02627c893e3a	9241	Veržej
00050000-560a-74d7-5e9a-87b2d760efd8	1312	Videm - Dobrepolje
00050000-560a-74d7-8cf4-d5cfa800bad6	2284	Videm pri Ptuju
00050000-560a-74d7-93fe-7eb1e3f03d8c	8344	Vinica
00050000-560a-74d7-83fa-902f771d08ec	5271	Vipava
00050000-560a-74d7-b81e-07ea9f0767d0	4212	Visoko
00050000-560a-74d7-3a2a-575a01801500	1294	Višnja Gora
00050000-560a-74d7-4231-498e45a9c479	3205	Vitanje
00050000-560a-74d7-c787-3f1062dd61de	2255	Vitomarci
00050000-560a-74d7-64af-6a8311b6b42b	1217	Vodice
00050000-560a-74d7-082a-aeb1d4436848	3212	Vojnik\t
00050000-560a-74d7-2415-2107bce5c01f	5293	Volčja Draga
00050000-560a-74d7-085c-3e1111311575	2232	Voličina
00050000-560a-74d7-d09d-478cb4e4b145	3305	Vransko
00050000-560a-74d7-2607-808f2eaa5822	6217	Vremski Britof
00050000-560a-74d7-de65-0b0ac92f9945	1360	Vrhnika
00050000-560a-74d7-7809-98824951d69d	2365	Vuhred
00050000-560a-74d7-520f-01567e1387fc	2367	Vuzenica
00050000-560a-74d7-2210-a86ec82b072d	8292	Zabukovje 
00050000-560a-74d7-b013-d5b9067e9885	1410	Zagorje ob Savi
00050000-560a-74d7-00a4-647335483fbf	1303	Zagradec
00050000-560a-74d7-b829-a858b8ffda6a	2283	Zavrč
00050000-560a-74d7-d853-da6353cb0f41	8272	Zdole 
00050000-560a-74d7-1645-e26ee60dc9bc	4201	Zgornja Besnica
00050000-560a-74d7-f884-5096d5ae3382	2242	Zgornja Korena
00050000-560a-74d7-972a-2c951cad22df	2201	Zgornja Kungota
00050000-560a-74d7-2167-9fdf7539fc88	2316	Zgornja Ložnica
00050000-560a-74d7-f1e5-cc6ab1fbc416	2314	Zgornja Polskava
00050000-560a-74d7-0d89-f637d4e674a6	2213	Zgornja Velka
00050000-560a-74d7-6812-214e047c822a	4247	Zgornje Gorje
00050000-560a-74d7-7a06-815a08547a49	4206	Zgornje Jezersko
00050000-560a-74d7-33af-6ce62450ad7d	2285	Zgornji Leskovec
00050000-560a-74d7-88fd-83760c2ef6bb	1432	Zidani Most
00050000-560a-74d7-7100-8c914cef04b0	3214	Zreče
00050000-560a-74d7-15d1-64da8e89901d	4209	Žabnica
00050000-560a-74d7-e7bf-9647e3853bca	3310	Žalec
00050000-560a-74d7-f030-52f30464a7a8	4228	Železniki
00050000-560a-74d7-35c3-23503fb083ab	2287	Žetale
00050000-560a-74d7-94a0-c398e576438f	4226	Žiri
00050000-560a-74d7-6dc2-d1b4d0e5498f	4274	Žirovnica
00050000-560a-74d7-d125-24aeae083cca	8360	Žužemberk
\.


--
-- TOC entry 3028 (class 0 OID 21034184)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21033806)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 21033586)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-560a-74d9-2e95-712193002f5b	00080000-560a-74d9-b9cb-90b8f7cdbe6d	\N	00040000-560a-74d7-7353-84af34156b77	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-560a-74d9-b6f2-ec30f781e45d	00080000-560a-74d9-b9cb-90b8f7cdbe6d	\N	00040000-560a-74d7-7353-84af34156b77	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-560a-74d9-7f14-7de731e884af	00080000-560a-74d9-0292-5f9011ac5bd8	\N	00040000-560a-74d7-7353-84af34156b77	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2990 (class 0 OID 21033690)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21033818)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21034198)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21034208)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-560a-74d9-dbb9-213becf49ceb	00080000-560a-74d9-9d55-f8871e97c5c7	0987	AK
00190000-560a-74d9-c450-217b231290a5	00080000-560a-74d9-0292-5f9011ac5bd8	0989	AK
00190000-560a-74d9-cad1-ced1174ed1c8	00080000-560a-74d9-7263-79aace9d48f7	0986	AK
00190000-560a-74d9-4807-13a59a7bb74d	00080000-560a-74d9-21b4-34f7d32d7958	0984	AK
00190000-560a-74d9-c2ef-056c22a8fecc	00080000-560a-74d9-645d-3069c29c9f5e	0983	AK
00190000-560a-74d9-b65e-0b9c8864bdde	00080000-560a-74d9-2ed4-f9b8522f615c	0982	AK
00190000-560a-74da-581b-b5fd4c5f38b6	00080000-560a-74da-3619-5f612d4b8b6b	1001	AK
\.


--
-- TOC entry 3027 (class 0 OID 21034141)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-560a-74d9-46ca-fdf5958edab2	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 21034216)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 21033847)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-560a-74d9-772c-0c60be505f69	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-560a-74d9-56e8-78d9f1266450	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-560a-74d9-d012-ffedc349af57	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-560a-74d9-a9fe-bd20492595b0	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-560a-74d9-4d20-0adc5818bbc7	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-560a-74d9-e83a-427d411d3712	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-560a-74d9-2dbb-00a21eb5b156	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2999 (class 0 OID 21033791)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21033781)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21033991)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21033921)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21033664)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21033459)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-560a-74da-3619-5f612d4b8b6b	00010000-560a-74d7-268e-56ab34bd246a	2015-09-29 13:24:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-560a-74da-c92b-58ad1a04c1a1	00010000-560a-74d7-268e-56ab34bd246a	2015-09-29 13:24:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-560a-74da-581b-b5fd4c5f38b6	00010000-560a-74d7-268e-56ab34bd246a	2015-09-29 13:24:10	INS	a:0:{}
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 21033860)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21033497)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-560a-74d7-03d0-b4ea80ffa898	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-560a-74d7-1bde-f684ace28412	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-560a-74d7-28b6-6a68f4df27ce	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-560a-74d7-9445-a875bdeac08d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-560a-74d7-1e62-c79e47740528	planer	Planer dogodkov v koledarju	t
00020000-560a-74d7-25b5-467af649c882	kadrovska	Kadrovska služba	t
00020000-560a-74d7-60f7-4bbe506dfa23	arhivar	Ažuriranje arhivalij	t
00020000-560a-74d7-c1a9-0089bd6aaad8	igralec	Igralec	t
00020000-560a-74d7-0b3d-556e48c8bb1d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-560a-74d9-15de-2b07647193a6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2973 (class 0 OID 21033481)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-560a-74d7-ca7b-580b63d17ce1	00020000-560a-74d7-28b6-6a68f4df27ce
00010000-560a-74d7-268e-56ab34bd246a	00020000-560a-74d7-28b6-6a68f4df27ce
00010000-560a-74d9-f470-9a58d54e3667	00020000-560a-74d9-15de-2b07647193a6
\.


--
-- TOC entry 3010 (class 0 OID 21033874)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 21033812)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21033758)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21033446)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-560a-74d7-0c86-9ba7e21a2490	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-560a-74d7-868c-8870e2c925e2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-560a-74d7-7a2f-163181b4564f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-560a-74d7-36e1-5a9a4e92da2d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-560a-74d7-d890-d056ea536fc1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2968 (class 0 OID 21033438)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-560a-74d7-3034-8dcfba69c2d2	00230000-560a-74d7-36e1-5a9a4e92da2d	popa
00240000-560a-74d7-b613-c486192cb9f2	00230000-560a-74d7-36e1-5a9a4e92da2d	oseba
00240000-560a-74d7-5715-787b2663f314	00230000-560a-74d7-36e1-5a9a4e92da2d	sezona
00240000-560a-74d7-b51c-6a8f4b52fe03	00230000-560a-74d7-868c-8870e2c925e2	prostor
00240000-560a-74d7-0aa8-300b6cfa05b0	00230000-560a-74d7-36e1-5a9a4e92da2d	besedilo
00240000-560a-74d7-056d-7afc714dd47e	00230000-560a-74d7-36e1-5a9a4e92da2d	uprizoritev
00240000-560a-74d7-ebd9-32ac14430df8	00230000-560a-74d7-36e1-5a9a4e92da2d	funkcija
00240000-560a-74d7-b7b3-2cf193d59635	00230000-560a-74d7-36e1-5a9a4e92da2d	tipfunkcije
00240000-560a-74d7-f894-bfbd97a6a498	00230000-560a-74d7-36e1-5a9a4e92da2d	alternacija
00240000-560a-74d7-bd41-a9481d6e6e55	00230000-560a-74d7-0c86-9ba7e21a2490	pogodba
00240000-560a-74d7-35a8-add3cbc4365d	00230000-560a-74d7-36e1-5a9a4e92da2d	zaposlitev
00240000-560a-74d7-31cb-f3c3d7d479ea	00230000-560a-74d7-36e1-5a9a4e92da2d	zvrstuprizoritve
00240000-560a-74d7-15c2-77d96c1aaa88	00230000-560a-74d7-0c86-9ba7e21a2490	programdela
00240000-560a-74d7-ad90-badc7ff4e07c	00230000-560a-74d7-36e1-5a9a4e92da2d	zapis
\.


--
-- TOC entry 2967 (class 0 OID 21033433)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6f1ac868-942e-421d-9552-da7829d2d7b3	00240000-560a-74d7-3034-8dcfba69c2d2	0	1001
\.


--
-- TOC entry 3016 (class 0 OID 21033938)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-560a-74d9-b119-61b002854424	000e0000-560a-74d9-3306-f347178845eb	00080000-560a-74d9-b9cb-90b8f7cdbe6d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-560a-74d7-c14d-e66f84981ff7
00270000-560a-74d9-5dd4-9b96165d58fe	000e0000-560a-74d9-3306-f347178845eb	00080000-560a-74d9-b9cb-90b8f7cdbe6d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-560a-74d7-c14d-e66f84981ff7
\.


--
-- TOC entry 2980 (class 0 OID 21033559)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 21033768)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-560a-74d9-eec4-6ff586a9457a	00180000-560a-74d9-bd1c-5dac2453a8ac	000c0000-560a-74d9-8425-6d92134fd29b	00090000-560a-74d9-09d6-15318cc6c135	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-74d9-e85e-e682b387f7a4	00180000-560a-74d9-bd1c-5dac2453a8ac	000c0000-560a-74d9-33cd-c6ce9ff24224	00090000-560a-74d9-bb1f-a923153579cd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-74d9-682d-918086843805	00180000-560a-74d9-bd1c-5dac2453a8ac	000c0000-560a-74d9-0a92-a6b26d6c3161	00090000-560a-74d9-94ce-7ea621f9bce7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-74d9-fe67-0b5f7acc6604	00180000-560a-74d9-bd1c-5dac2453a8ac	000c0000-560a-74d9-2a84-29c1c953862d	00090000-560a-74d9-1073-8a6ffbee6c13	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-74d9-eff1-970354d29437	00180000-560a-74d9-bd1c-5dac2453a8ac	000c0000-560a-74d9-b137-3b6471594cac	00090000-560a-74d9-14ea-40307f822d54	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-74d9-695a-e730e342a928	00180000-560a-74d9-c2d7-85b26ce0b35c	\N	00090000-560a-74d9-14ea-40307f822d54	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3019 (class 0 OID 21033979)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-560a-74d7-8338-12c4f4ef5676	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-560a-74d7-320c-58242dcc79a2	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-560a-74d7-b7c4-084fdd8b1972	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-560a-74d7-b684-2df23eeaffa7	04	Režija	Režija	Režija	umetnik	30
000f0000-560a-74d7-801f-b01152e3d8a4	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-560a-74d7-91b2-304e1b0e0994	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-560a-74d7-5106-e95b2da0ac7b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-560a-74d7-2c6c-9253aaa9e56e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-560a-74d7-8af5-99026d307a20	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-560a-74d7-eb1f-46910c505e5a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-560a-74d7-13da-6e6e24f5d34a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-560a-74d7-97c7-ef674a9a4312	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-560a-74d7-70dd-15852c4a4f84	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-560a-74d7-9bf7-c715c2ffac04	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-560a-74d7-e151-67d4b37f5110	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-560a-74d7-f4a1-baff00535f59	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-560a-74d7-a92c-328adf6fe169	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-560a-74d7-e57f-c385c280c52b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3032 (class 0 OID 21034227)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-560a-74d7-438f-0dab015576ce	01	Velika predstava	f	1.00	1.00
002b0000-560a-74d7-637b-1f9a12a0b583	02	Mala predstava	f	0.50	0.50
002b0000-560a-74d7-36a2-d2a9029822ce	03	Mala koprodukcija	t	0.40	1.00
002b0000-560a-74d7-2608-6bbe9fdfeb2c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-560a-74d7-04bd-1f282bd0801b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2985 (class 0 OID 21033621)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21033468)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-560a-74d7-268e-56ab34bd246a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROBwzNU.NucFtJWo7ZpvphHl/b9iD7gk2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-560a-74d9-9c7e-4f3f73210137	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-560a-74d9-4a55-9f9826cb5359	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-560a-74d9-862d-a116978910bb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-560a-74d9-57cc-3625f5472c1c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-560a-74d9-aeda-d59a8a49f679	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-560a-74d9-a715-5b4a962849d0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-560a-74d9-75c9-6309a4939376	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-560a-74d9-e348-e59137be2235	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-560a-74d9-b1cb-acd54e7b2312	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-560a-74d9-f470-9a58d54e3667	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-560a-74d7-ca7b-580b63d17ce1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 21034029)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-560a-74d9-e84a-9db66e52d444	00160000-560a-74d9-39ce-08b0559e2d33	\N	00140000-560a-74d7-0e80-8b4501aae64a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-560a-74d9-4d20-0adc5818bbc7
000e0000-560a-74d9-3306-f347178845eb	00160000-560a-74d9-b368-fa30e9eb9a6b	\N	00140000-560a-74d7-0d66-6def00864f3a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-560a-74d9-e83a-427d411d3712
000e0000-560a-74d9-8072-dbede5b6c500	\N	\N	00140000-560a-74d7-0d66-6def00864f3a	00190000-560a-74d9-dbb9-213becf49ceb	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-74d9-4d20-0adc5818bbc7
000e0000-560a-74d9-399c-7cf931a113ed	\N	\N	00140000-560a-74d7-0d66-6def00864f3a	00190000-560a-74d9-dbb9-213becf49ceb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-74d9-4d20-0adc5818bbc7
000e0000-560a-74d9-e5c1-e48cf9bcfbaf	\N	\N	00140000-560a-74d7-0d66-6def00864f3a	00190000-560a-74d9-dbb9-213becf49ceb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-74d9-772c-0c60be505f69
000e0000-560a-74d9-5034-4d4925d67ad7	\N	\N	00140000-560a-74d7-0d66-6def00864f3a	00190000-560a-74d9-dbb9-213becf49ceb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-74d9-772c-0c60be505f69
\.


--
-- TOC entry 2992 (class 0 OID 21033712)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-560a-74d9-ab5d-6d371186c672	000e0000-560a-74d9-3306-f347178845eb	\N	1	
00200000-560a-74d9-f6d8-77448829ca8e	000e0000-560a-74d9-3306-f347178845eb	\N	2	
00200000-560a-74d9-ad31-1f6d08d053d8	000e0000-560a-74d9-3306-f347178845eb	\N	3	
00200000-560a-74d9-cdde-e960547a5496	000e0000-560a-74d9-3306-f347178845eb	\N	4	
00200000-560a-74d9-21df-ac71d5c320b9	000e0000-560a-74d9-3306-f347178845eb	\N	5	
\.


--
-- TOC entry 3006 (class 0 OID 21033839)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21033952)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-560a-74d7-39c8-663f1a85c4dc	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-560a-74d7-2658-4b43bc62206e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-560a-74d7-a684-53fe2d7fae3c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-560a-74d7-0062-ce71efd77465	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-560a-74d7-993a-047d25d5f463	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-560a-74d7-f64c-c8001a826265	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-560a-74d7-bcfc-733fe6e05020	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-560a-74d7-d60a-fb2829efb1f2	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-560a-74d7-c14d-e66f84981ff7	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-560a-74d7-3ef6-048a6dc98643	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-560a-74d7-27d6-b52895f1ebdd	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-560a-74d7-6b18-f2bd22226da7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-560a-74d7-0c43-0cf6a620b75f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-560a-74d7-ce9e-fd37710a0708	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-560a-74d7-7e35-3f6a4bff674f	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-560a-74d7-d089-7b5cdcbb8818	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-560a-74d7-80c3-72f1cbe5f147	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-560a-74d7-89d7-5dc1669a6d8a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-560a-74d7-f274-8004b410e369	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-560a-74d7-9c6f-38dd2c7df0da	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-560a-74d7-7eb4-4ba79f289c69	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-560a-74d7-8af0-8faa1da7c3ae	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-560a-74d7-87eb-455eb22341b3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-560a-74d7-220f-1f721c5b2b24	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-560a-74d7-5c4b-988725b2b483	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-560a-74d7-054c-10b5508b63d3	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-560a-74d7-bdf8-5d99deb8683f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-560a-74d7-609d-759c676e3dc7	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3035 (class 0 OID 21034274)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21034246)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21034286)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21033911)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-560a-74d9-be53-8df4febede77	00090000-560a-74d9-bb1f-a923153579cd	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-74d9-f9a0-f6889a79f211	00090000-560a-74d9-94ce-7ea621f9bce7	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-74d9-bf72-a534f7f5e0d1	00090000-560a-74d9-2d1f-1169578b20e9	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-74d9-196e-078729866302	00090000-560a-74d9-36ec-2471c1e0bd76	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-74d9-28fd-da9aa089976c	00090000-560a-74d9-09d6-15318cc6c135	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-74d9-f30b-98c6773563d8	00090000-560a-74d9-4e7f-060f9d513f38	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2994 (class 0 OID 21033747)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21034019)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-560a-74d7-0e80-8b4501aae64a	01	Drama	drama (SURS 01)
00140000-560a-74d7-35e3-9cc29660390f	02	Opera	opera (SURS 02)
00140000-560a-74d7-3bcc-034ad5ab85ce	03	Balet	balet (SURS 03)
00140000-560a-74d7-9bfd-de459a40a691	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-560a-74d7-850f-9144b108a313	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-560a-74d7-0d66-6def00864f3a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-560a-74d7-a63b-e5029da2d900	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3012 (class 0 OID 21033901)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2499 (class 2606 OID 21033522)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 21034078)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21034068)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21033935)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21033977)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21034326)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21033736)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21033757)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21034244)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21033647)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 21034135)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21033897)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21033710)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21033685)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21033661)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21033804)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 21034303)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 21034310)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 21034334)
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
-- TOC entry 2611 (class 2606 OID 21033831)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21033619)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 21033531)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21033555)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 21033511)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2490 (class 2606 OID 21033496)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21033837)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21033873)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21034014)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21033583)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21033607)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21034196)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 21033810)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 21033597)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 21033698)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 21033822)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 21034205)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21034213)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 21034183)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 21034225)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 21033855)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 21033795)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21033786)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 21034001)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 21033928)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21033673)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21033467)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21033864)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21033485)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2492 (class 2606 OID 21033505)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 21033882)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21033817)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21033766)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21033455)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21033443)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21033437)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21033948)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 21033564)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21033777)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21033988)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21034237)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 21033632)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21033480)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21034047)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21033720)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21033845)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21033960)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21034284)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 21034268)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21034292)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21033919)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 21033751)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21034027)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 21033909)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 21033745)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2564 (class 1259 OID 21033746)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2565 (class 1259 OID 21033744)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2566 (class 1259 OID 21033743)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 21033742)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2653 (class 1259 OID 21033949)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2654 (class 1259 OID 21033950)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 21033951)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 21034305)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 21034304)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2513 (class 1259 OID 21033585)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 21033838)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 21034272)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 21034271)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 21034273)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 21034270)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 21034269)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 21033824)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 21033823)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 21033721)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 21033898)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 21033900)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 21033899)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2538 (class 1259 OID 21033663)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21033662)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2717 (class 1259 OID 21034226)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2669 (class 1259 OID 21034016)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 21034017)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 21034018)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 21034293)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2678 (class 1259 OID 21034052)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2679 (class 1259 OID 21034049)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2680 (class 1259 OID 21034053)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2681 (class 1259 OID 21034051)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2682 (class 1259 OID 21034050)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2528 (class 1259 OID 21033634)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 21033633)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2504 (class 1259 OID 21033558)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 21033865)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 21033512)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2495 (class 1259 OID 21033513)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 21033885)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 21033884)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 21033883)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 21033699)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 21033700)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 21033445)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 21033790)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 21033788)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 21033787)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 21033789)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 21033486)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 21033487)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 21033846)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 21034327)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2651 (class 1259 OID 21033937)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 21033936)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2750 (class 1259 OID 21034335)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 21034336)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 21033811)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 21033929)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 21033930)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 21034140)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2700 (class 1259 OID 21034139)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2701 (class 1259 OID 21034136)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21034137)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2703 (class 1259 OID 21034138)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2517 (class 1259 OID 21033599)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 21033598)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2519 (class 1259 OID 21033600)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 21033859)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 21033858)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 21034206)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2710 (class 1259 OID 21034207)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2692 (class 1259 OID 21034082)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 21034083)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2694 (class 1259 OID 21034080)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2695 (class 1259 OID 21034081)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 21033920)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 21033799)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 21033798)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 21033796)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 21033797)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2688 (class 1259 OID 21034070)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 21034069)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 21033674)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2545 (class 1259 OID 21033688)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2546 (class 1259 OID 21033687)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2547 (class 1259 OID 21033686)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2548 (class 1259 OID 21033689)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2557 (class 1259 OID 21033711)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 21034197)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2725 (class 1259 OID 21034245)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 21034311)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 21034312)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2500 (class 1259 OID 21033533)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 21033532)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2509 (class 1259 OID 21033565)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 21033566)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 21033752)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 21033780)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 21033779)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 21033778)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2568 (class 1259 OID 21033738)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 21033739)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 21033737)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 21033741)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2572 (class 1259 OID 21033740)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2516 (class 1259 OID 21033584)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 21033648)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 21033650)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2536 (class 1259 OID 21033649)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2537 (class 1259 OID 21033651)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 21033805)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21034015)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21034048)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 21033989)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 21033990)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2507 (class 1259 OID 21033556)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 21033557)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 21033910)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 21033456)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21033620)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 21033444)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2722 (class 1259 OID 21034238)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 21033857)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 21033856)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 21034079)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 21033608)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 21034028)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21034285)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2715 (class 1259 OID 21034214)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 21034215)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 21033978)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2580 (class 1259 OID 21033767)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 21033506)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2784 (class 2606 OID 21034467)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 21034472)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2779 (class 2606 OID 21034492)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2785 (class 2606 OID 21034462)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 21034482)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 21034487)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 21034477)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 21034657)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2819 (class 2606 OID 21034662)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 21034667)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 21034832)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 21034827)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 21034392)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 21034577)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 21034812)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 21034807)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 21034817)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 21034802)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2850 (class 2606 OID 21034797)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2800 (class 2606 OID 21034572)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 21034567)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 21034457)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21034617)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 21034627)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2811 (class 2606 OID 21034622)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 21034427)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 21034422)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 21034557)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 21034787)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 21034672)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 21034677)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 21034682)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 21034822)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 21034702)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2828 (class 2606 OID 21034687)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 21034707)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 21034697)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 21034692)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 21034417)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 21034412)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 21034377)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2762 (class 2606 OID 21034372)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21034597)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 21034352)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 21034357)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 21034612)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2808 (class 2606 OID 21034607)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 21034602)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2776 (class 2606 OID 21034442)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 21034447)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 21034337)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 21034532)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2792 (class 2606 OID 21034522)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2793 (class 2606 OID 21034517)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2791 (class 2606 OID 21034527)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 21034342)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 21034347)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2803 (class 2606 OID 21034582)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2856 (class 2606 OID 21034847)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 21034652)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21034647)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2858 (class 2606 OID 21034852)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2857 (class 2606 OID 21034857)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 21034562)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2815 (class 2606 OID 21034637)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2814 (class 2606 OID 21034642)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21034762)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 21034757)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2839 (class 2606 OID 21034742)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21034747)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2837 (class 2606 OID 21034752)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2767 (class 2606 OID 21034402)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 21034397)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 21034407)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21034592)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2805 (class 2606 OID 21034587)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 21034772)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 21034777)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2832 (class 2606 OID 21034732)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 21034737)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2834 (class 2606 OID 21034722)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2833 (class 2606 OID 21034727)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2813 (class 2606 OID 21034632)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 21034552)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2795 (class 2606 OID 21034547)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2797 (class 2606 OID 21034537)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2796 (class 2606 OID 21034542)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 21034717)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 21034712)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 21034432)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2774 (class 2606 OID 21034437)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21034452)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 21034767)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2843 (class 2606 OID 21034782)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21034792)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2855 (class 2606 OID 21034837)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2854 (class 2606 OID 21034842)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2759 (class 2606 OID 21034367)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 21034362)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2764 (class 2606 OID 21034382)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 21034387)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 21034497)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21034512)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 21034507)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 21034502)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-29 13:24:12 CEST

--
-- PostgreSQL database dump complete
--

