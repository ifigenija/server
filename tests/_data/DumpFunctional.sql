--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-06 12:27:07 CEST

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
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21353862)
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
-- TOC entry 229 (class 1259 OID 21354419)
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
-- TOC entry 228 (class 1259 OID 21354402)
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
-- TOC entry 219 (class 1259 OID 21354279)
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
-- TOC entry 222 (class 1259 OID 21354309)
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
-- TOC entry 243 (class 1259 OID 21354664)
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
-- TOC entry 197 (class 1259 OID 21354070)
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
-- TOC entry 199 (class 1259 OID 21354101)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21354590)
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
-- TOC entry 190 (class 1259 OID 21353983)
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
-- TOC entry 230 (class 1259 OID 21354432)
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
-- TOC entry 215 (class 1259 OID 21354234)
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
-- TOC entry 195 (class 1259 OID 21354049)
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
-- TOC entry 193 (class 1259 OID 21354023)
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
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21354000)
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
-- TOC entry 204 (class 1259 OID 21354148)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21354645)
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
-- TOC entry 242 (class 1259 OID 21354657)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21354679)
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
-- TOC entry 208 (class 1259 OID 21354173)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21353957)
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
-- TOC entry 182 (class 1259 OID 21353871)
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
-- TOC entry 183 (class 1259 OID 21353882)
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
-- TOC entry 178 (class 1259 OID 21353836)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21353855)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21354180)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21354214)
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
-- TOC entry 225 (class 1259 OID 21354350)
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
-- TOC entry 185 (class 1259 OID 21353915)
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
-- TOC entry 187 (class 1259 OID 21353949)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21354535)
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
-- TOC entry 205 (class 1259 OID 21354154)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21353934)
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
-- TOC entry 194 (class 1259 OID 21354038)
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
-- TOC entry 207 (class 1259 OID 21354166)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21354549)
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
-- TOC entry 234 (class 1259 OID 21354559)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21354492)
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
-- TOC entry 235 (class 1259 OID 21354567)
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
-- TOC entry 211 (class 1259 OID 21354195)
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
-- TOC entry 203 (class 1259 OID 21354139)
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
-- TOC entry 202 (class 1259 OID 21354129)
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
-- TOC entry 224 (class 1259 OID 21354339)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21354269)
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
-- TOC entry 192 (class 1259 OID 21354012)
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
-- TOC entry 175 (class 1259 OID 21353807)
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
-- TOC entry 174 (class 1259 OID 21353805)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21354208)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21353845)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21353829)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21354222)
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
-- TOC entry 206 (class 1259 OID 21354160)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21354106)
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
-- TOC entry 173 (class 1259 OID 21353794)
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
-- TOC entry 172 (class 1259 OID 21353786)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21353781)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21354286)
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
-- TOC entry 184 (class 1259 OID 21353907)
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
-- TOC entry 201 (class 1259 OID 21354116)
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
-- TOC entry 223 (class 1259 OID 21354327)
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
-- TOC entry 236 (class 1259 OID 21354578)
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
-- TOC entry 189 (class 1259 OID 21353969)
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
-- TOC entry 176 (class 1259 OID 21353816)
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
-- TOC entry 227 (class 1259 OID 21354377)
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
-- TOC entry 196 (class 1259 OID 21354060)
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
-- TOC entry 210 (class 1259 OID 21354187)
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
-- TOC entry 221 (class 1259 OID 21354300)
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
-- TOC entry 239 (class 1259 OID 21354625)
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
-- TOC entry 238 (class 1259 OID 21354597)
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
-- TOC entry 240 (class 1259 OID 21354637)
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
-- TOC entry 217 (class 1259 OID 21354259)
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
-- TOC entry 198 (class 1259 OID 21354095)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21354367)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21354249)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21353810)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2980 (class 0 OID 21353862)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 21354419)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5613-a1f9-e1d6-2d6bad8e6ca6	000d0000-5613-a1f9-0070-5a48e9d8c795	\N	00090000-5613-a1f8-87dd-d9c9508f5785	000b0000-5613-a1f8-897a-5c6159e65cf7	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5613-a1f9-2445-d042973c7523	000d0000-5613-a1f9-1973-77ed08e5065b	00100000-5613-a1f8-e3af-f80bda2bff7c	00090000-5613-a1f8-c585-d6fc62aa0080	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5613-a1f9-bc13-f5df87db65d3	000d0000-5613-a1f9-b0ce-a87d87318ee5	00100000-5613-a1f8-86bd-71570df15ae4	00090000-5613-a1f8-ec89-0fe356df2dad	\N	0003	t	\N	2015-10-06	\N	2	t	\N	f	f
000c0000-5613-a1f9-5bc1-e4fd43342009	000d0000-5613-a1f9-9233-cd0e361deb67	\N	00090000-5613-a1f8-ecf4-3043dad5e9bc	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5613-a1f9-1f93-3a4325138be5	000d0000-5613-a1f9-a2b8-928233be1914	\N	00090000-5613-a1f8-82dd-f5bf1d1b805b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5613-a1f9-686a-3ad73c274572	000d0000-5613-a1f9-0026-479492074c82	\N	00090000-5613-a1f8-3109-669856e996f3	000b0000-5613-a1f8-5dbc-8fca1717da46	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5613-a1f9-aa4d-f99206cfaa90	000d0000-5613-a1f9-7a7c-22bcbab01be0	00100000-5613-a1f8-252b-19ec7692ef80	00090000-5613-a1f8-7cfd-c988ac29bc0a	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5613-a1f9-3992-86fb1dc57107	000d0000-5613-a1f9-082e-5bc8031107e3	\N	00090000-5613-a1f8-5a6e-efd2da3f4d30	000b0000-5613-a1f8-0b3d-c818bf149f4a	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5613-a1f9-d119-412aac5f210f	000d0000-5613-a1f9-7a7c-22bcbab01be0	00100000-5613-a1f8-72a7-20cf27a02f08	00090000-5613-a1f8-e095-15eaa6b3cb25	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5613-a1f9-5e36-5e4ca85a597f	000d0000-5613-a1f9-7a7c-22bcbab01be0	00100000-5613-a1f8-37d0-64315899040d	00090000-5613-a1f8-f1b2-2f26814956c6	\N	0010	t	\N	2015-10-06	\N	16	f	\N	f	t
000c0000-5613-a1f9-d79d-afb0d5a51db2	000d0000-5613-a1f9-7a7c-22bcbab01be0	00100000-5613-a1f8-fcdd-04ff0870b578	00090000-5613-a1f8-864c-6a1c748d2b6a	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5613-a1f9-99a0-601d7c49e6e9	000d0000-5613-a1f9-5667-91a82b7f2490	\N	00090000-5613-a1f8-c585-d6fc62aa0080	000b0000-5613-a1f8-ff68-a274732e5b11	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3027 (class 0 OID 21354402)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21354279)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5613-a1f8-51fc-9d63acf1dc94	00160000-5613-a1f8-b9b7-aae91a22818a	00090000-5613-a1f8-c0aa-bfd10f07ada7	aizv	10	t
003d0000-5613-a1f8-86dd-37c8a14675e5	00160000-5613-a1f8-b9b7-aae91a22818a	00090000-5613-a1f8-ca19-14a9fb8f5c16	apri	14	t
003d0000-5613-a1f8-fc11-a310d7da8552	00160000-5613-a1f8-451e-1b3442d6c2bd	00090000-5613-a1f8-d0f9-e34df7f7a51a	aizv	11	t
003d0000-5613-a1f8-819a-ce29a7a1b7a0	00160000-5613-a1f8-32ad-89ceaf270f22	00090000-5613-a1f8-49e8-5866b99c5e45	aizv	12	t
003d0000-5613-a1f8-bfee-402ab34e9cfc	00160000-5613-a1f8-b9b7-aae91a22818a	00090000-5613-a1f8-d046-30b7eb66413b	apri	18	f
\.


--
-- TOC entry 3021 (class 0 OID 21354309)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5613-a1f8-b9b7-aae91a22818a	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5613-a1f8-451e-1b3442d6c2bd	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5613-a1f8-32ad-89ceaf270f22	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3042 (class 0 OID 21354664)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21354070)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5613-a1f9-9804-b3fc1c85ff23	\N	\N	00200000-5613-a1f9-e9d6-0f132c28ee42	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5613-a1f9-c3bc-943b567e0ca9	\N	\N	00200000-5613-a1f9-9c00-6648a7212088	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5613-a1f9-312d-65b3b25b3291	\N	\N	00200000-5613-a1f9-88e1-a19de0747f88	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5613-a1f9-ed16-0d50924067ba	\N	\N	00200000-5613-a1f9-3d93-b6d89f18c49d	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5613-a1f9-0915-849dcf4737ae	\N	\N	00200000-5613-a1f9-f5ee-3fe819113371	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2998 (class 0 OID 21354101)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21354590)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21353983)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5613-a1f6-f602-6d7cdfdc8910	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5613-a1f6-3d04-cca0da7e03a5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5613-a1f6-e607-1a20ae513a79	AL	ALB	008	Albania 	Albanija	\N
00040000-5613-a1f6-52d5-cc233c6a33ed	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5613-a1f6-55ca-99725a9de952	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5613-a1f6-e68d-6b51985b980a	AD	AND	020	Andorra 	Andora	\N
00040000-5613-a1f6-9065-23d130e8af0a	AO	AGO	024	Angola 	Angola	\N
00040000-5613-a1f6-aac9-d64afd1fdbb5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5613-a1f6-c99a-d072ae20a48c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5613-a1f6-72fa-f51fab203088	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-a1f6-f0e3-0494505f5989	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5613-a1f6-6e0e-f2ec80748a0a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5613-a1f6-6e6d-911ea70332a0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5613-a1f6-b607-0a6aa592bae0	AU	AUS	036	Australia 	Avstralija	\N
00040000-5613-a1f6-36af-a51e207e3545	AT	AUT	040	Austria 	Avstrija	\N
00040000-5613-a1f6-0b35-93e4e2f8f7df	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5613-a1f6-3f94-fba7988a46d1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5613-a1f6-743c-cbd1ca278015	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5613-a1f6-e395-f37ad988b5b9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5613-a1f6-8cbd-3f10155cf5f0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5613-a1f6-fc6f-76625b9f8515	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5613-a1f6-4c19-f89f7a627d3f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5613-a1f6-04f8-20b42a575536	BZ	BLZ	084	Belize 	Belize	\N
00040000-5613-a1f6-e500-2a8aaac0ba66	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5613-a1f6-181c-b5703e5994da	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5613-a1f6-c1bc-8380320828fa	BT	BTN	064	Bhutan 	Butan	\N
00040000-5613-a1f6-ccb4-cdbf1eb016db	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5613-a1f6-9d1f-fc9cf12dd7c6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5613-a1f6-5968-8c7f60c98fe1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5613-a1f6-355d-6d4f4d500770	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5613-a1f6-3079-e64f1812a394	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5613-a1f6-94fe-a02d76fa470e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5613-a1f6-42ca-89131c11b4cb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5613-a1f6-877b-8c65fc3514e5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5613-a1f6-0605-825a80da043f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5613-a1f6-79aa-df712e705a21	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5613-a1f6-4cdf-d3a1d65f1ca1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5613-a1f6-dbc1-c1f5fb04c555	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5613-a1f6-67ca-e542d28a67b0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5613-a1f6-b49d-1d43f93013fd	CA	CAN	124	Canada 	Kanada	\N
00040000-5613-a1f6-a2e1-658f647936a5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5613-a1f6-edfa-7fb00f883ff2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5613-a1f6-66bd-1efe39338db3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5613-a1f6-8373-ca8eb55aee95	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5613-a1f6-2747-1a4cce32edd5	CL	CHL	152	Chile 	Čile	\N
00040000-5613-a1f6-2705-5ecce5efbd34	CN	CHN	156	China 	Kitajska	\N
00040000-5613-a1f6-5c10-79d43d52bbc1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5613-a1f6-1be8-669d38fd4941	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5613-a1f6-7fc0-a945809c16d0	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5613-a1f6-85e2-4c8fac87040d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5613-a1f6-415d-8b1c1ba26c5a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5613-a1f6-0189-24363c7131bf	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5613-a1f6-e30f-8dd966d6dff7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5613-a1f6-9b20-837c18cb10d0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5613-a1f6-1c47-c250ce5697a0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5613-a1f6-86ca-307313423bd2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5613-a1f6-9601-8729e5e3b1b2	CU	CUB	192	Cuba 	Kuba	\N
00040000-5613-a1f6-62d0-e471eaad8214	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5613-a1f6-abed-07a214748792	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5613-a1f6-0886-f4abd6038d66	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5613-a1f6-e131-4c5edc7aaf76	DK	DNK	208	Denmark 	Danska	\N
00040000-5613-a1f6-0dc8-8b50d7bb3252	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5613-a1f6-e04b-328f93d3f99d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-a1f6-d70d-c16dd0deac5c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5613-a1f6-7fd2-13481972e6c0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5613-a1f6-fc5d-0a1f0acd1420	EG	EGY	818	Egypt 	Egipt	\N
00040000-5613-a1f6-b044-882bfba0a738	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5613-a1f6-753b-da47bc3b50d0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5613-a1f6-d345-857a95b148df	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5613-a1f6-db3c-5230c6bbd7da	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5613-a1f6-9507-07feedea6e82	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5613-a1f6-0af7-19c9a249ec8e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5613-a1f6-4f20-57d1d47f0313	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5613-a1f6-d149-b69b49d2fe5c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5613-a1f6-2e24-6df3e9c0baea	FI	FIN	246	Finland 	Finska	\N
00040000-5613-a1f6-f5e7-b5c2b3de0a19	FR	FRA	250	France 	Francija	\N
00040000-5613-a1f6-071b-d785f4afca97	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5613-a1f6-ad90-4cd72be7262e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5613-a1f6-d6cc-28fa362b8b94	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5613-a1f6-00b5-ed19ae8d29e4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5613-a1f6-0080-ea194523a9a3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5613-a1f6-745d-fc6968f68a71	GM	GMB	270	Gambia 	Gambija	\N
00040000-5613-a1f6-e3f6-9fe7f21bdbd7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5613-a1f6-bd50-5e4995418d28	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5613-a1f6-7ede-2621947749bf	GH	GHA	288	Ghana 	Gana	\N
00040000-5613-a1f6-d94a-8501a226c029	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5613-a1f6-bb79-2d5539603545	GR	GRC	300	Greece 	Grčija	\N
00040000-5613-a1f6-f407-59c6ca2d77ef	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5613-a1f6-accf-0cda0a86107f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5613-a1f6-7267-50a63ac610d1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5613-a1f6-8e7c-88f4bffb9b92	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5613-a1f6-0860-e0216ba7217e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5613-a1f6-0127-6a9b8a760d43	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5613-a1f6-cc0b-9d757c71aef7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5613-a1f6-cf3b-1d006395e2df	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5613-a1f6-8deb-e4f0ffc9c8b3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5613-a1f6-d895-0f135734dd1a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5613-a1f6-2412-4957fa0a8576	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5613-a1f6-ab92-51bc7cd1550e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5613-a1f6-df2a-2b85bb0c566e	HN	HND	340	Honduras 	Honduras	\N
00040000-5613-a1f6-d9ef-098756192eb9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5613-a1f6-7e3a-1f18d8a01a89	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5613-a1f6-a5c3-6256c0d81476	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5613-a1f6-fc6f-6cd356ec1b85	IN	IND	356	India 	Indija	\N
00040000-5613-a1f6-740f-b134bdbfa5e0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5613-a1f6-dd23-47e58d05455a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5613-a1f6-a6d6-97a2e12b2042	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5613-a1f6-d4d7-43307f304f30	IE	IRL	372	Ireland 	Irska	\N
00040000-5613-a1f6-0034-5a47b75ea13a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5613-a1f6-749d-fd477a8420e8	IL	ISR	376	Israel 	Izrael	\N
00040000-5613-a1f6-7e04-0a7063a0e261	IT	ITA	380	Italy 	Italija	\N
00040000-5613-a1f6-19f8-91645c7c1a6e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5613-a1f6-0cc1-fd8d9968bc85	JP	JPN	392	Japan 	Japonska	\N
00040000-5613-a1f6-362d-d8caa7176e85	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5613-a1f6-5b95-c7cfcd1564e0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5613-a1f6-cf2f-77a6679b8bde	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5613-a1f6-f601-07eaa2f9e5d2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5613-a1f6-3568-d05c08a423c1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5613-a1f6-4bd2-99122a237dc9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5613-a1f6-22e9-7f68a9e5f53f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5613-a1f6-12b9-18acf1f97833	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5613-a1f6-d8fc-c09cb4d59a54	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5613-a1f6-975b-43495e17bded	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5613-a1f6-d50e-167961913cf3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5613-a1f6-b9a1-386f2fbbf51e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5613-a1f6-0d52-a207e473ce54	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5613-a1f6-2e31-bf942fcec9db	LR	LBR	430	Liberia 	Liberija	\N
00040000-5613-a1f6-5b0a-a204d4053fd4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5613-a1f6-fd9b-6cbe7e3625e2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5613-a1f6-11b2-33fc009d7062	LT	LTU	440	Lithuania 	Litva	\N
00040000-5613-a1f6-324a-f8598b323975	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5613-a1f6-facb-4916a4278878	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5613-a1f6-8881-e0490ff2ec5d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5613-a1f6-c285-2a2075ce18cc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5613-a1f6-9dba-4ff39a41ae3e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5613-a1f6-3c29-a6f9c06b7480	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5613-a1f6-60a7-979cd8cc6110	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5613-a1f6-9fc9-6ce5613e07b2	ML	MLI	466	Mali 	Mali	\N
00040000-5613-a1f6-a15e-3798ffe3e3f9	MT	MLT	470	Malta 	Malta	\N
00040000-5613-a1f6-8cc0-752efd97393d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5613-a1f6-a84e-bf578763ae84	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5613-a1f6-2552-eab127c76696	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5613-a1f6-b725-44705ba4cca4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5613-a1f6-1eb8-d3af1b69de62	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5613-a1f6-12cc-1d5a822550fe	MX	MEX	484	Mexico 	Mehika	\N
00040000-5613-a1f6-1026-336a37b8ca9c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5613-a1f6-7299-138a3cbf6f98	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5613-a1f6-7628-9a5d716e5b59	MC	MCO	492	Monaco 	Monako	\N
00040000-5613-a1f6-2f9f-80bd164b6655	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5613-a1f6-7275-53102303fe9f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5613-a1f6-20ba-8efdebcc05b7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5613-a1f6-197f-2462b1b11d0e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5613-a1f6-8f1e-3ecca90175b1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5613-a1f6-bcab-b7c40c688067	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5613-a1f6-4452-ed62bedb97ad	NA	NAM	516	Namibia 	Namibija	\N
00040000-5613-a1f6-8b2c-8cd77bfecfc9	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5613-a1f6-c46c-448c0b12a250	NP	NPL	524	Nepal 	Nepal	\N
00040000-5613-a1f6-f84c-756a58f6be85	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5613-a1f6-c95b-8f0b73eb5db0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5613-a1f6-2401-96a56b28924c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5613-a1f6-110f-e12bf06b953f	NE	NER	562	Niger 	Niger 	\N
00040000-5613-a1f6-77d8-55d8bd14aa8c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5613-a1f6-73e7-faffc0b9868e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5613-a1f6-5f71-a4250ee0e04f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5613-a1f6-ae8b-0f19149eabad	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5613-a1f6-21c2-a974043cdc8a	NO	NOR	578	Norway 	Norveška	\N
00040000-5613-a1f6-8fdc-b4681340b932	OM	OMN	512	Oman 	Oman	\N
00040000-5613-a1f6-6319-fab5c99ada06	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5613-a1f6-1622-2a669ddd8140	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5613-a1f6-f564-baaea1bc7c9f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5613-a1f6-85ea-37a1ead51b54	PA	PAN	591	Panama 	Panama	\N
00040000-5613-a1f6-3377-18dcf2733af8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5613-a1f6-bbef-ce6d16bde194	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5613-a1f6-0a2c-ab20516a0466	PE	PER	604	Peru 	Peru	\N
00040000-5613-a1f6-7c1d-60a1584189e8	PH	PHL	608	Philippines 	Filipini	\N
00040000-5613-a1f6-da10-b0d946df8fb7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5613-a1f6-980d-17f3e77ac49a	PL	POL	616	Poland 	Poljska	\N
00040000-5613-a1f6-9e58-3e5698d92d82	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5613-a1f6-0e63-d0e62f17008b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5613-a1f6-15ef-32ace9cf0c2b	QA	QAT	634	Qatar 	Katar	\N
00040000-5613-a1f6-7aa1-a41468890d46	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5613-a1f6-f346-7650f0f75654	RO	ROU	642	Romania 	Romunija	\N
00040000-5613-a1f6-ae67-b8a3d7263377	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5613-a1f6-91a1-c03bc3564844	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5613-a1f6-94c2-61b49afeb23d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5613-a1f6-46cd-e9a3b3dd72ca	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5613-a1f6-5192-bc6f79491c8c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5613-a1f6-7661-371ab8ec0b7a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5613-a1f6-7ef5-e3c7ecd031c3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5613-a1f6-8e83-b553b899adf8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5613-a1f6-a92a-772490ec3dea	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5613-a1f6-e2ef-0792d9154dcc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5613-a1f6-275d-5707e82f42c4	SM	SMR	674	San Marino 	San Marino	\N
00040000-5613-a1f6-498f-9db4b20c127a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5613-a1f6-26c6-efd3f2db1b73	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5613-a1f6-8b98-49854e19f788	SN	SEN	686	Senegal 	Senegal	\N
00040000-5613-a1f6-cef1-091068e48640	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5613-a1f6-e74d-0f63d589da07	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5613-a1f6-fefa-bc1eaeb98179	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5613-a1f6-a42a-c0d4ef6d005f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5613-a1f6-a958-6c7a717b9e74	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5613-a1f6-44d5-42ad40dbe859	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5613-a1f6-55be-95d1c083f6c2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5613-a1f6-67a4-7cdaf81a0eca	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5613-a1f6-86c9-c74102b87c5b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5613-a1f6-ca3f-e6129932a377	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5613-a1f6-d951-c017a426bd76	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5613-a1f6-ba57-f0568ef02a91	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5613-a1f6-d137-0e9611de2d25	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5613-a1f6-9517-d64a97b0bf79	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5613-a1f6-f6b6-a84f907dda45	SD	SDN	729	Sudan 	Sudan	\N
00040000-5613-a1f6-970b-8dfe3c5b6d3b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5613-a1f6-f5ff-f75bd09cf708	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5613-a1f6-5b9d-008add05e3c8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5613-a1f6-63cc-bbd252087ba4	SE	SWE	752	Sweden 	Švedska	\N
00040000-5613-a1f6-1b1b-723f704a35ef	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5613-a1f6-9e59-aafeac03dd16	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5613-a1f6-9123-ea1c3799d2fe	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5613-a1f6-d8f2-1cdb34303c30	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5613-a1f6-7299-a9feab500ce8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5613-a1f6-74ee-f911704674fe	TH	THA	764	Thailand 	Tajska	\N
00040000-5613-a1f6-2b6b-e369f0b1256c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5613-a1f6-0bdc-407d2f75af02	TG	TGO	768	Togo 	Togo	\N
00040000-5613-a1f6-d139-657b0e49aed0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5613-a1f6-0bb1-6f8421e19087	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5613-a1f6-da28-93b085b2cce8	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5613-a1f6-ef01-e1f7d04b1855	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5613-a1f6-7e5b-5958b0f397b4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5613-a1f6-fb00-793fc6f9e394	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5613-a1f6-fbdf-b45ebb072e2c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-a1f6-f859-d07d2cbe0d01	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5613-a1f6-715c-9505ff3b3473	UG	UGA	800	Uganda 	Uganda	\N
00040000-5613-a1f6-aad7-8882fe3f967d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5613-a1f6-e5ef-3cc2ccd0ab89	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5613-a1f6-4f59-da7c3bf79e39	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5613-a1f6-bb38-5aba93df2a09	US	USA	840	United States 	Združene države Amerike	\N
00040000-5613-a1f6-2e8c-2f6ea5ef94d2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5613-a1f6-3523-901f54518382	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5613-a1f6-f7a1-cea1278ae9e0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5613-a1f6-7a75-c0faa50f97dc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5613-a1f6-95df-228ae024042f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5613-a1f6-cea7-e0c255baa111	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5613-a1f6-7be9-f17bd328b6a4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-a1f6-3d06-c2b78a0b5b52	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5613-a1f6-0363-d01f3c331032	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5613-a1f6-e1d8-2403d3dc120d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5613-a1f6-4f4a-c72a6383db2e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5613-a1f6-cc90-430a34a58b87	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5613-a1f6-7e61-2e766a373778	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3029 (class 0 OID 21354432)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5613-a1f9-5f15-4774cffb9ade	000e0000-5613-a1f8-e2b5-e29d73d7eb26	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-a1f6-d215-06eb28e6e489	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-a1f9-7239-8783bdc38015	000e0000-5613-a1f8-13af-032753195830	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-a1f6-dd6e-0cd0d032fceb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-a1f9-0857-8805fccf624f	000e0000-5613-a1f8-a2b4-1638fad875af	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-a1f6-d215-06eb28e6e489	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-a1f9-271e-940f976d2ba4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-a1f9-cc16-924b20c2c851	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 21354234)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5613-a1f9-0070-5a48e9d8c795	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-e1d6-2d6bad8e6ca6	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-a1f6-5f2f-cec20ff65bb3
000d0000-5613-a1f9-1973-77ed08e5065b	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-2445-d042973c7523	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5613-a1f6-0a83-df140e415869
000d0000-5613-a1f9-b0ce-a87d87318ee5	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-bc13-f5df87db65d3	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5613-a1f6-52ee-a0eef19a930a
000d0000-5613-a1f9-9233-cd0e361deb67	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-5bc1-e4fd43342009	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5613-a1f6-0b68-88828d1ee62a
000d0000-5613-a1f9-a2b8-928233be1914	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-1f93-3a4325138be5	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5613-a1f6-0b68-88828d1ee62a
000d0000-5613-a1f9-0026-479492074c82	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-686a-3ad73c274572	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-a1f6-5f2f-cec20ff65bb3
000d0000-5613-a1f9-7a7c-22bcbab01be0	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-d119-412aac5f210f	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5613-a1f6-5f2f-cec20ff65bb3
000d0000-5613-a1f9-082e-5bc8031107e3	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-3992-86fb1dc57107	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5613-a1f6-ae6e-dc8fd4265243
000d0000-5613-a1f9-5667-91a82b7f2490	000e0000-5613-a1f8-13af-032753195830	000c0000-5613-a1f9-99a0-601d7c49e6e9	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5613-a1f6-a327-030ff96a6773
\.


--
-- TOC entry 2994 (class 0 OID 21354049)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21354023)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 21354000)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5613-a1f8-2699-3dff1be24381	00080000-5613-a1f8-f423-afb137176188	00090000-5613-a1f8-f1b2-2f26814956c6	AK		igralka
\.


--
-- TOC entry 3003 (class 0 OID 21354148)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21354645)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 21354657)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21354679)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21093458)
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
-- TOC entry 3007 (class 0 OID 21354173)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21353957)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5613-a1f7-d658-5b95cd5c3bbd	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5613-a1f7-4975-0b7f5bed88fc	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5613-a1f7-78ec-43175e26a081	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5613-a1f7-7075-d1b1351b04ce	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5613-a1f7-814e-356e4a222f9d	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5613-a1f7-6089-acd7325272b4	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5613-a1f7-67ac-ebcda61e85dc	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5613-a1f7-ac24-b11ffc09d6ca	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-a1f7-4e89-9a02b0598e82	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-a1f7-b560-aa8f4faf4fee	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5613-a1f7-b90e-0c981ee00a42	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5613-a1f7-2ac7-71a0a804f2a4	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5613-a1f7-dc3b-6ff4783332d5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5613-a1f7-244a-0b9e90103dc1	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5613-a1f7-4ad4-8fb2c3e4a073	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5613-a1f8-58e1-3808cd64e171	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5613-a1f8-fc13-ebf2d6e92138	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5613-a1f8-309b-0a84ee10e7c5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5613-a1f8-3437-7b55d8651b01	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5613-a1f8-d90c-db3a7e60bbca	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5613-a1fa-b674-ffea519222aa	application.tenant.maticnopodjetje	string	s:36:"00080000-5613-a1fa-2be9-a7995e1878cb";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2981 (class 0 OID 21353871)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5613-a1f8-06b7-23ba1c731f5b	00000000-5613-a1f8-58e1-3808cd64e171	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5613-a1f8-3dab-c98ba4299bc1	00000000-5613-a1f8-58e1-3808cd64e171	00010000-5613-a1f7-26d6-fe0e886d86ce	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5613-a1f8-0fb9-7570fccacd35	00000000-5613-a1f8-fc13-ebf2d6e92138	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2982 (class 0 OID 21353882)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5613-a1f8-87dd-d9c9508f5785	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5613-a1f8-ecf4-3043dad5e9bc	00010000-5613-a1f8-76ef-428725aeb9b6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5613-a1f8-ec89-0fe356df2dad	00010000-5613-a1f8-7edc-8292af832f62	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5613-a1f8-e095-15eaa6b3cb25	00010000-5613-a1f8-959f-1c37c0f3fec4	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5613-a1f8-680e-6b4aa25d4b4a	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5613-a1f8-3109-669856e996f3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5613-a1f8-864c-6a1c748d2b6a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5613-a1f8-7cfd-c988ac29bc0a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5613-a1f8-f1b2-2f26814956c6	00010000-5613-a1f8-23d2-7db27ee79688	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5613-a1f8-c585-d6fc62aa0080	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5613-a1f8-7464-ba01ef9ba364	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-a1f8-82dd-f5bf1d1b805b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5613-a1f8-5a6e-efd2da3f4d30	00010000-5613-a1f8-d5c4-bff8eff22e33	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-a1f8-c0aa-bfd10f07ada7	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-a1f8-ca19-14a9fb8f5c16	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-a1f8-d0f9-e34df7f7a51a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-a1f8-49e8-5866b99c5e45	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5613-a1f8-d046-30b7eb66413b	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2977 (class 0 OID 21353836)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5613-a1f6-a4e9-b666f00d936e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5613-a1f6-ba2f-15da5927b6d7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5613-a1f6-ccec-65fbf175005e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5613-a1f6-366d-8ba3c8011fd4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5613-a1f6-237b-fdeccf313bea	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5613-a1f6-814f-fef0fcb1341d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5613-a1f6-2de7-88b581c25bdb	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5613-a1f6-09dc-b392bcc33599	Abonma-read	Abonma - branje	f
00030000-5613-a1f6-b600-8d7a13e13425	Abonma-write	Abonma - spreminjanje	f
00030000-5613-a1f6-a4f9-33d4224b4b28	Alternacija-read	Alternacija - branje	f
00030000-5613-a1f6-22de-d12791944b13	Alternacija-write	Alternacija - spreminjanje	f
00030000-5613-a1f6-b7fc-2e4e36626b54	Arhivalija-read	Arhivalija - branje	f
00030000-5613-a1f6-3812-5241bbb9147d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5613-a1f6-f2f5-8e91a6541d5a	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5613-a1f6-302c-6006f301b8f4	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5613-a1f6-dfb3-9beedd578c8e	Besedilo-read	Besedilo - branje	f
00030000-5613-a1f6-292e-83d8eccbd5fb	Besedilo-write	Besedilo - spreminjanje	f
00030000-5613-a1f6-80cc-c37cd345947b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5613-a1f6-7f1c-4c12f791b69d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5613-a1f6-cbbd-fdf80a661447	Dogodek-read	Dogodek - branje	f
00030000-5613-a1f6-845f-cf69723ed9d8	Dogodek-write	Dogodek - spreminjanje	f
00030000-5613-a1f6-e7bc-6378a54876e4	DrugiVir-read	DrugiVir - branje	f
00030000-5613-a1f6-5a3e-b33da58d583e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5613-a1f6-470e-7a849aee882d	Drzava-read	Drzava - branje	f
00030000-5613-a1f6-50de-f86e6c79baa9	Drzava-write	Drzava - spreminjanje	f
00030000-5613-a1f6-e51c-9e11e83c8dfc	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5613-a1f6-92bf-5487244be419	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5613-a1f6-0ddd-b68c00e133ec	Funkcija-read	Funkcija - branje	f
00030000-5613-a1f6-af94-8fc4320a27d4	Funkcija-write	Funkcija - spreminjanje	f
00030000-5613-a1f6-72a6-16aa2f0caef7	Gostovanje-read	Gostovanje - branje	f
00030000-5613-a1f6-2b19-034f31e6f421	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5613-a1f6-326b-e627e35761d0	Gostujoca-read	Gostujoca - branje	f
00030000-5613-a1f6-2c6d-56f3cbae4da1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5613-a1f6-1726-e83113182b5d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5613-a1f6-431a-f9f9d0391312	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5613-a1f6-c364-caaae2750271	Kupec-read	Kupec - branje	f
00030000-5613-a1f6-4675-2f4613d2a10b	Kupec-write	Kupec - spreminjanje	f
00030000-5613-a1f6-f289-cc24311b852b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5613-a1f6-4403-e868b51eb3fa	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5613-a1f6-0224-d2fae01ce379	Option-read	Option - branje	f
00030000-5613-a1f6-06e5-b07b1cfe46f6	Option-write	Option - spreminjanje	f
00030000-5613-a1f6-889d-3862b3f78e64	OptionValue-read	OptionValue - branje	f
00030000-5613-a1f6-ca28-0f8fa8f1959c	OptionValue-write	OptionValue - spreminjanje	f
00030000-5613-a1f6-62dd-a8e007574f5d	Oseba-read	Oseba - branje	f
00030000-5613-a1f6-b6b1-2e80fa36b834	Oseba-write	Oseba - spreminjanje	f
00030000-5613-a1f6-5651-9036d3883635	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5613-a1f6-0b48-8f7077e958e6	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5613-a1f6-aab2-d2c94fceb549	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5613-a1f6-c7fd-015e0f5132c4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5613-a1f6-3c35-c1ba01aaee38	Pogodba-read	Pogodba - branje	f
00030000-5613-a1f6-4dfc-eacc52f354db	Pogodba-write	Pogodba - spreminjanje	f
00030000-5613-a1f6-968b-a9e0a8202255	Popa-read	Popa - branje	f
00030000-5613-a1f6-416b-e32869a3aa61	Popa-write	Popa - spreminjanje	f
00030000-5613-a1f6-dd42-d3fdedde2968	Posta-read	Posta - branje	f
00030000-5613-a1f6-96d0-950fa57f433f	Posta-write	Posta - spreminjanje	f
00030000-5613-a1f6-a9e7-2d177980a9cc	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5613-a1f6-5daf-6df17abf3730	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5613-a1f6-9435-f31703c01bcc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5613-a1f6-a347-0ae1b463483a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5613-a1f6-6210-7aee6b6061d6	PostniNaslov-read	PostniNaslov - branje	f
00030000-5613-a1f6-f105-91995bdbe539	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5613-a1f6-fb96-cbd2033e4644	Predstava-read	Predstava - branje	f
00030000-5613-a1f6-37e0-251203974cec	Predstava-write	Predstava - spreminjanje	f
00030000-5613-a1f6-9d61-76a0615293fb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5613-a1f6-da26-39a09ebaf941	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5613-a1f6-071f-24ecae9d7e9e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5613-a1f6-5cde-4f6659171799	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5613-a1f6-94e0-8ed45e043c59	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5613-a1f6-df6c-ca8623449962	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5613-a1f6-e26c-1a6e32f7cc00	ProgramDela-read	ProgramDela - branje	f
00030000-5613-a1f6-bf86-d6fbb1805a7d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5613-a1f6-9b30-5c725c9da0ea	ProgramFestival-read	ProgramFestival - branje	f
00030000-5613-a1f6-b385-147eaf7c599a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5613-a1f6-b0eb-b506b77f42d2	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5613-a1f6-8084-e561fc25e568	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5613-a1f6-815a-7cfdb09f7424	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5613-a1f6-1648-a5430bd15c90	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5613-a1f6-beed-381f1c08da3c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5613-a1f6-062e-cfd83a5dbac2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5613-a1f6-4973-1a2f04e6bb49	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5613-a1f6-650f-03dbea5e3540	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5613-a1f6-0acf-5201223db457	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5613-a1f6-9748-6eb4c9f5cac6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5613-a1f6-ce3d-9d682c7076ef	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5613-a1f6-ddec-e4dcd8ee26a0	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5613-a1f6-1c3c-f1201b968206	ProgramRazno-read	ProgramRazno - branje	f
00030000-5613-a1f6-e485-4c36708dbe57	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5613-a1f6-9349-fafc3ae342ca	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5613-a1f6-f495-44674479b2b2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5613-a1f6-6211-7e7210b02851	Prostor-read	Prostor - branje	f
00030000-5613-a1f6-8e3c-9670359b204d	Prostor-write	Prostor - spreminjanje	f
00030000-5613-a1f6-7508-1b231c31aa1f	Racun-read	Racun - branje	f
00030000-5613-a1f6-623e-918fb090a0fe	Racun-write	Racun - spreminjanje	f
00030000-5613-a1f6-82ff-cbbc64b6b10e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5613-a1f6-aa20-769882fd5bda	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5613-a1f6-942e-57029c436b62	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5613-a1f6-543a-1e95318fb23b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5613-a1f6-96f3-b0596affe21f	Rekvizit-read	Rekvizit - branje	f
00030000-5613-a1f6-f7c4-a6f28590be6a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5613-a1f6-930f-fc0dd12ac77f	Revizija-read	Revizija - branje	f
00030000-5613-a1f6-91db-612a207b86e2	Revizija-write	Revizija - spreminjanje	f
00030000-5613-a1f6-73ae-2efbffabb867	Rezervacija-read	Rezervacija - branje	f
00030000-5613-a1f6-9282-28b25d16f43c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5613-a1f6-649b-fecf0220d88f	SedezniRed-read	SedezniRed - branje	f
00030000-5613-a1f6-01cb-98793cca187f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5613-a1f6-2792-d553ce753e30	Sedez-read	Sedez - branje	f
00030000-5613-a1f6-ed95-da295f4364a7	Sedez-write	Sedez - spreminjanje	f
00030000-5613-a1f6-cfa7-e269ab568149	Sezona-read	Sezona - branje	f
00030000-5613-a1f6-7b95-ae9b73e763f4	Sezona-write	Sezona - spreminjanje	f
00030000-5613-a1f6-049e-a802af7d70b6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5613-a1f6-8a73-bb0306063e1a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5613-a1f6-f27e-802d5e185eed	Stevilcenje-read	Stevilcenje - branje	f
00030000-5613-a1f6-0784-e16bdf9cb034	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5613-a1f6-3c5f-668daed678c6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5613-a1f6-062c-50bd7b9cefd8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5613-a1f6-0979-2f4a08dca7f1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5613-a1f6-ebd4-33f98a0f4d60	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5613-a1f6-ca4b-b220c22bfd50	Telefonska-read	Telefonska - branje	f
00030000-5613-a1f6-9580-9e808dfed203	Telefonska-write	Telefonska - spreminjanje	f
00030000-5613-a1f6-1f8a-73b2334dfda1	TerminStoritve-read	TerminStoritve - branje	f
00030000-5613-a1f6-0032-1d41096d1d44	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5613-a1f6-5cca-3f5de13c9d90	TipFunkcije-read	TipFunkcije - branje	f
00030000-5613-a1f6-44ef-f2cffc948fa1	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5613-a1f6-7e01-31dfa1b53e56	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5613-a1f6-791e-728862f654ab	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5613-a1f6-1aea-ae45954c0840	Trr-read	Trr - branje	f
00030000-5613-a1f6-b6a7-34d926d00b96	Trr-write	Trr - spreminjanje	f
00030000-5613-a1f6-adbe-3aa1f937ccb5	Uprizoritev-read	Uprizoritev - branje	f
00030000-5613-a1f6-709e-e57670484086	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5613-a1f6-7b4a-035333136f4a	Vaja-read	Vaja - branje	f
00030000-5613-a1f6-475c-dfa131f69077	Vaja-write	Vaja - spreminjanje	f
00030000-5613-a1f6-2131-b3b1bc87a54e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5613-a1f6-bc17-02fc5b5c9c88	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5613-a1f6-13c1-3cd86137ed63	VrstaStroska-read	VrstaStroska - branje	f
00030000-5613-a1f6-e3d8-16988a3ff516	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5613-a1f6-8584-97e5657219d1	Zaposlitev-read	Zaposlitev - branje	f
00030000-5613-a1f6-60ae-2c1788407c38	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5613-a1f6-dc43-0967f8b3b72a	Zasedenost-read	Zasedenost - branje	f
00030000-5613-a1f6-7b89-c147f5b10b5d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5613-a1f6-d998-489a7cfde8b6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5613-a1f6-36d3-b487be964422	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5613-a1f6-d807-26cc48b7633b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5613-a1f6-1b42-4ab8ea89a8a7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5613-a1f6-5d59-d4335fac362a	Job-read	Branje opravil - samo zase - branje	f
00030000-5613-a1f6-2f6d-31dc2fdbcc53	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5613-a1f6-e11a-ee6e3ecbc3e6	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5613-a1f6-bfe4-c7020372cd50	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5613-a1f6-dcd3-1da624fdd5c5	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5613-a1f6-a151-c0c2ce105c35	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5613-a1f6-578e-24f1df3fa71f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5613-a1f6-7f11-bbe8ba4f0a2c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-a1f6-f3d1-64395af8aa2e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-a1f6-8441-4482df238c9c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-a1f6-f728-8f7c13409c6b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-a1f6-e718-f42cd7211d87	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5613-a1f6-f2e0-15b02fa224d4	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5613-a1f6-09f5-c58d97df17de	Datoteka-write	Datoteka - spreminjanje	f
00030000-5613-a1f6-93c4-343d6a12fb77	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2979 (class 0 OID 21353855)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5613-a1f6-73fa-e11f7cc17786	00030000-5613-a1f6-ba2f-15da5927b6d7
00020000-5613-a1f6-b09f-09e2f5ac3d40	00030000-5613-a1f6-470e-7a849aee882d
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-09dc-b392bcc33599
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-b600-8d7a13e13425
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-a4f9-33d4224b4b28
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-22de-d12791944b13
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-b7fc-2e4e36626b54
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-cbbd-fdf80a661447
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-366d-8ba3c8011fd4
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-845f-cf69723ed9d8
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-470e-7a849aee882d
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-50de-f86e6c79baa9
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-0ddd-b68c00e133ec
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-af94-8fc4320a27d4
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-72a6-16aa2f0caef7
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-2b19-034f31e6f421
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-326b-e627e35761d0
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-2c6d-56f3cbae4da1
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-1726-e83113182b5d
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-431a-f9f9d0391312
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-0224-d2fae01ce379
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-889d-3862b3f78e64
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-62dd-a8e007574f5d
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-b6b1-2e80fa36b834
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-968b-a9e0a8202255
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-416b-e32869a3aa61
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-dd42-d3fdedde2968
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-96d0-950fa57f433f
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-6210-7aee6b6061d6
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-f105-91995bdbe539
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-fb96-cbd2033e4644
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-37e0-251203974cec
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-94e0-8ed45e043c59
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-df6c-ca8623449962
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-6211-7e7210b02851
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-8e3c-9670359b204d
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-942e-57029c436b62
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-543a-1e95318fb23b
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-96f3-b0596affe21f
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-f7c4-a6f28590be6a
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-cfa7-e269ab568149
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-7b95-ae9b73e763f4
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-5cca-3f5de13c9d90
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-adbe-3aa1f937ccb5
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-709e-e57670484086
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-7b4a-035333136f4a
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-475c-dfa131f69077
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-dc43-0967f8b3b72a
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-7b89-c147f5b10b5d
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-d998-489a7cfde8b6
00020000-5613-a1f6-6fe2-faeaeaf5595c	00030000-5613-a1f6-d807-26cc48b7633b
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-09dc-b392bcc33599
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-b7fc-2e4e36626b54
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-cbbd-fdf80a661447
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-470e-7a849aee882d
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-72a6-16aa2f0caef7
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-326b-e627e35761d0
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-1726-e83113182b5d
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-431a-f9f9d0391312
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-0224-d2fae01ce379
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-889d-3862b3f78e64
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-62dd-a8e007574f5d
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-b6b1-2e80fa36b834
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-968b-a9e0a8202255
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-dd42-d3fdedde2968
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-6210-7aee6b6061d6
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-f105-91995bdbe539
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-fb96-cbd2033e4644
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-6211-7e7210b02851
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-942e-57029c436b62
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-96f3-b0596affe21f
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-cfa7-e269ab568149
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-ca4b-b220c22bfd50
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-9580-9e808dfed203
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-1aea-ae45954c0840
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-b6a7-34d926d00b96
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-8584-97e5657219d1
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-60ae-2c1788407c38
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-d998-489a7cfde8b6
00020000-5613-a1f7-b8fe-93762234f00c	00030000-5613-a1f6-d807-26cc48b7633b
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-09dc-b392bcc33599
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-a4f9-33d4224b4b28
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-b7fc-2e4e36626b54
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-3812-5241bbb9147d
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-dfb3-9beedd578c8e
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-80cc-c37cd345947b
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-cbbd-fdf80a661447
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-470e-7a849aee882d
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-0ddd-b68c00e133ec
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-72a6-16aa2f0caef7
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-326b-e627e35761d0
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-1726-e83113182b5d
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-0224-d2fae01ce379
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-889d-3862b3f78e64
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-62dd-a8e007574f5d
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-968b-a9e0a8202255
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-dd42-d3fdedde2968
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-fb96-cbd2033e4644
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-94e0-8ed45e043c59
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-6211-7e7210b02851
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-942e-57029c436b62
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-96f3-b0596affe21f
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-cfa7-e269ab568149
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-5cca-3f5de13c9d90
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-7b4a-035333136f4a
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-dc43-0967f8b3b72a
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-d998-489a7cfde8b6
00020000-5613-a1f7-fc6b-ab599b2692d6	00030000-5613-a1f6-d807-26cc48b7633b
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-09dc-b392bcc33599
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-b600-8d7a13e13425
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-22de-d12791944b13
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-b7fc-2e4e36626b54
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-cbbd-fdf80a661447
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-470e-7a849aee882d
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-72a6-16aa2f0caef7
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-326b-e627e35761d0
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-0224-d2fae01ce379
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-889d-3862b3f78e64
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-968b-a9e0a8202255
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-dd42-d3fdedde2968
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-fb96-cbd2033e4644
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-6211-7e7210b02851
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-942e-57029c436b62
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-96f3-b0596affe21f
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-cfa7-e269ab568149
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-5cca-3f5de13c9d90
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-d998-489a7cfde8b6
00020000-5613-a1f7-99d6-ea892b9cc05c	00030000-5613-a1f6-d807-26cc48b7633b
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-09dc-b392bcc33599
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-b7fc-2e4e36626b54
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-cbbd-fdf80a661447
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-470e-7a849aee882d
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-72a6-16aa2f0caef7
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-326b-e627e35761d0
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-0224-d2fae01ce379
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-889d-3862b3f78e64
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-968b-a9e0a8202255
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-dd42-d3fdedde2968
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-fb96-cbd2033e4644
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-6211-7e7210b02851
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-942e-57029c436b62
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-96f3-b0596affe21f
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-cfa7-e269ab568149
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-1f8a-73b2334dfda1
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-ccec-65fbf175005e
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-5cca-3f5de13c9d90
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-d998-489a7cfde8b6
00020000-5613-a1f7-82b7-372a821a7304	00030000-5613-a1f6-d807-26cc48b7633b
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-a4e9-b666f00d936e
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ba2f-15da5927b6d7
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ccec-65fbf175005e
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-366d-8ba3c8011fd4
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-237b-fdeccf313bea
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-814f-fef0fcb1341d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-2de7-88b581c25bdb
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-09dc-b392bcc33599
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-b600-8d7a13e13425
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-a4f9-33d4224b4b28
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-22de-d12791944b13
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-b7fc-2e4e36626b54
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-3812-5241bbb9147d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-dfb3-9beedd578c8e
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-292e-83d8eccbd5fb
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-80cc-c37cd345947b
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-7f1c-4c12f791b69d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-cbbd-fdf80a661447
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-845f-cf69723ed9d8
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-470e-7a849aee882d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-50de-f86e6c79baa9
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-e7bc-6378a54876e4
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-5a3e-b33da58d583e
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-e51c-9e11e83c8dfc
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-92bf-5487244be419
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-0ddd-b68c00e133ec
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-af94-8fc4320a27d4
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-72a6-16aa2f0caef7
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-2b19-034f31e6f421
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-326b-e627e35761d0
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-2c6d-56f3cbae4da1
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-1726-e83113182b5d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-431a-f9f9d0391312
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-c364-caaae2750271
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-4675-2f4613d2a10b
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-f289-cc24311b852b
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-4403-e868b51eb3fa
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-0224-d2fae01ce379
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-06e5-b07b1cfe46f6
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-889d-3862b3f78e64
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ca28-0f8fa8f1959c
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-62dd-a8e007574f5d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-b6b1-2e80fa36b834
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-5651-9036d3883635
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-0b48-8f7077e958e6
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-aab2-d2c94fceb549
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-c7fd-015e0f5132c4
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-3c35-c1ba01aaee38
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-4dfc-eacc52f354db
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-968b-a9e0a8202255
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-416b-e32869a3aa61
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-dd42-d3fdedde2968
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-96d0-950fa57f433f
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-a9e7-2d177980a9cc
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-5daf-6df17abf3730
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-9435-f31703c01bcc
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-a347-0ae1b463483a
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-6210-7aee6b6061d6
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-f105-91995bdbe539
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-fb96-cbd2033e4644
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-37e0-251203974cec
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-9d61-76a0615293fb
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-da26-39a09ebaf941
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-071f-24ecae9d7e9e
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-5cde-4f6659171799
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-94e0-8ed45e043c59
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-df6c-ca8623449962
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-e26c-1a6e32f7cc00
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-bf86-d6fbb1805a7d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-9b30-5c725c9da0ea
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-b385-147eaf7c599a
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-b0eb-b506b77f42d2
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-8084-e561fc25e568
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-815a-7cfdb09f7424
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-1648-a5430bd15c90
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-beed-381f1c08da3c
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-062e-cfd83a5dbac2
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-4973-1a2f04e6bb49
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-650f-03dbea5e3540
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-0acf-5201223db457
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-9748-6eb4c9f5cac6
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ce3d-9d682c7076ef
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ddec-e4dcd8ee26a0
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-1c3c-f1201b968206
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-e485-4c36708dbe57
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-9349-fafc3ae342ca
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-f495-44674479b2b2
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-6211-7e7210b02851
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-8e3c-9670359b204d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-7508-1b231c31aa1f
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-623e-918fb090a0fe
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-82ff-cbbc64b6b10e
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-aa20-769882fd5bda
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-942e-57029c436b62
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-543a-1e95318fb23b
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-96f3-b0596affe21f
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-f7c4-a6f28590be6a
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-930f-fc0dd12ac77f
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-91db-612a207b86e2
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-73ae-2efbffabb867
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-9282-28b25d16f43c
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-649b-fecf0220d88f
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-01cb-98793cca187f
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-2792-d553ce753e30
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ed95-da295f4364a7
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-cfa7-e269ab568149
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-7b95-ae9b73e763f4
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-049e-a802af7d70b6
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-8a73-bb0306063e1a
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-f27e-802d5e185eed
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-0784-e16bdf9cb034
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-3c5f-668daed678c6
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-062c-50bd7b9cefd8
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-0979-2f4a08dca7f1
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ebd4-33f98a0f4d60
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-ca4b-b220c22bfd50
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-9580-9e808dfed203
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-1f8a-73b2334dfda1
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-0032-1d41096d1d44
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-5cca-3f5de13c9d90
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-44ef-f2cffc948fa1
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-7e01-31dfa1b53e56
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-791e-728862f654ab
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-1aea-ae45954c0840
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-b6a7-34d926d00b96
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-adbe-3aa1f937ccb5
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-709e-e57670484086
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-7b4a-035333136f4a
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-475c-dfa131f69077
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-2131-b3b1bc87a54e
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-bc17-02fc5b5c9c88
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-13c1-3cd86137ed63
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-e3d8-16988a3ff516
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-8584-97e5657219d1
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-60ae-2c1788407c38
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-dc43-0967f8b3b72a
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-7b89-c147f5b10b5d
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-d998-489a7cfde8b6
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-36d3-b487be964422
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-d807-26cc48b7633b
00020000-5613-a1f8-2748-2db846cbd48b	00030000-5613-a1f6-1b42-4ab8ea89a8a7
\.


--
-- TOC entry 3008 (class 0 OID 21354180)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 21354214)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21354350)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5613-a1f8-897a-5c6159e65cf7	00090000-5613-a1f8-87dd-d9c9508f5785	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5613-a1f8-5dbc-8fca1717da46	00090000-5613-a1f8-3109-669856e996f3	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5613-a1f8-0b3d-c818bf149f4a	00090000-5613-a1f8-5a6e-efd2da3f4d30	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5613-a1f8-ff68-a274732e5b11	00090000-5613-a1f8-c585-d6fc62aa0080	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2984 (class 0 OID 21353915)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5613-a1f8-f423-afb137176188	00040000-5613-a1f6-55be-95d1c083f6c2	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1f8-da23-d5f8dd470ecf	00040000-5613-a1f6-55be-95d1c083f6c2	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5613-a1f8-dace-e6eec1a56017	00040000-5613-a1f6-55be-95d1c083f6c2	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1f8-a32d-c27105de246f	00040000-5613-a1f6-55be-95d1c083f6c2	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1f8-bb99-e33d71c11532	00040000-5613-a1f6-55be-95d1c083f6c2	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1f8-4ae9-0c30d9e5b351	00040000-5613-a1f6-f0e3-0494505f5989	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1f8-41c4-c19986f333ad	00040000-5613-a1f6-86ca-307313423bd2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1f8-95b4-8ff03e8f85d9	00040000-5613-a1f6-36af-a51e207e3545	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1f8-a8e2-1ab8f84af110	00040000-5613-a1f6-bd50-5e4995418d28	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-a1fa-2be9-a7995e1878cb	00040000-5613-a1f6-55be-95d1c083f6c2	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2986 (class 0 OID 21353949)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5613-a1f5-05bc-dd74d95786c3	8341	Adlešiči
00050000-5613-a1f5-d135-46b5031ff7e3	5270	Ajdovščina
00050000-5613-a1f5-d025-d40799f06625	6280	Ankaran/Ancarano
00050000-5613-a1f5-e829-5787f085565f	9253	Apače
00050000-5613-a1f5-c70d-6c5d49048bde	8253	Artiče
00050000-5613-a1f5-145a-f024c320fd99	4275	Begunje na Gorenjskem
00050000-5613-a1f5-53dc-25d783bd12d0	1382	Begunje pri Cerknici
00050000-5613-a1f5-10f0-dbb4a6c13b40	9231	Beltinci
00050000-5613-a1f5-9204-eadd51dc718d	2234	Benedikt
00050000-5613-a1f5-edb9-280aa4b2ad0d	2345	Bistrica ob Dravi
00050000-5613-a1f5-1fc5-25779fd1e1a5	3256	Bistrica ob Sotli
00050000-5613-a1f5-32f9-71b384cff850	8259	Bizeljsko
00050000-5613-a1f5-6eda-4def65b44355	1223	Blagovica
00050000-5613-a1f5-231c-abeb259535e2	8283	Blanca
00050000-5613-a1f5-1600-4c491c207771	4260	Bled
00050000-5613-a1f5-758c-9f5aa9d2f44d	4273	Blejska Dobrava
00050000-5613-a1f5-2a54-688262f9da8d	9265	Bodonci
00050000-5613-a1f5-211e-921401236ea9	9222	Bogojina
00050000-5613-a1f5-212d-3bb05fbc9c46	4263	Bohinjska Bela
00050000-5613-a1f5-1878-743d87d301b0	4264	Bohinjska Bistrica
00050000-5613-a1f5-7363-6485d08aee5a	4265	Bohinjsko jezero
00050000-5613-a1f5-998c-515beea033cf	1353	Borovnica
00050000-5613-a1f5-8e27-0b725ae790bf	8294	Boštanj
00050000-5613-a1f5-de0d-311b4e8d9b8f	5230	Bovec
00050000-5613-a1f5-43b1-d1d305214c29	5295	Branik
00050000-5613-a1f5-c8c5-ea50e8ab4372	3314	Braslovče
00050000-5613-a1f5-7e09-9ff5f8cb9c5f	5223	Breginj
00050000-5613-a1f5-8443-cdd967259472	8280	Brestanica
00050000-5613-a1f5-5a0f-2fff409360dc	2354	Bresternica
00050000-5613-a1f5-8ff1-f0642b21eba3	4243	Brezje
00050000-5613-a1f5-f46a-1522867a0ac9	1351	Brezovica pri Ljubljani
00050000-5613-a1f5-02b8-49ab305732ca	8250	Brežice
00050000-5613-a1f5-b85e-bbabf6b79b40	4210	Brnik - Aerodrom
00050000-5613-a1f5-aa31-3d16d539d206	8321	Brusnice
00050000-5613-a1f5-4a22-c6eb4f686496	3255	Buče
00050000-5613-a1f5-b47f-457272e88a3d	8276	Bučka 
00050000-5613-a1f5-84b4-35504e29e641	9261	Cankova
00050000-5613-a1f5-1f50-5159afa483f6	3000	Celje 
00050000-5613-a1f5-a14d-f6b12fe8eb90	3001	Celje - poštni predali
00050000-5613-a1f5-f33c-1e4b14f90584	4207	Cerklje na Gorenjskem
00050000-5613-a1f5-ce70-9b295b1a4429	8263	Cerklje ob Krki
00050000-5613-a1f5-ab70-e24d6d7acdc4	1380	Cerknica
00050000-5613-a1f5-d4fd-da0fa1955de8	5282	Cerkno
00050000-5613-a1f5-c95c-e0c022cfe7c6	2236	Cerkvenjak
00050000-5613-a1f5-cade-6be1b171afd7	2215	Ceršak
00050000-5613-a1f5-6e3b-d345ad44f595	2326	Cirkovce
00050000-5613-a1f5-24b2-ba3c980ca4f1	2282	Cirkulane
00050000-5613-a1f5-a855-5e57e601be9f	5273	Col
00050000-5613-a1f5-b778-906b404bbad6	8251	Čatež ob Savi
00050000-5613-a1f5-a416-27f16a04d1c1	1413	Čemšenik
00050000-5613-a1f5-c6ae-9a7aac8d3de8	5253	Čepovan
00050000-5613-a1f5-9008-ba3362ff2771	9232	Črenšovci
00050000-5613-a1f5-c3e5-fea4d5313376	2393	Črna na Koroškem
00050000-5613-a1f5-46e8-6e2046b1840f	6275	Črni Kal
00050000-5613-a1f5-81a2-32cc78b007b1	5274	Črni Vrh nad Idrijo
00050000-5613-a1f5-2abf-645fb9ce4318	5262	Črniče
00050000-5613-a1f5-8b74-31acc8ab8d17	8340	Črnomelj
00050000-5613-a1f5-c3ee-5344b26e4877	6271	Dekani
00050000-5613-a1f5-c933-579402355cfe	5210	Deskle
00050000-5613-a1f5-fdcd-75470d8f1ae5	2253	Destrnik
00050000-5613-a1f5-c514-eabeff7b4ab3	6215	Divača
00050000-5613-a1f5-eccd-56666eb690c3	1233	Dob
00050000-5613-a1f5-c028-d1cea358b08a	3224	Dobje pri Planini
00050000-5613-a1f5-924b-908ea83b374d	8257	Dobova
00050000-5613-a1f5-d61d-08ba8b3c16d0	1423	Dobovec
00050000-5613-a1f5-5e3a-04614c6b7237	5263	Dobravlje
00050000-5613-a1f5-aba9-e9369766190a	3204	Dobrna
00050000-5613-a1f5-2308-44b3b25a8600	8211	Dobrnič
00050000-5613-a1f5-cb3b-91d6f4adea30	1356	Dobrova
00050000-5613-a1f5-fa64-7304e90bd8bd	9223	Dobrovnik/Dobronak 
00050000-5613-a1f5-32ce-20c87bd4fd5a	5212	Dobrovo v Brdih
00050000-5613-a1f5-6ec2-672903aeb782	1431	Dol pri Hrastniku
00050000-5613-a1f5-d46d-df6b9cc32073	1262	Dol pri Ljubljani
00050000-5613-a1f5-a864-3eb946564089	1273	Dole pri Litiji
00050000-5613-a1f5-bb39-da93aedff6ad	1331	Dolenja vas
00050000-5613-a1f5-5dce-3a8a3dc2d0e3	8350	Dolenjske Toplice
00050000-5613-a1f5-a7b0-833440faa007	1230	Domžale
00050000-5613-a1f5-6011-aaf58b0cf9a2	2252	Dornava
00050000-5613-a1f5-5e87-929ad572846c	5294	Dornberk
00050000-5613-a1f5-02f1-85b0abb05d6b	1319	Draga
00050000-5613-a1f5-c762-b41c73a99994	8343	Dragatuš
00050000-5613-a1f5-d997-0e0a44213b3f	3222	Dramlje
00050000-5613-a1f5-0daa-e46cffb41ecc	2370	Dravograd
00050000-5613-a1f5-04ed-0c21add262e1	4203	Duplje
00050000-5613-a1f5-4735-7f621e532a27	6221	Dutovlje
00050000-5613-a1f5-b7b2-145c1d54c2eb	8361	Dvor
00050000-5613-a1f5-2d98-e17d8abf3c53	2343	Fala
00050000-5613-a1f5-b51c-b6d68e0072e1	9208	Fokovci
00050000-5613-a1f5-f5fc-8430685e933b	2313	Fram
00050000-5613-a1f5-7890-03164cbec123	3213	Frankolovo
00050000-5613-a1f5-cb6d-7ff263fced3c	1274	Gabrovka
00050000-5613-a1f5-b122-fdcbb7d4f798	8254	Globoko
00050000-5613-a1f5-e0c1-ee6430788c8b	5275	Godovič
00050000-5613-a1f5-b2ec-b7a568b2bba6	4204	Golnik
00050000-5613-a1f5-3f50-b416bb981dca	3303	Gomilsko
00050000-5613-a1f5-b4a0-27278e30591f	4224	Gorenja vas
00050000-5613-a1f5-b7bf-8bbe936ba2cd	3263	Gorica pri Slivnici
00050000-5613-a1f5-29d4-6a5f70a8492c	2272	Gorišnica
00050000-5613-a1f5-8245-fcfbecfe4770	9250	Gornja Radgona
00050000-5613-a1f5-d6fb-0e354156fd6e	3342	Gornji Grad
00050000-5613-a1f5-6bbf-d6a11f3d867d	4282	Gozd Martuljek
00050000-5613-a1f5-d207-579e09aae074	6272	Gračišče
00050000-5613-a1f5-f79a-5f5e299cb08d	9264	Grad
00050000-5613-a1f5-e415-ec87bba9abbb	8332	Gradac
00050000-5613-a1f5-c545-559ac6fb27f3	1384	Grahovo
00050000-5613-a1f5-13ac-e92ec4cd95ab	5242	Grahovo ob Bači
00050000-5613-a1f5-5d38-7c96337a2662	5251	Grgar
00050000-5613-a1f5-9141-f6244e0a8726	3302	Griže
00050000-5613-a1f5-24d4-74f613c0e3c5	3231	Grobelno
00050000-5613-a1f5-4a49-abd3129e61bc	1290	Grosuplje
00050000-5613-a1f5-7477-6b47e98595eb	2288	Hajdina
00050000-5613-a1f5-8fcb-26473ba394dc	8362	Hinje
00050000-5613-a1f5-6d47-59c5f3b75993	2311	Hoče
00050000-5613-a1f5-f6d2-fc13e750b78c	9205	Hodoš/Hodos
00050000-5613-a1f5-1af7-74a4e8af59f6	1354	Horjul
00050000-5613-a1f5-90b3-7868a769ad19	1372	Hotedršica
00050000-5613-a1f5-8dcf-0768c8034d52	1430	Hrastnik
00050000-5613-a1f5-d521-8d20e82bea01	6225	Hruševje
00050000-5613-a1f5-165f-71934196e680	4276	Hrušica
00050000-5613-a1f5-a6a1-fa0c593e501c	5280	Idrija
00050000-5613-a1f5-f137-1710886bee34	1292	Ig
00050000-5613-a1f5-e2af-67aaec90d715	6250	Ilirska Bistrica
00050000-5613-a1f5-f1f0-393616844879	6251	Ilirska Bistrica-Trnovo
00050000-5613-a1f5-2b85-0fef5b170dc4	1295	Ivančna Gorica
00050000-5613-a1f5-c32b-756a6d0a8a03	2259	Ivanjkovci
00050000-5613-a1f5-e6ab-82e04d448905	1411	Izlake
00050000-5613-a1f5-698f-e4fbf67eae1f	6310	Izola/Isola
00050000-5613-a1f5-e7de-c7c918f0f5fa	2222	Jakobski Dol
00050000-5613-a1f5-108d-536fcfee62d0	2221	Jarenina
00050000-5613-a1f5-6e49-23b74482c7a5	6254	Jelšane
00050000-5613-a1f5-6206-d6eeedf744b1	4270	Jesenice
00050000-5613-a1f5-51dc-d2f3afc0c31f	8261	Jesenice na Dolenjskem
00050000-5613-a1f5-b000-181417950573	3273	Jurklošter
00050000-5613-a1f5-50ff-4bae748fd3c6	2223	Jurovski Dol
00050000-5613-a1f5-5a9d-ae5acffac149	2256	Juršinci
00050000-5613-a1f5-9768-84289f14e7f5	5214	Kal nad Kanalom
00050000-5613-a1f5-423a-216405dfc36f	3233	Kalobje
00050000-5613-a1f5-3cca-28a43176d20b	4246	Kamna Gorica
00050000-5613-a1f5-b4b0-f70730e14258	2351	Kamnica
00050000-5613-a1f5-c437-7308bfb1654f	1241	Kamnik
00050000-5613-a1f5-5049-258b2571c6b1	5213	Kanal
00050000-5613-a1f5-eaa5-bbfea2d92003	8258	Kapele
00050000-5613-a1f5-96a0-7eb8ac329ae9	2362	Kapla
00050000-5613-a1f5-8804-620956cfe151	2325	Kidričevo
00050000-5613-a1f5-7a33-5af3a2a5ecf9	1412	Kisovec
00050000-5613-a1f5-9bd4-d3c276a486ee	6253	Knežak
00050000-5613-a1f5-b862-8d2ffe8a956e	5222	Kobarid
00050000-5613-a1f5-6bec-8cd1282c4295	9227	Kobilje
00050000-5613-a1f5-0a8c-ccf066ba8af8	1330	Kočevje
00050000-5613-a1f5-dd21-c5e268a5e7e0	1338	Kočevska Reka
00050000-5613-a1f5-ffd2-008a6057d037	2276	Kog
00050000-5613-a1f5-e84b-65cfcf34a3d5	5211	Kojsko
00050000-5613-a1f5-7843-2cfe6f9ec6e8	6223	Komen
00050000-5613-a1f5-919e-743224ab89a9	1218	Komenda
00050000-5613-a1f5-a449-c5e03a6f22f9	6000	Koper/Capodistria 
00050000-5613-a1f5-3d9a-76e7963d0d68	6001	Koper/Capodistria - poštni predali
00050000-5613-a1f5-7b74-55bf98549ea4	8282	Koprivnica
00050000-5613-a1f5-bff6-74961e44b7eb	5296	Kostanjevica na Krasu
00050000-5613-a1f5-6f85-73e0de033b5e	8311	Kostanjevica na Krki
00050000-5613-a1f5-5b3e-751a646e0952	1336	Kostel
00050000-5613-a1f5-2ada-1cf746936ed3	6256	Košana
00050000-5613-a1f5-23fc-ca75e427dc7d	2394	Kotlje
00050000-5613-a1f5-023a-9bc9fbce3b1a	6240	Kozina
00050000-5613-a1f5-5f00-515eaa12132a	3260	Kozje
00050000-5613-a1f5-9f90-78df314cdcdc	4000	Kranj 
00050000-5613-a1f5-106d-72419fa4ca07	4001	Kranj - poštni predali
00050000-5613-a1f5-7677-4742cb4e47d9	4280	Kranjska Gora
00050000-5613-a1f5-1c52-d0bd18815c38	1281	Kresnice
00050000-5613-a1f5-3f1f-e44bfc228d3d	4294	Križe
00050000-5613-a1f5-b59b-3e5c55bd8286	9206	Križevci
00050000-5613-a1f5-0cb1-2c52378104bd	9242	Križevci pri Ljutomeru
00050000-5613-a1f5-dc06-a743ade216de	1301	Krka
00050000-5613-a1f5-8155-dbc86e6a923d	8296	Krmelj
00050000-5613-a1f5-29a8-f903a01dfa03	4245	Kropa
00050000-5613-a1f5-8414-c595facb68b3	8262	Krška vas
00050000-5613-a1f5-b12e-69f4f9a53021	8270	Krško
00050000-5613-a1f5-30c7-df63ab399389	9263	Kuzma
00050000-5613-a1f5-5546-5df814039e98	2318	Laporje
00050000-5613-a1f5-1ab0-403e808a4014	3270	Laško
00050000-5613-a1f5-4321-8c51ef816fb6	1219	Laze v Tuhinju
00050000-5613-a1f5-8c08-929b6c20d8ac	2230	Lenart v Slovenskih goricah
00050000-5613-a1f5-5ff1-aee1ee4df6a3	9220	Lendava/Lendva
00050000-5613-a1f5-5637-4a23468b9ded	4248	Lesce
00050000-5613-a1f5-e22c-e1e0c3057200	3261	Lesično
00050000-5613-a1f5-fe23-d873ee1cf586	8273	Leskovec pri Krškem
00050000-5613-a1f5-46f4-6de10b86f5e3	2372	Libeliče
00050000-5613-a1f5-613e-388c40245d32	2341	Limbuš
00050000-5613-a1f5-a44e-95c8e09328f4	1270	Litija
00050000-5613-a1f5-9c6f-648a0c712f98	3202	Ljubečna
00050000-5613-a1f5-b27f-42b8ced52b4b	1000	Ljubljana 
00050000-5613-a1f5-acd6-4ebc6a75e67b	1001	Ljubljana - poštni predali
00050000-5613-a1f5-7845-8e98bb1f5f6a	1231	Ljubljana - Črnuče
00050000-5613-a1f5-7a7e-ff04b51f3d21	1261	Ljubljana - Dobrunje
00050000-5613-a1f5-6289-b53625e67964	1260	Ljubljana - Polje
00050000-5613-a1f5-2124-ba0737a4210a	1210	Ljubljana - Šentvid
00050000-5613-a1f5-dbcb-1efa68583a8d	1211	Ljubljana - Šmartno
00050000-5613-a1f5-75ec-69a2171545bc	3333	Ljubno ob Savinji
00050000-5613-a1f5-27a1-06b60fef0f45	9240	Ljutomer
00050000-5613-a1f5-a94b-ad68eb42f967	3215	Loče
00050000-5613-a1f5-db58-0f2d7f72d771	5231	Log pod Mangartom
00050000-5613-a1f5-e0de-626a944e35b1	1358	Log pri Brezovici
00050000-5613-a1f5-de35-8272bd067ad1	1370	Logatec
00050000-5613-a1f5-e11d-097662656977	1371	Logatec
00050000-5613-a1f5-c237-d5880cbf8d1b	1434	Loka pri Zidanem Mostu
00050000-5613-a1f5-016c-a9e7cb58b083	3223	Loka pri Žusmu
00050000-5613-a1f5-d93f-e99c60a00ad5	6219	Lokev
00050000-5613-a1f5-24ae-1863142b3e5d	1318	Loški Potok
00050000-5613-a1f5-4101-b4f9e373227d	2324	Lovrenc na Dravskem polju
00050000-5613-a1f5-44ca-14cfd3bf0cb2	2344	Lovrenc na Pohorju
00050000-5613-a1f5-664b-b8ba208c6522	3334	Luče
00050000-5613-a1f5-5146-f932daf84b02	1225	Lukovica
00050000-5613-a1f5-f2c1-b955168fd283	9202	Mačkovci
00050000-5613-a1f5-a714-5dd538f8432b	2322	Majšperk
00050000-5613-a1f5-71a4-889eae8b86a0	2321	Makole
00050000-5613-a1f5-beb9-af3d162e1a06	9243	Mala Nedelja
00050000-5613-a1f5-97ea-5fcf0fe87c0b	2229	Malečnik
00050000-5613-a1f5-96e6-50159f29ea0b	6273	Marezige
00050000-5613-a1f5-230f-0b787b52fe07	2000	Maribor 
00050000-5613-a1f5-ae05-29a1ef105da3	2001	Maribor - poštni predali
00050000-5613-a1f5-6217-778883d3d31c	2206	Marjeta na Dravskem polju
00050000-5613-a1f5-7e60-11354e440e3e	2281	Markovci
00050000-5613-a1f5-194b-b4ed5b78d103	9221	Martjanci
00050000-5613-a1f5-b56d-0edf1b6c703b	6242	Materija
00050000-5613-a1f5-83ff-b77e5dddb991	4211	Mavčiče
00050000-5613-a1f5-4c67-e7202e3f0255	1215	Medvode
00050000-5613-a1f5-ae6b-01812662a31e	1234	Mengeš
00050000-5613-a1f5-2bb6-4a04732cbcef	8330	Metlika
00050000-5613-a1f5-2a6b-6d2e49512441	2392	Mežica
00050000-5613-a1f5-2f33-f6ac4b3c9193	2204	Miklavž na Dravskem polju
00050000-5613-a1f5-6276-12adc0f3b117	2275	Miklavž pri Ormožu
00050000-5613-a1f5-51c7-a0ea8f1e129a	5291	Miren
00050000-5613-a1f5-be34-2c670f125705	8233	Mirna
00050000-5613-a1f5-540f-f0869aa2424e	8216	Mirna Peč
00050000-5613-a1f5-344a-e9779fbc7e8f	2382	Mislinja
00050000-5613-a1f5-a239-cbbed73bcacc	4281	Mojstrana
00050000-5613-a1f5-cafa-ac3e8eb71843	8230	Mokronog
00050000-5613-a1f5-3d76-389c2b1619bd	1251	Moravče
00050000-5613-a1f5-2836-f7c7d5d7381a	9226	Moravske Toplice
00050000-5613-a1f5-0817-594e77bfdaaa	5216	Most na Soči
00050000-5613-a1f5-83db-b791cb7abe45	1221	Motnik
00050000-5613-a1f5-000a-632a3314f201	3330	Mozirje
00050000-5613-a1f5-a31c-f24e5464604d	9000	Murska Sobota 
00050000-5613-a1f5-e8a5-c12db96b8d4b	9001	Murska Sobota - poštni predali
00050000-5613-a1f5-f908-e0476a72a1f8	2366	Muta
00050000-5613-a1f5-9982-137359d0eef8	4202	Naklo
00050000-5613-a1f5-0196-7fd462c9bd08	3331	Nazarje
00050000-5613-a1f5-deb0-d493795af101	1357	Notranje Gorice
00050000-5613-a1f5-c65d-0f77d7a6374d	3203	Nova Cerkev
00050000-5613-a1f5-7b7a-13d5ab63ad7a	5000	Nova Gorica 
00050000-5613-a1f5-7c0b-128ef2c2dd67	5001	Nova Gorica - poštni predali
00050000-5613-a1f5-1be3-8a378c9ca323	1385	Nova vas
00050000-5613-a1f5-b151-60e211d95ef4	8000	Novo mesto
00050000-5613-a1f5-aac3-7750dcded56d	8001	Novo mesto - poštni predali
00050000-5613-a1f5-5d9c-4f62a9a25f6f	6243	Obrov
00050000-5613-a1f5-5ccf-7de8ff6db49b	9233	Odranci
00050000-5613-a1f5-ac95-4dd290e4bcd7	2317	Oplotnica
00050000-5613-a1f5-e13a-dfbaf9a2c154	2312	Orehova vas
00050000-5613-a1f5-08d3-aa49db2669e6	2270	Ormož
00050000-5613-a1f5-820d-3472ffb2f005	1316	Ortnek
00050000-5613-a1f5-b37d-7f03c63dc4cb	1337	Osilnica
00050000-5613-a1f5-980f-c5d62dff3075	8222	Otočec
00050000-5613-a1f5-3539-9e3b6ee677d2	2361	Ožbalt
00050000-5613-a1f5-4d2a-327d446598bc	2231	Pernica
00050000-5613-a1f5-8dff-709caec1bb28	2211	Pesnica pri Mariboru
00050000-5613-a1f5-96df-35470646baf3	9203	Petrovci
00050000-5613-a1f5-0dfb-dad66f0cc5b9	3301	Petrovče
00050000-5613-a1f5-62ee-d7e13a8dd51e	6330	Piran/Pirano
00050000-5613-a1f5-b88e-47d31fe637ab	8255	Pišece
00050000-5613-a1f5-4477-2d486df7b643	6257	Pivka
00050000-5613-a1f5-f102-ae5f512df4d0	6232	Planina
00050000-5613-a1f5-7ea3-71439f2964cc	3225	Planina pri Sevnici
00050000-5613-a1f5-3711-53b72203f228	6276	Pobegi
00050000-5613-a1f5-ddc3-c20f5a280c5e	8312	Podbočje
00050000-5613-a1f5-c896-b9148ce93976	5243	Podbrdo
00050000-5613-a1f5-6fc8-98166b174d01	3254	Podčetrtek
00050000-5613-a1f5-9a12-47a2ac19abf2	2273	Podgorci
00050000-5613-a1f5-27e1-9488df62d9c0	6216	Podgorje
00050000-5613-a1f5-8635-d9dd00da40d6	2381	Podgorje pri Slovenj Gradcu
00050000-5613-a1f5-bc77-bdeda2287970	6244	Podgrad
00050000-5613-a1f5-9036-bd38210b251c	1414	Podkum
00050000-5613-a1f5-6c33-35faf41302ea	2286	Podlehnik
00050000-5613-a1f5-031e-08a4c5965210	5272	Podnanos
00050000-5613-a1f5-beb3-381d8249e372	4244	Podnart
00050000-5613-a1f5-aabe-f210f39ff486	3241	Podplat
00050000-5613-a1f5-4eb5-800729c8cf1c	3257	Podsreda
00050000-5613-a1f5-7bfc-25e3202bd820	2363	Podvelka
00050000-5613-a1f5-f825-38974253ec14	2208	Pohorje
00050000-5613-a1f5-2a1c-13cd86997579	2257	Polenšak
00050000-5613-a1f5-9c96-269a3beec057	1355	Polhov Gradec
00050000-5613-a1f5-51bb-89ffe4e690ce	4223	Poljane nad Škofjo Loko
00050000-5613-a1f5-73f3-62fc4be28707	2319	Poljčane
00050000-5613-a1f5-55a8-e0b334ea803d	1272	Polšnik
00050000-5613-a1f5-cdda-ac9ea6b05a6a	3313	Polzela
00050000-5613-a1f5-b528-d356a1f55eb1	3232	Ponikva
00050000-5613-a1f5-ef9f-b2b7ce55cd92	6320	Portorož/Portorose
00050000-5613-a1f5-ec22-1f72f82d38aa	6230	Postojna
00050000-5613-a1f5-887d-00ea163adcfb	2331	Pragersko
00050000-5613-a1f5-69f2-71305ca913e7	3312	Prebold
00050000-5613-a1f5-5e8f-a29cddf4f220	4205	Preddvor
00050000-5613-a1f5-cfc7-b21cf5fbdf77	6255	Prem
00050000-5613-a1f5-5618-553672de5be5	1352	Preserje
00050000-5613-a1f5-c567-7decc5e42e01	6258	Prestranek
00050000-5613-a1f5-6e87-cd765949db76	2391	Prevalje
00050000-5613-a1f5-7df3-d1816997d9af	3262	Prevorje
00050000-5613-a1f5-7abb-279422e4f59b	1276	Primskovo 
00050000-5613-a1f5-fcb4-4bc7e1268df8	3253	Pristava pri Mestinju
00050000-5613-a1f5-62d9-9af9e11608f3	9207	Prosenjakovci/Partosfalva
00050000-5613-a1f5-31b8-5ebab4823389	5297	Prvačina
00050000-5613-a1f5-8ba7-ed6e41c86432	2250	Ptuj
00050000-5613-a1f5-5dff-9bf94e05902d	2323	Ptujska Gora
00050000-5613-a1f5-8bd9-71e461f11ca4	9201	Puconci
00050000-5613-a1f5-e92c-a2c485f1ece6	2327	Rače
00050000-5613-a1f5-775f-20587d78b17b	1433	Radeče
00050000-5613-a1f5-caf6-7a5675766781	9252	Radenci
00050000-5613-a1f5-060a-5fd3fc283d8a	2360	Radlje ob Dravi
00050000-5613-a1f5-d224-700a62bdc6b9	1235	Radomlje
00050000-5613-a1f5-3bb0-c628b395c412	4240	Radovljica
00050000-5613-a1f5-77c1-b0fa30696585	8274	Raka
00050000-5613-a1f5-cd93-3fdcf7a5e8f2	1381	Rakek
00050000-5613-a1f5-e495-8095d2e288f6	4283	Rateče - Planica
00050000-5613-a1f5-d482-cd099d466992	2390	Ravne na Koroškem
00050000-5613-a1f5-ca3f-446ee08704be	9246	Razkrižje
00050000-5613-a1f5-3f65-4eeb6860d1ba	3332	Rečica ob Savinji
00050000-5613-a1f5-bc3e-211ba51277c9	5292	Renče
00050000-5613-a1f5-aba2-70f7d131cba0	1310	Ribnica
00050000-5613-a1f5-1b0b-fe6dab234f76	2364	Ribnica na Pohorju
00050000-5613-a1f5-397e-0135e3fe5870	3272	Rimske Toplice
00050000-5613-a1f5-4b71-9909e7fe025a	1314	Rob
00050000-5613-a1f5-dfed-1d6cfe2fb9e5	5215	Ročinj
00050000-5613-a1f5-01ba-4dd2f53f89f0	3250	Rogaška Slatina
00050000-5613-a1f5-10d8-f1998b30982b	9262	Rogašovci
00050000-5613-a1f5-ee3e-d33ed243b858	3252	Rogatec
00050000-5613-a1f5-574b-e06e765e8bdd	1373	Rovte
00050000-5613-a1f5-689c-f7a3d23923d6	2342	Ruše
00050000-5613-a1f5-a75a-a6e2b6f84ce0	1282	Sava
00050000-5613-a1f5-7e9f-ec7b454edf76	6333	Sečovlje/Sicciole
00050000-5613-a1f5-5f8f-df85fe06d933	4227	Selca
00050000-5613-a1f5-943d-ccdf6260afbb	2352	Selnica ob Dravi
00050000-5613-a1f5-0ece-677cc17ff6ae	8333	Semič
00050000-5613-a1f5-c8a9-982471ae24ec	8281	Senovo
00050000-5613-a1f5-1b57-446ea758ed5e	6224	Senožeče
00050000-5613-a1f5-9c40-b592371ec122	8290	Sevnica
00050000-5613-a1f5-0c9a-68cb6a63ef71	6210	Sežana
00050000-5613-a1f5-85ad-648b52f8282f	2214	Sladki Vrh
00050000-5613-a1f5-603b-d5d1a4107f5c	5283	Slap ob Idrijci
00050000-5613-a1f5-d08c-f8b88916ec1b	2380	Slovenj Gradec
00050000-5613-a1f5-76b1-c531c15333cf	2310	Slovenska Bistrica
00050000-5613-a1f5-b6b0-7614b1979fc8	3210	Slovenske Konjice
00050000-5613-a1f5-439f-bddff3c37836	1216	Smlednik
00050000-5613-a1f5-c9ac-14dafd0fc9a0	5232	Soča
00050000-5613-a1f5-0da7-de026dcda247	1317	Sodražica
00050000-5613-a1f5-0b2f-cbdc2704133d	3335	Solčava
00050000-5613-a1f5-f49f-4e069cd01206	5250	Solkan
00050000-5613-a1f5-2276-d80fe688e975	4229	Sorica
00050000-5613-a1f5-2700-d60ab317807d	4225	Sovodenj
00050000-5613-a1f5-0a88-bfe53ae9e69a	5281	Spodnja Idrija
00050000-5613-a1f5-5663-656d97832701	2241	Spodnji Duplek
00050000-5613-a1f5-5653-efdfc348e106	9245	Spodnji Ivanjci
00050000-5613-a1f5-9efa-939c8c7fb4c2	2277	Središče ob Dravi
00050000-5613-a1f5-e176-e5ce0d0de2fd	4267	Srednja vas v Bohinju
00050000-5613-a1f5-468c-88e594ac0d61	8256	Sromlje 
00050000-5613-a1f5-1617-418902eacdeb	5224	Srpenica
00050000-5613-a1f5-324f-a77f0c4b7c69	1242	Stahovica
00050000-5613-a1f5-407b-d7ae14964656	1332	Stara Cerkev
00050000-5613-a1f5-7f95-11daf13bee82	8342	Stari trg ob Kolpi
00050000-5613-a1f5-6f69-73e1b511b7cc	1386	Stari trg pri Ložu
00050000-5613-a1f5-ca85-906fba6c930d	2205	Starše
00050000-5613-a1f5-62cd-ab2c647870cd	2289	Stoperce
00050000-5613-a1f5-8651-6fca30249142	8322	Stopiče
00050000-5613-a1f5-c571-97a9d2dc152e	3206	Stranice
00050000-5613-a1f5-5b62-b8aba057552c	8351	Straža
00050000-5613-a1f5-3a67-f0d188959647	1313	Struge
00050000-5613-a1f5-d19e-24eb5f95d800	8293	Studenec
00050000-5613-a1f5-51e4-d28d4177acaa	8331	Suhor
00050000-5613-a1f5-5d2c-ba340cc7dcbd	2233	Sv. Ana v Slovenskih goricah
00050000-5613-a1f5-28d8-cbdd8cae74f0	2235	Sv. Trojica v Slovenskih goricah
00050000-5613-a1f5-32c1-1815e2468e85	2353	Sveti Duh na Ostrem Vrhu
00050000-5613-a1f5-6695-00a6f60574b4	9244	Sveti Jurij ob Ščavnici
00050000-5613-a1f5-addb-71e2eb2e9a33	3264	Sveti Štefan
00050000-5613-a1f5-92ab-df27dd50538b	2258	Sveti Tomaž
00050000-5613-a1f5-f4ca-c8dd9a923126	9204	Šalovci
00050000-5613-a1f5-a0ca-33ec7a938c78	5261	Šempas
00050000-5613-a1f5-bbee-2e01c92fe0dc	5290	Šempeter pri Gorici
00050000-5613-a1f5-bf18-083f8dc2b99b	3311	Šempeter v Savinjski dolini
00050000-5613-a1f5-47be-3aed560bbe94	4208	Šenčur
00050000-5613-a1f5-f64b-100cdd723d9d	2212	Šentilj v Slovenskih goricah
00050000-5613-a1f5-abfb-3f075347bece	8297	Šentjanž
00050000-5613-a1f5-9688-cf365ad344a5	2373	Šentjanž pri Dravogradu
00050000-5613-a1f5-9c5b-2f5c6c659dc7	8310	Šentjernej
00050000-5613-a1f5-a2cf-c2715c310ddd	3230	Šentjur
00050000-5613-a1f5-c759-e5963fa7d7a5	3271	Šentrupert
00050000-5613-a1f5-3997-865b13846a9a	8232	Šentrupert
00050000-5613-a1f5-ac00-678b61929e51	1296	Šentvid pri Stični
00050000-5613-a1f5-4543-66abf0a8c87b	8275	Škocjan
00050000-5613-a1f5-4d32-d540e255d312	6281	Škofije
00050000-5613-a1f5-a8dd-1bfa5b3619cd	4220	Škofja Loka
00050000-5613-a1f5-1683-5e5007da53f2	3211	Škofja vas
00050000-5613-a1f5-3ccf-9d92d0367848	1291	Škofljica
00050000-5613-a1f5-4a8c-04bd7a4c475d	6274	Šmarje
00050000-5613-a1f5-7fd8-8e3d736a418e	1293	Šmarje - Sap
00050000-5613-a1f5-4bd0-d6cccfeb4425	3240	Šmarje pri Jelšah
00050000-5613-a1f5-4f60-73735e99c3c9	8220	Šmarješke Toplice
00050000-5613-a1f5-3124-40660e3c33d4	2315	Šmartno na Pohorju
00050000-5613-a1f5-5d2a-8370a9d77df7	3341	Šmartno ob Dreti
00050000-5613-a1f5-0043-156c090ab0aa	3327	Šmartno ob Paki
00050000-5613-a1f5-e29e-989525b6907d	1275	Šmartno pri Litiji
00050000-5613-a1f5-09b5-a63fcf4b3db9	2383	Šmartno pri Slovenj Gradcu
00050000-5613-a1f5-21f9-a304061e67be	3201	Šmartno v Rožni dolini
00050000-5613-a1f5-2d3c-c2f2feb16551	3325	Šoštanj
00050000-5613-a1f5-aa7e-c4f01762da0c	6222	Štanjel
00050000-5613-a1f5-8fdb-f12a7dd7f35c	3220	Štore
00050000-5613-a1f5-dc61-fb66000fbe4d	3304	Tabor
00050000-5613-a1f5-ab3c-ce7ba7ffec2c	3221	Teharje
00050000-5613-a1f5-f379-6a2fd425061e	9251	Tišina
00050000-5613-a1f5-4e3e-6ab82c63a229	5220	Tolmin
00050000-5613-a1f5-23b5-db7720544cf7	3326	Topolšica
00050000-5613-a1f5-1539-5393487269e3	2371	Trbonje
00050000-5613-a1f5-b36f-c23487a78726	1420	Trbovlje
00050000-5613-a1f5-58ea-4a1d5c71c9f7	8231	Trebelno 
00050000-5613-a1f5-206a-21a2658572d7	8210	Trebnje
00050000-5613-a1f5-f6fb-807f8ec315f9	5252	Trnovo pri Gorici
00050000-5613-a1f5-3df4-ab69848a3cba	2254	Trnovska vas
00050000-5613-a1f5-165a-37b1f523835b	1222	Trojane
00050000-5613-a1f5-b81d-230e92150d33	1236	Trzin
00050000-5613-a1f5-7af2-2fe85dfc823a	4290	Tržič
00050000-5613-a1f5-19d7-c506c059802c	8295	Tržišče
00050000-5613-a1f5-a054-0b600722dae1	1311	Turjak
00050000-5613-a1f5-a1cc-f01196e3ec10	9224	Turnišče
00050000-5613-a1f5-8de6-a2997f7c4d13	8323	Uršna sela
00050000-5613-a1f5-7e55-1c133ddc6ee6	1252	Vače
00050000-5613-a1f5-cc6a-1b13637dd7a9	3320	Velenje 
00050000-5613-a1f5-3f3b-12895e037a51	3322	Velenje - poštni predali
00050000-5613-a1f5-e4c7-a841410f42ca	8212	Velika Loka
00050000-5613-a1f5-45b5-383c7598edd0	2274	Velika Nedelja
00050000-5613-a1f5-951e-50e5e7bc94ed	9225	Velika Polana
00050000-5613-a1f5-776f-c9cbc844434e	1315	Velike Lašče
00050000-5613-a1f5-7975-4b8ac553b096	8213	Veliki Gaber
00050000-5613-a1f5-5296-35ea7426a46c	9241	Veržej
00050000-5613-a1f5-e6c1-3c7c704536b2	1312	Videm - Dobrepolje
00050000-5613-a1f5-6c09-033c4d3dde85	2284	Videm pri Ptuju
00050000-5613-a1f5-6a2f-2ea1821907c5	8344	Vinica
00050000-5613-a1f5-fd89-8f8488fc9bca	5271	Vipava
00050000-5613-a1f5-da71-c1fb5e8b94ea	4212	Visoko
00050000-5613-a1f5-9288-f6650788df6f	1294	Višnja Gora
00050000-5613-a1f5-68de-77b0738c419e	3205	Vitanje
00050000-5613-a1f5-e130-86a5fdd06be0	2255	Vitomarci
00050000-5613-a1f5-0827-7b7d81ef6cb0	1217	Vodice
00050000-5613-a1f5-055e-4b99fb2e0f0b	3212	Vojnik\t
00050000-5613-a1f5-a65f-43dd3d032bcf	5293	Volčja Draga
00050000-5613-a1f5-41bd-c64623cd96ce	2232	Voličina
00050000-5613-a1f5-202a-c97390713699	3305	Vransko
00050000-5613-a1f5-7253-5a0a55b67288	6217	Vremski Britof
00050000-5613-a1f5-700d-04615442d546	1360	Vrhnika
00050000-5613-a1f5-3fa1-88ee7a9dbe8f	2365	Vuhred
00050000-5613-a1f5-5668-2ab3f198fc1c	2367	Vuzenica
00050000-5613-a1f5-60f4-6dcd7170839a	8292	Zabukovje 
00050000-5613-a1f5-5d56-425c700b5747	1410	Zagorje ob Savi
00050000-5613-a1f5-0850-01b2474c757d	1303	Zagradec
00050000-5613-a1f5-c360-c9f12847b388	2283	Zavrč
00050000-5613-a1f5-8478-8bb3059aa983	8272	Zdole 
00050000-5613-a1f5-e976-78b93da01fa9	4201	Zgornja Besnica
00050000-5613-a1f5-781d-2919f6a43506	2242	Zgornja Korena
00050000-5613-a1f5-0fa9-ee57e8b115c2	2201	Zgornja Kungota
00050000-5613-a1f5-ff6c-c32e7d36dd5d	2316	Zgornja Ložnica
00050000-5613-a1f5-1af4-5bd7e01c451c	2314	Zgornja Polskava
00050000-5613-a1f5-1ccf-1a68d8752903	2213	Zgornja Velka
00050000-5613-a1f5-067c-f0b4d44b6420	4247	Zgornje Gorje
00050000-5613-a1f5-9877-c1807537f91f	4206	Zgornje Jezersko
00050000-5613-a1f5-18a9-121e37af0973	2285	Zgornji Leskovec
00050000-5613-a1f5-f860-1e7ded26bb4a	1432	Zidani Most
00050000-5613-a1f5-7b5f-2350ca448c07	3214	Zreče
00050000-5613-a1f5-dbe5-9fd634f10cc1	4209	Žabnica
00050000-5613-a1f5-289a-8a48f34696aa	3310	Žalec
00050000-5613-a1f5-e9d3-fd68360251b4	4228	Železniki
00050000-5613-a1f5-e57f-b36325d1e2ea	2287	Žetale
00050000-5613-a1f5-2474-b3b3ad7f0565	4226	Žiri
00050000-5613-a1f5-b327-2f4a90b0471c	4274	Žirovnica
00050000-5613-a1f5-a3fe-3d484152b8c5	8360	Žužemberk
\.


--
-- TOC entry 3031 (class 0 OID 21354535)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21354154)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 21353934)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5613-a1f8-1de3-fdae03441417	00080000-5613-a1f8-f423-afb137176188	\N	00040000-5613-a1f6-55be-95d1c083f6c2	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5613-a1f8-7b5d-00bb10ed5550	00080000-5613-a1f8-f423-afb137176188	\N	00040000-5613-a1f6-55be-95d1c083f6c2	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5613-a1f8-353a-0fd7a285d6ab	00080000-5613-a1f8-da23-d5f8dd470ecf	\N	00040000-5613-a1f6-55be-95d1c083f6c2	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2993 (class 0 OID 21354038)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21354166)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21354549)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21354559)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5613-a1f8-a62b-27053d6ea186	00080000-5613-a1f8-dace-e6eec1a56017	0987	AK
00190000-5613-a1f8-02dc-e90a735fb142	00080000-5613-a1f8-da23-d5f8dd470ecf	0989	AK
00190000-5613-a1f8-60c0-32e97cbefe43	00080000-5613-a1f8-a32d-c27105de246f	0986	AK
00190000-5613-a1f8-588a-c22c7b1de2e2	00080000-5613-a1f8-4ae9-0c30d9e5b351	0984	AK
00190000-5613-a1f8-aaf1-017e48ad4592	00080000-5613-a1f8-41c4-c19986f333ad	0983	AK
00190000-5613-a1f8-b60f-0cd14e84e1a4	00080000-5613-a1f8-95b4-8ff03e8f85d9	0982	AK
00190000-5613-a1fa-53a7-8e02474c904b	00080000-5613-a1fa-2be9-a7995e1878cb	1001	AK
\.


--
-- TOC entry 3030 (class 0 OID 21354492)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5613-a1f9-f319-08fda7f96978	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3034 (class 0 OID 21354567)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21354195)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5613-a1f8-9484-e1e339e8f41b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5613-a1f8-2689-fd6a91a66107	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5613-a1f8-7d3d-2bbfe95938c7	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5613-a1f8-9b87-9c214ad653ec	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5613-a1f8-b274-c21d9e8951bd	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5613-a1f8-3e37-39bbbe725109	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5613-a1f8-7e09-344603443124	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3002 (class 0 OID 21354139)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21354129)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21354339)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21354269)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 21354012)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 21353807)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5613-a1fa-2be9-a7995e1878cb	00010000-5613-a1f7-8071-040603e9a2d6	2015-10-06 12:27:06	INS	a:0:{}
2	App\\Entity\\Option	00000000-5613-a1fa-b674-ffea519222aa	00010000-5613-a1f7-8071-040603e9a2d6	2015-10-06 12:27:06	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5613-a1fa-53a7-8e02474c904b	00010000-5613-a1f7-8071-040603e9a2d6	2015-10-06 12:27:06	INS	a:0:{}
\.


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3011 (class 0 OID 21354208)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 21353845)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5613-a1f6-73fa-e11f7cc17786	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5613-a1f6-b09f-09e2f5ac3d40	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5613-a1f6-ce49-c8842b78a190	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5613-a1f6-e474-12dc40831145	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5613-a1f6-6fe2-faeaeaf5595c	planer	Planer dogodkov v koledarju	t
00020000-5613-a1f7-b8fe-93762234f00c	kadrovska	Kadrovska služba	t
00020000-5613-a1f7-fc6b-ab599b2692d6	arhivar	Ažuriranje arhivalij	t
00020000-5613-a1f7-99d6-ea892b9cc05c	igralec	Igralec	t
00020000-5613-a1f7-82b7-372a821a7304	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5613-a1f8-2748-2db846cbd48b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2976 (class 0 OID 21353829)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5613-a1f7-26d6-fe0e886d86ce	00020000-5613-a1f6-ce49-c8842b78a190
00010000-5613-a1f7-8071-040603e9a2d6	00020000-5613-a1f6-ce49-c8842b78a190
00010000-5613-a1f8-4141-7e9a24900ae3	00020000-5613-a1f8-2748-2db846cbd48b
\.


--
-- TOC entry 3013 (class 0 OID 21354222)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21354160)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21354106)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21353794)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5613-a1f6-6ef7-71965b4b9264	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5613-a1f6-b91c-8a11635c5752	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5613-a1f6-a6f7-150a8e7fdddc	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5613-a1f6-c28f-fdecf7915528	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5613-a1f6-b25c-0d048ef3637b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2971 (class 0 OID 21353786)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5613-a1f6-399a-4825dab6ba3d	00230000-5613-a1f6-c28f-fdecf7915528	popa
00240000-5613-a1f6-a948-48429691a071	00230000-5613-a1f6-c28f-fdecf7915528	oseba
00240000-5613-a1f6-135a-ef66115d9b78	00230000-5613-a1f6-c28f-fdecf7915528	sezona
00240000-5613-a1f6-802f-8ccab03ad296	00230000-5613-a1f6-b91c-8a11635c5752	prostor
00240000-5613-a1f6-9564-8d97aba7644b	00230000-5613-a1f6-c28f-fdecf7915528	besedilo
00240000-5613-a1f6-17a0-8353caff3c79	00230000-5613-a1f6-c28f-fdecf7915528	uprizoritev
00240000-5613-a1f6-23d6-f50748b10b71	00230000-5613-a1f6-c28f-fdecf7915528	funkcija
00240000-5613-a1f6-a676-fa6d6cedc528	00230000-5613-a1f6-c28f-fdecf7915528	tipfunkcije
00240000-5613-a1f6-8973-ab48fea9bb08	00230000-5613-a1f6-c28f-fdecf7915528	alternacija
00240000-5613-a1f6-a5e8-e9fefbfd5fe5	00230000-5613-a1f6-6ef7-71965b4b9264	pogodba
00240000-5613-a1f6-2769-c50b984cae59	00230000-5613-a1f6-c28f-fdecf7915528	zaposlitev
00240000-5613-a1f6-503c-eb963f8ac7e9	00230000-5613-a1f6-c28f-fdecf7915528	zvrstuprizoritve
00240000-5613-a1f6-a3f4-e652f0570e0c	00230000-5613-a1f6-6ef7-71965b4b9264	programdela
00240000-5613-a1f6-7fd4-6c9f98906359	00230000-5613-a1f6-c28f-fdecf7915528	zapis
\.


--
-- TOC entry 2970 (class 0 OID 21353781)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0830a117-33d4-4dfe-bc11-045cbeb2e269	00240000-5613-a1f6-399a-4825dab6ba3d	0	1001
\.


--
-- TOC entry 3019 (class 0 OID 21354286)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5613-a1f9-6f14-8a1e0b13cd91	000e0000-5613-a1f8-13af-032753195830	00080000-5613-a1f8-f423-afb137176188	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5613-a1f6-b1fb-01316aaac1f2
00270000-5613-a1f9-eac2-837b7c83f931	000e0000-5613-a1f8-13af-032753195830	00080000-5613-a1f8-f423-afb137176188	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5613-a1f6-b1fb-01316aaac1f2
\.


--
-- TOC entry 2983 (class 0 OID 21353907)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21354116)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5613-a1f9-68e8-11c166c2e8c0	00180000-5613-a1f9-9804-b3fc1c85ff23	000c0000-5613-a1f9-e1d6-2d6bad8e6ca6	00090000-5613-a1f8-f1b2-2f26814956c6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-a1f9-b524-6f19c998c434	00180000-5613-a1f9-9804-b3fc1c85ff23	000c0000-5613-a1f9-2445-d042973c7523	00090000-5613-a1f8-c585-d6fc62aa0080	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-a1f9-b3c1-c15ab4ffa4b9	00180000-5613-a1f9-9804-b3fc1c85ff23	000c0000-5613-a1f9-bc13-f5df87db65d3	00090000-5613-a1f8-ec89-0fe356df2dad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-a1f9-9b67-6882794702d9	00180000-5613-a1f9-9804-b3fc1c85ff23	000c0000-5613-a1f9-5bc1-e4fd43342009	00090000-5613-a1f8-ecf4-3043dad5e9bc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-a1f9-fb35-309b0a15250b	00180000-5613-a1f9-9804-b3fc1c85ff23	000c0000-5613-a1f9-1f93-3a4325138be5	00090000-5613-a1f8-82dd-f5bf1d1b805b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-a1f9-eae8-0115c44e12bc	00180000-5613-a1f9-312d-65b3b25b3291	\N	00090000-5613-a1f8-82dd-f5bf1d1b805b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3022 (class 0 OID 21354327)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5613-a1f6-a327-030ff96a6773	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5613-a1f6-9b16-d7cd52297f5f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5613-a1f6-a538-94be5d0258bb	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5613-a1f6-0a83-df140e415869	04	Režija	Režija	Režija	umetnik	30
000f0000-5613-a1f6-0df1-5899e58fdfb1	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5613-a1f6-c6e0-8065d60dc6a6	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5613-a1f6-a5f4-e6925003b2c3	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5613-a1f6-e741-f51b973c6f10	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5613-a1f6-e732-0c572b5e4586	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5613-a1f6-a724-b7a3bb741fd3	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5613-a1f6-ae6e-dc8fd4265243	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5613-a1f6-308c-b8b988af8e80	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5613-a1f6-e502-6d46446eb371	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5613-a1f6-55e6-ce17e2ead80f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5613-a1f6-5f2f-cec20ff65bb3	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5613-a1f6-ce36-8f14894ccc52	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5613-a1f6-0b68-88828d1ee62a	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5613-a1f6-52ee-a0eef19a930a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3035 (class 0 OID 21354578)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5613-a1f6-39a5-5018d7d99b30	01	Velika predstava	f	1.00	1.00
002b0000-5613-a1f6-2c88-c2ca27a17418	02	Mala predstava	f	0.50	0.50
002b0000-5613-a1f6-b1a8-dfd9775a0bd1	03	Mala koprodukcija	t	0.40	1.00
002b0000-5613-a1f6-d215-06eb28e6e489	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5613-a1f6-dd6e-0cd0d032fceb	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2988 (class 0 OID 21353969)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21353816)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5613-a1f7-8071-040603e9a2d6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO5aAMm2BPNcrfJ4/snKmI/A0UgnZL66e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-7edc-8292af832f62	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-76ef-428725aeb9b6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-23d2-7db27ee79688	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-d5c4-bff8eff22e33	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-959f-1c37c0f3fec4	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-a189-bc2fd113e32d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-668e-5ab9662b16af	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-524b-dbda9ec6ada1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-86e3-60716f1c047c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5613-a1f8-4141-7e9a24900ae3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5613-a1f7-26d6-fe0e886d86ce	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3026 (class 0 OID 21354377)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5613-a1f8-e2b5-e29d73d7eb26	00160000-5613-a1f8-b9b7-aae91a22818a	\N	00140000-5613-a1f6-4a0c-e682581a8be3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5613-a1f8-b274-c21d9e8951bd
000e0000-5613-a1f8-13af-032753195830	00160000-5613-a1f8-32ad-89ceaf270f22	\N	00140000-5613-a1f6-68e5-7a04e7b9d53b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5613-a1f8-3e37-39bbbe725109
000e0000-5613-a1f8-a2b4-1638fad875af	\N	\N	00140000-5613-a1f6-68e5-7a04e7b9d53b	00190000-5613-a1f8-a62b-27053d6ea186	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-a1f8-b274-c21d9e8951bd
000e0000-5613-a1f8-89d3-b2189f2e512c	\N	\N	00140000-5613-a1f6-68e5-7a04e7b9d53b	00190000-5613-a1f8-a62b-27053d6ea186	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-a1f8-b274-c21d9e8951bd
000e0000-5613-a1f8-cc13-ed480faf9723	\N	\N	00140000-5613-a1f6-68e5-7a04e7b9d53b	00190000-5613-a1f8-a62b-27053d6ea186	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-a1f8-9484-e1e339e8f41b
000e0000-5613-a1f8-6fb6-e24bd1bf10cb	\N	\N	00140000-5613-a1f6-68e5-7a04e7b9d53b	00190000-5613-a1f8-a62b-27053d6ea186	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-a1f8-9484-e1e339e8f41b
\.


--
-- TOC entry 2995 (class 0 OID 21354060)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5613-a1f9-e9d6-0f132c28ee42	000e0000-5613-a1f8-13af-032753195830	\N	1	
00200000-5613-a1f9-9c00-6648a7212088	000e0000-5613-a1f8-13af-032753195830	\N	2	
00200000-5613-a1f9-88e1-a19de0747f88	000e0000-5613-a1f8-13af-032753195830	\N	3	
00200000-5613-a1f9-3d93-b6d89f18c49d	000e0000-5613-a1f8-13af-032753195830	\N	4	
00200000-5613-a1f9-f5ee-3fe819113371	000e0000-5613-a1f8-13af-032753195830	\N	5	
\.


--
-- TOC entry 3009 (class 0 OID 21354187)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21354300)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5613-a1f6-3420-cec0b274e8e3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5613-a1f6-a637-4cfde53d70e4	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5613-a1f6-df2c-4ff2a591bd9a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5613-a1f6-8da2-1b8e2238f38e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5613-a1f6-06d0-dbe658d8aa37	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5613-a1f6-39c5-6852ba8d3c78	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5613-a1f6-6e2f-5d0e04e4956e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5613-a1f6-aa5e-b0161ecda1aa	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5613-a1f6-b1fb-01316aaac1f2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5613-a1f6-872b-287bb105b7bf	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5613-a1f6-84f7-6d8d2908cba1	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5613-a1f6-cf28-a9b199ce22a4	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5613-a1f6-516c-1c45a32b77cc	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5613-a1f6-3009-c1742526a3c5	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5613-a1f6-a86e-307817b4a5af	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5613-a1f6-6f79-1f7381b605db	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5613-a1f6-aad3-dc0dd0d0444e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5613-a1f6-b992-67d30ce1ce80	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5613-a1f6-0898-95916eb3ac30	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5613-a1f6-2697-d5cb391425e3	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5613-a1f6-f5aa-63e6ffc123c3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5613-a1f6-d25f-5a73582faaf7	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5613-a1f6-0c50-c7771b320a63	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5613-a1f6-ca43-0e59f38ae703	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5613-a1f6-3ba6-10048a08dac1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5613-a1f6-fa1c-82eec30fba32	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5613-a1f6-7a1d-e6e2b9a3458b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5613-a1f6-17ef-a50a83171b29	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3038 (class 0 OID 21354625)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21354597)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21354637)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21354259)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5613-a1f8-e3af-f80bda2bff7c	00090000-5613-a1f8-c585-d6fc62aa0080	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-a1f8-86bd-71570df15ae4	00090000-5613-a1f8-ec89-0fe356df2dad	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-a1f8-252b-19ec7692ef80	00090000-5613-a1f8-7cfd-c988ac29bc0a	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-a1f8-72a7-20cf27a02f08	00090000-5613-a1f8-e095-15eaa6b3cb25	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-a1f8-37d0-64315899040d	00090000-5613-a1f8-f1b2-2f26814956c6	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-a1f8-fcdd-04ff0870b578	00090000-5613-a1f8-864c-6a1c748d2b6a	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2997 (class 0 OID 21354095)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21354367)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5613-a1f6-4a0c-e682581a8be3	01	Drama	drama (SURS 01)
00140000-5613-a1f6-a344-3e95e9be018c	02	Opera	opera (SURS 02)
00140000-5613-a1f6-01ad-d1d1875aaad9	03	Balet	balet (SURS 03)
00140000-5613-a1f6-5cb8-db096c4d8938	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5613-a1f6-a01d-5e8061467eae	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5613-a1f6-68e5-7a04e7b9d53b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5613-a1f6-e4ba-2da93096377b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3015 (class 0 OID 21354249)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2502 (class 2606 OID 21353870)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21354426)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21354416)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 21354283)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21354325)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 21354677)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 21354084)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 21354105)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 21354595)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 21353995)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 21354486)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21354245)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 21354058)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 21354033)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21354009)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21354152)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 21354654)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21354661)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2756 (class 2606 OID 21354685)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2614 (class 2606 OID 21354179)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21353967)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21353879)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 21353903)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21353859)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2493 (class 2606 OID 21353844)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21354185)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21354221)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21354362)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 21353931)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21353955)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 21354547)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 21354158)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 21353945)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 21354046)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 21354170)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21354556)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 21354564)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21354534)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21354576)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 21354203)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 21354143)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21354134)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 21354349)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 21354276)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 21354021)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 21353815)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 21354212)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 21353833)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2495 (class 2606 OID 21353853)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 21354230)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21354165)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 21354114)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21353803)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21353791)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21353785)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 21354296)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21353912)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 21354125)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21354336)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21354588)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 21353980)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 21353828)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21354395)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 21354068)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21354193)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21354308)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21354635)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21354619)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21354643)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 21354267)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 21354099)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 21354375)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21354257)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 1259 OID 21354093)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 21354094)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2568 (class 1259 OID 21354092)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2569 (class 1259 OID 21354091)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2570 (class 1259 OID 21354090)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2656 (class 1259 OID 21354297)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2657 (class 1259 OID 21354298)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2658 (class 1259 OID 21354299)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2742 (class 1259 OID 21354656)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2743 (class 1259 OID 21354655)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2516 (class 1259 OID 21353933)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 21354186)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2729 (class 1259 OID 21354623)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2730 (class 1259 OID 21354622)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2731 (class 1259 OID 21354624)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2732 (class 1259 OID 21354621)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2733 (class 1259 OID 21354620)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2609 (class 1259 OID 21354172)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2610 (class 1259 OID 21354171)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 21354069)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 21354246)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 21354248)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2641 (class 1259 OID 21354247)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2541 (class 1259 OID 21354011)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 21354010)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2720 (class 1259 OID 21354577)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2672 (class 1259 OID 21354364)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 21354365)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21354366)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2739 (class 1259 OID 21354644)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2681 (class 1259 OID 21354400)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2682 (class 1259 OID 21354397)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2683 (class 1259 OID 21354401)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2684 (class 1259 OID 21354399)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2685 (class 1259 OID 21354398)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2531 (class 1259 OID 21353982)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 21353981)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2507 (class 1259 OID 21353906)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2627 (class 1259 OID 21354213)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2497 (class 1259 OID 21353860)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2498 (class 1259 OID 21353861)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2632 (class 1259 OID 21354233)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2633 (class 1259 OID 21354232)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2634 (class 1259 OID 21354231)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 21354047)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 21354048)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2477 (class 1259 OID 21353793)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2589 (class 1259 OID 21354138)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2590 (class 1259 OID 21354136)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2591 (class 1259 OID 21354135)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2592 (class 1259 OID 21354137)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2488 (class 1259 OID 21353834)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2489 (class 1259 OID 21353835)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 21354194)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2752 (class 1259 OID 21354678)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2654 (class 1259 OID 21354285)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2655 (class 1259 OID 21354284)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2753 (class 1259 OID 21354686)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2754 (class 1259 OID 21354687)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2604 (class 1259 OID 21354159)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2648 (class 1259 OID 21354277)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2649 (class 1259 OID 21354278)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21354491)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2703 (class 1259 OID 21354490)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2704 (class 1259 OID 21354487)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 21354488)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2706 (class 1259 OID 21354489)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2520 (class 1259 OID 21353947)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 21353946)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2522 (class 1259 OID 21353948)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2621 (class 1259 OID 21354207)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 21354206)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 21354557)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 21354558)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2695 (class 1259 OID 21354430)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 21354431)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2697 (class 1259 OID 21354428)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2698 (class 1259 OID 21354429)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2645 (class 1259 OID 21354268)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 21354147)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2596 (class 1259 OID 21354146)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2597 (class 1259 OID 21354144)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2598 (class 1259 OID 21354145)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2691 (class 1259 OID 21354418)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 21354417)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 21354022)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2548 (class 1259 OID 21354036)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2549 (class 1259 OID 21354035)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2550 (class 1259 OID 21354034)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2551 (class 1259 OID 21354037)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2560 (class 1259 OID 21354059)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2709 (class 1259 OID 21354548)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2728 (class 1259 OID 21354596)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2746 (class 1259 OID 21354662)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 21354663)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2503 (class 1259 OID 21353881)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 21353880)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2512 (class 1259 OID 21353913)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2513 (class 1259 OID 21353914)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2576 (class 1259 OID 21354100)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 21354128)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 21354127)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2586 (class 1259 OID 21354126)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 21354086)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2572 (class 1259 OID 21354087)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2573 (class 1259 OID 21354085)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2574 (class 1259 OID 21354089)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2575 (class 1259 OID 21354088)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2519 (class 1259 OID 21353932)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21353996)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2538 (class 1259 OID 21353998)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2539 (class 1259 OID 21353997)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2540 (class 1259 OID 21353999)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2603 (class 1259 OID 21354153)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2677 (class 1259 OID 21354363)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 21354396)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 21354337)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 21354338)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2510 (class 1259 OID 21353904)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 21353905)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2642 (class 1259 OID 21354258)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 21353804)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 21353968)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2480 (class 1259 OID 21353792)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2725 (class 1259 OID 21354589)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 21354205)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2626 (class 1259 OID 21354204)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2699 (class 1259 OID 21354427)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21353956)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2678 (class 1259 OID 21354376)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 21354636)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2718 (class 1259 OID 21354565)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 21354566)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2665 (class 1259 OID 21354326)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2583 (class 1259 OID 21354115)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 21353854)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2787 (class 2606 OID 21354818)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2786 (class 2606 OID 21354823)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2782 (class 2606 OID 21354843)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2788 (class 2606 OID 21354813)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2784 (class 2606 OID 21354833)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2783 (class 2606 OID 21354838)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2785 (class 2606 OID 21354828)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2823 (class 2606 OID 21355008)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2822 (class 2606 OID 21355013)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2821 (class 2606 OID 21355018)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2855 (class 2606 OID 21355183)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2856 (class 2606 OID 21355178)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2768 (class 2606 OID 21354743)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 21354928)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2850 (class 2606 OID 21355163)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2851 (class 2606 OID 21355158)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 21355168)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2852 (class 2606 OID 21355153)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2853 (class 2606 OID 21355148)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2803 (class 2606 OID 21354923)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2804 (class 2606 OID 21354918)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2781 (class 2606 OID 21354808)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 21354968)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2813 (class 2606 OID 21354978)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2814 (class 2606 OID 21354973)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2774 (class 2606 OID 21354778)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2775 (class 2606 OID 21354773)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 21354908)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 21355138)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2826 (class 2606 OID 21355023)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 21355028)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2824 (class 2606 OID 21355033)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2854 (class 2606 OID 21355173)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2828 (class 2606 OID 21355053)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2831 (class 2606 OID 21355038)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2827 (class 2606 OID 21355058)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 21355048)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2830 (class 2606 OID 21355043)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2772 (class 2606 OID 21354768)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2773 (class 2606 OID 21354763)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 21354728)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2765 (class 2606 OID 21354723)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2809 (class 2606 OID 21354948)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2761 (class 2606 OID 21354703)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2760 (class 2606 OID 21354708)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2810 (class 2606 OID 21354963)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2811 (class 2606 OID 21354958)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2812 (class 2606 OID 21354953)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2779 (class 2606 OID 21354793)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 21354798)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 21354688)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2793 (class 2606 OID 21354883)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2795 (class 2606 OID 21354873)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2796 (class 2606 OID 21354868)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2794 (class 2606 OID 21354878)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2759 (class 2606 OID 21354693)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 21354698)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2806 (class 2606 OID 21354933)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2859 (class 2606 OID 21355198)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2819 (class 2606 OID 21355003)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 21354998)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2861 (class 2606 OID 21355203)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2860 (class 2606 OID 21355208)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2802 (class 2606 OID 21354913)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2818 (class 2606 OID 21354988)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2817 (class 2606 OID 21354993)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21355113)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 21355108)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21355093)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21355098)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2840 (class 2606 OID 21355103)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2770 (class 2606 OID 21354753)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 21354748)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2769 (class 2606 OID 21354758)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 21354943)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2808 (class 2606 OID 21354938)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21355123)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2844 (class 2606 OID 21355128)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2835 (class 2606 OID 21355083)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21355088)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2837 (class 2606 OID 21355073)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2836 (class 2606 OID 21355078)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2816 (class 2606 OID 21354983)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 21354903)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2798 (class 2606 OID 21354898)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2800 (class 2606 OID 21354888)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2799 (class 2606 OID 21354893)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 21355068)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 21355063)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2776 (class 2606 OID 21354783)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2777 (class 2606 OID 21354788)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 21354803)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2843 (class 2606 OID 21355118)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2846 (class 2606 OID 21355133)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 21355143)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21355188)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2857 (class 2606 OID 21355193)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2762 (class 2606 OID 21354718)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2763 (class 2606 OID 21354713)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2767 (class 2606 OID 21354733)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 21354738)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 21354848)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 21354863)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 21354858)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2792 (class 2606 OID 21354853)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-06 12:27:07 CEST

--
-- PostgreSQL database dump complete
--

