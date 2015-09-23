--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-23 14:49:36 CEST

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
-- TOC entry 181 (class 1259 OID 20556980)
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
-- TOC entry 229 (class 1259 OID 20557538)
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
-- TOC entry 228 (class 1259 OID 20557521)
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
-- TOC entry 219 (class 1259 OID 20557398)
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
-- TOC entry 222 (class 1259 OID 20557428)
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
-- TOC entry 243 (class 1259 OID 20557777)
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
-- TOC entry 197 (class 1259 OID 20557187)
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
-- TOC entry 199 (class 1259 OID 20557219)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20557703)
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
-- TOC entry 190 (class 1259 OID 20557101)
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
-- TOC entry 230 (class 1259 OID 20557551)
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
-- TOC entry 215 (class 1259 OID 20557352)
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
-- TOC entry 195 (class 1259 OID 20557166)
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
-- TOC entry 193 (class 1259 OID 20557141)
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
-- TOC entry 191 (class 1259 OID 20557118)
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
-- TOC entry 204 (class 1259 OID 20557266)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20557758)
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
-- TOC entry 242 (class 1259 OID 20557770)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20557792)
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
-- TOC entry 208 (class 1259 OID 20557291)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20557075)
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
-- TOC entry 182 (class 1259 OID 20556989)
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
-- TOC entry 183 (class 1259 OID 20557000)
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
-- TOC entry 178 (class 1259 OID 20556954)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20556973)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20557298)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20557332)
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
-- TOC entry 225 (class 1259 OID 20557469)
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
-- TOC entry 185 (class 1259 OID 20557033)
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
-- TOC entry 187 (class 1259 OID 20557067)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20557649)
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
-- TOC entry 205 (class 1259 OID 20557272)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20557052)
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
-- TOC entry 194 (class 1259 OID 20557156)
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
-- TOC entry 207 (class 1259 OID 20557284)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20557663)
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
-- TOC entry 234 (class 1259 OID 20557673)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20557606)
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
-- TOC entry 235 (class 1259 OID 20557681)
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
-- TOC entry 211 (class 1259 OID 20557313)
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
-- TOC entry 203 (class 1259 OID 20557257)
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
-- TOC entry 202 (class 1259 OID 20557247)
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
-- TOC entry 224 (class 1259 OID 20557458)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20557388)
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
-- TOC entry 192 (class 1259 OID 20557130)
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
-- TOC entry 175 (class 1259 OID 20556925)
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
-- TOC entry 174 (class 1259 OID 20556923)
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
-- TOC entry 212 (class 1259 OID 20557326)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20556963)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20556947)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20557340)
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
-- TOC entry 206 (class 1259 OID 20557278)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20557224)
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
-- TOC entry 173 (class 1259 OID 20556912)
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
-- TOC entry 172 (class 1259 OID 20556904)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20556899)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20557405)
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
-- TOC entry 184 (class 1259 OID 20557025)
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
-- TOC entry 201 (class 1259 OID 20557234)
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
-- TOC entry 223 (class 1259 OID 20557446)
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
-- TOC entry 236 (class 1259 OID 20557691)
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
-- TOC entry 189 (class 1259 OID 20557087)
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
-- TOC entry 176 (class 1259 OID 20556934)
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
-- TOC entry 227 (class 1259 OID 20557496)
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
-- TOC entry 196 (class 1259 OID 20557177)
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
-- TOC entry 210 (class 1259 OID 20557305)
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
-- TOC entry 221 (class 1259 OID 20557419)
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
-- TOC entry 239 (class 1259 OID 20557738)
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
-- TOC entry 238 (class 1259 OID 20557710)
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
-- TOC entry 240 (class 1259 OID 20557750)
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
-- TOC entry 217 (class 1259 OID 20557378)
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
-- TOC entry 198 (class 1259 OID 20557213)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20557486)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20557368)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20556928)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2974 (class 0 OID 20556980)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 20557538)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5602-9fde-54a1-65b32fee7dda	000d0000-5602-9fde-c016-7857e9ee08cc	\N	00090000-5602-9fde-b2cf-aec0179cd8e9	000b0000-5602-9fde-1b19-6ab26afb2fe4	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5602-9fde-1784-8b793fce351a	000d0000-5602-9fde-3a74-36f0dd18e5ec	00100000-5602-9fde-65c2-405f802b5480	00090000-5602-9fde-a757-aaa71b7bc90e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5602-9fde-6cdf-77760ec5fea3	000d0000-5602-9fde-25a1-9fc23593a930	00100000-5602-9fde-a387-3dcfe5993881	00090000-5602-9fde-c5c5-82c7bbd49ce4	\N	0003	t	\N	2015-09-23	\N	2	t	\N	f	f
000c0000-5602-9fde-a668-bbf09a73cb9f	000d0000-5602-9fde-66e6-76131d496ecd	\N	00090000-5602-9fde-3627-460f6d7d56be	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5602-9fde-1a53-52a03baf456d	000d0000-5602-9fde-a4c3-010b20505dd1	\N	00090000-5602-9fde-7416-7e1d6e8892f4	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5602-9fde-1d33-17dbf3eff155	000d0000-5602-9fde-7226-98968a585f29	\N	00090000-5602-9fde-1b3c-0245a9947734	000b0000-5602-9fde-0604-0c7ae53af3d2	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5602-9fde-fb15-b0e11fed91c6	000d0000-5602-9fde-aaae-5e409ac5809d	00100000-5602-9fde-b5fe-4616e72261a2	00090000-5602-9fde-3d70-df7bfc5a4df3	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5602-9fde-cb53-4d6a034227fe	000d0000-5602-9fde-7861-dcd493b4db17	\N	00090000-5602-9fde-55b0-fff90f738a05	000b0000-5602-9fde-916b-9676cdab9abd	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5602-9fde-2e2b-916960cf446f	000d0000-5602-9fde-aaae-5e409ac5809d	00100000-5602-9fde-ab47-abd09ece212f	00090000-5602-9fde-02c7-de5cbef420ba	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5602-9fde-63dd-506f93b8e9b7	000d0000-5602-9fde-aaae-5e409ac5809d	00100000-5602-9fde-4591-42c9078e4004	00090000-5602-9fde-1a14-d8654d0f4965	\N	0010	t	\N	2015-09-23	\N	16	f	\N	f	t
000c0000-5602-9fde-25c8-1af9f0495a4f	000d0000-5602-9fde-aaae-5e409ac5809d	00100000-5602-9fde-0dcf-2b486b38cd85	00090000-5602-9fde-1200-6556e459ddcd	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5602-9fde-f15d-0c334dbd7368	000d0000-5602-9fde-87bc-8a3e3e0d94c8	\N	00090000-5602-9fde-a757-aaa71b7bc90e	000b0000-5602-9fde-6b19-46e097470e76	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3021 (class 0 OID 20557521)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20557398)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5602-9fde-b268-b8c772527d13	00160000-5602-9fdd-39ac-8d00b311f8dc	00090000-5602-9fde-7e97-49c52aa1bb14	Avtor originala	10	t
003d0000-5602-9fde-dcb8-9d3204d5c3bd	00160000-5602-9fdd-39ac-8d00b311f8dc	00090000-5602-9fde-819d-d245cf9230c9	Predelava	14	t
003d0000-5602-9fde-e317-aef0d1e78543	00160000-5602-9fdd-1826-f2c359402cab	00090000-5602-9fde-44d6-8bdf39aaec6d	Avtor originala	11	t
003d0000-5602-9fde-bc97-ca2701ad32af	00160000-5602-9fdd-4c1a-8fd53d8ae4b5	00090000-5602-9fde-5dd9-a109b3223b54	Avtor originala	12	t
003d0000-5602-9fde-c72e-0efdcb2d4b19	00160000-5602-9fdd-39ac-8d00b311f8dc	00090000-5602-9fde-47b0-e09be4a10bc3	Predelava	18	f
\.


--
-- TOC entry 3015 (class 0 OID 20557428)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5602-9fdd-39ac-8d00b311f8dc	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5602-9fdd-1826-f2c359402cab	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5602-9fdd-4c1a-8fd53d8ae4b5	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3036 (class 0 OID 20557777)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 20557187)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5602-9fde-7f7b-42580db62ecb	\N	\N	00200000-5602-9fde-67e0-c957f81969b1	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5602-9fde-b1f6-e7ccb947906d	\N	\N	00200000-5602-9fde-4cda-5e09d2599501	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5602-9fde-170b-0dacb3ce2c1d	\N	\N	00200000-5602-9fde-ba24-37d92593d4f4	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5602-9fde-67e1-5438ec5aa08b	\N	\N	00200000-5602-9fde-d9cf-1752466d832c	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5602-9fde-b6df-ff5ebb1dbb52	\N	\N	00200000-5602-9fde-ca24-1c03ef6c3e44	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2992 (class 0 OID 20557219)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20557703)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20557101)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5602-9fdc-63b1-f0223a969252	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5602-9fdc-3ab0-7a272a83ac4e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5602-9fdc-ef27-977ce6e8c075	AL	ALB	008	Albania 	Albanija	\N
00040000-5602-9fdc-0d45-703ed712fc53	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5602-9fdc-a590-4ef01b69d9fe	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5602-9fdc-18ec-9f7418797ce4	AD	AND	020	Andorra 	Andora	\N
00040000-5602-9fdc-e8ab-d88b037bc1f1	AO	AGO	024	Angola 	Angola	\N
00040000-5602-9fdc-58b4-44c7b6273c3e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5602-9fdc-98d2-9609a5888170	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5602-9fdc-ad97-a55c039d461b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-9fdc-9321-83dfc8713861	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5602-9fdc-d989-7350dd9627e6	AM	ARM	051	Armenia 	Armenija	\N
00040000-5602-9fdc-69c2-61786de9c9a1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5602-9fdc-0e6d-f6c7f186de90	AU	AUS	036	Australia 	Avstralija	\N
00040000-5602-9fdc-141c-aa47169d0205	AT	AUT	040	Austria 	Avstrija	\N
00040000-5602-9fdc-3f97-fc0ed53e4e03	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5602-9fdc-b81e-bc64c9c63c5d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5602-9fdc-442e-5e29ee7f390e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5602-9fdc-4d14-1a60866f516d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5602-9fdc-c56a-5103c7cbe605	BB	BRB	052	Barbados 	Barbados	\N
00040000-5602-9fdc-cb86-ce4923bea2f4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5602-9fdc-ff71-6893f5d85c0c	BE	BEL	056	Belgium 	Belgija	\N
00040000-5602-9fdc-04be-f93ca9760095	BZ	BLZ	084	Belize 	Belize	\N
00040000-5602-9fdc-44de-07d6905bd200	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5602-9fdc-45ae-8e7f0bc279fe	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5602-9fdc-5b85-53201c1940c3	BT	BTN	064	Bhutan 	Butan	\N
00040000-5602-9fdc-7a28-e737fcd7e246	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5602-9fdc-0d52-2572612d113a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5602-9fdc-dc08-34db90814d8b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5602-9fdc-3a8e-1c207359c0c1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5602-9fdc-90d9-de921e9acd9e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5602-9fdc-72c7-af33f99ec456	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5602-9fdc-d45a-7fd909387ae3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5602-9fdc-2e7a-6ec6772327af	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5602-9fdc-da8d-96692dfa7b1b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5602-9fdc-a29a-bb16161e51dd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5602-9fdc-8c89-bc5588b5ba99	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5602-9fdc-803b-b2f3ca306851	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5602-9fdc-b1b3-bdb409fba094	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5602-9fdc-bf59-b7555e0de967	CA	CAN	124	Canada 	Kanada	\N
00040000-5602-9fdc-7a88-9d79c9065771	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5602-9fdc-1a33-66f1545c7074	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5602-9fdc-76d9-195c9396a371	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5602-9fdc-3398-800b44cfc178	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5602-9fdc-7e57-afcf95eaf390	CL	CHL	152	Chile 	Čile	\N
00040000-5602-9fdc-95fc-34debd7fcdfe	CN	CHN	156	China 	Kitajska	\N
00040000-5602-9fdc-0bdd-17a6cb32a968	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5602-9fdc-6571-081d22c5c6a9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5602-9fdc-69c4-ba8e938f71b2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5602-9fdc-02c4-c32fbe17ceee	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5602-9fdc-0f53-33c8107b70c8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5602-9fdc-8b10-76853551ebab	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5602-9fdc-5830-62c8bb11d17c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5602-9fdc-6b31-c04848082b63	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5602-9fdc-1ea9-5c888bc8bf2b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5602-9fdc-30af-505ecaa8db93	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5602-9fdc-a9f2-3c9f3f0e7d02	CU	CUB	192	Cuba 	Kuba	\N
00040000-5602-9fdc-e50e-69e0f20cf180	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5602-9fdc-8c72-978c7ae56381	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5602-9fdc-24b2-2200e431dd63	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5602-9fdc-30b3-38f9a46e92a2	DK	DNK	208	Denmark 	Danska	\N
00040000-5602-9fdc-2f7f-173a62f03495	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5602-9fdc-9dce-ee300a26a86f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-9fdc-ff40-7cee1f0dae01	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5602-9fdc-9780-931e856d1d73	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5602-9fdc-93f9-61a798f936bb	EG	EGY	818	Egypt 	Egipt	\N
00040000-5602-9fdc-6cd5-4df0e0b0c775	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5602-9fdc-0c9d-92a8d4ee6381	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5602-9fdc-7d29-f7f198792ee7	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5602-9fdc-5d72-d1ec6e7b9d53	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5602-9fdc-b933-44cf28ea60de	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5602-9fdc-89e9-d6dd9ddcd3ad	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5602-9fdc-0004-bc34cd3be278	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5602-9fdc-f215-a7e5d59403b9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5602-9fdc-7a9b-63004bbd64df	FI	FIN	246	Finland 	Finska	\N
00040000-5602-9fdc-564b-b1d4c2e0121b	FR	FRA	250	France 	Francija	\N
00040000-5602-9fdc-cdbb-6c70abe47fc2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5602-9fdc-c935-a50522aeca09	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5602-9fdc-d673-b0239d37e10b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5602-9fdc-9a2c-9b4aef62d708	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5602-9fdc-bd50-c3297a787c4a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5602-9fdc-34a1-0d9db3e88716	GM	GMB	270	Gambia 	Gambija	\N
00040000-5602-9fdc-ec27-61377f4c38b3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5602-9fdc-6246-f72475f9d715	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5602-9fdc-9062-c28be9f6680c	GH	GHA	288	Ghana 	Gana	\N
00040000-5602-9fdc-1fc9-f675d19d2950	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5602-9fdc-4bc0-e3d0e9b8d88a	GR	GRC	300	Greece 	Grčija	\N
00040000-5602-9fdc-050b-787380ff8125	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5602-9fdc-d77e-1fd1837e794a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5602-9fdc-c22a-670df5c783cd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5602-9fdc-1f64-0e0d6bf2c6f2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5602-9fdc-0991-1aa6c1f1d6f3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5602-9fdc-6302-ec9577773c56	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5602-9fdc-1451-cc66ea766431	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5602-9fdc-cfb6-05bc22d8adfa	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5602-9fdc-0195-876a9d589052	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5602-9fdc-e890-5130747da10a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5602-9fdc-5048-04742bf8a505	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5602-9fdc-8dd7-7e5ca0aea653	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5602-9fdc-eaeb-66ef9bead4a2	HN	HND	340	Honduras 	Honduras	\N
00040000-5602-9fdc-a5a1-75f52359b043	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5602-9fdc-e207-93904e6ea853	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5602-9fdc-6e95-da42fc675f13	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5602-9fdc-844f-fc1d8c54bfc7	IN	IND	356	India 	Indija	\N
00040000-5602-9fdc-d014-5d94bcb8e40e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5602-9fdc-d27f-36e8e436b6d1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5602-9fdc-c1c6-6e38681a9060	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5602-9fdc-c75d-113fb3c6b9d9	IE	IRL	372	Ireland 	Irska	\N
00040000-5602-9fdc-3b7a-4d2821f8b2a0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5602-9fdc-39da-a1b41ed9856c	IL	ISR	376	Israel 	Izrael	\N
00040000-5602-9fdc-2266-61d0540a42d4	IT	ITA	380	Italy 	Italija	\N
00040000-5602-9fdc-a034-581904b99b09	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5602-9fdc-e3ae-4e7319e009ee	JP	JPN	392	Japan 	Japonska	\N
00040000-5602-9fdc-0810-0b7afcee2792	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5602-9fdc-4452-3dd021a4f121	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5602-9fdc-fe7e-8590a0e36596	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5602-9fdc-63ae-269d21afd800	KE	KEN	404	Kenya 	Kenija	\N
00040000-5602-9fdc-6f81-c971f46120ce	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5602-9fdc-c48f-6f675fae04f3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5602-9fdc-2508-c3841fd70ff8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5602-9fdc-4eba-b7613d17e60a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5602-9fdc-cbc2-8bc55f0c49be	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5602-9fdc-5c27-5396239a8a05	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5602-9fdc-ede6-8e05e51bdec7	LV	LVA	428	Latvia 	Latvija	\N
00040000-5602-9fdc-46dd-33bfbf6232c2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5602-9fdc-c577-3877a9539de8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5602-9fdc-560f-584a46493e80	LR	LBR	430	Liberia 	Liberija	\N
00040000-5602-9fdc-600a-0d5e2494645e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5602-9fdc-9861-1371e90af4e9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5602-9fdc-7736-a8f85f400b59	LT	LTU	440	Lithuania 	Litva	\N
00040000-5602-9fdc-a7c5-c79f25ac3a8b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5602-9fdc-4d4a-d71a4a675eac	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5602-9fdc-ccf7-df75c73ba143	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5602-9fdc-3f94-b3805a4190a5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5602-9fdc-f966-a13aadd4257f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5602-9fdc-5cad-129add7fb482	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5602-9fdc-5d88-53a62e1385f0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5602-9fdc-fa3b-089c67328cc1	ML	MLI	466	Mali 	Mali	\N
00040000-5602-9fdc-4fae-004f5e8170c9	MT	MLT	470	Malta 	Malta	\N
00040000-5602-9fdc-6a44-163e048f72d1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5602-9fdc-dffe-36d920d19250	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5602-9fdc-1d4a-dc6ed7b08f4b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5602-9fdc-92e7-826ae31ea375	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5602-9fdc-f0b7-e97c3a4805a6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5602-9fdc-33aa-5a706364ec64	MX	MEX	484	Mexico 	Mehika	\N
00040000-5602-9fdc-0521-c51a3ae02301	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5602-9fdc-49ba-6903139365c8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5602-9fdc-8047-d99bae090278	MC	MCO	492	Monaco 	Monako	\N
00040000-5602-9fdc-6514-ce6f91da7dbe	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5602-9fdc-df18-aa346508ef14	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5602-9fdc-b965-d868adf90e1b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5602-9fdc-38bc-631a4ddaaf56	MA	MAR	504	Morocco 	Maroko	\N
00040000-5602-9fdc-4b77-60c56ed4e0cd	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5602-9fdc-40a2-2fde8da51249	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5602-9fdc-ed00-6b10584ffbe4	NA	NAM	516	Namibia 	Namibija	\N
00040000-5602-9fdc-99d9-533779e7949d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5602-9fdc-07e6-01adb2ce268c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5602-9fdc-dc85-ef7f757b8011	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5602-9fdc-10ea-17ca4dca20dd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5602-9fdc-278c-9a41f9dd63e1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5602-9fdc-73b0-f1e3cf785892	NE	NER	562	Niger 	Niger 	\N
00040000-5602-9fdc-c9f8-7f1f7559fb38	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5602-9fdc-97fd-2f54dfeb85d4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5602-9fdc-da5b-3735754c88e9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5602-9fdc-1fa7-97804187afa7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5602-9fdc-af09-041675268f3b	NO	NOR	578	Norway 	Norveška	\N
00040000-5602-9fdc-5563-cfad3d0a8e52	OM	OMN	512	Oman 	Oman	\N
00040000-5602-9fdc-acfc-43dc8ee970aa	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5602-9fdc-ecfa-4f5f1c68f9f9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5602-9fdc-4f1e-1398349a893a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5602-9fdc-3cf9-2722c0abb484	PA	PAN	591	Panama 	Panama	\N
00040000-5602-9fdc-aab2-87bea1520e7d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5602-9fdc-280d-0c525b6a9c68	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5602-9fdc-6337-f0ce7710ec7c	PE	PER	604	Peru 	Peru	\N
00040000-5602-9fdc-2682-ea8db657e643	PH	PHL	608	Philippines 	Filipini	\N
00040000-5602-9fdc-39b4-5caff7926774	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5602-9fdc-88f4-fd0d8128585d	PL	POL	616	Poland 	Poljska	\N
00040000-5602-9fdc-eef8-98b8d04caea1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5602-9fdc-24d7-53067b68e0bb	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5602-9fdc-e7ba-3a4050dfacd2	QA	QAT	634	Qatar 	Katar	\N
00040000-5602-9fdc-591e-d1401d4e1b59	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5602-9fdc-689b-88ed69bf56da	RO	ROU	642	Romania 	Romunija	\N
00040000-5602-9fdc-2dee-6e4e4bfc0197	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5602-9fdc-9bbe-204e8d24b137	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5602-9fdc-cfce-1fafff1e73a5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5602-9fdc-a506-431b5f40c35b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5602-9fdc-bba6-a7a4fa7e28ae	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5602-9fdc-56d4-4183f0f5affe	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5602-9fdc-3c3a-c8b96b0afbe0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5602-9fdc-4008-4161ddea129a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5602-9fdc-ea61-55476cafcf5e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5602-9fdc-04fd-40ee0a662408	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5602-9fdc-27ec-bf899c8cf516	SM	SMR	674	San Marino 	San Marino	\N
00040000-5602-9fdc-d86d-356ed46a2dc5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5602-9fdc-5015-558679f42d4f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5602-9fdc-c02a-a89e486ce320	SN	SEN	686	Senegal 	Senegal	\N
00040000-5602-9fdc-4700-8c6326552254	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5602-9fdc-f44a-136d60fc3d7a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5602-9fdc-70bd-9138c4312a7a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5602-9fdc-9c9f-f25eae07fc68	SG	SGP	702	Singapore 	Singapur	\N
00040000-5602-9fdc-4455-8a5dca34eae7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5602-9fdc-b035-5155c684c03d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5602-9fdc-9360-de4d6d002bae	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5602-9fdc-c39e-dd7396e0d033	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5602-9fdc-c27b-59117df557d6	SO	SOM	706	Somalia 	Somalija	\N
00040000-5602-9fdc-130f-53a2b2ba7297	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5602-9fdc-b3cc-58756fb6a2a2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5602-9fdc-197b-b475eb4955ec	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5602-9fdc-e599-9fde29a6ee3b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5602-9fdc-0e14-8973bf951412	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5602-9fdc-e003-9838bcdc88f1	SD	SDN	729	Sudan 	Sudan	\N
00040000-5602-9fdc-cad7-f0edce2c7b06	SR	SUR	740	Suriname 	Surinam	\N
00040000-5602-9fdc-ddf7-6e0e088ba2d9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5602-9fdc-15e9-c2ef9c58f480	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5602-9fdc-5e6b-f4d929f6011c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5602-9fdc-3c94-d6c06043874e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5602-9fdc-fcc7-ba61a632be00	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5602-9fdc-26d5-6d66e8d8f829	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5602-9fdc-fbbd-898590bfd2f3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5602-9fdc-4722-956b8a97efe2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5602-9fdc-1b56-c07949ec2afe	TH	THA	764	Thailand 	Tajska	\N
00040000-5602-9fdc-f2df-5005f4c57225	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5602-9fdc-07f2-7b6a3257a4a8	TG	TGO	768	Togo 	Togo	\N
00040000-5602-9fdc-fa79-5cd4bd40fd68	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5602-9fdc-1bc8-42bf0e0241c3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5602-9fdc-0cfa-1571b1e1b348	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5602-9fdc-9069-a546f18f3ad4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5602-9fdc-79e6-c11b3f9aed18	TR	TUR	792	Turkey 	Turčija	\N
00040000-5602-9fdc-718e-88c5c86c0b8c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5602-9fdc-d1d0-8cc79ca4c456	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-9fdc-0c55-5c2582239d12	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5602-9fdc-9481-3c776bee9a14	UG	UGA	800	Uganda 	Uganda	\N
00040000-5602-9fdc-0a6e-8c162edb275e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5602-9fdc-b27c-29aff425990d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5602-9fdc-4df1-c8386fe94802	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5602-9fdc-11e4-3f87878af093	US	USA	840	United States 	Združene države Amerike	\N
00040000-5602-9fdc-69e6-63306786c879	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5602-9fdc-cbad-a2eef7123f92	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5602-9fdc-89e7-dceaea98a76c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5602-9fdc-aa4e-e648baac0dae	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5602-9fdc-9fa0-b3ecea058f78	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5602-9fdc-0c36-e84ea1378ad0	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5602-9fdc-376f-a0fe34a81146	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-9fdc-c438-c40c176fd188	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5602-9fdc-2b99-1096aa364950	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5602-9fdc-836e-b5f36b4ea9a3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5602-9fdc-61bf-9612e004b214	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5602-9fdc-9188-f4fa0750b366	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5602-9fdc-3fa1-37b48cf7c4fe	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3023 (class 0 OID 20557551)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5602-9fde-34c6-5cb0b1cb0dfe	000e0000-5602-9fde-f71b-8e1e93ca0416	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-9fdb-0df3-287d2006b7d6	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-9fde-e1be-d9134d19ddf8	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-9fdb-6b35-fe780db7c879	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-9fde-8d86-0a5eb068d6d3	000e0000-5602-9fde-e7cb-d5601fb0fe15	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-9fdb-0df3-287d2006b7d6	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-9fde-9e7a-9b30ddda0320	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-9fde-291d-9b095bad3fb8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3008 (class 0 OID 20557352)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5602-9fde-c016-7857e9ee08cc	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-54a1-65b32fee7dda	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-9fdc-a816-62726f823297
000d0000-5602-9fde-3a74-36f0dd18e5ec	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-1784-8b793fce351a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5602-9fdc-5e2a-374c72ebd150
000d0000-5602-9fde-25a1-9fc23593a930	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-6cdf-77760ec5fea3	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5602-9fdc-7014-603796315af1
000d0000-5602-9fde-66e6-76131d496ecd	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-a668-bbf09a73cb9f	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5602-9fdc-825d-7be6174a1379
000d0000-5602-9fde-a4c3-010b20505dd1	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-1a53-52a03baf456d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5602-9fdc-825d-7be6174a1379
000d0000-5602-9fde-7226-98968a585f29	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-1d33-17dbf3eff155	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-9fdc-a816-62726f823297
000d0000-5602-9fde-aaae-5e409ac5809d	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-2e2b-916960cf446f	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5602-9fdc-a816-62726f823297
000d0000-5602-9fde-7861-dcd493b4db17	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-cb53-4d6a034227fe	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5602-9fdc-8e5e-33f56cb6a0d1
000d0000-5602-9fde-87bc-8a3e3e0d94c8	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	000c0000-5602-9fde-f15d-0c334dbd7368	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5602-9fdc-1b6e-ab3579b3d04c
\.


--
-- TOC entry 2988 (class 0 OID 20557166)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20557141)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20557118)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5602-9fde-c016-8e17f4148a51	00080000-5602-9fdd-fcf3-f64094c8b7f5	00090000-5602-9fde-1a14-d8654d0f4965	AK		igralka
\.


--
-- TOC entry 2997 (class 0 OID 20557266)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20557758)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20557770)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 20557792)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19946838)
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
-- TOC entry 3001 (class 0 OID 20557291)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20557075)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5602-9fdc-08a5-914a23303ec6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5602-9fdc-5b49-22af643cdd1c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5602-9fdc-75e1-4f31ba1cb8de	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5602-9fdc-f652-9543a91e5bae	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5602-9fdc-fd19-4ccaeae3228c	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5602-9fdc-c65c-6f38cb995ea2	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5602-9fdc-fdf7-e668f1f739bf	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5602-9fdc-2610-4ad7763284fc	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-9fdc-5fea-e9acb9dcdf55	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-9fdc-c534-cb1d623f6494	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5602-9fdc-e0d6-0f6626a6d62e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5602-9fdc-af75-96fd3d3f4c6f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5602-9fdc-9424-10b2be891c67	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5602-9fdc-b3bd-a5ba14789be8	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5602-9fdd-2165-4b0bd89562fb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5602-9fdd-bfc0-ad32bcbad0a4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5602-9fdd-5b7b-c22b3344d3e7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5602-9fdd-2b8b-29217daba0bb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5602-9fdd-e65e-d256747cd796	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5602-9fdf-cdf0-a82a83f00ee1	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2975 (class 0 OID 20556989)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5602-9fdd-4286-584240d479fb	00000000-5602-9fdd-2165-4b0bd89562fb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5602-9fdd-0e6a-1c9d4bab52e7	00000000-5602-9fdd-2165-4b0bd89562fb	00010000-5602-9fdc-1557-d793ad0a0311	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5602-9fdd-a472-c0575147bb1a	00000000-5602-9fdd-bfc0-ad32bcbad0a4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2976 (class 0 OID 20557000)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5602-9fde-b2cf-aec0179cd8e9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5602-9fde-3627-460f6d7d56be	00010000-5602-9fdd-e7bf-a6ff5ed2fec3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5602-9fde-c5c5-82c7bbd49ce4	00010000-5602-9fdd-178e-0ef561bae363	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5602-9fde-02c7-de5cbef420ba	00010000-5602-9fdd-ff91-2f185f6209b6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5602-9fde-a274-30d82694ff8c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5602-9fde-1b3c-0245a9947734	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5602-9fde-1200-6556e459ddcd	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5602-9fde-3d70-df7bfc5a4df3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5602-9fde-1a14-d8654d0f4965	00010000-5602-9fdd-249a-5f9018273571	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5602-9fde-a757-aaa71b7bc90e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5602-9fde-e38f-964d8d57b944	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-9fde-7416-7e1d6e8892f4	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5602-9fde-55b0-fff90f738a05	00010000-5602-9fdd-6836-787ac4448b0c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-9fde-7e97-49c52aa1bb14	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-9fde-819d-d245cf9230c9	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-9fde-44d6-8bdf39aaec6d	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-9fde-5dd9-a109b3223b54	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5602-9fde-47b0-e09be4a10bc3	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 20556954)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5602-9fdc-f0e4-4a972caa1b0f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5602-9fdc-7710-77a6891118df	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5602-9fdc-6d49-2c9526596a86	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5602-9fdc-62c4-53ce7b4a4bd7	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5602-9fdc-9cb7-18a680d1a2d4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5602-9fdc-5edc-f41e5a568ca6	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5602-9fdc-3786-a15695e6b79c	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5602-9fdc-5bd6-983ed9415d71	Abonma-read	Abonma - branje	f
00030000-5602-9fdc-c1fd-8959d4eee704	Abonma-write	Abonma - spreminjanje	f
00030000-5602-9fdc-75ab-816516fa58de	Alternacija-read	Alternacija - branje	f
00030000-5602-9fdc-c0d1-3fd5aead8ba2	Alternacija-write	Alternacija - spreminjanje	f
00030000-5602-9fdc-fe0e-c802c78e1b4b	Arhivalija-read	Arhivalija - branje	f
00030000-5602-9fdc-96b9-aae34c556422	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5602-9fdc-1675-36284746f0db	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5602-9fdc-c585-9c3b23406088	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5602-9fdc-c4d9-12144b6382f1	Besedilo-read	Besedilo - branje	f
00030000-5602-9fdc-891d-53b056aebbd1	Besedilo-write	Besedilo - spreminjanje	f
00030000-5602-9fdc-d8e9-766aab2db946	DogodekIzven-read	DogodekIzven - branje	f
00030000-5602-9fdc-a6ba-c6ef4e2bf352	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5602-9fdc-b179-4cb57866502d	Dogodek-read	Dogodek - branje	f
00030000-5602-9fdc-31f6-2bdd66a8a73f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5602-9fdc-4cf7-4a64c69dc9b5	DrugiVir-read	DrugiVir - branje	f
00030000-5602-9fdc-ffe6-0c83813082d6	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5602-9fdc-ad27-ead57914ecbf	Drzava-read	Drzava - branje	f
00030000-5602-9fdc-bb0b-54324056b79d	Drzava-write	Drzava - spreminjanje	f
00030000-5602-9fdc-81e0-645800203f62	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5602-9fdc-78a7-0c0c3d884503	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5602-9fdc-0715-ceb102ff3361	Funkcija-read	Funkcija - branje	f
00030000-5602-9fdc-5e8a-cd5f54191991	Funkcija-write	Funkcija - spreminjanje	f
00030000-5602-9fdc-e73c-40113d02c2f4	Gostovanje-read	Gostovanje - branje	f
00030000-5602-9fdc-5043-4c0faf428aa2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5602-9fdc-52ff-b27fcd47b2aa	Gostujoca-read	Gostujoca - branje	f
00030000-5602-9fdc-c918-ae4446ea79a9	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5602-9fdc-ece0-71290412a16c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5602-9fdc-f737-5fea130613af	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5602-9fdc-3380-47a2cb852995	Kupec-read	Kupec - branje	f
00030000-5602-9fdc-6e79-ec71d4a6028b	Kupec-write	Kupec - spreminjanje	f
00030000-5602-9fdc-3fcd-0637396806aa	NacinPlacina-read	NacinPlacina - branje	f
00030000-5602-9fdc-18b5-e1a8ef6e88e7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5602-9fdc-dcaa-855a53724205	Option-read	Option - branje	f
00030000-5602-9fdc-dd90-993c5a7a7953	Option-write	Option - spreminjanje	f
00030000-5602-9fdc-678f-7b6a73443f1e	OptionValue-read	OptionValue - branje	f
00030000-5602-9fdc-cdda-bfd94f9fa995	OptionValue-write	OptionValue - spreminjanje	f
00030000-5602-9fdc-e578-8d906fe4cb71	Oseba-read	Oseba - branje	f
00030000-5602-9fdc-6759-2ddd601c5af1	Oseba-write	Oseba - spreminjanje	f
00030000-5602-9fdc-d277-7baa68df40f9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5602-9fdc-df14-576a27dc05b1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5602-9fdc-09e3-1b989c18d650	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5602-9fdc-1347-0c0591e7b8fb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5602-9fdc-4f03-2053b2b2c270	Pogodba-read	Pogodba - branje	f
00030000-5602-9fdc-37c9-f2871f1ad3c4	Pogodba-write	Pogodba - spreminjanje	f
00030000-5602-9fdc-8a5e-d935bedebffa	Popa-read	Popa - branje	f
00030000-5602-9fdc-9d88-639b23de7da8	Popa-write	Popa - spreminjanje	f
00030000-5602-9fdc-1675-de627eece904	Posta-read	Posta - branje	f
00030000-5602-9fdc-32ab-699a68dc0a6c	Posta-write	Posta - spreminjanje	f
00030000-5602-9fdc-29dd-74ed933ae4bb	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5602-9fdc-3bcd-f1d03a5589f7	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5602-9fdc-3c99-8107539af20a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5602-9fdc-2528-2a1afe4afda4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5602-9fdc-4613-38420d93eb32	PostniNaslov-read	PostniNaslov - branje	f
00030000-5602-9fdc-72d5-363699b8e2cf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5602-9fdc-92c9-005e2c5038b7	Predstava-read	Predstava - branje	f
00030000-5602-9fdc-bea6-0831a76e9017	Predstava-write	Predstava - spreminjanje	f
00030000-5602-9fdc-a8f8-4b7b808c7f05	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5602-9fdc-7a81-f97405a82dab	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5602-9fdc-f2d3-a297a85c88bc	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5602-9fdc-9ef9-ff0f4c1e412c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5602-9fdc-df74-35ffbf04a948	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5602-9fdc-ca32-059dea6acef5	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5602-9fdc-a8c3-c6833916d02c	ProgramDela-read	ProgramDela - branje	f
00030000-5602-9fdc-5460-55dca5c0b1b6	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5602-9fdc-1576-048e530a8dd2	ProgramFestival-read	ProgramFestival - branje	f
00030000-5602-9fdc-d836-0442add7ac5c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5602-9fdc-cb95-0798f10bfc86	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5602-9fdc-a7fa-1a2eeb5bf07d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5602-9fdc-1ade-995e775966d8	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5602-9fdc-75db-92ec2069e1c5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5602-9fdc-59c6-7e24121deb88	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5602-9fdc-bc84-f7c444fc4bff	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5602-9fdc-bab0-1334bf69e9c9	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5602-9fdc-686c-c42a0385879c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5602-9fdc-9b5f-40930e442b06	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5602-9fdc-ef78-4f0e56833ab9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5602-9fdc-070f-f20394284dce	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5602-9fdc-0ad5-4affc45715ed	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5602-9fdc-c4e9-281af3a95649	ProgramRazno-read	ProgramRazno - branje	f
00030000-5602-9fdc-5121-845e132db937	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5602-9fdc-4596-180c1cc8600c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5602-9fdc-4f12-8ec8bed47d38	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5602-9fdc-a862-08b2cb5da337	Prostor-read	Prostor - branje	f
00030000-5602-9fdc-ca67-f29127bccba6	Prostor-write	Prostor - spreminjanje	f
00030000-5602-9fdc-97a3-4dfd9c1c7a7a	Racun-read	Racun - branje	f
00030000-5602-9fdc-cc87-5384fe1dc445	Racun-write	Racun - spreminjanje	f
00030000-5602-9fdc-cd97-e0b60b7b37a5	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5602-9fdc-5bbe-a89b1aa73ec4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5602-9fdc-b8c1-a3df6413192d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5602-9fdc-f3df-1f1fb67c94a7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5602-9fdc-466a-1f30943b6731	Rekvizit-read	Rekvizit - branje	f
00030000-5602-9fdc-150e-579ff8f676fe	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5602-9fdc-5dc6-e5b757c2c320	Revizija-read	Revizija - branje	f
00030000-5602-9fdc-e357-432f3d24b879	Revizija-write	Revizija - spreminjanje	f
00030000-5602-9fdc-b562-5c92e6b284bd	Rezervacija-read	Rezervacija - branje	f
00030000-5602-9fdc-03ac-191aa23339f9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5602-9fdc-33e3-3fb654dabe88	SedezniRed-read	SedezniRed - branje	f
00030000-5602-9fdc-a821-33a1f2d89234	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5602-9fdc-67d1-cdfeb2c2b2cd	Sedez-read	Sedez - branje	f
00030000-5602-9fdc-375e-2e41b4ca8c23	Sedez-write	Sedez - spreminjanje	f
00030000-5602-9fdc-60b6-866d46bcc42f	Sezona-read	Sezona - branje	f
00030000-5602-9fdc-bfe0-0f3730ac1b0a	Sezona-write	Sezona - spreminjanje	f
00030000-5602-9fdc-a7fe-8e0d95537127	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5602-9fdc-b7b2-8c5ef659aae5	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5602-9fdc-0357-4d52a10a26ed	Stevilcenje-read	Stevilcenje - branje	f
00030000-5602-9fdc-e9ce-40cc2656b1f0	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5602-9fdc-6f2d-5f6dae4d434c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5602-9fdc-9ed5-7b5046c54af3	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5602-9fdc-139c-820b3f13bb86	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5602-9fdc-f085-aa7b7e2f2aa9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5602-9fdc-dcd8-72aaf831e711	Telefonska-read	Telefonska - branje	f
00030000-5602-9fdc-b3a6-d7081e1fb22f	Telefonska-write	Telefonska - spreminjanje	f
00030000-5602-9fdc-a508-04e012c847c4	TerminStoritve-read	TerminStoritve - branje	f
00030000-5602-9fdc-0038-be81fe92bf88	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5602-9fdc-8f62-c7ed29221726	TipFunkcije-read	TipFunkcije - branje	f
00030000-5602-9fdc-4f15-ce05a50c5599	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5602-9fdc-0b74-710a31396a3f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5602-9fdc-b2af-b3b268a8151c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5602-9fdc-23e6-df45310fbc97	Trr-read	Trr - branje	f
00030000-5602-9fdc-fe42-d8a595394aff	Trr-write	Trr - spreminjanje	f
00030000-5602-9fdc-1f46-68b3e6627783	Uprizoritev-read	Uprizoritev - branje	f
00030000-5602-9fdc-d1ff-d11f29637350	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5602-9fdc-a96b-ed83739a07b3	Vaja-read	Vaja - branje	f
00030000-5602-9fdc-0fe9-90f40eecdd9f	Vaja-write	Vaja - spreminjanje	f
00030000-5602-9fdc-b6aa-a5ce1c46e37f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5602-9fdc-b97a-eb9062e94631	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5602-9fdc-547a-50cf240fd074	VrstaStroska-read	VrstaStroska - branje	f
00030000-5602-9fdc-d8a1-cfb024b7c374	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5602-9fdc-0715-c47968dd7354	Zaposlitev-read	Zaposlitev - branje	f
00030000-5602-9fdc-7f15-9c086612d196	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5602-9fdc-0f78-b6f24431e4f1	Zasedenost-read	Zasedenost - branje	f
00030000-5602-9fdc-6ad3-50e007a756cb	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5602-9fdc-cc89-54ecb497fd1f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5602-9fdc-1eb0-1e3ef6526b1a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5602-9fdc-b4ef-5c4865a0e3a0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5602-9fdc-7e1c-e1fd2183928b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5602-9fdc-9b8f-a6da2cc58f98	Job-read	Branje opravil - samo zase - branje	f
00030000-5602-9fdc-2805-5acaab746e61	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5602-9fdc-7599-5cf692f77e40	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5602-9fdc-0304-8eee0dec2bd2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5602-9fdc-f02c-901273d14d16	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5602-9fdc-21d5-229870bc08f8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5602-9fdc-c72e-0d228478dee3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5602-9fdc-4653-debf3a14471c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-9fdc-a9d4-12779ddf555a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-9fdc-7f2a-d15883865197	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-9fdc-939e-21ed997c1658	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-9fdc-5090-4fc804aec77a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5602-9fdc-e8db-a105c3e4b26a	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5602-9fdc-0232-b6a204013b58	Datoteka-write	Datoteka - spreminjanje	f
00030000-5602-9fdc-09f5-55e08636e652	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2973 (class 0 OID 20556973)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5602-9fdc-0543-8c0d30fc33a9	00030000-5602-9fdc-7710-77a6891118df
00020000-5602-9fdc-9d04-749b4edaded6	00030000-5602-9fdc-ad27-ead57914ecbf
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-5bd6-983ed9415d71
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-c1fd-8959d4eee704
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-75ab-816516fa58de
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-c0d1-3fd5aead8ba2
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-fe0e-c802c78e1b4b
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-b179-4cb57866502d
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-62c4-53ce7b4a4bd7
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-31f6-2bdd66a8a73f
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-ad27-ead57914ecbf
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-bb0b-54324056b79d
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-0715-ceb102ff3361
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-5e8a-cd5f54191991
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-e73c-40113d02c2f4
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-5043-4c0faf428aa2
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-52ff-b27fcd47b2aa
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-c918-ae4446ea79a9
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-ece0-71290412a16c
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-f737-5fea130613af
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-dcaa-855a53724205
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-678f-7b6a73443f1e
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-e578-8d906fe4cb71
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-6759-2ddd601c5af1
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-8a5e-d935bedebffa
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-9d88-639b23de7da8
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-1675-de627eece904
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-32ab-699a68dc0a6c
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-4613-38420d93eb32
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-72d5-363699b8e2cf
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-92c9-005e2c5038b7
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-bea6-0831a76e9017
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-df74-35ffbf04a948
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-ca32-059dea6acef5
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-a862-08b2cb5da337
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-ca67-f29127bccba6
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-b8c1-a3df6413192d
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-f3df-1f1fb67c94a7
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-466a-1f30943b6731
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-150e-579ff8f676fe
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-60b6-866d46bcc42f
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-bfe0-0f3730ac1b0a
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-8f62-c7ed29221726
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-1f46-68b3e6627783
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-d1ff-d11f29637350
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-a96b-ed83739a07b3
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-0fe9-90f40eecdd9f
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-0f78-b6f24431e4f1
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-6ad3-50e007a756cb
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-cc89-54ecb497fd1f
00020000-5602-9fdc-4ac6-d8ee50eaf428	00030000-5602-9fdc-b4ef-5c4865a0e3a0
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-5bd6-983ed9415d71
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-fe0e-c802c78e1b4b
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-b179-4cb57866502d
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-ad27-ead57914ecbf
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-e73c-40113d02c2f4
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-52ff-b27fcd47b2aa
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-ece0-71290412a16c
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-f737-5fea130613af
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-dcaa-855a53724205
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-678f-7b6a73443f1e
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-e578-8d906fe4cb71
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-6759-2ddd601c5af1
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-8a5e-d935bedebffa
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-1675-de627eece904
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-4613-38420d93eb32
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-72d5-363699b8e2cf
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-92c9-005e2c5038b7
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-a862-08b2cb5da337
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-b8c1-a3df6413192d
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-466a-1f30943b6731
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-60b6-866d46bcc42f
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-dcd8-72aaf831e711
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-b3a6-d7081e1fb22f
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-23e6-df45310fbc97
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-fe42-d8a595394aff
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-0715-c47968dd7354
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-7f15-9c086612d196
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-cc89-54ecb497fd1f
00020000-5602-9fdc-2eed-79e31376c871	00030000-5602-9fdc-b4ef-5c4865a0e3a0
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-5bd6-983ed9415d71
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-75ab-816516fa58de
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-fe0e-c802c78e1b4b
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-96b9-aae34c556422
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-c4d9-12144b6382f1
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-d8e9-766aab2db946
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-b179-4cb57866502d
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-ad27-ead57914ecbf
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-0715-ceb102ff3361
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-e73c-40113d02c2f4
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-52ff-b27fcd47b2aa
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-ece0-71290412a16c
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-dcaa-855a53724205
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-678f-7b6a73443f1e
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-e578-8d906fe4cb71
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-8a5e-d935bedebffa
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-1675-de627eece904
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-92c9-005e2c5038b7
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-df74-35ffbf04a948
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-a862-08b2cb5da337
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-b8c1-a3df6413192d
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-466a-1f30943b6731
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-60b6-866d46bcc42f
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-8f62-c7ed29221726
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-a96b-ed83739a07b3
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-0f78-b6f24431e4f1
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-cc89-54ecb497fd1f
00020000-5602-9fdc-42b0-30db4d13a2eb	00030000-5602-9fdc-b4ef-5c4865a0e3a0
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-5bd6-983ed9415d71
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-c1fd-8959d4eee704
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-c0d1-3fd5aead8ba2
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-fe0e-c802c78e1b4b
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-b179-4cb57866502d
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-ad27-ead57914ecbf
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-e73c-40113d02c2f4
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-52ff-b27fcd47b2aa
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-dcaa-855a53724205
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-678f-7b6a73443f1e
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-8a5e-d935bedebffa
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-1675-de627eece904
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-92c9-005e2c5038b7
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-a862-08b2cb5da337
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-b8c1-a3df6413192d
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-466a-1f30943b6731
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-60b6-866d46bcc42f
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-8f62-c7ed29221726
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-cc89-54ecb497fd1f
00020000-5602-9fdc-9e95-2cf6b47ad7d4	00030000-5602-9fdc-b4ef-5c4865a0e3a0
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-5bd6-983ed9415d71
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-fe0e-c802c78e1b4b
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-b179-4cb57866502d
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-ad27-ead57914ecbf
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-e73c-40113d02c2f4
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-52ff-b27fcd47b2aa
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-dcaa-855a53724205
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-678f-7b6a73443f1e
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-8a5e-d935bedebffa
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-1675-de627eece904
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-92c9-005e2c5038b7
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-a862-08b2cb5da337
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-b8c1-a3df6413192d
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-466a-1f30943b6731
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-60b6-866d46bcc42f
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-a508-04e012c847c4
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-6d49-2c9526596a86
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-8f62-c7ed29221726
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-cc89-54ecb497fd1f
00020000-5602-9fdc-94b5-862171cbc248	00030000-5602-9fdc-b4ef-5c4865a0e3a0
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-f0e4-4a972caa1b0f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-7710-77a6891118df
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-6d49-2c9526596a86
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-62c4-53ce7b4a4bd7
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-9cb7-18a680d1a2d4
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5edc-f41e5a568ca6
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-3786-a15695e6b79c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5bd6-983ed9415d71
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-c1fd-8959d4eee704
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-75ab-816516fa58de
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-c0d1-3fd5aead8ba2
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-fe0e-c802c78e1b4b
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-96b9-aae34c556422
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-c4d9-12144b6382f1
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-891d-53b056aebbd1
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-d8e9-766aab2db946
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a6ba-c6ef4e2bf352
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b179-4cb57866502d
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-31f6-2bdd66a8a73f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-ad27-ead57914ecbf
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-bb0b-54324056b79d
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-4cf7-4a64c69dc9b5
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-ffe6-0c83813082d6
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-81e0-645800203f62
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-78a7-0c0c3d884503
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0715-ceb102ff3361
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5e8a-cd5f54191991
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-e73c-40113d02c2f4
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5043-4c0faf428aa2
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-52ff-b27fcd47b2aa
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-c918-ae4446ea79a9
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-ece0-71290412a16c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-f737-5fea130613af
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-3380-47a2cb852995
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-6e79-ec71d4a6028b
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-3fcd-0637396806aa
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-18b5-e1a8ef6e88e7
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-dcaa-855a53724205
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-dd90-993c5a7a7953
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-678f-7b6a73443f1e
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-cdda-bfd94f9fa995
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-e578-8d906fe4cb71
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-6759-2ddd601c5af1
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-d277-7baa68df40f9
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-df14-576a27dc05b1
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-09e3-1b989c18d650
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-1347-0c0591e7b8fb
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-4f03-2053b2b2c270
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-37c9-f2871f1ad3c4
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-8a5e-d935bedebffa
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-9d88-639b23de7da8
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-1675-de627eece904
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-32ab-699a68dc0a6c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-29dd-74ed933ae4bb
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-3bcd-f1d03a5589f7
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-3c99-8107539af20a
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-2528-2a1afe4afda4
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-4613-38420d93eb32
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-72d5-363699b8e2cf
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-92c9-005e2c5038b7
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-bea6-0831a76e9017
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a8f8-4b7b808c7f05
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-7a81-f97405a82dab
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-f2d3-a297a85c88bc
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-9ef9-ff0f4c1e412c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-df74-35ffbf04a948
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-ca32-059dea6acef5
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a8c3-c6833916d02c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5460-55dca5c0b1b6
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-1576-048e530a8dd2
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-d836-0442add7ac5c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-cb95-0798f10bfc86
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a7fa-1a2eeb5bf07d
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-1ade-995e775966d8
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-75db-92ec2069e1c5
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-59c6-7e24121deb88
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-bc84-f7c444fc4bff
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-bab0-1334bf69e9c9
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-686c-c42a0385879c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-9b5f-40930e442b06
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-ef78-4f0e56833ab9
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-070f-f20394284dce
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0ad5-4affc45715ed
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-c4e9-281af3a95649
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5121-845e132db937
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-4596-180c1cc8600c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-4f12-8ec8bed47d38
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a862-08b2cb5da337
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-ca67-f29127bccba6
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-97a3-4dfd9c1c7a7a
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-cc87-5384fe1dc445
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-cd97-e0b60b7b37a5
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5bbe-a89b1aa73ec4
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b8c1-a3df6413192d
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-f3df-1f1fb67c94a7
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-466a-1f30943b6731
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-150e-579ff8f676fe
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-5dc6-e5b757c2c320
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-e357-432f3d24b879
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b562-5c92e6b284bd
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-03ac-191aa23339f9
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-33e3-3fb654dabe88
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a821-33a1f2d89234
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-67d1-cdfeb2c2b2cd
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-375e-2e41b4ca8c23
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-60b6-866d46bcc42f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-bfe0-0f3730ac1b0a
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a7fe-8e0d95537127
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b7b2-8c5ef659aae5
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0357-4d52a10a26ed
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-e9ce-40cc2656b1f0
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-6f2d-5f6dae4d434c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-9ed5-7b5046c54af3
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-139c-820b3f13bb86
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-f085-aa7b7e2f2aa9
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-dcd8-72aaf831e711
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b3a6-d7081e1fb22f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a508-04e012c847c4
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0038-be81fe92bf88
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-8f62-c7ed29221726
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-4f15-ce05a50c5599
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0b74-710a31396a3f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b2af-b3b268a8151c
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-23e6-df45310fbc97
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-fe42-d8a595394aff
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-1f46-68b3e6627783
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-d1ff-d11f29637350
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-a96b-ed83739a07b3
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0fe9-90f40eecdd9f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b6aa-a5ce1c46e37f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b97a-eb9062e94631
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-547a-50cf240fd074
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-d8a1-cfb024b7c374
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0715-c47968dd7354
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-7f15-9c086612d196
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-0f78-b6f24431e4f1
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-6ad3-50e007a756cb
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-cc89-54ecb497fd1f
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-1eb0-1e3ef6526b1a
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-b4ef-5c4865a0e3a0
00020000-5602-9fdd-60d5-0a344ff61e91	00030000-5602-9fdc-7e1c-e1fd2183928b
\.


--
-- TOC entry 3002 (class 0 OID 20557298)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 20557332)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20557469)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5602-9fde-1b19-6ab26afb2fe4	00090000-5602-9fde-b2cf-aec0179cd8e9	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5602-9fde-0604-0c7ae53af3d2	00090000-5602-9fde-1b3c-0245a9947734	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5602-9fde-916b-9676cdab9abd	00090000-5602-9fde-55b0-fff90f738a05	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5602-9fde-6b19-46e097470e76	00090000-5602-9fde-a757-aaa71b7bc90e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2978 (class 0 OID 20557033)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5602-9fdd-fcf3-f64094c8b7f5	00040000-5602-9fdc-9360-de4d6d002bae	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdd-d569-6c685939608a	00040000-5602-9fdc-9360-de4d6d002bae	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5602-9fdd-c3c8-a7331cf1ae47	00040000-5602-9fdc-9360-de4d6d002bae	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdd-2623-c8fe265a4552	00040000-5602-9fdc-9360-de4d6d002bae	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdd-164e-d186e5ff0359	00040000-5602-9fdc-9360-de4d6d002bae	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdd-82b6-0349eb3a573d	00040000-5602-9fdc-9321-83dfc8713861	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdd-3725-4ed34cb90bd8	00040000-5602-9fdc-30af-505ecaa8db93	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdd-9b8b-f46b1a478dde	00040000-5602-9fdc-141c-aa47169d0205	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdd-9b6c-39921f467a75	00040000-5602-9fdc-6246-f72475f9d715	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9fdf-2e28-fabfdce05d74	00040000-5602-9fdc-9360-de4d6d002bae	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2980 (class 0 OID 20557067)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5602-9fdb-75d8-ddde0ccc3740	8341	Adlešiči
00050000-5602-9fdb-e964-154c2a70e22b	5270	Ajdovščina
00050000-5602-9fdb-f029-a912357b70d9	6280	Ankaran/Ancarano
00050000-5602-9fdb-a81b-bb31a9cde60f	9253	Apače
00050000-5602-9fdb-a3a3-bf618ae19451	8253	Artiče
00050000-5602-9fdb-7a3e-7a0442c8f831	4275	Begunje na Gorenjskem
00050000-5602-9fdb-17aa-1e722416a41b	1382	Begunje pri Cerknici
00050000-5602-9fdb-c3de-6a60f62f67c3	9231	Beltinci
00050000-5602-9fdb-d2d8-fcb049430b51	2234	Benedikt
00050000-5602-9fdb-ef72-d92c1c1f909a	2345	Bistrica ob Dravi
00050000-5602-9fdb-1052-aeabb7225b29	3256	Bistrica ob Sotli
00050000-5602-9fdb-4e97-e46896f5c911	8259	Bizeljsko
00050000-5602-9fdb-38b7-07aec3d2d2bb	1223	Blagovica
00050000-5602-9fdb-2e2a-b65c218f47ea	8283	Blanca
00050000-5602-9fdb-d39c-9f8b95c9ff10	4260	Bled
00050000-5602-9fdb-ea63-4c9d18073800	4273	Blejska Dobrava
00050000-5602-9fdb-edf3-a14ed69b1e0b	9265	Bodonci
00050000-5602-9fdb-c4af-8d6b27381052	9222	Bogojina
00050000-5602-9fdb-df6e-b42345772993	4263	Bohinjska Bela
00050000-5602-9fdb-1d47-183a82c0cdbb	4264	Bohinjska Bistrica
00050000-5602-9fdb-24c2-c95d73844114	4265	Bohinjsko jezero
00050000-5602-9fdb-b388-760821b6dcaa	1353	Borovnica
00050000-5602-9fdb-2dad-b956236931c7	8294	Boštanj
00050000-5602-9fdb-2813-f541bf4a406b	5230	Bovec
00050000-5602-9fdb-bd5e-3a8e98a4dc02	5295	Branik
00050000-5602-9fdb-3ccb-18a9c1302509	3314	Braslovče
00050000-5602-9fdb-fe1a-f8e5a8a87316	5223	Breginj
00050000-5602-9fdb-4db0-98f86f001c20	8280	Brestanica
00050000-5602-9fdb-3e2c-efca28fd9845	2354	Bresternica
00050000-5602-9fdb-f2f1-4557d116056c	4243	Brezje
00050000-5602-9fdb-45be-ea5a038cb3e1	1351	Brezovica pri Ljubljani
00050000-5602-9fdb-f4b2-e63d2c8a46a8	8250	Brežice
00050000-5602-9fdb-a87d-eac3e3079d2d	4210	Brnik - Aerodrom
00050000-5602-9fdb-fcef-b6b692b56a20	8321	Brusnice
00050000-5602-9fdb-2283-6c2a2d4438c2	3255	Buče
00050000-5602-9fdb-8d1c-c58805b365ce	8276	Bučka 
00050000-5602-9fdb-6602-ae9509c49083	9261	Cankova
00050000-5602-9fdb-5ae9-b27ea2806fe5	3000	Celje 
00050000-5602-9fdb-6b33-c0f701901400	3001	Celje - poštni predali
00050000-5602-9fdb-6f6f-aa94415a65ef	4207	Cerklje na Gorenjskem
00050000-5602-9fdb-6c85-c07e611dd3f0	8263	Cerklje ob Krki
00050000-5602-9fdb-01f3-83680e25cdad	1380	Cerknica
00050000-5602-9fdb-5968-e13a128f35e5	5282	Cerkno
00050000-5602-9fdb-30fe-9adea8ca471f	2236	Cerkvenjak
00050000-5602-9fdb-df3a-ed8ec44ec532	2215	Ceršak
00050000-5602-9fdb-76ef-952101b2432d	2326	Cirkovce
00050000-5602-9fdb-1898-9ae3922eabe6	2282	Cirkulane
00050000-5602-9fdb-6738-8bb8f6c199ca	5273	Col
00050000-5602-9fdb-2eb5-c60ea237b085	8251	Čatež ob Savi
00050000-5602-9fdb-51b2-5af6409cd80c	1413	Čemšenik
00050000-5602-9fdb-5e60-23266c737b51	5253	Čepovan
00050000-5602-9fdb-8e8c-2b058894565a	9232	Črenšovci
00050000-5602-9fdb-88d0-aaae501996a4	2393	Črna na Koroškem
00050000-5602-9fdb-dbf6-cb7a53104289	6275	Črni Kal
00050000-5602-9fdb-6290-71736978057a	5274	Črni Vrh nad Idrijo
00050000-5602-9fdb-f2a9-fb8e3f67551f	5262	Črniče
00050000-5602-9fdb-a303-ac3696c76d40	8340	Črnomelj
00050000-5602-9fdb-f36e-f5892bad1063	6271	Dekani
00050000-5602-9fdb-8410-a8a17dafb69e	5210	Deskle
00050000-5602-9fdb-9e0c-73d2542873d2	2253	Destrnik
00050000-5602-9fdb-c7a8-f929e5841f75	6215	Divača
00050000-5602-9fdb-37cd-bcf662d00f03	1233	Dob
00050000-5602-9fdb-165c-90b1c6100439	3224	Dobje pri Planini
00050000-5602-9fdb-b84f-e2f80484a7c6	8257	Dobova
00050000-5602-9fdb-82f0-d9309ba0249b	1423	Dobovec
00050000-5602-9fdb-f7b4-78361432681e	5263	Dobravlje
00050000-5602-9fdb-576d-bba0fe5d629d	3204	Dobrna
00050000-5602-9fdb-18f5-3c666f6efc52	8211	Dobrnič
00050000-5602-9fdb-1fc6-b32e523a6d80	1356	Dobrova
00050000-5602-9fdb-0acc-877e153b4d38	9223	Dobrovnik/Dobronak 
00050000-5602-9fdb-8bde-eb620467d05d	5212	Dobrovo v Brdih
00050000-5602-9fdb-1987-a11062ec2d17	1431	Dol pri Hrastniku
00050000-5602-9fdb-254d-9e6cdf7d0c99	1262	Dol pri Ljubljani
00050000-5602-9fdb-e383-581dd9a4cdd4	1273	Dole pri Litiji
00050000-5602-9fdb-9ab1-2ffd5978c41f	1331	Dolenja vas
00050000-5602-9fdb-57de-f7dc11e043cc	8350	Dolenjske Toplice
00050000-5602-9fdb-a7d0-2d77af49df0d	1230	Domžale
00050000-5602-9fdb-75c5-5f0ea6451dae	2252	Dornava
00050000-5602-9fdb-cd33-e60bcc9cbd67	5294	Dornberk
00050000-5602-9fdb-58c4-8dd54655aab1	1319	Draga
00050000-5602-9fdb-620a-7a23b6b8700b	8343	Dragatuš
00050000-5602-9fdb-f28d-166616a7cdf8	3222	Dramlje
00050000-5602-9fdb-c10d-c7d7365e872d	2370	Dravograd
00050000-5602-9fdb-d616-0fe03224261c	4203	Duplje
00050000-5602-9fdb-5951-8c6ebf57e89e	6221	Dutovlje
00050000-5602-9fdb-2f13-bf16e88bcabd	8361	Dvor
00050000-5602-9fdb-c834-b5f5b47f7fb4	2343	Fala
00050000-5602-9fdb-48c2-d8290c002549	9208	Fokovci
00050000-5602-9fdb-3788-9c09cf0eed1a	2313	Fram
00050000-5602-9fdb-931f-88222d768ed9	3213	Frankolovo
00050000-5602-9fdb-f13b-f61e1640e690	1274	Gabrovka
00050000-5602-9fdb-0b96-02a127916435	8254	Globoko
00050000-5602-9fdb-6f18-10e42cfd3444	5275	Godovič
00050000-5602-9fdb-f32f-bfcc9958375a	4204	Golnik
00050000-5602-9fdb-5d07-63dd110ec823	3303	Gomilsko
00050000-5602-9fdb-c218-439f4ad03661	4224	Gorenja vas
00050000-5602-9fdb-276c-f64894043b78	3263	Gorica pri Slivnici
00050000-5602-9fdb-566c-2b8ef79295d3	2272	Gorišnica
00050000-5602-9fdb-322e-8ca082439444	9250	Gornja Radgona
00050000-5602-9fdb-a24d-152d65b06c9f	3342	Gornji Grad
00050000-5602-9fdb-b872-7e343faa242a	4282	Gozd Martuljek
00050000-5602-9fdb-9906-743677490aed	6272	Gračišče
00050000-5602-9fdb-f9e0-bd1243ef1add	9264	Grad
00050000-5602-9fdb-7476-04e5f97bd520	8332	Gradac
00050000-5602-9fdb-5d39-747c49223287	1384	Grahovo
00050000-5602-9fdb-d402-c67c4a379226	5242	Grahovo ob Bači
00050000-5602-9fdb-270f-066cf089c891	5251	Grgar
00050000-5602-9fdb-47f3-227ed2712288	3302	Griže
00050000-5602-9fdb-c443-2d2253bf660f	3231	Grobelno
00050000-5602-9fdb-fc4f-99810e313886	1290	Grosuplje
00050000-5602-9fdb-2fa8-872956cca3a5	2288	Hajdina
00050000-5602-9fdb-a27d-165bf41870bc	8362	Hinje
00050000-5602-9fdb-9591-ae62290937b5	2311	Hoče
00050000-5602-9fdb-3e81-9c0d9b29244c	9205	Hodoš/Hodos
00050000-5602-9fdb-02db-89d0d32b4aa9	1354	Horjul
00050000-5602-9fdb-c25c-131352e84102	1372	Hotedršica
00050000-5602-9fdb-3e26-e8cb4a323998	1430	Hrastnik
00050000-5602-9fdb-3a55-791827356449	6225	Hruševje
00050000-5602-9fdb-8b35-a2bf316c73a7	4276	Hrušica
00050000-5602-9fdb-a147-353e43c4918b	5280	Idrija
00050000-5602-9fdb-34f5-375110009b90	1292	Ig
00050000-5602-9fdb-402b-f59a034205c2	6250	Ilirska Bistrica
00050000-5602-9fdb-8e4b-8c1202c2b600	6251	Ilirska Bistrica-Trnovo
00050000-5602-9fdb-128e-a31bbbfb696b	1295	Ivančna Gorica
00050000-5602-9fdb-3444-46967ff2e411	2259	Ivanjkovci
00050000-5602-9fdb-6e36-40b94aa9520b	1411	Izlake
00050000-5602-9fdb-527f-89576619d688	6310	Izola/Isola
00050000-5602-9fdb-473d-6666805c060f	2222	Jakobski Dol
00050000-5602-9fdb-de38-74fe9ae1dfac	2221	Jarenina
00050000-5602-9fdb-4c19-ee178779481f	6254	Jelšane
00050000-5602-9fdb-262b-621b82a8c031	4270	Jesenice
00050000-5602-9fdb-c045-c07bb7eb5f5a	8261	Jesenice na Dolenjskem
00050000-5602-9fdb-e0b4-314bd54cc6b7	3273	Jurklošter
00050000-5602-9fdb-dfe4-def491f2a87c	2223	Jurovski Dol
00050000-5602-9fdb-7692-eed4a688527a	2256	Juršinci
00050000-5602-9fdb-9970-037409bd7d78	5214	Kal nad Kanalom
00050000-5602-9fdb-0653-eae036b6ce3e	3233	Kalobje
00050000-5602-9fdb-9db6-f08769984a99	4246	Kamna Gorica
00050000-5602-9fdb-9ead-078272ad2ccb	2351	Kamnica
00050000-5602-9fdb-3b5d-1dc9cff9a123	1241	Kamnik
00050000-5602-9fdb-00d3-b820cc36adb4	5213	Kanal
00050000-5602-9fdb-3fca-b8ee4e86a027	8258	Kapele
00050000-5602-9fdb-d1d9-657d0bc0ba99	2362	Kapla
00050000-5602-9fdb-da84-0af5bf0e6fb6	2325	Kidričevo
00050000-5602-9fdb-8b92-fe7ef23325b7	1412	Kisovec
00050000-5602-9fdb-d43d-54235b7476d1	6253	Knežak
00050000-5602-9fdb-69e5-e93be8244aee	5222	Kobarid
00050000-5602-9fdb-e38c-64ed43a55aba	9227	Kobilje
00050000-5602-9fdb-057c-a85b49048769	1330	Kočevje
00050000-5602-9fdb-5f2b-11fb0da37560	1338	Kočevska Reka
00050000-5602-9fdb-394c-21a2b0945e16	2276	Kog
00050000-5602-9fdb-ae45-b646d63b196a	5211	Kojsko
00050000-5602-9fdb-9984-6c9f4921bc0a	6223	Komen
00050000-5602-9fdb-c837-23477d6ca18e	1218	Komenda
00050000-5602-9fdb-5fec-199e1b0d2a59	6000	Koper/Capodistria 
00050000-5602-9fdb-b67d-199d555196a8	6001	Koper/Capodistria - poštni predali
00050000-5602-9fdb-4e15-af6330b9e2b4	8282	Koprivnica
00050000-5602-9fdb-9443-28a3deeb412d	5296	Kostanjevica na Krasu
00050000-5602-9fdb-d436-cb5478b3f14c	8311	Kostanjevica na Krki
00050000-5602-9fdb-417a-2e0bded6fb0c	1336	Kostel
00050000-5602-9fdb-11c8-52dfafe4a911	6256	Košana
00050000-5602-9fdb-ebb6-457809f1299f	2394	Kotlje
00050000-5602-9fdb-21b8-cb812432482f	6240	Kozina
00050000-5602-9fdb-3655-2cb71de9aa50	3260	Kozje
00050000-5602-9fdb-01ae-1f5386899a4a	4000	Kranj 
00050000-5602-9fdb-dcc7-f09257f29e98	4001	Kranj - poštni predali
00050000-5602-9fdb-9d4b-bace0a62c000	4280	Kranjska Gora
00050000-5602-9fdb-dafb-23685b784d19	1281	Kresnice
00050000-5602-9fdb-17f8-c0b2c824856c	4294	Križe
00050000-5602-9fdb-0dca-72bf7c5975b9	9206	Križevci
00050000-5602-9fdb-ae6f-919eec9b0a03	9242	Križevci pri Ljutomeru
00050000-5602-9fdb-7c21-81a71d6b79b4	1301	Krka
00050000-5602-9fdb-4b7c-2a8b92eb4b5c	8296	Krmelj
00050000-5602-9fdb-8f5a-449f4e95e236	4245	Kropa
00050000-5602-9fdb-0c76-87b20f7e948a	8262	Krška vas
00050000-5602-9fdb-3ec7-bcc7673819b0	8270	Krško
00050000-5602-9fdb-e4f8-ab785ecf14ae	9263	Kuzma
00050000-5602-9fdb-cb8c-dcea76db3087	2318	Laporje
00050000-5602-9fdb-7af5-763b41f69065	3270	Laško
00050000-5602-9fdb-b4e0-2b26d64c520e	1219	Laze v Tuhinju
00050000-5602-9fdb-7be9-2028bea4ad30	2230	Lenart v Slovenskih goricah
00050000-5602-9fdb-d9f8-8aca9acccfd7	9220	Lendava/Lendva
00050000-5602-9fdb-9d8c-0527d89e2ebf	4248	Lesce
00050000-5602-9fdb-e1ab-bc1160929663	3261	Lesično
00050000-5602-9fdb-2509-026abbcfe5d2	8273	Leskovec pri Krškem
00050000-5602-9fdb-7417-638344a50095	2372	Libeliče
00050000-5602-9fdb-64f7-39563c005062	2341	Limbuš
00050000-5602-9fdb-43d3-a4d279d04818	1270	Litija
00050000-5602-9fdb-ec3e-0e4d731c9000	3202	Ljubečna
00050000-5602-9fdb-f122-352fbdde6db7	1000	Ljubljana 
00050000-5602-9fdb-bf9f-78c969faff27	1001	Ljubljana - poštni predali
00050000-5602-9fdb-0cd4-68663576594f	1231	Ljubljana - Črnuče
00050000-5602-9fdb-1202-585d735d6eb8	1261	Ljubljana - Dobrunje
00050000-5602-9fdb-dc46-91232237a566	1260	Ljubljana - Polje
00050000-5602-9fdb-2559-e8b704ca62dd	1210	Ljubljana - Šentvid
00050000-5602-9fdb-ae7b-b058b459a3ef	1211	Ljubljana - Šmartno
00050000-5602-9fdb-1f99-2e1c78accb30	3333	Ljubno ob Savinji
00050000-5602-9fdb-8d19-920cdf5241b4	9240	Ljutomer
00050000-5602-9fdb-7006-ce42d81eb82f	3215	Loče
00050000-5602-9fdb-73df-dd9e40e7308c	5231	Log pod Mangartom
00050000-5602-9fdb-6784-9fe702c32b9c	1358	Log pri Brezovici
00050000-5602-9fdb-d3a9-d2459e740963	1370	Logatec
00050000-5602-9fdb-13cd-f63ba2c2c118	1371	Logatec
00050000-5602-9fdb-e206-4883f9101aa8	1434	Loka pri Zidanem Mostu
00050000-5602-9fdb-e4f7-89831f2cbc0b	3223	Loka pri Žusmu
00050000-5602-9fdb-a1be-e5d925b0f818	6219	Lokev
00050000-5602-9fdb-83ef-ea572b7621c5	1318	Loški Potok
00050000-5602-9fdb-8d6d-2c70af9685b3	2324	Lovrenc na Dravskem polju
00050000-5602-9fdb-eed0-52c9ed74d255	2344	Lovrenc na Pohorju
00050000-5602-9fdb-40e1-1842f55b141e	3334	Luče
00050000-5602-9fdb-7ada-21b0781abeb7	1225	Lukovica
00050000-5602-9fdb-f76a-a492e44f4014	9202	Mačkovci
00050000-5602-9fdb-df34-20e3708293d9	2322	Majšperk
00050000-5602-9fdb-4c2c-74731202a29b	2321	Makole
00050000-5602-9fdb-7083-0389fe4b7d9a	9243	Mala Nedelja
00050000-5602-9fdb-7bfd-c39a259af86b	2229	Malečnik
00050000-5602-9fdb-4cee-d7b5c5f99ce8	6273	Marezige
00050000-5602-9fdb-a9e1-138e8430272c	2000	Maribor 
00050000-5602-9fdb-eddc-43eb43a25863	2001	Maribor - poštni predali
00050000-5602-9fdb-dad1-a3bd210a90a7	2206	Marjeta na Dravskem polju
00050000-5602-9fdb-53c3-65facff40f6a	2281	Markovci
00050000-5602-9fdb-b8dc-aefa05f0a2fc	9221	Martjanci
00050000-5602-9fdb-5d6d-9347b80e6fe8	6242	Materija
00050000-5602-9fdb-1289-3e0940909b19	4211	Mavčiče
00050000-5602-9fdb-90c6-fe7c28515c9e	1215	Medvode
00050000-5602-9fdb-bcd3-f01b6ea1e660	1234	Mengeš
00050000-5602-9fdb-440a-ee986b86a69d	8330	Metlika
00050000-5602-9fdb-72d9-46bf7ed375e3	2392	Mežica
00050000-5602-9fdb-25d2-ac9848ff3cc7	2204	Miklavž na Dravskem polju
00050000-5602-9fdb-21ca-812ba282f32e	2275	Miklavž pri Ormožu
00050000-5602-9fdb-0c55-dd240d9b500b	5291	Miren
00050000-5602-9fdb-b767-12010e3cbed3	8233	Mirna
00050000-5602-9fdb-adee-668a7ead1bd8	8216	Mirna Peč
00050000-5602-9fdb-e0ec-0459382215df	2382	Mislinja
00050000-5602-9fdb-76c5-94d1022252c8	4281	Mojstrana
00050000-5602-9fdb-d628-6d9f38bff591	8230	Mokronog
00050000-5602-9fdb-6dcc-1aa983aa5894	1251	Moravče
00050000-5602-9fdb-d773-b84ab8052954	9226	Moravske Toplice
00050000-5602-9fdb-a5b9-c2eaf38fdb89	5216	Most na Soči
00050000-5602-9fdb-5eb4-a153539f917d	1221	Motnik
00050000-5602-9fdb-209d-151f114445a6	3330	Mozirje
00050000-5602-9fdb-1f48-51f425e81ee7	9000	Murska Sobota 
00050000-5602-9fdb-c00f-7082961050c4	9001	Murska Sobota - poštni predali
00050000-5602-9fdb-3524-5f8cb5588975	2366	Muta
00050000-5602-9fdb-cc1e-cd4f6a198791	4202	Naklo
00050000-5602-9fdb-376d-d755776b75a1	3331	Nazarje
00050000-5602-9fdb-faad-d50d31a8c4bc	1357	Notranje Gorice
00050000-5602-9fdb-f5dc-c2c428c5d488	3203	Nova Cerkev
00050000-5602-9fdb-454a-a924e1b6fd4c	5000	Nova Gorica 
00050000-5602-9fdb-e436-78e605413ef7	5001	Nova Gorica - poštni predali
00050000-5602-9fdb-0a9d-6d7fa0590ec1	1385	Nova vas
00050000-5602-9fdb-c09c-57d0c2be7a7e	8000	Novo mesto
00050000-5602-9fdb-8b7b-43cd61951b57	8001	Novo mesto - poštni predali
00050000-5602-9fdb-a620-04c091954682	6243	Obrov
00050000-5602-9fdb-1936-e42ea61c4c71	9233	Odranci
00050000-5602-9fdb-c5ab-f03be9b1997c	2317	Oplotnica
00050000-5602-9fdb-e9a1-a9f082523d3a	2312	Orehova vas
00050000-5602-9fdb-73c6-28ffb06c6b48	2270	Ormož
00050000-5602-9fdb-2880-66f70cef84fb	1316	Ortnek
00050000-5602-9fdb-222b-955fc723d7e4	1337	Osilnica
00050000-5602-9fdb-0b83-1ec50ba6f389	8222	Otočec
00050000-5602-9fdb-8121-ef9092d70457	2361	Ožbalt
00050000-5602-9fdb-0721-cde80430c3bf	2231	Pernica
00050000-5602-9fdb-2d73-700f550a8827	2211	Pesnica pri Mariboru
00050000-5602-9fdb-f007-82214116fd6f	9203	Petrovci
00050000-5602-9fdb-8036-534397967f78	3301	Petrovče
00050000-5602-9fdb-b87d-f9333d73c9b3	6330	Piran/Pirano
00050000-5602-9fdb-49f2-4c6febea2d5f	8255	Pišece
00050000-5602-9fdb-cae5-363d41fe34ab	6257	Pivka
00050000-5602-9fdb-4988-a994e6e8a552	6232	Planina
00050000-5602-9fdb-0dc8-ec61b24134a3	3225	Planina pri Sevnici
00050000-5602-9fdb-6213-f38664b08f5c	6276	Pobegi
00050000-5602-9fdb-a93a-342862b54c27	8312	Podbočje
00050000-5602-9fdb-5f9f-c48458975ba0	5243	Podbrdo
00050000-5602-9fdb-aed1-c8dc7aabd848	3254	Podčetrtek
00050000-5602-9fdb-f02a-ddae36b05245	2273	Podgorci
00050000-5602-9fdb-5e13-14d30ae784f6	6216	Podgorje
00050000-5602-9fdb-f620-0a2b7fce1c87	2381	Podgorje pri Slovenj Gradcu
00050000-5602-9fdb-5ab5-63776ab2cd6e	6244	Podgrad
00050000-5602-9fdb-b014-0e5d21253f84	1414	Podkum
00050000-5602-9fdb-2bc1-f07c084aff90	2286	Podlehnik
00050000-5602-9fdb-f329-dedacbba06e2	5272	Podnanos
00050000-5602-9fdb-c1b3-45ab18e62438	4244	Podnart
00050000-5602-9fdb-96cd-d81eebbfdf2e	3241	Podplat
00050000-5602-9fdb-df47-fea65d4259b8	3257	Podsreda
00050000-5602-9fdb-6bed-9b7685f4cdbe	2363	Podvelka
00050000-5602-9fdb-2497-4115fa19f3c9	2208	Pohorje
00050000-5602-9fdb-e11b-6e46dbb67747	2257	Polenšak
00050000-5602-9fdb-642c-ecc622ca34cb	1355	Polhov Gradec
00050000-5602-9fdb-37a5-4e1cc4227175	4223	Poljane nad Škofjo Loko
00050000-5602-9fdb-3020-d43b3392bbe7	2319	Poljčane
00050000-5602-9fdb-7ec6-a1ff8d797a2a	1272	Polšnik
00050000-5602-9fdb-965d-96e9407fbfa9	3313	Polzela
00050000-5602-9fdb-ca8d-a8d74df24bbe	3232	Ponikva
00050000-5602-9fdb-6ae1-1e69113f6cdd	6320	Portorož/Portorose
00050000-5602-9fdb-5744-01888011b2b9	6230	Postojna
00050000-5602-9fdb-9032-fea169069e4a	2331	Pragersko
00050000-5602-9fdb-6b95-1d7b85d71f94	3312	Prebold
00050000-5602-9fdb-7ecf-f7a518c16ee6	4205	Preddvor
00050000-5602-9fdb-4933-d1088feec406	6255	Prem
00050000-5602-9fdb-dbc7-9d371dd2cca1	1352	Preserje
00050000-5602-9fdb-f840-44dacc2bfa0d	6258	Prestranek
00050000-5602-9fdb-c25e-b3fec1f4d18f	2391	Prevalje
00050000-5602-9fdb-6dcc-3aaaed279d6b	3262	Prevorje
00050000-5602-9fdb-8374-0c98a46c9f8b	1276	Primskovo 
00050000-5602-9fdb-f0ff-a7167b4f6c4a	3253	Pristava pri Mestinju
00050000-5602-9fdb-8f6b-afeaf3525817	9207	Prosenjakovci/Partosfalva
00050000-5602-9fdb-eeb8-7dca28f81d39	5297	Prvačina
00050000-5602-9fdb-0b69-87ec6d7ef37a	2250	Ptuj
00050000-5602-9fdb-634b-0b2368696610	2323	Ptujska Gora
00050000-5602-9fdb-60b6-bc2325d80755	9201	Puconci
00050000-5602-9fdb-882a-512137342800	2327	Rače
00050000-5602-9fdb-6468-9266002d302b	1433	Radeče
00050000-5602-9fdb-32b6-0f601e486100	9252	Radenci
00050000-5602-9fdb-9f4a-e799351e949e	2360	Radlje ob Dravi
00050000-5602-9fdb-e499-ab32479b3c90	1235	Radomlje
00050000-5602-9fdb-e165-7d86c195aabc	4240	Radovljica
00050000-5602-9fdb-ea1a-17836feb27b0	8274	Raka
00050000-5602-9fdb-c7a8-170e7654f103	1381	Rakek
00050000-5602-9fdb-902a-57753a1db3f3	4283	Rateče - Planica
00050000-5602-9fdb-9bb8-1f525edfb06e	2390	Ravne na Koroškem
00050000-5602-9fdb-5a52-337afbb5cc46	9246	Razkrižje
00050000-5602-9fdb-15da-94368ff2846c	3332	Rečica ob Savinji
00050000-5602-9fdb-517b-43b54b64ad87	5292	Renče
00050000-5602-9fdb-e061-c1a63435fcb4	1310	Ribnica
00050000-5602-9fdb-7a82-91d5ce7c520e	2364	Ribnica na Pohorju
00050000-5602-9fdb-2d12-bdf9da3594b1	3272	Rimske Toplice
00050000-5602-9fdb-ed38-248d2153c592	1314	Rob
00050000-5602-9fdb-0099-6f769974411a	5215	Ročinj
00050000-5602-9fdb-fc1c-dd0e80de9528	3250	Rogaška Slatina
00050000-5602-9fdb-5f4e-85c7a9421408	9262	Rogašovci
00050000-5602-9fdb-eece-9a9f3791e3aa	3252	Rogatec
00050000-5602-9fdb-2054-ad027b4d36e3	1373	Rovte
00050000-5602-9fdb-8178-e042a8a15a7e	2342	Ruše
00050000-5602-9fdb-e8ea-5e36cbec6710	1282	Sava
00050000-5602-9fdb-3a13-e6d90522067d	6333	Sečovlje/Sicciole
00050000-5602-9fdb-20f3-55916f88229d	4227	Selca
00050000-5602-9fdb-2ccb-3a01be870985	2352	Selnica ob Dravi
00050000-5602-9fdb-ba6f-43b01f32cc06	8333	Semič
00050000-5602-9fdb-f34a-6b57b197671f	8281	Senovo
00050000-5602-9fdb-258b-980900cafda0	6224	Senožeče
00050000-5602-9fdb-660d-dbf8fa85b734	8290	Sevnica
00050000-5602-9fdb-cafe-7bf0a2bf2d0b	6210	Sežana
00050000-5602-9fdb-501b-6fd984318660	2214	Sladki Vrh
00050000-5602-9fdb-f0f6-ed5b74714d6b	5283	Slap ob Idrijci
00050000-5602-9fdb-84c9-541d55083a4b	2380	Slovenj Gradec
00050000-5602-9fdb-e187-dce153ec3038	2310	Slovenska Bistrica
00050000-5602-9fdb-f6f7-f83240b49a58	3210	Slovenske Konjice
00050000-5602-9fdb-fa54-dd1875e8e1bb	1216	Smlednik
00050000-5602-9fdb-bfeb-1400432b8f0b	5232	Soča
00050000-5602-9fdb-8e1d-83cb9f9b6c9b	1317	Sodražica
00050000-5602-9fdb-3a2a-fda3c6062dd9	3335	Solčava
00050000-5602-9fdb-03b5-949590aa0ce2	5250	Solkan
00050000-5602-9fdb-e6bd-1aa10a4638fd	4229	Sorica
00050000-5602-9fdb-614d-b49dc54d36d0	4225	Sovodenj
00050000-5602-9fdb-d5dc-83996c56b635	5281	Spodnja Idrija
00050000-5602-9fdb-f652-0a5f563df39f	2241	Spodnji Duplek
00050000-5602-9fdb-9e84-06c8e42f6a45	9245	Spodnji Ivanjci
00050000-5602-9fdb-d4e3-fbb3f866dd69	2277	Središče ob Dravi
00050000-5602-9fdb-e3b1-affb9e1f2728	4267	Srednja vas v Bohinju
00050000-5602-9fdb-fa0e-91a09c6a870c	8256	Sromlje 
00050000-5602-9fdb-0437-4fd3460ab87f	5224	Srpenica
00050000-5602-9fdb-710b-dc9aa0dfbdfc	1242	Stahovica
00050000-5602-9fdb-d6e3-d06dd1088fce	1332	Stara Cerkev
00050000-5602-9fdb-615b-4e464690d592	8342	Stari trg ob Kolpi
00050000-5602-9fdb-388b-d382592ae2d2	1386	Stari trg pri Ložu
00050000-5602-9fdb-29f5-6a1e93744c21	2205	Starše
00050000-5602-9fdb-6103-995e51317fe1	2289	Stoperce
00050000-5602-9fdb-b33a-6ba0055aafb0	8322	Stopiče
00050000-5602-9fdb-9274-66677690dfe4	3206	Stranice
00050000-5602-9fdb-a83d-48ac62ee7844	8351	Straža
00050000-5602-9fdb-2cb9-dc9c66b42e52	1313	Struge
00050000-5602-9fdb-2b7e-7a69f86fa3cc	8293	Studenec
00050000-5602-9fdb-bd8e-56e51d052373	8331	Suhor
00050000-5602-9fdb-c80f-ce52da60741c	2233	Sv. Ana v Slovenskih goricah
00050000-5602-9fdb-4ea3-c64a7b38fea9	2235	Sv. Trojica v Slovenskih goricah
00050000-5602-9fdb-f037-de97d1b94fc3	2353	Sveti Duh na Ostrem Vrhu
00050000-5602-9fdb-82e1-af9b3cbfa131	9244	Sveti Jurij ob Ščavnici
00050000-5602-9fdb-f2c3-7d761cc5dda4	3264	Sveti Štefan
00050000-5602-9fdb-9d11-765e930a1d40	2258	Sveti Tomaž
00050000-5602-9fdb-9971-e8ca97cc54d7	9204	Šalovci
00050000-5602-9fdb-d2f3-8645d7b6893b	5261	Šempas
00050000-5602-9fdb-649e-18fab9ce443d	5290	Šempeter pri Gorici
00050000-5602-9fdb-06df-3005bb30af0e	3311	Šempeter v Savinjski dolini
00050000-5602-9fdb-726f-ecd0e89334ca	4208	Šenčur
00050000-5602-9fdb-30fc-55ac7e94ea64	2212	Šentilj v Slovenskih goricah
00050000-5602-9fdb-931a-b3d2c20faba3	8297	Šentjanž
00050000-5602-9fdb-7328-1b6f5e20cd6f	2373	Šentjanž pri Dravogradu
00050000-5602-9fdb-864a-657ec371aa43	8310	Šentjernej
00050000-5602-9fdb-ca1c-47859914f527	3230	Šentjur
00050000-5602-9fdb-accc-7affe1489d0b	3271	Šentrupert
00050000-5602-9fdb-44b1-242bef489df0	8232	Šentrupert
00050000-5602-9fdb-775f-ef74ecd62db3	1296	Šentvid pri Stični
00050000-5602-9fdb-c5a4-d61e313ec5fb	8275	Škocjan
00050000-5602-9fdb-454b-3fd63fd2cdfa	6281	Škofije
00050000-5602-9fdb-be47-8ecff057feb1	4220	Škofja Loka
00050000-5602-9fdb-7465-daf1c8c067d7	3211	Škofja vas
00050000-5602-9fdb-feeb-5c0831df8857	1291	Škofljica
00050000-5602-9fdb-1e99-a73a9118ccf2	6274	Šmarje
00050000-5602-9fdb-2754-2de0d56e9c85	1293	Šmarje - Sap
00050000-5602-9fdb-6587-efc117187a65	3240	Šmarje pri Jelšah
00050000-5602-9fdb-b807-61a43ba17879	8220	Šmarješke Toplice
00050000-5602-9fdb-bdbf-74970524a3c4	2315	Šmartno na Pohorju
00050000-5602-9fdb-acc0-0661cd4e3dae	3341	Šmartno ob Dreti
00050000-5602-9fdb-af18-4680402731ee	3327	Šmartno ob Paki
00050000-5602-9fdb-62e5-e6089d647887	1275	Šmartno pri Litiji
00050000-5602-9fdb-9b2f-44f5ad0641cd	2383	Šmartno pri Slovenj Gradcu
00050000-5602-9fdb-5df0-3a61ed7cae31	3201	Šmartno v Rožni dolini
00050000-5602-9fdb-2d8f-390fbef677f5	3325	Šoštanj
00050000-5602-9fdb-58f5-263b7ff7a71f	6222	Štanjel
00050000-5602-9fdb-6495-57f239cf8b51	3220	Štore
00050000-5602-9fdb-a97b-deabecb29f6e	3304	Tabor
00050000-5602-9fdb-f3cb-addd9463765b	3221	Teharje
00050000-5602-9fdb-1401-ed12d9f32f85	9251	Tišina
00050000-5602-9fdb-cad5-282cccf391dc	5220	Tolmin
00050000-5602-9fdb-6202-ffa8c0ba8543	3326	Topolšica
00050000-5602-9fdb-fced-e615cf679a8f	2371	Trbonje
00050000-5602-9fdb-0806-72d7dff3ba3f	1420	Trbovlje
00050000-5602-9fdb-4960-490867946f1a	8231	Trebelno 
00050000-5602-9fdb-d199-d6091ce66bfb	8210	Trebnje
00050000-5602-9fdb-57dc-bfcb6f6a825c	5252	Trnovo pri Gorici
00050000-5602-9fdb-92a6-df4c83622cf1	2254	Trnovska vas
00050000-5602-9fdb-4ff2-6440321a6b26	1222	Trojane
00050000-5602-9fdb-85a4-c64ee8206044	1236	Trzin
00050000-5602-9fdb-2cb4-7403764b4b7e	4290	Tržič
00050000-5602-9fdb-47da-5a78c6495cfc	8295	Tržišče
00050000-5602-9fdb-9b15-8b93d98b77b6	1311	Turjak
00050000-5602-9fdb-d80e-ebfe2ab2fc9f	9224	Turnišče
00050000-5602-9fdb-7fa5-4efb7a7e184c	8323	Uršna sela
00050000-5602-9fdb-8fbf-67d9197ba160	1252	Vače
00050000-5602-9fdb-db52-5b813bc61927	3320	Velenje 
00050000-5602-9fdb-16b5-4c8877384150	3322	Velenje - poštni predali
00050000-5602-9fdb-4827-ad79acf8e7ae	8212	Velika Loka
00050000-5602-9fdb-3300-77bcfff5d93a	2274	Velika Nedelja
00050000-5602-9fdb-7b10-fe6ec1219060	9225	Velika Polana
00050000-5602-9fdb-7499-c8de9121e537	1315	Velike Lašče
00050000-5602-9fdb-651b-eda65972c940	8213	Veliki Gaber
00050000-5602-9fdb-de2d-ab8b31806ff9	9241	Veržej
00050000-5602-9fdb-289a-6d10d2f7e700	1312	Videm - Dobrepolje
00050000-5602-9fdb-5741-b62542c68ded	2284	Videm pri Ptuju
00050000-5602-9fdb-7ffb-429e2f1dcc4c	8344	Vinica
00050000-5602-9fdb-d960-94f6fd9b3dca	5271	Vipava
00050000-5602-9fdb-33a8-0cccfdbe77ff	4212	Visoko
00050000-5602-9fdb-c3e8-f202895a8f46	1294	Višnja Gora
00050000-5602-9fdb-6b05-8df5e45dc44a	3205	Vitanje
00050000-5602-9fdb-8f0f-f03f038ae871	2255	Vitomarci
00050000-5602-9fdb-0f1e-74a923bb67e0	1217	Vodice
00050000-5602-9fdb-ea85-86d331ff1c01	3212	Vojnik\t
00050000-5602-9fdb-1168-f88524a8e3ec	5293	Volčja Draga
00050000-5602-9fdb-319c-04d6a53e06ba	2232	Voličina
00050000-5602-9fdb-978f-96e93eb55d4e	3305	Vransko
00050000-5602-9fdb-6b0f-8ff0d791cd51	6217	Vremski Britof
00050000-5602-9fdb-2b3c-e5859651c256	1360	Vrhnika
00050000-5602-9fdb-df45-0dfdb5649cb2	2365	Vuhred
00050000-5602-9fdb-9ff0-f7acb87b7f1d	2367	Vuzenica
00050000-5602-9fdb-f2ce-2668983de599	8292	Zabukovje 
00050000-5602-9fdb-dfd8-af9873d83528	1410	Zagorje ob Savi
00050000-5602-9fdb-8ca6-994168957c4a	1303	Zagradec
00050000-5602-9fdb-d58f-631ff5b2aedd	2283	Zavrč
00050000-5602-9fdb-b16f-273fba391bd7	8272	Zdole 
00050000-5602-9fdb-08f9-d17f20ff6322	4201	Zgornja Besnica
00050000-5602-9fdb-7176-a3f9ce8a788a	2242	Zgornja Korena
00050000-5602-9fdb-21b4-d5515adc1c48	2201	Zgornja Kungota
00050000-5602-9fdb-0165-f0316db8292e	2316	Zgornja Ložnica
00050000-5602-9fdb-b5c7-b617865f8c7b	2314	Zgornja Polskava
00050000-5602-9fdb-2dc2-cb0d777cd84d	2213	Zgornja Velka
00050000-5602-9fdb-7469-b1e4fad74c43	4247	Zgornje Gorje
00050000-5602-9fdb-b8ea-7fbad6a97db9	4206	Zgornje Jezersko
00050000-5602-9fdb-3b27-9400d4fb5604	2285	Zgornji Leskovec
00050000-5602-9fdb-c0e6-5b43b0f2314a	1432	Zidani Most
00050000-5602-9fdb-a7c6-776c48444feb	3214	Zreče
00050000-5602-9fdb-64c3-fdb6b3ca06a4	4209	Žabnica
00050000-5602-9fdb-e663-114e628586e2	3310	Žalec
00050000-5602-9fdb-b181-34736b9717e4	4228	Železniki
00050000-5602-9fdb-17ad-d8f3ad3d284b	2287	Žetale
00050000-5602-9fdb-1d96-645252ef9200	4226	Žiri
00050000-5602-9fdb-6cc6-d06c21808c23	4274	Žirovnica
00050000-5602-9fdb-036d-977a49a23125	8360	Žužemberk
\.


--
-- TOC entry 3025 (class 0 OID 20557649)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20557272)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20557052)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5602-9fde-29a9-2db707a71bcf	00080000-5602-9fdd-fcf3-f64094c8b7f5	\N	00040000-5602-9fdc-9360-de4d6d002bae	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5602-9fde-e62d-15f8448fdd46	00080000-5602-9fdd-fcf3-f64094c8b7f5	\N	00040000-5602-9fdc-9360-de4d6d002bae	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5602-9fde-6e47-ed91c0d6eefa	00080000-5602-9fdd-d569-6c685939608a	\N	00040000-5602-9fdc-9360-de4d6d002bae	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2987 (class 0 OID 20557156)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20557284)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20557663)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20557673)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5602-9fdd-d618-7b406c2aa693	00080000-5602-9fdd-c3c8-a7331cf1ae47	0987	AK
00190000-5602-9fde-f032-91d556cdcba0	00080000-5602-9fdd-d569-6c685939608a	0989	AK
00190000-5602-9fde-c8ed-4c04d90b5c21	00080000-5602-9fdd-2623-c8fe265a4552	0986	AK
00190000-5602-9fde-5d3d-eb87f393959a	00080000-5602-9fdd-82b6-0349eb3a573d	0984	AK
00190000-5602-9fde-1826-a2d0e47e2630	00080000-5602-9fdd-3725-4ed34cb90bd8	0983	AK
00190000-5602-9fde-cf30-b330e8fe27a1	00080000-5602-9fdd-9b8b-f46b1a478dde	0982	AK
00190000-5602-9fdf-f7ce-d8a25b429959	00080000-5602-9fdf-2e28-fabfdce05d74	1001	AK
\.


--
-- TOC entry 3024 (class 0 OID 20557606)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5602-9fde-2639-c4fcb695c006	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 20557681)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20557313)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5602-9fdd-e9d2-c77179b6d2df	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5602-9fdd-dd32-8e53ae6a97f4	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5602-9fdd-05bc-ae95bd4f225d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5602-9fdd-ebe1-a4eb9a151a4b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5602-9fdd-9808-1aa9f655f309	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5602-9fdd-bfcb-ae5edd4c0cca	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5602-9fdd-51e8-e5057299e62a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2996 (class 0 OID 20557257)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20557247)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20557458)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20557388)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20557130)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20556925)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5602-9fdf-2e28-fabfdce05d74	00010000-5602-9fdc-89a3-72ee5cf63568	2015-09-23 14:49:35	INS	a:0:{}
2	App\\Entity\\Option	00000000-5602-9fdf-cdf0-a82a83f00ee1	00010000-5602-9fdc-89a3-72ee5cf63568	2015-09-23 14:49:35	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5602-9fdf-f7ce-d8a25b429959	00010000-5602-9fdc-89a3-72ee5cf63568	2015-09-23 14:49:35	INS	a:0:{}
\.


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3005 (class 0 OID 20557326)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 20556963)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5602-9fdc-0543-8c0d30fc33a9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5602-9fdc-9d04-749b4edaded6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5602-9fdc-5ec0-de9feff79e14	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5602-9fdc-7ce1-dfdd18b24e62	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5602-9fdc-4ac6-d8ee50eaf428	planer	Planer dogodkov v koledarju	t
00020000-5602-9fdc-2eed-79e31376c871	kadrovska	Kadrovska služba	t
00020000-5602-9fdc-42b0-30db4d13a2eb	arhivar	Ažuriranje arhivalij	t
00020000-5602-9fdc-9e95-2cf6b47ad7d4	igralec	Igralec	t
00020000-5602-9fdc-94b5-862171cbc248	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5602-9fdd-60d5-0a344ff61e91	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2970 (class 0 OID 20556947)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5602-9fdc-1557-d793ad0a0311	00020000-5602-9fdc-5ec0-de9feff79e14
00010000-5602-9fdc-89a3-72ee5cf63568	00020000-5602-9fdc-5ec0-de9feff79e14
00010000-5602-9fdd-be42-f130c3be21c8	00020000-5602-9fdd-60d5-0a344ff61e91
\.


--
-- TOC entry 3007 (class 0 OID 20557340)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20557278)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20557224)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20556912)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5602-9fdc-7d36-8efee711a0a7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5602-9fdc-0873-1d7707261e08	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5602-9fdc-f45f-5a1c057dbfb9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5602-9fdc-4e44-550e86b80872	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5602-9fdc-5e37-e80320245bee	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 20556904)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5602-9fdc-80a3-3fcecd0c3361	00230000-5602-9fdc-4e44-550e86b80872	popa
00240000-5602-9fdc-222d-9ade9af5c293	00230000-5602-9fdc-4e44-550e86b80872	oseba
00240000-5602-9fdc-4f48-4d78a4beaeca	00230000-5602-9fdc-4e44-550e86b80872	sezona
00240000-5602-9fdc-c2d5-5b7780dfd6ec	00230000-5602-9fdc-0873-1d7707261e08	prostor
00240000-5602-9fdc-adc8-0e32385eb038	00230000-5602-9fdc-4e44-550e86b80872	besedilo
00240000-5602-9fdc-57f6-93fba073a6d9	00230000-5602-9fdc-4e44-550e86b80872	uprizoritev
00240000-5602-9fdc-e9cc-09408c836b28	00230000-5602-9fdc-4e44-550e86b80872	funkcija
00240000-5602-9fdc-2c7e-8358dd99fd93	00230000-5602-9fdc-4e44-550e86b80872	tipfunkcije
00240000-5602-9fdc-e386-a1d653eb98da	00230000-5602-9fdc-4e44-550e86b80872	alternacija
00240000-5602-9fdc-4cbd-23ceb51c2151	00230000-5602-9fdc-7d36-8efee711a0a7	pogodba
00240000-5602-9fdc-7404-03b119332b40	00230000-5602-9fdc-4e44-550e86b80872	zaposlitev
00240000-5602-9fdc-75c0-604aacdb43da	00230000-5602-9fdc-4e44-550e86b80872	zvrstuprizoritve
00240000-5602-9fdc-1313-28e64ffe1be7	00230000-5602-9fdc-7d36-8efee711a0a7	programdela
00240000-5602-9fdc-c160-92989b1ddb06	00230000-5602-9fdc-4e44-550e86b80872	zapis
\.


--
-- TOC entry 2964 (class 0 OID 20556899)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0f0ceb23-acb1-4665-8e76-92e48766e437	00240000-5602-9fdc-80a3-3fcecd0c3361	0	1001
\.


--
-- TOC entry 3013 (class 0 OID 20557405)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5602-9fde-b3f1-072bdeff3e61	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	00080000-5602-9fdd-fcf3-f64094c8b7f5	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5602-9fdc-bd40-6800e8a37cd3
00270000-5602-9fde-7338-986a7b85c075	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	00080000-5602-9fdd-fcf3-f64094c8b7f5	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5602-9fdc-bd40-6800e8a37cd3
\.


--
-- TOC entry 2977 (class 0 OID 20557025)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20557234)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5602-9fde-7776-240235e22827	00180000-5602-9fde-7f7b-42580db62ecb	000c0000-5602-9fde-54a1-65b32fee7dda	00090000-5602-9fde-1a14-d8654d0f4965	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9fde-574e-88ff1ba642cf	00180000-5602-9fde-7f7b-42580db62ecb	000c0000-5602-9fde-1784-8b793fce351a	00090000-5602-9fde-a757-aaa71b7bc90e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9fde-464e-c289d7392170	00180000-5602-9fde-7f7b-42580db62ecb	000c0000-5602-9fde-6cdf-77760ec5fea3	00090000-5602-9fde-c5c5-82c7bbd49ce4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9fde-6cc1-62616a904a4b	00180000-5602-9fde-7f7b-42580db62ecb	000c0000-5602-9fde-a668-bbf09a73cb9f	00090000-5602-9fde-3627-460f6d7d56be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9fde-692f-7b3e61975e30	00180000-5602-9fde-7f7b-42580db62ecb	000c0000-5602-9fde-1a53-52a03baf456d	00090000-5602-9fde-7416-7e1d6e8892f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9fde-ee19-8dbb386bd077	00180000-5602-9fde-170b-0dacb3ce2c1d	\N	00090000-5602-9fde-7416-7e1d6e8892f4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3016 (class 0 OID 20557446)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5602-9fdc-1b6e-ab3579b3d04c	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5602-9fdc-cc7b-a7b14cd64fbf	02	Priredba	Priredba	Priredba	umetnik
000f0000-5602-9fdc-217e-30335fb2a797	03	Prevod	Prevod	Prevod	umetnik
000f0000-5602-9fdc-5e2a-374c72ebd150	04	Režija	Režija	Režija	umetnik
000f0000-5602-9fdc-3cd0-1be480047da1	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5602-9fdc-fc44-2211bdcafa92	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5602-9fdc-1869-c1cb632118ea	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5602-9fdc-11d2-a133f63b2acc	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5602-9fdc-4c5c-7796875219c5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5602-9fdc-1044-c3605dd5aa24	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5602-9fdc-8e5e-33f56cb6a0d1	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5602-9fdc-b0c6-f6c2324b071c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5602-9fdc-f54d-03c2f8d98e91	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5602-9fdc-33a9-6466f2a474b5	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5602-9fdc-a816-62726f823297	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5602-9fdc-8eaf-50002d86a792	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5602-9fdc-825d-7be6174a1379	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5602-9fdc-7014-603796315af1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3029 (class 0 OID 20557691)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5602-9fdb-1299-8f8409cbbae2	01	Velika predstava	f	1.00	1.00
002b0000-5602-9fdb-ade9-45d5087c01af	02	Mala predstava	f	0.50	0.50
002b0000-5602-9fdb-a2f5-92f87f1b6fa7	03	Mala koprodukcija	t	0.40	1.00
002b0000-5602-9fdb-0df3-287d2006b7d6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5602-9fdb-6b35-fe780db7c879	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2982 (class 0 OID 20557087)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20556934)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5602-9fdc-89a3-72ee5cf63568	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwGleB3/hOQtdSuPxvc6DE3S0PsqytIi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-178e-0ef561bae363	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-e7bf-a6ff5ed2fec3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-249a-5f9018273571	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-6836-787ac4448b0c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-ff91-2f185f6209b6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-4e17-f13c9c46b788	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-aaee-98cd36052086	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-bfb4-3d9f681f8c91	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-5935-5d6ee0ceb13c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5602-9fdd-be42-f130c3be21c8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5602-9fdc-1557-d793ad0a0311	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3020 (class 0 OID 20557496)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5602-9fde-f71b-8e1e93ca0416	00160000-5602-9fdd-39ac-8d00b311f8dc	\N	00140000-5602-9fdc-0745-c1895507cb8c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		00220000-5602-9fdd-9808-1aa9f655f309
000e0000-5602-9fde-c36e-a3bc7e9b7a2b	00160000-5602-9fdd-4c1a-8fd53d8ae4b5	\N	00140000-5602-9fdc-081c-4a360d48e3e5	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		00220000-5602-9fdd-bfcb-ae5edd4c0cca
000e0000-5602-9fde-e7cb-d5601fb0fe15	\N	\N	00140000-5602-9fdc-081c-4a360d48e3e5	00190000-5602-9fdd-d618-7b406c2aa693	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-9fdd-9808-1aa9f655f309
000e0000-5602-9fde-99bc-3e75ff310bee	\N	\N	00140000-5602-9fdc-081c-4a360d48e3e5	00190000-5602-9fdd-d618-7b406c2aa693	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-9fdd-9808-1aa9f655f309
000e0000-5602-9fde-ed90-fb0eec14073f	\N	\N	00140000-5602-9fdc-081c-4a360d48e3e5	00190000-5602-9fdd-d618-7b406c2aa693	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5602-9fdd-e9d2-c77179b6d2df
000e0000-5602-9fde-fd22-182cc0c0ca84	\N	\N	00140000-5602-9fdc-081c-4a360d48e3e5	00190000-5602-9fdd-d618-7b406c2aa693	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5602-9fdd-e9d2-c77179b6d2df
\.


--
-- TOC entry 2989 (class 0 OID 20557177)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5602-9fde-67e0-c957f81969b1	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	\N	1	
00200000-5602-9fde-4cda-5e09d2599501	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	\N	2	
00200000-5602-9fde-ba24-37d92593d4f4	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	\N	3	
00200000-5602-9fde-d9cf-1752466d832c	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	\N	4	
00200000-5602-9fde-ca24-1c03ef6c3e44	000e0000-5602-9fde-c36e-a3bc7e9b7a2b	\N	5	
\.


--
-- TOC entry 3003 (class 0 OID 20557305)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20557419)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5602-9fdc-7cf4-d71041b13870	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5602-9fdc-7bd2-c5bb0b50d9af	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5602-9fdc-20ef-3b9b432ca38e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5602-9fdc-0265-336d04557656	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5602-9fdc-6ac5-4c8ec17b5820	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5602-9fdc-6bfd-1f394dedcf65	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5602-9fdc-c75b-a51e0dd25d04	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5602-9fdc-80e9-d7094d25072d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5602-9fdc-bd40-6800e8a37cd3	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5602-9fdc-0a90-3e7b87c38924	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5602-9fdc-966b-94fa3af308a9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5602-9fdc-be69-0396914bbbe8	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5602-9fdc-68df-ea15b5e018fb	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5602-9fdc-57e3-0d4b0c4c0797	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5602-9fdc-987f-ca21665b813e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5602-9fdc-0f1c-e22368ef6a79	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5602-9fdc-145b-0aab1c18c7da	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5602-9fdc-8b77-e90429d4988b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5602-9fdc-53d6-a090b66952cb	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5602-9fdc-0993-3056e56c179a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5602-9fdc-be5a-71e10d2650bd	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5602-9fdc-3647-3b90df0f111e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5602-9fdc-344b-43fa07f6997e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5602-9fdc-7d6f-1f97ff6131c0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5602-9fdc-c1ff-f6700922c6aa	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5602-9fdc-b416-0f94e895cdc6	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5602-9fdc-1cbd-561369496b27	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5602-9fdc-923a-3278abd5f39a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3032 (class 0 OID 20557738)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20557710)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20557750)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20557378)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5602-9fde-65c2-405f802b5480	00090000-5602-9fde-a757-aaa71b7bc90e	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9fde-a387-3dcfe5993881	00090000-5602-9fde-c5c5-82c7bbd49ce4	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9fde-b5fe-4616e72261a2	00090000-5602-9fde-3d70-df7bfc5a4df3	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9fde-ab47-abd09ece212f	00090000-5602-9fde-02c7-de5cbef420ba	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9fde-4591-42c9078e4004	00090000-5602-9fde-1a14-d8654d0f4965	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9fde-0dcf-2b486b38cd85	00090000-5602-9fde-1200-6556e459ddcd	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2991 (class 0 OID 20557213)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20557486)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5602-9fdc-0745-c1895507cb8c	01	Drama	drama (SURS 01)
00140000-5602-9fdc-3215-74088c575446	02	Opera	opera (SURS 02)
00140000-5602-9fdc-ce05-3b524d63c185	03	Balet	balet (SURS 03)
00140000-5602-9fdc-c4de-3039a989d58e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5602-9fdc-e4c7-8424e3cf393c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5602-9fdc-081c-4a360d48e3e5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5602-9fdc-eb6e-158812d5b2cc	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3009 (class 0 OID 20557368)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2496 (class 2606 OID 20556988)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 20557545)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 20557535)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 20557402)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 20557444)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 20557790)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 20557202)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 20557223)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 20557708)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20557113)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 20557600)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 20557364)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 20557175)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20557151)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 20557127)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20557270)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 20557767)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 20557774)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2750 (class 2606 OID 20557798)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2608 (class 2606 OID 20557297)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 20557085)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20556997)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 20557021)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20556977)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2487 (class 2606 OID 20556962)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20557303)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 20557339)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 20557481)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20557049)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20557073)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20557661)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 20557276)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 20557063)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 20557163)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 20557288)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 20557670)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 20557678)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20557648)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20557689)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20557321)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 20557261)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 20557252)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 20557468)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 20557395)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 20557139)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20556933)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 20557330)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20556951)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2489 (class 2606 OID 20556971)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20557348)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 20557283)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 20557232)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20556921)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20556909)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 20556903)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20557415)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 20557030)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 20557243)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20557455)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20557701)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 20557098)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 20556946)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20557514)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 20557185)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20557311)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20557427)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20557748)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 20557732)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 20557756)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 20557386)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 20557217)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 20557494)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20557376)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 1259 OID 20557211)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2561 (class 1259 OID 20557212)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2562 (class 1259 OID 20557210)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2563 (class 1259 OID 20557209)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2564 (class 1259 OID 20557208)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2650 (class 1259 OID 20557416)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2651 (class 1259 OID 20557417)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 20557418)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2736 (class 1259 OID 20557769)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2737 (class 1259 OID 20557768)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2510 (class 1259 OID 20557051)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 20557304)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2723 (class 1259 OID 20557736)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2724 (class 1259 OID 20557735)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2725 (class 1259 OID 20557737)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2726 (class 1259 OID 20557734)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2727 (class 1259 OID 20557733)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 20557290)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2604 (class 1259 OID 20557289)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2555 (class 1259 OID 20557186)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20557365)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20557367)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2635 (class 1259 OID 20557366)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2535 (class 1259 OID 20557129)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2536 (class 1259 OID 20557128)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2714 (class 1259 OID 20557690)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2666 (class 1259 OID 20557483)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2667 (class 1259 OID 20557484)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 20557485)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2733 (class 1259 OID 20557757)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2675 (class 1259 OID 20557519)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2676 (class 1259 OID 20557516)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2677 (class 1259 OID 20557520)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2678 (class 1259 OID 20557518)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2679 (class 1259 OID 20557517)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2525 (class 1259 OID 20557100)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 20557099)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 20557024)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 20557331)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2491 (class 1259 OID 20556978)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2492 (class 1259 OID 20556979)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2626 (class 1259 OID 20557351)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2627 (class 1259 OID 20557350)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2628 (class 1259 OID 20557349)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 20557164)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 20557165)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 20556911)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2583 (class 1259 OID 20557256)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2584 (class 1259 OID 20557254)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2585 (class 1259 OID 20557253)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2586 (class 1259 OID 20557255)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2482 (class 1259 OID 20556952)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2483 (class 1259 OID 20556953)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 20557312)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2746 (class 1259 OID 20557791)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2648 (class 1259 OID 20557404)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 20557403)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2747 (class 1259 OID 20557799)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2748 (class 1259 OID 20557800)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2598 (class 1259 OID 20557277)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2642 (class 1259 OID 20557396)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2643 (class 1259 OID 20557397)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 20557605)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2697 (class 1259 OID 20557604)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2698 (class 1259 OID 20557601)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 20557602)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2700 (class 1259 OID 20557603)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 20557065)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 20557064)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2516 (class 1259 OID 20557066)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 20557325)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 20557324)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2706 (class 1259 OID 20557671)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2707 (class 1259 OID 20557672)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2689 (class 1259 OID 20557549)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2690 (class 1259 OID 20557550)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2691 (class 1259 OID 20557547)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2692 (class 1259 OID 20557548)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2639 (class 1259 OID 20557387)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 20557265)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2590 (class 1259 OID 20557264)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2591 (class 1259 OID 20557262)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2592 (class 1259 OID 20557263)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2685 (class 1259 OID 20557537)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 20557536)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 20557140)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2542 (class 1259 OID 20557154)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2543 (class 1259 OID 20557153)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2544 (class 1259 OID 20557152)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2545 (class 1259 OID 20557155)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2554 (class 1259 OID 20557176)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2703 (class 1259 OID 20557662)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2722 (class 1259 OID 20557709)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2740 (class 1259 OID 20557775)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2741 (class 1259 OID 20557776)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2497 (class 1259 OID 20556999)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2498 (class 1259 OID 20556998)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2506 (class 1259 OID 20557031)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2507 (class 1259 OID 20557032)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 20557218)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20557246)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20557245)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2580 (class 1259 OID 20557244)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2565 (class 1259 OID 20557204)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2566 (class 1259 OID 20557205)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2567 (class 1259 OID 20557203)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2568 (class 1259 OID 20557207)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2569 (class 1259 OID 20557206)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2513 (class 1259 OID 20557050)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20557114)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20557116)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2533 (class 1259 OID 20557115)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2534 (class 1259 OID 20557117)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2597 (class 1259 OID 20557271)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 20557482)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 20557515)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20557456)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20557457)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2504 (class 1259 OID 20557022)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2505 (class 1259 OID 20557023)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2636 (class 1259 OID 20557377)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 20556922)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 20557086)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2474 (class 1259 OID 20556910)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2719 (class 1259 OID 20557702)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 20557323)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2620 (class 1259 OID 20557322)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 20557546)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 20557074)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 20557495)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 20557749)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2712 (class 1259 OID 20557679)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 20557680)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 20557445)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2577 (class 1259 OID 20557233)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 20556972)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2777 (class 2606 OID 20557931)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2778 (class 2606 OID 20557936)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2782 (class 2606 OID 20557956)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2776 (class 2606 OID 20557926)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2780 (class 2606 OID 20557946)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2781 (class 2606 OID 20557951)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2779 (class 2606 OID 20557941)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2815 (class 2606 OID 20558121)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2816 (class 2606 OID 20558126)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2817 (class 2606 OID 20558131)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2850 (class 2606 OID 20558296)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 20558291)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 20557856)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2799 (class 2606 OID 20558041)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2846 (class 2606 OID 20558276)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20558271)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 20558281)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 20558266)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2843 (class 2606 OID 20558261)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2798 (class 2606 OID 20558036)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2797 (class 2606 OID 20558031)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2775 (class 2606 OID 20557921)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 20558081)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2809 (class 2606 OID 20558091)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2808 (class 2606 OID 20558086)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2769 (class 2606 OID 20557891)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20557886)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 20558021)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20558251)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2818 (class 2606 OID 20558136)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 20558141)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2820 (class 2606 OID 20558146)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2848 (class 2606 OID 20558286)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2824 (class 2606 OID 20558166)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2821 (class 2606 OID 20558151)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2825 (class 2606 OID 20558171)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2823 (class 2606 OID 20558161)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2822 (class 2606 OID 20558156)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2767 (class 2606 OID 20557881)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20557876)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 20557841)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2758 (class 2606 OID 20557836)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2803 (class 2606 OID 20558061)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2754 (class 2606 OID 20557816)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2755 (class 2606 OID 20557821)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2806 (class 2606 OID 20558076)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2805 (class 2606 OID 20558071)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2804 (class 2606 OID 20558066)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2772 (class 2606 OID 20557906)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 20557911)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2751 (class 2606 OID 20557801)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 20557996)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2788 (class 2606 OID 20557986)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 20557981)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2789 (class 2606 OID 20557991)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2752 (class 2606 OID 20557806)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2753 (class 2606 OID 20557811)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2800 (class 2606 OID 20558046)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2853 (class 2606 OID 20558311)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 20558116)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2813 (class 2606 OID 20558111)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2854 (class 2606 OID 20558316)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2855 (class 2606 OID 20558321)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2796 (class 2606 OID 20558026)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2811 (class 2606 OID 20558101)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2812 (class 2606 OID 20558106)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2836 (class 2606 OID 20558226)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2835 (class 2606 OID 20558221)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 20558206)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 20558211)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2834 (class 2606 OID 20558216)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2764 (class 2606 OID 20557866)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 20557861)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 20557871)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 20558056)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2801 (class 2606 OID 20558051)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 20558236)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2839 (class 2606 OID 20558241)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2830 (class 2606 OID 20558196)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 20558201)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2828 (class 2606 OID 20558186)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2829 (class 2606 OID 20558191)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2810 (class 2606 OID 20558096)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 20558016)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2793 (class 2606 OID 20558011)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 20558001)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2792 (class 2606 OID 20558006)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 20558181)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2826 (class 2606 OID 20558176)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 20557896)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2771 (class 2606 OID 20557901)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 20557916)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 20558231)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2840 (class 2606 OID 20558246)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20558256)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2851 (class 2606 OID 20558301)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2852 (class 2606 OID 20558306)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2757 (class 2606 OID 20557831)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2756 (class 2606 OID 20557826)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2760 (class 2606 OID 20557846)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 20557851)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 20557961)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 20557976)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20557971)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2784 (class 2606 OID 20557966)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-23 14:49:36 CEST

--
-- PostgreSQL database dump complete
--

