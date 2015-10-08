--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-08 15:09:02 CEST

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
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21564957)
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
-- TOC entry 229 (class 1259 OID 21565514)
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
-- TOC entry 228 (class 1259 OID 21565497)
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
-- TOC entry 219 (class 1259 OID 21565374)
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
-- TOC entry 222 (class 1259 OID 21565404)
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
-- TOC entry 243 (class 1259 OID 21565773)
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
-- TOC entry 197 (class 1259 OID 21565165)
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
-- TOC entry 199 (class 1259 OID 21565196)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21565699)
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
-- TOC entry 190 (class 1259 OID 21565078)
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
-- TOC entry 230 (class 1259 OID 21565527)
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskkoprgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskkoprzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprzamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovigost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprgost numeric(15,2) DEFAULT 0::numeric NOT NULL,
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
    zvrst character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    reziser character varying(255) DEFAULT NULL::character varying,
    datum date,
    soustvarjalci character varying(255) DEFAULT NULL::character varying,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
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
-- TOC entry 215 (class 1259 OID 21565329)
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
-- TOC entry 195 (class 1259 OID 21565144)
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
-- TOC entry 193 (class 1259 OID 21565118)
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
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21565095)
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
-- TOC entry 204 (class 1259 OID 21565243)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21565754)
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
-- TOC entry 242 (class 1259 OID 21565766)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21565788)
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
-- TOC entry 170 (class 1259 OID 21093458)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21565268)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21565052)
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
-- TOC entry 182 (class 1259 OID 21564966)
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
-- TOC entry 183 (class 1259 OID 21564977)
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
-- TOC entry 178 (class 1259 OID 21564931)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21564950)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21565275)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21565309)
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
-- TOC entry 225 (class 1259 OID 21565445)
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
-- TOC entry 185 (class 1259 OID 21565010)
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
-- TOC entry 187 (class 1259 OID 21565044)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21565644)
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
-- TOC entry 205 (class 1259 OID 21565249)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21565029)
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
-- TOC entry 194 (class 1259 OID 21565133)
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
-- TOC entry 207 (class 1259 OID 21565261)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21565658)
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
-- TOC entry 234 (class 1259 OID 21565668)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21565591)
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
    stpremiervelikih integer,
    stpremiermalih integer,
    stpremiermalihkopr integer,
    stpremiervelikihkopr integer,
    stpremiersredkopr integer,
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
    stizvnekomerc numeric(15,2) DEFAULT 0::numeric,
    stizvprem integer,
    stizvpremdoma integer,
    stizvpremkopr integer,
    stizvponprem numeric(15,2) DEFAULT 0::numeric,
    stizvponpremdoma integer,
    stizvponpremzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjslo numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjzam numeric(15,2) DEFAULT 0::numeric,
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 235 (class 1259 OID 21565676)
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
-- TOC entry 211 (class 1259 OID 21565290)
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
-- TOC entry 203 (class 1259 OID 21565234)
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
-- TOC entry 202 (class 1259 OID 21565224)
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
-- TOC entry 224 (class 1259 OID 21565434)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21565364)
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
-- TOC entry 192 (class 1259 OID 21565107)
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
-- TOC entry 175 (class 1259 OID 21564902)
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
-- TOC entry 174 (class 1259 OID 21564900)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21565303)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21564940)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21564924)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21565317)
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
-- TOC entry 206 (class 1259 OID 21565255)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21565201)
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
-- TOC entry 173 (class 1259 OID 21564889)
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
-- TOC entry 172 (class 1259 OID 21564881)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21564876)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21565381)
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
-- TOC entry 184 (class 1259 OID 21565002)
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
-- TOC entry 201 (class 1259 OID 21565211)
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
-- TOC entry 223 (class 1259 OID 21565422)
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
-- TOC entry 236 (class 1259 OID 21565687)
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
-- TOC entry 189 (class 1259 OID 21565064)
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
-- TOC entry 176 (class 1259 OID 21564911)
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
-- TOC entry 227 (class 1259 OID 21565472)
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
-- TOC entry 196 (class 1259 OID 21565155)
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
-- TOC entry 210 (class 1259 OID 21565282)
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
-- TOC entry 221 (class 1259 OID 21565395)
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
-- TOC entry 239 (class 1259 OID 21565734)
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
-- TOC entry 238 (class 1259 OID 21565706)
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
-- TOC entry 240 (class 1259 OID 21565746)
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
-- TOC entry 217 (class 1259 OID 21565354)
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
-- TOC entry 198 (class 1259 OID 21565190)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21565462)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21565344)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21564905)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 21564957)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21565514)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5616-6aec-0674-9a44272b96b5	000d0000-5616-6aec-e6a1-67238c285759	\N	00090000-5616-6aec-ab61-27f4f18b4843	000b0000-5616-6aec-3af6-aac736a95690	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5616-6aec-a48d-a1172e4f3811	000d0000-5616-6aec-604f-6af71af2bf6b	00100000-5616-6aec-1781-85fd3863133a	00090000-5616-6aec-d138-2858858df9ca	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5616-6aec-d722-04762c102076	000d0000-5616-6aec-b3f8-0959b24ca2f1	00100000-5616-6aec-74a6-28a922a210c2	00090000-5616-6aec-e467-71a396e0028c	\N	0003	t	\N	2015-10-08	\N	2	t	\N	f	f
000c0000-5616-6aec-dcb2-0b6abc450deb	000d0000-5616-6aec-29bb-cbb1c8b66a69	\N	00090000-5616-6aec-bf47-0cd6270a6a86	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5616-6aec-0845-94ea7509f7ae	000d0000-5616-6aec-abd8-d286782ce633	\N	00090000-5616-6aec-0ec7-02e6e83808d7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5616-6aec-62e0-971abfffb152	000d0000-5616-6aec-e375-ab89578d87af	\N	00090000-5616-6aec-40d8-34665e2be6b5	000b0000-5616-6aec-eea9-2e6f87d13e14	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5616-6aec-f41c-26f4e37dea53	000d0000-5616-6aec-76cd-bb06bccd3d7c	00100000-5616-6aec-10a9-86b01dc07003	00090000-5616-6aec-b500-c66cd4620cb8	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5616-6aec-17f6-5e2bf53bb566	000d0000-5616-6aec-fcc5-a80255ee8131	\N	00090000-5616-6aec-c85b-c32de9641aa6	000b0000-5616-6aec-d030-35b8d66d03f1	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5616-6aec-9d06-330d611d30a6	000d0000-5616-6aec-76cd-bb06bccd3d7c	00100000-5616-6aec-11b9-2ac6a7fb07f8	00090000-5616-6aec-49af-de988a88e7cf	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5616-6aec-2c22-c38c57b4fd6d	000d0000-5616-6aec-76cd-bb06bccd3d7c	00100000-5616-6aec-36a2-651bd09b25a8	00090000-5616-6aec-67f6-d32bffc89dac	\N	0010	t	\N	2015-10-08	\N	16	f	\N	f	t
000c0000-5616-6aec-31ed-039563dfe783	000d0000-5616-6aec-76cd-bb06bccd3d7c	00100000-5616-6aec-65f1-bedb9dd48805	00090000-5616-6aec-69e6-e98994504bc5	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5616-6aec-94ec-83deb9a7b392	000d0000-5616-6aec-5091-984e0ff75901	\N	00090000-5616-6aec-d138-2858858df9ca	000b0000-5616-6aec-4a40-247f2c2f5b66	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3041 (class 0 OID 21565497)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21565374)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5616-6aec-cea6-7d6e4403d45d	00160000-5616-6aeb-73b6-c2650e604d91	00090000-5616-6aec-a2d1-b147c79b7dca	aizv	10	t
003d0000-5616-6aec-a2b8-5424c88fcba9	00160000-5616-6aeb-73b6-c2650e604d91	00090000-5616-6aec-2ed4-0a52213f743e	apri	14	t
003d0000-5616-6aec-e611-23ec92ca5b8c	00160000-5616-6aeb-7cc2-450b297a4c81	00090000-5616-6aec-40cc-4a6ff0378d20	aizv	11	t
003d0000-5616-6aec-d660-897949b6a357	00160000-5616-6aeb-264b-f7d0894c6ea8	00090000-5616-6aec-b8e1-56eda73edbc9	aizv	12	t
003d0000-5616-6aec-7961-bbb108df352b	00160000-5616-6aeb-73b6-c2650e604d91	00090000-5616-6aec-23a4-45c44a8e206e	apri	18	f
\.


--
-- TOC entry 3035 (class 0 OID 21565404)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5616-6aeb-73b6-c2650e604d91	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5616-6aeb-7cc2-450b297a4c81	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5616-6aeb-264b-f7d0894c6ea8	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3056 (class 0 OID 21565773)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21565165)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5616-6aec-97ef-a73d7e18489c	\N	\N	00200000-5616-6aec-1e1a-70be35111c75	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5616-6aec-9f2d-0fd5674bac28	\N	\N	00200000-5616-6aec-de6d-6264c6d8fa9a	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5616-6aec-358d-cfc2a56c00de	\N	\N	00200000-5616-6aec-3c04-6ee1d8e31fdd	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5616-6aec-90f6-d0f7b12436dc	\N	\N	00200000-5616-6aec-c671-d6501c3f2936	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5616-6aec-c53f-b948cccd0f8f	\N	\N	00200000-5616-6aec-b9c1-f4e454cd2ac1	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3012 (class 0 OID 21565196)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21565699)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21565078)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5616-6aea-d751-70d12f249498	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5616-6aea-0126-07d25396c8c4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5616-6aea-fa39-0224dfcb3590	AL	ALB	008	Albania 	Albanija	\N
00040000-5616-6aea-5dce-97a534edd681	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5616-6aea-a8fc-3d534a8a73e2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5616-6aea-4d1a-28b5c91ba713	AD	AND	020	Andorra 	Andora	\N
00040000-5616-6aea-95e7-13c60b2a0db2	AO	AGO	024	Angola 	Angola	\N
00040000-5616-6aea-4cab-2f39243ca93a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5616-6aea-fec5-eb31b8ccf804	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5616-6aea-182e-58753dcf4d02	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5616-6aea-d30b-d0ea54d4d2f0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5616-6aea-77e5-2460bf5a649c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5616-6aea-598c-9f7b5c7490ca	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5616-6aea-4dd4-871381b642be	AU	AUS	036	Australia 	Avstralija	\N
00040000-5616-6aea-c45d-9a494a39e2ad	AT	AUT	040	Austria 	Avstrija	\N
00040000-5616-6aea-eb45-affbbe196dfc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5616-6aea-68c8-35e999568e6b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5616-6aea-fc65-45ed678a937e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5616-6aea-70c3-6db23a21157a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5616-6aea-53fc-bd0b96969b45	BB	BRB	052	Barbados 	Barbados	\N
00040000-5616-6aea-bba6-bee4999a5d04	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5616-6aea-5e1c-77301c2a07c9	BE	BEL	056	Belgium 	Belgija	\N
00040000-5616-6aea-b1a1-f4e5de42fcf5	BZ	BLZ	084	Belize 	Belize	\N
00040000-5616-6aea-4bce-112536fe6418	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5616-6aea-9e38-239e3979eae0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5616-6aea-7464-65f2aa2f00da	BT	BTN	064	Bhutan 	Butan	\N
00040000-5616-6aea-b708-985f2d254852	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5616-6aea-2456-0c72cabf7cea	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5616-6aea-ba1b-867824ffa901	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5616-6aea-43df-be664b1785be	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5616-6aea-678b-5ef2a7b0826d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5616-6aea-18a9-cd2d497a81e9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5616-6aea-734d-252b2139f0ec	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5616-6aea-cee2-60fef6ccef5f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5616-6aea-230d-f5be397db934	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5616-6aea-e82c-b10c6b833b88	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5616-6aea-c5c9-46496d42f613	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5616-6aea-b5ef-3796297673a0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5616-6aea-9d0a-e7705672ab57	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5616-6aea-520f-08b0afec2d4f	CA	CAN	124	Canada 	Kanada	\N
00040000-5616-6aea-e71f-eb5a3fbd35a7	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5616-6aea-3497-b6140a6194c4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5616-6aea-134c-e36065b1043b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5616-6aea-569b-af436cd0da10	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5616-6aea-8413-ad4c398046f8	CL	CHL	152	Chile 	Čile	\N
00040000-5616-6aea-5a2e-d0942eaa4ec1	CN	CHN	156	China 	Kitajska	\N
00040000-5616-6aea-1867-9c712b6066dc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5616-6aea-90da-d9f5e62a4bc5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5616-6aea-05fd-02a366dd48a6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5616-6aea-1e6e-cca6092df132	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5616-6aea-77d3-0ab9173e536f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5616-6aea-3493-ce73e0b62bb4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5616-6aea-a5af-2a8c7d1a0480	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5616-6aea-8289-b1a3aaf9fb10	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5616-6aea-9a42-d59a41daa086	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5616-6aea-8575-4002d521eff6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5616-6aea-ca62-dc2cff9837a9	CU	CUB	192	Cuba 	Kuba	\N
00040000-5616-6aea-aae7-5e7374bff22f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5616-6aea-6358-505f2876b94f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5616-6aea-14fc-25aa3208d8d5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5616-6aea-f0b3-ecba1b07356d	DK	DNK	208	Denmark 	Danska	\N
00040000-5616-6aea-39f6-3c60dad86816	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5616-6aea-211f-56050529b1ef	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5616-6aea-3331-a6c6a6ddf090	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5616-6aea-54a1-989c5d78c805	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5616-6aea-6c9d-b26105237da9	EG	EGY	818	Egypt 	Egipt	\N
00040000-5616-6aea-4d64-a4051cf0c284	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5616-6aea-fb1e-34fbfc96d2f6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5616-6aea-0486-989799fce156	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5616-6aea-6628-53b1a0d08fb2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5616-6aea-cbb5-1ff68688baba	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5616-6aea-bc8c-9bfcbf125711	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5616-6aea-6acf-d46379281df0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5616-6aea-f8eb-e2ea44dde049	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5616-6aea-a5cd-224719fe8265	FI	FIN	246	Finland 	Finska	\N
00040000-5616-6aea-6320-3c8fd3579c71	FR	FRA	250	France 	Francija	\N
00040000-5616-6aea-a901-fd36ad89dbde	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5616-6aea-f46d-f3850db4decc	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5616-6aea-7e28-590e58d705ad	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5616-6aea-aa27-7212221b0d73	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5616-6aea-6d94-580a0c88ada7	GA	GAB	266	Gabon 	Gabon	\N
00040000-5616-6aea-7888-64a17a495ec2	GM	GMB	270	Gambia 	Gambija	\N
00040000-5616-6aea-bdce-ca24dae1d70b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5616-6aea-7b0c-6b98f730e674	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5616-6aea-d276-b74d83314ab6	GH	GHA	288	Ghana 	Gana	\N
00040000-5616-6aea-bfdb-17a96355e9d3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5616-6aea-8496-138e8a390a49	GR	GRC	300	Greece 	Grčija	\N
00040000-5616-6aea-d6c0-d95d3520575c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5616-6aea-40be-c4750cdbfef4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5616-6aea-1899-4edd61800213	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5616-6aea-d40b-b7e2d1921e8e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5616-6aea-3d22-1e6e8671d21f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5616-6aea-07ea-166fdaaa5a9d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5616-6aea-fd9f-78ca9e980c4e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5616-6aea-c34e-40a8bca76dd4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5616-6aea-ad16-af9271136a9c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5616-6aea-abd8-0515d0698b41	HT	HTI	332	Haiti 	Haiti	\N
00040000-5616-6aea-87e2-c5c4aa168d66	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5616-6aea-2d4e-b4630bfe7e71	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5616-6aea-cec2-aee4f5f45064	HN	HND	340	Honduras 	Honduras	\N
00040000-5616-6aea-bab0-f5bee185abd4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5616-6aea-a0e2-3753a5a81708	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5616-6aea-9404-d10e8384df5c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5616-6aea-0b41-6585fa407d8e	IN	IND	356	India 	Indija	\N
00040000-5616-6aea-949f-44f5629c1bf0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5616-6aea-6989-7f98db90372a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5616-6aea-cd96-d77d05bd638d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5616-6aea-1c66-eb025feeab96	IE	IRL	372	Ireland 	Irska	\N
00040000-5616-6aea-0ad0-bfdfb9812550	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5616-6aea-ff19-afccd18420e8	IL	ISR	376	Israel 	Izrael	\N
00040000-5616-6aea-662b-74e65a38ecc8	IT	ITA	380	Italy 	Italija	\N
00040000-5616-6aea-6eef-da4250832137	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5616-6aea-b49b-2546b622c157	JP	JPN	392	Japan 	Japonska	\N
00040000-5616-6aea-59ef-e1cc5669ef55	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5616-6aea-e20b-8f975f5a385c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5616-6aea-1773-12c66cde33f5	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5616-6aea-233e-3a2fa9a16ce0	KE	KEN	404	Kenya 	Kenija	\N
00040000-5616-6aea-8d34-f11a86dd1e0a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5616-6aea-dc80-9a93ac9a2510	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5616-6aea-c02c-06e9205214b4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5616-6aea-767e-e4fabd27fcfd	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5616-6aea-54eb-38f4dc28d8c6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5616-6aea-0f9a-3f237405fbc1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5616-6aea-4e55-12485bb29b18	LV	LVA	428	Latvia 	Latvija	\N
00040000-5616-6aea-7b14-bbca93ac243b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5616-6aea-2a56-8b781d5f0f75	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5616-6aea-3589-c3c5f0eae077	LR	LBR	430	Liberia 	Liberija	\N
00040000-5616-6aea-fe3c-6c63f09e8597	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5616-6aea-ccd2-824d471d86fb	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5616-6aea-3fef-298b2c7bd510	LT	LTU	440	Lithuania 	Litva	\N
00040000-5616-6aea-02cf-acf97e18027b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5616-6aea-1dff-ec879de371a7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5616-6aea-1782-6ded4074012b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5616-6aea-b7c3-686fecceaa95	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5616-6aea-dcd5-4dabea40a86e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5616-6aea-0cbd-69b5c247a9b5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5616-6aea-d33f-5ec6e182dc3b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5616-6aea-d8dd-c85a0cc6416a	ML	MLI	466	Mali 	Mali	\N
00040000-5616-6aea-a882-7880aaa39108	MT	MLT	470	Malta 	Malta	\N
00040000-5616-6aea-47fb-51560a07819a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5616-6aea-5c74-ba5e5ffe712a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5616-6aea-bb40-dbadf54fe75a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5616-6aea-fa40-1d72710cd1b2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5616-6aea-4a30-4a485e5bab0f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5616-6aea-c1ff-39c354581f90	MX	MEX	484	Mexico 	Mehika	\N
00040000-5616-6aea-ad2a-0fbb9150640e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5616-6aea-b210-65b4ac5afebb	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5616-6aea-3120-96fe652a1500	MC	MCO	492	Monaco 	Monako	\N
00040000-5616-6aea-0d4c-b312db50868c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5616-6aea-c579-a192921caa9e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5616-6aea-5f35-e45ce6cea2bf	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5616-6aea-f3ef-29729771f04d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5616-6aea-7505-efbd02cc0c50	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5616-6aea-7b3d-5bd855a9c031	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5616-6aea-68e6-38d3f174932d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5616-6aea-bb8e-d7f3ee260e15	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5616-6aea-5af9-056cf84cb9ef	NP	NPL	524	Nepal 	Nepal	\N
00040000-5616-6aea-65fe-9645d0faa93b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5616-6aea-8909-7bcca7b31872	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5616-6aea-44ae-855a0cbb46fc	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5616-6aea-5840-e91238c1e412	NE	NER	562	Niger 	Niger 	\N
00040000-5616-6aea-415a-fe09ba117e22	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5616-6aea-772f-3f045d410851	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5616-6aea-6cf1-c1342bff9839	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5616-6aea-e405-58dbf8496072	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5616-6aea-698f-9b792c8abcce	NO	NOR	578	Norway 	Norveška	\N
00040000-5616-6aea-28a3-986d722bf105	OM	OMN	512	Oman 	Oman	\N
00040000-5616-6aea-16c2-79a71da17aca	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5616-6aea-5821-c9a484199eb5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5616-6aea-eb4f-08c71ae2035d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5616-6aea-9aee-773d08722875	PA	PAN	591	Panama 	Panama	\N
00040000-5616-6aea-511d-9d9030e8181a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5616-6aea-fd18-053dbc692dd0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5616-6aea-767e-f918aff23528	PE	PER	604	Peru 	Peru	\N
00040000-5616-6aea-1bde-204dcf7527c8	PH	PHL	608	Philippines 	Filipini	\N
00040000-5616-6aea-360e-2f0b0d52a850	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5616-6aea-6f93-29e4f131f84c	PL	POL	616	Poland 	Poljska	\N
00040000-5616-6aea-5252-c0dfaf12249b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5616-6aea-96a1-3beda5cfd6db	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5616-6aea-506b-97991722ffb7	QA	QAT	634	Qatar 	Katar	\N
00040000-5616-6aea-78da-11625b2fa2ae	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5616-6aea-5a5e-26806d182292	RO	ROU	642	Romania 	Romunija	\N
00040000-5616-6aea-6b01-9dc4628a58b4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5616-6aea-ca30-b0f162dd9086	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5616-6aea-6fc3-d0edf3c14faa	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5616-6aea-a1b1-06289efa5e51	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5616-6aea-6953-85a92995ad4b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5616-6aea-97a2-f4a872f1050f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5616-6aea-118e-ad1b3483fed3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5616-6aea-2df3-13514f8faa6b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5616-6aea-1f7f-956b8b1ee7c6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5616-6aea-8050-c4e85d10b2a8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5616-6aea-7f4e-13fe3a3aa5b6	SM	SMR	674	San Marino 	San Marino	\N
00040000-5616-6aea-3698-2a70dc1fb151	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5616-6aea-cbdc-3e3782751314	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5616-6aea-61a0-c321890c931a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5616-6aea-5afb-9133f7ee30a2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5616-6aea-c90d-2f4d6ae513d8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5616-6aea-b75d-35bc1fc3a9bc	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5616-6aea-d6cf-a450a155e1b3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5616-6aea-5400-0cbe313fbc38	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5616-6aea-b34c-f90e3ddb53cb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5616-6aea-497e-f2e5ac51df27	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5616-6aea-040b-6bd67ff81dff	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5616-6aea-2117-92dc6c55433b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5616-6aea-3465-c61b0ca8fcca	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5616-6aea-04ee-06160b20c30b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5616-6aea-63aa-279328ccbb2c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5616-6aea-c3e2-f33c8c2b2c95	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5616-6aea-621a-758e98609fe4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5616-6aea-c85c-471cb3f195ea	SD	SDN	729	Sudan 	Sudan	\N
00040000-5616-6aea-11a4-d6a7157cb132	SR	SUR	740	Suriname 	Surinam	\N
00040000-5616-6aea-94b9-f124f820e094	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5616-6aea-2d58-f5759fdfb4b8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5616-6aea-aca4-cb732bdf2529	SE	SWE	752	Sweden 	Švedska	\N
00040000-5616-6aea-1894-a331332db15e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5616-6aea-7202-9e94f3f459de	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5616-6aea-9a82-0428e5c952dc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5616-6aea-190a-32af95041eb4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5616-6aea-3dbc-934d777f24c1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5616-6aea-64c9-e308c2ffecdc	TH	THA	764	Thailand 	Tajska	\N
00040000-5616-6aea-fe6c-6d883e13f939	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5616-6aea-a37b-6b8ca51bd2b8	TG	TGO	768	Togo 	Togo	\N
00040000-5616-6aea-848b-d8e1db1d3db9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5616-6aea-2b37-6d69dcdbd09b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5616-6aea-bb6d-8fed44259023	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5616-6aea-26fe-4e50d044d5e2	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5616-6aea-f26e-81c3e3bc41bc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5616-6aea-289c-ef037a6ce865	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5616-6aea-eb56-2a7f815d1db0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5616-6aea-a564-fecd596cb537	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5616-6aea-f110-470aa731a5c7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5616-6aea-c777-e793832a0a17	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5616-6aea-ba28-1343d5dd32b6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5616-6aea-09f2-0a32232bd408	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5616-6aea-7834-b384c8f713f0	US	USA	840	United States 	Združene države Amerike	\N
00040000-5616-6aea-1c9c-c3e88e353ea4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5616-6aea-2193-4a9645c728b8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5616-6aea-3b7a-4d20947adf31	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5616-6aea-252d-1e6117d80586	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5616-6aea-1af3-50950be5d102	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5616-6aea-fcc7-a239070d8762	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5616-6aea-00a2-0376861e9f9b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5616-6aea-d761-f6c8d65f3def	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5616-6aea-837f-d18ffdaa297b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5616-6aea-398b-09b288bc690a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5616-6aea-b56e-2b0335e159ed	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5616-6aea-dddd-7e6da88bf554	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5616-6aea-c1c8-8f5341f5fec1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 21565527)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5616-6aec-4ce6-e9f4c9427ea3	000e0000-5616-6aec-94af-da26e2ea7abf	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5616-6aea-4f74-bac9000226e4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5616-6aec-4797-7a169430645b	000e0000-5616-6aec-80e5-90b36998e5f8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5616-6aea-795b-e4e24f1204e0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5616-6aec-dc35-5c986bf71ab9	000e0000-5616-6aec-5291-4e8bab8af134	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5616-6aea-4f74-bac9000226e4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5616-6aec-8f10-4eb7ece2465e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5616-6aec-dc9c-739cfd30824b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 21565329)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5616-6aec-e6a1-67238c285759	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-0674-9a44272b96b5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5616-6aea-fafe-99c58bfc1132
000d0000-5616-6aec-604f-6af71af2bf6b	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-a48d-a1172e4f3811	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5616-6aea-9104-3963892e9d5a
000d0000-5616-6aec-b3f8-0959b24ca2f1	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-d722-04762c102076	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5616-6aea-b414-b9296ad8f6a2
000d0000-5616-6aec-29bb-cbb1c8b66a69	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-dcb2-0b6abc450deb	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5616-6aea-8312-e8f4442100a9
000d0000-5616-6aec-abd8-d286782ce633	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-0845-94ea7509f7ae	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5616-6aea-8312-e8f4442100a9
000d0000-5616-6aec-e375-ab89578d87af	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-62e0-971abfffb152	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5616-6aea-fafe-99c58bfc1132
000d0000-5616-6aec-76cd-bb06bccd3d7c	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-9d06-330d611d30a6	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5616-6aea-fafe-99c58bfc1132
000d0000-5616-6aec-fcc5-a80255ee8131	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-17f6-5e2bf53bb566	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5616-6aea-5dbb-339ea536fba0
000d0000-5616-6aec-5091-984e0ff75901	000e0000-5616-6aec-80e5-90b36998e5f8	000c0000-5616-6aec-94ec-83deb9a7b392	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5616-6aea-7597-94660a8011db
\.


--
-- TOC entry 3008 (class 0 OID 21565144)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21565118)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21565095)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5616-6aec-dcc1-0c5905986143	00080000-5616-6aeb-c62d-38f9a8d08295	00090000-5616-6aec-67f6-d32bffc89dac	AK		igralka
\.


--
-- TOC entry 3017 (class 0 OID 21565243)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21565754)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21565766)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 21565788)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 21093458)
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
20150929204104
\.


--
-- TOC entry 3021 (class 0 OID 21565268)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21565052)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5616-6aea-864d-689b461c45eb	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5616-6aea-eab1-0d4620f0fecc	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5616-6aea-b8c2-8fe28fd4987a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5616-6aea-238c-d1c65d9f668b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5616-6aea-6274-aedf5fa5513d	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5616-6aea-4572-f935370e473c	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5616-6aea-6513-7c54a6785ce5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5616-6aea-5499-aa3c025f79ea	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5616-6aea-4624-5d90d6547346	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5616-6aea-8294-925178c659ed	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5616-6aea-a109-8ea9b68382fb	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5616-6aea-9261-99aba94845cb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5616-6aea-22c8-5551a10efeb6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5616-6aea-7813-18724257fd7c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5616-6aea-858c-2c3983008dc9	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5616-6aeb-f64f-d0bed7bb0e7b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5616-6aeb-646c-1b3edd2a112a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5616-6aeb-7093-a77427253eab	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5616-6aeb-23c3-a54fd360dad6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5616-6aeb-d0db-4a43193ef2a6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5616-6aed-4f76-b6816cbea74a	application.tenant.maticnopodjetje	string	s:36:"00080000-5616-6aed-6998-19f92fa958a7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2995 (class 0 OID 21564966)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5616-6aeb-28e2-c0d7255c3f16	00000000-5616-6aeb-f64f-d0bed7bb0e7b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5616-6aeb-efcb-b42fef1ea5be	00000000-5616-6aeb-f64f-d0bed7bb0e7b	00010000-5616-6aea-50a1-08764d39d94d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5616-6aeb-82df-14b4fcd11a5d	00000000-5616-6aeb-646c-1b3edd2a112a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2996 (class 0 OID 21564977)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5616-6aec-ab61-27f4f18b4843	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5616-6aec-bf47-0cd6270a6a86	00010000-5616-6aec-2e99-51f2de23da74	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5616-6aec-e467-71a396e0028c	00010000-5616-6aec-075c-d273d7e947bf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5616-6aec-49af-de988a88e7cf	00010000-5616-6aec-4beb-5a472f9b24ec	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5616-6aec-1bb0-941c9d3f7673	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5616-6aec-40d8-34665e2be6b5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5616-6aec-69e6-e98994504bc5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5616-6aec-b500-c66cd4620cb8	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5616-6aec-67f6-d32bffc89dac	00010000-5616-6aec-6d7c-697294ca7ae3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5616-6aec-d138-2858858df9ca	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5616-6aec-d444-6ecbc25b9fbf	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5616-6aec-0ec7-02e6e83808d7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5616-6aec-c85b-c32de9641aa6	00010000-5616-6aec-4ef8-923fb6b9a323	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5616-6aec-a2d1-b147c79b7dca	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5616-6aec-2ed4-0a52213f743e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5616-6aec-40cc-4a6ff0378d20	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5616-6aec-b8e1-56eda73edbc9	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5616-6aec-23a4-45c44a8e206e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2991 (class 0 OID 21564931)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5616-6aea-a471-f908adf0980d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5616-6aea-a744-785bc03d52cd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5616-6aea-62e7-a48ce3c9b307	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5616-6aea-27d5-13002f82d665	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5616-6aea-fb5d-88cf0cfb4e09	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5616-6aea-d9a0-195e2e772b4a	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5616-6aea-3a0a-82411bca03c5	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5616-6aea-dd3f-a3c165eabd61	Abonma-read	Abonma - branje	f
00030000-5616-6aea-c139-f9aa96e71be7	Abonma-write	Abonma - spreminjanje	f
00030000-5616-6aea-709c-43ff34fef971	Alternacija-read	Alternacija - branje	f
00030000-5616-6aea-23fe-29ffbc7b9371	Alternacija-write	Alternacija - spreminjanje	f
00030000-5616-6aea-5c21-3e122b02b30d	Arhivalija-read	Arhivalija - branje	f
00030000-5616-6aea-ffe3-c288dbf12787	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5616-6aea-bedc-75e77d496027	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5616-6aea-109f-26019db576de	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5616-6aea-2980-4b423584d498	Besedilo-read	Besedilo - branje	f
00030000-5616-6aea-eadd-f9dd82477a23	Besedilo-write	Besedilo - spreminjanje	f
00030000-5616-6aea-63f3-f5e8ef347025	DogodekIzven-read	DogodekIzven - branje	f
00030000-5616-6aea-98af-8dd272d7f8a2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5616-6aea-6f05-cff4af1ec70b	Dogodek-read	Dogodek - branje	f
00030000-5616-6aea-6221-3f0b422c1e55	Dogodek-write	Dogodek - spreminjanje	f
00030000-5616-6aea-5b6e-d9466aba70e8	DrugiVir-read	DrugiVir - branje	f
00030000-5616-6aea-d22d-0a1135ff2d8e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5616-6aea-a315-bfc72f88c4f6	Drzava-read	Drzava - branje	f
00030000-5616-6aea-dffe-3a5e299e0e3a	Drzava-write	Drzava - spreminjanje	f
00030000-5616-6aea-356d-e864e8166418	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5616-6aea-3d36-e9a486e53acd	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5616-6aea-8768-0c6e88cfa110	Funkcija-read	Funkcija - branje	f
00030000-5616-6aea-cddc-d5935502b101	Funkcija-write	Funkcija - spreminjanje	f
00030000-5616-6aea-1d17-c8a2fc67403b	Gostovanje-read	Gostovanje - branje	f
00030000-5616-6aea-bfdf-bf23f2a13834	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5616-6aea-8b7e-4d61e59ff220	Gostujoca-read	Gostujoca - branje	f
00030000-5616-6aea-61cd-7baaf784a382	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5616-6aea-0d8e-3ee2602bf0ae	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5616-6aea-a363-6092c3d3e143	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5616-6aea-dc97-fbb4ef31ace3	Kupec-read	Kupec - branje	f
00030000-5616-6aea-f86d-553e1ae397e4	Kupec-write	Kupec - spreminjanje	f
00030000-5616-6aea-c9ef-feaa754946b2	NacinPlacina-read	NacinPlacina - branje	f
00030000-5616-6aea-e9ea-7d9a188422d2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5616-6aea-c64b-c10e0ebaab61	Option-read	Option - branje	f
00030000-5616-6aea-80c3-86d1fb6c6e01	Option-write	Option - spreminjanje	f
00030000-5616-6aea-a36b-337e410198bc	OptionValue-read	OptionValue - branje	f
00030000-5616-6aea-d4a6-a74d190d7640	OptionValue-write	OptionValue - spreminjanje	f
00030000-5616-6aea-c6a6-b1fe42639f45	Oseba-read	Oseba - branje	f
00030000-5616-6aea-b14a-48c26567d779	Oseba-write	Oseba - spreminjanje	f
00030000-5616-6aea-e4f4-38d84df96c85	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5616-6aea-370d-42c473430499	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5616-6aea-2bed-2f5174ec7d1b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5616-6aea-5e8f-bf42f909e447	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5616-6aea-425a-781de4bc7d74	Pogodba-read	Pogodba - branje	f
00030000-5616-6aea-bc46-7930d60f2e6b	Pogodba-write	Pogodba - spreminjanje	f
00030000-5616-6aea-9025-274ad828b056	Popa-read	Popa - branje	f
00030000-5616-6aea-7417-e6bb8e8fde0f	Popa-write	Popa - spreminjanje	f
00030000-5616-6aea-100c-defe72ff3928	Posta-read	Posta - branje	f
00030000-5616-6aea-fe34-7f278ef16553	Posta-write	Posta - spreminjanje	f
00030000-5616-6aea-3622-22c8f46ac198	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5616-6aea-7e22-7bb2c6f03e0a	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5616-6aea-d7d0-ec6478a8f13b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5616-6aea-fa62-7d005ba556e1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5616-6aea-7766-07850da0f425	PostniNaslov-read	PostniNaslov - branje	f
00030000-5616-6aea-c7d4-e3eeaf2aa175	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5616-6aea-2012-1b66a4491497	Predstava-read	Predstava - branje	f
00030000-5616-6aea-ecd5-349038518d73	Predstava-write	Predstava - spreminjanje	f
00030000-5616-6aea-5c46-09212af4125d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5616-6aea-2980-cfc087f5e882	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5616-6aea-99f0-a2f99563bddf	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5616-6aea-cecf-5f7dd3f874c0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5616-6aea-c5e7-9a1092971d8f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5616-6aea-4644-bf2e15230e5d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5616-6aea-c4bf-cee5f7ec63f6	ProgramDela-read	ProgramDela - branje	f
00030000-5616-6aea-48fc-522c48f1aa95	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5616-6aea-8fe4-bb6c5c0772d7	ProgramFestival-read	ProgramFestival - branje	f
00030000-5616-6aea-9110-54e64811a92d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5616-6aea-cc16-05850bc1958c	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5616-6aea-fc23-7753c43257a7	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5616-6aea-d3e8-777c4a246ff6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5616-6aea-ed6b-93676f1fcf9c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5616-6aea-4487-8b7ff9cc9a1c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5616-6aea-2ee1-3bd140221d5d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5616-6aea-576d-4467c2c78bb2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5616-6aea-89dd-9f00353e5000	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5616-6aea-04ae-abeb13544e17	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5616-6aea-8d85-1dca6ff010de	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5616-6aea-fa4a-85185745a2bd	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5616-6aea-e632-fc152bcd72e7	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5616-6aea-6510-207350b64d1b	ProgramRazno-read	ProgramRazno - branje	f
00030000-5616-6aea-8a6d-25e4b225803c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5616-6aea-7398-d84c4c5bf485	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5616-6aea-ad6d-3828ecc8efe4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5616-6aea-d8d6-8bd3dc4c2f0b	Prostor-read	Prostor - branje	f
00030000-5616-6aea-654c-439751ae888c	Prostor-write	Prostor - spreminjanje	f
00030000-5616-6aea-2624-98f28f1de418	Racun-read	Racun - branje	f
00030000-5616-6aea-e1be-519992a24676	Racun-write	Racun - spreminjanje	f
00030000-5616-6aea-5318-43fcc74511f4	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5616-6aea-0486-b7690eceb46d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5616-6aea-bfd4-befbf026ec70	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5616-6aea-4aed-3ab5e813b76b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5616-6aea-2763-fbdc0ba31da4	Rekvizit-read	Rekvizit - branje	f
00030000-5616-6aea-1c61-082cea8051ca	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5616-6aea-89d8-0aea7799779c	Revizija-read	Revizija - branje	f
00030000-5616-6aea-a63f-4f986affff08	Revizija-write	Revizija - spreminjanje	f
00030000-5616-6aea-8667-0ec24350d9a8	Rezervacija-read	Rezervacija - branje	f
00030000-5616-6aea-c902-0f68b40197e1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5616-6aea-7911-45a83994fd1b	SedezniRed-read	SedezniRed - branje	f
00030000-5616-6aea-9155-98cb8a268d38	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5616-6aea-80c9-2ad0c6b71b92	Sedez-read	Sedez - branje	f
00030000-5616-6aea-aa2b-58d56a8aa85a	Sedez-write	Sedez - spreminjanje	f
00030000-5616-6aea-57c5-78038d14c799	Sezona-read	Sezona - branje	f
00030000-5616-6aea-f925-4acf4cf37cdb	Sezona-write	Sezona - spreminjanje	f
00030000-5616-6aea-819b-6c2ac382e277	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5616-6aea-5b88-a29151574a11	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5616-6aea-893e-af5186108f79	Stevilcenje-read	Stevilcenje - branje	f
00030000-5616-6aea-7015-d464b21d48b8	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5616-6aea-96f6-bbfe8979d868	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5616-6aea-a187-f4c23691fcaa	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5616-6aea-43ad-a9f33794f2c0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5616-6aea-33ab-4d3cd381f8c7	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5616-6aea-a8d8-cfe653ca20c4	Telefonska-read	Telefonska - branje	f
00030000-5616-6aea-b0e5-db8680e9972d	Telefonska-write	Telefonska - spreminjanje	f
00030000-5616-6aea-029e-a76183d9af94	TerminStoritve-read	TerminStoritve - branje	f
00030000-5616-6aea-5ce0-fbba9240208c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5616-6aea-4d21-76d7261bcaa3	TipFunkcije-read	TipFunkcije - branje	f
00030000-5616-6aea-b32f-f74352798eaa	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5616-6aea-7990-18bb7e8c5e06	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5616-6aea-ec51-e8a191a111e2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5616-6aea-5514-2a94e71b332b	Trr-read	Trr - branje	f
00030000-5616-6aea-848c-d1eeb31b5273	Trr-write	Trr - spreminjanje	f
00030000-5616-6aea-8b27-5d50e23587e7	Uprizoritev-read	Uprizoritev - branje	f
00030000-5616-6aea-d294-b047d8febdde	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5616-6aea-8257-90a07d84a147	Vaja-read	Vaja - branje	f
00030000-5616-6aea-bc18-74704e086b14	Vaja-write	Vaja - spreminjanje	f
00030000-5616-6aea-69e2-687543e1401d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5616-6aea-3a4c-eb1754ff6239	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5616-6aea-141d-8a726a8ce4a7	VrstaStroska-read	VrstaStroska - branje	f
00030000-5616-6aea-02b8-aec8bab5d1ac	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5616-6aea-08c1-0e3fd1232262	Zaposlitev-read	Zaposlitev - branje	f
00030000-5616-6aea-243f-58c17d6c1c39	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5616-6aea-4c7f-854a908edf99	Zasedenost-read	Zasedenost - branje	f
00030000-5616-6aea-d692-acb7ee2406ed	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5616-6aea-0026-8ff7c2c00272	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5616-6aea-dc7c-74e24e3ce7cb	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5616-6aea-6ea8-5b1811ada16c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5616-6aea-ad2e-05b709af0bde	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5616-6aea-cee0-e522ab477287	Job-read	Branje opravil - samo zase - branje	f
00030000-5616-6aea-54a6-298a4e8fee67	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5616-6aea-9b47-3beed6dcba9d	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5616-6aea-6ac3-fc15dd427b9a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5616-6aea-fb99-88c6cb820739	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5616-6aea-653b-0533b761689e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5616-6aea-b111-758c2dfc3e38	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5616-6aea-a8d1-415463998cf2	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5616-6aea-c08d-8e26dee8bcb0	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5616-6aea-3b52-8fb9fe3d389b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5616-6aea-5191-963b763a3bd6	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5616-6aea-c0cb-f83681a29e38	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5616-6aea-2f5c-dfb5e4c17ce1	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5616-6aea-07ea-95b95fdf7b6f	Datoteka-write	Datoteka - spreminjanje	f
00030000-5616-6aea-ecb3-61336012c565	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2993 (class 0 OID 21564950)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5616-6aea-d7c8-4f30ffdd4ab0	00030000-5616-6aea-a744-785bc03d52cd
00020000-5616-6aea-3244-292deb63e939	00030000-5616-6aea-a315-bfc72f88c4f6
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-dd3f-a3c165eabd61
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-c139-f9aa96e71be7
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-709c-43ff34fef971
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-23fe-29ffbc7b9371
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-5c21-3e122b02b30d
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-6f05-cff4af1ec70b
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-27d5-13002f82d665
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-6221-3f0b422c1e55
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-a315-bfc72f88c4f6
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-dffe-3a5e299e0e3a
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-8768-0c6e88cfa110
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-cddc-d5935502b101
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-1d17-c8a2fc67403b
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-bfdf-bf23f2a13834
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-8b7e-4d61e59ff220
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-61cd-7baaf784a382
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-0d8e-3ee2602bf0ae
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-a363-6092c3d3e143
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-c64b-c10e0ebaab61
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-a36b-337e410198bc
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-c6a6-b1fe42639f45
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-b14a-48c26567d779
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-9025-274ad828b056
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-7417-e6bb8e8fde0f
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-100c-defe72ff3928
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-fe34-7f278ef16553
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-7766-07850da0f425
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-c7d4-e3eeaf2aa175
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-2012-1b66a4491497
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-ecd5-349038518d73
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-c5e7-9a1092971d8f
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-4644-bf2e15230e5d
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-d8d6-8bd3dc4c2f0b
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-654c-439751ae888c
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-bfd4-befbf026ec70
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-4aed-3ab5e813b76b
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-2763-fbdc0ba31da4
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-1c61-082cea8051ca
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-57c5-78038d14c799
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-f925-4acf4cf37cdb
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-4d21-76d7261bcaa3
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-8b27-5d50e23587e7
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-d294-b047d8febdde
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-8257-90a07d84a147
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-bc18-74704e086b14
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-4c7f-854a908edf99
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-d692-acb7ee2406ed
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-0026-8ff7c2c00272
00020000-5616-6aea-0e0d-3243cc7d3a44	00030000-5616-6aea-6ea8-5b1811ada16c
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-dd3f-a3c165eabd61
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-5c21-3e122b02b30d
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-6f05-cff4af1ec70b
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-a315-bfc72f88c4f6
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-1d17-c8a2fc67403b
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-8b7e-4d61e59ff220
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-0d8e-3ee2602bf0ae
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-a363-6092c3d3e143
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-c64b-c10e0ebaab61
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-a36b-337e410198bc
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-c6a6-b1fe42639f45
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-b14a-48c26567d779
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-9025-274ad828b056
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-100c-defe72ff3928
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-7766-07850da0f425
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-c7d4-e3eeaf2aa175
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-2012-1b66a4491497
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-d8d6-8bd3dc4c2f0b
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-bfd4-befbf026ec70
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-2763-fbdc0ba31da4
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-57c5-78038d14c799
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-a8d8-cfe653ca20c4
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-b0e5-db8680e9972d
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-5514-2a94e71b332b
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-848c-d1eeb31b5273
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-08c1-0e3fd1232262
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-243f-58c17d6c1c39
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-0026-8ff7c2c00272
00020000-5616-6aea-c9db-dd38e219c19c	00030000-5616-6aea-6ea8-5b1811ada16c
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-dd3f-a3c165eabd61
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-709c-43ff34fef971
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-5c21-3e122b02b30d
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-ffe3-c288dbf12787
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-2980-4b423584d498
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-63f3-f5e8ef347025
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-6f05-cff4af1ec70b
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-a315-bfc72f88c4f6
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-8768-0c6e88cfa110
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-1d17-c8a2fc67403b
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-8b7e-4d61e59ff220
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-0d8e-3ee2602bf0ae
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-c64b-c10e0ebaab61
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-a36b-337e410198bc
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-c6a6-b1fe42639f45
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-9025-274ad828b056
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-100c-defe72ff3928
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-2012-1b66a4491497
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-c5e7-9a1092971d8f
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-d8d6-8bd3dc4c2f0b
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-bfd4-befbf026ec70
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-2763-fbdc0ba31da4
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-57c5-78038d14c799
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-4d21-76d7261bcaa3
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-8257-90a07d84a147
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-4c7f-854a908edf99
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-0026-8ff7c2c00272
00020000-5616-6aea-0dad-9f6ff40a94b2	00030000-5616-6aea-6ea8-5b1811ada16c
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-dd3f-a3c165eabd61
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-c139-f9aa96e71be7
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-23fe-29ffbc7b9371
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-5c21-3e122b02b30d
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-6f05-cff4af1ec70b
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-a315-bfc72f88c4f6
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-1d17-c8a2fc67403b
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-8b7e-4d61e59ff220
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-c64b-c10e0ebaab61
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-a36b-337e410198bc
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-9025-274ad828b056
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-100c-defe72ff3928
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-2012-1b66a4491497
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-d8d6-8bd3dc4c2f0b
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-bfd4-befbf026ec70
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-2763-fbdc0ba31da4
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-57c5-78038d14c799
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-4d21-76d7261bcaa3
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-0026-8ff7c2c00272
00020000-5616-6aea-efe1-fd133820a081	00030000-5616-6aea-6ea8-5b1811ada16c
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-dd3f-a3c165eabd61
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-5c21-3e122b02b30d
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-6f05-cff4af1ec70b
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-a315-bfc72f88c4f6
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-1d17-c8a2fc67403b
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-8b7e-4d61e59ff220
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-c64b-c10e0ebaab61
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-a36b-337e410198bc
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-9025-274ad828b056
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-100c-defe72ff3928
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-2012-1b66a4491497
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-d8d6-8bd3dc4c2f0b
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-bfd4-befbf026ec70
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-2763-fbdc0ba31da4
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-57c5-78038d14c799
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-029e-a76183d9af94
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-62e7-a48ce3c9b307
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-4d21-76d7261bcaa3
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-0026-8ff7c2c00272
00020000-5616-6aea-b05e-22fe753d15b4	00030000-5616-6aea-6ea8-5b1811ada16c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a471-f908adf0980d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a744-785bc03d52cd
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-62e7-a48ce3c9b307
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-27d5-13002f82d665
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-fb5d-88cf0cfb4e09
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d9a0-195e2e772b4a
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-3a0a-82411bca03c5
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-dd3f-a3c165eabd61
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c139-f9aa96e71be7
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-709c-43ff34fef971
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-23fe-29ffbc7b9371
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5c21-3e122b02b30d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-ffe3-c288dbf12787
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-2980-4b423584d498
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-eadd-f9dd82477a23
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-63f3-f5e8ef347025
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-98af-8dd272d7f8a2
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-6f05-cff4af1ec70b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-6221-3f0b422c1e55
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a315-bfc72f88c4f6
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-dffe-3a5e299e0e3a
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5b6e-d9466aba70e8
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d22d-0a1135ff2d8e
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-356d-e864e8166418
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-3d36-e9a486e53acd
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8768-0c6e88cfa110
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-cddc-d5935502b101
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-1d17-c8a2fc67403b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-bfdf-bf23f2a13834
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8b7e-4d61e59ff220
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-61cd-7baaf784a382
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-0d8e-3ee2602bf0ae
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a363-6092c3d3e143
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-dc97-fbb4ef31ace3
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-f86d-553e1ae397e4
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c9ef-feaa754946b2
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-e9ea-7d9a188422d2
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c64b-c10e0ebaab61
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-80c3-86d1fb6c6e01
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a36b-337e410198bc
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d4a6-a74d190d7640
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c6a6-b1fe42639f45
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-b14a-48c26567d779
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-e4f4-38d84df96c85
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-370d-42c473430499
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-2bed-2f5174ec7d1b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5e8f-bf42f909e447
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-425a-781de4bc7d74
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-bc46-7930d60f2e6b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-9025-274ad828b056
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-7417-e6bb8e8fde0f
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-100c-defe72ff3928
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-fe34-7f278ef16553
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-3622-22c8f46ac198
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-7e22-7bb2c6f03e0a
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d7d0-ec6478a8f13b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-fa62-7d005ba556e1
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-7766-07850da0f425
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c7d4-e3eeaf2aa175
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-2012-1b66a4491497
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-ecd5-349038518d73
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5c46-09212af4125d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-2980-cfc087f5e882
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-99f0-a2f99563bddf
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-cecf-5f7dd3f874c0
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c5e7-9a1092971d8f
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-4644-bf2e15230e5d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c4bf-cee5f7ec63f6
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-48fc-522c48f1aa95
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8fe4-bb6c5c0772d7
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-9110-54e64811a92d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-cc16-05850bc1958c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-fc23-7753c43257a7
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d3e8-777c4a246ff6
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-ed6b-93676f1fcf9c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-4487-8b7ff9cc9a1c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-2ee1-3bd140221d5d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-576d-4467c2c78bb2
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-89dd-9f00353e5000
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-04ae-abeb13544e17
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8d85-1dca6ff010de
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-fa4a-85185745a2bd
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-e632-fc152bcd72e7
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-6510-207350b64d1b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8a6d-25e4b225803c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-7398-d84c4c5bf485
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-ad6d-3828ecc8efe4
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d8d6-8bd3dc4c2f0b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-654c-439751ae888c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-2624-98f28f1de418
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-e1be-519992a24676
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5318-43fcc74511f4
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-0486-b7690eceb46d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-bfd4-befbf026ec70
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-4aed-3ab5e813b76b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-2763-fbdc0ba31da4
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-1c61-082cea8051ca
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-89d8-0aea7799779c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a63f-4f986affff08
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8667-0ec24350d9a8
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-c902-0f68b40197e1
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-7911-45a83994fd1b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-9155-98cb8a268d38
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-80c9-2ad0c6b71b92
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-aa2b-58d56a8aa85a
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-57c5-78038d14c799
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-f925-4acf4cf37cdb
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-819b-6c2ac382e277
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5b88-a29151574a11
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-893e-af5186108f79
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-7015-d464b21d48b8
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-96f6-bbfe8979d868
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a187-f4c23691fcaa
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-43ad-a9f33794f2c0
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-33ab-4d3cd381f8c7
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-a8d8-cfe653ca20c4
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-b0e5-db8680e9972d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-029e-a76183d9af94
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5ce0-fbba9240208c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-4d21-76d7261bcaa3
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-b32f-f74352798eaa
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-7990-18bb7e8c5e06
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-ec51-e8a191a111e2
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-5514-2a94e71b332b
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-848c-d1eeb31b5273
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8b27-5d50e23587e7
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d294-b047d8febdde
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-8257-90a07d84a147
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-bc18-74704e086b14
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-69e2-687543e1401d
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-3a4c-eb1754ff6239
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-141d-8a726a8ce4a7
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-02b8-aec8bab5d1ac
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-08c1-0e3fd1232262
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-243f-58c17d6c1c39
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-4c7f-854a908edf99
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-d692-acb7ee2406ed
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-0026-8ff7c2c00272
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-dc7c-74e24e3ce7cb
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-6ea8-5b1811ada16c
00020000-5616-6aec-2c03-f2a628809c9a	00030000-5616-6aea-ad2e-05b709af0bde
\.


--
-- TOC entry 3022 (class 0 OID 21565275)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21565309)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21565445)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5616-6aec-3af6-aac736a95690	00090000-5616-6aec-ab61-27f4f18b4843	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5616-6aec-eea9-2e6f87d13e14	00090000-5616-6aec-40d8-34665e2be6b5	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5616-6aec-d030-35b8d66d03f1	00090000-5616-6aec-c85b-c32de9641aa6	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5616-6aec-4a40-247f2c2f5b66	00090000-5616-6aec-d138-2858858df9ca	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2998 (class 0 OID 21565010)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5616-6aeb-c62d-38f9a8d08295	00040000-5616-6aea-497e-f2e5ac51df27	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aeb-dfe5-d855ffe3e1c8	00040000-5616-6aea-497e-f2e5ac51df27	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5616-6aeb-f28e-c149ff0bd79f	00040000-5616-6aea-497e-f2e5ac51df27	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aeb-a1fc-1c32577dcd7a	00040000-5616-6aea-497e-f2e5ac51df27	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aeb-ff30-ef8bb384122c	00040000-5616-6aea-497e-f2e5ac51df27	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aeb-7554-734c9611f734	00040000-5616-6aea-d30b-d0ea54d4d2f0	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aeb-2368-2847cec8c5dc	00040000-5616-6aea-8575-4002d521eff6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aeb-211c-78e3abe1d55f	00040000-5616-6aea-c45d-9a494a39e2ad	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aeb-e672-61eb29f6fe8a	00040000-5616-6aea-7b0c-6b98f730e674	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-6aed-6998-19f92fa958a7	00040000-5616-6aea-497e-f2e5ac51df27	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3000 (class 0 OID 21565044)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5616-6ae9-0f0d-5d9d7ac35208	8341	Adlešiči
00050000-5616-6ae9-cd21-be19819b86ee	5270	Ajdovščina
00050000-5616-6ae9-4b53-61b0679fc652	6280	Ankaran/Ancarano
00050000-5616-6ae9-7a02-c14f93b80c92	9253	Apače
00050000-5616-6ae9-dbb8-5bea4ef5e9c8	8253	Artiče
00050000-5616-6ae9-7942-4c86f77261ed	4275	Begunje na Gorenjskem
00050000-5616-6ae9-eb80-2b0251164cd6	1382	Begunje pri Cerknici
00050000-5616-6ae9-3396-c219af5b343a	9231	Beltinci
00050000-5616-6ae9-1cdb-c9f8e4e37b68	2234	Benedikt
00050000-5616-6ae9-3881-49c01ea5c95b	2345	Bistrica ob Dravi
00050000-5616-6ae9-7571-62c630f7770e	3256	Bistrica ob Sotli
00050000-5616-6ae9-3ca6-b066c7c68b96	8259	Bizeljsko
00050000-5616-6ae9-d17a-88617fa08656	1223	Blagovica
00050000-5616-6ae9-98dc-4af4e2eeb02f	8283	Blanca
00050000-5616-6ae9-da9e-2e3419f10646	4260	Bled
00050000-5616-6ae9-b730-be1af6d9cb94	4273	Blejska Dobrava
00050000-5616-6ae9-bef2-e582639519f2	9265	Bodonci
00050000-5616-6ae9-f099-fcc6ab2ec560	9222	Bogojina
00050000-5616-6ae9-1fb0-cbfd752db2f4	4263	Bohinjska Bela
00050000-5616-6ae9-9639-0d1382b6f502	4264	Bohinjska Bistrica
00050000-5616-6ae9-f491-68b67d625cae	4265	Bohinjsko jezero
00050000-5616-6ae9-f4da-bb4cc65f448a	1353	Borovnica
00050000-5616-6ae9-8dc8-bc66554c1494	8294	Boštanj
00050000-5616-6ae9-6557-5826fca10af1	5230	Bovec
00050000-5616-6ae9-35f4-0a83f910766e	5295	Branik
00050000-5616-6ae9-f5ef-cb746d455521	3314	Braslovče
00050000-5616-6ae9-257b-2426808e3d62	5223	Breginj
00050000-5616-6ae9-6d3b-526826d9feec	8280	Brestanica
00050000-5616-6ae9-2cc9-843c7478e555	2354	Bresternica
00050000-5616-6ae9-a465-18b44a7718bb	4243	Brezje
00050000-5616-6ae9-45c2-77ad7864f20a	1351	Brezovica pri Ljubljani
00050000-5616-6ae9-31fa-4b8d79f435e5	8250	Brežice
00050000-5616-6ae9-9722-e4186128cb07	4210	Brnik - Aerodrom
00050000-5616-6ae9-1da1-64be0d15f854	8321	Brusnice
00050000-5616-6ae9-0227-d61d8ab89829	3255	Buče
00050000-5616-6ae9-352a-c7ed4b2523bd	8276	Bučka 
00050000-5616-6ae9-3a2a-f00b8756fa15	9261	Cankova
00050000-5616-6ae9-b513-326cb35b9c15	3000	Celje 
00050000-5616-6ae9-6883-ac1d54630c1c	3001	Celje - poštni predali
00050000-5616-6ae9-6ff1-14c92e50885e	4207	Cerklje na Gorenjskem
00050000-5616-6ae9-93c6-f2f46e0dcde0	8263	Cerklje ob Krki
00050000-5616-6ae9-e12e-44b22a2113bb	1380	Cerknica
00050000-5616-6ae9-0940-2e34ee093f0b	5282	Cerkno
00050000-5616-6ae9-6f6b-c55b21ae7227	2236	Cerkvenjak
00050000-5616-6ae9-ef59-887e76f4b359	2215	Ceršak
00050000-5616-6ae9-cc0e-e238860e5e26	2326	Cirkovce
00050000-5616-6ae9-aaa8-8bf80662b9c4	2282	Cirkulane
00050000-5616-6ae9-fda9-e13991a7bd59	5273	Col
00050000-5616-6ae9-74be-f6ff2b82e766	8251	Čatež ob Savi
00050000-5616-6ae9-6a6a-f62a6377191c	1413	Čemšenik
00050000-5616-6ae9-ea22-c9b47bda4a59	5253	Čepovan
00050000-5616-6ae9-40b2-a1c4c3113398	9232	Črenšovci
00050000-5616-6ae9-04dd-b22106523553	2393	Črna na Koroškem
00050000-5616-6ae9-d153-8ef2f7335a0b	6275	Črni Kal
00050000-5616-6ae9-e0ec-6d5a86ba40ce	5274	Črni Vrh nad Idrijo
00050000-5616-6ae9-888c-696ab8e8f59b	5262	Črniče
00050000-5616-6ae9-6adf-fe02d2a69412	8340	Črnomelj
00050000-5616-6ae9-a6f2-f3d778b92958	6271	Dekani
00050000-5616-6ae9-3440-9943974ad8c8	5210	Deskle
00050000-5616-6ae9-e96a-5bdd7439bbbd	2253	Destrnik
00050000-5616-6ae9-b012-5465ae6b1fbe	6215	Divača
00050000-5616-6ae9-41a7-9b7d33ad6fb1	1233	Dob
00050000-5616-6ae9-cfcd-7f351aa0d305	3224	Dobje pri Planini
00050000-5616-6ae9-beaf-2c2179c9cb6a	8257	Dobova
00050000-5616-6ae9-361c-67d17cd167ee	1423	Dobovec
00050000-5616-6ae9-b378-153ce4539334	5263	Dobravlje
00050000-5616-6ae9-afb6-8beeb37b5092	3204	Dobrna
00050000-5616-6ae9-f32f-6988df690eff	8211	Dobrnič
00050000-5616-6ae9-b45b-331abc52a2df	1356	Dobrova
00050000-5616-6ae9-a90c-6120fa24786c	9223	Dobrovnik/Dobronak 
00050000-5616-6ae9-43d2-b0a67a12ca49	5212	Dobrovo v Brdih
00050000-5616-6ae9-35d9-52e492ff778b	1431	Dol pri Hrastniku
00050000-5616-6ae9-f884-d97c4ffed886	1262	Dol pri Ljubljani
00050000-5616-6ae9-c206-ba9e82144d0f	1273	Dole pri Litiji
00050000-5616-6ae9-0a80-b61434d32d3c	1331	Dolenja vas
00050000-5616-6ae9-5fd2-9b91144bbf4a	8350	Dolenjske Toplice
00050000-5616-6ae9-65b8-cf860b97d119	1230	Domžale
00050000-5616-6ae9-bfe1-fafd971c4c2a	2252	Dornava
00050000-5616-6ae9-1ddc-a81f7ef14bfb	5294	Dornberk
00050000-5616-6ae9-fc1e-35d70babf41f	1319	Draga
00050000-5616-6ae9-a13e-ced1cffb5e8a	8343	Dragatuš
00050000-5616-6ae9-04d8-1f0547cbd679	3222	Dramlje
00050000-5616-6ae9-84b0-b20091de4d84	2370	Dravograd
00050000-5616-6ae9-60c1-dcb496fb5164	4203	Duplje
00050000-5616-6ae9-a455-8e897b8bcd95	6221	Dutovlje
00050000-5616-6ae9-05ff-e746e09ed54e	8361	Dvor
00050000-5616-6ae9-fce2-55f00b173ab2	2343	Fala
00050000-5616-6ae9-890b-63b2a677e92b	9208	Fokovci
00050000-5616-6ae9-21cd-ca1f97949520	2313	Fram
00050000-5616-6ae9-22a4-b7a9661e3d0a	3213	Frankolovo
00050000-5616-6ae9-acf5-d430e85048bd	1274	Gabrovka
00050000-5616-6ae9-3c8f-80103c0c3292	8254	Globoko
00050000-5616-6ae9-1d61-c04dc5a8418f	5275	Godovič
00050000-5616-6ae9-d981-baf6c40ee15e	4204	Golnik
00050000-5616-6ae9-d56e-5f86b2e963d2	3303	Gomilsko
00050000-5616-6ae9-e615-56a50edae61f	4224	Gorenja vas
00050000-5616-6ae9-51c2-ef0455805836	3263	Gorica pri Slivnici
00050000-5616-6ae9-f7dc-a791819a56dd	2272	Gorišnica
00050000-5616-6ae9-ceec-a3036cff5e40	9250	Gornja Radgona
00050000-5616-6ae9-6cc6-aee0003b1d6e	3342	Gornji Grad
00050000-5616-6ae9-4b1d-15cfd65f2688	4282	Gozd Martuljek
00050000-5616-6ae9-f666-e46a934e3c43	6272	Gračišče
00050000-5616-6ae9-33cb-da911afd0bbf	9264	Grad
00050000-5616-6ae9-19d2-7ee7dd510d54	8332	Gradac
00050000-5616-6ae9-155d-ab6260de6b3b	1384	Grahovo
00050000-5616-6ae9-5436-00d94ba7f17b	5242	Grahovo ob Bači
00050000-5616-6ae9-8588-e40ea7186dd4	5251	Grgar
00050000-5616-6ae9-e666-d79354a04d85	3302	Griže
00050000-5616-6ae9-fe0c-9c62bd667e3c	3231	Grobelno
00050000-5616-6ae9-96ca-3c961ee15e9b	1290	Grosuplje
00050000-5616-6ae9-23d7-e167f1f2be84	2288	Hajdina
00050000-5616-6ae9-ee4d-878930dd2171	8362	Hinje
00050000-5616-6ae9-d253-691eff9b34c6	2311	Hoče
00050000-5616-6ae9-c502-da1b8d50be5c	9205	Hodoš/Hodos
00050000-5616-6ae9-d6bd-651831996cae	1354	Horjul
00050000-5616-6ae9-bd73-251675c0fd17	1372	Hotedršica
00050000-5616-6ae9-b491-f6058499bef1	1430	Hrastnik
00050000-5616-6ae9-67f5-557ad566f7bb	6225	Hruševje
00050000-5616-6ae9-dcb9-88798f737be7	4276	Hrušica
00050000-5616-6ae9-014a-19f9a7f96716	5280	Idrija
00050000-5616-6ae9-b0b2-717069a3ec3e	1292	Ig
00050000-5616-6ae9-cffa-51919fb69692	6250	Ilirska Bistrica
00050000-5616-6ae9-8b26-cd91314ff6d7	6251	Ilirska Bistrica-Trnovo
00050000-5616-6ae9-e98d-0d046658f968	1295	Ivančna Gorica
00050000-5616-6ae9-3052-76dbccf0ad64	2259	Ivanjkovci
00050000-5616-6ae9-2f92-cdb8c01e96df	1411	Izlake
00050000-5616-6ae9-1b31-64e9ac68b1e0	6310	Izola/Isola
00050000-5616-6ae9-7baa-d73c605a2782	2222	Jakobski Dol
00050000-5616-6ae9-ca23-3015c0b776e0	2221	Jarenina
00050000-5616-6ae9-129d-9dc061bd2aa5	6254	Jelšane
00050000-5616-6ae9-d9ec-7f1b0a675b54	4270	Jesenice
00050000-5616-6ae9-0979-9b869ea969b6	8261	Jesenice na Dolenjskem
00050000-5616-6ae9-9301-b8e5a07d38fc	3273	Jurklošter
00050000-5616-6ae9-9421-ad19f4cb5c16	2223	Jurovski Dol
00050000-5616-6ae9-4fc4-2d119d05da04	2256	Juršinci
00050000-5616-6ae9-d3b5-48341b53b6a7	5214	Kal nad Kanalom
00050000-5616-6ae9-a8de-df9938bc1846	3233	Kalobje
00050000-5616-6ae9-4a90-26ef2c6292e1	4246	Kamna Gorica
00050000-5616-6ae9-fc4b-f87ab98e3707	2351	Kamnica
00050000-5616-6ae9-94bf-26854849f95b	1241	Kamnik
00050000-5616-6ae9-c975-08ad92c2da88	5213	Kanal
00050000-5616-6ae9-567f-f64086358383	8258	Kapele
00050000-5616-6ae9-d199-750e983288e8	2362	Kapla
00050000-5616-6ae9-c413-b488edb9c766	2325	Kidričevo
00050000-5616-6ae9-5708-69973f547137	1412	Kisovec
00050000-5616-6ae9-1569-0832ec3822be	6253	Knežak
00050000-5616-6ae9-ae2e-d0c39c174733	5222	Kobarid
00050000-5616-6ae9-6cdc-7fe1c2ca6c5a	9227	Kobilje
00050000-5616-6ae9-3c3f-6176ff867960	1330	Kočevje
00050000-5616-6ae9-2067-b405dfe02494	1338	Kočevska Reka
00050000-5616-6ae9-2fa6-79143a8d9298	2276	Kog
00050000-5616-6ae9-f5fa-3185b14d3cd4	5211	Kojsko
00050000-5616-6ae9-1323-e3262b92c089	6223	Komen
00050000-5616-6ae9-25d4-7508e6fa94ab	1218	Komenda
00050000-5616-6ae9-5770-2abba6a1f6b8	6000	Koper/Capodistria 
00050000-5616-6ae9-17ad-c2c827321a81	6001	Koper/Capodistria - poštni predali
00050000-5616-6ae9-accd-568287cb1371	8282	Koprivnica
00050000-5616-6ae9-6817-06cddabc617f	5296	Kostanjevica na Krasu
00050000-5616-6ae9-9c0d-64eaadde2adf	8311	Kostanjevica na Krki
00050000-5616-6ae9-1bae-f780d6c9289f	1336	Kostel
00050000-5616-6ae9-0610-28fe87900c0c	6256	Košana
00050000-5616-6ae9-80b6-d03b993bb6a1	2394	Kotlje
00050000-5616-6ae9-981b-d2a00ea16538	6240	Kozina
00050000-5616-6ae9-61d0-c131bd55f457	3260	Kozje
00050000-5616-6ae9-d52a-a0a34494c98b	4000	Kranj 
00050000-5616-6ae9-dee9-00b578215500	4001	Kranj - poštni predali
00050000-5616-6ae9-7d15-fb55d9b05c61	4280	Kranjska Gora
00050000-5616-6ae9-512e-f428702677a3	1281	Kresnice
00050000-5616-6ae9-c4f5-cbb1f6e4935f	4294	Križe
00050000-5616-6ae9-3771-17c6e437b52e	9206	Križevci
00050000-5616-6ae9-5ad4-e074c8cf027a	9242	Križevci pri Ljutomeru
00050000-5616-6ae9-1110-1ccf817df754	1301	Krka
00050000-5616-6ae9-a3c3-ef04f4a6aded	8296	Krmelj
00050000-5616-6ae9-f959-d5a9c8363a66	4245	Kropa
00050000-5616-6ae9-2611-6bf0a3f51917	8262	Krška vas
00050000-5616-6ae9-8f71-88431f14f04c	8270	Krško
00050000-5616-6ae9-5d4c-10c6e92c1b4f	9263	Kuzma
00050000-5616-6ae9-7c83-c8df562fea40	2318	Laporje
00050000-5616-6ae9-6658-5a645f826f32	3270	Laško
00050000-5616-6ae9-3f81-b393ce2e8432	1219	Laze v Tuhinju
00050000-5616-6ae9-ed8d-4fcd70a2d1fc	2230	Lenart v Slovenskih goricah
00050000-5616-6ae9-29a6-e23181835e9d	9220	Lendava/Lendva
00050000-5616-6ae9-24a2-7a16c6572ed0	4248	Lesce
00050000-5616-6ae9-8a5f-60639c457c3e	3261	Lesično
00050000-5616-6ae9-2a1f-09ef6befcf4b	8273	Leskovec pri Krškem
00050000-5616-6ae9-1605-bd8b630a3502	2372	Libeliče
00050000-5616-6ae9-b6d0-76c289ef5fc3	2341	Limbuš
00050000-5616-6ae9-e106-83f7dff3cf8e	1270	Litija
00050000-5616-6ae9-7d52-f6228e303a42	3202	Ljubečna
00050000-5616-6ae9-1ff8-5fe76fa2664b	1000	Ljubljana 
00050000-5616-6ae9-4a3a-8decd5d41967	1001	Ljubljana - poštni predali
00050000-5616-6ae9-bcf3-8fd121150676	1231	Ljubljana - Črnuče
00050000-5616-6ae9-84fa-74868d353a13	1261	Ljubljana - Dobrunje
00050000-5616-6ae9-d01f-efbdb5d9a2cd	1260	Ljubljana - Polje
00050000-5616-6ae9-d1d3-2a97aa4ce6b3	1210	Ljubljana - Šentvid
00050000-5616-6ae9-2b3e-8ea550efe43f	1211	Ljubljana - Šmartno
00050000-5616-6ae9-2db9-342553fb3c80	3333	Ljubno ob Savinji
00050000-5616-6ae9-56c0-8991cbaf72ec	9240	Ljutomer
00050000-5616-6ae9-86a0-c87760e316a3	3215	Loče
00050000-5616-6ae9-6f28-57f770b3fb2a	5231	Log pod Mangartom
00050000-5616-6ae9-c170-abe6948ba2fc	1358	Log pri Brezovici
00050000-5616-6ae9-7900-f6aa50e2345d	1370	Logatec
00050000-5616-6ae9-3ab3-34419516b064	1371	Logatec
00050000-5616-6ae9-ddc6-af4008f3c5a5	1434	Loka pri Zidanem Mostu
00050000-5616-6ae9-7004-4cacddfc6261	3223	Loka pri Žusmu
00050000-5616-6ae9-0818-1d821b7d7355	6219	Lokev
00050000-5616-6ae9-67d9-17c188cc480f	1318	Loški Potok
00050000-5616-6ae9-8075-d25aa7217b2d	2324	Lovrenc na Dravskem polju
00050000-5616-6ae9-2664-259ded249931	2344	Lovrenc na Pohorju
00050000-5616-6ae9-2ca5-a8f1ff6e1825	3334	Luče
00050000-5616-6ae9-7ebf-a2bbec2b98f6	1225	Lukovica
00050000-5616-6ae9-2447-331a64740e9e	9202	Mačkovci
00050000-5616-6ae9-9f39-ec6700facebf	2322	Majšperk
00050000-5616-6ae9-06cb-9e0e8990dbe6	2321	Makole
00050000-5616-6ae9-52ec-dd55baf3828c	9243	Mala Nedelja
00050000-5616-6ae9-1906-57443661a90c	2229	Malečnik
00050000-5616-6ae9-f7bf-5279f7a6d9ea	6273	Marezige
00050000-5616-6ae9-352c-53a818282d63	2000	Maribor 
00050000-5616-6ae9-f2ec-5a5974aad831	2001	Maribor - poštni predali
00050000-5616-6ae9-803d-4d5e82e2c591	2206	Marjeta na Dravskem polju
00050000-5616-6ae9-ee37-2dd1582dbb89	2281	Markovci
00050000-5616-6ae9-95ab-a36c6d599ea3	9221	Martjanci
00050000-5616-6ae9-baea-123673ddc646	6242	Materija
00050000-5616-6ae9-14a9-c0321f6e539e	4211	Mavčiče
00050000-5616-6ae9-db6b-9f14424c53ac	1215	Medvode
00050000-5616-6ae9-99fc-47e073954f5f	1234	Mengeš
00050000-5616-6ae9-d112-8bac27894432	8330	Metlika
00050000-5616-6ae9-457d-01be95787b30	2392	Mežica
00050000-5616-6ae9-016b-b886cc776f17	2204	Miklavž na Dravskem polju
00050000-5616-6ae9-7b3a-8ecbe3cfbbaf	2275	Miklavž pri Ormožu
00050000-5616-6ae9-d3ab-61d91f16a685	5291	Miren
00050000-5616-6ae9-1f5b-3bfc11402083	8233	Mirna
00050000-5616-6ae9-d74a-262399aabd05	8216	Mirna Peč
00050000-5616-6ae9-5dac-9f6a309ee9e6	2382	Mislinja
00050000-5616-6ae9-22ea-a6f9d9493820	4281	Mojstrana
00050000-5616-6ae9-d62a-621938b26f34	8230	Mokronog
00050000-5616-6ae9-b9bf-f48336750bf5	1251	Moravče
00050000-5616-6ae9-7464-fbde20fcc5de	9226	Moravske Toplice
00050000-5616-6ae9-b9ba-0c3e76bc79d6	5216	Most na Soči
00050000-5616-6ae9-a447-5da51f535f6a	1221	Motnik
00050000-5616-6ae9-b541-76b1694e503d	3330	Mozirje
00050000-5616-6ae9-1c42-8989f7956516	9000	Murska Sobota 
00050000-5616-6ae9-c59e-eec3c61fe695	9001	Murska Sobota - poštni predali
00050000-5616-6ae9-c413-2ffba9a41db1	2366	Muta
00050000-5616-6ae9-67cc-dabf446900a1	4202	Naklo
00050000-5616-6ae9-e46c-3d91ec2bbb7c	3331	Nazarje
00050000-5616-6ae9-dae6-6606c174c305	1357	Notranje Gorice
00050000-5616-6ae9-0712-7b62b88db8b4	3203	Nova Cerkev
00050000-5616-6ae9-b8be-7056bf1f0919	5000	Nova Gorica 
00050000-5616-6ae9-884d-998c59e4d1a7	5001	Nova Gorica - poštni predali
00050000-5616-6ae9-5e94-5f4e980d18d5	1385	Nova vas
00050000-5616-6ae9-435d-0cf031b3488f	8000	Novo mesto
00050000-5616-6ae9-74ab-2032c69c7a5d	8001	Novo mesto - poštni predali
00050000-5616-6ae9-11c3-4d2bff600f92	6243	Obrov
00050000-5616-6ae9-1ab4-9c85ddb0119f	9233	Odranci
00050000-5616-6ae9-6e4e-83764a0e6e60	2317	Oplotnica
00050000-5616-6ae9-d18d-7aa81444da9d	2312	Orehova vas
00050000-5616-6ae9-8e33-429c7e2f96fb	2270	Ormož
00050000-5616-6ae9-2850-a210406eb832	1316	Ortnek
00050000-5616-6ae9-f159-b55e2839ff29	1337	Osilnica
00050000-5616-6ae9-e48d-cb0ec9282d0b	8222	Otočec
00050000-5616-6ae9-64a1-8ef3ead34ae0	2361	Ožbalt
00050000-5616-6ae9-d203-65af757aa996	2231	Pernica
00050000-5616-6ae9-e423-0143b5e12c25	2211	Pesnica pri Mariboru
00050000-5616-6ae9-6df7-29bf63a90d4a	9203	Petrovci
00050000-5616-6ae9-640c-61eb85297cef	3301	Petrovče
00050000-5616-6ae9-a5fb-d56101d64251	6330	Piran/Pirano
00050000-5616-6ae9-10e4-a4ed1a9a063c	8255	Pišece
00050000-5616-6ae9-9009-513f32b07423	6257	Pivka
00050000-5616-6ae9-6fdd-ced3c18ead3d	6232	Planina
00050000-5616-6ae9-268b-a64014979a7b	3225	Planina pri Sevnici
00050000-5616-6ae9-5531-53a7ab500149	6276	Pobegi
00050000-5616-6ae9-d396-8c43c4202568	8312	Podbočje
00050000-5616-6ae9-451d-2d3ce0e7bf4d	5243	Podbrdo
00050000-5616-6ae9-beb9-96879e9d3b26	3254	Podčetrtek
00050000-5616-6ae9-06eb-9fdf7b5b6294	2273	Podgorci
00050000-5616-6ae9-ed72-bf2b7458269b	6216	Podgorje
00050000-5616-6ae9-db3b-128b998a697f	2381	Podgorje pri Slovenj Gradcu
00050000-5616-6ae9-6f0e-576b0787bafc	6244	Podgrad
00050000-5616-6ae9-d32e-65749d431cb3	1414	Podkum
00050000-5616-6ae9-fdef-33b28b11055e	2286	Podlehnik
00050000-5616-6ae9-8bfc-1d6796985bca	5272	Podnanos
00050000-5616-6ae9-b766-026b28f3d3ab	4244	Podnart
00050000-5616-6ae9-da5a-03a3c5930fcf	3241	Podplat
00050000-5616-6ae9-08b6-71de005c7efc	3257	Podsreda
00050000-5616-6ae9-05a7-de26ebde7d4a	2363	Podvelka
00050000-5616-6ae9-c2db-d2515e334e54	2208	Pohorje
00050000-5616-6ae9-69f0-b3d8b43dbaed	2257	Polenšak
00050000-5616-6ae9-23eb-f4429b83d949	1355	Polhov Gradec
00050000-5616-6ae9-b85a-f55ce7d5685f	4223	Poljane nad Škofjo Loko
00050000-5616-6ae9-976a-b393047cc69c	2319	Poljčane
00050000-5616-6ae9-c02b-dadfcfb7b805	1272	Polšnik
00050000-5616-6ae9-1b58-64b727be23cb	3313	Polzela
00050000-5616-6ae9-ef7e-465d722d8b28	3232	Ponikva
00050000-5616-6ae9-f454-f53c2fc87989	6320	Portorož/Portorose
00050000-5616-6ae9-a7cd-894e1ff5b185	6230	Postojna
00050000-5616-6ae9-176a-ba7c9a1c1269	2331	Pragersko
00050000-5616-6ae9-b7f2-25350ae415e9	3312	Prebold
00050000-5616-6ae9-b017-efea75771e0c	4205	Preddvor
00050000-5616-6ae9-2e44-a01d0c213a91	6255	Prem
00050000-5616-6ae9-5b67-3e9dda1fc29a	1352	Preserje
00050000-5616-6ae9-e17d-a7035a18dc23	6258	Prestranek
00050000-5616-6ae9-240a-12a5b4ffe0c4	2391	Prevalje
00050000-5616-6ae9-0ad6-3682debaeee8	3262	Prevorje
00050000-5616-6ae9-f83d-1b4c7f6bbab0	1276	Primskovo 
00050000-5616-6ae9-4aa9-7ce13898fddf	3253	Pristava pri Mestinju
00050000-5616-6ae9-93cf-2ef3ad479211	9207	Prosenjakovci/Partosfalva
00050000-5616-6ae9-0cb2-2d6d40541e78	5297	Prvačina
00050000-5616-6ae9-b834-fa264a1408d2	2250	Ptuj
00050000-5616-6ae9-9208-342fb8f0028c	2323	Ptujska Gora
00050000-5616-6ae9-5be8-1ae832254d51	9201	Puconci
00050000-5616-6ae9-ab6a-dddf27a707cd	2327	Rače
00050000-5616-6ae9-7298-4ad553f8a76c	1433	Radeče
00050000-5616-6ae9-d1fd-9a2c9f6de04f	9252	Radenci
00050000-5616-6ae9-fb46-fe811c325eb7	2360	Radlje ob Dravi
00050000-5616-6ae9-166f-06f0f0850af5	1235	Radomlje
00050000-5616-6ae9-3551-6e2a1363b1f1	4240	Radovljica
00050000-5616-6ae9-72fd-c675813c7268	8274	Raka
00050000-5616-6ae9-1856-6740e4db0d08	1381	Rakek
00050000-5616-6ae9-6de3-438ce90f36c7	4283	Rateče - Planica
00050000-5616-6ae9-4917-293d41882253	2390	Ravne na Koroškem
00050000-5616-6ae9-d44a-05b053ba79d9	9246	Razkrižje
00050000-5616-6ae9-b00e-fd05742b7888	3332	Rečica ob Savinji
00050000-5616-6ae9-ba25-b258de5caf8f	5292	Renče
00050000-5616-6ae9-1c55-1a3aee712846	1310	Ribnica
00050000-5616-6ae9-381c-17fe418e0e36	2364	Ribnica na Pohorju
00050000-5616-6ae9-8399-e3420ec750af	3272	Rimske Toplice
00050000-5616-6ae9-669e-4555d09717db	1314	Rob
00050000-5616-6ae9-3f0f-5224f3abbb43	5215	Ročinj
00050000-5616-6ae9-af22-79801e85ede1	3250	Rogaška Slatina
00050000-5616-6ae9-0e42-00c48a130e55	9262	Rogašovci
00050000-5616-6ae9-3297-6a7f20f31315	3252	Rogatec
00050000-5616-6ae9-02b3-283b7d57925e	1373	Rovte
00050000-5616-6ae9-d3c2-337f2468ca28	2342	Ruše
00050000-5616-6ae9-7c4a-72b96d4a8567	1282	Sava
00050000-5616-6ae9-e5fb-d844a4ed0ac0	6333	Sečovlje/Sicciole
00050000-5616-6ae9-d4cf-b4fb7f606195	4227	Selca
00050000-5616-6ae9-3856-eda37ef3f0bd	2352	Selnica ob Dravi
00050000-5616-6ae9-b743-0ceb67dd8f72	8333	Semič
00050000-5616-6ae9-c95a-7a23ba9a6b48	8281	Senovo
00050000-5616-6ae9-d843-4a3d18da25b0	6224	Senožeče
00050000-5616-6ae9-a4d1-64a297cca6c4	8290	Sevnica
00050000-5616-6ae9-7714-da00698868e9	6210	Sežana
00050000-5616-6ae9-5d89-8db2af33b6c4	2214	Sladki Vrh
00050000-5616-6ae9-2692-a1e6087d469b	5283	Slap ob Idrijci
00050000-5616-6ae9-be9e-6b23dfd4dadc	2380	Slovenj Gradec
00050000-5616-6ae9-49e2-0a2d17ae4318	2310	Slovenska Bistrica
00050000-5616-6ae9-f556-16492daec8fe	3210	Slovenske Konjice
00050000-5616-6ae9-d96f-328c36909e1e	1216	Smlednik
00050000-5616-6ae9-171c-c9f5c0713d0a	5232	Soča
00050000-5616-6aea-4239-3c15db86ee5f	1317	Sodražica
00050000-5616-6aea-4d9c-06fa7369013f	3335	Solčava
00050000-5616-6aea-9f1c-0c3dc4df57f4	5250	Solkan
00050000-5616-6aea-f7b2-a176b9768d1c	4229	Sorica
00050000-5616-6aea-f950-46e9be1a64da	4225	Sovodenj
00050000-5616-6aea-032b-13651bb43376	5281	Spodnja Idrija
00050000-5616-6aea-3cd2-fab03907af80	2241	Spodnji Duplek
00050000-5616-6aea-c4be-8df8bbc71fb0	9245	Spodnji Ivanjci
00050000-5616-6aea-b933-c67e6e859b05	2277	Središče ob Dravi
00050000-5616-6aea-711c-0f89d28b4de6	4267	Srednja vas v Bohinju
00050000-5616-6aea-0814-a1d9fdb0a661	8256	Sromlje 
00050000-5616-6aea-0569-dc932c0e2595	5224	Srpenica
00050000-5616-6aea-f61a-e6ab2035378f	1242	Stahovica
00050000-5616-6aea-ca4d-2e2767c2f7ad	1332	Stara Cerkev
00050000-5616-6aea-5f06-8b233d874188	8342	Stari trg ob Kolpi
00050000-5616-6aea-52ab-36fd63d47389	1386	Stari trg pri Ložu
00050000-5616-6aea-e0fa-3b7117e18748	2205	Starše
00050000-5616-6aea-6404-e4fb615e5dfc	2289	Stoperce
00050000-5616-6aea-dafc-2e425b5da14b	8322	Stopiče
00050000-5616-6aea-82e6-8dfdb07d7494	3206	Stranice
00050000-5616-6aea-48d5-668073979654	8351	Straža
00050000-5616-6aea-f086-7a3ae0716ace	1313	Struge
00050000-5616-6aea-a4d2-9a19e53796b9	8293	Studenec
00050000-5616-6aea-53f6-a34b8580d524	8331	Suhor
00050000-5616-6aea-d716-7d893a275615	2233	Sv. Ana v Slovenskih goricah
00050000-5616-6aea-a27f-f5bb547c3d69	2235	Sv. Trojica v Slovenskih goricah
00050000-5616-6aea-47c6-2be6b79c83a9	2353	Sveti Duh na Ostrem Vrhu
00050000-5616-6aea-e258-645bf0184f34	9244	Sveti Jurij ob Ščavnici
00050000-5616-6aea-8132-a8abe7b15f0c	3264	Sveti Štefan
00050000-5616-6aea-65e0-85b239501657	2258	Sveti Tomaž
00050000-5616-6aea-5a71-a2ae95f59dce	9204	Šalovci
00050000-5616-6aea-790e-5722a1633286	5261	Šempas
00050000-5616-6aea-9465-4c72da822a3f	5290	Šempeter pri Gorici
00050000-5616-6aea-8a53-93d6c23e742a	3311	Šempeter v Savinjski dolini
00050000-5616-6aea-d4b8-9811769b3190	4208	Šenčur
00050000-5616-6aea-56ac-0b9926b3214d	2212	Šentilj v Slovenskih goricah
00050000-5616-6aea-3a47-9986c3d4db16	8297	Šentjanž
00050000-5616-6aea-f603-6a555a471f94	2373	Šentjanž pri Dravogradu
00050000-5616-6aea-912a-1d43f9c1886c	8310	Šentjernej
00050000-5616-6aea-78bb-16d27a5341e7	3230	Šentjur
00050000-5616-6aea-4e5d-f98a9599f455	3271	Šentrupert
00050000-5616-6aea-2824-d9655b9069d1	8232	Šentrupert
00050000-5616-6aea-5a9f-ef93852606f4	1296	Šentvid pri Stični
00050000-5616-6aea-c234-6c9a0c668972	8275	Škocjan
00050000-5616-6aea-5f3a-78e61cc292b8	6281	Škofije
00050000-5616-6aea-2884-494451911c7d	4220	Škofja Loka
00050000-5616-6aea-fc22-7cd25229b597	3211	Škofja vas
00050000-5616-6aea-cdbf-a8876d41c7f9	1291	Škofljica
00050000-5616-6aea-8ce5-a1bcf918a40c	6274	Šmarje
00050000-5616-6aea-a1de-53e878fc9ba1	1293	Šmarje - Sap
00050000-5616-6aea-38d8-b8d221b96608	3240	Šmarje pri Jelšah
00050000-5616-6aea-22e1-dcfdf9438936	8220	Šmarješke Toplice
00050000-5616-6aea-ae33-f11a671812d7	2315	Šmartno na Pohorju
00050000-5616-6aea-fefb-8a43c5c1517b	3341	Šmartno ob Dreti
00050000-5616-6aea-1ee1-a986608d3216	3327	Šmartno ob Paki
00050000-5616-6aea-9bd5-fa173d39cf09	1275	Šmartno pri Litiji
00050000-5616-6aea-3dd7-a33621708dc5	2383	Šmartno pri Slovenj Gradcu
00050000-5616-6aea-3b34-29bd0a6dfd73	3201	Šmartno v Rožni dolini
00050000-5616-6aea-5175-5bc4529e71af	3325	Šoštanj
00050000-5616-6aea-3896-7f38e16c2559	6222	Štanjel
00050000-5616-6aea-1e20-866675a61e70	3220	Štore
00050000-5616-6aea-9aa8-2875e1de9736	3304	Tabor
00050000-5616-6aea-6134-9d97102fa341	3221	Teharje
00050000-5616-6aea-aa25-f177924028b0	9251	Tišina
00050000-5616-6aea-dd3e-09a8c7d98a23	5220	Tolmin
00050000-5616-6aea-2763-f03c5d15b7b9	3326	Topolšica
00050000-5616-6aea-d8b3-38cc04a4f26d	2371	Trbonje
00050000-5616-6aea-9180-1fb65ed6ad3e	1420	Trbovlje
00050000-5616-6aea-8709-e635ee59e53b	8231	Trebelno 
00050000-5616-6aea-7e59-6917cb4bc81a	8210	Trebnje
00050000-5616-6aea-978e-31a4af3c3486	5252	Trnovo pri Gorici
00050000-5616-6aea-6419-98d55aed94ec	2254	Trnovska vas
00050000-5616-6aea-6739-4ba571b26704	1222	Trojane
00050000-5616-6aea-2cee-75ff3795a7e3	1236	Trzin
00050000-5616-6aea-a0b4-e5d6a4b074c9	4290	Tržič
00050000-5616-6aea-e6a6-a315c98555db	8295	Tržišče
00050000-5616-6aea-c40b-0733c95ad876	1311	Turjak
00050000-5616-6aea-450c-d2321b1b8180	9224	Turnišče
00050000-5616-6aea-3409-049e0e41eb8a	8323	Uršna sela
00050000-5616-6aea-83ef-c7f469291be3	1252	Vače
00050000-5616-6aea-954c-183145327926	3320	Velenje 
00050000-5616-6aea-7285-7fa7209fe41d	3322	Velenje - poštni predali
00050000-5616-6aea-80cc-774cc4bdd7c1	8212	Velika Loka
00050000-5616-6aea-65f3-638874e00645	2274	Velika Nedelja
00050000-5616-6aea-cac1-38f46434527a	9225	Velika Polana
00050000-5616-6aea-1f55-b9e8ac00cedf	1315	Velike Lašče
00050000-5616-6aea-3a97-0c9d4a10d491	8213	Veliki Gaber
00050000-5616-6aea-dfb9-601461a7fba9	9241	Veržej
00050000-5616-6aea-a943-f5851d85409c	1312	Videm - Dobrepolje
00050000-5616-6aea-621b-379d979dc9e3	2284	Videm pri Ptuju
00050000-5616-6aea-a55f-ae84b4fd1c48	8344	Vinica
00050000-5616-6aea-63a0-df182ecbc4fc	5271	Vipava
00050000-5616-6aea-44a3-96971d8c1ba1	4212	Visoko
00050000-5616-6aea-092b-b1a64f0ec31c	1294	Višnja Gora
00050000-5616-6aea-5399-c5596b6f225e	3205	Vitanje
00050000-5616-6aea-23ee-f0b271910d48	2255	Vitomarci
00050000-5616-6aea-8d7c-36d4b006f3f8	1217	Vodice
00050000-5616-6aea-f103-da5c908d18a5	3212	Vojnik\t
00050000-5616-6aea-f12a-656444f8899c	5293	Volčja Draga
00050000-5616-6aea-bfc6-7e61bf63e5cc	2232	Voličina
00050000-5616-6aea-d084-7bdfce9dba5d	3305	Vransko
00050000-5616-6aea-15c9-6103cd9dd234	6217	Vremski Britof
00050000-5616-6aea-8417-516ea564ef5d	1360	Vrhnika
00050000-5616-6aea-8bf2-175a5b6e25f8	2365	Vuhred
00050000-5616-6aea-250b-9ac4dd4753d6	2367	Vuzenica
00050000-5616-6aea-731d-ee94e15ec341	8292	Zabukovje 
00050000-5616-6aea-a686-87abda4c4181	1410	Zagorje ob Savi
00050000-5616-6aea-61bd-233c17eb918f	1303	Zagradec
00050000-5616-6aea-e26e-098200b5e06c	2283	Zavrč
00050000-5616-6aea-ebf6-453c836e0381	8272	Zdole 
00050000-5616-6aea-701f-b6acd0ed0e84	4201	Zgornja Besnica
00050000-5616-6aea-0d69-55bba22caa23	2242	Zgornja Korena
00050000-5616-6aea-426d-5b99381f42bd	2201	Zgornja Kungota
00050000-5616-6aea-a326-a871111e4fce	2316	Zgornja Ložnica
00050000-5616-6aea-d22d-4fb4de871cb4	2314	Zgornja Polskava
00050000-5616-6aea-4d8c-e4778fb2d379	2213	Zgornja Velka
00050000-5616-6aea-f970-dc93f232e115	4247	Zgornje Gorje
00050000-5616-6aea-e572-79bc9b220ed3	4206	Zgornje Jezersko
00050000-5616-6aea-800b-321eadca6e91	2285	Zgornji Leskovec
00050000-5616-6aea-fc38-662d5bde941c	1432	Zidani Most
00050000-5616-6aea-18f0-b6cfa6340156	3214	Zreče
00050000-5616-6aea-84f8-2f6c6911d68f	4209	Žabnica
00050000-5616-6aea-2fae-75bf203388e8	3310	Žalec
00050000-5616-6aea-48b3-4f9eb3e57097	4228	Železniki
00050000-5616-6aea-b874-c277ab672fd6	2287	Žetale
00050000-5616-6aea-ba55-0c547773cd29	4226	Žiri
00050000-5616-6aea-7e2a-9507c77f91d3	4274	Žirovnica
00050000-5616-6aea-3b27-bc5e9381cab7	8360	Žužemberk
\.


--
-- TOC entry 3045 (class 0 OID 21565644)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21565249)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21565029)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5616-6aec-574d-535ba8f07e49	00080000-5616-6aeb-c62d-38f9a8d08295	\N	00040000-5616-6aea-497e-f2e5ac51df27	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5616-6aec-ac14-591819c85433	00080000-5616-6aeb-c62d-38f9a8d08295	\N	00040000-5616-6aea-497e-f2e5ac51df27	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5616-6aec-dfc7-3603a5c10466	00080000-5616-6aeb-dfe5-d855ffe3e1c8	\N	00040000-5616-6aea-497e-f2e5ac51df27	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3007 (class 0 OID 21565133)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21565261)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21565658)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 21565668)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5616-6aec-2a7a-b208e8c6b0a6	00080000-5616-6aeb-f28e-c149ff0bd79f	0987	AK
00190000-5616-6aec-8cf0-76f7db871e2e	00080000-5616-6aeb-dfe5-d855ffe3e1c8	0989	AK
00190000-5616-6aec-d8e0-ef2ca7b1ca27	00080000-5616-6aeb-a1fc-1c32577dcd7a	0986	AK
00190000-5616-6aec-6009-c5840218c55e	00080000-5616-6aeb-7554-734c9611f734	0984	AK
00190000-5616-6aec-22c1-b1c3f50434d2	00080000-5616-6aeb-2368-2847cec8c5dc	0983	AK
00190000-5616-6aec-29ae-b0d67dde0bec	00080000-5616-6aeb-211c-78e3abe1d55f	0982	AK
00190000-5616-6aed-b570-2d4c9c14b520	00080000-5616-6aed-6998-19f92fa958a7	1001	AK
\.


--
-- TOC entry 3044 (class 0 OID 21565591)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5616-6aec-a621-53dd48513515	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3048 (class 0 OID 21565676)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21565290)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5616-6aeb-3295-e32e0fe8e457	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5616-6aeb-a376-3205fa3f5c31	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5616-6aeb-5070-938b9dfb4acd	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5616-6aeb-8131-88e953aba04a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5616-6aeb-7f9e-c48ca73509f1	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5616-6aeb-3c3e-6e4f50b7719a	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5616-6aeb-6e3e-967eb468ead8	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3016 (class 0 OID 21565234)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21565224)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21565434)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21565364)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21565107)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21564902)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5616-6aed-6998-19f92fa958a7	00010000-5616-6aea-fe43-79d5db7c2bc9	2015-10-08 15:09:01	INS	a:0:{}
2	App\\Entity\\Option	00000000-5616-6aed-4f76-b6816cbea74a	00010000-5616-6aea-fe43-79d5db7c2bc9	2015-10-08 15:09:01	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5616-6aed-b570-2d4c9c14b520	00010000-5616-6aea-fe43-79d5db7c2bc9	2015-10-08 15:09:01	INS	a:0:{}
\.


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3025 (class 0 OID 21565303)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21564940)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5616-6aea-d7c8-4f30ffdd4ab0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5616-6aea-3244-292deb63e939	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5616-6aea-f9c1-ce98de7f8b8b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5616-6aea-b533-a363a49b5050	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5616-6aea-0e0d-3243cc7d3a44	planer	Planer dogodkov v koledarju	t
00020000-5616-6aea-c9db-dd38e219c19c	kadrovska	Kadrovska služba	t
00020000-5616-6aea-0dad-9f6ff40a94b2	arhivar	Ažuriranje arhivalij	t
00020000-5616-6aea-efe1-fd133820a081	igralec	Igralec	t
00020000-5616-6aea-b05e-22fe753d15b4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5616-6aec-2c03-f2a628809c9a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2990 (class 0 OID 21564924)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5616-6aea-50a1-08764d39d94d	00020000-5616-6aea-f9c1-ce98de7f8b8b
00010000-5616-6aea-fe43-79d5db7c2bc9	00020000-5616-6aea-f9c1-ce98de7f8b8b
00010000-5616-6aec-993b-daaccccd9141	00020000-5616-6aec-2c03-f2a628809c9a
\.


--
-- TOC entry 3027 (class 0 OID 21565317)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21565255)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21565201)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21564889)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5616-6aea-4fb6-d05a01a12e89	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5616-6aea-10b5-46f267bf86db	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5616-6aea-9574-b2c2bbb88e98	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5616-6aea-ba04-652aa2341ff6	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5616-6aea-9d25-24fe3df56e83	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2985 (class 0 OID 21564881)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5616-6aea-da2d-72ccf528a937	00230000-5616-6aea-ba04-652aa2341ff6	popa
00240000-5616-6aea-4966-4b62e3d2c95e	00230000-5616-6aea-ba04-652aa2341ff6	oseba
00240000-5616-6aea-c1ba-1f3456915e8a	00230000-5616-6aea-ba04-652aa2341ff6	sezona
00240000-5616-6aea-42df-e807c0ba8300	00230000-5616-6aea-10b5-46f267bf86db	prostor
00240000-5616-6aea-05db-9ce72290e39d	00230000-5616-6aea-ba04-652aa2341ff6	besedilo
00240000-5616-6aea-13c2-ce9f2802489f	00230000-5616-6aea-ba04-652aa2341ff6	uprizoritev
00240000-5616-6aea-c560-eca4ae522310	00230000-5616-6aea-ba04-652aa2341ff6	funkcija
00240000-5616-6aea-7dbf-dc76e9a301f2	00230000-5616-6aea-ba04-652aa2341ff6	tipfunkcije
00240000-5616-6aea-b77b-99245e5fc9ce	00230000-5616-6aea-ba04-652aa2341ff6	alternacija
00240000-5616-6aea-3aee-a5a3769c5ea3	00230000-5616-6aea-4fb6-d05a01a12e89	pogodba
00240000-5616-6aea-39af-3cd6a46e0ee0	00230000-5616-6aea-ba04-652aa2341ff6	zaposlitev
00240000-5616-6aea-9e9c-083f4bb3ea8c	00230000-5616-6aea-ba04-652aa2341ff6	zvrstuprizoritve
00240000-5616-6aea-c1ec-c79035c9d892	00230000-5616-6aea-4fb6-d05a01a12e89	programdela
00240000-5616-6aea-5253-aeba9f2ced93	00230000-5616-6aea-ba04-652aa2341ff6	zapis
\.


--
-- TOC entry 2984 (class 0 OID 21564876)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e00f72f8-e879-4039-93ae-ba48204af6c5	00240000-5616-6aea-da2d-72ccf528a937	0	1001
\.


--
-- TOC entry 3033 (class 0 OID 21565381)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5616-6aec-2859-a73eaf291925	000e0000-5616-6aec-80e5-90b36998e5f8	00080000-5616-6aeb-c62d-38f9a8d08295	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5616-6aea-53c0-9d3981163226
00270000-5616-6aec-ec9b-fc38cfbf316f	000e0000-5616-6aec-80e5-90b36998e5f8	00080000-5616-6aeb-c62d-38f9a8d08295	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5616-6aea-53c0-9d3981163226
\.


--
-- TOC entry 2997 (class 0 OID 21565002)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21565211)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5616-6aec-042f-62b05ae58a51	00180000-5616-6aec-97ef-a73d7e18489c	000c0000-5616-6aec-0674-9a44272b96b5	00090000-5616-6aec-67f6-d32bffc89dac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-6aec-74a6-63e9af823639	00180000-5616-6aec-97ef-a73d7e18489c	000c0000-5616-6aec-a48d-a1172e4f3811	00090000-5616-6aec-d138-2858858df9ca	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-6aec-a7a0-520a217f74a2	00180000-5616-6aec-97ef-a73d7e18489c	000c0000-5616-6aec-d722-04762c102076	00090000-5616-6aec-e467-71a396e0028c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-6aec-810f-717dece71d90	00180000-5616-6aec-97ef-a73d7e18489c	000c0000-5616-6aec-dcb2-0b6abc450deb	00090000-5616-6aec-bf47-0cd6270a6a86	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-6aec-021e-f26c06ba91af	00180000-5616-6aec-97ef-a73d7e18489c	000c0000-5616-6aec-0845-94ea7509f7ae	00090000-5616-6aec-0ec7-02e6e83808d7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-6aec-1c70-533eb88ef482	00180000-5616-6aec-358d-cfc2a56c00de	\N	00090000-5616-6aec-0ec7-02e6e83808d7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 21565422)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5616-6aea-7597-94660a8011db	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5616-6aea-01ae-3627a8a2beb6	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5616-6aea-4677-81249ad46f6e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5616-6aea-9104-3963892e9d5a	04	Režija	Režija	Režija	umetnik	30
000f0000-5616-6aea-9efc-f351047df039	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5616-6aea-75c5-9fa970e32274	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5616-6aea-57b2-af97b33bc9ac	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5616-6aea-80b4-fb864bff3e31	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5616-6aea-ee68-bc796e5d62bd	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5616-6aea-9d9f-a033731c70ae	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5616-6aea-5dbb-339ea536fba0	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5616-6aea-9639-1505a79d7be4	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5616-6aea-f64e-70d3bfefc123	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5616-6aea-24e5-6b303a511646	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5616-6aea-fafe-99c58bfc1132	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5616-6aea-7a68-8ce95ce1f3c5	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5616-6aea-8312-e8f4442100a9	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5616-6aea-b414-b9296ad8f6a2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3049 (class 0 OID 21565687)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5616-6aea-467d-51085b9e2f74	01	Velika predstava	f	1.00	1.00
002b0000-5616-6aea-e6cf-33b2753455af	02	Mala predstava	f	0.50	0.50
002b0000-5616-6aea-16fb-ad55501dd1f5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5616-6aea-4f74-bac9000226e4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5616-6aea-795b-e4e24f1204e0	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3002 (class 0 OID 21565064)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21564911)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5616-6aea-fe43-79d5db7c2bc9	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeRsAM15yDQyaFlkiGyY5wMERrDnTQ3G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5616-6aec-075c-d273d7e947bf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5616-6aec-2e99-51f2de23da74	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5616-6aec-6d7c-697294ca7ae3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5616-6aec-4ef8-923fb6b9a323	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5616-6aec-4beb-5a472f9b24ec	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5616-6aec-dcbe-07f9043f207d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5616-6aec-0967-693c18545876	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5616-6aec-c438-63e94470935c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5616-6aec-066b-461fb71cd0a4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5616-6aec-993b-daaccccd9141	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5616-6aea-50a1-08764d39d94d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21565472)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5616-6aec-94af-da26e2ea7abf	00160000-5616-6aeb-73b6-c2650e604d91	\N	00140000-5616-6aea-8b54-7251898e725f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5616-6aeb-7f9e-c48ca73509f1
000e0000-5616-6aec-80e5-90b36998e5f8	00160000-5616-6aeb-264b-f7d0894c6ea8	\N	00140000-5616-6aea-1e66-bda428cc3600	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5616-6aeb-3c3e-6e4f50b7719a
000e0000-5616-6aec-5291-4e8bab8af134	\N	\N	00140000-5616-6aea-1e66-bda428cc3600	00190000-5616-6aec-2a7a-b208e8c6b0a6	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5616-6aeb-7f9e-c48ca73509f1
000e0000-5616-6aec-fba5-181da0d4b3cc	\N	\N	00140000-5616-6aea-1e66-bda428cc3600	00190000-5616-6aec-2a7a-b208e8c6b0a6	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5616-6aeb-7f9e-c48ca73509f1
000e0000-5616-6aec-f6ed-646c05e17b6e	\N	\N	00140000-5616-6aea-1e66-bda428cc3600	00190000-5616-6aec-2a7a-b208e8c6b0a6	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5616-6aeb-3295-e32e0fe8e457
000e0000-5616-6aec-49e4-b26366e45862	\N	\N	00140000-5616-6aea-1e66-bda428cc3600	00190000-5616-6aec-2a7a-b208e8c6b0a6	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5616-6aeb-3295-e32e0fe8e457
\.


--
-- TOC entry 3009 (class 0 OID 21565155)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5616-6aec-1e1a-70be35111c75	000e0000-5616-6aec-80e5-90b36998e5f8	\N	1	
00200000-5616-6aec-de6d-6264c6d8fa9a	000e0000-5616-6aec-80e5-90b36998e5f8	\N	2	
00200000-5616-6aec-3c04-6ee1d8e31fdd	000e0000-5616-6aec-80e5-90b36998e5f8	\N	3	
00200000-5616-6aec-c671-d6501c3f2936	000e0000-5616-6aec-80e5-90b36998e5f8	\N	4	
00200000-5616-6aec-b9c1-f4e454cd2ac1	000e0000-5616-6aec-80e5-90b36998e5f8	\N	5	
\.


--
-- TOC entry 3023 (class 0 OID 21565282)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21565395)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5616-6aea-740f-5402a8d1835a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5616-6aea-463d-56e995cd65b6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5616-6aea-45c8-4e62a99cf818	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5616-6aea-b6f7-445f8fbc86d7	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5616-6aea-ac82-5863506ae89c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5616-6aea-07e4-ff66daefe777	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5616-6aea-1bc3-fec24977b0c0	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5616-6aea-aa4c-239fbbd39308	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5616-6aea-53c0-9d3981163226	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5616-6aea-72c4-ee46f2ec2a21	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5616-6aea-9d46-6553a906705b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5616-6aea-ee65-0203ae99dfa7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5616-6aea-0b38-6e169b74f58c	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5616-6aea-d3be-2d1adaf9057d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5616-6aea-63e6-a8d9e90e51b9	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5616-6aea-b81d-381d964e9190	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5616-6aea-1c5c-b0a59e3167d5	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5616-6aea-4fda-fffba6ca07ba	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5616-6aea-77bd-e30812e73b28	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5616-6aea-6be5-fabad6ece1b4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5616-6aea-df9d-3c38452321ca	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5616-6aea-bdfb-726754f6265d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5616-6aea-f573-0cfc0e8d3eba	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5616-6aea-c71d-2f6825be3ba0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5616-6aea-6d0a-91a1aa861d6d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5616-6aea-5bfc-425f259d8223	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5616-6aea-ad9b-59978c8e4cd7	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5616-6aea-3910-41de756f2089	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3052 (class 0 OID 21565734)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21565706)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21565746)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21565354)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5616-6aec-1781-85fd3863133a	00090000-5616-6aec-d138-2858858df9ca	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-6aec-74a6-28a922a210c2	00090000-5616-6aec-e467-71a396e0028c	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-6aec-10a9-86b01dc07003	00090000-5616-6aec-b500-c66cd4620cb8	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-6aec-11b9-2ac6a7fb07f8	00090000-5616-6aec-49af-de988a88e7cf	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-6aec-36a2-651bd09b25a8	00090000-5616-6aec-67f6-d32bffc89dac	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-6aec-65f1-bedb9dd48805	00090000-5616-6aec-69e6-e98994504bc5	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3011 (class 0 OID 21565190)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21565462)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5616-6aea-8b54-7251898e725f	01	Drama	drama (SURS 01)
00140000-5616-6aea-b46f-3664df3c5f1a	02	Opera	opera (SURS 02)
00140000-5616-6aea-8043-66c4dda89fc9	03	Balet	balet (SURS 03)
00140000-5616-6aea-83dd-52102d66cd2a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5616-6aea-29d0-8a5b72f88830	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5616-6aea-1e66-bda428cc3600	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5616-6aea-f1d3-f875784cdf44	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3029 (class 0 OID 21565344)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2516 (class 2606 OID 21564965)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21565521)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 21565511)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21565378)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 21565420)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 21565786)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21565179)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21565200)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21565704)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21565090)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21565585)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21565340)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21565153)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 21565128)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21565104)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21565247)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21565763)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 21565770)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2770 (class 2606 OID 21565794)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2628 (class 2606 OID 21565274)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21565062)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 21564974)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21564998)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21564954)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2507 (class 2606 OID 21564939)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21565280)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 21565316)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21565457)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21565026)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 21565050)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21565656)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21565253)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 21565040)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21565141)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21565265)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21565665)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 21565673)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21565643)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21565685)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21565298)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21565238)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21565229)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21565444)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 21565371)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21565116)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21564910)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21565307)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21564928)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2509 (class 2606 OID 21564948)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21565325)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 21565260)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 21565209)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 21564898)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 21564886)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21564880)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 21565391)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21565007)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21565220)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 21565431)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21565697)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 21565075)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 21564923)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21565490)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21565163)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21565288)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21565403)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21565744)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21565728)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 21565752)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21565362)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21565194)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21565470)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 21565352)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 1259 OID 21565188)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2581 (class 1259 OID 21565189)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2582 (class 1259 OID 21565187)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2583 (class 1259 OID 21565186)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 21565185)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2670 (class 1259 OID 21565392)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2671 (class 1259 OID 21565393)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 21565394)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 21565765)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2757 (class 1259 OID 21565764)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2530 (class 1259 OID 21565028)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 21565281)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2743 (class 1259 OID 21565732)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2744 (class 1259 OID 21565731)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 21565733)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2746 (class 1259 OID 21565730)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2747 (class 1259 OID 21565729)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2623 (class 1259 OID 21565267)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 21565266)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2575 (class 1259 OID 21565164)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 21565341)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2654 (class 1259 OID 21565343)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2655 (class 1259 OID 21565342)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2555 (class 1259 OID 21565106)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21565105)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 21565686)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2686 (class 1259 OID 21565459)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 21565460)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 21565461)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2753 (class 1259 OID 21565753)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2695 (class 1259 OID 21565495)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2696 (class 1259 OID 21565492)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2697 (class 1259 OID 21565496)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2698 (class 1259 OID 21565494)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2699 (class 1259 OID 21565493)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2545 (class 1259 OID 21565077)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2546 (class 1259 OID 21565076)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 21565001)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2641 (class 1259 OID 21565308)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2511 (class 1259 OID 21564955)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2512 (class 1259 OID 21564956)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2646 (class 1259 OID 21565328)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2647 (class 1259 OID 21565327)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2648 (class 1259 OID 21565326)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 21565142)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 21565143)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2491 (class 1259 OID 21564888)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2603 (class 1259 OID 21565233)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2604 (class 1259 OID 21565231)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2605 (class 1259 OID 21565230)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2606 (class 1259 OID 21565232)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2502 (class 1259 OID 21564929)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21564930)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2632 (class 1259 OID 21565289)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2766 (class 1259 OID 21565787)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2668 (class 1259 OID 21565380)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 21565379)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2767 (class 1259 OID 21565795)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 21565796)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2618 (class 1259 OID 21565254)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2662 (class 1259 OID 21565372)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2663 (class 1259 OID 21565373)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 21565590)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2717 (class 1259 OID 21565589)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2718 (class 1259 OID 21565586)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2719 (class 1259 OID 21565587)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2720 (class 1259 OID 21565588)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2534 (class 1259 OID 21565042)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 21565041)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2536 (class 1259 OID 21565043)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2635 (class 1259 OID 21565302)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2636 (class 1259 OID 21565301)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2726 (class 1259 OID 21565666)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 21565667)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2709 (class 1259 OID 21565525)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 21565526)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2711 (class 1259 OID 21565523)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2712 (class 1259 OID 21565524)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2659 (class 1259 OID 21565363)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2609 (class 1259 OID 21565242)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2610 (class 1259 OID 21565241)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2611 (class 1259 OID 21565239)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2612 (class 1259 OID 21565240)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2705 (class 1259 OID 21565513)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 21565512)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2559 (class 1259 OID 21565117)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2562 (class 1259 OID 21565131)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2563 (class 1259 OID 21565130)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2564 (class 1259 OID 21565129)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 21565132)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2574 (class 1259 OID 21565154)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 21565657)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2742 (class 1259 OID 21565705)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2760 (class 1259 OID 21565771)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2761 (class 1259 OID 21565772)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2517 (class 1259 OID 21564976)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2518 (class 1259 OID 21564975)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2526 (class 1259 OID 21565008)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 21565009)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 21565195)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 21565223)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 21565222)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2600 (class 1259 OID 21565221)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2585 (class 1259 OID 21565181)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2586 (class 1259 OID 21565182)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2587 (class 1259 OID 21565180)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2588 (class 1259 OID 21565184)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2589 (class 1259 OID 21565183)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2533 (class 1259 OID 21565027)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 21565091)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 21565093)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2553 (class 1259 OID 21565092)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2554 (class 1259 OID 21565094)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2617 (class 1259 OID 21565248)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21565458)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 21565491)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 21565432)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21565433)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2524 (class 1259 OID 21564999)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 21565000)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2656 (class 1259 OID 21565353)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 21564899)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 21565063)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2494 (class 1259 OID 21564887)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2739 (class 1259 OID 21565698)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 21565300)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2640 (class 1259 OID 21565299)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21565522)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 21565051)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 21565471)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 21565745)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 21565674)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21565675)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 21565421)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2597 (class 1259 OID 21565210)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21564949)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2801 (class 2606 OID 21565927)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2800 (class 2606 OID 21565932)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2796 (class 2606 OID 21565952)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2802 (class 2606 OID 21565922)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2798 (class 2606 OID 21565942)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2797 (class 2606 OID 21565947)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2799 (class 2606 OID 21565937)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 21566117)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2836 (class 2606 OID 21566122)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21566127)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2869 (class 2606 OID 21566292)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2870 (class 2606 OID 21566287)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 21565852)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2819 (class 2606 OID 21566037)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2864 (class 2606 OID 21566272)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 21566267)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2863 (class 2606 OID 21566277)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 21566262)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2867 (class 2606 OID 21566257)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2817 (class 2606 OID 21566032)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2818 (class 2606 OID 21566027)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2795 (class 2606 OID 21565917)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 21566077)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 21566087)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2828 (class 2606 OID 21566082)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2788 (class 2606 OID 21565887)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 21565882)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21566017)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 21566247)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 21566132)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 21566137)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21566142)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2868 (class 2606 OID 21566282)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2842 (class 2606 OID 21566162)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2845 (class 2606 OID 21566147)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 21566167)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 21566157)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2844 (class 2606 OID 21566152)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2786 (class 2606 OID 21565877)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21565872)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 21565837)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2779 (class 2606 OID 21565832)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 21566057)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2775 (class 2606 OID 21565812)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2774 (class 2606 OID 21565817)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2824 (class 2606 OID 21566072)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2825 (class 2606 OID 21566067)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2826 (class 2606 OID 21566062)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2793 (class 2606 OID 21565902)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2792 (class 2606 OID 21565907)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2771 (class 2606 OID 21565797)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2807 (class 2606 OID 21565992)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2809 (class 2606 OID 21565982)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2810 (class 2606 OID 21565977)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2808 (class 2606 OID 21565987)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2773 (class 2606 OID 21565802)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 21565807)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2820 (class 2606 OID 21566042)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2873 (class 2606 OID 21566307)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 21566112)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21566107)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2875 (class 2606 OID 21566312)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2874 (class 2606 OID 21566317)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2816 (class 2606 OID 21566022)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2832 (class 2606 OID 21566097)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2831 (class 2606 OID 21566102)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 21566222)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2853 (class 2606 OID 21566217)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 21566202)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2855 (class 2606 OID 21566207)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 21566212)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2784 (class 2606 OID 21565862)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 21565857)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 21565867)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2821 (class 2606 OID 21566052)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2822 (class 2606 OID 21566047)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2859 (class 2606 OID 21566232)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21566237)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2849 (class 2606 OID 21566192)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 21566197)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2851 (class 2606 OID 21566182)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 21566187)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 21566092)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 21566012)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2812 (class 2606 OID 21566007)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 21565997)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2813 (class 2606 OID 21566002)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2846 (class 2606 OID 21566177)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21566172)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2790 (class 2606 OID 21565892)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2791 (class 2606 OID 21565897)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21565912)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 21566227)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2860 (class 2606 OID 21566242)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 21566252)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2872 (class 2606 OID 21566297)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 21566302)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 21565827)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21565822)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2781 (class 2606 OID 21565842)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 21565847)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 21565957)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2804 (class 2606 OID 21565972)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2805 (class 2606 OID 21565967)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2806 (class 2606 OID 21565962)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-08 15:09:03 CEST

--
-- PostgreSQL database dump complete
--

