--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-05 14:30:31 CEST

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
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21287801)
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
-- TOC entry 229 (class 1259 OID 21288358)
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
-- TOC entry 228 (class 1259 OID 21288341)
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
-- TOC entry 219 (class 1259 OID 21288218)
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
-- TOC entry 222 (class 1259 OID 21288248)
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
-- TOC entry 243 (class 1259 OID 21288602)
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
-- TOC entry 197 (class 1259 OID 21288009)
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
-- TOC entry 199 (class 1259 OID 21288040)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21288528)
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
-- TOC entry 190 (class 1259 OID 21287922)
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
-- TOC entry 230 (class 1259 OID 21288371)
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
    zvrst character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    reziser character varying(255) DEFAULT NULL::character varying,
    datum date,
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
-- TOC entry 215 (class 1259 OID 21288173)
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
-- TOC entry 195 (class 1259 OID 21287988)
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
-- TOC entry 193 (class 1259 OID 21287962)
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
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21287939)
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
-- TOC entry 204 (class 1259 OID 21288087)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21288583)
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
-- TOC entry 242 (class 1259 OID 21288595)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21288617)
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
-- TOC entry 208 (class 1259 OID 21288112)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21287896)
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
-- TOC entry 182 (class 1259 OID 21287810)
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
-- TOC entry 183 (class 1259 OID 21287821)
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
-- TOC entry 178 (class 1259 OID 21287775)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21287794)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21288119)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21288153)
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
-- TOC entry 225 (class 1259 OID 21288289)
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
-- TOC entry 185 (class 1259 OID 21287854)
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
-- TOC entry 187 (class 1259 OID 21287888)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21288473)
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
-- TOC entry 205 (class 1259 OID 21288093)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21287873)
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
-- TOC entry 194 (class 1259 OID 21287977)
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
-- TOC entry 207 (class 1259 OID 21288105)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21288487)
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
-- TOC entry 234 (class 1259 OID 21288497)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21288430)
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
-- TOC entry 235 (class 1259 OID 21288505)
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
-- TOC entry 211 (class 1259 OID 21288134)
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
-- TOC entry 203 (class 1259 OID 21288078)
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
-- TOC entry 202 (class 1259 OID 21288068)
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
-- TOC entry 224 (class 1259 OID 21288278)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21288208)
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
-- TOC entry 192 (class 1259 OID 21287951)
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
-- TOC entry 175 (class 1259 OID 21287746)
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
-- TOC entry 174 (class 1259 OID 21287744)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21288147)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21287784)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21287768)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21288161)
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
-- TOC entry 206 (class 1259 OID 21288099)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21288045)
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
-- TOC entry 173 (class 1259 OID 21287733)
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
-- TOC entry 172 (class 1259 OID 21287725)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21287720)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21288225)
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
-- TOC entry 184 (class 1259 OID 21287846)
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
-- TOC entry 201 (class 1259 OID 21288055)
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
-- TOC entry 223 (class 1259 OID 21288266)
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
-- TOC entry 236 (class 1259 OID 21288516)
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
-- TOC entry 189 (class 1259 OID 21287908)
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
-- TOC entry 176 (class 1259 OID 21287755)
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
-- TOC entry 227 (class 1259 OID 21288316)
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
-- TOC entry 196 (class 1259 OID 21287999)
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
-- TOC entry 210 (class 1259 OID 21288126)
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
-- TOC entry 221 (class 1259 OID 21288239)
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
-- TOC entry 239 (class 1259 OID 21288563)
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
-- TOC entry 238 (class 1259 OID 21288535)
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
-- TOC entry 240 (class 1259 OID 21288575)
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
-- TOC entry 217 (class 1259 OID 21288198)
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
-- TOC entry 198 (class 1259 OID 21288034)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21288306)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21288188)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21287749)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2979 (class 0 OID 21287801)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21288358)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5612-6d65-06f0-d919a9134ff8	000d0000-5612-6d65-079d-fcb3fa5ac12c	\N	00090000-5612-6d64-21e7-5d816cd78b69	000b0000-5612-6d65-d420-bc6f2c5df579	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5612-6d65-8f84-3d30b8fd0105	000d0000-5612-6d65-8645-229889e13337	00100000-5612-6d65-a881-7d0454985c8f	00090000-5612-6d64-ab72-59e684dd80e6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5612-6d65-e73e-1ca2a90e91d3	000d0000-5612-6d65-6968-dee9b66374bc	00100000-5612-6d65-3493-75f375ba693f	00090000-5612-6d64-726b-de6f6b89acac	\N	0003	t	\N	2015-10-05	\N	2	t	\N	f	f
000c0000-5612-6d65-9862-849d2bf73c5f	000d0000-5612-6d65-0296-dbd196e82e33	\N	00090000-5612-6d64-4f3b-3e2e47e35016	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5612-6d65-7ecf-badf36b1ec3a	000d0000-5612-6d65-cc47-58584c44324c	\N	00090000-5612-6d64-4974-45864ddd2bd4	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5612-6d65-249f-1dab0ea471c7	000d0000-5612-6d65-c51d-52d194a3e87d	\N	00090000-5612-6d64-2b45-67a4c4df6530	000b0000-5612-6d65-3c06-d2b486700922	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5612-6d65-c699-d78c4db59163	000d0000-5612-6d65-83bd-505272c4f630	00100000-5612-6d65-b7ad-c67877d4ba5c	00090000-5612-6d64-fe41-861a5664ef1b	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5612-6d65-cead-7ed1136905f4	000d0000-5612-6d65-7ef1-b3eadcd7eee4	\N	00090000-5612-6d64-2548-498b9b309621	000b0000-5612-6d65-a104-0ed7fa5c4c4a	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5612-6d65-b570-27020d17e876	000d0000-5612-6d65-83bd-505272c4f630	00100000-5612-6d65-ccfb-9516fe69b2b4	00090000-5612-6d64-405a-d086f4376d45	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5612-6d65-6b4c-9c08b2aa10bd	000d0000-5612-6d65-83bd-505272c4f630	00100000-5612-6d65-a1ee-951a59f02699	00090000-5612-6d64-97c9-5ae89e577acf	\N	0010	t	\N	2015-10-05	\N	16	f	\N	f	t
000c0000-5612-6d65-2bd3-c49b7094284c	000d0000-5612-6d65-83bd-505272c4f630	00100000-5612-6d65-a5d9-c3ca4760ea4b	00090000-5612-6d64-126c-37c2acf0868b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5612-6d65-c38c-7b4e2124e8b9	000d0000-5612-6d65-406f-3f9d134f2f29	\N	00090000-5612-6d64-ab72-59e684dd80e6	000b0000-5612-6d65-6e67-42d1d37b61a1	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3026 (class 0 OID 21288341)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21288218)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5612-6d65-ed94-f409e7f2b216	00160000-5612-6d64-6a7d-e88f3aba3abb	00090000-5612-6d64-541b-189c14d05e88	aizv	10	t
003d0000-5612-6d65-0533-dc60fee80aad	00160000-5612-6d64-6a7d-e88f3aba3abb	00090000-5612-6d64-07b9-8205f304ee54	apri	14	t
003d0000-5612-6d65-f869-2edd00259ceb	00160000-5612-6d64-02fb-f0035671aff4	00090000-5612-6d64-f2d0-e83582e70175	aizv	11	t
003d0000-5612-6d65-2bc8-a6eb3b03b813	00160000-5612-6d64-d38e-74fc3529fc59	00090000-5612-6d64-a774-622b35bcbbb3	aizv	12	t
003d0000-5612-6d65-5088-3a49ab7741f3	00160000-5612-6d64-6a7d-e88f3aba3abb	00090000-5612-6d64-5bf3-a5a841ecf76f	apri	18	f
\.


--
-- TOC entry 3020 (class 0 OID 21288248)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5612-6d64-6a7d-e88f3aba3abb	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5612-6d64-02fb-f0035671aff4	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5612-6d64-d38e-74fc3529fc59	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 21288602)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 21288009)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5612-6d65-676b-1489e3c4c142	\N	\N	00200000-5612-6d65-0100-0c455bc00ea9	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5612-6d65-5163-34b0a8fe6446	\N	\N	00200000-5612-6d65-077d-40eedff940f3	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5612-6d65-25b5-a7b0ced984ec	\N	\N	00200000-5612-6d65-371a-31cfd885d7d3	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5612-6d65-33f7-b8eb66689691	\N	\N	00200000-5612-6d65-63b3-6526b8c71fb4	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5612-6d65-77cc-774f58730fc4	\N	\N	00200000-5612-6d65-3c09-b64d5a840cb4	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2997 (class 0 OID 21288040)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 21288528)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21287922)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5612-6d62-bebb-5874d84746ed	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5612-6d62-8644-f91e845dcb2c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5612-6d62-5b2a-e87de73bdf87	AL	ALB	008	Albania 	Albanija	\N
00040000-5612-6d62-a73c-b0a8673eb9c7	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5612-6d62-bf43-239e1bf1d7f3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5612-6d62-889b-afb5706d9f3e	AD	AND	020	Andorra 	Andora	\N
00040000-5612-6d62-137c-0892cce65848	AO	AGO	024	Angola 	Angola	\N
00040000-5612-6d62-ddfb-e9dc3837295d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5612-6d62-1c25-faf697e3fefd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5612-6d62-a343-f63e2afaf876	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5612-6d62-e230-2da6df2ea10d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5612-6d62-af4c-9e5844a56334	AM	ARM	051	Armenia 	Armenija	\N
00040000-5612-6d62-24d5-33e52af2404e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5612-6d62-4f6d-5a79d4074ad1	AU	AUS	036	Australia 	Avstralija	\N
00040000-5612-6d62-712a-153816f8ac23	AT	AUT	040	Austria 	Avstrija	\N
00040000-5612-6d62-05c6-d0b8d8d1fbbe	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5612-6d62-6832-4098072570ec	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5612-6d63-bb44-bae5a97dd7d1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5612-6d63-47a9-5ba8f8cd4d29	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5612-6d63-8e9b-d82926c7ece6	BB	BRB	052	Barbados 	Barbados	\N
00040000-5612-6d63-ca1c-bb8c0a4806f2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5612-6d63-8c55-51cd65672204	BE	BEL	056	Belgium 	Belgija	\N
00040000-5612-6d63-46a0-3f4ce16a51ad	BZ	BLZ	084	Belize 	Belize	\N
00040000-5612-6d63-66d7-8b2593a5fc80	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5612-6d63-d561-0a18f53c7c68	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5612-6d63-bc1e-8b79d34eed39	BT	BTN	064	Bhutan 	Butan	\N
00040000-5612-6d63-8819-b8983805671f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5612-6d63-c44d-c34ea97aa602	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5612-6d63-bb29-9a98c4d9f95a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5612-6d63-bbdf-fdf0625b7463	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5612-6d63-372e-1e8483fd3a47	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5612-6d63-2822-ce7efb8ceec5	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5612-6d63-40d4-c86173a0222d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5612-6d63-6bf3-cc8ca64c6cc3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5612-6d63-6480-ff077ec1cb4b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5612-6d63-111b-69e5e978a99f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5612-6d63-0c51-a0370a04b81a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5612-6d63-e1bf-b94e78e47a13	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5612-6d63-65af-ab2ddc25fe86	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5612-6d63-5642-8b6c5cbabdf6	CA	CAN	124	Canada 	Kanada	\N
00040000-5612-6d63-2bb2-55fa4de8ff96	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5612-6d63-c12f-f57d2ebf9a42	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5612-6d63-7535-d69fe5f73bbf	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5612-6d63-9044-4f3539f2682f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5612-6d63-3c24-90eb1352ead1	CL	CHL	152	Chile 	Čile	\N
00040000-5612-6d63-b143-d9e9b9f9406c	CN	CHN	156	China 	Kitajska	\N
00040000-5612-6d63-9bbe-0674f31b53e8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5612-6d63-9588-ede523a864f6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5612-6d63-ebb8-da7ddba852f4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5612-6d63-4277-ae25f19ffc81	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5612-6d63-d2bc-d0fe916739a5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5612-6d63-8479-dc4b5895c4da	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5612-6d63-518b-48332a0619ba	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5612-6d63-6c1e-892233144fc9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5612-6d63-c850-7d28feba44ec	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5612-6d63-de37-364da53b87fa	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5612-6d63-7c3f-9b57625e10e2	CU	CUB	192	Cuba 	Kuba	\N
00040000-5612-6d63-9cd1-ca9d2248caed	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5612-6d63-4712-3844d60b5f33	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5612-6d63-6da0-399f9a57b57e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5612-6d63-6f03-d630f1ec6345	DK	DNK	208	Denmark 	Danska	\N
00040000-5612-6d63-1bf7-fb4cb8ca1532	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5612-6d63-c941-138f2593cdcf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5612-6d63-9250-4243df4e6e43	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5612-6d63-ef22-278800417559	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5612-6d63-56d8-d92c905e3d87	EG	EGY	818	Egypt 	Egipt	\N
00040000-5612-6d63-f49c-28660840324d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5612-6d63-51a8-785b3bcc59c9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5612-6d63-59b6-16bcc3098ea7	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5612-6d63-cc50-c06d2fa51d28	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5612-6d63-4460-316f5957e4e0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5612-6d63-672a-2f77e4305a4f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5612-6d63-cf3f-c06279c7c7ba	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5612-6d63-9cf0-da029b4d1638	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5612-6d63-5974-049fe45a795c	FI	FIN	246	Finland 	Finska	\N
00040000-5612-6d63-4ea3-f5decefc757e	FR	FRA	250	France 	Francija	\N
00040000-5612-6d63-7022-dff15ab3c84d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5612-6d63-8426-6fd3ec13b5b6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5612-6d63-c83d-69f45097d8bb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5612-6d63-b8c3-b46b5c408c8c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5612-6d63-e939-0b52433681e9	GA	GAB	266	Gabon 	Gabon	\N
00040000-5612-6d63-b989-8920dace3b99	GM	GMB	270	Gambia 	Gambija	\N
00040000-5612-6d63-26d4-62b6b012dcb9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5612-6d63-6866-d6cde65255ee	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5612-6d63-5470-983ca24e0c31	GH	GHA	288	Ghana 	Gana	\N
00040000-5612-6d63-28bb-86244e497d50	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5612-6d63-7c78-73ec2f2ee9d8	GR	GRC	300	Greece 	Grčija	\N
00040000-5612-6d63-cdc8-b043800cefaa	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5612-6d63-0c28-9bfaa547da43	GD	GRD	308	Grenada 	Grenada	\N
00040000-5612-6d63-1013-1ec8dcd8b50b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5612-6d63-c3b0-8d0434baf770	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5612-6d63-f2d5-cfa668d0c3fd	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5612-6d63-7fad-78ed9bcec5fc	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5612-6d63-5a69-cf6b9944e85c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5612-6d63-669c-6df961f34c9a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5612-6d63-99f4-0b1e74d36aba	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5612-6d63-e556-850b03d3eb85	HT	HTI	332	Haiti 	Haiti	\N
00040000-5612-6d63-27a3-0c162cc502be	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5612-6d63-9c18-dbf1f87af228	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5612-6d63-6210-df5c247c6b92	HN	HND	340	Honduras 	Honduras	\N
00040000-5612-6d63-1284-d59030e74284	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5612-6d63-5e43-2e3a2d86df8a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5612-6d63-cd07-a9f3d9586db1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5612-6d63-c5e0-73d6309aa0be	IN	IND	356	India 	Indija	\N
00040000-5612-6d63-f761-af595ed9caa2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5612-6d63-d6b4-f8cc4aac3aeb	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5612-6d63-dcdf-ca69e2fc3125	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5612-6d63-4be5-b03f62e87aa3	IE	IRL	372	Ireland 	Irska	\N
00040000-5612-6d63-1181-0f851ce114af	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5612-6d63-5f7d-70d1e4c6f1bf	IL	ISR	376	Israel 	Izrael	\N
00040000-5612-6d63-27df-4f4ab0fe91a1	IT	ITA	380	Italy 	Italija	\N
00040000-5612-6d63-c23a-0ebe1dd47f3a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5612-6d63-6592-c15e1499be9e	JP	JPN	392	Japan 	Japonska	\N
00040000-5612-6d63-cb43-ae87800feceb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5612-6d63-aae3-499d41171201	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5612-6d63-e46a-2d250d0cfba8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5612-6d63-6ac8-c9e13b019b88	KE	KEN	404	Kenya 	Kenija	\N
00040000-5612-6d63-09a1-24f9c87eca51	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5612-6d63-8210-90f7807a5834	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5612-6d63-73be-7140035dbdfc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5612-6d63-d1ba-2e8a9717c66b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5612-6d63-ad7f-3ba879542aa9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5612-6d63-b18f-461460ea1759	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5612-6d63-5c44-4de225e43ae0	LV	LVA	428	Latvia 	Latvija	\N
00040000-5612-6d63-3a86-fe7dcc5e6b0a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5612-6d63-8e43-eb543d309441	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5612-6d63-8c36-cd9a4a36a039	LR	LBR	430	Liberia 	Liberija	\N
00040000-5612-6d63-26f2-1164e640033d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5612-6d63-7062-a166be616d84	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5612-6d63-99cc-d060320fd4f6	LT	LTU	440	Lithuania 	Litva	\N
00040000-5612-6d63-e39a-962e0d7f8d03	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5612-6d63-84f4-23ae9bb3e1ac	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5612-6d63-59c9-718c3b4a177f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5612-6d63-9a7c-dc38f3a3be6c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5612-6d63-70b4-3d3719997d5d	MW	MWI	454	Malawi 	Malavi	\N
00040000-5612-6d63-aa9a-7454618d72c4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5612-6d63-d65b-5b44076f1633	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5612-6d63-34a5-2dbe574385fc	ML	MLI	466	Mali 	Mali	\N
00040000-5612-6d63-76e7-f4886cb55b98	MT	MLT	470	Malta 	Malta	\N
00040000-5612-6d63-a2b0-86070d785bf8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5612-6d63-2be1-7cd14fae26b7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5612-6d63-5101-4343faef811a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5612-6d63-86ea-86172728465e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5612-6d63-031a-499390463e92	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5612-6d63-4e85-617803380fb3	MX	MEX	484	Mexico 	Mehika	\N
00040000-5612-6d63-c67e-08d8297abc16	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5612-6d63-0bcf-ec02d3aa0dbc	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5612-6d63-e65c-7b3bda05a7d6	MC	MCO	492	Monaco 	Monako	\N
00040000-5612-6d63-2b67-2bdc6df934ea	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5612-6d63-d3f4-5cd5ff78a1de	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5612-6d63-1391-947f62c0b079	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5612-6d63-190d-b20fed3c65e7	MA	MAR	504	Morocco 	Maroko	\N
00040000-5612-6d63-6635-40ad4fd948aa	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5612-6d63-535d-6f5eac08bcfd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5612-6d63-0102-d2fc9206165c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5612-6d63-32a2-d059a04e19f0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5612-6d63-4349-afbace817299	NP	NPL	524	Nepal 	Nepal	\N
00040000-5612-6d63-cbaf-7567d148a081	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5612-6d63-36ab-827afe50cb1c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5612-6d63-4329-491a6c416aeb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5612-6d63-b90b-c69517e04df9	NE	NER	562	Niger 	Niger 	\N
00040000-5612-6d63-bc5c-9f11fd4c078d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5612-6d63-eeaf-196d7ddb6dac	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5612-6d63-00c2-9230161200ba	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5612-6d63-de3c-cf31a99a598b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5612-6d63-bd2c-3491c1fbee58	NO	NOR	578	Norway 	Norveška	\N
00040000-5612-6d63-d122-28ab12f9794e	OM	OMN	512	Oman 	Oman	\N
00040000-5612-6d63-5250-b518f13207a7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5612-6d63-3a1d-aff1e9b3708a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5612-6d63-45d4-2a4f18f707fa	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5612-6d63-a476-d071b3e50eaa	PA	PAN	591	Panama 	Panama	\N
00040000-5612-6d63-3e85-05ad430db17d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5612-6d63-3529-0641af8c2f7d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5612-6d63-b41f-872732560f5e	PE	PER	604	Peru 	Peru	\N
00040000-5612-6d63-c8c9-bd283d1531ff	PH	PHL	608	Philippines 	Filipini	\N
00040000-5612-6d63-c1d4-2f8df096b45a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5612-6d63-13c8-3578a0ab8740	PL	POL	616	Poland 	Poljska	\N
00040000-5612-6d63-8981-0134bc1f82e2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5612-6d63-2111-53db46840f10	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5612-6d63-9e9a-6faa7dce5312	QA	QAT	634	Qatar 	Katar	\N
00040000-5612-6d63-5a43-b00090bad359	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5612-6d63-42fe-f7582f865f68	RO	ROU	642	Romania 	Romunija	\N
00040000-5612-6d63-9d99-b32fb2d03955	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5612-6d63-5d46-3a260ff88100	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5612-6d63-5a19-10acc2831486	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5612-6d63-ee9f-eb01466bd443	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5612-6d63-878e-cfa81bf91f25	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5612-6d63-584b-c215aabf0238	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5612-6d63-4306-51a30bc51bfe	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5612-6d63-124b-194943f64ddd	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5612-6d63-4419-5aa5575a7351	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5612-6d63-d175-069149f0970b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5612-6d63-1d9d-06302de944d8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5612-6d63-47b6-fb95945b903b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5612-6d63-97e2-6bf9c4169098	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5612-6d63-7d5c-c884f9275ad0	SN	SEN	686	Senegal 	Senegal	\N
00040000-5612-6d63-9e35-1690bc83290a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5612-6d63-5d7c-c84e764e4c75	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5612-6d63-4d41-c9c0f74519d5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5612-6d63-4163-0ee29a6dfa99	SG	SGP	702	Singapore 	Singapur	\N
00040000-5612-6d63-c95b-c10884b16f2b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5612-6d63-064a-6be18fb6270e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5612-6d63-861e-787863514221	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5612-6d63-fc16-c67a76d3438b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5612-6d63-08fc-09a84706c706	SO	SOM	706	Somalia 	Somalija	\N
00040000-5612-6d63-9f7c-723c68bccad1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5612-6d63-5ffe-92cd41013fb2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5612-6d63-ae0a-2983895dc4b1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5612-6d63-de4e-aa6231364b72	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5612-6d63-01be-e11627fcd89f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5612-6d63-866e-43c688612ab0	SD	SDN	729	Sudan 	Sudan	\N
00040000-5612-6d63-bb34-7c17b1a501fa	SR	SUR	740	Suriname 	Surinam	\N
00040000-5612-6d63-6c80-7ac7e4c75e0a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5612-6d63-2be7-f24007bd777e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5612-6d63-83cb-7a8e67f6e1bc	SE	SWE	752	Sweden 	Švedska	\N
00040000-5612-6d63-7084-da2b1c119f94	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5612-6d63-58f1-5a940b73e34d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5612-6d63-aad4-c4f962e72657	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5612-6d63-d260-afa80f77d11f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5612-6d63-9a39-46319f0d10d1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5612-6d63-b67a-5baf84706470	TH	THA	764	Thailand 	Tajska	\N
00040000-5612-6d63-6ac5-ea243d97f3c5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5612-6d63-751c-1346e9bdb639	TG	TGO	768	Togo 	Togo	\N
00040000-5612-6d63-c259-5a9052835420	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5612-6d63-babc-4259c073a770	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5612-6d63-dd7b-368eefa25dc9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5612-6d63-c706-01dbfcb763a7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5612-6d63-ebe1-8dd6fb071021	TR	TUR	792	Turkey 	Turčija	\N
00040000-5612-6d63-5bfb-761b36f5448f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5612-6d63-99c9-1fecaf2d2712	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5612-6d63-2175-655e69875eac	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5612-6d63-6744-b7097ff5a265	UG	UGA	800	Uganda 	Uganda	\N
00040000-5612-6d63-f018-0a98d24747d1	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5612-6d63-6796-c4275daa307e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5612-6d63-66ed-2bf79d196431	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5612-6d63-90ed-5b5eaed8c9e1	US	USA	840	United States 	Združene države Amerike	\N
00040000-5612-6d63-df6d-f1f185245c77	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5612-6d63-3110-7eba3393c0e5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5612-6d63-c885-6d51823269e2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5612-6d63-8522-93801627432e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5612-6d63-8230-da2c55e58e3b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5612-6d63-00ce-9a6c05d3b029	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5612-6d63-0ca0-347c9c9c9c47	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5612-6d63-c89c-51cb550414c4	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5612-6d63-dc1d-efadebdc1da3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5612-6d63-50b2-7944f6b7ccef	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5612-6d63-f42a-aa915e8f0149	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5612-6d63-4b12-4a3e402dd898	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5612-6d63-354c-438d2c52fc42	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3028 (class 0 OID 21288371)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5612-6d65-fa28-f4859e791228	000e0000-5612-6d65-6edd-9074883cbe9f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-6d62-ef15-4bcee17a7752	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5612-6d65-985c-bbba0e498f86	000e0000-5612-6d65-1256-e4e32ba27109	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-6d62-b9d4-de0d845ddda9	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5612-6d65-23d5-6e8ef88b4b1c	000e0000-5612-6d65-73b6-99ca2270a83c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-6d62-ef15-4bcee17a7752	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5612-6d65-5edd-38de8a801d95	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5612-6d65-246d-6d6474434dd0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3013 (class 0 OID 21288173)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5612-6d65-079d-fcb3fa5ac12c	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-06f0-d919a9134ff8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5612-6d62-6fec-76bfc02cbd65
000d0000-5612-6d65-8645-229889e13337	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-8f84-3d30b8fd0105	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5612-6d62-1b44-eb6f070c508a
000d0000-5612-6d65-6968-dee9b66374bc	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-e73e-1ca2a90e91d3	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5612-6d62-2404-168855d9af2c
000d0000-5612-6d65-0296-dbd196e82e33	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-9862-849d2bf73c5f	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5612-6d62-04ea-c6fea43a9537
000d0000-5612-6d65-cc47-58584c44324c	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-7ecf-badf36b1ec3a	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5612-6d62-04ea-c6fea43a9537
000d0000-5612-6d65-c51d-52d194a3e87d	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-249f-1dab0ea471c7	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5612-6d62-6fec-76bfc02cbd65
000d0000-5612-6d65-83bd-505272c4f630	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-b570-27020d17e876	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5612-6d62-6fec-76bfc02cbd65
000d0000-5612-6d65-7ef1-b3eadcd7eee4	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-cead-7ed1136905f4	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5612-6d62-c218-fb227c960e5f
000d0000-5612-6d65-406f-3f9d134f2f29	000e0000-5612-6d65-1256-e4e32ba27109	000c0000-5612-6d65-c38c-7b4e2124e8b9	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5612-6d62-cbb8-d2d865dd4684
\.


--
-- TOC entry 2993 (class 0 OID 21287988)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 21287962)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21287939)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5612-6d65-4d83-8a54c6346aac	00080000-5612-6d64-8ab7-6f0a0837b011	00090000-5612-6d64-97c9-5ae89e577acf	AK		igralka
\.


--
-- TOC entry 3002 (class 0 OID 21288087)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21288583)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21288595)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21288617)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 21093458)
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
-- TOC entry 3006 (class 0 OID 21288112)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21287896)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5612-6d63-090f-64caa7225503	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5612-6d63-fdc3-281f7577a182	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5612-6d63-b4c1-cfa36495d42d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5612-6d63-a303-07cd9dd17286	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5612-6d63-fafc-4440ab088939	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5612-6d63-73c6-413f6d577cb4	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5612-6d63-9e03-07a659b15e5a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5612-6d63-9f7c-c6d0ccf1449a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5612-6d63-766d-04ad10020229	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5612-6d63-7775-7fea0cae01d3	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5612-6d63-2aac-be9e75c29334	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5612-6d63-ff80-86df6c6359ab	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5612-6d63-805b-545894cc8d90	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5612-6d63-52df-16a6aa6d2213	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5612-6d63-a28e-c81f15eb252e	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5612-6d64-67a7-929fb16490d3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5612-6d64-f87f-582e7c61e039	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5612-6d64-cbc8-9b2a2aceb98e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5612-6d64-55cd-bd685bd86764	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5612-6d64-3865-c2a75b8ab498	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5612-6d66-0fd0-35bdfbd0352b	application.tenant.maticnopodjetje	string	s:36:"00080000-5612-6d66-89f7-87d27670d28e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2980 (class 0 OID 21287810)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5612-6d64-64b0-6fa265fccc37	00000000-5612-6d64-67a7-929fb16490d3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5612-6d64-edb1-5d440fdba778	00000000-5612-6d64-67a7-929fb16490d3	00010000-5612-6d63-bfe3-906795c58c24	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5612-6d64-9ce3-259cfa8404da	00000000-5612-6d64-f87f-582e7c61e039	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2981 (class 0 OID 21287821)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5612-6d64-21e7-5d816cd78b69	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5612-6d64-4f3b-3e2e47e35016	00010000-5612-6d64-b110-5fe779ab3413	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5612-6d64-726b-de6f6b89acac	00010000-5612-6d64-c11e-e7c68e351c92	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5612-6d64-405a-d086f4376d45	00010000-5612-6d64-489f-25966eaf1901	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5612-6d64-4880-ec496240a79d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5612-6d64-2b45-67a4c4df6530	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5612-6d64-126c-37c2acf0868b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5612-6d64-fe41-861a5664ef1b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5612-6d64-97c9-5ae89e577acf	00010000-5612-6d64-6c2f-c7247c6f6ac4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5612-6d64-ab72-59e684dd80e6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5612-6d64-3a48-c912bbddddf1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5612-6d64-4974-45864ddd2bd4	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5612-6d64-2548-498b9b309621	00010000-5612-6d64-1f86-f3fea57ef43d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5612-6d64-541b-189c14d05e88	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-6d64-07b9-8205f304ee54	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-6d64-f2d0-e83582e70175	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-6d64-a774-622b35bcbbb3	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5612-6d64-5bf3-a5a841ecf76f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2976 (class 0 OID 21287775)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5612-6d63-0d00-d096cf5e6b46	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5612-6d63-3909-dbeecd20e101	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5612-6d63-4c9f-5389acfbce1b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5612-6d63-f49e-abfbf4e6c3fa	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5612-6d63-97d0-b2b3cc27a034	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5612-6d63-ee7f-b75e5e1b14aa	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5612-6d63-2eca-6cf82355c01b	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5612-6d63-01da-3b6b05c29bb7	Abonma-read	Abonma - branje	f
00030000-5612-6d63-cd90-a0e3415ace97	Abonma-write	Abonma - spreminjanje	f
00030000-5612-6d63-0965-3d4f5dd6dd6c	Alternacija-read	Alternacija - branje	f
00030000-5612-6d63-542b-a5a20ef50312	Alternacija-write	Alternacija - spreminjanje	f
00030000-5612-6d63-357e-a9d912172d0a	Arhivalija-read	Arhivalija - branje	f
00030000-5612-6d63-8c38-71f3385ce012	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5612-6d63-6c6b-0daa9fe9a340	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5612-6d63-4d7d-358f947f92f3	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5612-6d63-aa50-c57d82b770d8	Besedilo-read	Besedilo - branje	f
00030000-5612-6d63-8f46-19d16a7ae6b4	Besedilo-write	Besedilo - spreminjanje	f
00030000-5612-6d63-316e-9b984254224d	DogodekIzven-read	DogodekIzven - branje	f
00030000-5612-6d63-bf05-028ca026bbe6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5612-6d63-8316-57f1452231d3	Dogodek-read	Dogodek - branje	f
00030000-5612-6d63-fc47-b678fcee8ed7	Dogodek-write	Dogodek - spreminjanje	f
00030000-5612-6d63-12f3-9d1804fa6cd2	DrugiVir-read	DrugiVir - branje	f
00030000-5612-6d63-0d5a-e9714639b1ef	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5612-6d63-11ea-a2adb1e8a93a	Drzava-read	Drzava - branje	f
00030000-5612-6d63-12b6-9c03c50e27bd	Drzava-write	Drzava - spreminjanje	f
00030000-5612-6d63-1991-440a39ccc1b7	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5612-6d63-e4a7-5b023cc810cb	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5612-6d63-4e75-915cd48f68af	Funkcija-read	Funkcija - branje	f
00030000-5612-6d63-5139-cbca517673af	Funkcija-write	Funkcija - spreminjanje	f
00030000-5612-6d63-0c98-96d5a435d94b	Gostovanje-read	Gostovanje - branje	f
00030000-5612-6d63-3163-057ed2b51f47	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5612-6d63-0a84-2bbf82f4b648	Gostujoca-read	Gostujoca - branje	f
00030000-5612-6d63-c43c-948d677acd49	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5612-6d63-4fa1-7613ef6a83f3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5612-6d63-08f2-1d5152ac5673	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5612-6d63-90cf-ea921309e0ed	Kupec-read	Kupec - branje	f
00030000-5612-6d63-6291-3d7a8d95761c	Kupec-write	Kupec - spreminjanje	f
00030000-5612-6d63-dc7e-fe0de51fbf3c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5612-6d63-1fe2-5a0461655d00	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5612-6d63-461d-ad5742475dba	Option-read	Option - branje	f
00030000-5612-6d63-e48c-fe9e993c5434	Option-write	Option - spreminjanje	f
00030000-5612-6d63-5e78-61a365eb4c9b	OptionValue-read	OptionValue - branje	f
00030000-5612-6d63-cca4-83d56a12b882	OptionValue-write	OptionValue - spreminjanje	f
00030000-5612-6d63-024b-40f3bbfc70e2	Oseba-read	Oseba - branje	f
00030000-5612-6d63-c1b1-b5a4e52be106	Oseba-write	Oseba - spreminjanje	f
00030000-5612-6d63-b09e-6a846243661b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5612-6d63-ad6c-fc6a2012bfe9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5612-6d63-be75-50cdd3074bfe	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5612-6d63-b480-a270f78ab8e8	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5612-6d63-bd7e-96061ea621c2	Pogodba-read	Pogodba - branje	f
00030000-5612-6d63-0fc0-bdd9f8af0f2c	Pogodba-write	Pogodba - spreminjanje	f
00030000-5612-6d63-7ca2-cf1f8d64c1a7	Popa-read	Popa - branje	f
00030000-5612-6d63-19a3-350eb9961044	Popa-write	Popa - spreminjanje	f
00030000-5612-6d63-786a-7764f00f7c4b	Posta-read	Posta - branje	f
00030000-5612-6d63-cd4b-5fda616eb666	Posta-write	Posta - spreminjanje	f
00030000-5612-6d63-a998-f612c6eda732	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5612-6d63-88fc-bd57be8e340a	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5612-6d63-31e3-d65e22e75654	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5612-6d63-f855-475b79e70bf3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5612-6d63-e672-8a3ebe57f957	PostniNaslov-read	PostniNaslov - branje	f
00030000-5612-6d63-9d73-539e268bf93e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5612-6d63-82a2-0bf7c4275b73	Predstava-read	Predstava - branje	f
00030000-5612-6d63-91e9-318a3ec81595	Predstava-write	Predstava - spreminjanje	f
00030000-5612-6d63-0ff2-e3b872a193f9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5612-6d63-5916-3c658b4699a4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5612-6d63-e6f5-a4bbd7025a20	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5612-6d63-856d-dc760924c57a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5612-6d63-9723-530093314b52	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5612-6d63-db45-d17ad36ca0fa	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5612-6d63-e4f3-ad6694b21434	ProgramDela-read	ProgramDela - branje	f
00030000-5612-6d63-2d7c-ec951ddd619d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5612-6d63-4249-7912a862e03c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5612-6d63-2965-f4adc220b2a6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5612-6d63-3932-84f024144189	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5612-6d63-3493-a478128210ab	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5612-6d63-f174-fb38689e7809	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5612-6d63-1256-ba1e8cb04119	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5612-6d63-dc27-e19c978a15bc	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5612-6d63-fa3b-a6d9168eab02	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5612-6d63-3440-46e6ad0d1cb2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5612-6d63-ac8a-fbdd8f9e859c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5612-6d63-64bf-3190d33647e0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5612-6d63-f207-422dd6dc2f3b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5612-6d63-f734-00695f1025d3	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5612-6d63-1ac4-2d2ce0432c52	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5612-6d63-614a-eaba6845411a	ProgramRazno-read	ProgramRazno - branje	f
00030000-5612-6d63-1776-1df3baea86a6	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5612-6d63-d63c-874da6e795fa	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5612-6d63-53fe-6e23eca0bc8c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5612-6d63-9113-a0f74dc006df	Prostor-read	Prostor - branje	f
00030000-5612-6d63-84de-a1a4c687e49c	Prostor-write	Prostor - spreminjanje	f
00030000-5612-6d63-9241-1874277d19a6	Racun-read	Racun - branje	f
00030000-5612-6d63-ea90-6c9b19b5a52b	Racun-write	Racun - spreminjanje	f
00030000-5612-6d63-82a7-06734782135e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5612-6d63-1c3e-0c82a53731e8	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5612-6d63-30e5-4b3a23c28c0e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5612-6d63-dba6-c99a120dcbf0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5612-6d63-1730-ef78e30a44d6	Rekvizit-read	Rekvizit - branje	f
00030000-5612-6d63-df31-2d25c4ff576e	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5612-6d63-9878-2d96f6e63c32	Revizija-read	Revizija - branje	f
00030000-5612-6d63-c454-4d0a71bf35f5	Revizija-write	Revizija - spreminjanje	f
00030000-5612-6d63-3057-5b6af363cc65	Rezervacija-read	Rezervacija - branje	f
00030000-5612-6d63-3c47-1c94cd9de7fa	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5612-6d63-46f8-84751169c653	SedezniRed-read	SedezniRed - branje	f
00030000-5612-6d63-6395-4a2a6d4aee2f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5612-6d63-e862-00dcc9e0f144	Sedez-read	Sedez - branje	f
00030000-5612-6d63-ab32-66b911e5dbaa	Sedez-write	Sedez - spreminjanje	f
00030000-5612-6d63-e080-f1f45d12438e	Sezona-read	Sezona - branje	f
00030000-5612-6d63-e2b8-e3715089cf3b	Sezona-write	Sezona - spreminjanje	f
00030000-5612-6d63-8902-db31a63d4843	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5612-6d63-7014-65776267a509	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5612-6d63-a663-14cc3bfa4a80	Stevilcenje-read	Stevilcenje - branje	f
00030000-5612-6d63-12dc-261690942a8d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5612-6d63-c6c9-10f9a243ff4f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5612-6d63-dd33-32b35e1fe84e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5612-6d63-e177-21db3aa62797	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5612-6d63-a053-be9c6a7da222	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5612-6d63-fe0f-2d269299e2d9	Telefonska-read	Telefonska - branje	f
00030000-5612-6d63-2305-4531d774e7f9	Telefonska-write	Telefonska - spreminjanje	f
00030000-5612-6d63-b30b-b09036607530	TerminStoritve-read	TerminStoritve - branje	f
00030000-5612-6d63-94c7-ae149c8153a8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5612-6d63-c934-2eaa6340a286	TipFunkcije-read	TipFunkcije - branje	f
00030000-5612-6d63-dcbe-acd1329d75f9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5612-6d63-edd5-60aacf3c10a7	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5612-6d63-fa26-8e1e5244787c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5612-6d63-eb76-0e613c4c1504	Trr-read	Trr - branje	f
00030000-5612-6d63-feb0-5fee6aae749c	Trr-write	Trr - spreminjanje	f
00030000-5612-6d63-3ce2-601c0e0e87fb	Uprizoritev-read	Uprizoritev - branje	f
00030000-5612-6d63-aa91-72d9c2cca07a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5612-6d63-eafd-4b7c9c3318fe	Vaja-read	Vaja - branje	f
00030000-5612-6d63-5b31-0f540e61304f	Vaja-write	Vaja - spreminjanje	f
00030000-5612-6d63-132a-d182f84d9667	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5612-6d63-df2a-88b907e2086e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5612-6d63-1557-c144dde38f00	VrstaStroska-read	VrstaStroska - branje	f
00030000-5612-6d63-1f1c-adda6ba8b61e	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5612-6d63-f7c8-bf7704045ec8	Zaposlitev-read	Zaposlitev - branje	f
00030000-5612-6d63-a07c-a84edc50b412	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5612-6d63-23df-aa22b6a373ac	Zasedenost-read	Zasedenost - branje	f
00030000-5612-6d63-9c36-369f1a9b059e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5612-6d63-f09b-816441edce07	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5612-6d63-830f-e3b33af0cc57	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5612-6d63-2c09-20205ba986d3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5612-6d63-99ed-6e78c364a2cf	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5612-6d63-6e5e-372e5e600195	Job-read	Branje opravil - samo zase - branje	f
00030000-5612-6d63-7fb5-70f54191e72f	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5612-6d63-4e0e-a65f53a3cef3	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5612-6d63-a98a-93a512bad7c3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5612-6d63-70d5-5db833973d12	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5612-6d63-687c-2aa29cc65c4d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5612-6d63-1005-28efb1c60d75	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5612-6d63-13bd-6ee3aa1b7c90	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5612-6d63-71b1-98128a00fee9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5612-6d63-e108-21dd078a80b7	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5612-6d63-4264-d0d1cf756a26	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5612-6d63-9567-d8c37b250f8c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5612-6d63-df27-f7167129dfaa	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5612-6d63-a292-55509121e676	Datoteka-write	Datoteka - spreminjanje	f
00030000-5612-6d63-eae5-fba46ed9f3f2	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2978 (class 0 OID 21287794)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5612-6d63-b422-7c6f3da3834a	00030000-5612-6d63-3909-dbeecd20e101
00020000-5612-6d63-9ba5-f803ed4efce4	00030000-5612-6d63-11ea-a2adb1e8a93a
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-01da-3b6b05c29bb7
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-cd90-a0e3415ace97
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-0965-3d4f5dd6dd6c
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-542b-a5a20ef50312
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-357e-a9d912172d0a
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-8316-57f1452231d3
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-f49e-abfbf4e6c3fa
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-fc47-b678fcee8ed7
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-11ea-a2adb1e8a93a
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-12b6-9c03c50e27bd
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-4e75-915cd48f68af
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-5139-cbca517673af
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-0c98-96d5a435d94b
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-3163-057ed2b51f47
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-0a84-2bbf82f4b648
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-c43c-948d677acd49
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-4fa1-7613ef6a83f3
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-08f2-1d5152ac5673
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-461d-ad5742475dba
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-5e78-61a365eb4c9b
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-024b-40f3bbfc70e2
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-c1b1-b5a4e52be106
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-7ca2-cf1f8d64c1a7
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-19a3-350eb9961044
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-786a-7764f00f7c4b
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-cd4b-5fda616eb666
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-e672-8a3ebe57f957
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-9d73-539e268bf93e
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-82a2-0bf7c4275b73
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-91e9-318a3ec81595
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-9723-530093314b52
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-db45-d17ad36ca0fa
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-9113-a0f74dc006df
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-84de-a1a4c687e49c
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-30e5-4b3a23c28c0e
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-dba6-c99a120dcbf0
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-1730-ef78e30a44d6
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-df31-2d25c4ff576e
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-e080-f1f45d12438e
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-e2b8-e3715089cf3b
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-c934-2eaa6340a286
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-3ce2-601c0e0e87fb
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-aa91-72d9c2cca07a
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-eafd-4b7c9c3318fe
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-5b31-0f540e61304f
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-23df-aa22b6a373ac
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-9c36-369f1a9b059e
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-f09b-816441edce07
00020000-5612-6d63-0571-49bdd0aaf5ad	00030000-5612-6d63-2c09-20205ba986d3
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-01da-3b6b05c29bb7
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-357e-a9d912172d0a
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-8316-57f1452231d3
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-11ea-a2adb1e8a93a
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-0c98-96d5a435d94b
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-0a84-2bbf82f4b648
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-4fa1-7613ef6a83f3
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-08f2-1d5152ac5673
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-461d-ad5742475dba
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-5e78-61a365eb4c9b
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-024b-40f3bbfc70e2
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-c1b1-b5a4e52be106
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-7ca2-cf1f8d64c1a7
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-786a-7764f00f7c4b
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-e672-8a3ebe57f957
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-9d73-539e268bf93e
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-82a2-0bf7c4275b73
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-9113-a0f74dc006df
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-30e5-4b3a23c28c0e
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-1730-ef78e30a44d6
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-e080-f1f45d12438e
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-fe0f-2d269299e2d9
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-2305-4531d774e7f9
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-eb76-0e613c4c1504
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-feb0-5fee6aae749c
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-f7c8-bf7704045ec8
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-a07c-a84edc50b412
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-f09b-816441edce07
00020000-5612-6d63-0a92-9a9177063726	00030000-5612-6d63-2c09-20205ba986d3
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-01da-3b6b05c29bb7
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-0965-3d4f5dd6dd6c
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-357e-a9d912172d0a
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-8c38-71f3385ce012
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-aa50-c57d82b770d8
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-316e-9b984254224d
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-8316-57f1452231d3
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-11ea-a2adb1e8a93a
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-4e75-915cd48f68af
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-0c98-96d5a435d94b
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-0a84-2bbf82f4b648
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-4fa1-7613ef6a83f3
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-461d-ad5742475dba
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-5e78-61a365eb4c9b
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-024b-40f3bbfc70e2
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-7ca2-cf1f8d64c1a7
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-786a-7764f00f7c4b
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-82a2-0bf7c4275b73
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-9723-530093314b52
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-9113-a0f74dc006df
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-30e5-4b3a23c28c0e
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-1730-ef78e30a44d6
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-e080-f1f45d12438e
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-c934-2eaa6340a286
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-eafd-4b7c9c3318fe
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-23df-aa22b6a373ac
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-f09b-816441edce07
00020000-5612-6d63-bfc4-a7196c049a21	00030000-5612-6d63-2c09-20205ba986d3
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-01da-3b6b05c29bb7
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-cd90-a0e3415ace97
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-542b-a5a20ef50312
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-357e-a9d912172d0a
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-8316-57f1452231d3
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-11ea-a2adb1e8a93a
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-0c98-96d5a435d94b
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-0a84-2bbf82f4b648
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-461d-ad5742475dba
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-5e78-61a365eb4c9b
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-7ca2-cf1f8d64c1a7
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-786a-7764f00f7c4b
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-82a2-0bf7c4275b73
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-9113-a0f74dc006df
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-30e5-4b3a23c28c0e
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-1730-ef78e30a44d6
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-e080-f1f45d12438e
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-c934-2eaa6340a286
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-f09b-816441edce07
00020000-5612-6d63-8f24-d1dd0c2505b2	00030000-5612-6d63-2c09-20205ba986d3
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-01da-3b6b05c29bb7
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-357e-a9d912172d0a
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-8316-57f1452231d3
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-11ea-a2adb1e8a93a
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-0c98-96d5a435d94b
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-0a84-2bbf82f4b648
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-461d-ad5742475dba
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-5e78-61a365eb4c9b
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-7ca2-cf1f8d64c1a7
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-786a-7764f00f7c4b
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-82a2-0bf7c4275b73
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-9113-a0f74dc006df
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-30e5-4b3a23c28c0e
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-1730-ef78e30a44d6
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-e080-f1f45d12438e
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-b30b-b09036607530
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-4c9f-5389acfbce1b
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-c934-2eaa6340a286
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-f09b-816441edce07
00020000-5612-6d63-079b-14e8f4d7e00f	00030000-5612-6d63-2c09-20205ba986d3
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-0d00-d096cf5e6b46
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3909-dbeecd20e101
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-4c9f-5389acfbce1b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-f49e-abfbf4e6c3fa
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-97d0-b2b3cc27a034
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-ee7f-b75e5e1b14aa
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-2eca-6cf82355c01b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-01da-3b6b05c29bb7
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-cd90-a0e3415ace97
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-0965-3d4f5dd6dd6c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-542b-a5a20ef50312
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-357e-a9d912172d0a
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-8c38-71f3385ce012
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-aa50-c57d82b770d8
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-8f46-19d16a7ae6b4
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-316e-9b984254224d
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-bf05-028ca026bbe6
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-8316-57f1452231d3
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-fc47-b678fcee8ed7
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-11ea-a2adb1e8a93a
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-12b6-9c03c50e27bd
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-12f3-9d1804fa6cd2
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-0d5a-e9714639b1ef
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1991-440a39ccc1b7
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e4a7-5b023cc810cb
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-4e75-915cd48f68af
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-5139-cbca517673af
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-0c98-96d5a435d94b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3163-057ed2b51f47
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-0a84-2bbf82f4b648
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-c43c-948d677acd49
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-4fa1-7613ef6a83f3
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-08f2-1d5152ac5673
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-90cf-ea921309e0ed
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-6291-3d7a8d95761c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-dc7e-fe0de51fbf3c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1fe2-5a0461655d00
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-461d-ad5742475dba
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e48c-fe9e993c5434
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-5e78-61a365eb4c9b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-cca4-83d56a12b882
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-024b-40f3bbfc70e2
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-c1b1-b5a4e52be106
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-b09e-6a846243661b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-ad6c-fc6a2012bfe9
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-be75-50cdd3074bfe
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-b480-a270f78ab8e8
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-bd7e-96061ea621c2
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-0fc0-bdd9f8af0f2c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-7ca2-cf1f8d64c1a7
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-19a3-350eb9961044
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-786a-7764f00f7c4b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-cd4b-5fda616eb666
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-a998-f612c6eda732
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-88fc-bd57be8e340a
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-31e3-d65e22e75654
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-f855-475b79e70bf3
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e672-8a3ebe57f957
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-9d73-539e268bf93e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-82a2-0bf7c4275b73
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-91e9-318a3ec81595
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-0ff2-e3b872a193f9
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-5916-3c658b4699a4
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e6f5-a4bbd7025a20
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-856d-dc760924c57a
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-9723-530093314b52
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-db45-d17ad36ca0fa
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e4f3-ad6694b21434
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-2d7c-ec951ddd619d
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-4249-7912a862e03c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-2965-f4adc220b2a6
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3932-84f024144189
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3493-a478128210ab
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-f174-fb38689e7809
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1256-ba1e8cb04119
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-dc27-e19c978a15bc
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-fa3b-a6d9168eab02
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3440-46e6ad0d1cb2
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-ac8a-fbdd8f9e859c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-64bf-3190d33647e0
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-f207-422dd6dc2f3b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-f734-00695f1025d3
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1ac4-2d2ce0432c52
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-614a-eaba6845411a
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1776-1df3baea86a6
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-d63c-874da6e795fa
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-53fe-6e23eca0bc8c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-9113-a0f74dc006df
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-84de-a1a4c687e49c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-9241-1874277d19a6
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-ea90-6c9b19b5a52b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-82a7-06734782135e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1c3e-0c82a53731e8
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-30e5-4b3a23c28c0e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-dba6-c99a120dcbf0
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1730-ef78e30a44d6
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-df31-2d25c4ff576e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-9878-2d96f6e63c32
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-c454-4d0a71bf35f5
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3057-5b6af363cc65
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3c47-1c94cd9de7fa
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-46f8-84751169c653
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-6395-4a2a6d4aee2f
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e862-00dcc9e0f144
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-ab32-66b911e5dbaa
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e080-f1f45d12438e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e2b8-e3715089cf3b
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-8902-db31a63d4843
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-7014-65776267a509
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-a663-14cc3bfa4a80
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-12dc-261690942a8d
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-c6c9-10f9a243ff4f
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-dd33-32b35e1fe84e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-e177-21db3aa62797
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-a053-be9c6a7da222
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-fe0f-2d269299e2d9
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-2305-4531d774e7f9
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-b30b-b09036607530
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-94c7-ae149c8153a8
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-c934-2eaa6340a286
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-dcbe-acd1329d75f9
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-edd5-60aacf3c10a7
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-fa26-8e1e5244787c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-eb76-0e613c4c1504
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-feb0-5fee6aae749c
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-3ce2-601c0e0e87fb
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-aa91-72d9c2cca07a
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-eafd-4b7c9c3318fe
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-5b31-0f540e61304f
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-132a-d182f84d9667
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-df2a-88b907e2086e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1557-c144dde38f00
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-1f1c-adda6ba8b61e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-f7c8-bf7704045ec8
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-a07c-a84edc50b412
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-23df-aa22b6a373ac
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-9c36-369f1a9b059e
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-f09b-816441edce07
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-830f-e3b33af0cc57
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-2c09-20205ba986d3
00020000-5612-6d64-68b9-28b08b60007d	00030000-5612-6d63-99ed-6e78c364a2cf
\.


--
-- TOC entry 3007 (class 0 OID 21288119)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21288153)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21288289)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5612-6d65-d420-bc6f2c5df579	00090000-5612-6d64-21e7-5d816cd78b69	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5612-6d65-3c06-d2b486700922	00090000-5612-6d64-2b45-67a4c4df6530	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5612-6d65-a104-0ed7fa5c4c4a	00090000-5612-6d64-2548-498b9b309621	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5612-6d65-6e67-42d1d37b61a1	00090000-5612-6d64-ab72-59e684dd80e6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2983 (class 0 OID 21287854)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5612-6d64-8ab7-6f0a0837b011	00040000-5612-6d63-861e-787863514221	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d64-c7dc-6ce069c996c8	00040000-5612-6d63-861e-787863514221	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5612-6d64-ba99-8f15405e62c2	00040000-5612-6d63-861e-787863514221	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d64-9d94-5fc04f5658b6	00040000-5612-6d63-861e-787863514221	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d64-ff1c-c7cceb0e9ece	00040000-5612-6d63-861e-787863514221	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d64-a548-132c797b224f	00040000-5612-6d62-e230-2da6df2ea10d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d64-6dce-1c69fe2bc303	00040000-5612-6d63-de37-364da53b87fa	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d64-add6-2c2a9f71a4f3	00040000-5612-6d62-712a-153816f8ac23	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d64-530b-442ce7ae0e6e	00040000-5612-6d63-6866-d6cde65255ee	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-6d66-89f7-87d27670d28e	00040000-5612-6d63-861e-787863514221	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2985 (class 0 OID 21287888)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5612-6d62-0ca7-45bb4cfd264a	8341	Adlešiči
00050000-5612-6d62-85ca-e1fd49aaf0ce	5270	Ajdovščina
00050000-5612-6d62-e9b8-0c6920683d46	6280	Ankaran/Ancarano
00050000-5612-6d62-8f55-604657a2f273	9253	Apače
00050000-5612-6d62-a9d7-6f3ae2900220	8253	Artiče
00050000-5612-6d62-0199-0d2becc6a2a2	4275	Begunje na Gorenjskem
00050000-5612-6d62-5c7f-bf82dbab7668	1382	Begunje pri Cerknici
00050000-5612-6d62-e38b-e293d1f6c809	9231	Beltinci
00050000-5612-6d62-cce8-3e5f4b2ee588	2234	Benedikt
00050000-5612-6d62-7389-7fefab706bf7	2345	Bistrica ob Dravi
00050000-5612-6d62-35d0-9a2668652aa3	3256	Bistrica ob Sotli
00050000-5612-6d62-f573-cbd0dcad1b26	8259	Bizeljsko
00050000-5612-6d62-2640-1fc9df58d1d5	1223	Blagovica
00050000-5612-6d62-72e5-ef4113ba05f3	8283	Blanca
00050000-5612-6d62-94ed-2e58e7752f09	4260	Bled
00050000-5612-6d62-3671-3e610f1601a9	4273	Blejska Dobrava
00050000-5612-6d62-04c3-27bf77f93eff	9265	Bodonci
00050000-5612-6d62-7b23-56fd343e6130	9222	Bogojina
00050000-5612-6d62-8995-b2d9af5198a9	4263	Bohinjska Bela
00050000-5612-6d62-cddf-e7d2fac68d56	4264	Bohinjska Bistrica
00050000-5612-6d62-24f5-d42a49a156d9	4265	Bohinjsko jezero
00050000-5612-6d62-56d3-290b6ffbc1bd	1353	Borovnica
00050000-5612-6d62-eb91-4aa7551422f1	8294	Boštanj
00050000-5612-6d62-1707-a1ff49b21fc9	5230	Bovec
00050000-5612-6d62-391a-1cb8ce57e304	5295	Branik
00050000-5612-6d62-774a-f5176233932a	3314	Braslovče
00050000-5612-6d62-d3ed-73bbf2ae5989	5223	Breginj
00050000-5612-6d62-c529-cff9715c2c22	8280	Brestanica
00050000-5612-6d62-100d-40288a8c1489	2354	Bresternica
00050000-5612-6d62-578e-0638c1e5ea6f	4243	Brezje
00050000-5612-6d62-f1dd-9a1b19e974bd	1351	Brezovica pri Ljubljani
00050000-5612-6d62-c6df-7852cf5305b9	8250	Brežice
00050000-5612-6d62-55a2-b252b8d749d6	4210	Brnik - Aerodrom
00050000-5612-6d62-0d2c-4dd9f48d4933	8321	Brusnice
00050000-5612-6d62-ae62-f71f51462362	3255	Buče
00050000-5612-6d62-e293-caffb1c26d91	8276	Bučka 
00050000-5612-6d62-c098-c41cb8983493	9261	Cankova
00050000-5612-6d62-b046-8a1c93ba147c	3000	Celje 
00050000-5612-6d62-bb3f-e406ed547cca	3001	Celje - poštni predali
00050000-5612-6d62-e7ca-bfd340b60a26	4207	Cerklje na Gorenjskem
00050000-5612-6d62-1042-baa01a555d8a	8263	Cerklje ob Krki
00050000-5612-6d62-6e00-eee768cc3d70	1380	Cerknica
00050000-5612-6d62-f321-3de3d42acafd	5282	Cerkno
00050000-5612-6d62-73de-9adf1a195d9a	2236	Cerkvenjak
00050000-5612-6d62-adf9-960ad4304546	2215	Ceršak
00050000-5612-6d62-9932-264c7ff3fd69	2326	Cirkovce
00050000-5612-6d62-559a-a8a89b89cadf	2282	Cirkulane
00050000-5612-6d62-50c3-95fc715e867f	5273	Col
00050000-5612-6d62-e105-678e91ba5ca6	8251	Čatež ob Savi
00050000-5612-6d62-fbab-3b5b435d31f6	1413	Čemšenik
00050000-5612-6d62-895d-75cfc5b4522d	5253	Čepovan
00050000-5612-6d62-34e8-8ebf664c59a3	9232	Črenšovci
00050000-5612-6d62-662c-3f5d9bda8fde	2393	Črna na Koroškem
00050000-5612-6d62-ce29-6fe3b78e6d52	6275	Črni Kal
00050000-5612-6d62-325c-5de0bb96800d	5274	Črni Vrh nad Idrijo
00050000-5612-6d62-3a38-cb67660fbd6b	5262	Črniče
00050000-5612-6d62-697f-d239b52de524	8340	Črnomelj
00050000-5612-6d62-2554-5682b378d86f	6271	Dekani
00050000-5612-6d62-203d-ffc7a75a50dd	5210	Deskle
00050000-5612-6d62-7752-44f9ef067f32	2253	Destrnik
00050000-5612-6d62-042f-0b219003c5af	6215	Divača
00050000-5612-6d62-2c06-4f96f6e077dc	1233	Dob
00050000-5612-6d62-5941-bc82aa3788ec	3224	Dobje pri Planini
00050000-5612-6d62-5225-d4edebbcd473	8257	Dobova
00050000-5612-6d62-b1f0-ce4e466ad395	1423	Dobovec
00050000-5612-6d62-7179-94e771977c0e	5263	Dobravlje
00050000-5612-6d62-fec2-69ff77fabd01	3204	Dobrna
00050000-5612-6d62-f457-dc20fb354527	8211	Dobrnič
00050000-5612-6d62-2d22-5bb3cf5c9480	1356	Dobrova
00050000-5612-6d62-daad-6a992e605d46	9223	Dobrovnik/Dobronak 
00050000-5612-6d62-cde3-c99a8de50563	5212	Dobrovo v Brdih
00050000-5612-6d62-3502-07f11a1c0bd8	1431	Dol pri Hrastniku
00050000-5612-6d62-df75-298bc5f5e8f0	1262	Dol pri Ljubljani
00050000-5612-6d62-3329-039ef5a17caa	1273	Dole pri Litiji
00050000-5612-6d62-5056-7c99eb726eeb	1331	Dolenja vas
00050000-5612-6d62-a8c8-b215f1d9d79e	8350	Dolenjske Toplice
00050000-5612-6d62-5160-a41bbe7118da	1230	Domžale
00050000-5612-6d62-06dd-30b52b7d6cfd	2252	Dornava
00050000-5612-6d62-1429-3dab42d863d9	5294	Dornberk
00050000-5612-6d62-49be-10943880fac6	1319	Draga
00050000-5612-6d62-15f3-11cbefeff34b	8343	Dragatuš
00050000-5612-6d62-02d7-0468004e3fa6	3222	Dramlje
00050000-5612-6d62-7a30-e5a4ec62eb07	2370	Dravograd
00050000-5612-6d62-2407-bad3f5b79167	4203	Duplje
00050000-5612-6d62-26c2-f994a500e461	6221	Dutovlje
00050000-5612-6d62-2c2e-2b7fde0bedf1	8361	Dvor
00050000-5612-6d62-f9f2-cd91717f60ad	2343	Fala
00050000-5612-6d62-5df4-c4236b8dc732	9208	Fokovci
00050000-5612-6d62-f298-512880a0d95a	2313	Fram
00050000-5612-6d62-f7bb-c12b1a0aab81	3213	Frankolovo
00050000-5612-6d62-6024-de0ba27990a4	1274	Gabrovka
00050000-5612-6d62-96a8-494a0b142269	8254	Globoko
00050000-5612-6d62-2cc2-8cbfd51a1149	5275	Godovič
00050000-5612-6d62-9b3d-400cd6dfa3c0	4204	Golnik
00050000-5612-6d62-6c22-f801e8dfa8bf	3303	Gomilsko
00050000-5612-6d62-1999-7f1b57a1657c	4224	Gorenja vas
00050000-5612-6d62-f11e-c677fde74a2d	3263	Gorica pri Slivnici
00050000-5612-6d62-6ad0-d068e3c9c7e3	2272	Gorišnica
00050000-5612-6d62-bc82-23ec6a8bdba1	9250	Gornja Radgona
00050000-5612-6d62-c736-1e368103e8f3	3342	Gornji Grad
00050000-5612-6d62-6808-0741778602f2	4282	Gozd Martuljek
00050000-5612-6d62-1a20-1b9bfd03b3e1	6272	Gračišče
00050000-5612-6d62-3bbc-a99af72f9e3d	9264	Grad
00050000-5612-6d62-92e3-05d127bde232	8332	Gradac
00050000-5612-6d62-a75d-250cfdc7b8eb	1384	Grahovo
00050000-5612-6d62-40be-74e7be878f36	5242	Grahovo ob Bači
00050000-5612-6d62-b3b5-a34c7d146aff	5251	Grgar
00050000-5612-6d62-4874-9461ee0de024	3302	Griže
00050000-5612-6d62-2d64-1e55fec10fa2	3231	Grobelno
00050000-5612-6d62-f21d-a89091e06222	1290	Grosuplje
00050000-5612-6d62-cd86-f78090f02961	2288	Hajdina
00050000-5612-6d62-02c5-eec850f8e487	8362	Hinje
00050000-5612-6d62-7683-7475a0c1ce7b	2311	Hoče
00050000-5612-6d62-e716-e180f3f3417a	9205	Hodoš/Hodos
00050000-5612-6d62-b4cc-e084c4403cea	1354	Horjul
00050000-5612-6d62-92e6-4b97ae589014	1372	Hotedršica
00050000-5612-6d62-9a95-124c31e5b3fb	1430	Hrastnik
00050000-5612-6d62-7fcc-271fbbadbc04	6225	Hruševje
00050000-5612-6d62-9b9d-5f7027f3921c	4276	Hrušica
00050000-5612-6d62-f8b6-8c383c47ec4a	5280	Idrija
00050000-5612-6d62-5340-20392b96d4b3	1292	Ig
00050000-5612-6d62-8ebf-e25af59fd626	6250	Ilirska Bistrica
00050000-5612-6d62-6e77-9359e2a657da	6251	Ilirska Bistrica-Trnovo
00050000-5612-6d62-e629-852108bec461	1295	Ivančna Gorica
00050000-5612-6d62-705b-1a6d96b797c4	2259	Ivanjkovci
00050000-5612-6d62-0901-495ac843ef5b	1411	Izlake
00050000-5612-6d62-a617-6649cbd8e9aa	6310	Izola/Isola
00050000-5612-6d62-a949-7a151d069c02	2222	Jakobski Dol
00050000-5612-6d62-9660-b32bd0c897b8	2221	Jarenina
00050000-5612-6d62-8662-4d2af1094bd6	6254	Jelšane
00050000-5612-6d62-f328-657b42688f73	4270	Jesenice
00050000-5612-6d62-c007-ac284c61aec0	8261	Jesenice na Dolenjskem
00050000-5612-6d62-fff0-31ecd977b8d9	3273	Jurklošter
00050000-5612-6d62-dcb9-1f121d511e21	2223	Jurovski Dol
00050000-5612-6d62-5da9-ecbb4e548799	2256	Juršinci
00050000-5612-6d62-039a-c957f29be158	5214	Kal nad Kanalom
00050000-5612-6d62-9c28-3123954c304c	3233	Kalobje
00050000-5612-6d62-9db6-226a889fc062	4246	Kamna Gorica
00050000-5612-6d62-5422-3b5529dbda4f	2351	Kamnica
00050000-5612-6d62-7cbc-a5d4f916a086	1241	Kamnik
00050000-5612-6d62-3de0-2c3d195ae5c5	5213	Kanal
00050000-5612-6d62-0033-bfe6bb050564	8258	Kapele
00050000-5612-6d62-1b08-e20b177aca2b	2362	Kapla
00050000-5612-6d62-ea28-688c5426e903	2325	Kidričevo
00050000-5612-6d62-64f0-cbc8bff82a19	1412	Kisovec
00050000-5612-6d62-dcfb-c7072aedfbfb	6253	Knežak
00050000-5612-6d62-4d3a-32b0640af0e8	5222	Kobarid
00050000-5612-6d62-c42b-ec31fddeb740	9227	Kobilje
00050000-5612-6d62-954b-0e047c3d2d18	1330	Kočevje
00050000-5612-6d62-8965-1e24968ec89e	1338	Kočevska Reka
00050000-5612-6d62-881a-a3573ee60b59	2276	Kog
00050000-5612-6d62-d6ac-15e80626358c	5211	Kojsko
00050000-5612-6d62-364e-da33956d11ce	6223	Komen
00050000-5612-6d62-6f99-df8ae472b84e	1218	Komenda
00050000-5612-6d62-9e9c-f5e3d0438e87	6000	Koper/Capodistria 
00050000-5612-6d62-a546-f8865294a2c1	6001	Koper/Capodistria - poštni predali
00050000-5612-6d62-26be-0819b8963250	8282	Koprivnica
00050000-5612-6d62-83ee-1f3319430b09	5296	Kostanjevica na Krasu
00050000-5612-6d62-f02a-db8974a12827	8311	Kostanjevica na Krki
00050000-5612-6d62-2a45-a4d1f94c70d4	1336	Kostel
00050000-5612-6d62-8591-0eb7dad58edb	6256	Košana
00050000-5612-6d62-e289-7b97fcf43832	2394	Kotlje
00050000-5612-6d62-8e30-e578130f88f2	6240	Kozina
00050000-5612-6d62-d4e1-b8b6904889be	3260	Kozje
00050000-5612-6d62-bab2-2dc238284b0d	4000	Kranj 
00050000-5612-6d62-a121-e80f0898309e	4001	Kranj - poštni predali
00050000-5612-6d62-df18-e5a4a5c16d5e	4280	Kranjska Gora
00050000-5612-6d62-dafb-aae9ec525110	1281	Kresnice
00050000-5612-6d62-345e-5bf22b70c8ed	4294	Križe
00050000-5612-6d62-4785-7df20aa4086e	9206	Križevci
00050000-5612-6d62-1bf7-d02663a15f5a	9242	Križevci pri Ljutomeru
00050000-5612-6d62-54e8-2e3655c0d764	1301	Krka
00050000-5612-6d62-b8c7-400f36c33da4	8296	Krmelj
00050000-5612-6d62-fbe3-8b0f2e1952ac	4245	Kropa
00050000-5612-6d62-3f9c-05dfb549d1fd	8262	Krška vas
00050000-5612-6d62-ba3e-eb82cddaa4d7	8270	Krško
00050000-5612-6d62-4ed3-ea0cf4b738b3	9263	Kuzma
00050000-5612-6d62-b7ea-f5cee62d88f8	2318	Laporje
00050000-5612-6d62-e8e8-c17b8795d300	3270	Laško
00050000-5612-6d62-da6b-af8437c9cf2f	1219	Laze v Tuhinju
00050000-5612-6d62-b374-34273e4f75ef	2230	Lenart v Slovenskih goricah
00050000-5612-6d62-6650-bc2858ed28e5	9220	Lendava/Lendva
00050000-5612-6d62-3fc1-bdb945e7c02b	4248	Lesce
00050000-5612-6d62-cb2c-48072bb221ab	3261	Lesično
00050000-5612-6d62-ecde-7e541a682e3e	8273	Leskovec pri Krškem
00050000-5612-6d62-3d9a-0f41aabfdc9a	2372	Libeliče
00050000-5612-6d62-4f99-89a3b25e778c	2341	Limbuš
00050000-5612-6d62-409d-17f3c34592a0	1270	Litija
00050000-5612-6d62-5537-8eb04e6fd565	3202	Ljubečna
00050000-5612-6d62-4e0b-97f54e0d1531	1000	Ljubljana 
00050000-5612-6d62-ffd3-54f2524394e1	1001	Ljubljana - poštni predali
00050000-5612-6d62-9c95-3e699ab59dfc	1231	Ljubljana - Črnuče
00050000-5612-6d62-f7c7-508f075686ed	1261	Ljubljana - Dobrunje
00050000-5612-6d62-bb05-bf0cad2fbaee	1260	Ljubljana - Polje
00050000-5612-6d62-be6f-e94740297494	1210	Ljubljana - Šentvid
00050000-5612-6d62-0ef8-c7f16639e3e1	1211	Ljubljana - Šmartno
00050000-5612-6d62-cd93-8713947b9ee3	3333	Ljubno ob Savinji
00050000-5612-6d62-29f6-6f482a0a906f	9240	Ljutomer
00050000-5612-6d62-1335-e00ac73653d3	3215	Loče
00050000-5612-6d62-c3ff-76cd4e2d419b	5231	Log pod Mangartom
00050000-5612-6d62-2cf8-51d0abc46957	1358	Log pri Brezovici
00050000-5612-6d62-b705-7c50d86b0ec2	1370	Logatec
00050000-5612-6d62-9ec9-12ab758b06e8	1371	Logatec
00050000-5612-6d62-2ccc-f297b5db5cb6	1434	Loka pri Zidanem Mostu
00050000-5612-6d62-f23b-a26c6c37fefe	3223	Loka pri Žusmu
00050000-5612-6d62-6ca7-c2bbebf18b86	6219	Lokev
00050000-5612-6d62-a6e8-6531a1a3a827	1318	Loški Potok
00050000-5612-6d62-16d7-d05aedec6067	2324	Lovrenc na Dravskem polju
00050000-5612-6d62-05d9-e873335f02ee	2344	Lovrenc na Pohorju
00050000-5612-6d62-e82a-531c9f1c565e	3334	Luče
00050000-5612-6d62-f5f5-0fc7f5e429b2	1225	Lukovica
00050000-5612-6d62-9368-4d82620bfb1c	9202	Mačkovci
00050000-5612-6d62-85f5-97bca1a95cf1	2322	Majšperk
00050000-5612-6d62-eee2-4aa93f33b509	2321	Makole
00050000-5612-6d62-3142-b9b128911cb4	9243	Mala Nedelja
00050000-5612-6d62-540a-c5a35734b73b	2229	Malečnik
00050000-5612-6d62-a2c1-468f925a306e	6273	Marezige
00050000-5612-6d62-8fed-c4a4a92519a5	2000	Maribor 
00050000-5612-6d62-e8f8-580b24ce75ed	2001	Maribor - poštni predali
00050000-5612-6d62-76ad-e5caf72bdeb8	2206	Marjeta na Dravskem polju
00050000-5612-6d62-8e63-75522a6bbaea	2281	Markovci
00050000-5612-6d62-4b5c-33599930b2e1	9221	Martjanci
00050000-5612-6d62-25d6-fcd1c9e3a91f	6242	Materija
00050000-5612-6d62-b35d-19358a5a0021	4211	Mavčiče
00050000-5612-6d62-9f4c-76497b70c739	1215	Medvode
00050000-5612-6d62-00c3-ef527533fb5b	1234	Mengeš
00050000-5612-6d62-2ac6-3488a9ced03e	8330	Metlika
00050000-5612-6d62-d452-77acbb382bee	2392	Mežica
00050000-5612-6d62-75c0-56b90e00414e	2204	Miklavž na Dravskem polju
00050000-5612-6d62-c581-feeed8074b51	2275	Miklavž pri Ormožu
00050000-5612-6d62-dfd7-e66b58a1dea3	5291	Miren
00050000-5612-6d62-fa73-d9b62c07631c	8233	Mirna
00050000-5612-6d62-4c64-b0991987d912	8216	Mirna Peč
00050000-5612-6d62-d496-fd15c11bbc28	2382	Mislinja
00050000-5612-6d62-c32a-e98494d739dc	4281	Mojstrana
00050000-5612-6d62-b621-3597baf92a01	8230	Mokronog
00050000-5612-6d62-9741-62cda6ed2d15	1251	Moravče
00050000-5612-6d62-dc38-8075ed84c596	9226	Moravske Toplice
00050000-5612-6d62-8ce3-70d2696a51f6	5216	Most na Soči
00050000-5612-6d62-8cdf-e5d1304cab4c	1221	Motnik
00050000-5612-6d62-c625-ccc6bfae74db	3330	Mozirje
00050000-5612-6d62-b089-0fe0fed4c87b	9000	Murska Sobota 
00050000-5612-6d62-6fea-295c43ebcadb	9001	Murska Sobota - poštni predali
00050000-5612-6d62-675d-3da1e21f127d	2366	Muta
00050000-5612-6d62-577b-56494057658c	4202	Naklo
00050000-5612-6d62-ebdb-906221a3cab9	3331	Nazarje
00050000-5612-6d62-965a-3c716fbf3975	1357	Notranje Gorice
00050000-5612-6d62-c4d6-1403b4ce8e8e	3203	Nova Cerkev
00050000-5612-6d62-8b86-33f9eb33b5f6	5000	Nova Gorica 
00050000-5612-6d62-7f20-a122bee314e0	5001	Nova Gorica - poštni predali
00050000-5612-6d62-3de2-96f73c418abe	1385	Nova vas
00050000-5612-6d62-8fea-025a215622d7	8000	Novo mesto
00050000-5612-6d62-4722-720f7edd908a	8001	Novo mesto - poštni predali
00050000-5612-6d62-6d3c-dd9817f06946	6243	Obrov
00050000-5612-6d62-ed63-cb810c9fe48f	9233	Odranci
00050000-5612-6d62-8dbe-c73237a8334e	2317	Oplotnica
00050000-5612-6d62-8ba9-574d2ae41220	2312	Orehova vas
00050000-5612-6d62-3189-f0666b5794bd	2270	Ormož
00050000-5612-6d62-1280-2bc4f4b69c43	1316	Ortnek
00050000-5612-6d62-30b2-f3fdf1c152ef	1337	Osilnica
00050000-5612-6d62-4d46-6e9ad902bddf	8222	Otočec
00050000-5612-6d62-27c6-e2ae69fc47ed	2361	Ožbalt
00050000-5612-6d62-04c1-e843125bb6f7	2231	Pernica
00050000-5612-6d62-8d86-80374a5adfaa	2211	Pesnica pri Mariboru
00050000-5612-6d62-31eb-93eebc5f88d5	9203	Petrovci
00050000-5612-6d62-5172-ef036c0089e5	3301	Petrovče
00050000-5612-6d62-ab3c-3b1a2a660e6f	6330	Piran/Pirano
00050000-5612-6d62-9c1f-db33e929974b	8255	Pišece
00050000-5612-6d62-9ca9-8a698521582d	6257	Pivka
00050000-5612-6d62-807c-16ee0f9259ff	6232	Planina
00050000-5612-6d62-5c13-432c850453c5	3225	Planina pri Sevnici
00050000-5612-6d62-e885-2b13218aca73	6276	Pobegi
00050000-5612-6d62-3020-f62e6cbdf930	8312	Podbočje
00050000-5612-6d62-1acc-b45214ccbdc5	5243	Podbrdo
00050000-5612-6d62-006a-4b49253de7bc	3254	Podčetrtek
00050000-5612-6d62-78cd-63cbb505cf0a	2273	Podgorci
00050000-5612-6d62-9871-a95291ff5ae1	6216	Podgorje
00050000-5612-6d62-0c62-743ac6089722	2381	Podgorje pri Slovenj Gradcu
00050000-5612-6d62-599a-6b414db2a244	6244	Podgrad
00050000-5612-6d62-acd6-d5c0817576ef	1414	Podkum
00050000-5612-6d62-4fda-93a4bcb68e8d	2286	Podlehnik
00050000-5612-6d62-ba49-23a8fae06b3f	5272	Podnanos
00050000-5612-6d62-327c-c52c57c16520	4244	Podnart
00050000-5612-6d62-a46b-10696d33d010	3241	Podplat
00050000-5612-6d62-5713-c00b3089e14a	3257	Podsreda
00050000-5612-6d62-e486-0386ab234d30	2363	Podvelka
00050000-5612-6d62-0742-68f589d6149b	2208	Pohorje
00050000-5612-6d62-9216-ca2c4a8c29e0	2257	Polenšak
00050000-5612-6d62-0e65-42630885f5da	1355	Polhov Gradec
00050000-5612-6d62-40cb-f914d0ce816c	4223	Poljane nad Škofjo Loko
00050000-5612-6d62-4b43-72042a091567	2319	Poljčane
00050000-5612-6d62-18ca-9466ce796c25	1272	Polšnik
00050000-5612-6d62-db24-0874a23c23da	3313	Polzela
00050000-5612-6d62-b148-6633ee758f34	3232	Ponikva
00050000-5612-6d62-c68a-277b6f8319e6	6320	Portorož/Portorose
00050000-5612-6d62-dec7-af87ba512624	6230	Postojna
00050000-5612-6d62-bd2c-666e2c417dbf	2331	Pragersko
00050000-5612-6d62-a672-4753401553e2	3312	Prebold
00050000-5612-6d62-b163-3c655e551f27	4205	Preddvor
00050000-5612-6d62-6652-72abd3fe6352	6255	Prem
00050000-5612-6d62-8a26-af3bec08b2cb	1352	Preserje
00050000-5612-6d62-eed8-ede91f3aeb13	6258	Prestranek
00050000-5612-6d62-4da8-a6df83d03140	2391	Prevalje
00050000-5612-6d62-92c2-2b18dac21bba	3262	Prevorje
00050000-5612-6d62-2e4e-a72996fe9559	1276	Primskovo 
00050000-5612-6d62-6d43-580d2bedee77	3253	Pristava pri Mestinju
00050000-5612-6d62-362f-d63feec4b427	9207	Prosenjakovci/Partosfalva
00050000-5612-6d62-433c-b958a399f2d4	5297	Prvačina
00050000-5612-6d62-e8e6-f57e1b57f6e4	2250	Ptuj
00050000-5612-6d62-2da6-8588edb7d763	2323	Ptujska Gora
00050000-5612-6d62-2055-6533cfcf6073	9201	Puconci
00050000-5612-6d62-4ae1-147c794e4e55	2327	Rače
00050000-5612-6d62-4986-9e915514e6f6	1433	Radeče
00050000-5612-6d62-1414-92c36d642197	9252	Radenci
00050000-5612-6d62-84e4-ba8eb4a69137	2360	Radlje ob Dravi
00050000-5612-6d62-6c26-52a2bf77e053	1235	Radomlje
00050000-5612-6d62-1d2c-d704b032b92b	4240	Radovljica
00050000-5612-6d62-2045-cd42e59ef8e8	8274	Raka
00050000-5612-6d62-9893-de8938b17ffe	1381	Rakek
00050000-5612-6d62-7dbd-7fee60ea036b	4283	Rateče - Planica
00050000-5612-6d62-6f9c-c568454eaf9e	2390	Ravne na Koroškem
00050000-5612-6d62-d837-169e6669c6c9	9246	Razkrižje
00050000-5612-6d62-3067-68a4e345d735	3332	Rečica ob Savinji
00050000-5612-6d62-c7cb-3c42b520c01e	5292	Renče
00050000-5612-6d62-a302-740e0ae338f1	1310	Ribnica
00050000-5612-6d62-c7a0-85872bc74249	2364	Ribnica na Pohorju
00050000-5612-6d62-9986-227064ef04ae	3272	Rimske Toplice
00050000-5612-6d62-bbd6-d2e2badaedca	1314	Rob
00050000-5612-6d62-d319-31556437406b	5215	Ročinj
00050000-5612-6d62-2580-9146be35e943	3250	Rogaška Slatina
00050000-5612-6d62-6f92-babb0f8dcac2	9262	Rogašovci
00050000-5612-6d62-09f6-f1f95faa90f7	3252	Rogatec
00050000-5612-6d62-7e71-181041e5586b	1373	Rovte
00050000-5612-6d62-175a-7872ffd137f1	2342	Ruše
00050000-5612-6d62-3439-8220ef563814	1282	Sava
00050000-5612-6d62-8569-9ed079bb018d	6333	Sečovlje/Sicciole
00050000-5612-6d62-5a07-ee4edeb2e98c	4227	Selca
00050000-5612-6d62-f1b5-69bbf51329c7	2352	Selnica ob Dravi
00050000-5612-6d62-58c7-8becb1aa0852	8333	Semič
00050000-5612-6d62-a18b-5c46cf6f5bf8	8281	Senovo
00050000-5612-6d62-2847-923d97367367	6224	Senožeče
00050000-5612-6d62-338b-79937c2dddcd	8290	Sevnica
00050000-5612-6d62-ff6b-39435c3d8d7c	6210	Sežana
00050000-5612-6d62-2904-84865742ed02	2214	Sladki Vrh
00050000-5612-6d62-5cff-1f062bd008b3	5283	Slap ob Idrijci
00050000-5612-6d62-18b6-dcecf971802c	2380	Slovenj Gradec
00050000-5612-6d62-bdaf-635038b03991	2310	Slovenska Bistrica
00050000-5612-6d62-be94-9cda63276b81	3210	Slovenske Konjice
00050000-5612-6d62-44cd-45fa3f6bff87	1216	Smlednik
00050000-5612-6d62-01a2-bacd329fc439	5232	Soča
00050000-5612-6d62-1da1-5fc26b4530ce	1317	Sodražica
00050000-5612-6d62-c9a0-54b5c7ba1994	3335	Solčava
00050000-5612-6d62-e2ba-d0564900a2af	5250	Solkan
00050000-5612-6d62-c579-05c2df6db1e6	4229	Sorica
00050000-5612-6d62-d459-857c259adb4c	4225	Sovodenj
00050000-5612-6d62-ec16-21a5e9546edd	5281	Spodnja Idrija
00050000-5612-6d62-674a-e26218caee5c	2241	Spodnji Duplek
00050000-5612-6d62-23ea-2e1b97f486f2	9245	Spodnji Ivanjci
00050000-5612-6d62-12bf-ca35c1636188	2277	Središče ob Dravi
00050000-5612-6d62-239c-b64d45c5b8a0	4267	Srednja vas v Bohinju
00050000-5612-6d62-a242-49b688d20989	8256	Sromlje 
00050000-5612-6d62-fa35-ecb5be2c96ae	5224	Srpenica
00050000-5612-6d62-bf95-939dfcfd7f1b	1242	Stahovica
00050000-5612-6d62-07e3-e9708932e04e	1332	Stara Cerkev
00050000-5612-6d62-fecd-4a1e3b4fefdc	8342	Stari trg ob Kolpi
00050000-5612-6d62-4d73-c1a5515f0e39	1386	Stari trg pri Ložu
00050000-5612-6d62-ef42-3325190e5db5	2205	Starše
00050000-5612-6d62-c5a9-989e46226a6e	2289	Stoperce
00050000-5612-6d62-62f6-efec8713b058	8322	Stopiče
00050000-5612-6d62-1795-ce9d356ef454	3206	Stranice
00050000-5612-6d62-4e91-a72d05d0f206	8351	Straža
00050000-5612-6d62-ce8a-1726afbe9f21	1313	Struge
00050000-5612-6d62-827e-f319fc5afaaf	8293	Studenec
00050000-5612-6d62-7a0b-c98bfea070f6	8331	Suhor
00050000-5612-6d62-d4c7-ed71862199d9	2233	Sv. Ana v Slovenskih goricah
00050000-5612-6d62-3b4c-d2870869671a	2235	Sv. Trojica v Slovenskih goricah
00050000-5612-6d62-0a40-f3fed448f883	2353	Sveti Duh na Ostrem Vrhu
00050000-5612-6d62-a4fd-5248ce635a46	9244	Sveti Jurij ob Ščavnici
00050000-5612-6d62-ae6c-ca43638f92f1	3264	Sveti Štefan
00050000-5612-6d62-9d75-81185276640c	2258	Sveti Tomaž
00050000-5612-6d62-6459-01f06a515456	9204	Šalovci
00050000-5612-6d62-eab2-578a34f92821	5261	Šempas
00050000-5612-6d62-fddf-8deb85e49a3b	5290	Šempeter pri Gorici
00050000-5612-6d62-e958-26a8006647f5	3311	Šempeter v Savinjski dolini
00050000-5612-6d62-d027-1e44cb9ad7e1	4208	Šenčur
00050000-5612-6d62-5b2e-b293c8337a0d	2212	Šentilj v Slovenskih goricah
00050000-5612-6d62-cecb-b25838952fd1	8297	Šentjanž
00050000-5612-6d62-68c3-1ba25c1a5ad7	2373	Šentjanž pri Dravogradu
00050000-5612-6d62-06e4-14bbe2147bef	8310	Šentjernej
00050000-5612-6d62-4c61-7b9036c2a0b4	3230	Šentjur
00050000-5612-6d62-44b3-58594ca7563d	3271	Šentrupert
00050000-5612-6d62-0a0d-69c628f3d9e3	8232	Šentrupert
00050000-5612-6d62-68c3-4da2c40f5c36	1296	Šentvid pri Stični
00050000-5612-6d62-6e41-dd48e2d54091	8275	Škocjan
00050000-5612-6d62-fa69-2d90a2845295	6281	Škofije
00050000-5612-6d62-c6a1-8eb741e9db60	4220	Škofja Loka
00050000-5612-6d62-b73d-afe35f208c4b	3211	Škofja vas
00050000-5612-6d62-693e-59fa5938ab16	1291	Škofljica
00050000-5612-6d62-2114-123a874b01a5	6274	Šmarje
00050000-5612-6d62-5d15-9e1fc4584f12	1293	Šmarje - Sap
00050000-5612-6d62-5af8-8aaf38948d8a	3240	Šmarje pri Jelšah
00050000-5612-6d62-c659-c20df85b17aa	8220	Šmarješke Toplice
00050000-5612-6d62-dc1d-c45157ec49ff	2315	Šmartno na Pohorju
00050000-5612-6d62-408c-91b924a6c367	3341	Šmartno ob Dreti
00050000-5612-6d62-9dce-bf7641f05ebb	3327	Šmartno ob Paki
00050000-5612-6d62-3565-89f96df59fe7	1275	Šmartno pri Litiji
00050000-5612-6d62-f7a7-eb1448782303	2383	Šmartno pri Slovenj Gradcu
00050000-5612-6d62-a146-c1576a890637	3201	Šmartno v Rožni dolini
00050000-5612-6d62-27ee-71fd86030dca	3325	Šoštanj
00050000-5612-6d62-cf65-d70eaa1a4157	6222	Štanjel
00050000-5612-6d62-dd9a-dfd2313b3be1	3220	Štore
00050000-5612-6d62-07f2-59a8eca9f4ba	3304	Tabor
00050000-5612-6d62-979f-26ff0474a911	3221	Teharje
00050000-5612-6d62-40aa-d5839563b678	9251	Tišina
00050000-5612-6d62-8bba-8d5da4c4e05f	5220	Tolmin
00050000-5612-6d62-827d-49c00db364e5	3326	Topolšica
00050000-5612-6d62-5871-bfc9cada9a23	2371	Trbonje
00050000-5612-6d62-3d93-a6e2b0259070	1420	Trbovlje
00050000-5612-6d62-cf97-b7226e2808c6	8231	Trebelno 
00050000-5612-6d62-1ed5-7b251a229967	8210	Trebnje
00050000-5612-6d62-2149-2b58372f4d8d	5252	Trnovo pri Gorici
00050000-5612-6d62-e077-bf536057da97	2254	Trnovska vas
00050000-5612-6d62-a640-d0bd1b0aef05	1222	Trojane
00050000-5612-6d62-c740-280a45a7fe74	1236	Trzin
00050000-5612-6d62-536b-151f53899220	4290	Tržič
00050000-5612-6d62-74c7-c3ed7ad42216	8295	Tržišče
00050000-5612-6d62-7dce-85a94f444db4	1311	Turjak
00050000-5612-6d62-f561-66ba44a77fef	9224	Turnišče
00050000-5612-6d62-9255-01e7fabe0415	8323	Uršna sela
00050000-5612-6d62-9809-a7e860560bf7	1252	Vače
00050000-5612-6d62-0e5b-f8888b442ce1	3320	Velenje 
00050000-5612-6d62-df72-f8512700fb52	3322	Velenje - poštni predali
00050000-5612-6d62-5219-0182cbb906ec	8212	Velika Loka
00050000-5612-6d62-fac2-9ef46312caf3	2274	Velika Nedelja
00050000-5612-6d62-57b3-15a6baade4be	9225	Velika Polana
00050000-5612-6d62-cf9c-1b7bb776d4d9	1315	Velike Lašče
00050000-5612-6d62-e3c0-5131c3e97ba1	8213	Veliki Gaber
00050000-5612-6d62-4db7-30ad759e2b8f	9241	Veržej
00050000-5612-6d62-a4d0-819319cb97d4	1312	Videm - Dobrepolje
00050000-5612-6d62-21fd-9e30069666ec	2284	Videm pri Ptuju
00050000-5612-6d62-4d94-8d10fa554ff9	8344	Vinica
00050000-5612-6d62-4808-98ed54a35428	5271	Vipava
00050000-5612-6d62-a9a3-964c8a9d8634	4212	Visoko
00050000-5612-6d62-e878-67a8369e8517	1294	Višnja Gora
00050000-5612-6d62-8ae3-f5a754e49802	3205	Vitanje
00050000-5612-6d62-50bb-1a487e91fb0a	2255	Vitomarci
00050000-5612-6d62-55ad-54f83d659380	1217	Vodice
00050000-5612-6d62-b4b0-9ff18b251c28	3212	Vojnik\t
00050000-5612-6d62-e26a-dc440e751616	5293	Volčja Draga
00050000-5612-6d62-693b-0123482073e5	2232	Voličina
00050000-5612-6d62-5ca6-9571d0626d29	3305	Vransko
00050000-5612-6d62-602c-8898f9dc4283	6217	Vremski Britof
00050000-5612-6d62-bef3-9e656b98720e	1360	Vrhnika
00050000-5612-6d62-4066-1185ff645541	2365	Vuhred
00050000-5612-6d62-b3bd-a9f5435c239c	2367	Vuzenica
00050000-5612-6d62-a734-c644a5a185f6	8292	Zabukovje 
00050000-5612-6d62-45d2-9d27398f0327	1410	Zagorje ob Savi
00050000-5612-6d62-c7f0-01c0b48c0fb0	1303	Zagradec
00050000-5612-6d62-a4fb-ffe5048ae509	2283	Zavrč
00050000-5612-6d62-f8ea-d2978c4e2d21	8272	Zdole 
00050000-5612-6d62-b37b-2f4d81265dd1	4201	Zgornja Besnica
00050000-5612-6d62-a62e-6e4a5485ea50	2242	Zgornja Korena
00050000-5612-6d62-9560-cbc546e216fe	2201	Zgornja Kungota
00050000-5612-6d62-df40-afb486095c62	2316	Zgornja Ložnica
00050000-5612-6d62-6b2a-1f95fa7dc0b3	2314	Zgornja Polskava
00050000-5612-6d62-abf9-077cff676a5b	2213	Zgornja Velka
00050000-5612-6d62-9b69-59de2e3de5d5	4247	Zgornje Gorje
00050000-5612-6d62-75b5-b92b38bec3d8	4206	Zgornje Jezersko
00050000-5612-6d62-2d56-ff704a9d3e9e	2285	Zgornji Leskovec
00050000-5612-6d62-5047-d40a9fef1dbf	1432	Zidani Most
00050000-5612-6d62-f524-221eee02cd03	3214	Zreče
00050000-5612-6d62-1f38-d9594dad2f5c	4209	Žabnica
00050000-5612-6d62-a835-9a761d5e47fb	3310	Žalec
00050000-5612-6d62-b8c7-1a7a8cd5482c	4228	Železniki
00050000-5612-6d62-52cf-8013d660071f	2287	Žetale
00050000-5612-6d62-76d8-868c6aeaa20a	4226	Žiri
00050000-5612-6d62-7d6d-0fdf56d83828	4274	Žirovnica
00050000-5612-6d62-3af6-58c7d47e9055	8360	Žužemberk
\.


--
-- TOC entry 3030 (class 0 OID 21288473)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21288093)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21287873)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5612-6d64-8891-cb8794a3b225	00080000-5612-6d64-8ab7-6f0a0837b011	\N	00040000-5612-6d63-861e-787863514221	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5612-6d64-84f5-446fa789e457	00080000-5612-6d64-8ab7-6f0a0837b011	\N	00040000-5612-6d63-861e-787863514221	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5612-6d64-87de-5517059439e4	00080000-5612-6d64-c7dc-6ce069c996c8	\N	00040000-5612-6d63-861e-787863514221	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2992 (class 0 OID 21287977)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21288105)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21288487)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21288497)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5612-6d64-b934-191d8b13291a	00080000-5612-6d64-ba99-8f15405e62c2	0987	AK
00190000-5612-6d64-1cf8-5c944ef97e65	00080000-5612-6d64-c7dc-6ce069c996c8	0989	AK
00190000-5612-6d64-c6f0-c791c2a3236a	00080000-5612-6d64-9d94-5fc04f5658b6	0986	AK
00190000-5612-6d64-9df0-db0048d3e24d	00080000-5612-6d64-a548-132c797b224f	0984	AK
00190000-5612-6d64-978d-8b8d6f3582c4	00080000-5612-6d64-6dce-1c69fe2bc303	0983	AK
00190000-5612-6d64-d0ac-1fd8a500abbe	00080000-5612-6d64-add6-2c2a9f71a4f3	0982	AK
00190000-5612-6d66-c3d3-1229f35002cc	00080000-5612-6d66-89f7-87d27670d28e	1001	AK
\.


--
-- TOC entry 3029 (class 0 OID 21288430)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5612-6d65-6cde-446c695a56e7	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3033 (class 0 OID 21288505)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21288134)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5612-6d64-bd1f-d45670eb7d2e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5612-6d64-f644-09ee5f611b32	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5612-6d64-9868-621026de70d5	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5612-6d64-4820-b016723216ab	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5612-6d64-6b64-1440b0d71dcb	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5612-6d64-b427-bd3497607dae	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5612-6d64-1e96-799c3644f667	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3001 (class 0 OID 21288078)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21288068)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21288278)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21288208)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 21287951)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 21287746)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5612-6d66-89f7-87d27670d28e	00010000-5612-6d63-2995-b554d3bdcc10	2015-10-05 14:30:30	INS	a:0:{}
2	App\\Entity\\Option	00000000-5612-6d66-0fd0-35bdfbd0352b	00010000-5612-6d63-2995-b554d3bdcc10	2015-10-05 14:30:30	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5612-6d66-c3d3-1229f35002cc	00010000-5612-6d63-2995-b554d3bdcc10	2015-10-05 14:30:30	INS	a:0:{}
\.


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3010 (class 0 OID 21288147)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 21287784)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5612-6d63-b422-7c6f3da3834a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5612-6d63-9ba5-f803ed4efce4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5612-6d63-ec01-59b2e03ec4c9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5612-6d63-3da6-289c292b985c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5612-6d63-0571-49bdd0aaf5ad	planer	Planer dogodkov v koledarju	t
00020000-5612-6d63-0a92-9a9177063726	kadrovska	Kadrovska služba	t
00020000-5612-6d63-bfc4-a7196c049a21	arhivar	Ažuriranje arhivalij	t
00020000-5612-6d63-8f24-d1dd0c2505b2	igralec	Igralec	t
00020000-5612-6d63-079b-14e8f4d7e00f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5612-6d64-68b9-28b08b60007d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2975 (class 0 OID 21287768)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5612-6d63-bfe3-906795c58c24	00020000-5612-6d63-ec01-59b2e03ec4c9
00010000-5612-6d63-2995-b554d3bdcc10	00020000-5612-6d63-ec01-59b2e03ec4c9
00010000-5612-6d64-c6e8-896c3cd83ced	00020000-5612-6d64-68b9-28b08b60007d
\.


--
-- TOC entry 3012 (class 0 OID 21288161)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21288099)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21288045)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21287733)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5612-6d62-ae59-4bfa00d1b779	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5612-6d62-6f26-6f41b9c805b2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5612-6d62-e4a3-9276f1af632e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5612-6d62-4131-9b2df8988007	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5612-6d62-805b-4b127204f95b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2970 (class 0 OID 21287725)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5612-6d62-12e8-25df575cc452	00230000-5612-6d62-4131-9b2df8988007	popa
00240000-5612-6d62-136a-176c4b40fb36	00230000-5612-6d62-4131-9b2df8988007	oseba
00240000-5612-6d62-f959-1030ce87633d	00230000-5612-6d62-4131-9b2df8988007	sezona
00240000-5612-6d62-a416-286df254b2c1	00230000-5612-6d62-6f26-6f41b9c805b2	prostor
00240000-5612-6d62-cc86-7c8f1bb1290d	00230000-5612-6d62-4131-9b2df8988007	besedilo
00240000-5612-6d62-0916-e20bd4efb4b7	00230000-5612-6d62-4131-9b2df8988007	uprizoritev
00240000-5612-6d62-ac8f-91537e4c65f7	00230000-5612-6d62-4131-9b2df8988007	funkcija
00240000-5612-6d62-a90c-495d6ed08290	00230000-5612-6d62-4131-9b2df8988007	tipfunkcije
00240000-5612-6d62-3daf-fb04dc5b907c	00230000-5612-6d62-4131-9b2df8988007	alternacija
00240000-5612-6d62-7fe1-e95bc7b33545	00230000-5612-6d62-ae59-4bfa00d1b779	pogodba
00240000-5612-6d62-b9e7-6fedf6dd8b04	00230000-5612-6d62-4131-9b2df8988007	zaposlitev
00240000-5612-6d62-9c24-6cf968170214	00230000-5612-6d62-4131-9b2df8988007	zvrstuprizoritve
00240000-5612-6d62-7998-d011f9757740	00230000-5612-6d62-ae59-4bfa00d1b779	programdela
00240000-5612-6d62-18ab-760f6b5c5ec3	00230000-5612-6d62-4131-9b2df8988007	zapis
\.


--
-- TOC entry 2969 (class 0 OID 21287720)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b51f367b-193b-4f94-b4c2-5daefd2fb2f9	00240000-5612-6d62-12e8-25df575cc452	0	1001
\.


--
-- TOC entry 3018 (class 0 OID 21288225)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5612-6d65-cfbd-bd9645deb5c4	000e0000-5612-6d65-1256-e4e32ba27109	00080000-5612-6d64-8ab7-6f0a0837b011	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5612-6d63-ef0d-e7a5b0e2a703
00270000-5612-6d65-99da-23dbeeca86a7	000e0000-5612-6d65-1256-e4e32ba27109	00080000-5612-6d64-8ab7-6f0a0837b011	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5612-6d63-ef0d-e7a5b0e2a703
\.


--
-- TOC entry 2982 (class 0 OID 21287846)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21288055)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5612-6d65-23a4-ce7a21f622f2	00180000-5612-6d65-676b-1489e3c4c142	000c0000-5612-6d65-06f0-d919a9134ff8	00090000-5612-6d64-97c9-5ae89e577acf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-6d65-b64c-d2e2e386ebe1	00180000-5612-6d65-676b-1489e3c4c142	000c0000-5612-6d65-8f84-3d30b8fd0105	00090000-5612-6d64-ab72-59e684dd80e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-6d65-e7f9-537147842cf8	00180000-5612-6d65-676b-1489e3c4c142	000c0000-5612-6d65-e73e-1ca2a90e91d3	00090000-5612-6d64-726b-de6f6b89acac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-6d65-cb06-ca3bcbe51a40	00180000-5612-6d65-676b-1489e3c4c142	000c0000-5612-6d65-9862-849d2bf73c5f	00090000-5612-6d64-4f3b-3e2e47e35016	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-6d65-0f16-8c87a1cc4fae	00180000-5612-6d65-676b-1489e3c4c142	000c0000-5612-6d65-7ecf-badf36b1ec3a	00090000-5612-6d64-4974-45864ddd2bd4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-6d65-9ff5-189fb4b6ad63	00180000-5612-6d65-25b5-a7b0ced984ec	\N	00090000-5612-6d64-4974-45864ddd2bd4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3021 (class 0 OID 21288266)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5612-6d62-cbb8-d2d865dd4684	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5612-6d62-b91f-96d83a9857c6	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5612-6d62-abe5-717089f9c9c9	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5612-6d62-1b44-eb6f070c508a	04	Režija	Režija	Režija	umetnik	30
000f0000-5612-6d62-6178-8e5d57cec4db	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5612-6d62-da60-280f4120b864	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5612-6d62-c186-329fb3a90aed	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5612-6d62-058d-4f4872dd079b	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5612-6d62-c8b9-1fc442ce7a36	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5612-6d62-19ce-dd745963c360	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5612-6d62-c218-fb227c960e5f	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5612-6d62-5401-b0183effcc76	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5612-6d62-0745-389715babd7c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5612-6d62-abde-d1b14a85a978	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5612-6d62-6fec-76bfc02cbd65	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5612-6d62-7a03-7a6a6317239f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5612-6d62-04ea-c6fea43a9537	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5612-6d62-2404-168855d9af2c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3034 (class 0 OID 21288516)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5612-6d62-3582-4f894423e6d1	01	Velika predstava	f	1.00	1.00
002b0000-5612-6d62-0162-0937138a4187	02	Mala predstava	f	0.50	0.50
002b0000-5612-6d62-4817-50824a702d08	03	Mala koprodukcija	t	0.40	1.00
002b0000-5612-6d62-ef15-4bcee17a7752	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5612-6d62-b9d4-de0d845ddda9	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2987 (class 0 OID 21287908)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 21287755)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5612-6d63-2995-b554d3bdcc10	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROir14zrVp7G.X2YbRynd/Du8dN35bcG2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5612-6d64-c11e-e7c68e351c92	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5612-6d64-b110-5fe779ab3413	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5612-6d64-6c2f-c7247c6f6ac4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5612-6d64-1f86-f3fea57ef43d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5612-6d64-489f-25966eaf1901	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5612-6d64-9f40-94562cc23a81	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5612-6d64-c348-cd37ff220e90	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5612-6d64-3e0a-bdb92d6d87d8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5612-6d64-7184-93dc0077c0d5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5612-6d64-c6e8-896c3cd83ced	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5612-6d63-bfe3-906795c58c24	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3025 (class 0 OID 21288316)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5612-6d65-6edd-9074883cbe9f	00160000-5612-6d64-6a7d-e88f3aba3abb	\N	00140000-5612-6d62-e4fa-9267ae6cfb4f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5612-6d64-6b64-1440b0d71dcb
000e0000-5612-6d65-1256-e4e32ba27109	00160000-5612-6d64-d38e-74fc3529fc59	\N	00140000-5612-6d62-3104-044393ef8a36	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5612-6d64-b427-bd3497607dae
000e0000-5612-6d65-73b6-99ca2270a83c	\N	\N	00140000-5612-6d62-3104-044393ef8a36	00190000-5612-6d64-b934-191d8b13291a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5612-6d64-6b64-1440b0d71dcb
000e0000-5612-6d65-53b9-68159ecc7737	\N	\N	00140000-5612-6d62-3104-044393ef8a36	00190000-5612-6d64-b934-191d8b13291a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5612-6d64-6b64-1440b0d71dcb
000e0000-5612-6d65-96b2-e329d7e61d95	\N	\N	00140000-5612-6d62-3104-044393ef8a36	00190000-5612-6d64-b934-191d8b13291a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5612-6d64-bd1f-d45670eb7d2e
000e0000-5612-6d65-b7ed-2a18d3add48a	\N	\N	00140000-5612-6d62-3104-044393ef8a36	00190000-5612-6d64-b934-191d8b13291a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5612-6d64-bd1f-d45670eb7d2e
\.


--
-- TOC entry 2994 (class 0 OID 21287999)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5612-6d65-0100-0c455bc00ea9	000e0000-5612-6d65-1256-e4e32ba27109	\N	1	
00200000-5612-6d65-077d-40eedff940f3	000e0000-5612-6d65-1256-e4e32ba27109	\N	2	
00200000-5612-6d65-371a-31cfd885d7d3	000e0000-5612-6d65-1256-e4e32ba27109	\N	3	
00200000-5612-6d65-63b3-6526b8c71fb4	000e0000-5612-6d65-1256-e4e32ba27109	\N	4	
00200000-5612-6d65-3c09-b64d5a840cb4	000e0000-5612-6d65-1256-e4e32ba27109	\N	5	
\.


--
-- TOC entry 3008 (class 0 OID 21288126)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21288239)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5612-6d63-5f80-765178086f5d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5612-6d63-ec2e-ae747adbd102	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5612-6d63-af0c-851a5624b61d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5612-6d63-03df-ce7e35891b28	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5612-6d63-dc4a-130390635ebf	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5612-6d63-a65b-927dda46d9d7	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5612-6d63-b9e2-c3109f438b50	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5612-6d63-0424-4614110cd67b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5612-6d63-ef0d-e7a5b0e2a703	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5612-6d63-0db2-4818c6540949	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5612-6d63-b20d-a58db2cf656c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5612-6d63-448a-f668d3e63993	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5612-6d63-d722-155d9568e4cf	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5612-6d63-8b54-eba87f1385df	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5612-6d63-0f54-06eff657476c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5612-6d63-4d79-a22091974b91	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5612-6d63-38d2-c74ce367f89c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5612-6d63-1744-2ec031544ae5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5612-6d63-5d9a-fbe83f936e69	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5612-6d63-ed2c-ed3565b3d025	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5612-6d63-8959-a0956671845d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5612-6d63-5a1e-d49ab3d911ba	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5612-6d63-5f97-7bb775f89966	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5612-6d63-0123-5b1573aaa0bc	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5612-6d63-6845-f99c1b8e738f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5612-6d63-cc2f-3722b7e93eb2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5612-6d63-7eb2-b9d92dcc613f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5612-6d63-8976-30c7c569a291	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3037 (class 0 OID 21288563)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21288535)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21288575)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21288198)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5612-6d65-a881-7d0454985c8f	00090000-5612-6d64-ab72-59e684dd80e6	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-6d65-3493-75f375ba693f	00090000-5612-6d64-726b-de6f6b89acac	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-6d65-b7ad-c67877d4ba5c	00090000-5612-6d64-fe41-861a5664ef1b	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-6d65-ccfb-9516fe69b2b4	00090000-5612-6d64-405a-d086f4376d45	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-6d65-a1ee-951a59f02699	00090000-5612-6d64-97c9-5ae89e577acf	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-6d65-a5d9-c3ca4760ea4b	00090000-5612-6d64-126c-37c2acf0868b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2996 (class 0 OID 21288034)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21288306)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5612-6d62-e4fa-9267ae6cfb4f	01	Drama	drama (SURS 01)
00140000-5612-6d62-64d7-bae4f1f3988e	02	Opera	opera (SURS 02)
00140000-5612-6d62-47d7-ba73b41e40e9	03	Balet	balet (SURS 03)
00140000-5612-6d62-7156-b2ce5b3ca78c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5612-6d62-6266-694d09d89197	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5612-6d62-3104-044393ef8a36	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5612-6d62-7eb9-55cfc02a8b5a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3014 (class 0 OID 21288188)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2501 (class 2606 OID 21287809)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 21288365)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 21288355)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21288222)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 21288264)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21288615)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 21288023)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21288044)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 21288533)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21287934)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 21288424)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 21288184)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21287997)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 21287972)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21287948)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 21288091)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 21288592)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21288599)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2755 (class 2606 OID 21288623)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2613 (class 2606 OID 21288118)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 21287906)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21287818)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 21287842)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21287798)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2492 (class 2606 OID 21287783)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21288124)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 21288160)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 21288301)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 21287870)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 21287894)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 21288485)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21288097)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21287884)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21287985)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 21288109)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21288494)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 21288502)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 21288472)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21288514)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 21288142)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21288082)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 21288073)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 21288288)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21288215)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 21287960)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21287754)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21288151)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21287772)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2494 (class 2606 OID 21287792)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21288169)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 21288104)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 21288053)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 21287742)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 21287730)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 21287724)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21288235)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21287851)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 21288064)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 21288275)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 21288526)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21287919)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 21287767)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21288334)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21288007)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 21288132)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21288247)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 21288573)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 21288557)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 21288581)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 21288206)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21288038)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21288314)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21288196)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 21288032)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2566 (class 1259 OID 21288033)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2567 (class 1259 OID 21288031)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2568 (class 1259 OID 21288030)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2569 (class 1259 OID 21288029)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2655 (class 1259 OID 21288236)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2656 (class 1259 OID 21288237)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2657 (class 1259 OID 21288238)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 21288594)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2742 (class 1259 OID 21288593)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2515 (class 1259 OID 21287872)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 21288125)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2728 (class 1259 OID 21288561)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2729 (class 1259 OID 21288560)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2730 (class 1259 OID 21288562)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2731 (class 1259 OID 21288559)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2732 (class 1259 OID 21288558)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 21288111)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 21288110)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 21288008)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2638 (class 1259 OID 21288185)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 21288187)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2640 (class 1259 OID 21288186)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2540 (class 1259 OID 21287950)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2541 (class 1259 OID 21287949)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2719 (class 1259 OID 21288515)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2671 (class 1259 OID 21288303)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 21288304)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 21288305)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2738 (class 1259 OID 21288582)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2680 (class 1259 OID 21288339)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2681 (class 1259 OID 21288336)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2682 (class 1259 OID 21288340)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2683 (class 1259 OID 21288338)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2684 (class 1259 OID 21288337)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2530 (class 1259 OID 21287921)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 21287920)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2506 (class 1259 OID 21287845)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2626 (class 1259 OID 21288152)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2496 (class 1259 OID 21287799)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2497 (class 1259 OID 21287800)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2631 (class 1259 OID 21288172)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2632 (class 1259 OID 21288171)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2633 (class 1259 OID 21288170)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2553 (class 1259 OID 21287986)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 21287987)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2476 (class 1259 OID 21287732)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 21288077)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 21288075)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 21288074)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 21288076)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2487 (class 1259 OID 21287773)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2488 (class 1259 OID 21287774)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 21288133)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2751 (class 1259 OID 21288616)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2653 (class 1259 OID 21288224)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 21288223)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2752 (class 1259 OID 21288624)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 21288625)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 21288098)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2647 (class 1259 OID 21288216)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2648 (class 1259 OID 21288217)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2701 (class 1259 OID 21288429)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2702 (class 1259 OID 21288428)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2703 (class 1259 OID 21288425)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2704 (class 1259 OID 21288426)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2705 (class 1259 OID 21288427)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2519 (class 1259 OID 21287886)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 21287885)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2521 (class 1259 OID 21287887)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2620 (class 1259 OID 21288146)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 21288145)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 21288495)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2712 (class 1259 OID 21288496)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2694 (class 1259 OID 21288369)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2695 (class 1259 OID 21288370)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2696 (class 1259 OID 21288367)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2697 (class 1259 OID 21288368)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2644 (class 1259 OID 21288207)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 21288086)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 21288085)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 21288083)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 21288084)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2690 (class 1259 OID 21288357)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2691 (class 1259 OID 21288356)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 21287961)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2547 (class 1259 OID 21287975)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2548 (class 1259 OID 21287974)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2549 (class 1259 OID 21287973)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2550 (class 1259 OID 21287976)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2559 (class 1259 OID 21287998)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2708 (class 1259 OID 21288486)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2727 (class 1259 OID 21288534)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2745 (class 1259 OID 21288600)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2746 (class 1259 OID 21288601)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2502 (class 1259 OID 21287820)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21287819)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2511 (class 1259 OID 21287852)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 21287853)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2575 (class 1259 OID 21288039)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2583 (class 1259 OID 21288067)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 21288066)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 21288065)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2570 (class 1259 OID 21288025)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2571 (class 1259 OID 21288026)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2572 (class 1259 OID 21288024)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2573 (class 1259 OID 21288028)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2574 (class 1259 OID 21288027)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2518 (class 1259 OID 21287871)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 21287935)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21287937)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2538 (class 1259 OID 21287936)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2539 (class 1259 OID 21287938)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 21288092)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2676 (class 1259 OID 21288302)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 21288335)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 21288276)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 21288277)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2509 (class 1259 OID 21287843)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21287844)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2641 (class 1259 OID 21288197)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 21287743)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 21287907)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2479 (class 1259 OID 21287731)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2724 (class 1259 OID 21288527)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 21288144)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2625 (class 1259 OID 21288143)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2698 (class 1259 OID 21288366)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 21287895)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 21288315)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 21288574)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2717 (class 1259 OID 21288503)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2718 (class 1259 OID 21288504)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 21288265)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2582 (class 1259 OID 21288054)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 21287793)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2782 (class 2606 OID 21288756)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 21288761)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2787 (class 2606 OID 21288781)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2781 (class 2606 OID 21288751)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2785 (class 2606 OID 21288771)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2786 (class 2606 OID 21288776)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2784 (class 2606 OID 21288766)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 21288946)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2821 (class 2606 OID 21288951)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2822 (class 2606 OID 21288956)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2855 (class 2606 OID 21289121)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2854 (class 2606 OID 21289116)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 21288681)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21288866)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2851 (class 2606 OID 21289101)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2850 (class 2606 OID 21289096)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2852 (class 2606 OID 21289106)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 21289091)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2848 (class 2606 OID 21289086)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2803 (class 2606 OID 21288861)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2802 (class 2606 OID 21288856)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2780 (class 2606 OID 21288746)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21288906)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2814 (class 2606 OID 21288916)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2813 (class 2606 OID 21288911)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2774 (class 2606 OID 21288716)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2773 (class 2606 OID 21288711)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 21288846)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 21289076)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 21288961)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 21288966)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 21288971)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2853 (class 2606 OID 21289111)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2829 (class 2606 OID 21288991)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2826 (class 2606 OID 21288976)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2830 (class 2606 OID 21288996)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2828 (class 2606 OID 21288986)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 21288981)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2772 (class 2606 OID 21288706)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 21288701)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 21288666)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2763 (class 2606 OID 21288661)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2808 (class 2606 OID 21288886)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2759 (class 2606 OID 21288641)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2760 (class 2606 OID 21288646)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2811 (class 2606 OID 21288901)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2810 (class 2606 OID 21288896)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 21288891)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2777 (class 2606 OID 21288731)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 21288736)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2756 (class 2606 OID 21288626)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2795 (class 2606 OID 21288821)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2793 (class 2606 OID 21288811)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2792 (class 2606 OID 21288806)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2794 (class 2606 OID 21288816)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2757 (class 2606 OID 21288631)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 21288636)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2805 (class 2606 OID 21288871)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2858 (class 2606 OID 21289136)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2819 (class 2606 OID 21288941)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 21288936)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2859 (class 2606 OID 21289141)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2860 (class 2606 OID 21289146)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2801 (class 2606 OID 21288851)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2816 (class 2606 OID 21288926)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2817 (class 2606 OID 21288931)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21289051)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 21289046)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 21289031)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21289036)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2839 (class 2606 OID 21289041)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2769 (class 2606 OID 21288691)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 21288686)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 21288696)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 21288881)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2806 (class 2606 OID 21288876)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 21289061)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2844 (class 2606 OID 21289066)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2835 (class 2606 OID 21289021)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2836 (class 2606 OID 21289026)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2833 (class 2606 OID 21289011)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2834 (class 2606 OID 21289016)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2815 (class 2606 OID 21288921)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 21288841)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2798 (class 2606 OID 21288836)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2796 (class 2606 OID 21288826)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2797 (class 2606 OID 21288831)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 21289006)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 21289001)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 21288721)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2776 (class 2606 OID 21288726)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 21288741)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21289056)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2845 (class 2606 OID 21289071)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 21289081)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2856 (class 2606 OID 21289126)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2857 (class 2606 OID 21289131)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2762 (class 2606 OID 21288656)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2761 (class 2606 OID 21288651)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2765 (class 2606 OID 21288671)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 21288676)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 21288786)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 21288801)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 21288796)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 21288791)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-05 14:30:31 CEST

--
-- PostgreSQL database dump complete
--

