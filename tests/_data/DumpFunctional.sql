--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-25 12:19:09 CEST

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
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20644027)
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
-- TOC entry 229 (class 1259 OID 20644584)
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
-- TOC entry 228 (class 1259 OID 20644567)
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
-- TOC entry 219 (class 1259 OID 20644444)
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
-- TOC entry 222 (class 1259 OID 20644474)
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
-- TOC entry 243 (class 1259 OID 20644824)
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
-- TOC entry 197 (class 1259 OID 20644234)
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
-- TOC entry 199 (class 1259 OID 20644266)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20644750)
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
-- TOC entry 190 (class 1259 OID 20644148)
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
-- TOC entry 230 (class 1259 OID 20644597)
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
-- TOC entry 215 (class 1259 OID 20644399)
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
-- TOC entry 195 (class 1259 OID 20644213)
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
-- TOC entry 193 (class 1259 OID 20644188)
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
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20644165)
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
-- TOC entry 204 (class 1259 OID 20644313)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20644805)
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
-- TOC entry 242 (class 1259 OID 20644817)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20644839)
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
-- TOC entry 208 (class 1259 OID 20644338)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20644122)
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
-- TOC entry 182 (class 1259 OID 20644036)
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
-- TOC entry 183 (class 1259 OID 20644047)
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
-- TOC entry 178 (class 1259 OID 20644001)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20644020)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20644345)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20644379)
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
-- TOC entry 225 (class 1259 OID 20644515)
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
-- TOC entry 185 (class 1259 OID 20644080)
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
-- TOC entry 187 (class 1259 OID 20644114)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20644695)
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
-- TOC entry 205 (class 1259 OID 20644319)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20644099)
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
-- TOC entry 194 (class 1259 OID 20644203)
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
-- TOC entry 207 (class 1259 OID 20644331)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20644709)
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
-- TOC entry 234 (class 1259 OID 20644719)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20644652)
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
-- TOC entry 235 (class 1259 OID 20644727)
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
-- TOC entry 211 (class 1259 OID 20644360)
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
-- TOC entry 203 (class 1259 OID 20644304)
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
-- TOC entry 202 (class 1259 OID 20644294)
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
-- TOC entry 224 (class 1259 OID 20644504)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20644434)
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
-- TOC entry 192 (class 1259 OID 20644177)
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
-- TOC entry 175 (class 1259 OID 20643972)
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
-- TOC entry 174 (class 1259 OID 20643970)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20644373)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20644010)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20643994)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20644387)
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
-- TOC entry 206 (class 1259 OID 20644325)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20644271)
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
-- TOC entry 173 (class 1259 OID 20643959)
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
-- TOC entry 172 (class 1259 OID 20643951)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20643946)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20644451)
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
-- TOC entry 184 (class 1259 OID 20644072)
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
-- TOC entry 201 (class 1259 OID 20644281)
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
-- TOC entry 223 (class 1259 OID 20644492)
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
-- TOC entry 236 (class 1259 OID 20644738)
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
-- TOC entry 189 (class 1259 OID 20644134)
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
-- TOC entry 176 (class 1259 OID 20643981)
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
-- TOC entry 227 (class 1259 OID 20644542)
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
-- TOC entry 196 (class 1259 OID 20644224)
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
-- TOC entry 210 (class 1259 OID 20644352)
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
-- TOC entry 221 (class 1259 OID 20644465)
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
-- TOC entry 239 (class 1259 OID 20644785)
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
-- TOC entry 238 (class 1259 OID 20644757)
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
-- TOC entry 240 (class 1259 OID 20644797)
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
-- TOC entry 217 (class 1259 OID 20644424)
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
-- TOC entry 198 (class 1259 OID 20644260)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20644532)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20644414)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20643975)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2975 (class 0 OID 20644027)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 20644584)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5605-1f9a-5b44-7634499169d1	000d0000-5605-1f9a-f535-f72381cb7942	\N	00090000-5605-1f9a-9103-eec174a6d2e2	000b0000-5605-1f9a-31b4-124565531483	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5605-1f9a-e980-9662e56453ce	000d0000-5605-1f9a-3df8-8a8b6b28cc59	00100000-5605-1f9a-ef82-4256c42715c7	00090000-5605-1f9a-ec7a-364f50ed6c00	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5605-1f9a-c697-a4aae7e0f52a	000d0000-5605-1f9a-c81a-80d8e2981c25	00100000-5605-1f9a-bb04-39d58750b5ba	00090000-5605-1f9a-a7b6-bb9318537393	\N	0003	t	\N	2015-09-25	\N	2	t	\N	f	f
000c0000-5605-1f9a-c910-d1e9bbc0dc1b	000d0000-5605-1f9a-9473-6f9f4361be49	\N	00090000-5605-1f9a-b1e4-73ba5f2f56f0	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5605-1f9a-aaec-9d8fe0b96f31	000d0000-5605-1f9a-2554-6bf560272439	\N	00090000-5605-1f9a-27e7-6a153af612d7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5605-1f9a-668d-6d5781e77cfc	000d0000-5605-1f9a-c4ff-6c6d3e6db50a	\N	00090000-5605-1f9a-b7f7-606d07830910	000b0000-5605-1f9a-5b82-850ed481f3a0	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5605-1f9a-510a-2acf262e2861	000d0000-5605-1f9a-84b2-19fcdd67a72a	00100000-5605-1f9a-caf2-3bbfd0f3cad9	00090000-5605-1f9a-701b-e216e3c5fdbf	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5605-1f9a-2bbf-bb1012aa570a	000d0000-5605-1f9a-5bfa-b59b0fd1cfae	\N	00090000-5605-1f9a-65fb-01db8dc53eb1	000b0000-5605-1f9a-d172-0d713a73d6ec	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5605-1f9a-0543-d19720765380	000d0000-5605-1f9a-84b2-19fcdd67a72a	00100000-5605-1f9a-8be3-6884b02e9f7b	00090000-5605-1f9a-469d-6e998862050a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5605-1f9a-809a-22a28cf5d462	000d0000-5605-1f9a-84b2-19fcdd67a72a	00100000-5605-1f9a-8dec-647c6c56ee93	00090000-5605-1f9a-5719-1392d18ad702	\N	0010	t	\N	2015-09-25	\N	16	f	\N	f	t
000c0000-5605-1f9a-aef7-0e009f20ee11	000d0000-5605-1f9a-84b2-19fcdd67a72a	00100000-5605-1f9a-8bd3-d6fb7dfa1632	00090000-5605-1f9a-5f3c-60bb296f4f08	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5605-1f9a-75d6-593ff646e99f	000d0000-5605-1f9a-9b09-d49f070937fe	\N	00090000-5605-1f9a-ec7a-364f50ed6c00	000b0000-5605-1f9a-f0d8-73a9ccdbd30d	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3022 (class 0 OID 20644567)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20644444)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5605-1f9a-b7f4-1c6f0ff81461	00160000-5605-1f9a-4fe5-ad4d5cd436d9	00090000-5605-1f9a-aabe-1efde5720679	aizv	10	t
003d0000-5605-1f9a-b9c6-67dd4997dd2f	00160000-5605-1f9a-4fe5-ad4d5cd436d9	00090000-5605-1f9a-8592-a043cda29486	apri	14	t
003d0000-5605-1f9a-008d-1ac37f4665b7	00160000-5605-1f9a-5e96-f1df655ddbfa	00090000-5605-1f9a-ca05-896d0116d285	aizv	11	t
003d0000-5605-1f9a-4b14-f94728cf2959	00160000-5605-1f9a-7e14-35135b4506ad	00090000-5605-1f9a-8a34-143af01aa5f3	aizv	12	t
003d0000-5605-1f9a-b17c-f4f041bf1249	00160000-5605-1f9a-4fe5-ad4d5cd436d9	00090000-5605-1f9a-b32f-ceb5032378b9	apri	18	f
\.


--
-- TOC entry 3016 (class 0 OID 20644474)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5605-1f9a-4fe5-ad4d5cd436d9	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5605-1f9a-5e96-f1df655ddbfa	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5605-1f9a-7e14-35135b4506ad	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3037 (class 0 OID 20644824)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20644234)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5605-1f9a-d36a-86ed24324115	\N	\N	00200000-5605-1f9a-7a8a-aa5c23e56405	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5605-1f9a-aad9-cee9fa678620	\N	\N	00200000-5605-1f9a-442c-81693b815080	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5605-1f9a-0e33-222bdee1d9f5	\N	\N	00200000-5605-1f9a-3ee0-f567058bae06	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5605-1f9a-ea29-a916c454767f	\N	\N	00200000-5605-1f9a-fbf3-f2d50066b032	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5605-1f9a-4c63-ca5eb4866943	\N	\N	00200000-5605-1f9a-342e-35b2adb98747	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2993 (class 0 OID 20644266)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20644750)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20644148)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5605-1f98-2c34-55fa8561703b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5605-1f98-a878-928144ed0d25	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5605-1f98-5285-9d20e241176b	AL	ALB	008	Albania 	Albanija	\N
00040000-5605-1f98-cc39-05293174c79f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5605-1f98-f393-b2edcd1bc5e8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5605-1f98-450e-f74e236768a7	AD	AND	020	Andorra 	Andora	\N
00040000-5605-1f98-97ec-e5f726522078	AO	AGO	024	Angola 	Angola	\N
00040000-5605-1f98-e5cf-1e546b977247	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5605-1f98-ce91-fc148ebb6e37	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5605-1f98-936f-169a5e3d684b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-1f98-3468-b62bc0622223	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5605-1f98-0f45-01ac754c579c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5605-1f98-2d3a-9cd37d014a97	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5605-1f98-d922-a34e2fa3aad8	AU	AUS	036	Australia 	Avstralija	\N
00040000-5605-1f98-05c8-b6f32e01d677	AT	AUT	040	Austria 	Avstrija	\N
00040000-5605-1f98-7147-23917caea954	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5605-1f98-a089-79fcef4fa5f5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5605-1f98-d3cc-9cb0e364df86	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5605-1f98-4e8a-073c73b9d293	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5605-1f98-8968-4ace9ebee52c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5605-1f98-6812-be89ce211afc	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5605-1f98-4919-98e876dbba4c	BE	BEL	056	Belgium 	Belgija	\N
00040000-5605-1f98-9fd3-7c65c35be306	BZ	BLZ	084	Belize 	Belize	\N
00040000-5605-1f98-5798-f5e763ec6858	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5605-1f98-8ce9-95ea27f3c3dc	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5605-1f98-35ad-51c26b8e7464	BT	BTN	064	Bhutan 	Butan	\N
00040000-5605-1f98-d6f1-f02f60416bd9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5605-1f98-4cc8-b82edbfd7ba2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5605-1f98-a3aa-965814507b3b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5605-1f98-df36-71363f352912	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5605-1f98-66f8-fd7701ffcd91	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5605-1f98-1a87-398dbadec3c6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5605-1f98-ad6e-280512e4bd73	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5605-1f98-30ed-4f7831cbbe26	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5605-1f98-3a65-6382e07b4e12	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5605-1f98-fa2c-503ce1517d2c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5605-1f98-0eb1-e27529f2ff81	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5605-1f98-b70d-a956201bc280	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5605-1f98-e973-03df4a21cf97	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5605-1f98-0f91-c009ce7d8d3b	CA	CAN	124	Canada 	Kanada	\N
00040000-5605-1f98-16e3-3329d1ef2499	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5605-1f98-12dd-d8fc765ea390	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5605-1f98-c885-6bac3dbbcda2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5605-1f98-356b-b2e5fd745486	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5605-1f98-1d91-10b5e33fbf6d	CL	CHL	152	Chile 	Čile	\N
00040000-5605-1f98-eeae-92981312805c	CN	CHN	156	China 	Kitajska	\N
00040000-5605-1f98-5c00-db33b86b67f8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5605-1f98-406d-b7e420d95ec5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5605-1f98-5593-2960a1379edb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5605-1f98-9330-878c0e8e3903	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5605-1f98-6ce7-fbd533bea6f3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5605-1f98-f648-3ba5e2d1115f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5605-1f98-4991-4b1292eb176f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5605-1f98-bff0-d642c4762f37	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5605-1f98-c772-fd658c81c97a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5605-1f98-b39e-f4c79ea03cb2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5605-1f98-bd29-8bf08dee3db4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5605-1f98-eb48-cf54bf0e55e7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5605-1f98-4e73-87283629ebb1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5605-1f98-1f16-21b34237ad03	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5605-1f98-a8ec-7c65dbe42605	DK	DNK	208	Denmark 	Danska	\N
00040000-5605-1f98-af5f-8bd4d1c4ca70	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5605-1f98-f059-6c301406f39e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-1f98-9ed3-b27925f9640d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5605-1f98-da5b-117a214deb0a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5605-1f98-629f-97d5f7f8c627	EG	EGY	818	Egypt 	Egipt	\N
00040000-5605-1f98-e326-528f8e5be992	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5605-1f98-7254-d7e4c4c7007d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5605-1f98-32ad-f3d912ebe3cd	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5605-1f98-3627-287bf1d4eefc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5605-1f98-3a1c-c704884961ae	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5605-1f98-5902-a084e641296b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5605-1f98-adc6-afa8b6ce8b44	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5605-1f98-5cfb-d4871890a1ef	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5605-1f98-002b-73243e964876	FI	FIN	246	Finland 	Finska	\N
00040000-5605-1f98-ab47-e0712100b1d1	FR	FRA	250	France 	Francija	\N
00040000-5605-1f98-e038-545bad9ca926	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5605-1f98-b202-d6409651163e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5605-1f98-c4b8-99876af32fb6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5605-1f98-a902-9c2214311f73	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5605-1f98-31f0-951766a90696	GA	GAB	266	Gabon 	Gabon	\N
00040000-5605-1f98-9833-221678da8ba4	GM	GMB	270	Gambia 	Gambija	\N
00040000-5605-1f98-27f2-90bb636d86a5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5605-1f98-96d2-567f9698e08d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5605-1f98-64a9-901f276decd5	GH	GHA	288	Ghana 	Gana	\N
00040000-5605-1f98-b208-8b1beff91328	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5605-1f98-6bc0-c424be669fef	GR	GRC	300	Greece 	Grčija	\N
00040000-5605-1f98-00ee-95ab0cc113c6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5605-1f98-ab34-145fcfcadaa7	GD	GRD	308	Grenada 	Grenada	\N
00040000-5605-1f98-c9a6-aaa8c54416b2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5605-1f98-3fe4-82573760108d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5605-1f98-567a-144fb9ff6654	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5605-1f98-3e7d-d85c88288bfa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5605-1f98-5c5c-b993d6fb6722	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5605-1f98-25a2-6bb545a85eed	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5605-1f98-e681-84311b52f1e5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5605-1f98-2b95-536b3e884729	HT	HTI	332	Haiti 	Haiti	\N
00040000-5605-1f98-1090-e7a79cf89e83	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5605-1f98-ebc4-7d6ab68534d0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5605-1f98-f8c4-5b16b9ef84ef	HN	HND	340	Honduras 	Honduras	\N
00040000-5605-1f98-a5a6-07390228e776	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5605-1f98-948a-d2c9a0aa9154	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5605-1f98-f1c0-175261a2db61	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5605-1f98-19b9-a50e2baf62f5	IN	IND	356	India 	Indija	\N
00040000-5605-1f98-19dd-9065227445ef	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5605-1f98-4080-e984872cf17a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5605-1f98-7abe-6f0f7b77360c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5605-1f98-bd58-285c85e06586	IE	IRL	372	Ireland 	Irska	\N
00040000-5605-1f98-c870-7472a1cbb66a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5605-1f98-b5e8-973abea8b575	IL	ISR	376	Israel 	Izrael	\N
00040000-5605-1f98-e1ca-ca893529a38d	IT	ITA	380	Italy 	Italija	\N
00040000-5605-1f98-3d92-b1da8fafdc22	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5605-1f98-afa9-30025a4c2b1a	JP	JPN	392	Japan 	Japonska	\N
00040000-5605-1f98-cacc-6cfd6375bc13	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5605-1f98-a293-d75bff899363	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5605-1f98-ec31-24194d397539	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5605-1f98-3c7d-f5000f735090	KE	KEN	404	Kenya 	Kenija	\N
00040000-5605-1f98-699f-370f391cfc24	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5605-1f98-a790-6f0d1f8e3d37	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5605-1f98-f10e-8c27f221eb34	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5605-1f98-0d76-77301a4be51e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5605-1f98-77fa-3358f3625dcc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5605-1f98-0b0e-7fdedd0b2593	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5605-1f98-e786-5ab935ee847a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5605-1f98-6941-157a6b3b91d9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5605-1f98-4256-260b27c28da6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5605-1f98-2257-b5c4d9f37f2e	LR	LBR	430	Liberia 	Liberija	\N
00040000-5605-1f98-f0ff-4fd8775fd7c3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5605-1f98-71d1-399444596a39	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5605-1f98-277a-864c6e419ca1	LT	LTU	440	Lithuania 	Litva	\N
00040000-5605-1f98-1114-21c5c2c7465a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5605-1f98-9e9b-d74c8a2d7aa1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5605-1f98-8e53-40f9e008ed30	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5605-1f98-4cd1-9b7c72080ab2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5605-1f98-d064-2bcaaf3e0060	MW	MWI	454	Malawi 	Malavi	\N
00040000-5605-1f98-2dc9-afb87812d6e0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5605-1f98-48fe-2bcbe5208f72	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5605-1f98-3ce0-0f6288581b28	ML	MLI	466	Mali 	Mali	\N
00040000-5605-1f98-c1cb-f9173202f568	MT	MLT	470	Malta 	Malta	\N
00040000-5605-1f98-21dc-bd00a76d5e5d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5605-1f98-50b6-481e7e8c2389	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5605-1f98-e218-7c870f0e80ef	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5605-1f98-1db8-06586a234d11	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5605-1f98-1087-7600838aedf0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5605-1f98-aec0-4e379cdd2f76	MX	MEX	484	Mexico 	Mehika	\N
00040000-5605-1f98-63ad-8beb6c34a8fc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5605-1f98-db62-3f3933fc174f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5605-1f98-66d5-b3399c0162ed	MC	MCO	492	Monaco 	Monako	\N
00040000-5605-1f98-3bf4-335ee5c5ff04	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5605-1f98-af7e-fad2f867d365	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5605-1f98-de16-347fb09f3e4f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5605-1f98-3404-c285317b65ac	MA	MAR	504	Morocco 	Maroko	\N
00040000-5605-1f98-18e0-87c70006d952	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5605-1f98-19a4-8c9665686f4c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5605-1f98-93d8-35230fd637eb	NA	NAM	516	Namibia 	Namibija	\N
00040000-5605-1f98-89a8-af0baea23362	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5605-1f98-5e38-207f2e09da57	NP	NPL	524	Nepal 	Nepal	\N
00040000-5605-1f98-38c6-4a6d721343ef	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5605-1f98-a2b6-6c71445c44b6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5605-1f98-160f-b1042a32db51	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5605-1f98-551c-969abbc7ce9e	NE	NER	562	Niger 	Niger 	\N
00040000-5605-1f98-d620-c8fdf1e7848f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5605-1f98-fd68-84fc6f7d46c8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5605-1f98-2c22-a253a51073d8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5605-1f98-9a4c-26846f639c07	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5605-1f98-f002-7cacad8041ba	NO	NOR	578	Norway 	Norveška	\N
00040000-5605-1f98-e880-8b5bb4b2786e	OM	OMN	512	Oman 	Oman	\N
00040000-5605-1f98-7904-ddb91806e007	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5605-1f98-7554-e254415ec734	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5605-1f98-6f81-8152a955c2e8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5605-1f98-912f-cba9f925ee6c	PA	PAN	591	Panama 	Panama	\N
00040000-5605-1f98-f304-b626cbd250ec	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5605-1f98-3a1f-50d8c90a6e26	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5605-1f98-d403-11b731d96872	PE	PER	604	Peru 	Peru	\N
00040000-5605-1f98-250a-72aba867dbee	PH	PHL	608	Philippines 	Filipini	\N
00040000-5605-1f98-5df3-e7342b104cd9	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5605-1f98-6d0c-1685ec51ed57	PL	POL	616	Poland 	Poljska	\N
00040000-5605-1f98-3ffb-c220f2ec0ec5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5605-1f98-a18d-486caf8c47d6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5605-1f98-b160-f727e4e7fe2c	QA	QAT	634	Qatar 	Katar	\N
00040000-5605-1f98-3f63-56d2da706137	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5605-1f98-141a-85cb684015e9	RO	ROU	642	Romania 	Romunija	\N
00040000-5605-1f98-90e5-a642db809530	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5605-1f98-4ef8-4424cde358f5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5605-1f98-1161-c3eea2d33078	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5605-1f98-baec-1497d687be51	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5605-1f98-f93d-c459c60a64b3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5605-1f98-c7fa-673953964498	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5605-1f98-96d4-0fc129ae42f7	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5605-1f98-77f8-8952a078b5a0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5605-1f98-0d1e-a6e91693efea	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5605-1f98-e125-6092035afef1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5605-1f98-d40a-2d0fd2c11792	SM	SMR	674	San Marino 	San Marino	\N
00040000-5605-1f98-6ef4-80452e42816a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5605-1f98-07ea-187ec3192f74	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5605-1f98-df50-fd0819530399	SN	SEN	686	Senegal 	Senegal	\N
00040000-5605-1f98-e8be-e0a18f8ecf6d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5605-1f98-67a3-189be67e2adc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5605-1f98-e138-4df979b9cfb8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5605-1f98-2a4b-ec2729b4d4ae	SG	SGP	702	Singapore 	Singapur	\N
00040000-5605-1f98-7335-8ab5ba7551b8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5605-1f98-6e31-3e22e15428aa	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5605-1f98-019d-80f97edb029c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5605-1f98-1fcd-83f1cea34e48	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5605-1f98-3700-ea42282e4202	SO	SOM	706	Somalia 	Somalija	\N
00040000-5605-1f98-8f71-d7210e19b85f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5605-1f98-eeff-9d55a91f017c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5605-1f98-391b-2cdb77b45e7d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5605-1f98-6f3a-9b38171c63be	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5605-1f98-8f9c-6e78177dc525	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5605-1f98-e7d8-c12d070b1dba	SD	SDN	729	Sudan 	Sudan	\N
00040000-5605-1f98-a16d-ceea0ab101bd	SR	SUR	740	Suriname 	Surinam	\N
00040000-5605-1f98-4a2b-504da986cc69	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5605-1f98-9488-3c9d8c9f06db	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5605-1f98-15da-e0e529d7c842	SE	SWE	752	Sweden 	Švedska	\N
00040000-5605-1f98-333a-6a693d223f65	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5605-1f98-8542-c5c970762b3a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5605-1f98-cb76-6864fad7e0f9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5605-1f98-3102-600b430d4325	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5605-1f98-3b09-a4f98df764f6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5605-1f98-08c1-1100bf66b2f0	TH	THA	764	Thailand 	Tajska	\N
00040000-5605-1f98-3154-f0126c23bef9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5605-1f98-0d45-bffb240ee406	TG	TGO	768	Togo 	Togo	\N
00040000-5605-1f98-417a-9a4128ca428c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5605-1f98-9ef1-c5e15e2db6fe	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5605-1f98-e09c-344a6a9b6a13	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5605-1f98-1e30-ebf5000d80f0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5605-1f98-d52b-80ce58418bcc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5605-1f98-fd5e-fc6c45fc6cd5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5605-1f98-424f-c695071a85a8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-1f98-8c07-b38b47a7567d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5605-1f98-00fa-f9a0d83b8841	UG	UGA	800	Uganda 	Uganda	\N
00040000-5605-1f98-ffcd-332954b6e4ed	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5605-1f98-7afc-ff7f8c57c8a9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5605-1f98-16ef-d263d69be6e8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5605-1f98-ae78-160bb1541a6b	US	USA	840	United States 	Združene države Amerike	\N
00040000-5605-1f98-cb4e-ee8d91df9971	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5605-1f98-e706-47bdd33e80a2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5605-1f98-5ebb-438e7371e857	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5605-1f98-5c6e-2ae32e387227	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5605-1f98-4b68-4d3aeb8e0b2d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5605-1f98-6305-71167b759a27	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5605-1f98-cf7c-00d380c64fb5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-1f98-47df-aa0b12176d3f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5605-1f98-7652-99321fbd0cbd	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5605-1f98-168a-e8fd25177cff	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5605-1f98-1c5e-041a970ae5b8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5605-1f98-04d8-9964cf28552d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5605-1f98-abb8-2ad66391fd17	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3024 (class 0 OID 20644597)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5605-1f9a-2aa3-77b3992e30a9	000e0000-5605-1f9a-1cdf-38b64bdcd7b0	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-1f98-40c5-9da7ca2a528b	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-1f9a-b4db-54db1a2d2a70	000e0000-5605-1f9a-b008-5a33737748dd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-1f98-f048-eec243ea7d91	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-1f9a-24da-2aaf80305396	000e0000-5605-1f9a-b72c-5f32d531ecf3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-1f98-40c5-9da7ca2a528b	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-1f9a-4143-4f1f91fd26b9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-1f9a-6d40-cccb8c0a3bcc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3009 (class 0 OID 20644399)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5605-1f9a-f535-f72381cb7942	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-5b44-7634499169d1	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-1f98-887e-befe50421e26
000d0000-5605-1f9a-3df8-8a8b6b28cc59	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-e980-9662e56453ce	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5605-1f98-d64f-c3abc5c70a36
000d0000-5605-1f9a-c81a-80d8e2981c25	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-c697-a4aae7e0f52a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5605-1f98-4ca5-b1a76dedfacb
000d0000-5605-1f9a-9473-6f9f4361be49	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-c910-d1e9bbc0dc1b	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5605-1f98-aeca-bb97d89770b4
000d0000-5605-1f9a-2554-6bf560272439	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-aaec-9d8fe0b96f31	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5605-1f98-aeca-bb97d89770b4
000d0000-5605-1f9a-c4ff-6c6d3e6db50a	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-668d-6d5781e77cfc	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-1f98-887e-befe50421e26
000d0000-5605-1f9a-84b2-19fcdd67a72a	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-0543-d19720765380	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5605-1f98-887e-befe50421e26
000d0000-5605-1f9a-5bfa-b59b0fd1cfae	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-2bbf-bb1012aa570a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5605-1f98-2a52-d0f21705dbb6
000d0000-5605-1f9a-9b09-d49f070937fe	000e0000-5605-1f9a-b008-5a33737748dd	000c0000-5605-1f9a-75d6-593ff646e99f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5605-1f98-49ad-2efd7e588d58
\.


--
-- TOC entry 2989 (class 0 OID 20644213)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20644188)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20644165)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5605-1f9a-b53c-31e80c0cdd62	00080000-5605-1f9a-4135-60e4f2a14a2e	00090000-5605-1f9a-5719-1392d18ad702	AK		igralka
\.


--
-- TOC entry 2998 (class 0 OID 20644313)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20644805)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20644817)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 20644839)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 20579799)
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
-- TOC entry 3002 (class 0 OID 20644338)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20644122)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5605-1f98-8b13-f6f2598683db	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5605-1f98-46a1-a2f29267a503	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5605-1f98-a0be-c8f661c33a1f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5605-1f98-c85d-e6733832a2b6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5605-1f98-a598-bbcc1d5d4358	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5605-1f98-6375-19b2b415d5b5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5605-1f98-3f24-6ec081ac5054	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5605-1f98-dc95-8462e81a265b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-1f98-acf4-6db2013ef7c4	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-1f98-ece9-4a2f54ab1cd8	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5605-1f98-a73b-bb6a4b1f107d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5605-1f98-105f-42963c6a98af	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5605-1f98-19f8-d540b205f5d8	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5605-1f98-9fa5-32c96bc4a2ff	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5605-1f98-3836-5e5e127d0598	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5605-1f9a-fc84-0e018888512e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5605-1f9a-3288-8c0fcf975902	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5605-1f9a-3a3c-478f5a4f78a6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5605-1f9a-15f3-90bb28557637	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5605-1f9a-1952-ced8f1860adb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5605-1f9c-bdea-a22c2141e2b4	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2976 (class 0 OID 20644036)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5605-1f9a-94fa-9e01f6d5aa65	00000000-5605-1f9a-fc84-0e018888512e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5605-1f9a-58f8-e61b08842056	00000000-5605-1f9a-fc84-0e018888512e	00010000-5605-1f98-f171-e7fd05294c26	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5605-1f9a-e41f-553d0206a6c0	00000000-5605-1f9a-3288-8c0fcf975902	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2977 (class 0 OID 20644047)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5605-1f9a-9103-eec174a6d2e2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5605-1f9a-b1e4-73ba5f2f56f0	00010000-5605-1f9a-60ea-d1268ddbed93	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5605-1f9a-a7b6-bb9318537393	00010000-5605-1f9a-dbb6-04b1f8042250	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5605-1f9a-469d-6e998862050a	00010000-5605-1f9a-be91-908a0e50e6d0	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5605-1f9a-8d6e-06fb3f37a048	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5605-1f9a-b7f7-606d07830910	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5605-1f9a-5f3c-60bb296f4f08	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5605-1f9a-701b-e216e3c5fdbf	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5605-1f9a-5719-1392d18ad702	00010000-5605-1f9a-be4b-254411dbdbe9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5605-1f9a-ec7a-364f50ed6c00	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5605-1f9a-8bc5-a1e784b02cf7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-1f9a-27e7-6a153af612d7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5605-1f9a-65fb-01db8dc53eb1	00010000-5605-1f9a-377d-80d49b368925	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-1f9a-aabe-1efde5720679	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-1f9a-8592-a043cda29486	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-1f9a-ca05-896d0116d285	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-1f9a-8a34-143af01aa5f3	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5605-1f9a-b32f-ceb5032378b9	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2972 (class 0 OID 20644001)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5605-1f98-f925-b250a3cfa871	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5605-1f98-286f-763338f6116a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5605-1f98-9227-ed543ae6ddd1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5605-1f98-da59-d565faa1b162	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5605-1f98-eeed-3f16c494bf73	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5605-1f98-5c4d-ec62d414dded	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5605-1f98-7833-5391d9e16871	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5605-1f98-16ff-5af89d5ff9ce	Abonma-read	Abonma - branje	f
00030000-5605-1f98-8775-911328b983ff	Abonma-write	Abonma - spreminjanje	f
00030000-5605-1f98-1e48-3beacd9dc200	Alternacija-read	Alternacija - branje	f
00030000-5605-1f98-044e-82eba2580076	Alternacija-write	Alternacija - spreminjanje	f
00030000-5605-1f98-f53b-c802ed678c45	Arhivalija-read	Arhivalija - branje	f
00030000-5605-1f98-7c8a-b5cb85ecd8f4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5605-1f98-f176-f12521b0a342	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5605-1f98-02ee-9dfb9e3d90e8	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5605-1f98-44ff-e7e4fc995042	Besedilo-read	Besedilo - branje	f
00030000-5605-1f98-584e-d786a7fe413d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5605-1f98-bc6c-7e9ced7e2bd3	DogodekIzven-read	DogodekIzven - branje	f
00030000-5605-1f98-ed2d-a527d6e43f0b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5605-1f98-d7ab-f4403505cae1	Dogodek-read	Dogodek - branje	f
00030000-5605-1f98-1948-531f3133363c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5605-1f98-bfe5-78f8a306593c	DrugiVir-read	DrugiVir - branje	f
00030000-5605-1f98-00b8-0ead0e6c78e4	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5605-1f98-ce61-fcece8af4413	Drzava-read	Drzava - branje	f
00030000-5605-1f98-8e72-a7035b9d262a	Drzava-write	Drzava - spreminjanje	f
00030000-5605-1f98-b870-8005e6bd2bfa	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5605-1f98-f95d-4208ca97aca5	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5605-1f98-3149-31eed9d33207	Funkcija-read	Funkcija - branje	f
00030000-5605-1f98-0f99-41d6a2bf4f4e	Funkcija-write	Funkcija - spreminjanje	f
00030000-5605-1f98-d799-dfce5bae7d46	Gostovanje-read	Gostovanje - branje	f
00030000-5605-1f98-fc95-341a3f55f0e5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5605-1f98-e682-e285cd852be9	Gostujoca-read	Gostujoca - branje	f
00030000-5605-1f98-f472-dc1007d787cc	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5605-1f98-3efd-c63ff9963d16	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5605-1f98-f494-13dac243fbde	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5605-1f98-9a51-f1dc00cbedcc	Kupec-read	Kupec - branje	f
00030000-5605-1f98-06ee-72ae2479944e	Kupec-write	Kupec - spreminjanje	f
00030000-5605-1f98-7e20-e01cf1e93829	NacinPlacina-read	NacinPlacina - branje	f
00030000-5605-1f98-9951-319bcef353ae	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5605-1f98-31af-bc6efa21be30	Option-read	Option - branje	f
00030000-5605-1f98-2c97-493c570c3e75	Option-write	Option - spreminjanje	f
00030000-5605-1f98-add9-e35c6d269fbe	OptionValue-read	OptionValue - branje	f
00030000-5605-1f98-2499-2f416b7ec9cd	OptionValue-write	OptionValue - spreminjanje	f
00030000-5605-1f98-32c5-98bf0d1ab0c1	Oseba-read	Oseba - branje	f
00030000-5605-1f98-6822-003d059789e3	Oseba-write	Oseba - spreminjanje	f
00030000-5605-1f98-811c-cad9c1669817	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5605-1f98-aa98-aa7fe81bc7a0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5605-1f98-aae7-8a37850eb624	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5605-1f98-b69b-a58d12bc68ca	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5605-1f98-7e9d-56d501966b0e	Pogodba-read	Pogodba - branje	f
00030000-5605-1f98-abeb-50e636281274	Pogodba-write	Pogodba - spreminjanje	f
00030000-5605-1f98-fd49-d586303bf2f4	Popa-read	Popa - branje	f
00030000-5605-1f98-f1af-71f2474e8e51	Popa-write	Popa - spreminjanje	f
00030000-5605-1f98-8464-8b14a8143c67	Posta-read	Posta - branje	f
00030000-5605-1f98-e1ab-099a72fc6f0e	Posta-write	Posta - spreminjanje	f
00030000-5605-1f98-1300-7741cb0b1197	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5605-1f98-ebe8-8f5cf5d2a6d4	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5605-1f98-7576-9dd4e5b54d92	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5605-1f98-97a7-2c2fec03dff7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5605-1f98-ad22-a10b2dd6027b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5605-1f98-816e-b8019a739e82	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5605-1f98-5ad7-10a06d6d3d49	Predstava-read	Predstava - branje	f
00030000-5605-1f98-738c-38441aec1893	Predstava-write	Predstava - spreminjanje	f
00030000-5605-1f98-1e55-93a70c5fd804	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5605-1f98-8080-cc9916b67527	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5605-1f98-65bc-11aa42e6885d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5605-1f98-7918-28900c1dd672	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5605-1f98-2b7c-d009d06c68ef	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5605-1f98-c94c-516bf04008c4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5605-1f98-9c74-d38fb9078d14	ProgramDela-read	ProgramDela - branje	f
00030000-5605-1f98-2098-0c515602bc88	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5605-1f98-ff3f-cf4db23d6773	ProgramFestival-read	ProgramFestival - branje	f
00030000-5605-1f98-972d-28c041c08e24	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5605-1f98-52fc-8af71cd06e8f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5605-1f98-2673-e34c4875d458	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5605-1f98-edcc-d9264c0974fb	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5605-1f98-875f-3c2044ff0052	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5605-1f98-97ea-545a00b3534c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5605-1f98-f57b-7ca737813861	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5605-1f98-790e-4b091a3c1b85	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5605-1f98-71d8-cebf29ce92c3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5605-1f98-296b-bdcc5bf28a25	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5605-1f98-8681-3a70e40f43cf	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5605-1f98-082c-09a5eb29f3fd	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5605-1f98-4039-d053e8e5343a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5605-1f98-d8d8-3696f12b2cea	ProgramRazno-read	ProgramRazno - branje	f
00030000-5605-1f98-253c-644501d8e044	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5605-1f98-76f5-7d0fdb7362a5	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5605-1f98-bd6c-40cbce9beff0	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5605-1f98-04b2-8c2249ec7e3a	Prostor-read	Prostor - branje	f
00030000-5605-1f98-d3d2-395fddea5ef9	Prostor-write	Prostor - spreminjanje	f
00030000-5605-1f98-366c-133e69f99a9d	Racun-read	Racun - branje	f
00030000-5605-1f98-2cdd-c7cc2aed37b0	Racun-write	Racun - spreminjanje	f
00030000-5605-1f98-3dd6-251f2d4253ab	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5605-1f98-2bed-36f81c3a4c67	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5605-1f98-5f54-e7277b31f089	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5605-1f98-bac0-f5a783490c9c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5605-1f98-073f-21b6adc20c51	Rekvizit-read	Rekvizit - branje	f
00030000-5605-1f98-d304-699aff4ed791	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5605-1f98-46c8-f0b21e233ab5	Revizija-read	Revizija - branje	f
00030000-5605-1f98-7d1f-c9f9be89d158	Revizija-write	Revizija - spreminjanje	f
00030000-5605-1f98-77c6-b5fa0426889d	Rezervacija-read	Rezervacija - branje	f
00030000-5605-1f98-7397-995720dcfb35	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5605-1f98-5cbc-d873235a7ab9	SedezniRed-read	SedezniRed - branje	f
00030000-5605-1f98-c028-ac02d079170e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5605-1f98-aa63-8ae8afb36d7d	Sedez-read	Sedez - branje	f
00030000-5605-1f98-c320-28f39fb598b6	Sedez-write	Sedez - spreminjanje	f
00030000-5605-1f98-5f70-82bd99854521	Sezona-read	Sezona - branje	f
00030000-5605-1f98-5ab9-a92bb8b578f4	Sezona-write	Sezona - spreminjanje	f
00030000-5605-1f98-8ee5-52f0f88bf2eb	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5605-1f98-6d81-cf656dbb19b2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5605-1f98-bb1b-3a8f93b6370b	Stevilcenje-read	Stevilcenje - branje	f
00030000-5605-1f98-394f-c154105c58ed	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5605-1f98-fdf1-30e6fc18a29b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5605-1f98-4694-eff836b2504f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5605-1f98-c179-5dfbdf69897a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5605-1f98-30e9-fa3f87e9916f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5605-1f98-91b8-aeea44ed938a	Telefonska-read	Telefonska - branje	f
00030000-5605-1f98-9e14-b47d2cb9f61b	Telefonska-write	Telefonska - spreminjanje	f
00030000-5605-1f98-6ab8-d25175fa6252	TerminStoritve-read	TerminStoritve - branje	f
00030000-5605-1f98-6f31-03e931b00ef4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5605-1f98-11c4-08488181aa22	TipFunkcije-read	TipFunkcije - branje	f
00030000-5605-1f98-8819-4e67d177ca19	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5605-1f98-9f7e-94e979e96a15	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5605-1f98-d9dc-59cc00dd99a8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5605-1f98-1087-97c5850cca16	Trr-read	Trr - branje	f
00030000-5605-1f98-8125-f3a7b96887f5	Trr-write	Trr - spreminjanje	f
00030000-5605-1f98-fcad-a2bc94f2bf42	Uprizoritev-read	Uprizoritev - branje	f
00030000-5605-1f98-9ebb-a95f3c530f5f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5605-1f98-ffbb-3981d9bd0d33	Vaja-read	Vaja - branje	f
00030000-5605-1f98-1bd4-00303ea07c20	Vaja-write	Vaja - spreminjanje	f
00030000-5605-1f98-cb7d-9aff04e936b1	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5605-1f98-3336-23cf9ea99dd1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5605-1f98-077a-e65c00a392f4	VrstaStroska-read	VrstaStroska - branje	f
00030000-5605-1f98-a7db-d0236a80ab32	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5605-1f98-7a6f-1a9fe8d35577	Zaposlitev-read	Zaposlitev - branje	f
00030000-5605-1f98-ecb6-aac9d6f638b0	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5605-1f98-7308-7b750eb494ce	Zasedenost-read	Zasedenost - branje	f
00030000-5605-1f98-9615-b68cbb314c42	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5605-1f98-daad-535ee4525252	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5605-1f98-4232-f951c75493f5	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5605-1f98-7dbd-64d4089c1a9c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5605-1f98-af94-3c9bd568d0b6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5605-1f98-326a-6c345236f4f2	Job-read	Branje opravil - samo zase - branje	f
00030000-5605-1f98-a5da-0715282d5071	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5605-1f98-9c03-025edb52ee0e	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5605-1f98-c750-95b0e52bb70f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5605-1f98-8a47-92d779d52fa7	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5605-1f98-7dee-6065c196cfd9	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5605-1f98-0068-a789257b69e2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5605-1f98-94b2-993f0a7f9e12	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-1f98-ff26-6d5f913989bf	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-1f98-9851-12fe03f2d679	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-1f98-9f96-6751aaf16f2b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-1f98-17c6-40f070908b18	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5605-1f98-e68d-2f1b9f066e76	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5605-1f98-5c3d-d9594257ba51	Datoteka-write	Datoteka - spreminjanje	f
00030000-5605-1f98-53f1-df189938e7df	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2974 (class 0 OID 20644020)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5605-1f98-48d7-8aa54fe92c68	00030000-5605-1f98-286f-763338f6116a
00020000-5605-1f98-2fee-6896aa4996bb	00030000-5605-1f98-ce61-fcece8af4413
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-16ff-5af89d5ff9ce
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-8775-911328b983ff
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-1e48-3beacd9dc200
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-044e-82eba2580076
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-f53b-c802ed678c45
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-d7ab-f4403505cae1
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-da59-d565faa1b162
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-1948-531f3133363c
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-ce61-fcece8af4413
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-8e72-a7035b9d262a
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-3149-31eed9d33207
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-0f99-41d6a2bf4f4e
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-d799-dfce5bae7d46
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-fc95-341a3f55f0e5
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-e682-e285cd852be9
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-f472-dc1007d787cc
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-3efd-c63ff9963d16
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-f494-13dac243fbde
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-31af-bc6efa21be30
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-add9-e35c6d269fbe
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-32c5-98bf0d1ab0c1
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-6822-003d059789e3
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-fd49-d586303bf2f4
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-f1af-71f2474e8e51
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-8464-8b14a8143c67
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-e1ab-099a72fc6f0e
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-ad22-a10b2dd6027b
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-816e-b8019a739e82
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-5ad7-10a06d6d3d49
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-738c-38441aec1893
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-2b7c-d009d06c68ef
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-c94c-516bf04008c4
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-04b2-8c2249ec7e3a
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-d3d2-395fddea5ef9
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-5f54-e7277b31f089
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-bac0-f5a783490c9c
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-073f-21b6adc20c51
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-d304-699aff4ed791
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-5f70-82bd99854521
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-5ab9-a92bb8b578f4
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-11c4-08488181aa22
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-fcad-a2bc94f2bf42
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-9ebb-a95f3c530f5f
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-ffbb-3981d9bd0d33
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-1bd4-00303ea07c20
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-7308-7b750eb494ce
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-9615-b68cbb314c42
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-daad-535ee4525252
00020000-5605-1f98-dbaf-e10e9a60c017	00030000-5605-1f98-7dbd-64d4089c1a9c
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-16ff-5af89d5ff9ce
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-f53b-c802ed678c45
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-d7ab-f4403505cae1
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-ce61-fcece8af4413
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-d799-dfce5bae7d46
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-e682-e285cd852be9
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-3efd-c63ff9963d16
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-f494-13dac243fbde
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-31af-bc6efa21be30
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-add9-e35c6d269fbe
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-32c5-98bf0d1ab0c1
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-6822-003d059789e3
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-fd49-d586303bf2f4
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-8464-8b14a8143c67
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-ad22-a10b2dd6027b
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-816e-b8019a739e82
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-5ad7-10a06d6d3d49
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-04b2-8c2249ec7e3a
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-5f54-e7277b31f089
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-073f-21b6adc20c51
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-5f70-82bd99854521
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-91b8-aeea44ed938a
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-9e14-b47d2cb9f61b
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-1087-97c5850cca16
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-8125-f3a7b96887f5
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-7a6f-1a9fe8d35577
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-ecb6-aac9d6f638b0
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-daad-535ee4525252
00020000-5605-1f98-56c2-ae4c71b38840	00030000-5605-1f98-7dbd-64d4089c1a9c
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-16ff-5af89d5ff9ce
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-1e48-3beacd9dc200
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-f53b-c802ed678c45
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-7c8a-b5cb85ecd8f4
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-44ff-e7e4fc995042
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-bc6c-7e9ced7e2bd3
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-d7ab-f4403505cae1
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-ce61-fcece8af4413
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-3149-31eed9d33207
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-d799-dfce5bae7d46
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-e682-e285cd852be9
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-3efd-c63ff9963d16
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-31af-bc6efa21be30
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-add9-e35c6d269fbe
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-32c5-98bf0d1ab0c1
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-fd49-d586303bf2f4
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-8464-8b14a8143c67
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-5ad7-10a06d6d3d49
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-2b7c-d009d06c68ef
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-04b2-8c2249ec7e3a
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-5f54-e7277b31f089
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-073f-21b6adc20c51
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-5f70-82bd99854521
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-11c4-08488181aa22
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-ffbb-3981d9bd0d33
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-7308-7b750eb494ce
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-daad-535ee4525252
00020000-5605-1f98-2fd1-4fc505d35622	00030000-5605-1f98-7dbd-64d4089c1a9c
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-16ff-5af89d5ff9ce
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-8775-911328b983ff
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-044e-82eba2580076
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-f53b-c802ed678c45
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-d7ab-f4403505cae1
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-ce61-fcece8af4413
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-d799-dfce5bae7d46
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-e682-e285cd852be9
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-31af-bc6efa21be30
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-add9-e35c6d269fbe
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-fd49-d586303bf2f4
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-8464-8b14a8143c67
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-5ad7-10a06d6d3d49
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-04b2-8c2249ec7e3a
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-5f54-e7277b31f089
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-073f-21b6adc20c51
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-5f70-82bd99854521
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-11c4-08488181aa22
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-daad-535ee4525252
00020000-5605-1f98-9b27-dd95814fb9a3	00030000-5605-1f98-7dbd-64d4089c1a9c
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-16ff-5af89d5ff9ce
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-f53b-c802ed678c45
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-d7ab-f4403505cae1
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-ce61-fcece8af4413
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-d799-dfce5bae7d46
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-e682-e285cd852be9
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-31af-bc6efa21be30
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-add9-e35c6d269fbe
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-fd49-d586303bf2f4
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-8464-8b14a8143c67
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-5ad7-10a06d6d3d49
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-04b2-8c2249ec7e3a
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-5f54-e7277b31f089
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-073f-21b6adc20c51
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-5f70-82bd99854521
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-6ab8-d25175fa6252
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-9227-ed543ae6ddd1
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-11c4-08488181aa22
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-daad-535ee4525252
00020000-5605-1f98-7574-b4d9404b6c16	00030000-5605-1f98-7dbd-64d4089c1a9c
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-f925-b250a3cfa871
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-286f-763338f6116a
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9227-ed543ae6ddd1
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-da59-d565faa1b162
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-eeed-3f16c494bf73
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-5c4d-ec62d414dded
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7833-5391d9e16871
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-16ff-5af89d5ff9ce
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8775-911328b983ff
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-1e48-3beacd9dc200
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-044e-82eba2580076
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-f53b-c802ed678c45
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7c8a-b5cb85ecd8f4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-44ff-e7e4fc995042
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-584e-d786a7fe413d
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-bc6c-7e9ced7e2bd3
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-ed2d-a527d6e43f0b
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-d7ab-f4403505cae1
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-1948-531f3133363c
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-ce61-fcece8af4413
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8e72-a7035b9d262a
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-bfe5-78f8a306593c
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-00b8-0ead0e6c78e4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-b870-8005e6bd2bfa
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-f95d-4208ca97aca5
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-3149-31eed9d33207
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-0f99-41d6a2bf4f4e
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-d799-dfce5bae7d46
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-fc95-341a3f55f0e5
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-e682-e285cd852be9
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-f472-dc1007d787cc
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-3efd-c63ff9963d16
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-f494-13dac243fbde
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9a51-f1dc00cbedcc
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-06ee-72ae2479944e
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7e20-e01cf1e93829
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9951-319bcef353ae
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-31af-bc6efa21be30
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-2c97-493c570c3e75
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-add9-e35c6d269fbe
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-2499-2f416b7ec9cd
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-32c5-98bf0d1ab0c1
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-6822-003d059789e3
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-811c-cad9c1669817
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-aa98-aa7fe81bc7a0
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-aae7-8a37850eb624
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-b69b-a58d12bc68ca
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7e9d-56d501966b0e
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-abeb-50e636281274
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-fd49-d586303bf2f4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-f1af-71f2474e8e51
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8464-8b14a8143c67
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-e1ab-099a72fc6f0e
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-1300-7741cb0b1197
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-ebe8-8f5cf5d2a6d4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7576-9dd4e5b54d92
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-97a7-2c2fec03dff7
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-ad22-a10b2dd6027b
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-816e-b8019a739e82
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-5ad7-10a06d6d3d49
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-738c-38441aec1893
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-1e55-93a70c5fd804
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8080-cc9916b67527
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-65bc-11aa42e6885d
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7918-28900c1dd672
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-2b7c-d009d06c68ef
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-c94c-516bf04008c4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9c74-d38fb9078d14
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-2098-0c515602bc88
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-ff3f-cf4db23d6773
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-972d-28c041c08e24
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-52fc-8af71cd06e8f
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-2673-e34c4875d458
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-edcc-d9264c0974fb
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-875f-3c2044ff0052
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-97ea-545a00b3534c
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-f57b-7ca737813861
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-790e-4b091a3c1b85
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-71d8-cebf29ce92c3
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-296b-bdcc5bf28a25
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8681-3a70e40f43cf
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-082c-09a5eb29f3fd
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-4039-d053e8e5343a
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-d8d8-3696f12b2cea
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-253c-644501d8e044
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-76f5-7d0fdb7362a5
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-bd6c-40cbce9beff0
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-04b2-8c2249ec7e3a
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-d3d2-395fddea5ef9
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-366c-133e69f99a9d
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-2cdd-c7cc2aed37b0
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-3dd6-251f2d4253ab
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-2bed-36f81c3a4c67
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-5f54-e7277b31f089
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-bac0-f5a783490c9c
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-073f-21b6adc20c51
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-d304-699aff4ed791
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-46c8-f0b21e233ab5
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7d1f-c9f9be89d158
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-77c6-b5fa0426889d
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7397-995720dcfb35
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-5cbc-d873235a7ab9
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-c028-ac02d079170e
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-aa63-8ae8afb36d7d
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-c320-28f39fb598b6
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-5f70-82bd99854521
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-5ab9-a92bb8b578f4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8ee5-52f0f88bf2eb
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-6d81-cf656dbb19b2
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-bb1b-3a8f93b6370b
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-394f-c154105c58ed
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-fdf1-30e6fc18a29b
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-4694-eff836b2504f
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-c179-5dfbdf69897a
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-30e9-fa3f87e9916f
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-91b8-aeea44ed938a
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9e14-b47d2cb9f61b
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-6ab8-d25175fa6252
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-6f31-03e931b00ef4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-11c4-08488181aa22
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8819-4e67d177ca19
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9f7e-94e979e96a15
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-d9dc-59cc00dd99a8
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-1087-97c5850cca16
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-8125-f3a7b96887f5
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-fcad-a2bc94f2bf42
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9ebb-a95f3c530f5f
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-ffbb-3981d9bd0d33
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-1bd4-00303ea07c20
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-cb7d-9aff04e936b1
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-3336-23cf9ea99dd1
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-077a-e65c00a392f4
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-a7db-d0236a80ab32
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7a6f-1a9fe8d35577
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-ecb6-aac9d6f638b0
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7308-7b750eb494ce
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-9615-b68cbb314c42
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-daad-535ee4525252
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-4232-f951c75493f5
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-7dbd-64d4089c1a9c
00020000-5605-1f9a-e873-a7b26330ed26	00030000-5605-1f98-af94-3c9bd568d0b6
\.


--
-- TOC entry 3003 (class 0 OID 20644345)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 20644379)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20644515)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5605-1f9a-31b4-124565531483	00090000-5605-1f9a-9103-eec174a6d2e2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5605-1f9a-5b82-850ed481f3a0	00090000-5605-1f9a-b7f7-606d07830910	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5605-1f9a-d172-0d713a73d6ec	00090000-5605-1f9a-65fb-01db8dc53eb1	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5605-1f9a-f0d8-73a9ccdbd30d	00090000-5605-1f9a-ec7a-364f50ed6c00	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2979 (class 0 OID 20644080)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5605-1f9a-4135-60e4f2a14a2e	00040000-5605-1f98-019d-80f97edb029c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9a-c8fc-e227d5bce1bb	00040000-5605-1f98-019d-80f97edb029c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5605-1f9a-8036-b080b4911784	00040000-5605-1f98-019d-80f97edb029c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9a-7079-92e33d9c5b88	00040000-5605-1f98-019d-80f97edb029c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9a-6d6a-2b97837bc0fd	00040000-5605-1f98-019d-80f97edb029c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9a-ec4b-c9d39d11fed7	00040000-5605-1f98-3468-b62bc0622223	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9a-b4c7-813ed70ba2d0	00040000-5605-1f98-b39e-f4c79ea03cb2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9a-3b80-0c54aa7e90c2	00040000-5605-1f98-05c8-b6f32e01d677	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9a-a135-4cb5c0225086	00040000-5605-1f98-96d2-567f9698e08d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-1f9c-815d-3ce6fd2f62c0	00040000-5605-1f98-019d-80f97edb029c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2981 (class 0 OID 20644114)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5605-1f97-e804-1aecd6189103	8341	Adlešiči
00050000-5605-1f97-6700-2148cf8573b4	5270	Ajdovščina
00050000-5605-1f97-9f31-bd46a93a3d22	6280	Ankaran/Ancarano
00050000-5605-1f97-2825-5061e6d293d0	9253	Apače
00050000-5605-1f97-410a-7c3ddc7f8012	8253	Artiče
00050000-5605-1f97-214a-7fb2b31265b9	4275	Begunje na Gorenjskem
00050000-5605-1f97-101d-8e138ea9f7d9	1382	Begunje pri Cerknici
00050000-5605-1f97-ebda-92e54d8628da	9231	Beltinci
00050000-5605-1f97-20fa-ef25ac232c16	2234	Benedikt
00050000-5605-1f97-199c-9307cbac55fe	2345	Bistrica ob Dravi
00050000-5605-1f97-9e48-60b4f69af90d	3256	Bistrica ob Sotli
00050000-5605-1f97-067d-a2140300126e	8259	Bizeljsko
00050000-5605-1f97-bf6d-d5322aeb4b09	1223	Blagovica
00050000-5605-1f97-22fd-8f6f0ea645e3	8283	Blanca
00050000-5605-1f97-2598-3f942a6c221d	4260	Bled
00050000-5605-1f97-d531-03f8f9877f2a	4273	Blejska Dobrava
00050000-5605-1f97-3fe7-d7646fb6e622	9265	Bodonci
00050000-5605-1f97-19a7-526e20e612fd	9222	Bogojina
00050000-5605-1f97-f963-cc68d2aea287	4263	Bohinjska Bela
00050000-5605-1f97-c3f1-1bfc129533a3	4264	Bohinjska Bistrica
00050000-5605-1f97-0985-b3d8fe979541	4265	Bohinjsko jezero
00050000-5605-1f97-1c56-ff9c1a62504f	1353	Borovnica
00050000-5605-1f97-7306-bcad23287317	8294	Boštanj
00050000-5605-1f97-6ada-cb2107da1a4b	5230	Bovec
00050000-5605-1f97-6d2b-dbad30792c01	5295	Branik
00050000-5605-1f97-70bd-eaf893998086	3314	Braslovče
00050000-5605-1f97-393e-15dcbb2bf4d0	5223	Breginj
00050000-5605-1f97-ba3f-1a235eceae7e	8280	Brestanica
00050000-5605-1f97-8e03-6ff0ca20ce26	2354	Bresternica
00050000-5605-1f97-2ce9-fc8ad83dc1db	4243	Brezje
00050000-5605-1f97-403a-14ec83a08e0d	1351	Brezovica pri Ljubljani
00050000-5605-1f97-fdef-b5aae574c51a	8250	Brežice
00050000-5605-1f97-5b4e-464f85c239f1	4210	Brnik - Aerodrom
00050000-5605-1f97-7b23-85b40097e531	8321	Brusnice
00050000-5605-1f97-78ac-3522540b8e65	3255	Buče
00050000-5605-1f97-bfd6-cc5d056f89fb	8276	Bučka 
00050000-5605-1f97-1f78-1aeaeed6b161	9261	Cankova
00050000-5605-1f97-4d5e-202316288e7b	3000	Celje 
00050000-5605-1f97-baaf-f2ecf2b4fb22	3001	Celje - poštni predali
00050000-5605-1f97-1f0a-7501a653d76f	4207	Cerklje na Gorenjskem
00050000-5605-1f97-e057-bd279864d262	8263	Cerklje ob Krki
00050000-5605-1f97-3b72-8ac19a9a422f	1380	Cerknica
00050000-5605-1f97-7416-c408a58644f9	5282	Cerkno
00050000-5605-1f97-90bc-bb2f6d78a039	2236	Cerkvenjak
00050000-5605-1f97-6a87-3c37ecf2e9f5	2215	Ceršak
00050000-5605-1f97-a88a-406f2d8deaf9	2326	Cirkovce
00050000-5605-1f97-5b42-44f04a1ff656	2282	Cirkulane
00050000-5605-1f97-fa4b-1cd3e3ad8708	5273	Col
00050000-5605-1f97-7f7d-00dc2d9ac0a6	8251	Čatež ob Savi
00050000-5605-1f97-9c37-0982a851b9f1	1413	Čemšenik
00050000-5605-1f97-1e30-8808e6c24f8b	5253	Čepovan
00050000-5605-1f97-d078-73b4f6d49e69	9232	Črenšovci
00050000-5605-1f97-884b-f127c00f177b	2393	Črna na Koroškem
00050000-5605-1f97-9c73-0cd6caa188f2	6275	Črni Kal
00050000-5605-1f97-7eed-4791c432b1e4	5274	Črni Vrh nad Idrijo
00050000-5605-1f97-6faf-05c0acdeebce	5262	Črniče
00050000-5605-1f97-ce96-dcaae44a386c	8340	Črnomelj
00050000-5605-1f97-ea83-86aacd88644a	6271	Dekani
00050000-5605-1f97-2a16-e26bbd5128fb	5210	Deskle
00050000-5605-1f97-da76-965bc7d4ead6	2253	Destrnik
00050000-5605-1f97-1dc3-38c893c8f323	6215	Divača
00050000-5605-1f97-742f-098af30843d3	1233	Dob
00050000-5605-1f97-cb12-6511fccbd2b8	3224	Dobje pri Planini
00050000-5605-1f97-402e-5361cee11e93	8257	Dobova
00050000-5605-1f97-825e-ed13c4fb78fb	1423	Dobovec
00050000-5605-1f97-98e9-0a8c7892b2eb	5263	Dobravlje
00050000-5605-1f97-bd23-4550fb76125c	3204	Dobrna
00050000-5605-1f97-4d81-282e7d16fa97	8211	Dobrnič
00050000-5605-1f97-9e45-638d2e535396	1356	Dobrova
00050000-5605-1f97-e860-40efdef297db	9223	Dobrovnik/Dobronak 
00050000-5605-1f97-4051-a35c5bd55dd5	5212	Dobrovo v Brdih
00050000-5605-1f97-e5de-a20473a0a3a7	1431	Dol pri Hrastniku
00050000-5605-1f97-3b73-8931fd20d486	1262	Dol pri Ljubljani
00050000-5605-1f97-7069-37c6f4709ccf	1273	Dole pri Litiji
00050000-5605-1f97-eb47-01eb1636789d	1331	Dolenja vas
00050000-5605-1f97-9ff4-cf922b376075	8350	Dolenjske Toplice
00050000-5605-1f97-4f3d-07addf330837	1230	Domžale
00050000-5605-1f97-b8f0-2e9ee0df41b3	2252	Dornava
00050000-5605-1f97-3b6b-3a59f9633407	5294	Dornberk
00050000-5605-1f97-e81b-b2592034aded	1319	Draga
00050000-5605-1f97-f23b-a3e32667ccfd	8343	Dragatuš
00050000-5605-1f97-cc80-6aa55e214a98	3222	Dramlje
00050000-5605-1f97-01a1-b6ca6386f58d	2370	Dravograd
00050000-5605-1f97-9dad-7ff03e027b74	4203	Duplje
00050000-5605-1f97-00cb-7a02caeefdd6	6221	Dutovlje
00050000-5605-1f97-a567-37c64d02b8bb	8361	Dvor
00050000-5605-1f97-c7e1-332187e7deec	2343	Fala
00050000-5605-1f97-3797-07f609ea4ba8	9208	Fokovci
00050000-5605-1f97-11ef-f47c73642df2	2313	Fram
00050000-5605-1f97-e788-7cac3401753c	3213	Frankolovo
00050000-5605-1f97-7b3e-8d4be0024ac0	1274	Gabrovka
00050000-5605-1f97-d0a9-fb161afe390d	8254	Globoko
00050000-5605-1f97-8b0a-0d77a7f5e002	5275	Godovič
00050000-5605-1f97-d8f9-26d425f62c14	4204	Golnik
00050000-5605-1f97-e368-8de4fd026e28	3303	Gomilsko
00050000-5605-1f97-b586-d1501e855102	4224	Gorenja vas
00050000-5605-1f97-5949-613ee81db256	3263	Gorica pri Slivnici
00050000-5605-1f97-2fd8-0b27f83a7579	2272	Gorišnica
00050000-5605-1f97-4ca8-4fe966959420	9250	Gornja Radgona
00050000-5605-1f97-e4f7-444e5b3002d0	3342	Gornji Grad
00050000-5605-1f97-190b-b8a1b9e6f51f	4282	Gozd Martuljek
00050000-5605-1f97-a120-a87da027aa7e	6272	Gračišče
00050000-5605-1f97-7d9a-7df131ef7d5a	9264	Grad
00050000-5605-1f97-b6ea-b5fd5b11d43f	8332	Gradac
00050000-5605-1f97-c841-b0208f9573ac	1384	Grahovo
00050000-5605-1f97-d806-94fcb73a7af0	5242	Grahovo ob Bači
00050000-5605-1f97-96e9-a9dcb27b02c5	5251	Grgar
00050000-5605-1f97-41ac-98bd150ea15a	3302	Griže
00050000-5605-1f97-f8f4-eecf47941ec2	3231	Grobelno
00050000-5605-1f97-45d4-d5939fbea519	1290	Grosuplje
00050000-5605-1f97-bfa8-4cb1844a005e	2288	Hajdina
00050000-5605-1f97-3283-b2d31ecec433	8362	Hinje
00050000-5605-1f97-a87a-0c73b65343f9	2311	Hoče
00050000-5605-1f97-0dee-2ab558cb5a91	9205	Hodoš/Hodos
00050000-5605-1f97-877c-878f8bac22dd	1354	Horjul
00050000-5605-1f97-84d6-aeb50e7f181a	1372	Hotedršica
00050000-5605-1f97-c5ee-ed114845d399	1430	Hrastnik
00050000-5605-1f97-4d7d-dbaa1a1ca103	6225	Hruševje
00050000-5605-1f97-06f5-4c7757dddbc7	4276	Hrušica
00050000-5605-1f97-f840-ea0d5d528c0f	5280	Idrija
00050000-5605-1f97-8586-e0903ef0e341	1292	Ig
00050000-5605-1f97-2a31-8cb662149d8c	6250	Ilirska Bistrica
00050000-5605-1f97-67ab-b354f7c817ee	6251	Ilirska Bistrica-Trnovo
00050000-5605-1f97-bc43-0159f815415b	1295	Ivančna Gorica
00050000-5605-1f97-5654-9e9e440982b0	2259	Ivanjkovci
00050000-5605-1f97-43be-faf2f6e25972	1411	Izlake
00050000-5605-1f97-f4e3-b2eb14e92f38	6310	Izola/Isola
00050000-5605-1f97-ab88-75e697895d9f	2222	Jakobski Dol
00050000-5605-1f97-d656-e4b398ca6afe	2221	Jarenina
00050000-5605-1f97-f5de-872d0f02c0b4	6254	Jelšane
00050000-5605-1f97-ce2d-31733bd1e5dc	4270	Jesenice
00050000-5605-1f97-4fc1-cd5adbd8082f	8261	Jesenice na Dolenjskem
00050000-5605-1f97-39dd-ca036bfa6107	3273	Jurklošter
00050000-5605-1f97-3cb5-6469386febb7	2223	Jurovski Dol
00050000-5605-1f97-542a-370d217f98cf	2256	Juršinci
00050000-5605-1f97-5c0e-15766f206124	5214	Kal nad Kanalom
00050000-5605-1f97-79ac-e378f8ef4089	3233	Kalobje
00050000-5605-1f97-b715-d088c6c7e8f7	4246	Kamna Gorica
00050000-5605-1f97-e207-795e4cfe06e0	2351	Kamnica
00050000-5605-1f97-9112-d813a54a4ecb	1241	Kamnik
00050000-5605-1f97-93b4-c714e526d256	5213	Kanal
00050000-5605-1f97-0982-a2ae631ffe91	8258	Kapele
00050000-5605-1f97-478b-0888874ba940	2362	Kapla
00050000-5605-1f97-cf04-c97f61be7e8b	2325	Kidričevo
00050000-5605-1f97-7648-7a5ce323ff5e	1412	Kisovec
00050000-5605-1f97-87f1-7801a2c45e60	6253	Knežak
00050000-5605-1f97-b2ad-31c507cb7c58	5222	Kobarid
00050000-5605-1f97-89ac-ff19f253ed55	9227	Kobilje
00050000-5605-1f97-9827-2e9cc21a0545	1330	Kočevje
00050000-5605-1f97-40db-d377cec6c929	1338	Kočevska Reka
00050000-5605-1f97-dc2b-84899122c511	2276	Kog
00050000-5605-1f97-8ea1-1b485b0cff0a	5211	Kojsko
00050000-5605-1f97-ba03-a1f126f30e05	6223	Komen
00050000-5605-1f97-eca6-5f856637b7cb	1218	Komenda
00050000-5605-1f97-3e79-ca1528dc6b48	6000	Koper/Capodistria 
00050000-5605-1f97-dcd3-a16316956279	6001	Koper/Capodistria - poštni predali
00050000-5605-1f97-1ff3-9e47beb0eea1	8282	Koprivnica
00050000-5605-1f97-04b1-b2b7a9907230	5296	Kostanjevica na Krasu
00050000-5605-1f97-d772-c0508e0ef0b3	8311	Kostanjevica na Krki
00050000-5605-1f97-90a2-6a6442d63139	1336	Kostel
00050000-5605-1f97-6e15-e3cf7833d4b1	6256	Košana
00050000-5605-1f97-73f1-1f3394e5a425	2394	Kotlje
00050000-5605-1f97-d366-b7eda4b1e5f0	6240	Kozina
00050000-5605-1f97-8900-28bafcc19e79	3260	Kozje
00050000-5605-1f97-63cc-db1e0fa7f00b	4000	Kranj 
00050000-5605-1f97-f7ce-230d69b50024	4001	Kranj - poštni predali
00050000-5605-1f97-d1d2-887d8add60a2	4280	Kranjska Gora
00050000-5605-1f97-d820-e8832663235e	1281	Kresnice
00050000-5605-1f97-3bf9-f8ca76b56de8	4294	Križe
00050000-5605-1f97-6e41-2e5055708062	9206	Križevci
00050000-5605-1f97-e09a-ce4025008bc7	9242	Križevci pri Ljutomeru
00050000-5605-1f97-8067-ec5d11a2feeb	1301	Krka
00050000-5605-1f97-f38a-3ec94ba47efc	8296	Krmelj
00050000-5605-1f97-4f36-6039a071b096	4245	Kropa
00050000-5605-1f97-a886-0197312e48ec	8262	Krška vas
00050000-5605-1f97-d0a8-89a6d4971a95	8270	Krško
00050000-5605-1f97-f72e-2f75f3d0c48f	9263	Kuzma
00050000-5605-1f97-1cbc-6e1936c77206	2318	Laporje
00050000-5605-1f97-03e8-eb7947fde908	3270	Laško
00050000-5605-1f97-9c04-89ec97e1a10e	1219	Laze v Tuhinju
00050000-5605-1f97-a0b2-b34c8ea3bf4d	2230	Lenart v Slovenskih goricah
00050000-5605-1f97-fc82-7157bf92169c	9220	Lendava/Lendva
00050000-5605-1f97-b4e8-b29427e9c6a9	4248	Lesce
00050000-5605-1f97-e3bf-3f1c33699b43	3261	Lesično
00050000-5605-1f97-c06d-44ef983eef5a	8273	Leskovec pri Krškem
00050000-5605-1f97-8b45-3f2cc12da3e5	2372	Libeliče
00050000-5605-1f97-d845-ba4710f67a70	2341	Limbuš
00050000-5605-1f98-727d-e0c1735dc94e	1270	Litija
00050000-5605-1f98-0cad-62c697693a0e	3202	Ljubečna
00050000-5605-1f98-409f-3317f7d7753a	1000	Ljubljana 
00050000-5605-1f98-59a8-92ae1ac35c50	1001	Ljubljana - poštni predali
00050000-5605-1f98-d320-7b2cf36cad91	1231	Ljubljana - Črnuče
00050000-5605-1f98-a717-bb20505abfbe	1261	Ljubljana - Dobrunje
00050000-5605-1f98-e595-390a8416cf73	1260	Ljubljana - Polje
00050000-5605-1f98-4bc3-d209459aad0f	1210	Ljubljana - Šentvid
00050000-5605-1f98-ee5a-af6adcdf50f6	1211	Ljubljana - Šmartno
00050000-5605-1f98-036f-e79f09a0f888	3333	Ljubno ob Savinji
00050000-5605-1f98-1045-5feb1f4f3510	9240	Ljutomer
00050000-5605-1f98-a5a9-f975c3d0b2d5	3215	Loče
00050000-5605-1f98-e084-4745c25ebb09	5231	Log pod Mangartom
00050000-5605-1f98-7c7c-a0409025ea16	1358	Log pri Brezovici
00050000-5605-1f98-dd94-438a961b61dc	1370	Logatec
00050000-5605-1f98-5220-86577ac67ed8	1371	Logatec
00050000-5605-1f98-24c8-10393fd3bdcb	1434	Loka pri Zidanem Mostu
00050000-5605-1f98-b847-493c1f67f91b	3223	Loka pri Žusmu
00050000-5605-1f98-6909-f4c50344dc3b	6219	Lokev
00050000-5605-1f98-f4be-c31c72d71bb7	1318	Loški Potok
00050000-5605-1f98-26ba-784be4cbc453	2324	Lovrenc na Dravskem polju
00050000-5605-1f98-45a9-cb222c819e90	2344	Lovrenc na Pohorju
00050000-5605-1f98-75dd-48db42d4e5e9	3334	Luče
00050000-5605-1f98-7f35-17c02e64ae4b	1225	Lukovica
00050000-5605-1f98-a9d3-67e139693dd9	9202	Mačkovci
00050000-5605-1f98-0d16-137d623ea907	2322	Majšperk
00050000-5605-1f98-8368-ec4cf12792cb	2321	Makole
00050000-5605-1f98-eeed-118e2e77a14d	9243	Mala Nedelja
00050000-5605-1f98-9cb8-74a4c9a1c3f9	2229	Malečnik
00050000-5605-1f98-571f-7237b7ff4f2a	6273	Marezige
00050000-5605-1f98-40fc-dbbc25af77a5	2000	Maribor 
00050000-5605-1f98-8a34-d51de63006c4	2001	Maribor - poštni predali
00050000-5605-1f98-96db-499fcf722e0d	2206	Marjeta na Dravskem polju
00050000-5605-1f98-5d5e-81f5d5f64995	2281	Markovci
00050000-5605-1f98-5667-208f50e746e5	9221	Martjanci
00050000-5605-1f98-efb2-251d4d25868e	6242	Materija
00050000-5605-1f98-75e7-470c8ec5d548	4211	Mavčiče
00050000-5605-1f98-5600-2c1923ff28b8	1215	Medvode
00050000-5605-1f98-c184-36695c0d25bc	1234	Mengeš
00050000-5605-1f98-d441-fe6e6a20e96a	8330	Metlika
00050000-5605-1f98-3e6f-b4e6e8de6fe3	2392	Mežica
00050000-5605-1f98-4031-89651f72aaf7	2204	Miklavž na Dravskem polju
00050000-5605-1f98-e54e-b79be6c6303f	2275	Miklavž pri Ormožu
00050000-5605-1f98-449f-25f34878d957	5291	Miren
00050000-5605-1f98-bdd5-2ec0a8400fe8	8233	Mirna
00050000-5605-1f98-c8cd-bd748c8a73e4	8216	Mirna Peč
00050000-5605-1f98-a861-fa45819033c4	2382	Mislinja
00050000-5605-1f98-c3b8-1c14c5704f1e	4281	Mojstrana
00050000-5605-1f98-a5f9-8c93fdccb21e	8230	Mokronog
00050000-5605-1f98-2715-bd5fa65112a8	1251	Moravče
00050000-5605-1f98-d6ae-b65c0bb38cc8	9226	Moravske Toplice
00050000-5605-1f98-062b-fe91cae46be1	5216	Most na Soči
00050000-5605-1f98-89fe-5e29ca451cad	1221	Motnik
00050000-5605-1f98-9ed1-1e91596fb273	3330	Mozirje
00050000-5605-1f98-d6b8-13c924673b52	9000	Murska Sobota 
00050000-5605-1f98-4994-921aa8db4c06	9001	Murska Sobota - poštni predali
00050000-5605-1f98-0379-70117a9e3b54	2366	Muta
00050000-5605-1f98-cbcc-ed6680cb5f4d	4202	Naklo
00050000-5605-1f98-9e99-b7a1253e0a21	3331	Nazarje
00050000-5605-1f98-3f71-a4e0876db204	1357	Notranje Gorice
00050000-5605-1f98-6725-f6223b5b0523	3203	Nova Cerkev
00050000-5605-1f98-c55b-fbaa56fd25c9	5000	Nova Gorica 
00050000-5605-1f98-987f-98e88efe4193	5001	Nova Gorica - poštni predali
00050000-5605-1f98-b209-04835a726cd9	1385	Nova vas
00050000-5605-1f98-0c70-a095eff5f45c	8000	Novo mesto
00050000-5605-1f98-33d5-c14babb21489	8001	Novo mesto - poštni predali
00050000-5605-1f98-340c-cca196505783	6243	Obrov
00050000-5605-1f98-25ad-5f0ee7dd305a	9233	Odranci
00050000-5605-1f98-3cb9-3886b703e896	2317	Oplotnica
00050000-5605-1f98-8fd5-387aa70aedf3	2312	Orehova vas
00050000-5605-1f98-2ee6-207b1eb8c52b	2270	Ormož
00050000-5605-1f98-9914-8976373b593b	1316	Ortnek
00050000-5605-1f98-53a8-3e9035fe3185	1337	Osilnica
00050000-5605-1f98-50c1-228b489c0b2b	8222	Otočec
00050000-5605-1f98-1b2f-bbbe5dcaebe1	2361	Ožbalt
00050000-5605-1f98-f0e6-c44f744d4918	2231	Pernica
00050000-5605-1f98-c63f-3242f2efd866	2211	Pesnica pri Mariboru
00050000-5605-1f98-d783-290e95ce6227	9203	Petrovci
00050000-5605-1f98-6ece-a1f058439411	3301	Petrovče
00050000-5605-1f98-5c8e-28355cd1d3f2	6330	Piran/Pirano
00050000-5605-1f98-eb35-61140100f6c1	8255	Pišece
00050000-5605-1f98-9f6a-1253f0e5d74f	6257	Pivka
00050000-5605-1f98-d5de-e63f665b5349	6232	Planina
00050000-5605-1f98-315e-8fa5596389fa	3225	Planina pri Sevnici
00050000-5605-1f98-fc6c-321119a855db	6276	Pobegi
00050000-5605-1f98-e17d-920702ccdaae	8312	Podbočje
00050000-5605-1f98-19a9-469066a1e82d	5243	Podbrdo
00050000-5605-1f98-1dc5-96a2bb115c25	3254	Podčetrtek
00050000-5605-1f98-97fe-cb6392bd11a6	2273	Podgorci
00050000-5605-1f98-8a5e-2bbefa1492d2	6216	Podgorje
00050000-5605-1f98-4f2b-3603943d5326	2381	Podgorje pri Slovenj Gradcu
00050000-5605-1f98-87c1-511c47b5f4d8	6244	Podgrad
00050000-5605-1f98-9456-b8780923f57e	1414	Podkum
00050000-5605-1f98-16bd-edb6f2cd7c07	2286	Podlehnik
00050000-5605-1f98-065f-7dd73a4e826c	5272	Podnanos
00050000-5605-1f98-40a7-43e95ed60fe1	4244	Podnart
00050000-5605-1f98-5e5d-511d61856585	3241	Podplat
00050000-5605-1f98-c169-a41f95b6d451	3257	Podsreda
00050000-5605-1f98-c722-deb013ed0936	2363	Podvelka
00050000-5605-1f98-c5af-df7f2ab29adc	2208	Pohorje
00050000-5605-1f98-3fab-71fd2b575484	2257	Polenšak
00050000-5605-1f98-0dd5-6d1b930fd7dc	1355	Polhov Gradec
00050000-5605-1f98-de25-319543ea4b39	4223	Poljane nad Škofjo Loko
00050000-5605-1f98-9f4c-00819fc33cc9	2319	Poljčane
00050000-5605-1f98-a8fe-2492b7807d0b	1272	Polšnik
00050000-5605-1f98-62d0-4de850e126ff	3313	Polzela
00050000-5605-1f98-f0c8-1259a3678f39	3232	Ponikva
00050000-5605-1f98-cb8a-62e00fa5dced	6320	Portorož/Portorose
00050000-5605-1f98-1be9-001e02e6ae72	6230	Postojna
00050000-5605-1f98-0a84-07dd5c61dc04	2331	Pragersko
00050000-5605-1f98-5a20-8188a3a33bfd	3312	Prebold
00050000-5605-1f98-b8e5-e39009beead9	4205	Preddvor
00050000-5605-1f98-4a40-9fead8dfb3fa	6255	Prem
00050000-5605-1f98-02f7-fdd1cb0ec251	1352	Preserje
00050000-5605-1f98-8fd3-68ed1c7dabc6	6258	Prestranek
00050000-5605-1f98-0632-1d47abf98d88	2391	Prevalje
00050000-5605-1f98-f6d0-05e76eba40e9	3262	Prevorje
00050000-5605-1f98-8a07-f9fde8804fb5	1276	Primskovo 
00050000-5605-1f98-cad1-4bfebcf92290	3253	Pristava pri Mestinju
00050000-5605-1f98-5d07-634bac13952d	9207	Prosenjakovci/Partosfalva
00050000-5605-1f98-c6ca-9ebe85133c6e	5297	Prvačina
00050000-5605-1f98-d945-df39112089c3	2250	Ptuj
00050000-5605-1f98-a3a9-de85a10b8c10	2323	Ptujska Gora
00050000-5605-1f98-e6da-441e8ba0ed89	9201	Puconci
00050000-5605-1f98-3e7b-8a9458893501	2327	Rače
00050000-5605-1f98-74be-8e81cdc4ca20	1433	Radeče
00050000-5605-1f98-0774-8088ed95067d	9252	Radenci
00050000-5605-1f98-588d-27ff41fa33e3	2360	Radlje ob Dravi
00050000-5605-1f98-17cc-a49dfd952854	1235	Radomlje
00050000-5605-1f98-3374-036acd855f3b	4240	Radovljica
00050000-5605-1f98-c80f-c1ccd90cae9f	8274	Raka
00050000-5605-1f98-40b9-89a478b79f7e	1381	Rakek
00050000-5605-1f98-dede-003030ce7e32	4283	Rateče - Planica
00050000-5605-1f98-7761-afcb80999ceb	2390	Ravne na Koroškem
00050000-5605-1f98-3bf6-ab6afb3e4976	9246	Razkrižje
00050000-5605-1f98-cad1-2477ad662e8b	3332	Rečica ob Savinji
00050000-5605-1f98-eaed-0d972a04e22c	5292	Renče
00050000-5605-1f98-144a-be231acea520	1310	Ribnica
00050000-5605-1f98-0010-426b0c6ad3cd	2364	Ribnica na Pohorju
00050000-5605-1f98-076b-c44b2cfef3b2	3272	Rimske Toplice
00050000-5605-1f98-3ba5-85dbacd4f5a5	1314	Rob
00050000-5605-1f98-8012-61799ad7006a	5215	Ročinj
00050000-5605-1f98-b8b0-fecd97a8d335	3250	Rogaška Slatina
00050000-5605-1f98-0036-ae7e9c496b19	9262	Rogašovci
00050000-5605-1f98-4768-d77f55068e3c	3252	Rogatec
00050000-5605-1f98-56ec-f44a1d8ada66	1373	Rovte
00050000-5605-1f98-4527-509b18efbaf8	2342	Ruše
00050000-5605-1f98-856b-d79ec5339e74	1282	Sava
00050000-5605-1f98-3fbe-081582b2ca01	6333	Sečovlje/Sicciole
00050000-5605-1f98-4049-b53a24b15333	4227	Selca
00050000-5605-1f98-24b4-efd7d1d212ec	2352	Selnica ob Dravi
00050000-5605-1f98-410e-4f4d34161f5b	8333	Semič
00050000-5605-1f98-4be5-e1e2e38ed5c3	8281	Senovo
00050000-5605-1f98-3f89-3a80b1c4f154	6224	Senožeče
00050000-5605-1f98-c0e0-ba6adbc2d5d4	8290	Sevnica
00050000-5605-1f98-0c78-0edb0e40d465	6210	Sežana
00050000-5605-1f98-a3b9-e49188a6ee2e	2214	Sladki Vrh
00050000-5605-1f98-f42f-169e41511e23	5283	Slap ob Idrijci
00050000-5605-1f98-1197-bcb0268534d6	2380	Slovenj Gradec
00050000-5605-1f98-6671-b7ed1d921b23	2310	Slovenska Bistrica
00050000-5605-1f98-fd2c-a879729a39dd	3210	Slovenske Konjice
00050000-5605-1f98-72e9-ae4a1b86337a	1216	Smlednik
00050000-5605-1f98-4694-757a8db9429a	5232	Soča
00050000-5605-1f98-534e-67bfe87e128c	1317	Sodražica
00050000-5605-1f98-492b-fd4581ba3aef	3335	Solčava
00050000-5605-1f98-3daf-b5151a8f4a6c	5250	Solkan
00050000-5605-1f98-aa02-4d6407d81973	4229	Sorica
00050000-5605-1f98-d08f-123b4ca5d717	4225	Sovodenj
00050000-5605-1f98-8598-07d67457e5cf	5281	Spodnja Idrija
00050000-5605-1f98-58cc-71cc95c819a2	2241	Spodnji Duplek
00050000-5605-1f98-20b8-6b8c34df1e0a	9245	Spodnji Ivanjci
00050000-5605-1f98-c93e-69de6cc955e8	2277	Središče ob Dravi
00050000-5605-1f98-6858-14b6facb2858	4267	Srednja vas v Bohinju
00050000-5605-1f98-a0fb-f0287520970b	8256	Sromlje 
00050000-5605-1f98-8e80-b530feca6454	5224	Srpenica
00050000-5605-1f98-6970-c40bd6cd48d9	1242	Stahovica
00050000-5605-1f98-ef83-7b8cbf344c8c	1332	Stara Cerkev
00050000-5605-1f98-d878-e6e8a5a690b6	8342	Stari trg ob Kolpi
00050000-5605-1f98-a1e6-46b38e386e18	1386	Stari trg pri Ložu
00050000-5605-1f98-b76a-8737c074d0f4	2205	Starše
00050000-5605-1f98-8d33-ba0f108e9eea	2289	Stoperce
00050000-5605-1f98-41e1-bc15a7ba137e	8322	Stopiče
00050000-5605-1f98-504f-8330bf47c5fa	3206	Stranice
00050000-5605-1f98-d3d1-87b5a7345654	8351	Straža
00050000-5605-1f98-154d-e51e0e1db4b4	1313	Struge
00050000-5605-1f98-7a2a-7ce1eeca299f	8293	Studenec
00050000-5605-1f98-6df8-32c18b37221e	8331	Suhor
00050000-5605-1f98-c4b4-87f7e8816854	2233	Sv. Ana v Slovenskih goricah
00050000-5605-1f98-ed4f-4a444c964236	2235	Sv. Trojica v Slovenskih goricah
00050000-5605-1f98-754c-d57f67d6b725	2353	Sveti Duh na Ostrem Vrhu
00050000-5605-1f98-20da-e2c4421f7fa8	9244	Sveti Jurij ob Ščavnici
00050000-5605-1f98-7b25-836cd03e1856	3264	Sveti Štefan
00050000-5605-1f98-c366-e74855b7fda6	2258	Sveti Tomaž
00050000-5605-1f98-2fe6-1f6d23550f8f	9204	Šalovci
00050000-5605-1f98-7507-b1623ca4016d	5261	Šempas
00050000-5605-1f98-a5ae-3a96c9971541	5290	Šempeter pri Gorici
00050000-5605-1f98-4b13-fd640485a473	3311	Šempeter v Savinjski dolini
00050000-5605-1f98-8956-ec19da36a4a7	4208	Šenčur
00050000-5605-1f98-f1e9-c75c3d54ec79	2212	Šentilj v Slovenskih goricah
00050000-5605-1f98-41ce-30aca03b85f4	8297	Šentjanž
00050000-5605-1f98-53de-499b0b873eb1	2373	Šentjanž pri Dravogradu
00050000-5605-1f98-2a36-55d27f5f5c59	8310	Šentjernej
00050000-5605-1f98-52c7-fe9bbd840cec	3230	Šentjur
00050000-5605-1f98-3630-6ada4d306ba6	3271	Šentrupert
00050000-5605-1f98-b5ad-12ff76f8bbb9	8232	Šentrupert
00050000-5605-1f98-51a7-b9a169659671	1296	Šentvid pri Stični
00050000-5605-1f98-4556-5751da481c2f	8275	Škocjan
00050000-5605-1f98-1052-9af7e65814b2	6281	Škofije
00050000-5605-1f98-9b73-fd82b306e431	4220	Škofja Loka
00050000-5605-1f98-6d7e-61227a81b1a8	3211	Škofja vas
00050000-5605-1f98-23a5-bfc055efc85c	1291	Škofljica
00050000-5605-1f98-f5be-b5da38a154ee	6274	Šmarje
00050000-5605-1f98-2ff3-9560e2a51ca6	1293	Šmarje - Sap
00050000-5605-1f98-809f-b67a73630607	3240	Šmarje pri Jelšah
00050000-5605-1f98-e0d7-f8e79fa05872	8220	Šmarješke Toplice
00050000-5605-1f98-18ea-36b43c2c2588	2315	Šmartno na Pohorju
00050000-5605-1f98-f6ab-a03bb8c7ba9e	3341	Šmartno ob Dreti
00050000-5605-1f98-5b9b-5fdc2ede2ade	3327	Šmartno ob Paki
00050000-5605-1f98-4ee8-fe37948fb45f	1275	Šmartno pri Litiji
00050000-5605-1f98-d6de-4e9ac1992ae9	2383	Šmartno pri Slovenj Gradcu
00050000-5605-1f98-c38e-714d7bc2b6d6	3201	Šmartno v Rožni dolini
00050000-5605-1f98-7729-0b524e95ee21	3325	Šoštanj
00050000-5605-1f98-f985-3295531b329e	6222	Štanjel
00050000-5605-1f98-5f1a-6ecec95766a8	3220	Štore
00050000-5605-1f98-26ec-8643e319cd99	3304	Tabor
00050000-5605-1f98-eae8-dacc9f5dd5c2	3221	Teharje
00050000-5605-1f98-2d4a-99d8e364dfa2	9251	Tišina
00050000-5605-1f98-2781-5167d921c7ea	5220	Tolmin
00050000-5605-1f98-532e-125519ebd3c9	3326	Topolšica
00050000-5605-1f98-88b5-91adb94ed580	2371	Trbonje
00050000-5605-1f98-1884-061ea4949ec7	1420	Trbovlje
00050000-5605-1f98-6bf7-c08fa02ff024	8231	Trebelno 
00050000-5605-1f98-55ea-7979dc384f40	8210	Trebnje
00050000-5605-1f98-3c12-5bdb64ab5eff	5252	Trnovo pri Gorici
00050000-5605-1f98-4736-cede2c181343	2254	Trnovska vas
00050000-5605-1f98-5140-2273d0d76367	1222	Trojane
00050000-5605-1f98-f129-f5e3595b175b	1236	Trzin
00050000-5605-1f98-b0a5-65fbac5b0cc9	4290	Tržič
00050000-5605-1f98-0573-9a38aaa0a05c	8295	Tržišče
00050000-5605-1f98-a888-6db74fafcdab	1311	Turjak
00050000-5605-1f98-f2a4-e092c61110ef	9224	Turnišče
00050000-5605-1f98-3c6f-dbd99b5bb2f6	8323	Uršna sela
00050000-5605-1f98-d9f9-bac3fa81fcb8	1252	Vače
00050000-5605-1f98-c218-52c07a750e0a	3320	Velenje 
00050000-5605-1f98-3290-e8fc7800ff72	3322	Velenje - poštni predali
00050000-5605-1f98-e236-077265fa6880	8212	Velika Loka
00050000-5605-1f98-cb0d-464a4948622f	2274	Velika Nedelja
00050000-5605-1f98-8c97-6e86b0d2f2f5	9225	Velika Polana
00050000-5605-1f98-5ac3-37e4272c1c8d	1315	Velike Lašče
00050000-5605-1f98-2f84-83d332dd3039	8213	Veliki Gaber
00050000-5605-1f98-ad93-fd5c41ff3688	9241	Veržej
00050000-5605-1f98-1756-65516bfaf946	1312	Videm - Dobrepolje
00050000-5605-1f98-335c-fe76f0432a04	2284	Videm pri Ptuju
00050000-5605-1f98-df9a-e95f976816f0	8344	Vinica
00050000-5605-1f98-7b9f-0b903e2d5627	5271	Vipava
00050000-5605-1f98-3ce4-99ed7f1082b5	4212	Visoko
00050000-5605-1f98-eb18-96b9999a8d91	1294	Višnja Gora
00050000-5605-1f98-a549-9e8c182a1786	3205	Vitanje
00050000-5605-1f98-65dd-c7f92cf73e42	2255	Vitomarci
00050000-5605-1f98-b22f-94934bfffdeb	1217	Vodice
00050000-5605-1f98-112e-0734e8249814	3212	Vojnik\t
00050000-5605-1f98-3326-7838be436c55	5293	Volčja Draga
00050000-5605-1f98-f7b8-1dd389093d7e	2232	Voličina
00050000-5605-1f98-14d3-4bc7b377fdfc	3305	Vransko
00050000-5605-1f98-e388-6724a6c85fed	6217	Vremski Britof
00050000-5605-1f98-cb7b-e062d2558a00	1360	Vrhnika
00050000-5605-1f98-090e-46ffc490ee80	2365	Vuhred
00050000-5605-1f98-0a76-9e3a22615faa	2367	Vuzenica
00050000-5605-1f98-b879-51241a2d88c2	8292	Zabukovje 
00050000-5605-1f98-41c5-e8a67137a3e2	1410	Zagorje ob Savi
00050000-5605-1f98-f52f-619262d00428	1303	Zagradec
00050000-5605-1f98-ebe1-c836be81ca67	2283	Zavrč
00050000-5605-1f98-2e89-88148b69f2be	8272	Zdole 
00050000-5605-1f98-49b2-38a7df8ad645	4201	Zgornja Besnica
00050000-5605-1f98-eb4e-5a198b9ee718	2242	Zgornja Korena
00050000-5605-1f98-cca1-c491aeafa278	2201	Zgornja Kungota
00050000-5605-1f98-cfd0-964a84d2914a	2316	Zgornja Ložnica
00050000-5605-1f98-e655-281e6f964c0b	2314	Zgornja Polskava
00050000-5605-1f98-a542-7e90fcbc3371	2213	Zgornja Velka
00050000-5605-1f98-a629-7b5ba4ba9e72	4247	Zgornje Gorje
00050000-5605-1f98-1aa9-141c43cbb396	4206	Zgornje Jezersko
00050000-5605-1f98-5721-2005f756a266	2285	Zgornji Leskovec
00050000-5605-1f98-428b-5a62e5d5d8d2	1432	Zidani Most
00050000-5605-1f98-92a3-3bd2d1764122	3214	Zreče
00050000-5605-1f98-73d1-4e55759fb133	4209	Žabnica
00050000-5605-1f98-cb78-52e2b8a56a69	3310	Žalec
00050000-5605-1f98-af4c-74b4f2b55519	4228	Železniki
00050000-5605-1f98-27b6-7fc01eecc85e	2287	Žetale
00050000-5605-1f98-c60f-23d84948abb0	4226	Žiri
00050000-5605-1f98-3280-b419a1c046eb	4274	Žirovnica
00050000-5605-1f98-267a-3455c28a21a8	8360	Žužemberk
\.


--
-- TOC entry 3026 (class 0 OID 20644695)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20644319)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20644099)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5605-1f9a-e8f5-50de5ee887e8	00080000-5605-1f9a-4135-60e4f2a14a2e	\N	00040000-5605-1f98-019d-80f97edb029c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5605-1f9a-2aae-08b16a65fb11	00080000-5605-1f9a-4135-60e4f2a14a2e	\N	00040000-5605-1f98-019d-80f97edb029c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5605-1f9a-dc33-127248ae088a	00080000-5605-1f9a-c8fc-e227d5bce1bb	\N	00040000-5605-1f98-019d-80f97edb029c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2988 (class 0 OID 20644203)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20644331)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20644709)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 20644719)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5605-1f9a-52fe-a9b2d78a98f9	00080000-5605-1f9a-8036-b080b4911784	0987	AK
00190000-5605-1f9a-2ac8-f2977a0f0347	00080000-5605-1f9a-c8fc-e227d5bce1bb	0989	AK
00190000-5605-1f9a-7077-238fde1d0812	00080000-5605-1f9a-7079-92e33d9c5b88	0986	AK
00190000-5605-1f9a-71af-374958c689f5	00080000-5605-1f9a-ec4b-c9d39d11fed7	0984	AK
00190000-5605-1f9a-d41a-9145a0c60833	00080000-5605-1f9a-b4c7-813ed70ba2d0	0983	AK
00190000-5605-1f9a-0896-bf6c0acfa8d1	00080000-5605-1f9a-3b80-0c54aa7e90c2	0982	AK
00190000-5605-1f9c-3422-6711d63b80ad	00080000-5605-1f9c-815d-3ce6fd2f62c0	1001	AK
\.


--
-- TOC entry 3025 (class 0 OID 20644652)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5605-1f9a-650a-1c9f46f869d0	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3029 (class 0 OID 20644727)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 20644360)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5605-1f9a-42ac-b040b562ef00	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5605-1f9a-e5b4-bd968d7859f8	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5605-1f9a-dc53-e4b664a6d4bb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5605-1f9a-c261-7b194ba0833c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5605-1f9a-4040-2f8d35703c32	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5605-1f9a-4f69-7e38725f775e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5605-1f9a-d44a-ed399bf02886	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2997 (class 0 OID 20644304)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20644294)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20644504)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20644434)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20644177)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20643972)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5605-1f9c-815d-3ce6fd2f62c0	00010000-5605-1f98-21c9-83f3f7f621f2	2015-09-25 12:19:08	INS	a:0:{}
2	App\\Entity\\Option	00000000-5605-1f9c-bdea-a22c2141e2b4	00010000-5605-1f98-21c9-83f3f7f621f2	2015-09-25 12:19:08	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5605-1f9c-3422-6711d63b80ad	00010000-5605-1f98-21c9-83f3f7f621f2	2015-09-25 12:19:08	INS	a:0:{}
\.


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3006 (class 0 OID 20644373)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 20644010)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5605-1f98-48d7-8aa54fe92c68	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5605-1f98-2fee-6896aa4996bb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5605-1f98-fc1e-717d020bff95	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5605-1f98-b316-aabdafbb20fe	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5605-1f98-dbaf-e10e9a60c017	planer	Planer dogodkov v koledarju	t
00020000-5605-1f98-56c2-ae4c71b38840	kadrovska	Kadrovska služba	t
00020000-5605-1f98-2fd1-4fc505d35622	arhivar	Ažuriranje arhivalij	t
00020000-5605-1f98-9b27-dd95814fb9a3	igralec	Igralec	t
00020000-5605-1f98-7574-b4d9404b6c16	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5605-1f9a-e873-a7b26330ed26	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2971 (class 0 OID 20643994)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5605-1f98-f171-e7fd05294c26	00020000-5605-1f98-fc1e-717d020bff95
00010000-5605-1f98-21c9-83f3f7f621f2	00020000-5605-1f98-fc1e-717d020bff95
00010000-5605-1f9a-c8e4-abc30b4e1ac1	00020000-5605-1f9a-e873-a7b26330ed26
\.


--
-- TOC entry 3008 (class 0 OID 20644387)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20644325)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20644271)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20643959)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5605-1f98-058e-daa1c588517c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5605-1f98-4a38-61a431e48a8c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5605-1f98-6e5d-bffecf995ec7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5605-1f98-ae1d-96ae7ac2083c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5605-1f98-6718-17c5f76445f1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 20643951)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5605-1f98-eb22-57ef02e63ff7	00230000-5605-1f98-ae1d-96ae7ac2083c	popa
00240000-5605-1f98-0e44-bde48691ec64	00230000-5605-1f98-ae1d-96ae7ac2083c	oseba
00240000-5605-1f98-92d8-98547b5ea802	00230000-5605-1f98-ae1d-96ae7ac2083c	sezona
00240000-5605-1f98-d62f-4af42572bea1	00230000-5605-1f98-4a38-61a431e48a8c	prostor
00240000-5605-1f98-247d-9f0ad1145eac	00230000-5605-1f98-ae1d-96ae7ac2083c	besedilo
00240000-5605-1f98-0ad1-f824b8f62e52	00230000-5605-1f98-ae1d-96ae7ac2083c	uprizoritev
00240000-5605-1f98-d4f8-b6ffd5ecf26f	00230000-5605-1f98-ae1d-96ae7ac2083c	funkcija
00240000-5605-1f98-6836-b644d076a530	00230000-5605-1f98-ae1d-96ae7ac2083c	tipfunkcije
00240000-5605-1f98-eb84-7f47ecf73035	00230000-5605-1f98-ae1d-96ae7ac2083c	alternacija
00240000-5605-1f98-7780-c8c42ed8d4ff	00230000-5605-1f98-058e-daa1c588517c	pogodba
00240000-5605-1f98-915f-0c20eae4a0e6	00230000-5605-1f98-ae1d-96ae7ac2083c	zaposlitev
00240000-5605-1f98-3417-f7e0b278b38c	00230000-5605-1f98-ae1d-96ae7ac2083c	zvrstuprizoritve
00240000-5605-1f98-945f-116437418fa0	00230000-5605-1f98-058e-daa1c588517c	programdela
00240000-5605-1f98-49ee-773eb33be3ef	00230000-5605-1f98-ae1d-96ae7ac2083c	zapis
\.


--
-- TOC entry 2965 (class 0 OID 20643946)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7a84685e-42d3-4925-8740-b2a46ba93870	00240000-5605-1f98-eb22-57ef02e63ff7	0	1001
\.


--
-- TOC entry 3014 (class 0 OID 20644451)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5605-1f9a-4c18-9e5aa596738c	000e0000-5605-1f9a-b008-5a33737748dd	00080000-5605-1f9a-4135-60e4f2a14a2e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5605-1f98-9fad-2b2f60937c36
00270000-5605-1f9a-ca62-aec8786cf182	000e0000-5605-1f9a-b008-5a33737748dd	00080000-5605-1f9a-4135-60e4f2a14a2e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5605-1f98-9fad-2b2f60937c36
\.


--
-- TOC entry 2978 (class 0 OID 20644072)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20644281)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5605-1f9a-ad59-8dd57c331bfc	00180000-5605-1f9a-d36a-86ed24324115	000c0000-5605-1f9a-5b44-7634499169d1	00090000-5605-1f9a-5719-1392d18ad702	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1f9a-91b7-57f2cfd79149	00180000-5605-1f9a-d36a-86ed24324115	000c0000-5605-1f9a-e980-9662e56453ce	00090000-5605-1f9a-ec7a-364f50ed6c00	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1f9a-7059-084a13ccca26	00180000-5605-1f9a-d36a-86ed24324115	000c0000-5605-1f9a-c697-a4aae7e0f52a	00090000-5605-1f9a-a7b6-bb9318537393	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1f9a-c9ff-b38ca583280e	00180000-5605-1f9a-d36a-86ed24324115	000c0000-5605-1f9a-c910-d1e9bbc0dc1b	00090000-5605-1f9a-b1e4-73ba5f2f56f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1f9a-21d0-50f3b7b01720	00180000-5605-1f9a-d36a-86ed24324115	000c0000-5605-1f9a-aaec-9d8fe0b96f31	00090000-5605-1f9a-27e7-6a153af612d7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-1f9a-f4e5-33eee125073a	00180000-5605-1f9a-0e33-222bdee1d9f5	\N	00090000-5605-1f9a-27e7-6a153af612d7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3017 (class 0 OID 20644492)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5605-1f98-49ad-2efd7e588d58	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5605-1f98-3b8e-b54ffd57a3e1	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5605-1f98-2c49-65075f974f26	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5605-1f98-d64f-c3abc5c70a36	04	Režija	Režija	Režija	umetnik	30
000f0000-5605-1f98-af3f-c0d578dbd546	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5605-1f98-8f32-27e04bea64a3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5605-1f98-f86b-2b548adbd480	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5605-1f98-79e2-8b857c879102	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5605-1f98-e3d7-6e5e5249fcc7	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5605-1f98-bdcb-2b6883f2939e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5605-1f98-2a52-d0f21705dbb6	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5605-1f98-1f76-671ea96fec28	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5605-1f98-c467-40676f33b915	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5605-1f98-c3ce-196e5e944ad3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5605-1f98-887e-befe50421e26	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5605-1f98-d50a-87124ae4bad5	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5605-1f98-aeca-bb97d89770b4	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5605-1f98-4ca5-b1a76dedfacb	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3030 (class 0 OID 20644738)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5605-1f98-ad93-79dab6a4e485	01	Velika predstava	f	1.00	1.00
002b0000-5605-1f98-7494-cae2e078fd1b	02	Mala predstava	f	0.50	0.50
002b0000-5605-1f98-7b34-134b729e895d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5605-1f98-40c5-9da7ca2a528b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5605-1f98-f048-eec243ea7d91	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2983 (class 0 OID 20644134)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 20643981)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5605-1f98-21c9-83f3f7f621f2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROmd8dbTyNDplAf471k9oNkry1Tx3/elC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-dbb6-04b1f8042250	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-60ea-d1268ddbed93	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-be4b-254411dbdbe9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-377d-80d49b368925	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-be91-908a0e50e6d0	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-6086-d5828d98d4d9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-c1ca-26c48a552ca1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-1beb-847757db3a7d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-de3a-95c1ffd5ca50	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5605-1f9a-c8e4-abc30b4e1ac1	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5605-1f98-f171-e7fd05294c26	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3021 (class 0 OID 20644542)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5605-1f9a-1cdf-38b64bdcd7b0	00160000-5605-1f9a-4fe5-ad4d5cd436d9	\N	00140000-5605-1f98-52e5-6f42f5b5f70c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5605-1f9a-4040-2f8d35703c32
000e0000-5605-1f9a-b008-5a33737748dd	00160000-5605-1f9a-7e14-35135b4506ad	\N	00140000-5605-1f98-f4cd-55e07fdbcf63	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5605-1f9a-4f69-7e38725f775e
000e0000-5605-1f9a-b72c-5f32d531ecf3	\N	\N	00140000-5605-1f98-f4cd-55e07fdbcf63	00190000-5605-1f9a-52fe-a9b2d78a98f9	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-1f9a-4040-2f8d35703c32
000e0000-5605-1f9a-249e-e2207fecc269	\N	\N	00140000-5605-1f98-f4cd-55e07fdbcf63	00190000-5605-1f9a-52fe-a9b2d78a98f9	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-1f9a-4040-2f8d35703c32
000e0000-5605-1f9a-05f0-678688a05ed9	\N	\N	00140000-5605-1f98-f4cd-55e07fdbcf63	00190000-5605-1f9a-52fe-a9b2d78a98f9	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-1f9a-42ac-b040b562ef00
000e0000-5605-1f9a-62ad-22dc2dd77562	\N	\N	00140000-5605-1f98-f4cd-55e07fdbcf63	00190000-5605-1f9a-52fe-a9b2d78a98f9	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-1f9a-42ac-b040b562ef00
\.


--
-- TOC entry 2990 (class 0 OID 20644224)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5605-1f9a-7a8a-aa5c23e56405	000e0000-5605-1f9a-b008-5a33737748dd	\N	1	
00200000-5605-1f9a-442c-81693b815080	000e0000-5605-1f9a-b008-5a33737748dd	\N	2	
00200000-5605-1f9a-3ee0-f567058bae06	000e0000-5605-1f9a-b008-5a33737748dd	\N	3	
00200000-5605-1f9a-fbf3-f2d50066b032	000e0000-5605-1f9a-b008-5a33737748dd	\N	4	
00200000-5605-1f9a-342e-35b2adb98747	000e0000-5605-1f9a-b008-5a33737748dd	\N	5	
\.


--
-- TOC entry 3004 (class 0 OID 20644352)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20644465)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5605-1f98-e336-1f90c10e7db8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5605-1f98-8e69-57c722f620fe	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5605-1f98-62bb-c91bac4bb75b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5605-1f98-34a7-aae37373a7f0	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5605-1f98-c896-5e8ff652b697	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5605-1f98-6cd4-1120512c2020	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5605-1f98-0a6f-47e4a3bd287e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5605-1f98-4c0e-e03772f9554d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5605-1f98-9fad-2b2f60937c36	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5605-1f98-a5b8-d2cd6bfd9373	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5605-1f98-6ae4-e97ddac705ea	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5605-1f98-12b9-90da1537ec72	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5605-1f98-3daa-4c05b0d5ca48	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5605-1f98-435f-8eed339140c9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5605-1f98-783e-cff6c11121cb	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5605-1f98-962f-0213c9b50685	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5605-1f98-811d-3d9d00dcc5e9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5605-1f98-27ec-8cca1a7f55b5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5605-1f98-04ed-779767dc67e6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5605-1f98-0d74-ca77f15c546c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5605-1f98-208f-7f419ccc9ee1	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5605-1f98-de65-3cc440fb2c6c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5605-1f98-4d25-09d123cfc9de	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5605-1f98-55c8-e01c65c69da4	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5605-1f98-6d1a-30959c9030e2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5605-1f98-1800-556b21bf5b9c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5605-1f98-c17c-67a0a464ee15	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5605-1f98-aa3f-c0b05dbd0e92	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3033 (class 0 OID 20644785)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20644757)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20644797)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20644424)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5605-1f9a-ef82-4256c42715c7	00090000-5605-1f9a-ec7a-364f50ed6c00	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1f9a-bb04-39d58750b5ba	00090000-5605-1f9a-a7b6-bb9318537393	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1f9a-caf2-3bbfd0f3cad9	00090000-5605-1f9a-701b-e216e3c5fdbf	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1f9a-8be3-6884b02e9f7b	00090000-5605-1f9a-469d-6e998862050a	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1f9a-8dec-647c6c56ee93	00090000-5605-1f9a-5719-1392d18ad702	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-1f9a-8bd3-d6fb7dfa1632	00090000-5605-1f9a-5f3c-60bb296f4f08	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2992 (class 0 OID 20644260)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 20644532)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5605-1f98-52e5-6f42f5b5f70c	01	Drama	drama (SURS 01)
00140000-5605-1f98-6712-82e3aaa75f50	02	Opera	opera (SURS 02)
00140000-5605-1f98-64bc-7d17e2ec30a9	03	Balet	balet (SURS 03)
00140000-5605-1f98-838d-4bb820a65079	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5605-1f98-75d5-529cb189fb61	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5605-1f98-f4cd-55e07fdbcf63	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5605-1f98-0651-9ec90d2bb6fa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3010 (class 0 OID 20644414)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2497 (class 2606 OID 20644035)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 20644591)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 20644581)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 20644448)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 20644490)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 20644837)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 20644249)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20644270)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 20644755)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 20644160)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 20644646)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 20644410)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 20644222)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 20644198)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 20644174)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 20644317)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 20644814)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 20644821)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2751 (class 2606 OID 20644845)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 20579803)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2609 (class 2606 OID 20644344)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 20644132)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 20644044)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 20644068)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 20644024)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2488 (class 2606 OID 20644009)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 20644350)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 20644386)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 20644527)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 20644096)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 20644120)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 20644707)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 20644323)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 20644110)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 20644210)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 20644335)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 20644716)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 20644724)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 20644694)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20644736)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 20644368)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 20644308)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 20644299)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 20644514)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20644441)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 20644186)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 20643980)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 20644377)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 20643998)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2490 (class 2606 OID 20644018)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20644395)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20644330)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 20644279)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 20643968)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 20643956)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 20643950)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20644461)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20644077)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 20644290)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 20644501)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 20644748)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 20644145)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20643993)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20644560)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 20644232)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 20644358)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20644473)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 20644795)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 20644779)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 20644803)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 20644432)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20644264)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 20644540)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 20644422)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 1259 OID 20644258)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2562 (class 1259 OID 20644259)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2563 (class 1259 OID 20644257)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2564 (class 1259 OID 20644256)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2565 (class 1259 OID 20644255)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2651 (class 1259 OID 20644462)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2652 (class 1259 OID 20644463)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 20644464)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2737 (class 1259 OID 20644816)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2738 (class 1259 OID 20644815)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2511 (class 1259 OID 20644098)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2610 (class 1259 OID 20644351)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2724 (class 1259 OID 20644783)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2725 (class 1259 OID 20644782)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2726 (class 1259 OID 20644784)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2727 (class 1259 OID 20644781)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2728 (class 1259 OID 20644780)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2604 (class 1259 OID 20644337)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2605 (class 1259 OID 20644336)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2556 (class 1259 OID 20644233)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20644411)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 20644413)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2636 (class 1259 OID 20644412)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2536 (class 1259 OID 20644176)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 20644175)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2715 (class 1259 OID 20644737)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2667 (class 1259 OID 20644529)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2668 (class 1259 OID 20644530)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2669 (class 1259 OID 20644531)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2734 (class 1259 OID 20644804)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2676 (class 1259 OID 20644565)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2677 (class 1259 OID 20644562)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2678 (class 1259 OID 20644566)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2679 (class 1259 OID 20644564)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2680 (class 1259 OID 20644563)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2526 (class 1259 OID 20644147)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 20644146)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2502 (class 1259 OID 20644071)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 20644378)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2492 (class 1259 OID 20644025)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2493 (class 1259 OID 20644026)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2627 (class 1259 OID 20644398)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2628 (class 1259 OID 20644397)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 20644396)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2549 (class 1259 OID 20644211)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 20644212)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2472 (class 1259 OID 20643958)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2584 (class 1259 OID 20644303)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2585 (class 1259 OID 20644301)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2586 (class 1259 OID 20644300)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2587 (class 1259 OID 20644302)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2483 (class 1259 OID 20643999)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2484 (class 1259 OID 20644000)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2613 (class 1259 OID 20644359)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 20644838)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2649 (class 1259 OID 20644450)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 20644449)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2748 (class 1259 OID 20644846)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2749 (class 1259 OID 20644847)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2599 (class 1259 OID 20644324)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2643 (class 1259 OID 20644442)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2644 (class 1259 OID 20644443)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 20644651)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2698 (class 1259 OID 20644650)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2699 (class 1259 OID 20644647)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2700 (class 1259 OID 20644648)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2701 (class 1259 OID 20644649)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2515 (class 1259 OID 20644112)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 20644111)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2517 (class 1259 OID 20644113)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 20644372)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2617 (class 1259 OID 20644371)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2707 (class 1259 OID 20644717)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2708 (class 1259 OID 20644718)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2690 (class 1259 OID 20644595)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2691 (class 1259 OID 20644596)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2692 (class 1259 OID 20644593)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2693 (class 1259 OID 20644594)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2640 (class 1259 OID 20644433)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2590 (class 1259 OID 20644312)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2591 (class 1259 OID 20644311)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2592 (class 1259 OID 20644309)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2593 (class 1259 OID 20644310)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2686 (class 1259 OID 20644583)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2687 (class 1259 OID 20644582)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2540 (class 1259 OID 20644187)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2543 (class 1259 OID 20644201)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2544 (class 1259 OID 20644200)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2545 (class 1259 OID 20644199)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2546 (class 1259 OID 20644202)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2555 (class 1259 OID 20644223)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2704 (class 1259 OID 20644708)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2723 (class 1259 OID 20644756)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2741 (class 1259 OID 20644822)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2742 (class 1259 OID 20644823)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2498 (class 1259 OID 20644046)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2499 (class 1259 OID 20644045)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2507 (class 1259 OID 20644078)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2508 (class 1259 OID 20644079)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2571 (class 1259 OID 20644265)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20644293)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2580 (class 1259 OID 20644292)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2581 (class 1259 OID 20644291)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 20644251)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2567 (class 1259 OID 20644252)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2568 (class 1259 OID 20644250)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2569 (class 1259 OID 20644254)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2570 (class 1259 OID 20644253)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2514 (class 1259 OID 20644097)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20644161)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 20644163)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2534 (class 1259 OID 20644162)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2535 (class 1259 OID 20644164)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2598 (class 1259 OID 20644318)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2672 (class 1259 OID 20644528)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2681 (class 1259 OID 20644561)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20644502)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 20644503)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2505 (class 1259 OID 20644069)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 20644070)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2637 (class 1259 OID 20644423)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 20643969)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 20644133)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2475 (class 1259 OID 20643957)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2720 (class 1259 OID 20644749)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 20644370)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2621 (class 1259 OID 20644369)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 20644592)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 20644121)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 20644541)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2731 (class 1259 OID 20644796)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2713 (class 1259 OID 20644725)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 20644726)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2660 (class 1259 OID 20644491)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2578 (class 1259 OID 20644280)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2491 (class 1259 OID 20644019)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2782 (class 2606 OID 20644978)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2781 (class 2606 OID 20644983)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2777 (class 2606 OID 20645003)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2783 (class 2606 OID 20644973)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2779 (class 2606 OID 20644993)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2778 (class 2606 OID 20644998)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2780 (class 2606 OID 20644988)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2818 (class 2606 OID 20645168)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2817 (class 2606 OID 20645173)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2816 (class 2606 OID 20645178)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2850 (class 2606 OID 20645343)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2851 (class 2606 OID 20645338)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2763 (class 2606 OID 20644903)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 20645088)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2845 (class 2606 OID 20645323)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 20645318)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2844 (class 2606 OID 20645328)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2847 (class 2606 OID 20645313)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2848 (class 2606 OID 20645308)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2798 (class 2606 OID 20645083)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2799 (class 2606 OID 20645078)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 20644968)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 20645128)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 20645138)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2809 (class 2606 OID 20645133)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2769 (class 2606 OID 20644938)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 20644933)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2796 (class 2606 OID 20645068)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20645298)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2821 (class 2606 OID 20645183)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 20645188)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2819 (class 2606 OID 20645193)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2849 (class 2606 OID 20645333)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2823 (class 2606 OID 20645213)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2826 (class 2606 OID 20645198)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2822 (class 2606 OID 20645218)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2824 (class 2606 OID 20645208)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2825 (class 2606 OID 20645203)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2767 (class 2606 OID 20644928)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20644923)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 20644888)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2760 (class 2606 OID 20644883)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2804 (class 2606 OID 20645108)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 20644863)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2755 (class 2606 OID 20644868)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2805 (class 2606 OID 20645123)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2806 (class 2606 OID 20645118)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2807 (class 2606 OID 20645113)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2774 (class 2606 OID 20644953)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 20644958)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2752 (class 2606 OID 20644848)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2788 (class 2606 OID 20645043)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2790 (class 2606 OID 20645033)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2791 (class 2606 OID 20645028)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2789 (class 2606 OID 20645038)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2754 (class 2606 OID 20644853)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2753 (class 2606 OID 20644858)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2801 (class 2606 OID 20645093)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2854 (class 2606 OID 20645358)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 20645163)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2815 (class 2606 OID 20645158)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2856 (class 2606 OID 20645363)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2855 (class 2606 OID 20645368)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2797 (class 2606 OID 20645073)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2813 (class 2606 OID 20645148)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2812 (class 2606 OID 20645153)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 20645273)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 20645268)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 20645253)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2836 (class 2606 OID 20645258)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2835 (class 2606 OID 20645263)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2765 (class 2606 OID 20644913)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20644908)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 20644918)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 20645103)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2803 (class 2606 OID 20645098)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20645283)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2839 (class 2606 OID 20645288)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2830 (class 2606 OID 20645243)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2829 (class 2606 OID 20645248)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2832 (class 2606 OID 20645233)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2831 (class 2606 OID 20645238)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2811 (class 2606 OID 20645143)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 20645063)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2793 (class 2606 OID 20645058)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2795 (class 2606 OID 20645048)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2794 (class 2606 OID 20645053)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 20645228)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2828 (class 2606 OID 20645223)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2771 (class 2606 OID 20644943)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2772 (class 2606 OID 20644948)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 20644963)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2838 (class 2606 OID 20645278)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 20645293)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 20645303)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2853 (class 2606 OID 20645348)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2852 (class 2606 OID 20645353)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2757 (class 2606 OID 20644878)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 20644873)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2762 (class 2606 OID 20644893)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 20644898)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2784 (class 2606 OID 20645008)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20645023)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 20645018)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2787 (class 2606 OID 20645013)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-25 12:19:09 CEST

--
-- PostgreSQL database dump complete
--

