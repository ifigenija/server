--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-12 13:56:13 CEST

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
-- TOC entry 181 (class 1259 OID 21678811)
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
-- TOC entry 229 (class 1259 OID 21679368)
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
-- TOC entry 228 (class 1259 OID 21679351)
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
-- TOC entry 219 (class 1259 OID 21679228)
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
-- TOC entry 222 (class 1259 OID 21679258)
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
-- TOC entry 243 (class 1259 OID 21679627)
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
-- TOC entry 197 (class 1259 OID 21679019)
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
-- TOC entry 199 (class 1259 OID 21679050)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21679553)
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
-- TOC entry 190 (class 1259 OID 21678932)
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
-- TOC entry 230 (class 1259 OID 21679381)
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
-- TOC entry 215 (class 1259 OID 21679183)
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
-- TOC entry 195 (class 1259 OID 21678998)
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
-- TOC entry 193 (class 1259 OID 21678972)
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
-- TOC entry 191 (class 1259 OID 21678949)
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
-- TOC entry 204 (class 1259 OID 21679097)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21679608)
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
-- TOC entry 242 (class 1259 OID 21679620)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21679642)
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
-- TOC entry 208 (class 1259 OID 21679122)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21678906)
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
-- TOC entry 182 (class 1259 OID 21678820)
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
-- TOC entry 183 (class 1259 OID 21678831)
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
-- TOC entry 178 (class 1259 OID 21678785)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21678804)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21679129)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21679163)
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
-- TOC entry 225 (class 1259 OID 21679299)
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
-- TOC entry 185 (class 1259 OID 21678864)
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
-- TOC entry 187 (class 1259 OID 21678898)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21679498)
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
-- TOC entry 205 (class 1259 OID 21679103)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21678883)
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
-- TOC entry 194 (class 1259 OID 21678987)
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
-- TOC entry 207 (class 1259 OID 21679115)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21679512)
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
-- TOC entry 234 (class 1259 OID 21679522)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21679445)
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
-- TOC entry 235 (class 1259 OID 21679530)
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
-- TOC entry 211 (class 1259 OID 21679144)
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
-- TOC entry 203 (class 1259 OID 21679088)
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
-- TOC entry 202 (class 1259 OID 21679078)
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
-- TOC entry 224 (class 1259 OID 21679288)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21679218)
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
-- TOC entry 192 (class 1259 OID 21678961)
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
-- TOC entry 175 (class 1259 OID 21678756)
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
-- TOC entry 174 (class 1259 OID 21678754)
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
-- TOC entry 212 (class 1259 OID 21679157)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21678794)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21678778)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21679171)
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
-- TOC entry 206 (class 1259 OID 21679109)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21679055)
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
-- TOC entry 173 (class 1259 OID 21678743)
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
-- TOC entry 172 (class 1259 OID 21678735)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21678730)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21679235)
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
-- TOC entry 184 (class 1259 OID 21678856)
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
-- TOC entry 201 (class 1259 OID 21679065)
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
-- TOC entry 223 (class 1259 OID 21679276)
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
-- TOC entry 236 (class 1259 OID 21679541)
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
-- TOC entry 189 (class 1259 OID 21678918)
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
-- TOC entry 176 (class 1259 OID 21678765)
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
-- TOC entry 227 (class 1259 OID 21679326)
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
-- TOC entry 196 (class 1259 OID 21679009)
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
-- TOC entry 210 (class 1259 OID 21679136)
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
-- TOC entry 221 (class 1259 OID 21679249)
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
-- TOC entry 239 (class 1259 OID 21679588)
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
-- TOC entry 238 (class 1259 OID 21679560)
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
-- TOC entry 240 (class 1259 OID 21679600)
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
-- TOC entry 217 (class 1259 OID 21679208)
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
-- TOC entry 198 (class 1259 OID 21679044)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21679316)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21679198)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21678759)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 21678811)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21679368)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561b-9fdb-d647-11654a7e490b	000d0000-561b-9fda-df41-d0856bebcd2e	\N	00090000-561b-9fda-26b4-7e1e140b353b	000b0000-561b-9fda-f074-95945069ac67	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561b-9fdb-873d-bbb2730f6715	000d0000-561b-9fda-2f86-11a60060e617	00100000-561b-9fda-b7cb-08406c59d172	00090000-561b-9fda-c9d0-cc868721384a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561b-9fdb-bb39-009d8c25df34	000d0000-561b-9fda-4135-8960660a868e	00100000-561b-9fda-bba8-7da80c030911	00090000-561b-9fda-1962-c6f83d104953	\N	0003	t	\N	2015-10-12	\N	2	t	\N	f	f
000c0000-561b-9fdb-eb42-10cc467b9b77	000d0000-561b-9fda-4697-f6b98934a728	\N	00090000-561b-9fda-3b83-c06e0865a53d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561b-9fdb-876e-4033a74ace77	000d0000-561b-9fda-b6af-bef53fcfae68	\N	00090000-561b-9fda-cf02-5866f3296c66	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561b-9fdb-2576-c4c636a50971	000d0000-561b-9fda-c41a-2163371b01ee	\N	00090000-561b-9fda-0534-844ed56ed3ef	000b0000-561b-9fda-c24e-7393dc194634	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561b-9fdb-8152-2adf49b8c6ad	000d0000-561b-9fda-81ea-9d68ea8055ac	00100000-561b-9fda-c785-73e6f546c0c0	00090000-561b-9fda-fb6e-67bbe4491dd4	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561b-9fdb-bfd4-afe207c7dc01	000d0000-561b-9fda-11fb-cc6f3ddd6dd7	\N	00090000-561b-9fda-385f-c136c256f8ff	000b0000-561b-9fda-8478-42cf555f0e10	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561b-9fdb-71ef-927602931c3b	000d0000-561b-9fda-81ea-9d68ea8055ac	00100000-561b-9fda-61ae-47dbc5ceed17	00090000-561b-9fda-7629-e172c83026cf	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561b-9fdb-30bb-710bd09cccac	000d0000-561b-9fda-81ea-9d68ea8055ac	00100000-561b-9fda-7876-84744e487ed3	00090000-561b-9fda-5739-a2e0ced80fd5	\N	0010	t	\N	2015-10-12	\N	16	f	\N	f	t
000c0000-561b-9fdb-abd7-09841ee74198	000d0000-561b-9fda-81ea-9d68ea8055ac	00100000-561b-9fda-dde2-48bdff752155	00090000-561b-9fda-988d-448f4df624ed	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561b-9fdb-c8f1-f5d8094b3e44	000d0000-561b-9fda-0fd6-1c9f89bf292e	\N	00090000-561b-9fda-c9d0-cc868721384a	000b0000-561b-9fda-2d30-259030d3a0eb	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3041 (class 0 OID 21679351)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21679228)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561b-9fda-8935-e4a5541a271e	00160000-561b-9fda-4ea0-bcabbaab7c05	00090000-561b-9fda-010a-8f12afb25ada	aizv	10	t
003d0000-561b-9fda-4b30-6d15b65a7641	00160000-561b-9fda-4ea0-bcabbaab7c05	00090000-561b-9fda-1f12-6a88de1768f9	apri	14	t
003d0000-561b-9fda-36a6-eaccb0cf7277	00160000-561b-9fda-0662-e993a73fbc6b	00090000-561b-9fda-7d66-357446243a37	aizv	11	t
003d0000-561b-9fda-edac-dc151eee1f8e	00160000-561b-9fda-ca78-1f83dd8470a0	00090000-561b-9fda-51cd-33cb19270ab6	aizv	12	t
003d0000-561b-9fda-4292-72b06fb00d18	00160000-561b-9fda-4ea0-bcabbaab7c05	00090000-561b-9fda-393f-8c00171731b5	apri	18	f
\.


--
-- TOC entry 3035 (class 0 OID 21679258)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561b-9fda-4ea0-bcabbaab7c05	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561b-9fda-0662-e993a73fbc6b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561b-9fda-ca78-1f83dd8470a0	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3056 (class 0 OID 21679627)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21679019)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561b-9fdb-2553-4784798ef26c	\N	\N	00200000-561b-9fda-a8a1-57daca6c6f97	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561b-9fdb-1315-816d3ced6e62	\N	\N	00200000-561b-9fda-a873-0070607f660c	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561b-9fdb-4afa-7d6cc1c053b3	\N	\N	00200000-561b-9fda-e1e1-5ecce50116a0	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561b-9fdb-9ae0-227dd25a0a97	\N	\N	00200000-561b-9fda-0e17-f6207adf0707	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561b-9fdb-5bfc-abee86b3443c	\N	\N	00200000-561b-9fda-a40f-1a5971aee4f8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3012 (class 0 OID 21679050)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21679553)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21678932)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561b-9fd8-32a7-9771b4e91fe2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561b-9fd8-c6f9-7f2856d0834e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561b-9fd8-60d1-16b8ce54dc70	AL	ALB	008	Albania 	Albanija	\N
00040000-561b-9fd8-93d8-936f20c90604	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561b-9fd8-c4bb-7f6d33bac751	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561b-9fd8-d514-8427a2b51f64	AD	AND	020	Andorra 	Andora	\N
00040000-561b-9fd8-e65a-560b69242aca	AO	AGO	024	Angola 	Angola	\N
00040000-561b-9fd8-22a7-4486f299979d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561b-9fd8-5eff-dad3073c5296	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561b-9fd8-91c0-e51b3d499315	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-9fd8-06a8-f87b91006892	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561b-9fd8-4c2d-8dd2b18cc6bd	AM	ARM	051	Armenia 	Armenija	\N
00040000-561b-9fd8-65a4-e387a88f850d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561b-9fd8-8bfa-1572734a5fcc	AU	AUS	036	Australia 	Avstralija	\N
00040000-561b-9fd8-0102-2622418a9620	AT	AUT	040	Austria 	Avstrija	\N
00040000-561b-9fd8-666c-4f3363e9d978	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561b-9fd8-b9a1-8b0532948ead	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561b-9fd8-8948-d7cd4981e485	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561b-9fd8-e997-a27cba38f3d4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561b-9fd8-4dbd-e726f6b33b8e	BB	BRB	052	Barbados 	Barbados	\N
00040000-561b-9fd8-439b-4d5729e152d9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561b-9fd8-944b-79d0612e80a8	BE	BEL	056	Belgium 	Belgija	\N
00040000-561b-9fd8-e10c-78c9902b0ed3	BZ	BLZ	084	Belize 	Belize	\N
00040000-561b-9fd8-d1d6-65a97d8f2ce0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561b-9fd8-cebf-8d75c97e5997	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561b-9fd8-ce52-3520442b112f	BT	BTN	064	Bhutan 	Butan	\N
00040000-561b-9fd8-9541-a59b551ec6c0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561b-9fd8-f399-c7b15d320c81	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561b-9fd8-7818-a690c8406dd3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561b-9fd8-471e-ef4e08cd6109	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561b-9fd8-cd81-b724591ea994	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561b-9fd8-d280-4d227e2371a9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561b-9fd8-bf91-27a72a759567	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561b-9fd8-ce6b-3906c51835fc	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561b-9fd8-4f01-66b21c97c3a3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561b-9fd8-e3e0-351a8e843b1a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561b-9fd8-6758-73a9c5de133c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561b-9fd8-b146-b97827f254a8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561b-9fd8-2571-31b231fe7e95	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561b-9fd8-ab4c-d179e5c23882	CA	CAN	124	Canada 	Kanada	\N
00040000-561b-9fd8-912c-288e0b620d03	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561b-9fd8-cda2-73ee2163a68b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561b-9fd8-045b-3f6805cf7852	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561b-9fd8-18de-9919dba946fc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561b-9fd8-63bd-6a8a2b281ccd	CL	CHL	152	Chile 	Čile	\N
00040000-561b-9fd8-ec37-c0111e01ae30	CN	CHN	156	China 	Kitajska	\N
00040000-561b-9fd8-38cc-cdbbca86f919	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561b-9fd8-fa4c-e9ba10b84ba0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561b-9fd8-0afb-94effea9afa4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561b-9fd8-117c-ffed91a401de	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561b-9fd8-2150-889c89c309e4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561b-9fd8-9f18-40edad27782a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561b-9fd8-b780-c242b111a716	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561b-9fd8-e667-4d2fb54071ff	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561b-9fd8-4d0c-ad840afbcdfd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561b-9fd8-b937-8f07a6b84520	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561b-9fd8-505e-f04aa6ed8c6a	CU	CUB	192	Cuba 	Kuba	\N
00040000-561b-9fd8-1dfe-5ebcef62bb68	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561b-9fd8-b8ee-7af2964b83c2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561b-9fd8-5561-abfc28dbca7e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561b-9fd8-94fa-399ef671c47c	DK	DNK	208	Denmark 	Danska	\N
00040000-561b-9fd8-9df2-e761817049ce	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561b-9fd8-9aaa-bf4b6b81f893	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-9fd8-4d60-5094222a22bc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561b-9fd8-341b-b753ea4580e2	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561b-9fd8-6e25-b06d3ffc0e0f	EG	EGY	818	Egypt 	Egipt	\N
00040000-561b-9fd8-05c5-950c8eb9eee7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561b-9fd8-4b6f-ef5bd45950a2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561b-9fd8-1492-059e037e82ad	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561b-9fd8-4ccc-17043f1b7286	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561b-9fd8-fcda-6b520e76da4b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561b-9fd8-ee8b-0a296dbecd4b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561b-9fd8-24c8-6e62943d0bd7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561b-9fd8-ed46-2769622b6a16	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561b-9fd8-53de-bd919651f1c8	FI	FIN	246	Finland 	Finska	\N
00040000-561b-9fd8-4300-df00aaabaa62	FR	FRA	250	France 	Francija	\N
00040000-561b-9fd8-fb81-8caf3d31beab	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561b-9fd8-4655-8e9abb5a9ca1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561b-9fd8-c59e-3a41f0ed89d0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561b-9fd8-34ae-3e53ef36efa8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561b-9fd8-c5c5-4bddd87fda98	GA	GAB	266	Gabon 	Gabon	\N
00040000-561b-9fd8-1e99-86434d2f4a5e	GM	GMB	270	Gambia 	Gambija	\N
00040000-561b-9fd8-635e-b83bd313f502	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561b-9fd8-36c1-0747edca1c54	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561b-9fd8-3a64-23055eb58736	GH	GHA	288	Ghana 	Gana	\N
00040000-561b-9fd8-817d-821e1cb1fa6b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561b-9fd8-78e3-7a2c8adc49c9	GR	GRC	300	Greece 	Grčija	\N
00040000-561b-9fd8-0800-d5db104c6713	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561b-9fd8-b983-bde37a319c00	GD	GRD	308	Grenada 	Grenada	\N
00040000-561b-9fd8-c802-cc00a5590e32	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561b-9fd8-6f6a-bc86d4f8efbe	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561b-9fd8-0efc-96a50e00dd16	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561b-9fd8-b383-d90fe7c19bc8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561b-9fd8-abc9-eb6b5ef88a29	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561b-9fd8-0a24-1b0dc4601357	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561b-9fd8-d6d8-b2c98d8f464e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561b-9fd8-78fa-aed84469b777	HT	HTI	332	Haiti 	Haiti	\N
00040000-561b-9fd8-352e-ac45e74ab533	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561b-9fd8-d18a-4c59d7dc8efd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561b-9fd8-7813-a900acb51f8d	HN	HND	340	Honduras 	Honduras	\N
00040000-561b-9fd8-0b97-715e9278a099	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561b-9fd8-8cee-3773e4ce4cc9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561b-9fd8-6945-1cb16aa62c07	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561b-9fd8-098c-221dbb8e2294	IN	IND	356	India 	Indija	\N
00040000-561b-9fd8-839c-32c15ad5368e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561b-9fd8-2c06-b4a3c006fef3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561b-9fd8-653b-5270094d2ed9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561b-9fd8-3824-4d493f4c7808	IE	IRL	372	Ireland 	Irska	\N
00040000-561b-9fd8-0062-45bda3c1fd7b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561b-9fd8-62b3-454bb589e44f	IL	ISR	376	Israel 	Izrael	\N
00040000-561b-9fd8-9ad1-4397420f65f8	IT	ITA	380	Italy 	Italija	\N
00040000-561b-9fd8-60d7-b9b9e1cddbad	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561b-9fd8-18c0-ced719b7b1c4	JP	JPN	392	Japan 	Japonska	\N
00040000-561b-9fd8-bc9a-9da8cd2771fa	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561b-9fd8-0cee-c4c9fc45de97	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561b-9fd8-7e4d-8bb4d5866fc9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561b-9fd8-1724-c3f74535d0da	KE	KEN	404	Kenya 	Kenija	\N
00040000-561b-9fd8-3f15-a546af98eff0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561b-9fd8-4cdc-e478056debf8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561b-9fd8-e3ba-eb16a1c00581	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561b-9fd8-e3af-9cd2fd1e5a05	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561b-9fd8-e108-664ebb3e8403	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561b-9fd8-294d-7e335dd99bb3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561b-9fd8-1f6a-6aa32d977512	LV	LVA	428	Latvia 	Latvija	\N
00040000-561b-9fd8-c5ef-f25326a2a910	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561b-9fd8-9876-d7fb4a709985	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561b-9fd8-c6ce-eade631ee6ce	LR	LBR	430	Liberia 	Liberija	\N
00040000-561b-9fd8-b03b-e3f8177c703e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561b-9fd8-7a0a-3d6624d17286	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561b-9fd8-0330-d11d657267c8	LT	LTU	440	Lithuania 	Litva	\N
00040000-561b-9fd8-97c3-3487cb542fdb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561b-9fd8-cbcc-232ecc32a9a8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561b-9fd8-0e42-e74b8dd8dac7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561b-9fd8-d97a-6351b87fc406	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561b-9fd8-d7f2-51861c65b5d8	MW	MWI	454	Malawi 	Malavi	\N
00040000-561b-9fd8-cabf-14671c57032b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561b-9fd8-095a-9e4119e22864	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561b-9fd8-6b4e-dbceb1426895	ML	MLI	466	Mali 	Mali	\N
00040000-561b-9fd8-4646-c8141836b1de	MT	MLT	470	Malta 	Malta	\N
00040000-561b-9fd8-46fc-9a0631304cea	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561b-9fd8-eb14-46c0cf6a0ad9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561b-9fd8-6f1f-3dafe843c80b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561b-9fd8-b0a2-38823e590c87	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561b-9fd8-8561-67985eeebcd3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561b-9fd8-d260-81e1d73cf4a3	MX	MEX	484	Mexico 	Mehika	\N
00040000-561b-9fd8-d55b-752d84849440	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561b-9fd8-df85-d5d18b4fbe85	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561b-9fd8-0b1d-275e2326d65d	MC	MCO	492	Monaco 	Monako	\N
00040000-561b-9fd8-17c5-ffcd8d8b6c72	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561b-9fd8-6944-c33da315c9b5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561b-9fd8-c031-26353e3f94e5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561b-9fd8-79ae-fbb81775ef1f	MA	MAR	504	Morocco 	Maroko	\N
00040000-561b-9fd8-f4ec-c08786e181df	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561b-9fd8-7dd4-201e8f64a20c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561b-9fd8-77bc-d6a99fd79a06	NA	NAM	516	Namibia 	Namibija	\N
00040000-561b-9fd8-f6d4-c274290a3551	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561b-9fd8-5278-a693e181b8d6	NP	NPL	524	Nepal 	Nepal	\N
00040000-561b-9fd8-96f0-a315c4f337d4	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561b-9fd8-0298-c024aadf1413	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561b-9fd8-183e-3eabeed6e4bf	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561b-9fd8-2a3d-1834e17d5abc	NE	NER	562	Niger 	Niger 	\N
00040000-561b-9fd8-3a8f-6ba84b5157e1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561b-9fd8-48e0-3cb6ebfb2bdc	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561b-9fd8-ee75-12c3b530bf3b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561b-9fd8-660b-c2f510fcf893	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561b-9fd8-04f0-340c7e1aefb0	NO	NOR	578	Norway 	Norveška	\N
00040000-561b-9fd8-5ad5-4f6edc80fbbd	OM	OMN	512	Oman 	Oman	\N
00040000-561b-9fd8-bb64-57c3471b1202	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561b-9fd8-7187-2c297eb9c05d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561b-9fd8-fbec-4558f73927e7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561b-9fd8-7bb1-27f37b6fe486	PA	PAN	591	Panama 	Panama	\N
00040000-561b-9fd8-c486-dc6f7d34dee2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561b-9fd8-196f-95fb36934e9d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561b-9fd8-c0ba-5846d45d1d67	PE	PER	604	Peru 	Peru	\N
00040000-561b-9fd8-2037-34b8eeca3769	PH	PHL	608	Philippines 	Filipini	\N
00040000-561b-9fd8-8c1f-ef3a13025ca1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561b-9fd8-eed4-56e35d2da2da	PL	POL	616	Poland 	Poljska	\N
00040000-561b-9fd8-d0fa-c4cebc2db39f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561b-9fd8-2ffb-0ad42bad9166	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561b-9fd8-7062-e05cb9bb5a8a	QA	QAT	634	Qatar 	Katar	\N
00040000-561b-9fd8-0e67-a6bdf90c5039	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561b-9fd8-931e-849cdaeadbed	RO	ROU	642	Romania 	Romunija	\N
00040000-561b-9fd8-5cd3-3ad482d7af99	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561b-9fd8-ebdf-c4b49d45866e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561b-9fd8-c0f9-1a90f90a8a27	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561b-9fd8-5fe2-be68488745e4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561b-9fd8-d4fa-2b3914168d49	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561b-9fd8-9f54-070079fa0300	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561b-9fd8-99ef-520e7e22fcf6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561b-9fd8-f871-e27be508dea1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561b-9fd8-a504-4b1b322f24bf	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561b-9fd8-44d4-b64edd2722ef	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561b-9fd8-f54f-1330dd9f03f6	SM	SMR	674	San Marino 	San Marino	\N
00040000-561b-9fd8-e878-85d039e9395a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561b-9fd8-99c0-5fbe42c2a55c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561b-9fd8-1603-0bfd33b0124e	SN	SEN	686	Senegal 	Senegal	\N
00040000-561b-9fd8-b153-e0ac97771966	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561b-9fd8-a541-5cbebd1c4882	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561b-9fd8-1c7e-856cf9b1be5b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561b-9fd8-9b31-02d05ea60530	SG	SGP	702	Singapore 	Singapur	\N
00040000-561b-9fd8-9284-a17addd8c2c8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561b-9fd8-0d9f-73bea7c43cf2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561b-9fd8-2ce0-660976325461	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561b-9fd8-2e65-b6f18c0ebd14	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561b-9fd8-b659-beddfe928193	SO	SOM	706	Somalia 	Somalija	\N
00040000-561b-9fd8-4506-c1d77918fbd3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561b-9fd8-43c5-98dcbdd6bfeb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561b-9fd8-be4b-6091d1a0476c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561b-9fd8-efd9-1595f8c07de7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561b-9fd8-35e4-935124fa48f7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561b-9fd8-6ea4-151f9ee149b1	SD	SDN	729	Sudan 	Sudan	\N
00040000-561b-9fd8-a2a9-e08c9dfefcb5	SR	SUR	740	Suriname 	Surinam	\N
00040000-561b-9fd8-f2f2-278eb1ee8afe	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561b-9fd8-6d13-c60450ac725b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561b-9fd8-9127-77e385c9af89	SE	SWE	752	Sweden 	Švedska	\N
00040000-561b-9fd8-7b8f-750997401c5d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561b-9fd8-781a-0d76dd908894	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561b-9fd8-9f7d-78c0d46ebfb6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561b-9fd8-1c9f-89d14b8a5097	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561b-9fd8-10b3-bc578a5f7835	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561b-9fd8-9b44-99ba82930e8c	TH	THA	764	Thailand 	Tajska	\N
00040000-561b-9fd8-8442-bc08217b1f3d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561b-9fd8-a775-765054756d67	TG	TGO	768	Togo 	Togo	\N
00040000-561b-9fd8-5292-3af86036882e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561b-9fd8-3da4-727d21770287	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561b-9fd8-e045-ccc4707e69c0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561b-9fd8-11c4-3ef4b0dfeecc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561b-9fd8-63f0-1af3636d6435	TR	TUR	792	Turkey 	Turčija	\N
00040000-561b-9fd8-7fab-76c3fa94ad9d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561b-9fd8-4bea-ed5cc02d9dd6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-9fd8-c89b-1db0fef14f42	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561b-9fd8-9022-04bcaf27c50a	UG	UGA	800	Uganda 	Uganda	\N
00040000-561b-9fd8-b97d-7f17311f59e3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561b-9fd8-afa2-35cc7e2d2304	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561b-9fd8-8633-051ed4feb9b2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561b-9fd8-1164-17042864b9d9	US	USA	840	United States 	Združene države Amerike	\N
00040000-561b-9fd8-6b82-22441a11091a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561b-9fd8-3849-fdc1914e461d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561b-9fd8-e5dd-d277c6a5e1ed	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561b-9fd8-ed3c-e9d04393e800	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561b-9fd8-0fab-b36ece44dc13	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561b-9fd8-72fd-739c664b9f77	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561b-9fd8-ec10-68acb5a8afaf	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-9fd8-9848-20f19e5e1499	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561b-9fd8-5fcf-3a3f5439b42c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561b-9fd8-450b-d74ea60ac2d0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561b-9fd8-0216-dc512705ac36	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561b-9fd8-7958-e78451eb9278	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561b-9fd8-c012-9d82aa089c2f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 21679381)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561b-9fda-c665-b1a7279cd7a6	000e0000-561b-9fda-1c2d-b94b231f7df2	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-9fd8-e443-cceaec56e52d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-9fda-b3c8-9d4a6fff6be3	000e0000-561b-9fda-314e-2fef16353aa5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-9fd8-8553-7ee3e6801895	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-9fdb-fb13-39b7e0de9ca8	000e0000-561b-9fda-b2f6-119248d77326	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-9fd8-e443-cceaec56e52d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-9fdb-3b34-46708af5bc28	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-9fdb-6362-7401475051af	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 21679183)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561b-9fda-df41-d0856bebcd2e	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-d647-11654a7e490b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-9fd8-ac11-2b046248ede5
000d0000-561b-9fda-2f86-11a60060e617	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-873d-bbb2730f6715	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561b-9fd8-fa18-bb6e9ec17179
000d0000-561b-9fda-4135-8960660a868e	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-bb39-009d8c25df34	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561b-9fd8-eb0f-01ee28ba3a2a
000d0000-561b-9fda-4697-f6b98934a728	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-eb42-10cc467b9b77	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561b-9fd8-a660-5a9efcf32519
000d0000-561b-9fda-b6af-bef53fcfae68	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-876e-4033a74ace77	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561b-9fd8-a660-5a9efcf32519
000d0000-561b-9fda-c41a-2163371b01ee	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-2576-c4c636a50971	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-9fd8-ac11-2b046248ede5
000d0000-561b-9fda-81ea-9d68ea8055ac	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-71ef-927602931c3b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561b-9fd8-ac11-2b046248ede5
000d0000-561b-9fda-11fb-cc6f3ddd6dd7	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-bfd4-afe207c7dc01	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561b-9fd8-7b24-9d3db949c2b7
000d0000-561b-9fda-0fd6-1c9f89bf292e	000e0000-561b-9fda-314e-2fef16353aa5	000c0000-561b-9fdb-c8f1-f5d8094b3e44	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561b-9fd8-2cfa-0392eb0d8a9b
\.


--
-- TOC entry 3008 (class 0 OID 21678998)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21678972)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21678949)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561b-9fda-713c-08e7a440848e	00080000-561b-9fda-aa96-f5c3baaca3f8	00090000-561b-9fda-5739-a2e0ced80fd5	AK		igralka
\.


--
-- TOC entry 3017 (class 0 OID 21679097)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21679608)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21679620)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 21679642)
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
-- TOC entry 3021 (class 0 OID 21679122)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21678906)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561b-9fd9-ebef-26d22536fd10	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561b-9fd9-af1d-68d52120b012	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561b-9fd9-b3f4-3f215721321b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561b-9fd9-939c-adf38255b45e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561b-9fd9-376a-42754a393a4a	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561b-9fd9-99ca-8b71cfb13299	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561b-9fd9-024a-817b760147ca	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561b-9fd9-3669-7de07d27067c	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-9fd9-de47-92abe1429d93	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-9fd9-453b-efde23071d97	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561b-9fd9-9920-c4c219846925	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561b-9fd9-dda0-4101ff650975	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561b-9fd9-e0d4-1abc441e0b5c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561b-9fd9-542e-6af2aa7a71da	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561b-9fd9-13dc-23f624b54428	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561b-9fda-5fd3-2cc467816e73	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561b-9fda-7c68-98da55f547cd	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561b-9fda-5933-74bfbc022b7c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561b-9fda-6fee-4327c1ccc666	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561b-9fda-0327-32c4f3dd434e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561b-9fdc-9186-1ad26514e991	application.tenant.maticnopodjetje	string	s:36:"00080000-561b-9fdc-b98b-3142c35ef2fd";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2995 (class 0 OID 21678820)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561b-9fda-d200-9f05cffb796d	00000000-561b-9fda-5fd3-2cc467816e73	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561b-9fda-b3b2-bb832314f1d7	00000000-561b-9fda-5fd3-2cc467816e73	00010000-561b-9fd9-2558-e0ac598cbd23	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561b-9fda-3880-488db9a49a21	00000000-561b-9fda-7c68-98da55f547cd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2996 (class 0 OID 21678831)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561b-9fda-26b4-7e1e140b353b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561b-9fda-3b83-c06e0865a53d	00010000-561b-9fda-e761-2ae63fae9fbf	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561b-9fda-1962-c6f83d104953	00010000-561b-9fda-17b4-9324b06ac4ef	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561b-9fda-7629-e172c83026cf	00010000-561b-9fda-3d52-3bc9f6429fe3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561b-9fda-24ba-f03150d84c66	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561b-9fda-0534-844ed56ed3ef	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561b-9fda-988d-448f4df624ed	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561b-9fda-fb6e-67bbe4491dd4	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561b-9fda-5739-a2e0ced80fd5	00010000-561b-9fda-27a0-d9e775f928ed	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561b-9fda-c9d0-cc868721384a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561b-9fda-991f-9f41590fa55f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-9fda-cf02-5866f3296c66	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561b-9fda-385f-c136c256f8ff	00010000-561b-9fda-6fac-fd15bd59c54a	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-9fda-010a-8f12afb25ada	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-9fda-1f12-6a88de1768f9	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-9fda-7d66-357446243a37	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-9fda-51cd-33cb19270ab6	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561b-9fda-393f-8c00171731b5	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2991 (class 0 OID 21678785)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561b-9fd8-387f-d7afe557417a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561b-9fd8-0ed4-be1525d9e61f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561b-9fd8-8e5e-7a35c38295dd	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561b-9fd8-f064-3f9fa3d24a61	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561b-9fd8-22d6-dd44ee8c8999	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561b-9fd8-15d6-3f1eeac5cec9	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561b-9fd8-1f45-9df12bee5a26	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561b-9fd8-3c3e-f802335805f3	Abonma-read	Abonma - branje	f
00030000-561b-9fd8-da27-f3ac5370d6e7	Abonma-write	Abonma - spreminjanje	f
00030000-561b-9fd8-6a31-b80d364ae194	Alternacija-read	Alternacija - branje	f
00030000-561b-9fd8-f9e6-1f3974e84c36	Alternacija-write	Alternacija - spreminjanje	f
00030000-561b-9fd8-1880-5bdbd7c93101	Arhivalija-read	Arhivalija - branje	f
00030000-561b-9fd8-5c70-cc01329f840b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561b-9fd8-9fa9-7b4cba567a6e	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561b-9fd8-003c-d0d3eedba544	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561b-9fd8-eb81-c836de5d3805	Besedilo-read	Besedilo - branje	f
00030000-561b-9fd8-1057-de9dc0c2fee3	Besedilo-write	Besedilo - spreminjanje	f
00030000-561b-9fd8-a668-98d358e5d1aa	DogodekIzven-read	DogodekIzven - branje	f
00030000-561b-9fd8-4d42-f6931b8b478f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561b-9fd8-4434-69343dd2b77f	Dogodek-read	Dogodek - branje	f
00030000-561b-9fd8-2c4b-4f0a5f02e52e	Dogodek-write	Dogodek - spreminjanje	f
00030000-561b-9fd8-bb16-a10b672ebcdc	DrugiVir-read	DrugiVir - branje	f
00030000-561b-9fd8-607b-a0097fcf5e5d	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561b-9fd8-6abe-32de85ac1052	Drzava-read	Drzava - branje	f
00030000-561b-9fd8-89e6-de677d1b87dc	Drzava-write	Drzava - spreminjanje	f
00030000-561b-9fd8-adc7-287c906919a8	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561b-9fd8-e12c-f8975fbb7c86	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561b-9fd8-2ab5-ea820e2b0a07	Funkcija-read	Funkcija - branje	f
00030000-561b-9fd8-59c3-8c17ddd18110	Funkcija-write	Funkcija - spreminjanje	f
00030000-561b-9fd8-7a71-2bbb4f29df07	Gostovanje-read	Gostovanje - branje	f
00030000-561b-9fd8-321a-a9a09f047094	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561b-9fd8-7819-6a62ae30f676	Gostujoca-read	Gostujoca - branje	f
00030000-561b-9fd8-4c3a-c59572896d10	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561b-9fd8-250c-79cd5e4d7fd7	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561b-9fd8-ad5b-536e609178fe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561b-9fd8-43b1-a56a76457cde	Kupec-read	Kupec - branje	f
00030000-561b-9fd8-e774-48e960f31f0f	Kupec-write	Kupec - spreminjanje	f
00030000-561b-9fd8-e048-17edbbb370b2	NacinPlacina-read	NacinPlacina - branje	f
00030000-561b-9fd8-6f01-5bf272b8255e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561b-9fd8-b50c-636995b132dc	Option-read	Option - branje	f
00030000-561b-9fd8-05aa-38f190c8c04f	Option-write	Option - spreminjanje	f
00030000-561b-9fd8-f618-60252d80c173	OptionValue-read	OptionValue - branje	f
00030000-561b-9fd8-19c6-738f29979741	OptionValue-write	OptionValue - spreminjanje	f
00030000-561b-9fd8-2e3d-fe00d4bb300c	Oseba-read	Oseba - branje	f
00030000-561b-9fd8-461b-304eb99c4e1e	Oseba-write	Oseba - spreminjanje	f
00030000-561b-9fd8-7848-6fdc0162f374	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561b-9fd8-dc31-45c249f73dd9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561b-9fd8-10c4-a811ae396c7b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561b-9fd8-3bcc-ecb39a41be27	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561b-9fd8-59b4-01ce3770ab50	Pogodba-read	Pogodba - branje	f
00030000-561b-9fd8-7f83-a671167af180	Pogodba-write	Pogodba - spreminjanje	f
00030000-561b-9fd8-6cee-a9e8486a024c	Popa-read	Popa - branje	f
00030000-561b-9fd8-4e90-b21e3aa15d20	Popa-write	Popa - spreminjanje	f
00030000-561b-9fd8-b579-0c4eed5cc7cb	Posta-read	Posta - branje	f
00030000-561b-9fd8-67d3-68008046b931	Posta-write	Posta - spreminjanje	f
00030000-561b-9fd8-4ab6-6b210c8263b2	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561b-9fd8-9395-90a1b6a27499	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561b-9fd8-b271-e232ad9b3ab7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561b-9fd8-574d-e2d97413fc84	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561b-9fd8-9652-7807be60a6fa	PostniNaslov-read	PostniNaslov - branje	f
00030000-561b-9fd8-33b9-2696a2151fd6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561b-9fd8-1311-5d7bb1b01a6a	Predstava-read	Predstava - branje	f
00030000-561b-9fd8-c71d-5eabdb475ca3	Predstava-write	Predstava - spreminjanje	f
00030000-561b-9fd8-e012-7e3844deafc0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561b-9fd8-4ef1-52803391d6f5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561b-9fd8-4688-e41eb6b8ec19	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561b-9fd8-ef24-36b021d051d0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561b-9fd8-9bc2-a5d2e7809a7b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561b-9fd8-fac1-025cccf5f237	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561b-9fd8-5f8c-f4d0ebd0ddc4	ProgramDela-read	ProgramDela - branje	f
00030000-561b-9fd8-07f7-f5d04db7dbd2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561b-9fd8-ae23-3e96b11519e0	ProgramFestival-read	ProgramFestival - branje	f
00030000-561b-9fd8-d129-7c5efd5a6da0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561b-9fd8-49e7-1b01693c8bcc	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561b-9fd8-9573-b8177a2e7d3c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561b-9fd8-79de-1f935e18ab8b	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561b-9fd8-1815-8bfc3f27780d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561b-9fd8-23f1-59034960d694	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561b-9fd8-9224-14065beb0cf4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561b-9fd8-675a-b9c433864cc7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561b-9fd8-fd56-c6a779944eb0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561b-9fd8-219b-14b443b90253	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561b-9fd8-3ef1-584661f21349	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561b-9fd8-341d-035fd163ffaf	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561b-9fd8-6fbe-8aea3269c691	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561b-9fd8-a8a3-f8ac4a163083	ProgramRazno-read	ProgramRazno - branje	f
00030000-561b-9fd8-da02-d757a9f5ad50	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561b-9fd8-5b9e-12916fd78513	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561b-9fd8-d40e-cce9df1d0c59	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561b-9fd8-bbe0-b43912703b8c	Prostor-read	Prostor - branje	f
00030000-561b-9fd8-5c48-a690e1ddf9db	Prostor-write	Prostor - spreminjanje	f
00030000-561b-9fd8-bfa7-fedfe5da7b31	Racun-read	Racun - branje	f
00030000-561b-9fd8-028a-e57fe59cfc24	Racun-write	Racun - spreminjanje	f
00030000-561b-9fd8-40bb-e7b7b896c653	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561b-9fd8-9a44-8ba4c2551cea	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561b-9fd8-52df-18a229f9715d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561b-9fd8-1917-4d5aa5e0d65b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561b-9fd8-408f-d978954b6dbb	Rekvizit-read	Rekvizit - branje	f
00030000-561b-9fd8-5b8b-8640f7163213	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561b-9fd8-8277-effee57de940	Revizija-read	Revizija - branje	f
00030000-561b-9fd8-d00d-06f1d4f85447	Revizija-write	Revizija - spreminjanje	f
00030000-561b-9fd8-2df1-817a2c7279f1	Rezervacija-read	Rezervacija - branje	f
00030000-561b-9fd8-77bd-047de10263d8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561b-9fd8-107a-9e4713feec47	SedezniRed-read	SedezniRed - branje	f
00030000-561b-9fd8-b737-a780fd6f9666	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561b-9fd8-cfe0-12c76ee2f575	Sedez-read	Sedez - branje	f
00030000-561b-9fd8-9459-c93b986df76a	Sedez-write	Sedez - spreminjanje	f
00030000-561b-9fd8-2f71-1e122dbb9176	Sezona-read	Sezona - branje	f
00030000-561b-9fd8-cbbe-df039dfa2139	Sezona-write	Sezona - spreminjanje	f
00030000-561b-9fd8-70c3-bd803720bd57	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561b-9fd8-a2ae-2f37f5237d78	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561b-9fd8-fa70-6de9c9becc0b	Stevilcenje-read	Stevilcenje - branje	f
00030000-561b-9fd8-e68d-3d053efaf6aa	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561b-9fd8-b918-23e3e3c13641	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561b-9fd8-843f-5c4a4283a4aa	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561b-9fd8-46d1-19650e6fde0b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561b-9fd8-7605-ef752d222c9e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561b-9fd8-1646-ed69b1eaf9b6	Telefonska-read	Telefonska - branje	f
00030000-561b-9fd8-92d4-dcf573fd37ce	Telefonska-write	Telefonska - spreminjanje	f
00030000-561b-9fd8-e331-a3c21766d7b8	TerminStoritve-read	TerminStoritve - branje	f
00030000-561b-9fd8-0f4c-047bab777ce9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561b-9fd8-eaac-e103f703a805	TipFunkcije-read	TipFunkcije - branje	f
00030000-561b-9fd8-928c-ecba4b55d6fa	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561b-9fd8-25f3-3c49f7e131d1	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561b-9fd8-61c8-37f9da43112b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561b-9fd8-983b-4340ac2887b3	Trr-read	Trr - branje	f
00030000-561b-9fd8-e7ad-92ce33614523	Trr-write	Trr - spreminjanje	f
00030000-561b-9fd8-958b-9e0dc698bbe4	Uprizoritev-read	Uprizoritev - branje	f
00030000-561b-9fd8-b442-d021f8a52de7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561b-9fd8-bf57-225210ec0caa	Vaja-read	Vaja - branje	f
00030000-561b-9fd8-81ac-15a21f4a4155	Vaja-write	Vaja - spreminjanje	f
00030000-561b-9fd8-644d-c2722a8477de	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561b-9fd8-ab2d-fd71cbd19929	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561b-9fd8-62b4-7f8d113dca72	VrstaStroska-read	VrstaStroska - branje	f
00030000-561b-9fd8-1d82-5ec1a4460925	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561b-9fd8-4d6f-6e1cf6c59fd7	Zaposlitev-read	Zaposlitev - branje	f
00030000-561b-9fd8-e2ec-93304a3c2308	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561b-9fd8-e510-d22484f6c229	Zasedenost-read	Zasedenost - branje	f
00030000-561b-9fd8-d046-fa193d9115b9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561b-9fd8-ef36-491c007300c0	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561b-9fd8-18be-d9ddf15d8533	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561b-9fd8-2c37-24a0aecc656b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561b-9fd8-21d1-d286b96772e0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561b-9fd8-6a37-05ea9458dd65	Job-read	Branje opravil - samo zase - branje	f
00030000-561b-9fd8-c1d9-026377f3db72	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561b-9fd8-086b-1f0d9bb14e0c	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561b-9fd8-affe-21f87534c988	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561b-9fd8-12b3-60f1e52aac10	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561b-9fd8-1f98-191b908c4f36	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561b-9fd8-e702-94bd83357a03	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561b-9fd8-3f6d-f05a49c7c25d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-9fd8-e847-8fdad7143c0e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-9fd8-bc2c-f1c035f8e901	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-9fd8-23a0-80d81391ce9d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-9fd8-6b2b-19929f3a7d85	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561b-9fd8-f02f-34b4b3ea6de6	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561b-9fd8-7af2-59f11e7caf9c	Datoteka-write	Datoteka - spreminjanje	f
00030000-561b-9fd8-ba79-165d1a684179	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2993 (class 0 OID 21678804)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561b-9fd8-061f-47348906ce3f	00030000-561b-9fd8-0ed4-be1525d9e61f
00020000-561b-9fd8-a185-a49f85c51413	00030000-561b-9fd8-6abe-32de85ac1052
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-3c3e-f802335805f3
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-da27-f3ac5370d6e7
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-6a31-b80d364ae194
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-f9e6-1f3974e84c36
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-1880-5bdbd7c93101
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-4434-69343dd2b77f
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-f064-3f9fa3d24a61
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-2c4b-4f0a5f02e52e
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-6abe-32de85ac1052
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-89e6-de677d1b87dc
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-2ab5-ea820e2b0a07
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-59c3-8c17ddd18110
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-7a71-2bbb4f29df07
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-321a-a9a09f047094
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-7819-6a62ae30f676
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-4c3a-c59572896d10
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-250c-79cd5e4d7fd7
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-ad5b-536e609178fe
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-b50c-636995b132dc
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-f618-60252d80c173
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-2e3d-fe00d4bb300c
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-461b-304eb99c4e1e
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-6cee-a9e8486a024c
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-4e90-b21e3aa15d20
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-b579-0c4eed5cc7cb
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-67d3-68008046b931
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-9652-7807be60a6fa
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-33b9-2696a2151fd6
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-1311-5d7bb1b01a6a
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-c71d-5eabdb475ca3
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-9bc2-a5d2e7809a7b
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-fac1-025cccf5f237
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-bbe0-b43912703b8c
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-5c48-a690e1ddf9db
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-52df-18a229f9715d
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-1917-4d5aa5e0d65b
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-408f-d978954b6dbb
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-5b8b-8640f7163213
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-2f71-1e122dbb9176
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-cbbe-df039dfa2139
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-eaac-e103f703a805
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-958b-9e0dc698bbe4
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-b442-d021f8a52de7
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-bf57-225210ec0caa
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-81ac-15a21f4a4155
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-e510-d22484f6c229
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-d046-fa193d9115b9
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-ef36-491c007300c0
00020000-561b-9fd9-606e-7cb1f047956f	00030000-561b-9fd8-2c37-24a0aecc656b
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-3c3e-f802335805f3
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-1880-5bdbd7c93101
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-4434-69343dd2b77f
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-6abe-32de85ac1052
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-7a71-2bbb4f29df07
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-7819-6a62ae30f676
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-250c-79cd5e4d7fd7
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-ad5b-536e609178fe
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-b50c-636995b132dc
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-f618-60252d80c173
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-2e3d-fe00d4bb300c
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-461b-304eb99c4e1e
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-6cee-a9e8486a024c
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-b579-0c4eed5cc7cb
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-9652-7807be60a6fa
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-33b9-2696a2151fd6
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-1311-5d7bb1b01a6a
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-bbe0-b43912703b8c
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-52df-18a229f9715d
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-408f-d978954b6dbb
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-2f71-1e122dbb9176
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-1646-ed69b1eaf9b6
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-92d4-dcf573fd37ce
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-983b-4340ac2887b3
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-e7ad-92ce33614523
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-4d6f-6e1cf6c59fd7
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-e2ec-93304a3c2308
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-ef36-491c007300c0
00020000-561b-9fd9-93ca-a842d86d8247	00030000-561b-9fd8-2c37-24a0aecc656b
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-3c3e-f802335805f3
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-6a31-b80d364ae194
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-1880-5bdbd7c93101
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-5c70-cc01329f840b
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-eb81-c836de5d3805
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-a668-98d358e5d1aa
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-4434-69343dd2b77f
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-6abe-32de85ac1052
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-2ab5-ea820e2b0a07
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-7a71-2bbb4f29df07
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-7819-6a62ae30f676
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-250c-79cd5e4d7fd7
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-b50c-636995b132dc
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-f618-60252d80c173
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-2e3d-fe00d4bb300c
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-6cee-a9e8486a024c
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-b579-0c4eed5cc7cb
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-1311-5d7bb1b01a6a
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-9bc2-a5d2e7809a7b
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-bbe0-b43912703b8c
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-52df-18a229f9715d
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-408f-d978954b6dbb
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-2f71-1e122dbb9176
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-eaac-e103f703a805
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-bf57-225210ec0caa
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-e510-d22484f6c229
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-ef36-491c007300c0
00020000-561b-9fd9-8e8f-1a2f34f4b16a	00030000-561b-9fd8-2c37-24a0aecc656b
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-3c3e-f802335805f3
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-da27-f3ac5370d6e7
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-f9e6-1f3974e84c36
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-1880-5bdbd7c93101
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-4434-69343dd2b77f
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-6abe-32de85ac1052
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-7a71-2bbb4f29df07
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-7819-6a62ae30f676
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-b50c-636995b132dc
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-f618-60252d80c173
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-6cee-a9e8486a024c
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-b579-0c4eed5cc7cb
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-1311-5d7bb1b01a6a
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-bbe0-b43912703b8c
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-52df-18a229f9715d
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-408f-d978954b6dbb
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-2f71-1e122dbb9176
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-eaac-e103f703a805
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-ef36-491c007300c0
00020000-561b-9fd9-bbe6-921cea741562	00030000-561b-9fd8-2c37-24a0aecc656b
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-3c3e-f802335805f3
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-1880-5bdbd7c93101
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-4434-69343dd2b77f
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-6abe-32de85ac1052
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-7a71-2bbb4f29df07
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-7819-6a62ae30f676
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-b50c-636995b132dc
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-f618-60252d80c173
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-6cee-a9e8486a024c
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-b579-0c4eed5cc7cb
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-1311-5d7bb1b01a6a
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-bbe0-b43912703b8c
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-52df-18a229f9715d
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-408f-d978954b6dbb
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-2f71-1e122dbb9176
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-e331-a3c21766d7b8
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-8e5e-7a35c38295dd
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-eaac-e103f703a805
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-ef36-491c007300c0
00020000-561b-9fd9-dce5-31b557923f1a	00030000-561b-9fd8-2c37-24a0aecc656b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-387f-d7afe557417a
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-0ed4-be1525d9e61f
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-8e5e-7a35c38295dd
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-f064-3f9fa3d24a61
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-22d6-dd44ee8c8999
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-15d6-3f1eeac5cec9
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1f45-9df12bee5a26
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-3c3e-f802335805f3
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-da27-f3ac5370d6e7
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-6a31-b80d364ae194
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-f9e6-1f3974e84c36
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1880-5bdbd7c93101
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-5c70-cc01329f840b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-eb81-c836de5d3805
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1057-de9dc0c2fee3
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-a668-98d358e5d1aa
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4d42-f6931b8b478f
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4434-69343dd2b77f
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-2c4b-4f0a5f02e52e
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-6abe-32de85ac1052
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-89e6-de677d1b87dc
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-bb16-a10b672ebcdc
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-607b-a0097fcf5e5d
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-adc7-287c906919a8
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e12c-f8975fbb7c86
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-2ab5-ea820e2b0a07
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-59c3-8c17ddd18110
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-7a71-2bbb4f29df07
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-321a-a9a09f047094
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-7819-6a62ae30f676
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4c3a-c59572896d10
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-250c-79cd5e4d7fd7
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-ad5b-536e609178fe
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-43b1-a56a76457cde
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e774-48e960f31f0f
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e048-17edbbb370b2
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-6f01-5bf272b8255e
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-b50c-636995b132dc
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-05aa-38f190c8c04f
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-f618-60252d80c173
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-19c6-738f29979741
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-2e3d-fe00d4bb300c
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-461b-304eb99c4e1e
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-7848-6fdc0162f374
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-dc31-45c249f73dd9
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-10c4-a811ae396c7b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-3bcc-ecb39a41be27
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-59b4-01ce3770ab50
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-7f83-a671167af180
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-6cee-a9e8486a024c
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4e90-b21e3aa15d20
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-b579-0c4eed5cc7cb
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-67d3-68008046b931
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4ab6-6b210c8263b2
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-9395-90a1b6a27499
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-b271-e232ad9b3ab7
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-574d-e2d97413fc84
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-9652-7807be60a6fa
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-33b9-2696a2151fd6
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1311-5d7bb1b01a6a
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-c71d-5eabdb475ca3
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e012-7e3844deafc0
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4ef1-52803391d6f5
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4688-e41eb6b8ec19
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-ef24-36b021d051d0
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-9bc2-a5d2e7809a7b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-fac1-025cccf5f237
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-5f8c-f4d0ebd0ddc4
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-07f7-f5d04db7dbd2
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-ae23-3e96b11519e0
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-d129-7c5efd5a6da0
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-49e7-1b01693c8bcc
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-9573-b8177a2e7d3c
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-79de-1f935e18ab8b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1815-8bfc3f27780d
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-23f1-59034960d694
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-9224-14065beb0cf4
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-675a-b9c433864cc7
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-fd56-c6a779944eb0
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-219b-14b443b90253
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-3ef1-584661f21349
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-341d-035fd163ffaf
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-6fbe-8aea3269c691
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-a8a3-f8ac4a163083
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-da02-d757a9f5ad50
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-5b9e-12916fd78513
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-d40e-cce9df1d0c59
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-bbe0-b43912703b8c
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-5c48-a690e1ddf9db
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-bfa7-fedfe5da7b31
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-028a-e57fe59cfc24
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-40bb-e7b7b896c653
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-9a44-8ba4c2551cea
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-52df-18a229f9715d
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1917-4d5aa5e0d65b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-408f-d978954b6dbb
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-5b8b-8640f7163213
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-8277-effee57de940
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-d00d-06f1d4f85447
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-2df1-817a2c7279f1
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-77bd-047de10263d8
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-107a-9e4713feec47
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-b737-a780fd6f9666
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-cfe0-12c76ee2f575
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-9459-c93b986df76a
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-2f71-1e122dbb9176
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-cbbe-df039dfa2139
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-70c3-bd803720bd57
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-a2ae-2f37f5237d78
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-fa70-6de9c9becc0b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e68d-3d053efaf6aa
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-b918-23e3e3c13641
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-843f-5c4a4283a4aa
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-46d1-19650e6fde0b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-7605-ef752d222c9e
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1646-ed69b1eaf9b6
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-92d4-dcf573fd37ce
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e331-a3c21766d7b8
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-0f4c-047bab777ce9
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-eaac-e103f703a805
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-928c-ecba4b55d6fa
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-25f3-3c49f7e131d1
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-61c8-37f9da43112b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-983b-4340ac2887b3
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e7ad-92ce33614523
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-958b-9e0dc698bbe4
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-b442-d021f8a52de7
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-bf57-225210ec0caa
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-81ac-15a21f4a4155
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-644d-c2722a8477de
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-ab2d-fd71cbd19929
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-62b4-7f8d113dca72
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-1d82-5ec1a4460925
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-4d6f-6e1cf6c59fd7
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e2ec-93304a3c2308
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-e510-d22484f6c229
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-d046-fa193d9115b9
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-ef36-491c007300c0
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-18be-d9ddf15d8533
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-2c37-24a0aecc656b
00020000-561b-9fda-f730-38b5b0c83f82	00030000-561b-9fd8-21d1-d286b96772e0
\.


--
-- TOC entry 3022 (class 0 OID 21679129)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21679163)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21679299)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561b-9fda-f074-95945069ac67	00090000-561b-9fda-26b4-7e1e140b353b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561b-9fda-c24e-7393dc194634	00090000-561b-9fda-0534-844ed56ed3ef	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561b-9fda-8478-42cf555f0e10	00090000-561b-9fda-385f-c136c256f8ff	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561b-9fda-2d30-259030d3a0eb	00090000-561b-9fda-c9d0-cc868721384a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2998 (class 0 OID 21678864)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561b-9fda-aa96-f5c3baaca3f8	00040000-561b-9fd8-2ce0-660976325461	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fda-ac89-f33f77d6a818	00040000-561b-9fd8-2ce0-660976325461	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561b-9fda-da9d-191ae3f54e7e	00040000-561b-9fd8-2ce0-660976325461	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fda-bfd7-a3cfca6eab81	00040000-561b-9fd8-2ce0-660976325461	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fda-2866-30b57099f7b4	00040000-561b-9fd8-2ce0-660976325461	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fda-af01-e94ad067d179	00040000-561b-9fd8-06a8-f87b91006892	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fda-d54b-2e8f51421bd5	00040000-561b-9fd8-b937-8f07a6b84520	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fda-d6c4-cac48a3e1f5e	00040000-561b-9fd8-0102-2622418a9620	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fda-f5c0-3e06693849a2	00040000-561b-9fd8-36c1-0747edca1c54	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-9fdc-b98b-3142c35ef2fd	00040000-561b-9fd8-2ce0-660976325461	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3000 (class 0 OID 21678898)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561b-9fd8-c4d7-1d26011a85a0	8341	Adlešiči
00050000-561b-9fd8-e6b5-5a1de3dd779f	5270	Ajdovščina
00050000-561b-9fd8-8312-37157197b2cd	6280	Ankaran/Ancarano
00050000-561b-9fd8-7f33-bb5d733deff5	9253	Apače
00050000-561b-9fd8-9ccd-52bc63c23aaa	8253	Artiče
00050000-561b-9fd8-b918-3dff99f7c4ef	4275	Begunje na Gorenjskem
00050000-561b-9fd8-43ed-b705461f51f5	1382	Begunje pri Cerknici
00050000-561b-9fd8-5282-d6ff24798b9b	9231	Beltinci
00050000-561b-9fd8-6f30-0d9b737453b4	2234	Benedikt
00050000-561b-9fd8-de26-73b74da9942c	2345	Bistrica ob Dravi
00050000-561b-9fd8-108c-a2a8effa92a7	3256	Bistrica ob Sotli
00050000-561b-9fd8-c54c-718c01bff80e	8259	Bizeljsko
00050000-561b-9fd8-ad09-5db283c624eb	1223	Blagovica
00050000-561b-9fd8-a6c2-d4fb586d5785	8283	Blanca
00050000-561b-9fd8-a699-03bb13d2bd3d	4260	Bled
00050000-561b-9fd8-a9d0-b76f86344dc4	4273	Blejska Dobrava
00050000-561b-9fd8-0638-c401121f4732	9265	Bodonci
00050000-561b-9fd8-15b8-7e7fb77e79fe	9222	Bogojina
00050000-561b-9fd8-7848-5298107fc454	4263	Bohinjska Bela
00050000-561b-9fd8-b7b6-e2aeb75895ec	4264	Bohinjska Bistrica
00050000-561b-9fd8-05b7-509fb1399353	4265	Bohinjsko jezero
00050000-561b-9fd8-e19b-f0de5f50c7f9	1353	Borovnica
00050000-561b-9fd8-6386-694aade95678	8294	Boštanj
00050000-561b-9fd8-7c31-da6d009d5680	5230	Bovec
00050000-561b-9fd8-cc11-8db4c79a3312	5295	Branik
00050000-561b-9fd8-03fd-1257b86e0095	3314	Braslovče
00050000-561b-9fd8-746d-16f624426477	5223	Breginj
00050000-561b-9fd8-060f-f06c8aee41e4	8280	Brestanica
00050000-561b-9fd8-c58c-701a8d074648	2354	Bresternica
00050000-561b-9fd8-b0ec-e4537ca0fd55	4243	Brezje
00050000-561b-9fd8-1aea-0fdb32e18927	1351	Brezovica pri Ljubljani
00050000-561b-9fd8-c605-5a28cda5174c	8250	Brežice
00050000-561b-9fd8-1cb2-529707aceb77	4210	Brnik - Aerodrom
00050000-561b-9fd8-ea95-1f1373ae7004	8321	Brusnice
00050000-561b-9fd8-91a7-b345616f37f9	3255	Buče
00050000-561b-9fd8-349c-d4e3c622ff0d	8276	Bučka 
00050000-561b-9fd8-3226-13574943863d	9261	Cankova
00050000-561b-9fd8-0685-a8200929c522	3000	Celje 
00050000-561b-9fd8-c0f1-dbc926c61543	3001	Celje - poštni predali
00050000-561b-9fd8-804b-3fe5c52238ef	4207	Cerklje na Gorenjskem
00050000-561b-9fd8-845b-c02f99ac415e	8263	Cerklje ob Krki
00050000-561b-9fd8-7e65-45cb82d0c7ef	1380	Cerknica
00050000-561b-9fd8-9b54-ee2a0b0aed4d	5282	Cerkno
00050000-561b-9fd8-fa44-0e407395c8e2	2236	Cerkvenjak
00050000-561b-9fd8-6523-80f30433343f	2215	Ceršak
00050000-561b-9fd8-ebed-345ccd7e5161	2326	Cirkovce
00050000-561b-9fd8-c5da-1ec89cd3d072	2282	Cirkulane
00050000-561b-9fd8-3cbe-862e5a55c6df	5273	Col
00050000-561b-9fd8-441c-18f9397e5e72	8251	Čatež ob Savi
00050000-561b-9fd8-5e02-617ab1b0b256	1413	Čemšenik
00050000-561b-9fd8-8787-9d7c8d8ba8b4	5253	Čepovan
00050000-561b-9fd8-3bba-b0141878632e	9232	Črenšovci
00050000-561b-9fd8-f223-499b58ada365	2393	Črna na Koroškem
00050000-561b-9fd8-79cc-98fb199dd1cd	6275	Črni Kal
00050000-561b-9fd8-7d4a-a3ab59277858	5274	Črni Vrh nad Idrijo
00050000-561b-9fd8-1cff-9fdf52b4b2ac	5262	Črniče
00050000-561b-9fd8-1b3e-05d71f005e86	8340	Črnomelj
00050000-561b-9fd8-37d2-f253bbb734bb	6271	Dekani
00050000-561b-9fd8-97d4-83d1096984a0	5210	Deskle
00050000-561b-9fd8-2e81-709a066d5053	2253	Destrnik
00050000-561b-9fd8-536a-181707fe2377	6215	Divača
00050000-561b-9fd8-b1a9-356c6574588a	1233	Dob
00050000-561b-9fd8-144b-0788f6e147de	3224	Dobje pri Planini
00050000-561b-9fd8-0674-73f5ee4ab07e	8257	Dobova
00050000-561b-9fd8-3aca-5b4f960a0ed1	1423	Dobovec
00050000-561b-9fd8-94e8-ccf83fce2c79	5263	Dobravlje
00050000-561b-9fd8-2a24-b7b1fd32ca3c	3204	Dobrna
00050000-561b-9fd8-8bc4-b07773872378	8211	Dobrnič
00050000-561b-9fd8-e71f-9d6c6a0e2495	1356	Dobrova
00050000-561b-9fd8-548d-2d6688798319	9223	Dobrovnik/Dobronak 
00050000-561b-9fd8-e899-cb157a9dc700	5212	Dobrovo v Brdih
00050000-561b-9fd8-d75d-b1a5a49b7719	1431	Dol pri Hrastniku
00050000-561b-9fd8-e1b0-9de34fc54dd4	1262	Dol pri Ljubljani
00050000-561b-9fd8-9dbf-9539351a64a4	1273	Dole pri Litiji
00050000-561b-9fd8-b42b-cbe53f1f32de	1331	Dolenja vas
00050000-561b-9fd8-6a54-23d471d3a848	8350	Dolenjske Toplice
00050000-561b-9fd8-0b38-94da45000c5c	1230	Domžale
00050000-561b-9fd8-c052-95287c0abe1d	2252	Dornava
00050000-561b-9fd8-b81f-7a9de6461242	5294	Dornberk
00050000-561b-9fd8-1006-18c45fed277a	1319	Draga
00050000-561b-9fd8-1ddd-c9093eafd894	8343	Dragatuš
00050000-561b-9fd8-f192-ec3827ec966a	3222	Dramlje
00050000-561b-9fd8-40a3-1f24c617a484	2370	Dravograd
00050000-561b-9fd8-a0b9-c37ce4cd599e	4203	Duplje
00050000-561b-9fd8-f77f-86d23f12f327	6221	Dutovlje
00050000-561b-9fd8-7e47-f3665cb2a94a	8361	Dvor
00050000-561b-9fd8-297a-48755b6ee496	2343	Fala
00050000-561b-9fd8-31bf-7c7b20bc5539	9208	Fokovci
00050000-561b-9fd8-4903-aeebbb5976fd	2313	Fram
00050000-561b-9fd8-3670-94b7f0281e41	3213	Frankolovo
00050000-561b-9fd8-ab67-5390c33be2bf	1274	Gabrovka
00050000-561b-9fd8-2d4a-ac7b01458584	8254	Globoko
00050000-561b-9fd8-a5fe-a9a1009b6fcb	5275	Godovič
00050000-561b-9fd8-8699-7b4e5dbf1574	4204	Golnik
00050000-561b-9fd8-0110-9b497bd167f3	3303	Gomilsko
00050000-561b-9fd8-a8f8-30497759e580	4224	Gorenja vas
00050000-561b-9fd8-141d-22f1338979f6	3263	Gorica pri Slivnici
00050000-561b-9fd8-5b42-ab7d9bffe83e	2272	Gorišnica
00050000-561b-9fd8-27fe-34a507304805	9250	Gornja Radgona
00050000-561b-9fd8-2fac-e3905b49757a	3342	Gornji Grad
00050000-561b-9fd8-7045-168cf23bef9d	4282	Gozd Martuljek
00050000-561b-9fd8-facb-954e9ff8b00f	6272	Gračišče
00050000-561b-9fd8-e3e7-e221ae00918a	9264	Grad
00050000-561b-9fd8-2f47-7bd071c79b97	8332	Gradac
00050000-561b-9fd8-af97-1db9637328e8	1384	Grahovo
00050000-561b-9fd8-8ba8-efd5f7e0821d	5242	Grahovo ob Bači
00050000-561b-9fd8-15d1-337eb2ea3107	5251	Grgar
00050000-561b-9fd8-7134-52a34d8b7bc7	3302	Griže
00050000-561b-9fd8-84b8-d9d2971e4375	3231	Grobelno
00050000-561b-9fd8-70b9-d04e3c5cd3f2	1290	Grosuplje
00050000-561b-9fd8-aaf1-0d0fab480f42	2288	Hajdina
00050000-561b-9fd8-4ed9-223debdd43d9	8362	Hinje
00050000-561b-9fd8-95c3-ac94e442e93e	2311	Hoče
00050000-561b-9fd8-138f-f8ae210c090b	9205	Hodoš/Hodos
00050000-561b-9fd8-972e-72dc44bf180f	1354	Horjul
00050000-561b-9fd8-8a5b-34eccec446e1	1372	Hotedršica
00050000-561b-9fd8-13c6-7f6f308ff6aa	1430	Hrastnik
00050000-561b-9fd8-999b-58bb8a2d086d	6225	Hruševje
00050000-561b-9fd8-b0f7-8801fda52dbe	4276	Hrušica
00050000-561b-9fd8-f8a2-d6e94000b5af	5280	Idrija
00050000-561b-9fd8-a75c-12fc810bb183	1292	Ig
00050000-561b-9fd8-6c62-ede13ca0adf5	6250	Ilirska Bistrica
00050000-561b-9fd8-ce6b-017d4dcdcd8e	6251	Ilirska Bistrica-Trnovo
00050000-561b-9fd8-ef54-7dfdf2d781b8	1295	Ivančna Gorica
00050000-561b-9fd8-f327-eab948bb1d70	2259	Ivanjkovci
00050000-561b-9fd8-27d7-9306068d3203	1411	Izlake
00050000-561b-9fd8-0124-e704d0ca93a3	6310	Izola/Isola
00050000-561b-9fd8-51e3-18f75e7c8a08	2222	Jakobski Dol
00050000-561b-9fd8-b125-5293044d1278	2221	Jarenina
00050000-561b-9fd8-6014-3b829648cda4	6254	Jelšane
00050000-561b-9fd8-b51a-871af7f8d2cf	4270	Jesenice
00050000-561b-9fd8-22a3-34f57512da84	8261	Jesenice na Dolenjskem
00050000-561b-9fd8-5fce-dbd9721f503e	3273	Jurklošter
00050000-561b-9fd8-6400-2344b3ed9edb	2223	Jurovski Dol
00050000-561b-9fd8-2e39-7bb73aab0c94	2256	Juršinci
00050000-561b-9fd8-4fc6-fe812814a778	5214	Kal nad Kanalom
00050000-561b-9fd8-29b4-556c95689aa7	3233	Kalobje
00050000-561b-9fd8-7ae7-e1e1b8a00d07	4246	Kamna Gorica
00050000-561b-9fd8-9e96-e022035b5f60	2351	Kamnica
00050000-561b-9fd8-89a7-5643f47bceb9	1241	Kamnik
00050000-561b-9fd8-4ce9-d7e3266a85b8	5213	Kanal
00050000-561b-9fd8-bbe3-4eb1795d0d9e	8258	Kapele
00050000-561b-9fd8-840a-8cc33f5a4bf7	2362	Kapla
00050000-561b-9fd8-07b5-db9e9bd6fd52	2325	Kidričevo
00050000-561b-9fd8-838c-f3aad9ab6026	1412	Kisovec
00050000-561b-9fd8-16ee-418246bc3172	6253	Knežak
00050000-561b-9fd8-624d-6b8928322c0e	5222	Kobarid
00050000-561b-9fd8-69eb-28312f70c0dd	9227	Kobilje
00050000-561b-9fd8-6058-c77d84ca0172	1330	Kočevje
00050000-561b-9fd8-5531-61dc9a2f2f96	1338	Kočevska Reka
00050000-561b-9fd8-e642-12d8ba9395db	2276	Kog
00050000-561b-9fd8-d847-58cbfeb4feb6	5211	Kojsko
00050000-561b-9fd8-7931-054bfec3b5b7	6223	Komen
00050000-561b-9fd8-3da2-f2f4e5bab638	1218	Komenda
00050000-561b-9fd8-9101-e1cd0ad83942	6000	Koper/Capodistria 
00050000-561b-9fd8-2ad2-55fda5738e61	6001	Koper/Capodistria - poštni predali
00050000-561b-9fd8-1e47-1d47b146b8b4	8282	Koprivnica
00050000-561b-9fd8-b190-34171c6dcbc6	5296	Kostanjevica na Krasu
00050000-561b-9fd8-5d59-bd19fd775347	8311	Kostanjevica na Krki
00050000-561b-9fd8-0d08-888da68cc2e0	1336	Kostel
00050000-561b-9fd8-4abb-1ae552f6c53a	6256	Košana
00050000-561b-9fd8-cee8-62e10aac007c	2394	Kotlje
00050000-561b-9fd8-b7c1-1a3b860b76ed	6240	Kozina
00050000-561b-9fd8-d5a9-2af20745801a	3260	Kozje
00050000-561b-9fd8-8253-a958554a0d23	4000	Kranj 
00050000-561b-9fd8-8980-140836ba0816	4001	Kranj - poštni predali
00050000-561b-9fd8-2c80-5d55c6bc6e49	4280	Kranjska Gora
00050000-561b-9fd8-8faa-3901cd3eb954	1281	Kresnice
00050000-561b-9fd8-185b-3e05b66ef281	4294	Križe
00050000-561b-9fd8-fb67-37a77a13c311	9206	Križevci
00050000-561b-9fd8-94b5-6f609b0ffe1d	9242	Križevci pri Ljutomeru
00050000-561b-9fd8-3ac8-b72b5aafa1b6	1301	Krka
00050000-561b-9fd8-f956-5b33442999e1	8296	Krmelj
00050000-561b-9fd8-b6d5-14e677ba69de	4245	Kropa
00050000-561b-9fd8-0f6f-24b44b4d4677	8262	Krška vas
00050000-561b-9fd8-4af1-cad32c8ae44c	8270	Krško
00050000-561b-9fd8-7c00-72e7e6f531a1	9263	Kuzma
00050000-561b-9fd8-8bd3-ab6bdfc5e116	2318	Laporje
00050000-561b-9fd8-b35c-8b6e778704af	3270	Laško
00050000-561b-9fd8-afa6-be1fe1faca48	1219	Laze v Tuhinju
00050000-561b-9fd8-91e3-ed44082c2a01	2230	Lenart v Slovenskih goricah
00050000-561b-9fd8-f3cc-7b5c00641ee9	9220	Lendava/Lendva
00050000-561b-9fd8-a841-c8b232a710a5	4248	Lesce
00050000-561b-9fd8-cffb-eb299fb393a9	3261	Lesično
00050000-561b-9fd8-fd91-5572e2896b36	8273	Leskovec pri Krškem
00050000-561b-9fd8-b915-a6952460f4a9	2372	Libeliče
00050000-561b-9fd8-4130-0fee23e81aeb	2341	Limbuš
00050000-561b-9fd8-7b1c-d5ef000e4e42	1270	Litija
00050000-561b-9fd8-b36c-30cd249186f2	3202	Ljubečna
00050000-561b-9fd8-0de9-11e2b4d4710c	1000	Ljubljana 
00050000-561b-9fd8-d220-e7f14e6cda11	1001	Ljubljana - poštni predali
00050000-561b-9fd8-72c9-7cd78ca894af	1231	Ljubljana - Črnuče
00050000-561b-9fd8-f151-a771271b4b48	1261	Ljubljana - Dobrunje
00050000-561b-9fd8-d3fa-d486937aa2cc	1260	Ljubljana - Polje
00050000-561b-9fd8-1fce-f284c2bea3da	1210	Ljubljana - Šentvid
00050000-561b-9fd8-6c63-22b726467831	1211	Ljubljana - Šmartno
00050000-561b-9fd8-52e6-b4c6ecff5ff7	3333	Ljubno ob Savinji
00050000-561b-9fd8-bfe7-59f8ef57fa0c	9240	Ljutomer
00050000-561b-9fd8-2c73-61c9d2b2a4ed	3215	Loče
00050000-561b-9fd8-7440-e9add8c86aa3	5231	Log pod Mangartom
00050000-561b-9fd8-a0dd-84c92bbc0e94	1358	Log pri Brezovici
00050000-561b-9fd8-e1d3-38c2f323af66	1370	Logatec
00050000-561b-9fd8-9b28-8abc10c887b4	1371	Logatec
00050000-561b-9fd8-f94d-7a91af9f1711	1434	Loka pri Zidanem Mostu
00050000-561b-9fd8-fd7a-cf31f1f20400	3223	Loka pri Žusmu
00050000-561b-9fd8-0d3d-d79ebe7a55ab	6219	Lokev
00050000-561b-9fd8-c2fd-6a91c5227d69	1318	Loški Potok
00050000-561b-9fd8-06c5-4599f414c79f	2324	Lovrenc na Dravskem polju
00050000-561b-9fd8-dee1-43da8d9f31d0	2344	Lovrenc na Pohorju
00050000-561b-9fd8-db9d-5c237d5b1154	3334	Luče
00050000-561b-9fd8-ce21-f4b9d3e0040d	1225	Lukovica
00050000-561b-9fd8-4bd5-85ff8895a81d	9202	Mačkovci
00050000-561b-9fd8-4a4f-f97f993ade70	2322	Majšperk
00050000-561b-9fd8-9ac0-127772211c19	2321	Makole
00050000-561b-9fd8-a0e0-80dde10c68c6	9243	Mala Nedelja
00050000-561b-9fd8-8fbf-8e92c0a261ea	2229	Malečnik
00050000-561b-9fd8-2ab3-0959d4b4c80b	6273	Marezige
00050000-561b-9fd8-5dff-431266f1c297	2000	Maribor 
00050000-561b-9fd8-7d3e-856b4aa4e420	2001	Maribor - poštni predali
00050000-561b-9fd8-d023-2a4a592ea878	2206	Marjeta na Dravskem polju
00050000-561b-9fd8-0179-a42a9a40e73f	2281	Markovci
00050000-561b-9fd8-cb94-4185d5afb31d	9221	Martjanci
00050000-561b-9fd8-d28b-52e70ec13cf7	6242	Materija
00050000-561b-9fd8-6b65-20f5f87c1010	4211	Mavčiče
00050000-561b-9fd8-bd42-4b38ea2ed0ce	1215	Medvode
00050000-561b-9fd8-e479-f732ec5a6acf	1234	Mengeš
00050000-561b-9fd8-6e3d-bc2ebeaf7e78	8330	Metlika
00050000-561b-9fd8-20b1-f9123bada266	2392	Mežica
00050000-561b-9fd8-c370-327fc636d125	2204	Miklavž na Dravskem polju
00050000-561b-9fd8-f69a-414534d956e3	2275	Miklavž pri Ormožu
00050000-561b-9fd8-af84-ff782fc00eb9	5291	Miren
00050000-561b-9fd8-6342-1e81ed60a2a4	8233	Mirna
00050000-561b-9fd8-43a7-77a19908a7f8	8216	Mirna Peč
00050000-561b-9fd8-78de-5157d7e42a2c	2382	Mislinja
00050000-561b-9fd8-094c-b95881fbe0f8	4281	Mojstrana
00050000-561b-9fd8-18ab-8881c651fb9e	8230	Mokronog
00050000-561b-9fd8-a916-349000ab19f7	1251	Moravče
00050000-561b-9fd8-d8a1-11888ab2a088	9226	Moravske Toplice
00050000-561b-9fd8-42bd-843ac720c1cc	5216	Most na Soči
00050000-561b-9fd8-b081-277990a5cc9a	1221	Motnik
00050000-561b-9fd8-abf0-e14790e61837	3330	Mozirje
00050000-561b-9fd8-460b-d5d8651cce05	9000	Murska Sobota 
00050000-561b-9fd8-7a09-8a4ec4bd5543	9001	Murska Sobota - poštni predali
00050000-561b-9fd8-164a-09206b68448d	2366	Muta
00050000-561b-9fd8-039d-af0fff76a779	4202	Naklo
00050000-561b-9fd8-3799-4d0b576462e4	3331	Nazarje
00050000-561b-9fd8-873e-d45ea8f6f675	1357	Notranje Gorice
00050000-561b-9fd8-022c-8d587b97312c	3203	Nova Cerkev
00050000-561b-9fd8-59d0-8b54c45946bf	5000	Nova Gorica 
00050000-561b-9fd8-492d-f1d306d38fa1	5001	Nova Gorica - poštni predali
00050000-561b-9fd8-734f-c99d2e93b805	1385	Nova vas
00050000-561b-9fd8-1477-583c9e5584d2	8000	Novo mesto
00050000-561b-9fd8-0a0f-49eee885722a	8001	Novo mesto - poštni predali
00050000-561b-9fd8-1dbf-935d771f0c3e	6243	Obrov
00050000-561b-9fd8-6f4e-47981020c314	9233	Odranci
00050000-561b-9fd8-b1c6-688d3918aa1b	2317	Oplotnica
00050000-561b-9fd8-1049-ce15293da3a7	2312	Orehova vas
00050000-561b-9fd8-bb9a-50187282cdde	2270	Ormož
00050000-561b-9fd8-a204-a662731dc438	1316	Ortnek
00050000-561b-9fd8-0bec-1fb33a3eb21e	1337	Osilnica
00050000-561b-9fd8-f518-65c2628a6570	8222	Otočec
00050000-561b-9fd8-0e78-6fe510b24b58	2361	Ožbalt
00050000-561b-9fd8-cae0-3b077abde43c	2231	Pernica
00050000-561b-9fd8-fbfa-80691255b0b5	2211	Pesnica pri Mariboru
00050000-561b-9fd8-2725-e2aed5f7ec64	9203	Petrovci
00050000-561b-9fd8-b5f1-b2d2f756823f	3301	Petrovče
00050000-561b-9fd8-3542-bdfef59f932f	6330	Piran/Pirano
00050000-561b-9fd8-aa32-7dcc1962bf10	8255	Pišece
00050000-561b-9fd8-94c1-fecff4b4e172	6257	Pivka
00050000-561b-9fd8-b104-59da672b5351	6232	Planina
00050000-561b-9fd8-cb7b-4816a2076235	3225	Planina pri Sevnici
00050000-561b-9fd8-229a-22b1d43e46b1	6276	Pobegi
00050000-561b-9fd8-d375-f9fee2428902	8312	Podbočje
00050000-561b-9fd8-2651-5f207ee961a2	5243	Podbrdo
00050000-561b-9fd8-12c4-3ed54e712798	3254	Podčetrtek
00050000-561b-9fd8-67b5-379c243c3ca2	2273	Podgorci
00050000-561b-9fd8-b560-b96c7c2a98d1	6216	Podgorje
00050000-561b-9fd8-bc8e-a893d36ed238	2381	Podgorje pri Slovenj Gradcu
00050000-561b-9fd8-66dc-838516ebac5f	6244	Podgrad
00050000-561b-9fd8-d6a4-6250914fff6a	1414	Podkum
00050000-561b-9fd8-7dba-69d4394d1443	2286	Podlehnik
00050000-561b-9fd8-80da-4e98e3f115cd	5272	Podnanos
00050000-561b-9fd8-6a30-e9d2fa1483e1	4244	Podnart
00050000-561b-9fd8-6bd0-3c2bb9cd3cfe	3241	Podplat
00050000-561b-9fd8-5a97-a58a71f68b13	3257	Podsreda
00050000-561b-9fd8-dd43-3e0773929b52	2363	Podvelka
00050000-561b-9fd8-2470-76344ec33bd1	2208	Pohorje
00050000-561b-9fd8-b2b1-00caaeb04b80	2257	Polenšak
00050000-561b-9fd8-6487-26ef0162b71d	1355	Polhov Gradec
00050000-561b-9fd8-d3d7-eda9b02c5f6c	4223	Poljane nad Škofjo Loko
00050000-561b-9fd8-89a0-a42c52cbe294	2319	Poljčane
00050000-561b-9fd8-e891-73f7cc46855f	1272	Polšnik
00050000-561b-9fd8-e163-f0b71b5ac46e	3313	Polzela
00050000-561b-9fd8-decb-a4c4ce7d46a0	3232	Ponikva
00050000-561b-9fd8-e7ce-9fc877c179c5	6320	Portorož/Portorose
00050000-561b-9fd8-efe8-44706d8d7039	6230	Postojna
00050000-561b-9fd8-128e-50ee011c73fc	2331	Pragersko
00050000-561b-9fd8-4fa7-23d0e287723b	3312	Prebold
00050000-561b-9fd8-cc86-c39236267fd3	4205	Preddvor
00050000-561b-9fd8-8c61-4554f8e118ef	6255	Prem
00050000-561b-9fd8-daa0-9b03978ba2be	1352	Preserje
00050000-561b-9fd8-c3c8-f5ef6a5a872b	6258	Prestranek
00050000-561b-9fd8-a691-eb8a7a7d4fa3	2391	Prevalje
00050000-561b-9fd8-6be9-1769beeaba6d	3262	Prevorje
00050000-561b-9fd8-4883-75bf5a91c6bb	1276	Primskovo 
00050000-561b-9fd8-d978-5e23741d38f2	3253	Pristava pri Mestinju
00050000-561b-9fd8-a4b3-03d04be1e827	9207	Prosenjakovci/Partosfalva
00050000-561b-9fd8-6808-df8482f459b5	5297	Prvačina
00050000-561b-9fd8-f167-1f7376deeb6b	2250	Ptuj
00050000-561b-9fd8-a09e-9a9c5b8f4442	2323	Ptujska Gora
00050000-561b-9fd8-8795-9d34a2efc3af	9201	Puconci
00050000-561b-9fd8-d62f-144ed2a0fd74	2327	Rače
00050000-561b-9fd8-b07c-148657365f84	1433	Radeče
00050000-561b-9fd8-5abe-66edcde2da6b	9252	Radenci
00050000-561b-9fd8-3da3-7b0cba3a5fde	2360	Radlje ob Dravi
00050000-561b-9fd8-6d04-972fe2d5c34b	1235	Radomlje
00050000-561b-9fd8-d239-badeb3e4c49b	4240	Radovljica
00050000-561b-9fd8-e950-661091886f43	8274	Raka
00050000-561b-9fd8-4798-bff96896ec4f	1381	Rakek
00050000-561b-9fd8-2c44-b2cb2021a2ca	4283	Rateče - Planica
00050000-561b-9fd8-5fa3-e4d545afc760	2390	Ravne na Koroškem
00050000-561b-9fd8-4f6c-62f9c238074a	9246	Razkrižje
00050000-561b-9fd8-fbae-725eb7e31425	3332	Rečica ob Savinji
00050000-561b-9fd8-74c6-1b73d5ac6455	5292	Renče
00050000-561b-9fd8-6f15-dfedac43a79e	1310	Ribnica
00050000-561b-9fd8-6a5b-38b019d142ca	2364	Ribnica na Pohorju
00050000-561b-9fd8-c4ca-398e744f8583	3272	Rimske Toplice
00050000-561b-9fd8-e898-6345958e0754	1314	Rob
00050000-561b-9fd8-cf70-63be840e8807	5215	Ročinj
00050000-561b-9fd8-2e89-3aa4ae64b7ce	3250	Rogaška Slatina
00050000-561b-9fd8-67f6-43be2434e896	9262	Rogašovci
00050000-561b-9fd8-9b17-49e297edd0a2	3252	Rogatec
00050000-561b-9fd8-242a-da561610a812	1373	Rovte
00050000-561b-9fd8-3476-a12b4cb5a88a	2342	Ruše
00050000-561b-9fd8-b7a2-0b01f79924e4	1282	Sava
00050000-561b-9fd8-3a95-21b138bfe628	6333	Sečovlje/Sicciole
00050000-561b-9fd8-4a4f-1daddba3e19f	4227	Selca
00050000-561b-9fd8-d61f-9f85cafa0561	2352	Selnica ob Dravi
00050000-561b-9fd8-8060-545b621c4d78	8333	Semič
00050000-561b-9fd8-df18-1015d063fe32	8281	Senovo
00050000-561b-9fd8-60d2-e4addbd03da0	6224	Senožeče
00050000-561b-9fd8-6203-15985901ec0c	8290	Sevnica
00050000-561b-9fd8-61a4-c4e4bb6fc957	6210	Sežana
00050000-561b-9fd8-a4d3-906d3849770d	2214	Sladki Vrh
00050000-561b-9fd8-7eee-8d054ae217f0	5283	Slap ob Idrijci
00050000-561b-9fd8-a5cb-24ba48f1a8e7	2380	Slovenj Gradec
00050000-561b-9fd8-afdf-e87742d8c17d	2310	Slovenska Bistrica
00050000-561b-9fd8-17c0-83e5db18cbb7	3210	Slovenske Konjice
00050000-561b-9fd8-0e60-96131c8bb585	1216	Smlednik
00050000-561b-9fd8-8824-b32033e63491	5232	Soča
00050000-561b-9fd8-4093-c6c8182de01d	1317	Sodražica
00050000-561b-9fd8-e260-882b35b2aae1	3335	Solčava
00050000-561b-9fd8-391c-958d780a263b	5250	Solkan
00050000-561b-9fd8-82a2-f50a22e8fbca	4229	Sorica
00050000-561b-9fd8-fc31-2d6859c7d232	4225	Sovodenj
00050000-561b-9fd8-eeb7-bd4f64ed7824	5281	Spodnja Idrija
00050000-561b-9fd8-145e-507419a351ef	2241	Spodnji Duplek
00050000-561b-9fd8-5170-8d17afe43b20	9245	Spodnji Ivanjci
00050000-561b-9fd8-9e7d-3fefef521691	2277	Središče ob Dravi
00050000-561b-9fd8-0fb6-d408733c9f88	4267	Srednja vas v Bohinju
00050000-561b-9fd8-175d-a63ec122e23e	8256	Sromlje 
00050000-561b-9fd8-2aea-a110840e7973	5224	Srpenica
00050000-561b-9fd8-e535-493b3e984400	1242	Stahovica
00050000-561b-9fd8-d17f-ffbcbfcdaefc	1332	Stara Cerkev
00050000-561b-9fd8-a48e-e48e036f74a2	8342	Stari trg ob Kolpi
00050000-561b-9fd8-edb0-c6354f5b374d	1386	Stari trg pri Ložu
00050000-561b-9fd8-a803-992dbebecf20	2205	Starše
00050000-561b-9fd8-eec2-8ee4bd4bf257	2289	Stoperce
00050000-561b-9fd8-5a7e-7c4d3f6dbbdb	8322	Stopiče
00050000-561b-9fd8-9b25-49430d580990	3206	Stranice
00050000-561b-9fd8-8245-b22ab9e1f421	8351	Straža
00050000-561b-9fd8-3b5f-b8962fdc156e	1313	Struge
00050000-561b-9fd8-861b-71c8dc354178	8293	Studenec
00050000-561b-9fd8-d8cd-d17d14ffaa7d	8331	Suhor
00050000-561b-9fd8-8ee3-c5bf29b96300	2233	Sv. Ana v Slovenskih goricah
00050000-561b-9fd8-22e8-e82be7a34434	2235	Sv. Trojica v Slovenskih goricah
00050000-561b-9fd8-9143-cf2288f21540	2353	Sveti Duh na Ostrem Vrhu
00050000-561b-9fd8-85ef-13050847bfa8	9244	Sveti Jurij ob Ščavnici
00050000-561b-9fd8-29f9-661d9e4df4c1	3264	Sveti Štefan
00050000-561b-9fd8-4749-d021671bd1ee	2258	Sveti Tomaž
00050000-561b-9fd8-af35-06b189d27d1f	9204	Šalovci
00050000-561b-9fd8-85df-d8b7b5754410	5261	Šempas
00050000-561b-9fd8-fa50-27b36621b941	5290	Šempeter pri Gorici
00050000-561b-9fd8-805e-ad9fc0b7b3a8	3311	Šempeter v Savinjski dolini
00050000-561b-9fd8-43c3-c7d4d234a6b9	4208	Šenčur
00050000-561b-9fd8-53ed-99999469d93a	2212	Šentilj v Slovenskih goricah
00050000-561b-9fd8-a6b8-dfb8ff78cad9	8297	Šentjanž
00050000-561b-9fd8-ab9e-394a2c7f33e8	2373	Šentjanž pri Dravogradu
00050000-561b-9fd8-2dda-90b47512b516	8310	Šentjernej
00050000-561b-9fd8-5625-e1e787b6072c	3230	Šentjur
00050000-561b-9fd8-206b-1f336f8af761	3271	Šentrupert
00050000-561b-9fd8-e2a8-df7b3293d28c	8232	Šentrupert
00050000-561b-9fd8-d4fc-0084eb6fbb9a	1296	Šentvid pri Stični
00050000-561b-9fd8-9a2a-0795e000ca72	8275	Škocjan
00050000-561b-9fd8-cd4c-01bd1a3e5d1c	6281	Škofije
00050000-561b-9fd8-12cf-7c956e2f06a1	4220	Škofja Loka
00050000-561b-9fd8-4674-7474c5f27891	3211	Škofja vas
00050000-561b-9fd8-12b2-05b339eb9087	1291	Škofljica
00050000-561b-9fd8-0b25-8d2452c7610f	6274	Šmarje
00050000-561b-9fd8-320a-d3e6bc45f223	1293	Šmarje - Sap
00050000-561b-9fd8-81cf-c057f8fe1a52	3240	Šmarje pri Jelšah
00050000-561b-9fd8-67b4-25bfdf01532f	8220	Šmarješke Toplice
00050000-561b-9fd8-9e9e-783990e50872	2315	Šmartno na Pohorju
00050000-561b-9fd8-b5ce-0337889b1f0c	3341	Šmartno ob Dreti
00050000-561b-9fd8-3440-3bf5b3a84b3f	3327	Šmartno ob Paki
00050000-561b-9fd8-b6b8-0258c97525ba	1275	Šmartno pri Litiji
00050000-561b-9fd8-a86e-1ec5a781db88	2383	Šmartno pri Slovenj Gradcu
00050000-561b-9fd8-7a27-5010918d49f8	3201	Šmartno v Rožni dolini
00050000-561b-9fd8-d0b8-608c94b065e1	3325	Šoštanj
00050000-561b-9fd8-2cee-193d1294005f	6222	Štanjel
00050000-561b-9fd8-b7bb-f4dea4aa4adf	3220	Štore
00050000-561b-9fd8-702d-d99d585c8496	3304	Tabor
00050000-561b-9fd8-1861-fea30f5637fa	3221	Teharje
00050000-561b-9fd8-692d-146e4fb5600e	9251	Tišina
00050000-561b-9fd8-b841-ff0a12bbdd2e	5220	Tolmin
00050000-561b-9fd8-4275-4dddc50edd84	3326	Topolšica
00050000-561b-9fd8-a962-b4ef4e8a82d6	2371	Trbonje
00050000-561b-9fd8-6cf9-fdc15a8e0bfb	1420	Trbovlje
00050000-561b-9fd8-1a6c-3bf05de1ae4a	8231	Trebelno 
00050000-561b-9fd8-fe22-5da392bf02b3	8210	Trebnje
00050000-561b-9fd8-8d29-0e6510c8d25b	5252	Trnovo pri Gorici
00050000-561b-9fd8-fd9e-b8fcd3f5a5e8	2254	Trnovska vas
00050000-561b-9fd8-6e58-4a4eaf2383f1	1222	Trojane
00050000-561b-9fd8-7142-ce7bf53df11f	1236	Trzin
00050000-561b-9fd8-b77a-2c0d00021510	4290	Tržič
00050000-561b-9fd8-afe8-f0e6e0f70c89	8295	Tržišče
00050000-561b-9fd8-a8eb-5f88a44655b2	1311	Turjak
00050000-561b-9fd8-dda0-2779e8cfee90	9224	Turnišče
00050000-561b-9fd8-de82-f5dd6a217ebd	8323	Uršna sela
00050000-561b-9fd8-72f1-8cdc13cfab71	1252	Vače
00050000-561b-9fd8-e987-7bfbc451311f	3320	Velenje 
00050000-561b-9fd8-7505-f209a5aba0c3	3322	Velenje - poštni predali
00050000-561b-9fd8-bfd1-508b497c20b5	8212	Velika Loka
00050000-561b-9fd8-bd6b-07f9d6b25dc8	2274	Velika Nedelja
00050000-561b-9fd8-c9d1-de99cdb68a56	9225	Velika Polana
00050000-561b-9fd8-32e2-308750a4ae36	1315	Velike Lašče
00050000-561b-9fd8-70cd-8e1cdb68bf34	8213	Veliki Gaber
00050000-561b-9fd8-0816-1b9d6c73fa9a	9241	Veržej
00050000-561b-9fd8-f9ca-1d85e50ce5a3	1312	Videm - Dobrepolje
00050000-561b-9fd8-4a7a-fc157d6b1e44	2284	Videm pri Ptuju
00050000-561b-9fd8-99bf-548f14f77883	8344	Vinica
00050000-561b-9fd8-336e-4de83b05a697	5271	Vipava
00050000-561b-9fd8-1190-fba4d95a0d76	4212	Visoko
00050000-561b-9fd8-752d-f1ab6904b370	1294	Višnja Gora
00050000-561b-9fd8-966a-240adc03ee99	3205	Vitanje
00050000-561b-9fd8-cc4b-9bb19c230575	2255	Vitomarci
00050000-561b-9fd8-8725-8a565b8f6843	1217	Vodice
00050000-561b-9fd8-531c-45e6d8c80b4e	3212	Vojnik\t
00050000-561b-9fd8-f275-614a769be3a1	5293	Volčja Draga
00050000-561b-9fd8-237f-17cfeb27ec3a	2232	Voličina
00050000-561b-9fd8-4e48-c8a500f85432	3305	Vransko
00050000-561b-9fd8-92f5-25222a5b6c48	6217	Vremski Britof
00050000-561b-9fd8-185d-3a1bfc41f39e	1360	Vrhnika
00050000-561b-9fd8-529e-026f6e6a02a7	2365	Vuhred
00050000-561b-9fd8-c8ab-9131754d4d0b	2367	Vuzenica
00050000-561b-9fd8-5333-4bd11b1ce92b	8292	Zabukovje 
00050000-561b-9fd8-8cef-b2fade07b9d0	1410	Zagorje ob Savi
00050000-561b-9fd8-3e09-ab8b7f5a7e5f	1303	Zagradec
00050000-561b-9fd8-9dd9-bb3131753dfc	2283	Zavrč
00050000-561b-9fd8-3656-f6122c87f0ee	8272	Zdole 
00050000-561b-9fd8-947e-4ecf5243fdae	4201	Zgornja Besnica
00050000-561b-9fd8-de3d-9a6ff0a9d734	2242	Zgornja Korena
00050000-561b-9fd8-3249-43cb2ea6ef7a	2201	Zgornja Kungota
00050000-561b-9fd8-011b-f5ecaa5936cb	2316	Zgornja Ložnica
00050000-561b-9fd8-f899-d0eafcaf2a93	2314	Zgornja Polskava
00050000-561b-9fd8-b919-ed1af62288ed	2213	Zgornja Velka
00050000-561b-9fd8-31d9-cc18e0781621	4247	Zgornje Gorje
00050000-561b-9fd8-da81-bfe6338e14dc	4206	Zgornje Jezersko
00050000-561b-9fd8-34ab-6bf72904242a	2285	Zgornji Leskovec
00050000-561b-9fd8-94c6-859c8a6e9c73	1432	Zidani Most
00050000-561b-9fd8-19f9-7e93619c7583	3214	Zreče
00050000-561b-9fd8-71e4-e25a7c1b01f2	4209	Žabnica
00050000-561b-9fd8-ad57-acebe3465a2b	3310	Žalec
00050000-561b-9fd8-ea0f-f4b9be72167a	4228	Železniki
00050000-561b-9fd8-a7e8-1b3b277a2bf8	2287	Žetale
00050000-561b-9fd8-c4e4-adbd590f3860	4226	Žiri
00050000-561b-9fd8-22c9-0f57267ad911	4274	Žirovnica
00050000-561b-9fd8-3a5f-4bd7af43ded3	8360	Žužemberk
\.


--
-- TOC entry 3045 (class 0 OID 21679498)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21679103)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21678883)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561b-9fda-4369-8c47aa998027	00080000-561b-9fda-aa96-f5c3baaca3f8	\N	00040000-561b-9fd8-2ce0-660976325461	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561b-9fda-bfad-22e34581432a	00080000-561b-9fda-aa96-f5c3baaca3f8	\N	00040000-561b-9fd8-2ce0-660976325461	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561b-9fda-a89d-5a9cdfaf1709	00080000-561b-9fda-ac89-f33f77d6a818	\N	00040000-561b-9fd8-2ce0-660976325461	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3007 (class 0 OID 21678987)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21679115)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21679512)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 21679522)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561b-9fda-0fef-93f20555e85a	00080000-561b-9fda-da9d-191ae3f54e7e	0987	AK
00190000-561b-9fda-155e-477751212612	00080000-561b-9fda-ac89-f33f77d6a818	0989	AK
00190000-561b-9fda-c2d8-096552e3f1a3	00080000-561b-9fda-bfd7-a3cfca6eab81	0986	AK
00190000-561b-9fda-5378-8526102be4a2	00080000-561b-9fda-af01-e94ad067d179	0984	AK
00190000-561b-9fda-ab43-c7aa66945de8	00080000-561b-9fda-d54b-2e8f51421bd5	0983	AK
00190000-561b-9fda-d9fd-9d34e9722285	00080000-561b-9fda-d6c4-cac48a3e1f5e	0982	AK
00190000-561b-9fdc-d075-809c9ddeccca	00080000-561b-9fdc-b98b-3142c35ef2fd	1001	AK
\.


--
-- TOC entry 3044 (class 0 OID 21679445)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561b-9fdb-91fb-976426856645	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3048 (class 0 OID 21679530)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21679144)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561b-9fda-3d48-83f661859237	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561b-9fda-6281-0c84eb963d97	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561b-9fda-0f4a-ca1bec5a61f6	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561b-9fda-6f88-67025b3f9522	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561b-9fda-508d-af11d0c28954	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561b-9fda-7608-e85cfc28ed79	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561b-9fda-50c6-16dde2c0705c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3016 (class 0 OID 21679088)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21679078)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21679288)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21679218)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21678961)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21678756)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561b-9fdc-b98b-3142c35ef2fd	00010000-561b-9fd9-74ce-6c621df779eb	2015-10-12 13:56:12	INS	a:0:{}
2	App\\Entity\\Option	00000000-561b-9fdc-9186-1ad26514e991	00010000-561b-9fd9-74ce-6c621df779eb	2015-10-12 13:56:12	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561b-9fdc-d075-809c9ddeccca	00010000-561b-9fd9-74ce-6c621df779eb	2015-10-12 13:56:12	INS	a:0:{}
\.


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3025 (class 0 OID 21679157)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21678794)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561b-9fd8-061f-47348906ce3f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561b-9fd8-a185-a49f85c51413	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561b-9fd8-dce1-792f34d659cb	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561b-9fd8-8a7b-101e5fb40986	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561b-9fd9-606e-7cb1f047956f	planer	Planer dogodkov v koledarju	t
00020000-561b-9fd9-93ca-a842d86d8247	kadrovska	Kadrovska služba	t
00020000-561b-9fd9-8e8f-1a2f34f4b16a	arhivar	Ažuriranje arhivalij	t
00020000-561b-9fd9-bbe6-921cea741562	igralec	Igralec	t
00020000-561b-9fd9-dce5-31b557923f1a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561b-9fda-f730-38b5b0c83f82	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2990 (class 0 OID 21678778)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561b-9fd9-2558-e0ac598cbd23	00020000-561b-9fd8-dce1-792f34d659cb
00010000-561b-9fd9-74ce-6c621df779eb	00020000-561b-9fd8-dce1-792f34d659cb
00010000-561b-9fda-0848-c6d5e3e484e1	00020000-561b-9fda-f730-38b5b0c83f82
\.


--
-- TOC entry 3027 (class 0 OID 21679171)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21679109)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21679055)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21678743)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561b-9fd8-0be9-39a477c770cf	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561b-9fd8-b572-ce00da4d67f9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561b-9fd8-b88d-2287c59a0535	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561b-9fd8-c62c-d58512e30402	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561b-9fd8-73f9-531f12354965	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2985 (class 0 OID 21678735)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561b-9fd8-ad26-f5b8097f9939	00230000-561b-9fd8-c62c-d58512e30402	popa
00240000-561b-9fd8-8fa3-8baacb0617a0	00230000-561b-9fd8-c62c-d58512e30402	oseba
00240000-561b-9fd8-423d-0228fce16245	00230000-561b-9fd8-c62c-d58512e30402	sezona
00240000-561b-9fd8-32c0-9411a62fe5cf	00230000-561b-9fd8-b572-ce00da4d67f9	prostor
00240000-561b-9fd8-c03b-e92d80080b37	00230000-561b-9fd8-c62c-d58512e30402	besedilo
00240000-561b-9fd8-60b7-d13f5fdedfa4	00230000-561b-9fd8-c62c-d58512e30402	uprizoritev
00240000-561b-9fd8-c05d-4db993bead05	00230000-561b-9fd8-c62c-d58512e30402	funkcija
00240000-561b-9fd8-5917-43f6beb2f55c	00230000-561b-9fd8-c62c-d58512e30402	tipfunkcije
00240000-561b-9fd8-7006-fbd7ca5a58b6	00230000-561b-9fd8-c62c-d58512e30402	alternacija
00240000-561b-9fd8-c4a7-432bb4175877	00230000-561b-9fd8-0be9-39a477c770cf	pogodba
00240000-561b-9fd8-8137-e688324168a3	00230000-561b-9fd8-c62c-d58512e30402	zaposlitev
00240000-561b-9fd8-36f0-2ca6138592f7	00230000-561b-9fd8-c62c-d58512e30402	zvrstuprizoritve
00240000-561b-9fd8-13e7-c5f20f4225f4	00230000-561b-9fd8-0be9-39a477c770cf	programdela
00240000-561b-9fd8-8b23-f1585a4a1b28	00230000-561b-9fd8-c62c-d58512e30402	zapis
\.


--
-- TOC entry 2984 (class 0 OID 21678730)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
02df7cae-8354-4070-8a43-5c9738f8b9fc	00240000-561b-9fd8-ad26-f5b8097f9939	0	1001
\.


--
-- TOC entry 3033 (class 0 OID 21679235)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561b-9fdb-cc48-524899f96829	000e0000-561b-9fda-314e-2fef16353aa5	00080000-561b-9fda-aa96-f5c3baaca3f8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561b-9fd8-a3ab-25c602433848
00270000-561b-9fdb-90b8-57594a5fb3fa	000e0000-561b-9fda-314e-2fef16353aa5	00080000-561b-9fda-aa96-f5c3baaca3f8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561b-9fd8-a3ab-25c602433848
\.


--
-- TOC entry 2997 (class 0 OID 21678856)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21679065)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561b-9fdb-f8a4-fe49a300e774	00180000-561b-9fdb-2553-4784798ef26c	000c0000-561b-9fdb-d647-11654a7e490b	00090000-561b-9fda-5739-a2e0ced80fd5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-9fdb-8326-8433a6eab062	00180000-561b-9fdb-2553-4784798ef26c	000c0000-561b-9fdb-873d-bbb2730f6715	00090000-561b-9fda-c9d0-cc868721384a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-9fdb-b08a-3c1dfbd95e58	00180000-561b-9fdb-2553-4784798ef26c	000c0000-561b-9fdb-bb39-009d8c25df34	00090000-561b-9fda-1962-c6f83d104953	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-9fdb-dd69-e56d16462c5c	00180000-561b-9fdb-2553-4784798ef26c	000c0000-561b-9fdb-eb42-10cc467b9b77	00090000-561b-9fda-3b83-c06e0865a53d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-9fdb-653a-0a506d30b8e7	00180000-561b-9fdb-2553-4784798ef26c	000c0000-561b-9fdb-876e-4033a74ace77	00090000-561b-9fda-cf02-5866f3296c66	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-9fdb-b2a7-8959dc34e3f0	00180000-561b-9fdb-4afa-7d6cc1c053b3	\N	00090000-561b-9fda-cf02-5866f3296c66	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 21679276)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561b-9fd8-2cfa-0392eb0d8a9b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561b-9fd8-9bc6-73a3884fb269	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561b-9fd8-680a-55150ba78f4b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561b-9fd8-fa18-bb6e9ec17179	04	Režija	Režija	Režija	umetnik	30
000f0000-561b-9fd8-8819-5b2f0a312a16	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561b-9fd8-c8a3-a17d86a839d0	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561b-9fd8-2004-3f5849809e27	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561b-9fd8-1ac6-e5af16920396	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561b-9fd8-5b30-b888e08cf482	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561b-9fd8-65dc-bc0a6355cd2b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561b-9fd8-7b24-9d3db949c2b7	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561b-9fd8-cf6f-b1e51f8c1dcb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561b-9fd8-cc48-13d929a0861b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561b-9fd8-511e-a81f595864d5	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561b-9fd8-ac11-2b046248ede5	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561b-9fd8-9a73-18cd53f4d6ab	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561b-9fd8-a660-5a9efcf32519	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561b-9fd8-eb0f-01ee28ba3a2a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3049 (class 0 OID 21679541)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561b-9fd8-6dfd-6311983548d5	01	Velika predstava	f	1.00	1.00
002b0000-561b-9fd8-060e-a3d71277c4c2	02	Mala predstava	f	0.50	0.50
002b0000-561b-9fd8-55f8-4dd54f7bc02d	03	Mala koprodukcija	t	0.40	1.00
002b0000-561b-9fd8-e443-cceaec56e52d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561b-9fd8-8553-7ee3e6801895	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3002 (class 0 OID 21678918)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21678765)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561b-9fd9-74ce-6c621df779eb	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROI1Grpg.gpjprTt0cgpwroHvjZiKB1nO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561b-9fda-17b4-9324b06ac4ef	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561b-9fda-e761-2ae63fae9fbf	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561b-9fda-27a0-d9e775f928ed	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561b-9fda-6fac-fd15bd59c54a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561b-9fda-3d52-3bc9f6429fe3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561b-9fda-e102-0a41748f6c61	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561b-9fda-e964-65c22379aca6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561b-9fda-1522-87c4d87d33f1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561b-9fda-9cf9-96c23a1ade0d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561b-9fda-0848-c6d5e3e484e1	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561b-9fd9-2558-e0ac598cbd23	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21679326)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561b-9fda-1c2d-b94b231f7df2	00160000-561b-9fda-4ea0-bcabbaab7c05	\N	00140000-561b-9fd8-55e6-fd7e9693d96b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561b-9fda-508d-af11d0c28954
000e0000-561b-9fda-314e-2fef16353aa5	00160000-561b-9fda-ca78-1f83dd8470a0	\N	00140000-561b-9fd8-6394-09a37146c596	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561b-9fda-7608-e85cfc28ed79
000e0000-561b-9fda-b2f6-119248d77326	\N	\N	00140000-561b-9fd8-6394-09a37146c596	00190000-561b-9fda-0fef-93f20555e85a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-9fda-508d-af11d0c28954
000e0000-561b-9fda-0bd6-464e80e74ca9	\N	\N	00140000-561b-9fd8-6394-09a37146c596	00190000-561b-9fda-0fef-93f20555e85a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-9fda-508d-af11d0c28954
000e0000-561b-9fda-5412-847710fa51f1	\N	\N	00140000-561b-9fd8-6394-09a37146c596	00190000-561b-9fda-0fef-93f20555e85a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-9fda-3d48-83f661859237
000e0000-561b-9fda-4e6f-01dbff50dc9c	\N	\N	00140000-561b-9fd8-6394-09a37146c596	00190000-561b-9fda-0fef-93f20555e85a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-9fda-3d48-83f661859237
\.


--
-- TOC entry 3009 (class 0 OID 21679009)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561b-9fda-a8a1-57daca6c6f97	000e0000-561b-9fda-314e-2fef16353aa5	\N	1	
00200000-561b-9fda-a873-0070607f660c	000e0000-561b-9fda-314e-2fef16353aa5	\N	2	
00200000-561b-9fda-e1e1-5ecce50116a0	000e0000-561b-9fda-314e-2fef16353aa5	\N	3	
00200000-561b-9fda-0e17-f6207adf0707	000e0000-561b-9fda-314e-2fef16353aa5	\N	4	
00200000-561b-9fda-a40f-1a5971aee4f8	000e0000-561b-9fda-314e-2fef16353aa5	\N	5	
\.


--
-- TOC entry 3023 (class 0 OID 21679136)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21679249)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561b-9fd8-8589-3df398d21f16	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561b-9fd8-1821-ead44ee3762c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561b-9fd8-588e-fb458696360e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561b-9fd8-6505-e8c1b074f193	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561b-9fd8-63eb-f98eb76f8616	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561b-9fd8-8f8f-ca2da2623ad2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561b-9fd8-8bee-295744d8e5e4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561b-9fd8-84cf-8e1dfea1b82f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561b-9fd8-a3ab-25c602433848	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561b-9fd8-1635-bdd177e99be1	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561b-9fd8-e8f0-164f3286b00a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561b-9fd8-f082-e5437ae8398d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561b-9fd8-97ec-56c319967d09	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561b-9fd8-77a8-eabb70cf1b7b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561b-9fd8-5100-7db7b55e1457	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561b-9fd8-a07d-14c727e56fb2	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561b-9fd8-3f1d-f2bd15952ea1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561b-9fd8-4e12-d454d495103a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561b-9fd8-355f-680540a9b5f3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561b-9fd8-1876-f71acf26f7c3	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561b-9fd8-7509-6a848db7cf37	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561b-9fd8-a8b6-89ee700957eb	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561b-9fd8-e8eb-0952e3f85f34	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561b-9fd8-032a-03ac68b7b768	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561b-9fd8-46a3-281bd693eca3	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561b-9fd8-7e8a-fabd72734c58	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561b-9fd8-400c-485c93d0c23a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561b-9fd8-23f3-ec4ccc0697d9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3052 (class 0 OID 21679588)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21679560)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21679600)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21679208)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561b-9fda-b7cb-08406c59d172	00090000-561b-9fda-c9d0-cc868721384a	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-9fda-bba8-7da80c030911	00090000-561b-9fda-1962-c6f83d104953	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-9fda-c785-73e6f546c0c0	00090000-561b-9fda-fb6e-67bbe4491dd4	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-9fda-61ae-47dbc5ceed17	00090000-561b-9fda-7629-e172c83026cf	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-9fda-7876-84744e487ed3	00090000-561b-9fda-5739-a2e0ced80fd5	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-9fda-dde2-48bdff752155	00090000-561b-9fda-988d-448f4df624ed	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3011 (class 0 OID 21679044)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21679316)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561b-9fd8-55e6-fd7e9693d96b	01	Drama	drama (SURS 01)
00140000-561b-9fd8-17b9-8385196a7f49	02	Opera	opera (SURS 02)
00140000-561b-9fd8-aae4-54e457502641	03	Balet	balet (SURS 03)
00140000-561b-9fd8-d0ff-fedb4493d30f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561b-9fd8-5081-6bbe61c96ffb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561b-9fd8-6394-09a37146c596	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561b-9fd8-b01a-01c90fe5f303	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3029 (class 0 OID 21679198)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2516 (class 2606 OID 21678819)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21679375)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 21679365)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21679232)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 21679274)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 21679640)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21679033)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21679054)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21679558)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21678944)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21679439)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21679194)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21679007)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 21678982)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21678958)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21679101)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21679617)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 21679624)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2770 (class 2606 OID 21679648)
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
-- TOC entry 2628 (class 2606 OID 21679128)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21678916)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 21678828)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21678852)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21678808)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2507 (class 2606 OID 21678793)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21679134)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 21679170)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21679311)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21678880)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 21678904)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21679510)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21679107)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 21678894)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21678995)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21679119)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21679519)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 21679527)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21679497)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21679539)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21679152)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21679092)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21679083)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21679298)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 21679225)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21678970)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21678764)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21679161)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21678782)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2509 (class 2606 OID 21678802)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21679179)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 21679114)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 21679063)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 21678752)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 21678740)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21678734)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 21679245)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21678861)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21679074)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 21679285)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21679551)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 21678929)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 21678777)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21679344)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21679017)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21679142)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21679257)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21679598)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21679582)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 21679606)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21679216)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21679048)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21679324)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 21679206)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 1259 OID 21679042)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2581 (class 1259 OID 21679043)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2582 (class 1259 OID 21679041)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2583 (class 1259 OID 21679040)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 21679039)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2670 (class 1259 OID 21679246)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2671 (class 1259 OID 21679247)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 21679248)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 21679619)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2757 (class 1259 OID 21679618)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2530 (class 1259 OID 21678882)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 21679135)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2743 (class 1259 OID 21679586)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2744 (class 1259 OID 21679585)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 21679587)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2746 (class 1259 OID 21679584)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2747 (class 1259 OID 21679583)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2623 (class 1259 OID 21679121)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 21679120)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2575 (class 1259 OID 21679018)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 21679195)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2654 (class 1259 OID 21679197)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2655 (class 1259 OID 21679196)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2555 (class 1259 OID 21678960)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21678959)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 21679540)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2686 (class 1259 OID 21679313)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 21679314)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 21679315)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2753 (class 1259 OID 21679607)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2695 (class 1259 OID 21679349)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2696 (class 1259 OID 21679346)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2697 (class 1259 OID 21679350)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2698 (class 1259 OID 21679348)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2699 (class 1259 OID 21679347)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2545 (class 1259 OID 21678931)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2546 (class 1259 OID 21678930)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 21678855)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2641 (class 1259 OID 21679162)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2511 (class 1259 OID 21678809)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2512 (class 1259 OID 21678810)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2646 (class 1259 OID 21679182)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2647 (class 1259 OID 21679181)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2648 (class 1259 OID 21679180)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 21678996)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 21678997)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2491 (class 1259 OID 21678742)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2603 (class 1259 OID 21679087)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2604 (class 1259 OID 21679085)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2605 (class 1259 OID 21679084)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2606 (class 1259 OID 21679086)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2502 (class 1259 OID 21678783)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21678784)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2632 (class 1259 OID 21679143)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2766 (class 1259 OID 21679641)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2668 (class 1259 OID 21679234)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 21679233)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2767 (class 1259 OID 21679649)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 21679650)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2618 (class 1259 OID 21679108)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2662 (class 1259 OID 21679226)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2663 (class 1259 OID 21679227)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 21679444)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2717 (class 1259 OID 21679443)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2718 (class 1259 OID 21679440)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2719 (class 1259 OID 21679441)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2720 (class 1259 OID 21679442)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2534 (class 1259 OID 21678896)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 21678895)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2536 (class 1259 OID 21678897)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2635 (class 1259 OID 21679156)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2636 (class 1259 OID 21679155)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2726 (class 1259 OID 21679520)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 21679521)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2709 (class 1259 OID 21679379)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 21679380)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2711 (class 1259 OID 21679377)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2712 (class 1259 OID 21679378)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2659 (class 1259 OID 21679217)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2609 (class 1259 OID 21679096)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2610 (class 1259 OID 21679095)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2611 (class 1259 OID 21679093)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2612 (class 1259 OID 21679094)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2705 (class 1259 OID 21679367)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 21679366)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2559 (class 1259 OID 21678971)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2562 (class 1259 OID 21678985)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2563 (class 1259 OID 21678984)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2564 (class 1259 OID 21678983)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 21678986)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2574 (class 1259 OID 21679008)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 21679511)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2742 (class 1259 OID 21679559)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2760 (class 1259 OID 21679625)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2761 (class 1259 OID 21679626)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2517 (class 1259 OID 21678830)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2518 (class 1259 OID 21678829)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2526 (class 1259 OID 21678862)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 21678863)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 21679049)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 21679077)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 21679076)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2600 (class 1259 OID 21679075)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2585 (class 1259 OID 21679035)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2586 (class 1259 OID 21679036)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2587 (class 1259 OID 21679034)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2588 (class 1259 OID 21679038)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2589 (class 1259 OID 21679037)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2533 (class 1259 OID 21678881)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 21678945)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 21678947)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2553 (class 1259 OID 21678946)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2554 (class 1259 OID 21678948)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2617 (class 1259 OID 21679102)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21679312)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 21679345)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 21679286)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21679287)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2524 (class 1259 OID 21678853)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 21678854)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2656 (class 1259 OID 21679207)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 21678753)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 21678917)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2494 (class 1259 OID 21678741)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2739 (class 1259 OID 21679552)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 21679154)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2640 (class 1259 OID 21679153)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21679376)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 21678905)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 21679325)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 21679599)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 21679528)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21679529)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 21679275)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2597 (class 1259 OID 21679064)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21678803)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2801 (class 2606 OID 21679781)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2800 (class 2606 OID 21679786)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2796 (class 2606 OID 21679806)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2802 (class 2606 OID 21679776)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2798 (class 2606 OID 21679796)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2797 (class 2606 OID 21679801)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2799 (class 2606 OID 21679791)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 21679971)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2836 (class 2606 OID 21679976)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21679981)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2869 (class 2606 OID 21680146)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2870 (class 2606 OID 21680141)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 21679706)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2819 (class 2606 OID 21679891)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2864 (class 2606 OID 21680126)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 21680121)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2863 (class 2606 OID 21680131)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 21680116)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2867 (class 2606 OID 21680111)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2817 (class 2606 OID 21679886)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2818 (class 2606 OID 21679881)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2795 (class 2606 OID 21679771)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 21679931)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 21679941)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2828 (class 2606 OID 21679936)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2788 (class 2606 OID 21679741)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 21679736)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21679871)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 21680101)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 21679986)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 21679991)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21679996)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2868 (class 2606 OID 21680136)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2842 (class 2606 OID 21680016)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2845 (class 2606 OID 21680001)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 21680021)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 21680011)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2844 (class 2606 OID 21680006)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2786 (class 2606 OID 21679731)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21679726)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 21679691)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2779 (class 2606 OID 21679686)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 21679911)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2775 (class 2606 OID 21679666)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2774 (class 2606 OID 21679671)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2824 (class 2606 OID 21679926)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2825 (class 2606 OID 21679921)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2826 (class 2606 OID 21679916)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2793 (class 2606 OID 21679756)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2792 (class 2606 OID 21679761)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2771 (class 2606 OID 21679651)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2807 (class 2606 OID 21679846)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2809 (class 2606 OID 21679836)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2810 (class 2606 OID 21679831)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2808 (class 2606 OID 21679841)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2773 (class 2606 OID 21679656)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 21679661)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2820 (class 2606 OID 21679896)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2873 (class 2606 OID 21680161)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 21679966)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21679961)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2875 (class 2606 OID 21680166)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2874 (class 2606 OID 21680171)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2816 (class 2606 OID 21679876)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2832 (class 2606 OID 21679951)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2831 (class 2606 OID 21679956)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 21680076)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2853 (class 2606 OID 21680071)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 21680056)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2855 (class 2606 OID 21680061)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 21680066)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2784 (class 2606 OID 21679716)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 21679711)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 21679721)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2821 (class 2606 OID 21679906)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2822 (class 2606 OID 21679901)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2859 (class 2606 OID 21680086)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21680091)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2849 (class 2606 OID 21680046)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 21680051)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2851 (class 2606 OID 21680036)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 21680041)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 21679946)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 21679866)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2812 (class 2606 OID 21679861)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 21679851)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2813 (class 2606 OID 21679856)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2846 (class 2606 OID 21680031)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21680026)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2790 (class 2606 OID 21679746)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2791 (class 2606 OID 21679751)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21679766)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 21680081)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2860 (class 2606 OID 21680096)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 21680106)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2872 (class 2606 OID 21680151)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 21680156)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 21679681)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21679676)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2781 (class 2606 OID 21679696)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 21679701)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 21679811)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2804 (class 2606 OID 21679826)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2805 (class 2606 OID 21679821)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2806 (class 2606 OID 21679816)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-12 13:56:13 CEST

--
-- PostgreSQL database dump complete
--

