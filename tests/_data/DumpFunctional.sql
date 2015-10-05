--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-05 10:04:45 CEST

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
-- TOC entry 181 (class 1259 OID 21228913)
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
-- TOC entry 229 (class 1259 OID 21229470)
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
-- TOC entry 228 (class 1259 OID 21229453)
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
-- TOC entry 219 (class 1259 OID 21229330)
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
-- TOC entry 222 (class 1259 OID 21229360)
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
-- TOC entry 243 (class 1259 OID 21229712)
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
-- TOC entry 197 (class 1259 OID 21229121)
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
-- TOC entry 199 (class 1259 OID 21229152)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21229638)
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
-- TOC entry 190 (class 1259 OID 21229034)
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
-- TOC entry 230 (class 1259 OID 21229483)
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
-- TOC entry 215 (class 1259 OID 21229285)
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
-- TOC entry 195 (class 1259 OID 21229100)
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
-- TOC entry 193 (class 1259 OID 21229074)
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
-- TOC entry 191 (class 1259 OID 21229051)
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
-- TOC entry 204 (class 1259 OID 21229199)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21229693)
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
-- TOC entry 242 (class 1259 OID 21229705)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21229727)
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
-- TOC entry 208 (class 1259 OID 21229224)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21229008)
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
-- TOC entry 182 (class 1259 OID 21228922)
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
-- TOC entry 183 (class 1259 OID 21228933)
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
-- TOC entry 178 (class 1259 OID 21228887)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21228906)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21229231)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21229265)
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
-- TOC entry 225 (class 1259 OID 21229401)
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
-- TOC entry 185 (class 1259 OID 21228966)
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
-- TOC entry 187 (class 1259 OID 21229000)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21229583)
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
-- TOC entry 205 (class 1259 OID 21229205)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21228985)
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
-- TOC entry 194 (class 1259 OID 21229089)
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
-- TOC entry 207 (class 1259 OID 21229217)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21229597)
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
-- TOC entry 234 (class 1259 OID 21229607)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21229540)
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
-- TOC entry 235 (class 1259 OID 21229615)
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
-- TOC entry 211 (class 1259 OID 21229246)
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
-- TOC entry 203 (class 1259 OID 21229190)
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
-- TOC entry 202 (class 1259 OID 21229180)
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
-- TOC entry 224 (class 1259 OID 21229390)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21229320)
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
-- TOC entry 192 (class 1259 OID 21229063)
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
-- TOC entry 175 (class 1259 OID 21228858)
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
-- TOC entry 174 (class 1259 OID 21228856)
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
-- TOC entry 212 (class 1259 OID 21229259)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21228896)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21228880)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21229273)
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
-- TOC entry 206 (class 1259 OID 21229211)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21229157)
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
-- TOC entry 173 (class 1259 OID 21228845)
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
-- TOC entry 172 (class 1259 OID 21228837)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21228832)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21229337)
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
-- TOC entry 184 (class 1259 OID 21228958)
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
-- TOC entry 201 (class 1259 OID 21229167)
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
-- TOC entry 223 (class 1259 OID 21229378)
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
-- TOC entry 236 (class 1259 OID 21229626)
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
-- TOC entry 189 (class 1259 OID 21229020)
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
-- TOC entry 176 (class 1259 OID 21228867)
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
-- TOC entry 227 (class 1259 OID 21229428)
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
-- TOC entry 196 (class 1259 OID 21229111)
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
-- TOC entry 210 (class 1259 OID 21229238)
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
-- TOC entry 221 (class 1259 OID 21229351)
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
-- TOC entry 239 (class 1259 OID 21229673)
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
-- TOC entry 238 (class 1259 OID 21229645)
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
-- TOC entry 240 (class 1259 OID 21229685)
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
-- TOC entry 217 (class 1259 OID 21229310)
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
-- TOC entry 198 (class 1259 OID 21229146)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21229418)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21229300)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21228861)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 21228913)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21229470)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5612-2f1b-16a1-54dc514280b6	000d0000-5612-2f1b-ca04-0b1592345007	\N	00090000-5612-2f1b-8d97-66082923ea08	000b0000-5612-2f1b-a0a4-2849ae79cfb1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5612-2f1b-0a0a-2b881a926859	000d0000-5612-2f1b-2e92-63e23f76a955	00100000-5612-2f1b-7c52-2580b0b51d63	00090000-5612-2f1b-9f72-a8c27f5f1bcc	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5612-2f1b-f1f9-cba5c180e9d5	000d0000-5612-2f1b-b3be-ddfa5ac3044c	00100000-5612-2f1b-95df-02c4eec19432	00090000-5612-2f1b-a68c-861e174d8244	\N	0003	t	\N	2015-10-05	\N	2	t	\N	f	f
000c0000-5612-2f1b-2f40-560bcc74e56a	000d0000-5612-2f1b-f2a9-ca64134d6aab	\N	00090000-5612-2f1b-2c02-581fa2dae086	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5612-2f1b-0a6c-7dfe53a0dd14	000d0000-5612-2f1b-5fc2-8775984d5313	\N	00090000-5612-2f1b-066b-23ab9a160279	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5612-2f1b-6220-6ddfb1d73218	000d0000-5612-2f1b-cd4f-e67300cbd211	\N	00090000-5612-2f1b-192b-dc62eb99d769	000b0000-5612-2f1b-2c75-2fdfe9ac9950	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5612-2f1b-7e81-582cfbdbaa72	000d0000-5612-2f1b-0a8d-9cc469936a74	00100000-5612-2f1b-306a-1a1caa5ccb14	00090000-5612-2f1b-4a67-0d356d4d4a74	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5612-2f1b-37cd-82ecf1addbe4	000d0000-5612-2f1b-1c6a-d8fc08c214eb	\N	00090000-5612-2f1b-0f50-49de9e1c33a0	000b0000-5612-2f1b-6bf8-dc683944f0f2	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5612-2f1b-a9be-697120cfe50e	000d0000-5612-2f1b-0a8d-9cc469936a74	00100000-5612-2f1b-47b8-29160f9c6dd5	00090000-5612-2f1b-ba66-cccdffd6144d	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5612-2f1b-d609-10a6df5e90ba	000d0000-5612-2f1b-0a8d-9cc469936a74	00100000-5612-2f1b-77d8-2c4b72c4348f	00090000-5612-2f1b-0ea4-34a07f85944f	\N	0010	t	\N	2015-10-05	\N	16	f	\N	f	t
000c0000-5612-2f1b-0964-245f4db1c2c1	000d0000-5612-2f1b-0a8d-9cc469936a74	00100000-5612-2f1b-52ed-98d7849a977d	00090000-5612-2f1b-46f2-26a272df1c7a	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5612-2f1b-8743-8feccb1a9f0d	000d0000-5612-2f1b-e7cc-1f7afe29db47	\N	00090000-5612-2f1b-9f72-a8c27f5f1bcc	000b0000-5612-2f1b-4b07-018c94cb8b72	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3024 (class 0 OID 21229453)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21229330)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5612-2f1b-ffac-386c1963a892	00160000-5612-2f1a-213a-b50bbb34584c	00090000-5612-2f1b-3d7b-08eb3798f131	aizv	10	t
003d0000-5612-2f1b-e86d-c8c9d40d2c27	00160000-5612-2f1a-213a-b50bbb34584c	00090000-5612-2f1b-f4cc-b246b7b17cdb	apri	14	t
003d0000-5612-2f1b-a848-67e5ab0e36a3	00160000-5612-2f1a-bf4c-bd3ea43b7101	00090000-5612-2f1b-f33c-29df193cf9bd	aizv	11	t
003d0000-5612-2f1b-cfaa-4f2228ebc2e8	00160000-5612-2f1a-3012-1b2134eaaac0	00090000-5612-2f1b-84ab-24363fecd876	aizv	12	t
003d0000-5612-2f1b-aa1b-96d75237ed5d	00160000-5612-2f1a-213a-b50bbb34584c	00090000-5612-2f1b-f690-c20f04c68557	apri	18	f
\.


--
-- TOC entry 3018 (class 0 OID 21229360)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5612-2f1a-213a-b50bbb34584c	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5612-2f1a-bf4c-bd3ea43b7101	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5612-2f1a-3012-1b2134eaaac0	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 21229712)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 21229121)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5612-2f1b-708e-6ba70fa4a352	\N	\N	00200000-5612-2f1b-ba47-019fe080637c	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5612-2f1b-a4d9-d5c333eb64e8	\N	\N	00200000-5612-2f1b-4f41-0326271633c9	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5612-2f1b-e424-92ad30911fd8	\N	\N	00200000-5612-2f1b-f3e4-832ae3a8b896	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5612-2f1b-875e-bf96f3beb89d	\N	\N	00200000-5612-2f1b-2d40-f2dd274bedc7	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5612-2f1b-bba2-034bd1597c23	\N	\N	00200000-5612-2f1b-3a0c-b20742b1cbb6	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 21229152)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21229638)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21229034)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5612-2f19-df98-82ab92c99607	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5612-2f19-3bb5-f461bb3073ae	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5612-2f19-1d43-02c596a0d86d	AL	ALB	008	Albania 	Albanija	\N
00040000-5612-2f19-219b-1b5b224df8f3	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5612-2f19-9996-08d8f84862c0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5612-2f19-c071-7ed853f5899d	AD	AND	020	Andorra 	Andora	\N
00040000-5612-2f19-2fa5-bd57f2066cf6	AO	AGO	024	Angola 	Angola	\N
00040000-5612-2f19-90cb-d48922882fb2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5612-2f19-4fb7-eef82691e75a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5612-2f19-45ef-b4e76caa467e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5612-2f19-223d-0719682f7461	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5612-2f19-b899-e23d64674453	AM	ARM	051	Armenia 	Armenija	\N
00040000-5612-2f19-e58a-8cf4333585b4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5612-2f19-cd88-708b1559e11f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5612-2f19-fc2b-2664afe8ce7f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5612-2f19-703e-1052888f8425	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5612-2f19-399b-ea857a7c2afe	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5612-2f19-e8f5-c19e21aed1df	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5612-2f19-c0ff-106f7b5f22a1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5612-2f19-d1aa-2950478c23be	BB	BRB	052	Barbados 	Barbados	\N
00040000-5612-2f19-0293-18b4813c81da	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5612-2f19-e856-585bd92beeb1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5612-2f19-400e-d1e588af3b67	BZ	BLZ	084	Belize 	Belize	\N
00040000-5612-2f19-636a-b8abff94984b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5612-2f19-49a4-9145240940fa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5612-2f19-6ae9-80316e4f56b1	BT	BTN	064	Bhutan 	Butan	\N
00040000-5612-2f19-c9cb-e89574d14066	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5612-2f19-5d3a-8a7d4feaad3e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5612-2f19-4b3f-22cb80311d2c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5612-2f19-469f-9b74c7b7d60e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5612-2f19-b749-62bd248a9150	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5612-2f19-5719-db47476d7758	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5612-2f19-c59b-56aa9788f678	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5612-2f19-f550-148db4d22657	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5612-2f19-cda4-ef7d77f24b8f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5612-2f19-88b4-004dce0660b8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5612-2f19-6e03-d33907a3d392	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5612-2f19-42cf-ec63deeb2af3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5612-2f19-af20-65b3a862d423	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5612-2f19-a1f4-670b6b9228d8	CA	CAN	124	Canada 	Kanada	\N
00040000-5612-2f19-2355-73bdd588755b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5612-2f19-9ee4-d4806e3b3b3c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5612-2f19-4bd6-9608f2932881	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5612-2f19-c3c1-d48bf6e24358	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5612-2f19-64d2-0173269352ca	CL	CHL	152	Chile 	Čile	\N
00040000-5612-2f19-7088-465ed4a2993c	CN	CHN	156	China 	Kitajska	\N
00040000-5612-2f19-d120-e56c70158007	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5612-2f19-ac5c-9b41e4bf4e2f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5612-2f19-6ab0-fdf8eb448d59	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5612-2f19-06bc-7c971ee49a58	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5612-2f19-c1f8-e6028b34ba74	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5612-2f19-b9c1-cb2d32efbcb5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5612-2f19-81ad-b7c1623e7ed2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5612-2f19-5aec-b9c9045a443c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5612-2f19-cab7-dbba3f98103c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5612-2f19-de1d-dba4f0eff9bb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5612-2f19-1f5f-6eff93859cfd	CU	CUB	192	Cuba 	Kuba	\N
00040000-5612-2f19-f2e3-ef6fe7656577	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5612-2f19-9569-80a792b99db3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5612-2f19-0f9f-5a1285ac7c7c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5612-2f19-27aa-976ee66f1475	DK	DNK	208	Denmark 	Danska	\N
00040000-5612-2f19-c3d9-f9ea1279500b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5612-2f19-3de1-0b5c4b150e31	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5612-2f19-8165-0505f5c7aef6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5612-2f19-f384-1c97877d9624	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5612-2f19-1722-2ba66ba6d802	EG	EGY	818	Egypt 	Egipt	\N
00040000-5612-2f19-4120-5f5a9b902b49	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5612-2f19-3ae7-b79cc338bf93	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5612-2f19-7a6b-873e6fa30e0c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5612-2f19-ddfc-c7b90ea2a3be	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5612-2f19-ad10-f5951d7f2e39	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5612-2f19-78ac-bcd9f63b66a7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5612-2f19-dd35-8fde9b8760f9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5612-2f19-045f-a5c957b3bd51	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5612-2f19-ec48-30dc9a8b1cd2	FI	FIN	246	Finland 	Finska	\N
00040000-5612-2f19-ca1e-874ea346d58a	FR	FRA	250	France 	Francija	\N
00040000-5612-2f19-7776-06127bf9983b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5612-2f19-bb4e-cf6623f01fa7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5612-2f19-859b-02102e10dca1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5612-2f19-95da-ebf2a166cf12	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5612-2f19-1490-d6043840f381	GA	GAB	266	Gabon 	Gabon	\N
00040000-5612-2f19-9550-4de8f535ad39	GM	GMB	270	Gambia 	Gambija	\N
00040000-5612-2f19-e7d3-49a0b81bd951	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5612-2f19-d4bf-33275fa52dbf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5612-2f19-ec81-8be7a80e303c	GH	GHA	288	Ghana 	Gana	\N
00040000-5612-2f19-ceb3-58fe4b20b877	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5612-2f19-a05d-03c03906598c	GR	GRC	300	Greece 	Grčija	\N
00040000-5612-2f19-b45e-81a449593aa4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5612-2f19-00c0-887e0a0fd192	GD	GRD	308	Grenada 	Grenada	\N
00040000-5612-2f19-5780-48e042fc5528	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5612-2f19-c029-53578c39bca3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5612-2f19-95d5-6801dcc51915	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5612-2f19-1184-517bfafbf086	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5612-2f19-c2e0-c11d20270ba0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5612-2f19-8486-63217d84b517	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5612-2f19-6919-f60a20166070	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5612-2f19-b467-29b881dd6aae	HT	HTI	332	Haiti 	Haiti	\N
00040000-5612-2f19-63ea-927bc569f433	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5612-2f19-2185-3d75c5e959f9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5612-2f19-a426-095e5f3a2374	HN	HND	340	Honduras 	Honduras	\N
00040000-5612-2f19-b867-c6a51409f45f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5612-2f19-1997-567d521516d7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5612-2f19-431b-8d3b117a5b87	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5612-2f19-3492-7523600ff839	IN	IND	356	India 	Indija	\N
00040000-5612-2f19-bbc0-a4c68d3253b8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5612-2f19-be1b-dac019a3c97a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5612-2f19-5164-872c3b5ed981	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5612-2f19-5010-f6022e6cdc82	IE	IRL	372	Ireland 	Irska	\N
00040000-5612-2f19-28c3-64a1ca9ad938	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5612-2f19-9056-755cdb120c8b	IL	ISR	376	Israel 	Izrael	\N
00040000-5612-2f19-2634-3996179e2ba8	IT	ITA	380	Italy 	Italija	\N
00040000-5612-2f19-45bf-4cbbf2fdb545	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5612-2f19-81b4-0f71da42181b	JP	JPN	392	Japan 	Japonska	\N
00040000-5612-2f19-1984-b723884c3763	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5612-2f19-df34-2d307cd0cadf	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5612-2f19-645d-e2c8a539e07a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5612-2f19-887e-ab394bd295dd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5612-2f19-aede-d0cbf9dbac8b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5612-2f19-d85f-3b0004d85796	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5612-2f19-d647-90cceb58df07	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5612-2f19-b636-9a519c9c15e6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5612-2f19-23aa-24404e78ec4d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5612-2f19-4625-971262a54fd5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5612-2f19-fdad-718ea489eee5	LV	LVA	428	Latvia 	Latvija	\N
00040000-5612-2f19-372d-2193bcbd554e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5612-2f19-148f-77bc6eeacf0d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5612-2f19-fc2f-b600123e117b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5612-2f19-c4bd-973ab2ff2233	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5612-2f19-835e-d080b4f0cb93	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5612-2f19-a902-727f11c80c77	LT	LTU	440	Lithuania 	Litva	\N
00040000-5612-2f19-514e-d9bd6d7ee9ff	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5612-2f19-a53b-3abd34dd555d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5612-2f19-7a14-f66c373573a6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5612-2f19-7322-0cb7c0a486d6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5612-2f19-c8f4-83b29474d63f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5612-2f19-2c6e-d3a4718166ef	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5612-2f19-9929-62b443f620f1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5612-2f19-4b40-1d03d538ab5d	ML	MLI	466	Mali 	Mali	\N
00040000-5612-2f19-279c-b18bb57696e5	MT	MLT	470	Malta 	Malta	\N
00040000-5612-2f19-4ea6-fcedb7fb9143	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5612-2f19-e724-c3720572f7f2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5612-2f19-7072-53d99f99b965	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5612-2f19-b7db-0fac4bf93fe9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5612-2f19-5f3a-15d04c28d0e6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5612-2f19-377e-00f721db1803	MX	MEX	484	Mexico 	Mehika	\N
00040000-5612-2f19-e4aa-e3a0491a9458	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5612-2f19-b82f-2d967f24434f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5612-2f19-277d-7fdefbc33933	MC	MCO	492	Monaco 	Monako	\N
00040000-5612-2f19-8529-9b2706ddd987	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5612-2f19-0318-17544aa8ab45	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5612-2f19-19bd-c932417431d2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5612-2f19-98b3-a4b6cbfc0e7d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5612-2f19-0ea2-81ee5f0eb8d7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5612-2f19-db8d-18f67bc16408	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5612-2f19-0f6d-998eb8ba7aa0	NA	NAM	516	Namibia 	Namibija	\N
00040000-5612-2f19-cade-17ee8dd3788b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5612-2f19-6638-748259078fe3	NP	NPL	524	Nepal 	Nepal	\N
00040000-5612-2f19-4740-631a02124d8a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5612-2f19-3034-dab3e4459428	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5612-2f19-f961-037476fdc4b9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5612-2f19-30bb-af340a6619c1	NE	NER	562	Niger 	Niger 	\N
00040000-5612-2f19-6167-5b65554e3282	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5612-2f19-cabb-496fa0453d09	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5612-2f19-e726-b941eb090c99	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5612-2f19-315c-68db66cee790	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5612-2f19-3353-44ac43c417ec	NO	NOR	578	Norway 	Norveška	\N
00040000-5612-2f19-47be-7ee4386c3614	OM	OMN	512	Oman 	Oman	\N
00040000-5612-2f19-390d-5a96c2bc23c1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5612-2f19-3b55-af35ef2ff3e9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5612-2f19-b557-5d55739790e7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5612-2f19-8882-ee835ba8e5a1	PA	PAN	591	Panama 	Panama	\N
00040000-5612-2f19-45ec-b502ea61ea90	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5612-2f19-3725-8a3b4a997523	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5612-2f19-d746-f07ababb0095	PE	PER	604	Peru 	Peru	\N
00040000-5612-2f19-6287-1c52812e315a	PH	PHL	608	Philippines 	Filipini	\N
00040000-5612-2f19-029b-f692c9fe9bd2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5612-2f19-4a78-a32136d4c9ce	PL	POL	616	Poland 	Poljska	\N
00040000-5612-2f19-477e-95765ab35117	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5612-2f19-d190-b4406e0de160	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5612-2f19-6477-30528562a5e4	QA	QAT	634	Qatar 	Katar	\N
00040000-5612-2f19-3f3a-b13e243bc307	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5612-2f19-d229-b40d17561a49	RO	ROU	642	Romania 	Romunija	\N
00040000-5612-2f19-787f-a40abc92d164	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5612-2f19-7379-09539dd1ae62	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5612-2f19-90aa-234d5b249c2e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5612-2f19-ef7a-2c5efd63552d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5612-2f19-0369-33097937c189	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5612-2f19-3d6d-d3e8c459d196	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5612-2f19-80fa-d61429fe9c0b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5612-2f19-786c-cb6597123c02	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5612-2f19-0195-dfdb4c02b76a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5612-2f19-100b-9f4c11966972	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5612-2f19-e46e-8537773c7741	SM	SMR	674	San Marino 	San Marino	\N
00040000-5612-2f19-9e7c-f2d6106500cc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5612-2f19-ec54-74b9e3b5a55b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5612-2f19-8f85-b1e0bd79fd70	SN	SEN	686	Senegal 	Senegal	\N
00040000-5612-2f19-f030-11eed122f8c7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5612-2f19-b568-6603d1fb1990	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5612-2f19-d0e7-eeb293c68edf	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5612-2f19-de25-319f7663e186	SG	SGP	702	Singapore 	Singapur	\N
00040000-5612-2f19-735f-8791c17a0461	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5612-2f19-ed81-eb773d255fdd	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5612-2f19-6bfd-e8ecec4552a0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5612-2f19-c37d-45d5d15dfdec	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5612-2f19-85b6-2e1e46ba5455	SO	SOM	706	Somalia 	Somalija	\N
00040000-5612-2f19-5fa6-5ef0b5b4f642	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5612-2f19-76bb-6da784dc33c4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5612-2f19-2c2c-14ce6d42714a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5612-2f19-3dc8-bc4dad30eb7f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5612-2f19-34b7-5e3630b50fe0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5612-2f19-5d3e-032efbcc1482	SD	SDN	729	Sudan 	Sudan	\N
00040000-5612-2f19-3467-4c2eac1654d5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5612-2f19-67f2-fc5a85b290d0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5612-2f19-45a8-17bf1e6aa24b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5612-2f19-9d71-8f70b09175c0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5612-2f19-95ba-7f5180412988	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5612-2f19-0595-8b4718769ef3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5612-2f19-0f9c-8aeb29081636	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5612-2f19-ac79-c3c1629fcff2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5612-2f19-7cc2-44c255a005c1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5612-2f19-878d-c01f5dc1c0e3	TH	THA	764	Thailand 	Tajska	\N
00040000-5612-2f19-eaf5-becba8e432cf	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5612-2f19-cd03-3d27926e2bfc	TG	TGO	768	Togo 	Togo	\N
00040000-5612-2f19-c85a-2c2c29e015e4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5612-2f19-aa40-4cb8584aca53	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5612-2f19-8854-8b391158a6a6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5612-2f19-bab7-062fe20bcfb4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5612-2f19-4ad5-245a2cbf9ca1	TR	TUR	792	Turkey 	Turčija	\N
00040000-5612-2f19-51a4-2ea3452e797d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5612-2f19-906f-3b9516491121	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5612-2f19-02f0-f571cccff9b0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5612-2f19-f77e-96787be2aab2	UG	UGA	800	Uganda 	Uganda	\N
00040000-5612-2f19-8756-c66f6ffd9315	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5612-2f19-a846-927dff770a1d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5612-2f19-aaeb-76b1ead9b1a2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5612-2f19-b3ff-411202e87f06	US	USA	840	United States 	Združene države Amerike	\N
00040000-5612-2f19-20e0-e97a90dc5bac	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5612-2f19-f3c8-fba623007d42	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5612-2f19-6f64-2d8ab758abad	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5612-2f19-17c2-5a8e1c5ca150	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5612-2f19-ea5f-3b2d9814de60	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5612-2f19-8c56-d6d3e60b1723	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5612-2f19-ea11-988378a5758b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5612-2f19-6185-8c2142c5d767	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5612-2f19-ac0e-e605ae74e5ec	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5612-2f19-b5d1-ac4223eca5c4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5612-2f19-4b5f-c0f612cdb230	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5612-2f19-63d1-7e47209e45ee	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5612-2f19-8590-a14b9140dc5e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3026 (class 0 OID 21229483)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5612-2f1b-c017-278177f9c4d9	000e0000-5612-2f1b-9ea1-14adf17d0f4e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-2f19-5bc2-f2e715208036	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5612-2f1b-924b-5a4416f4d7b6	000e0000-5612-2f1b-67f3-25f774fbe9b2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-2f19-47b8-0aa71e702feb	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5612-2f1b-18b9-7d99f73d8c5e	000e0000-5612-2f1b-f0ac-d94d00133360	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-2f19-5bc2-f2e715208036	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5612-2f1b-9c5e-503f55231047	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5612-2f1b-0b31-93ef78eba361	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 21229285)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5612-2f1b-ca04-0b1592345007	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-16a1-54dc514280b6	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5612-2f19-072b-72ab485317d5
000d0000-5612-2f1b-2e92-63e23f76a955	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-0a0a-2b881a926859	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5612-2f19-38cd-534ab3edcd0d
000d0000-5612-2f1b-b3be-ddfa5ac3044c	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-f1f9-cba5c180e9d5	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5612-2f19-5cb7-b0b15683585a
000d0000-5612-2f1b-f2a9-ca64134d6aab	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-2f40-560bcc74e56a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5612-2f19-2224-8439535c26f7
000d0000-5612-2f1b-5fc2-8775984d5313	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-0a6c-7dfe53a0dd14	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5612-2f19-2224-8439535c26f7
000d0000-5612-2f1b-cd4f-e67300cbd211	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-6220-6ddfb1d73218	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5612-2f19-072b-72ab485317d5
000d0000-5612-2f1b-0a8d-9cc469936a74	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-a9be-697120cfe50e	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5612-2f19-072b-72ab485317d5
000d0000-5612-2f1b-1c6a-d8fc08c214eb	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-37cd-82ecf1addbe4	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5612-2f19-382b-e1b011a81ad1
000d0000-5612-2f1b-e7cc-1f7afe29db47	000e0000-5612-2f1b-67f3-25f774fbe9b2	000c0000-5612-2f1b-8743-8feccb1a9f0d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5612-2f19-3c17-1d4d6778818a
\.


--
-- TOC entry 2991 (class 0 OID 21229100)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21229074)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21229051)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5612-2f1b-3a8e-6e3b32ab2f1d	00080000-5612-2f1a-9816-1bede23e04a6	00090000-5612-2f1b-0ea4-34a07f85944f	AK		igralka
\.


--
-- TOC entry 3000 (class 0 OID 21229199)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21229693)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21229705)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21229727)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 21093458)
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
-- TOC entry 3004 (class 0 OID 21229224)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21229008)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5612-2f19-e63a-517bc85f648a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5612-2f19-46e0-f34ed5d6e15e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5612-2f19-329a-3d861036209a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5612-2f19-8bb2-2c84efa94517	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5612-2f19-7a32-743adeec19f9	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5612-2f19-ae82-1f780ae7af9c	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5612-2f19-8eba-e1b9b42ce8c5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5612-2f19-f6a8-7a9f0f908a5b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5612-2f19-1243-1a6f4e639514	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5612-2f19-7ad9-dc9a3b598396	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5612-2f19-1202-383339646729	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5612-2f19-6916-e2958627c562	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5612-2f19-1def-6d14ffb72392	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5612-2f19-519a-021ca989fe0e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5612-2f19-e808-caf624eb34da	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5612-2f1a-0131-d05473af3270	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5612-2f1a-4441-97b71da5a47e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5612-2f1a-1809-15a91bd1d46f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5612-2f1a-36bd-1c334aa6e5a7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5612-2f1a-5847-724f1a40aea7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5612-2f1c-6ce1-0f895a3c81b9	application.tenant.maticnopodjetje	string	s:36:"00080000-5612-2f1c-3c1d-d8e98710bf44";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2978 (class 0 OID 21228922)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5612-2f1a-5dc2-18fbcd4b9cb7	00000000-5612-2f1a-0131-d05473af3270	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5612-2f1a-a0ed-c8c7cbe41281	00000000-5612-2f1a-0131-d05473af3270	00010000-5612-2f19-61cd-c20e3c8a9e7f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5612-2f1a-b846-756c6eeba60f	00000000-5612-2f1a-4441-97b71da5a47e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2979 (class 0 OID 21228933)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5612-2f1b-8d97-66082923ea08	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5612-2f1b-2c02-581fa2dae086	00010000-5612-2f1b-5eb7-8c86ef9d1398	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5612-2f1b-a68c-861e174d8244	00010000-5612-2f1b-3474-ca233abb3a82	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5612-2f1b-ba66-cccdffd6144d	00010000-5612-2f1b-0d40-6adfd71d882e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5612-2f1b-99ea-d423652244f6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5612-2f1b-192b-dc62eb99d769	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5612-2f1b-46f2-26a272df1c7a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5612-2f1b-4a67-0d356d4d4a74	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5612-2f1b-0ea4-34a07f85944f	00010000-5612-2f1b-3a67-455382c51b23	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5612-2f1b-9f72-a8c27f5f1bcc	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5612-2f1b-7fa6-18ef524b765d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5612-2f1b-066b-23ab9a160279	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5612-2f1b-0f50-49de9e1c33a0	00010000-5612-2f1b-d3fd-49d75ce9f47e	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5612-2f1b-3d7b-08eb3798f131	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-2f1b-f4cc-b246b7b17cdb	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-2f1b-f33c-29df193cf9bd	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-2f1b-84ab-24363fecd876	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5612-2f1b-f690-c20f04c68557	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 21228887)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5612-2f19-adba-aacecfb00650	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5612-2f19-13ad-35fbcf3cb287	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5612-2f19-2851-fd9b39dd3f38	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5612-2f19-5976-e8047d3d298e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5612-2f19-20b6-ae82f4647b86	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5612-2f19-d135-eef91b5ffe5e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5612-2f19-ad3e-e85499f4c67e	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5612-2f19-2dc0-35535e59a596	Abonma-read	Abonma - branje	f
00030000-5612-2f19-dd4a-287e22de3428	Abonma-write	Abonma - spreminjanje	f
00030000-5612-2f19-2e55-01a77fca8d54	Alternacija-read	Alternacija - branje	f
00030000-5612-2f19-8832-2b02d5180f6a	Alternacija-write	Alternacija - spreminjanje	f
00030000-5612-2f19-222f-0e917c79de93	Arhivalija-read	Arhivalija - branje	f
00030000-5612-2f19-d5c1-daa8740ca420	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5612-2f19-9d72-fe1136bbb3da	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5612-2f19-f264-7e0b1b6c4f2f	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5612-2f19-1372-65a856bb0554	Besedilo-read	Besedilo - branje	f
00030000-5612-2f19-f377-670bc434421a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5612-2f19-41fc-f016c9de4c68	DogodekIzven-read	DogodekIzven - branje	f
00030000-5612-2f19-a324-f4dfcac2855a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5612-2f19-f605-097c816431b6	Dogodek-read	Dogodek - branje	f
00030000-5612-2f19-db9c-cf6032cf18c4	Dogodek-write	Dogodek - spreminjanje	f
00030000-5612-2f19-80b7-108f249db542	DrugiVir-read	DrugiVir - branje	f
00030000-5612-2f19-e563-66178d292bb1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5612-2f19-2b30-64eabb6898d0	Drzava-read	Drzava - branje	f
00030000-5612-2f19-a37d-bcc5eac86959	Drzava-write	Drzava - spreminjanje	f
00030000-5612-2f19-8318-151bd1e91b2a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5612-2f19-eb8b-f12d3e7c843d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5612-2f19-9c2e-9207cfbe1c00	Funkcija-read	Funkcija - branje	f
00030000-5612-2f19-391e-26a622508669	Funkcija-write	Funkcija - spreminjanje	f
00030000-5612-2f19-dafe-38cffb867f3e	Gostovanje-read	Gostovanje - branje	f
00030000-5612-2f19-de13-d1723810c921	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5612-2f19-768b-ed283b3258ba	Gostujoca-read	Gostujoca - branje	f
00030000-5612-2f19-e38b-d45f5634ffd4	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5612-2f19-d17f-cfec04d91be3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5612-2f19-e34f-8f2df3885d5d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5612-2f19-eb90-2028a4e8f3cf	Kupec-read	Kupec - branje	f
00030000-5612-2f19-c5d9-cd8222f13aed	Kupec-write	Kupec - spreminjanje	f
00030000-5612-2f19-3883-01c0866cf40d	NacinPlacina-read	NacinPlacina - branje	f
00030000-5612-2f19-b2e0-a070a36e4e0f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5612-2f19-d2c3-47b1ffc874a8	Option-read	Option - branje	f
00030000-5612-2f19-c039-69a9395194bb	Option-write	Option - spreminjanje	f
00030000-5612-2f19-e2e0-4265e8c57dd8	OptionValue-read	OptionValue - branje	f
00030000-5612-2f19-bbd5-b75b71ff3068	OptionValue-write	OptionValue - spreminjanje	f
00030000-5612-2f19-8fb5-1495617c3c0f	Oseba-read	Oseba - branje	f
00030000-5612-2f19-78d0-8227b0ca5211	Oseba-write	Oseba - spreminjanje	f
00030000-5612-2f19-1497-e968fb5e0013	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5612-2f19-f7c1-30195a890b30	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5612-2f19-da56-a8d5b74a9005	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5612-2f19-86a8-640faf30e571	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5612-2f19-af16-77140319669e	Pogodba-read	Pogodba - branje	f
00030000-5612-2f19-4f24-1bbf89864849	Pogodba-write	Pogodba - spreminjanje	f
00030000-5612-2f19-fd7c-217356cbc1cf	Popa-read	Popa - branje	f
00030000-5612-2f19-e372-eae28e296f2e	Popa-write	Popa - spreminjanje	f
00030000-5612-2f19-c731-2072cdb8536c	Posta-read	Posta - branje	f
00030000-5612-2f19-03d1-b38f5fd5c52a	Posta-write	Posta - spreminjanje	f
00030000-5612-2f19-a034-0626ddd56e7f	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5612-2f19-b3e3-efca5eb310f9	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5612-2f19-1f8b-88ad6ac16b9d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5612-2f19-93e4-1a1f798ab796	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5612-2f19-b49b-538ba7fd17fc	PostniNaslov-read	PostniNaslov - branje	f
00030000-5612-2f19-0e3d-bc9c6615ffcd	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5612-2f19-664a-7409066d787b	Predstava-read	Predstava - branje	f
00030000-5612-2f19-8ea5-a0557e53792c	Predstava-write	Predstava - spreminjanje	f
00030000-5612-2f19-45ed-fc32cd5615db	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5612-2f19-387b-453ee51ad891	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5612-2f19-60d7-3b31d40fcfd1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5612-2f19-dd7f-ac4daa2f28c0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5612-2f19-cacb-37918cfe3e83	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5612-2f19-be98-7a87cf2f6d60	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5612-2f19-c9e8-2d2a477ad61f	ProgramDela-read	ProgramDela - branje	f
00030000-5612-2f19-f52a-c9e6dd1d3572	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5612-2f19-6952-74aa1ea76f52	ProgramFestival-read	ProgramFestival - branje	f
00030000-5612-2f19-8f7f-ebbdf715675c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5612-2f19-038d-de06d05bf742	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5612-2f19-1d00-7cd6b685ac5a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5612-2f19-fa02-634f7f33fbe7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5612-2f19-5c6a-df3a96ece779	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5612-2f19-84d2-1f1f4df651b1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5612-2f19-60f6-5d305901b65d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5612-2f19-8709-d852586850de	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5612-2f19-a023-c7c3b6dab2b8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5612-2f19-6cea-5b75bc3f8acf	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5612-2f19-66f6-94e1aca8c4e6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5612-2f19-2ecf-2903b6b257e1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5612-2f19-e922-a4a837b7821c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5612-2f19-45e9-79628ac01826	ProgramRazno-read	ProgramRazno - branje	f
00030000-5612-2f19-2489-97abf3e87782	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5612-2f19-7baf-daa52cc8d1d7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5612-2f19-94fc-27300eb62225	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5612-2f19-1ca8-f5dd86ae7bbe	Prostor-read	Prostor - branje	f
00030000-5612-2f19-53c8-edeb5b63ed42	Prostor-write	Prostor - spreminjanje	f
00030000-5612-2f19-f39a-5c7cf8221602	Racun-read	Racun - branje	f
00030000-5612-2f19-4022-40074ec85981	Racun-write	Racun - spreminjanje	f
00030000-5612-2f19-695a-1c7ff9de523f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5612-2f19-9e33-5a75cea636c2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5612-2f19-0ab9-8170965bf019	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5612-2f19-bc5a-501f673a66a3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5612-2f19-f4c5-df39218158fc	Rekvizit-read	Rekvizit - branje	f
00030000-5612-2f19-7111-1b81e498b298	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5612-2f19-00f2-b5d1662a2b64	Revizija-read	Revizija - branje	f
00030000-5612-2f19-a54f-605987c8c0bb	Revizija-write	Revizija - spreminjanje	f
00030000-5612-2f19-e737-86c5c09130c7	Rezervacija-read	Rezervacija - branje	f
00030000-5612-2f19-8982-4db77db6730f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5612-2f19-bdf3-9ee23e3d7163	SedezniRed-read	SedezniRed - branje	f
00030000-5612-2f19-fa6a-de8147aa27ce	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5612-2f19-2584-a41d860dd8ce	Sedez-read	Sedez - branje	f
00030000-5612-2f19-b282-92ec483c3ce4	Sedez-write	Sedez - spreminjanje	f
00030000-5612-2f19-b6f5-d83881cb42c2	Sezona-read	Sezona - branje	f
00030000-5612-2f19-b331-0809a0055466	Sezona-write	Sezona - spreminjanje	f
00030000-5612-2f19-613d-9da04e09b6e9	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5612-2f19-0daa-3d7eb41db10a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5612-2f19-a634-e2c7b6082af2	Stevilcenje-read	Stevilcenje - branje	f
00030000-5612-2f19-5bf7-bd89efd0c42c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5612-2f19-b93e-917f6220eeaf	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5612-2f19-d0df-54058aba89ae	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5612-2f19-6457-34d6ca8b2649	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5612-2f19-513e-5a9d25a52e31	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5612-2f19-5f74-fd35af92dc65	Telefonska-read	Telefonska - branje	f
00030000-5612-2f19-64dc-4680a45de0c8	Telefonska-write	Telefonska - spreminjanje	f
00030000-5612-2f19-e008-2552d291c04b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5612-2f19-b6fc-e4553fbbca63	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5612-2f19-e523-fd9c43528afb	TipFunkcije-read	TipFunkcije - branje	f
00030000-5612-2f19-3ccf-dff787a55e91	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5612-2f19-637e-6b9a628c3236	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5612-2f19-f239-310fe76f6e86	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5612-2f19-b44a-358e84460fc3	Trr-read	Trr - branje	f
00030000-5612-2f19-3456-0b2848bf5ed8	Trr-write	Trr - spreminjanje	f
00030000-5612-2f19-6ff3-4b81edf8da3e	Uprizoritev-read	Uprizoritev - branje	f
00030000-5612-2f19-aa59-ec792467f4d7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5612-2f19-dcba-5b9f19302b84	Vaja-read	Vaja - branje	f
00030000-5612-2f19-d7f7-6501b3243617	Vaja-write	Vaja - spreminjanje	f
00030000-5612-2f19-c9b7-4b9803f27cda	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5612-2f19-1475-1a4509e70f93	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5612-2f19-ba7f-6d330334db86	VrstaStroska-read	VrstaStroska - branje	f
00030000-5612-2f19-c44c-5d71bea600e4	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5612-2f19-2de8-e621cdbc13f7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5612-2f19-e90b-89f6c75d290f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5612-2f19-bcb8-1e899d726b56	Zasedenost-read	Zasedenost - branje	f
00030000-5612-2f19-465d-8507eb7f711f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5612-2f19-11c9-c3348712be9f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5612-2f19-53b1-4868d39709c4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5612-2f19-c352-5a2ccb04029e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5612-2f19-db6b-172498bde76f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5612-2f19-84d1-e5455b241428	Job-read	Branje opravil - samo zase - branje	f
00030000-5612-2f19-b6c5-f00e9815796a	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5612-2f19-65fc-4ac627a9f8a6	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5612-2f19-e984-fa9ed0fefad9	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5612-2f19-ba4b-370b6c71deb1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5612-2f19-596b-4cfd011a2aa6	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5612-2f19-d33c-ba0807d3406b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5612-2f19-7a64-5ac5a97c5a73	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5612-2f19-99ea-ba4897e18d76	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5612-2f19-3347-f0b6a06692ba	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5612-2f19-71eb-8b77e3cd0c06	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5612-2f19-d660-c45b061322b2	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5612-2f19-003a-1a2eb2ce5de8	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5612-2f19-862a-cd5d0ca7b4e4	Datoteka-write	Datoteka - spreminjanje	f
00030000-5612-2f19-042f-734425101572	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2976 (class 0 OID 21228906)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5612-2f19-6532-18aa72342f1b	00030000-5612-2f19-13ad-35fbcf3cb287
00020000-5612-2f19-a8cc-f234fcc8762d	00030000-5612-2f19-2b30-64eabb6898d0
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-2dc0-35535e59a596
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-dd4a-287e22de3428
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-2e55-01a77fca8d54
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-8832-2b02d5180f6a
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-222f-0e917c79de93
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-f605-097c816431b6
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-5976-e8047d3d298e
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-db9c-cf6032cf18c4
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-2b30-64eabb6898d0
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-a37d-bcc5eac86959
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-9c2e-9207cfbe1c00
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-391e-26a622508669
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-dafe-38cffb867f3e
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-de13-d1723810c921
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-768b-ed283b3258ba
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-e38b-d45f5634ffd4
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-d17f-cfec04d91be3
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-e34f-8f2df3885d5d
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-d2c3-47b1ffc874a8
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-e2e0-4265e8c57dd8
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-8fb5-1495617c3c0f
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-78d0-8227b0ca5211
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-fd7c-217356cbc1cf
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-e372-eae28e296f2e
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-c731-2072cdb8536c
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-03d1-b38f5fd5c52a
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-b49b-538ba7fd17fc
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-0e3d-bc9c6615ffcd
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-664a-7409066d787b
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-8ea5-a0557e53792c
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-cacb-37918cfe3e83
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-be98-7a87cf2f6d60
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-1ca8-f5dd86ae7bbe
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-53c8-edeb5b63ed42
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-0ab9-8170965bf019
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-bc5a-501f673a66a3
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-f4c5-df39218158fc
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-7111-1b81e498b298
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-b6f5-d83881cb42c2
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-b331-0809a0055466
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-e523-fd9c43528afb
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-6ff3-4b81edf8da3e
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-aa59-ec792467f4d7
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-dcba-5b9f19302b84
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-d7f7-6501b3243617
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-bcb8-1e899d726b56
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-465d-8507eb7f711f
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-11c9-c3348712be9f
00020000-5612-2f19-b75b-f516a710b814	00030000-5612-2f19-c352-5a2ccb04029e
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-2dc0-35535e59a596
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-222f-0e917c79de93
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-f605-097c816431b6
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-2b30-64eabb6898d0
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-dafe-38cffb867f3e
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-768b-ed283b3258ba
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-d17f-cfec04d91be3
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-e34f-8f2df3885d5d
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-d2c3-47b1ffc874a8
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-e2e0-4265e8c57dd8
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-8fb5-1495617c3c0f
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-78d0-8227b0ca5211
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-fd7c-217356cbc1cf
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-c731-2072cdb8536c
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-b49b-538ba7fd17fc
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-0e3d-bc9c6615ffcd
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-664a-7409066d787b
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-1ca8-f5dd86ae7bbe
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-0ab9-8170965bf019
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-f4c5-df39218158fc
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-b6f5-d83881cb42c2
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-5f74-fd35af92dc65
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-64dc-4680a45de0c8
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-b44a-358e84460fc3
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-3456-0b2848bf5ed8
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-2de8-e621cdbc13f7
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-e90b-89f6c75d290f
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-11c9-c3348712be9f
00020000-5612-2f19-5d6b-73b208637220	00030000-5612-2f19-c352-5a2ccb04029e
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-2dc0-35535e59a596
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-2e55-01a77fca8d54
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-222f-0e917c79de93
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-d5c1-daa8740ca420
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-1372-65a856bb0554
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-41fc-f016c9de4c68
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-f605-097c816431b6
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-2b30-64eabb6898d0
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-9c2e-9207cfbe1c00
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-dafe-38cffb867f3e
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-768b-ed283b3258ba
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-d17f-cfec04d91be3
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-d2c3-47b1ffc874a8
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-e2e0-4265e8c57dd8
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-8fb5-1495617c3c0f
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-fd7c-217356cbc1cf
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-c731-2072cdb8536c
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-664a-7409066d787b
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-cacb-37918cfe3e83
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-1ca8-f5dd86ae7bbe
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-0ab9-8170965bf019
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-f4c5-df39218158fc
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-b6f5-d83881cb42c2
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-e523-fd9c43528afb
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-dcba-5b9f19302b84
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-bcb8-1e899d726b56
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-11c9-c3348712be9f
00020000-5612-2f19-154d-ad7362fe28fe	00030000-5612-2f19-c352-5a2ccb04029e
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-2dc0-35535e59a596
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-dd4a-287e22de3428
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-8832-2b02d5180f6a
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-222f-0e917c79de93
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-f605-097c816431b6
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-2b30-64eabb6898d0
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-dafe-38cffb867f3e
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-768b-ed283b3258ba
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-d2c3-47b1ffc874a8
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-e2e0-4265e8c57dd8
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-fd7c-217356cbc1cf
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-c731-2072cdb8536c
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-664a-7409066d787b
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-1ca8-f5dd86ae7bbe
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-0ab9-8170965bf019
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-f4c5-df39218158fc
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-b6f5-d83881cb42c2
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-e523-fd9c43528afb
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-11c9-c3348712be9f
00020000-5612-2f19-f350-c7638c528837	00030000-5612-2f19-c352-5a2ccb04029e
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-2dc0-35535e59a596
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-222f-0e917c79de93
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-f605-097c816431b6
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-2b30-64eabb6898d0
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-dafe-38cffb867f3e
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-768b-ed283b3258ba
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-d2c3-47b1ffc874a8
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-e2e0-4265e8c57dd8
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-fd7c-217356cbc1cf
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-c731-2072cdb8536c
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-664a-7409066d787b
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-1ca8-f5dd86ae7bbe
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-0ab9-8170965bf019
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-f4c5-df39218158fc
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-b6f5-d83881cb42c2
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-e008-2552d291c04b
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-2851-fd9b39dd3f38
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-e523-fd9c43528afb
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-11c9-c3348712be9f
00020000-5612-2f19-54a5-99d5a2640e0e	00030000-5612-2f19-c352-5a2ccb04029e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-adba-aacecfb00650
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-13ad-35fbcf3cb287
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2851-fd9b39dd3f38
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-5976-e8047d3d298e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-20b6-ae82f4647b86
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-d135-eef91b5ffe5e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-ad3e-e85499f4c67e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2dc0-35535e59a596
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-dd4a-287e22de3428
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2e55-01a77fca8d54
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-8832-2b02d5180f6a
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-222f-0e917c79de93
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-d5c1-daa8740ca420
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-1372-65a856bb0554
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-f377-670bc434421a
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-41fc-f016c9de4c68
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-a324-f4dfcac2855a
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-f605-097c816431b6
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-db9c-cf6032cf18c4
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2b30-64eabb6898d0
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-a37d-bcc5eac86959
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-80b7-108f249db542
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e563-66178d292bb1
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-8318-151bd1e91b2a
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-eb8b-f12d3e7c843d
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-9c2e-9207cfbe1c00
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-391e-26a622508669
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-dafe-38cffb867f3e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-de13-d1723810c921
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-768b-ed283b3258ba
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e38b-d45f5634ffd4
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-d17f-cfec04d91be3
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e34f-8f2df3885d5d
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-eb90-2028a4e8f3cf
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-c5d9-cd8222f13aed
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-3883-01c0866cf40d
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b2e0-a070a36e4e0f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-d2c3-47b1ffc874a8
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-c039-69a9395194bb
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e2e0-4265e8c57dd8
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-bbd5-b75b71ff3068
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-8fb5-1495617c3c0f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-78d0-8227b0ca5211
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-1497-e968fb5e0013
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-f7c1-30195a890b30
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-da56-a8d5b74a9005
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-86a8-640faf30e571
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-af16-77140319669e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-4f24-1bbf89864849
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-fd7c-217356cbc1cf
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e372-eae28e296f2e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-c731-2072cdb8536c
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-03d1-b38f5fd5c52a
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-a034-0626ddd56e7f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b3e3-efca5eb310f9
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-1f8b-88ad6ac16b9d
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-93e4-1a1f798ab796
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b49b-538ba7fd17fc
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-0e3d-bc9c6615ffcd
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-664a-7409066d787b
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-8ea5-a0557e53792c
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-45ed-fc32cd5615db
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-387b-453ee51ad891
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-60d7-3b31d40fcfd1
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-dd7f-ac4daa2f28c0
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-cacb-37918cfe3e83
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-be98-7a87cf2f6d60
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-c9e8-2d2a477ad61f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-f52a-c9e6dd1d3572
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-6952-74aa1ea76f52
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-8f7f-ebbdf715675c
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-038d-de06d05bf742
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-1d00-7cd6b685ac5a
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-fa02-634f7f33fbe7
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-5c6a-df3a96ece779
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-84d2-1f1f4df651b1
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-60f6-5d305901b65d
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-8709-d852586850de
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-a023-c7c3b6dab2b8
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-6cea-5b75bc3f8acf
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-66f6-94e1aca8c4e6
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2ecf-2903b6b257e1
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e922-a4a837b7821c
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-45e9-79628ac01826
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2489-97abf3e87782
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-7baf-daa52cc8d1d7
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-94fc-27300eb62225
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-1ca8-f5dd86ae7bbe
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-53c8-edeb5b63ed42
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-f39a-5c7cf8221602
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-4022-40074ec85981
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-695a-1c7ff9de523f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-9e33-5a75cea636c2
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-0ab9-8170965bf019
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-bc5a-501f673a66a3
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-f4c5-df39218158fc
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-7111-1b81e498b298
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-00f2-b5d1662a2b64
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-a54f-605987c8c0bb
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e737-86c5c09130c7
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-8982-4db77db6730f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-bdf3-9ee23e3d7163
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-fa6a-de8147aa27ce
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2584-a41d860dd8ce
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b282-92ec483c3ce4
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b6f5-d83881cb42c2
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b331-0809a0055466
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-613d-9da04e09b6e9
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-0daa-3d7eb41db10a
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-a634-e2c7b6082af2
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-5bf7-bd89efd0c42c
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b93e-917f6220eeaf
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-d0df-54058aba89ae
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-6457-34d6ca8b2649
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-513e-5a9d25a52e31
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-5f74-fd35af92dc65
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-64dc-4680a45de0c8
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e008-2552d291c04b
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b6fc-e4553fbbca63
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e523-fd9c43528afb
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-3ccf-dff787a55e91
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-637e-6b9a628c3236
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-f239-310fe76f6e86
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-b44a-358e84460fc3
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-3456-0b2848bf5ed8
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-6ff3-4b81edf8da3e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-aa59-ec792467f4d7
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-dcba-5b9f19302b84
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-d7f7-6501b3243617
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-c9b7-4b9803f27cda
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-1475-1a4509e70f93
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-ba7f-6d330334db86
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-c44c-5d71bea600e4
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-2de8-e621cdbc13f7
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-e90b-89f6c75d290f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-bcb8-1e899d726b56
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-465d-8507eb7f711f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-11c9-c3348712be9f
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-53b1-4868d39709c4
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-c352-5a2ccb04029e
00020000-5612-2f1b-9257-3ab965062719	00030000-5612-2f19-db6b-172498bde76f
\.


--
-- TOC entry 3005 (class 0 OID 21229231)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21229265)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 21229401)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5612-2f1b-a0a4-2849ae79cfb1	00090000-5612-2f1b-8d97-66082923ea08	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5612-2f1b-2c75-2fdfe9ac9950	00090000-5612-2f1b-192b-dc62eb99d769	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5612-2f1b-6bf8-dc683944f0f2	00090000-5612-2f1b-0f50-49de9e1c33a0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5612-2f1b-4b07-018c94cb8b72	00090000-5612-2f1b-9f72-a8c27f5f1bcc	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2981 (class 0 OID 21228966)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5612-2f1a-9816-1bede23e04a6	00040000-5612-2f19-6bfd-e8ecec4552a0	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1a-a590-8bad2d5108d3	00040000-5612-2f19-6bfd-e8ecec4552a0	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5612-2f1a-a557-9612d590555e	00040000-5612-2f19-6bfd-e8ecec4552a0	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1a-1a90-d400f43a87fe	00040000-5612-2f19-6bfd-e8ecec4552a0	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1a-f672-5f3f6625931a	00040000-5612-2f19-6bfd-e8ecec4552a0	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1a-9c52-3972189819ba	00040000-5612-2f19-223d-0719682f7461	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1a-ad54-ec7d9cc05441	00040000-5612-2f19-de1d-dba4f0eff9bb	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1a-b7fd-ed017c0aa745	00040000-5612-2f19-fc2b-2664afe8ce7f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1a-bf6e-4a41d7e3f203	00040000-5612-2f19-d4bf-33275fa52dbf	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-2f1c-3c1d-d8e98710bf44	00040000-5612-2f19-6bfd-e8ecec4552a0	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2983 (class 0 OID 21229000)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5612-2f18-4eba-64e1b6715614	8341	Adlešiči
00050000-5612-2f18-a19c-3b571585e2e4	5270	Ajdovščina
00050000-5612-2f18-1852-0572a1666c6f	6280	Ankaran/Ancarano
00050000-5612-2f18-ffc0-b676b3b6ce87	9253	Apače
00050000-5612-2f18-bdbd-5c49d2a94a40	8253	Artiče
00050000-5612-2f18-7cc0-57dcfb4db2d7	4275	Begunje na Gorenjskem
00050000-5612-2f18-f471-56d7bf9b1425	1382	Begunje pri Cerknici
00050000-5612-2f18-1f34-24db5cd8b105	9231	Beltinci
00050000-5612-2f18-ff84-3628918fe43f	2234	Benedikt
00050000-5612-2f18-2858-dccd4427c75e	2345	Bistrica ob Dravi
00050000-5612-2f18-00ac-29d681d8abf4	3256	Bistrica ob Sotli
00050000-5612-2f18-6c60-2b34143ab482	8259	Bizeljsko
00050000-5612-2f18-cfcb-7c43a830731e	1223	Blagovica
00050000-5612-2f18-9a8b-1458cfae853f	8283	Blanca
00050000-5612-2f18-c671-8a629876616b	4260	Bled
00050000-5612-2f18-8d0d-b143dc1b2157	4273	Blejska Dobrava
00050000-5612-2f18-eab5-59611b94056a	9265	Bodonci
00050000-5612-2f18-67fa-b3759242c70c	9222	Bogojina
00050000-5612-2f18-a815-7f63720dba7a	4263	Bohinjska Bela
00050000-5612-2f18-897c-14bfd19ab759	4264	Bohinjska Bistrica
00050000-5612-2f18-cb5a-0932d7ca69e9	4265	Bohinjsko jezero
00050000-5612-2f18-0d9b-30f39fb1cf60	1353	Borovnica
00050000-5612-2f18-624c-8356bda8b955	8294	Boštanj
00050000-5612-2f18-cdd5-adf03f440daf	5230	Bovec
00050000-5612-2f18-5188-5f1f82341cd9	5295	Branik
00050000-5612-2f18-6123-f28f45d5fd6c	3314	Braslovče
00050000-5612-2f18-eba5-773b51ea7761	5223	Breginj
00050000-5612-2f18-ba23-005045cadb41	8280	Brestanica
00050000-5612-2f18-1add-709d47c26316	2354	Bresternica
00050000-5612-2f18-b330-5cf263f2249e	4243	Brezje
00050000-5612-2f18-7d79-dc5ac3f9c1fb	1351	Brezovica pri Ljubljani
00050000-5612-2f18-d28c-10679eb96b72	8250	Brežice
00050000-5612-2f18-626d-8f81b6d65308	4210	Brnik - Aerodrom
00050000-5612-2f18-0878-feea02de1b74	8321	Brusnice
00050000-5612-2f18-e945-0f8c4625e6f7	3255	Buče
00050000-5612-2f18-1069-f3dc3e41b77e	8276	Bučka 
00050000-5612-2f18-750b-f6a946ed3070	9261	Cankova
00050000-5612-2f18-6de3-a97a0d8786b4	3000	Celje 
00050000-5612-2f18-613d-29f85da3c18a	3001	Celje - poštni predali
00050000-5612-2f18-d597-ccd11d907080	4207	Cerklje na Gorenjskem
00050000-5612-2f18-4ff9-e942852653d6	8263	Cerklje ob Krki
00050000-5612-2f18-ca88-e9e6190ae219	1380	Cerknica
00050000-5612-2f18-8e24-9f250f7f4a0b	5282	Cerkno
00050000-5612-2f18-91db-b8847ae00266	2236	Cerkvenjak
00050000-5612-2f18-200e-5c84b5c7920c	2215	Ceršak
00050000-5612-2f18-c55b-a9edb96e8dd4	2326	Cirkovce
00050000-5612-2f18-2d43-b29d15d17dca	2282	Cirkulane
00050000-5612-2f18-93cb-d5feb18a69f8	5273	Col
00050000-5612-2f18-ad19-fd358cac80fd	8251	Čatež ob Savi
00050000-5612-2f18-b5dd-c4b7a0ebfd05	1413	Čemšenik
00050000-5612-2f18-0c3d-8caa91b28a6b	5253	Čepovan
00050000-5612-2f18-8962-9fa719ab441d	9232	Črenšovci
00050000-5612-2f18-8f1a-f62e5ad94273	2393	Črna na Koroškem
00050000-5612-2f18-28b1-57a0d1e7731b	6275	Črni Kal
00050000-5612-2f18-de03-448fef18e090	5274	Črni Vrh nad Idrijo
00050000-5612-2f18-60e8-ae0b8e876b91	5262	Črniče
00050000-5612-2f18-22e6-875b7788d063	8340	Črnomelj
00050000-5612-2f18-cf0d-7423da67ab92	6271	Dekani
00050000-5612-2f18-a2b7-f62d4831284f	5210	Deskle
00050000-5612-2f18-a244-180a88e5374d	2253	Destrnik
00050000-5612-2f18-59a8-e87ab6e4be50	6215	Divača
00050000-5612-2f18-dd6f-e5801d25516d	1233	Dob
00050000-5612-2f18-2561-30a330b36a55	3224	Dobje pri Planini
00050000-5612-2f18-35dd-86695694b5b6	8257	Dobova
00050000-5612-2f18-068a-0e8d184ae191	1423	Dobovec
00050000-5612-2f18-b174-59130bc0ce5e	5263	Dobravlje
00050000-5612-2f18-0348-424bb2072ab3	3204	Dobrna
00050000-5612-2f18-badf-6f609d6d73c5	8211	Dobrnič
00050000-5612-2f18-60a7-2136e9048f6b	1356	Dobrova
00050000-5612-2f18-1215-a9d8ead035e9	9223	Dobrovnik/Dobronak 
00050000-5612-2f18-0012-497c93e74462	5212	Dobrovo v Brdih
00050000-5612-2f18-41f7-2abd18606a44	1431	Dol pri Hrastniku
00050000-5612-2f18-8262-18201287e174	1262	Dol pri Ljubljani
00050000-5612-2f18-63c7-9130399f0714	1273	Dole pri Litiji
00050000-5612-2f18-b752-70e56c3cd610	1331	Dolenja vas
00050000-5612-2f18-cc07-e17990472b2f	8350	Dolenjske Toplice
00050000-5612-2f18-1ca7-b76eb61b3340	1230	Domžale
00050000-5612-2f18-6c42-ac1711087de9	2252	Dornava
00050000-5612-2f18-0a9c-ab8238358e12	5294	Dornberk
00050000-5612-2f18-f7c9-bc56b6eb604d	1319	Draga
00050000-5612-2f18-0b53-c5d2f4759b69	8343	Dragatuš
00050000-5612-2f18-cbdb-bf62d86c2d4d	3222	Dramlje
00050000-5612-2f18-f923-a1f30fa667dc	2370	Dravograd
00050000-5612-2f18-b9ee-076d94ad00dc	4203	Duplje
00050000-5612-2f18-3a55-aaf7755d2fb0	6221	Dutovlje
00050000-5612-2f18-6baf-51dc1932e4ce	8361	Dvor
00050000-5612-2f18-222a-26a014fbcedb	2343	Fala
00050000-5612-2f18-5cf7-a88708d3b0c0	9208	Fokovci
00050000-5612-2f18-eac3-cd9f85df8a3e	2313	Fram
00050000-5612-2f18-e0c3-83aff68f221e	3213	Frankolovo
00050000-5612-2f18-0aac-384cbb962322	1274	Gabrovka
00050000-5612-2f18-25d8-e27d845d307f	8254	Globoko
00050000-5612-2f18-c139-d2c1e60485ea	5275	Godovič
00050000-5612-2f18-0a4b-8413d5ad749f	4204	Golnik
00050000-5612-2f18-9a61-d60217290a1e	3303	Gomilsko
00050000-5612-2f18-2da3-cb7f517c1eae	4224	Gorenja vas
00050000-5612-2f18-3f8f-af8e2a8af557	3263	Gorica pri Slivnici
00050000-5612-2f18-0048-73fe8bc86158	2272	Gorišnica
00050000-5612-2f18-4e68-696939b83a07	9250	Gornja Radgona
00050000-5612-2f18-4ba8-417e04b14bf6	3342	Gornji Grad
00050000-5612-2f18-03cd-761e3f8719bd	4282	Gozd Martuljek
00050000-5612-2f18-0c01-ada764198fbf	6272	Gračišče
00050000-5612-2f18-de05-3ba7c1f59437	9264	Grad
00050000-5612-2f18-9183-3cd5933f02f0	8332	Gradac
00050000-5612-2f18-ec76-78b41f280e8b	1384	Grahovo
00050000-5612-2f18-a688-7301fb55975f	5242	Grahovo ob Bači
00050000-5612-2f18-e556-98ac678b4f6a	5251	Grgar
00050000-5612-2f18-44f7-5d9563ab7f7a	3302	Griže
00050000-5612-2f18-321a-e3982b39986f	3231	Grobelno
00050000-5612-2f18-c3fe-b4f78e31c3de	1290	Grosuplje
00050000-5612-2f18-e7bd-b195191fef42	2288	Hajdina
00050000-5612-2f18-1d90-6069acb5f5bc	8362	Hinje
00050000-5612-2f18-bdce-e536b77da49f	2311	Hoče
00050000-5612-2f18-83fa-88a84858081c	9205	Hodoš/Hodos
00050000-5612-2f18-9055-e08a9c7721d8	1354	Horjul
00050000-5612-2f18-c883-fc10e9a2f97f	1372	Hotedršica
00050000-5612-2f18-a47d-cf8268ed3fbd	1430	Hrastnik
00050000-5612-2f18-e382-d5534f9457fe	6225	Hruševje
00050000-5612-2f18-1160-1be4c77a19e2	4276	Hrušica
00050000-5612-2f18-2e27-117ca0f643a8	5280	Idrija
00050000-5612-2f18-b9a1-273eb4e59a14	1292	Ig
00050000-5612-2f18-3ce7-0e4c9e845c5b	6250	Ilirska Bistrica
00050000-5612-2f18-9bc4-4f9bdebd71ee	6251	Ilirska Bistrica-Trnovo
00050000-5612-2f18-5b6b-e592a033393f	1295	Ivančna Gorica
00050000-5612-2f18-4147-8aa5cc915ce6	2259	Ivanjkovci
00050000-5612-2f18-64ae-e56a17528d36	1411	Izlake
00050000-5612-2f18-4e89-18e383578aa0	6310	Izola/Isola
00050000-5612-2f18-e12a-bacb2a37e552	2222	Jakobski Dol
00050000-5612-2f18-270f-768a69c017fe	2221	Jarenina
00050000-5612-2f18-3047-1390fef7b4df	6254	Jelšane
00050000-5612-2f18-37cb-d8b82d00d428	4270	Jesenice
00050000-5612-2f18-adbb-1add283e94bf	8261	Jesenice na Dolenjskem
00050000-5612-2f18-d66b-51691c8ec98a	3273	Jurklošter
00050000-5612-2f18-3cd2-a2359ce109c0	2223	Jurovski Dol
00050000-5612-2f18-aa2e-c819fcc1e412	2256	Juršinci
00050000-5612-2f18-9afb-bd9bf48e7fcd	5214	Kal nad Kanalom
00050000-5612-2f18-eb66-0c146d746ce4	3233	Kalobje
00050000-5612-2f18-ab0d-73a27aba8c3f	4246	Kamna Gorica
00050000-5612-2f18-340f-d1e42466dc0d	2351	Kamnica
00050000-5612-2f18-707e-3bf90f58e1a9	1241	Kamnik
00050000-5612-2f18-8511-fe264b7e4ee0	5213	Kanal
00050000-5612-2f18-41e4-ff4eeca4d535	8258	Kapele
00050000-5612-2f18-492c-99f64671f4e3	2362	Kapla
00050000-5612-2f18-3a67-0ac96abb34fe	2325	Kidričevo
00050000-5612-2f18-482a-ad85852b2ae9	1412	Kisovec
00050000-5612-2f18-e03d-2d7bfae14288	6253	Knežak
00050000-5612-2f18-c292-d38c3b5b8afa	5222	Kobarid
00050000-5612-2f18-6c76-e2d8d767eebc	9227	Kobilje
00050000-5612-2f18-b0bd-d5d5c8d2917d	1330	Kočevje
00050000-5612-2f18-76b6-99e592c1d4bd	1338	Kočevska Reka
00050000-5612-2f18-f864-f16fc5334942	2276	Kog
00050000-5612-2f18-6203-7fdaf3b30977	5211	Kojsko
00050000-5612-2f18-dd44-4eee64f1dcad	6223	Komen
00050000-5612-2f18-79e5-2bcc1d0dc834	1218	Komenda
00050000-5612-2f18-14ce-f3eab3ae809f	6000	Koper/Capodistria 
00050000-5612-2f18-c5cf-73cd14514692	6001	Koper/Capodistria - poštni predali
00050000-5612-2f18-b8de-f3f504559817	8282	Koprivnica
00050000-5612-2f18-70df-fd58b31292ad	5296	Kostanjevica na Krasu
00050000-5612-2f18-bfb2-fe85dbc78a7b	8311	Kostanjevica na Krki
00050000-5612-2f18-808d-0abfba8cdb30	1336	Kostel
00050000-5612-2f18-7c12-5d10d92ec7d2	6256	Košana
00050000-5612-2f18-c16d-d5724c490f72	2394	Kotlje
00050000-5612-2f18-b779-7fb2015000ac	6240	Kozina
00050000-5612-2f18-20f6-ebf59ecd012f	3260	Kozje
00050000-5612-2f18-1dea-337e98235829	4000	Kranj 
00050000-5612-2f18-9b36-d962c76ea7df	4001	Kranj - poštni predali
00050000-5612-2f18-ee7f-cbcaa87a2021	4280	Kranjska Gora
00050000-5612-2f18-20ef-27429bc8f66e	1281	Kresnice
00050000-5612-2f18-69db-3cd386c911fa	4294	Križe
00050000-5612-2f18-1b36-e695c5d5f6db	9206	Križevci
00050000-5612-2f18-0888-e3622580d1be	9242	Križevci pri Ljutomeru
00050000-5612-2f18-74a6-6fa39dd70f27	1301	Krka
00050000-5612-2f18-93dc-5c95a79b8638	8296	Krmelj
00050000-5612-2f18-1545-d5e2d7e0ba2b	4245	Kropa
00050000-5612-2f18-048c-421adf3c4ec4	8262	Krška vas
00050000-5612-2f18-da0d-e3b850eb950c	8270	Krško
00050000-5612-2f18-8078-91a8013567f2	9263	Kuzma
00050000-5612-2f18-64b2-026341195fde	2318	Laporje
00050000-5612-2f18-fd31-1648f163b60d	3270	Laško
00050000-5612-2f18-039c-dfd9652a7d76	1219	Laze v Tuhinju
00050000-5612-2f18-2c73-0f974c0888e5	2230	Lenart v Slovenskih goricah
00050000-5612-2f18-4921-f4f63a657d7b	9220	Lendava/Lendva
00050000-5612-2f18-d6e8-fb539bbe21dc	4248	Lesce
00050000-5612-2f18-2f08-455f1a3fccdf	3261	Lesično
00050000-5612-2f18-941a-b496357ac007	8273	Leskovec pri Krškem
00050000-5612-2f18-719e-9d4abcddc69b	2372	Libeliče
00050000-5612-2f18-9e38-bcdb452dc113	2341	Limbuš
00050000-5612-2f18-e6cc-e478e2520efe	1270	Litija
00050000-5612-2f18-0b97-a45cfc9df199	3202	Ljubečna
00050000-5612-2f18-eea6-72f795fff9a7	1000	Ljubljana 
00050000-5612-2f18-1ae0-ff0df039d597	1001	Ljubljana - poštni predali
00050000-5612-2f18-7ec6-a901f35ad5f2	1231	Ljubljana - Črnuče
00050000-5612-2f18-d96f-2d012a4a4a88	1261	Ljubljana - Dobrunje
00050000-5612-2f18-f467-50dd1d512518	1260	Ljubljana - Polje
00050000-5612-2f18-d466-624c9032f461	1210	Ljubljana - Šentvid
00050000-5612-2f18-6ccc-98954fa076a0	1211	Ljubljana - Šmartno
00050000-5612-2f18-2fe3-dd43418365bf	3333	Ljubno ob Savinji
00050000-5612-2f18-694e-4c70a29e0467	9240	Ljutomer
00050000-5612-2f18-a942-c11a2feaeb30	3215	Loče
00050000-5612-2f18-922b-d5c0dfeb3f17	5231	Log pod Mangartom
00050000-5612-2f18-2688-c0cd74c929f5	1358	Log pri Brezovici
00050000-5612-2f18-83ab-1acdd801f328	1370	Logatec
00050000-5612-2f18-85a0-cb2f85bd8d6f	1371	Logatec
00050000-5612-2f18-0d0a-031a9b13b98b	1434	Loka pri Zidanem Mostu
00050000-5612-2f18-865d-d3bbb86baadb	3223	Loka pri Žusmu
00050000-5612-2f18-bd20-8f80d3be465e	6219	Lokev
00050000-5612-2f18-b534-b11eaa40aa2d	1318	Loški Potok
00050000-5612-2f18-95c8-90dc07ab820f	2324	Lovrenc na Dravskem polju
00050000-5612-2f18-e20e-690e21af1843	2344	Lovrenc na Pohorju
00050000-5612-2f18-3e20-ae2c42dd087e	3334	Luče
00050000-5612-2f18-64a0-951adc83be52	1225	Lukovica
00050000-5612-2f18-f599-43563fea5d18	9202	Mačkovci
00050000-5612-2f18-133b-f16478880893	2322	Majšperk
00050000-5612-2f18-5818-03e76d762226	2321	Makole
00050000-5612-2f18-1afa-e999696c3682	9243	Mala Nedelja
00050000-5612-2f18-f732-025748c8654d	2229	Malečnik
00050000-5612-2f18-a2bd-3e97ee46941d	6273	Marezige
00050000-5612-2f18-c58a-4eff42c8bbbc	2000	Maribor 
00050000-5612-2f18-0b52-1ac57db1ab49	2001	Maribor - poštni predali
00050000-5612-2f18-73aa-4f9b95895bdc	2206	Marjeta na Dravskem polju
00050000-5612-2f18-68a7-6d2ba1c02020	2281	Markovci
00050000-5612-2f18-1d51-70a3ad9280da	9221	Martjanci
00050000-5612-2f18-8e4a-defce9f0f910	6242	Materija
00050000-5612-2f18-c746-d68b6bf1b1a3	4211	Mavčiče
00050000-5612-2f18-2aa7-2f7bd28dd60a	1215	Medvode
00050000-5612-2f18-4152-92a2c0a77750	1234	Mengeš
00050000-5612-2f18-a24e-bb94ab318201	8330	Metlika
00050000-5612-2f18-356e-72aa9b8be311	2392	Mežica
00050000-5612-2f18-47d0-e92317acd9fe	2204	Miklavž na Dravskem polju
00050000-5612-2f18-5f56-41e7e6902216	2275	Miklavž pri Ormožu
00050000-5612-2f18-6052-778dcabdab68	5291	Miren
00050000-5612-2f18-5395-ec8b74e64446	8233	Mirna
00050000-5612-2f18-058a-a07fc7b17051	8216	Mirna Peč
00050000-5612-2f18-7a20-095f121cada9	2382	Mislinja
00050000-5612-2f18-5c79-83c0422314e5	4281	Mojstrana
00050000-5612-2f18-55ed-2c591fcc02e6	8230	Mokronog
00050000-5612-2f18-9f79-a30315a6f730	1251	Moravče
00050000-5612-2f18-4dcc-a99d4ca41587	9226	Moravske Toplice
00050000-5612-2f18-2ae4-b8e307f7a576	5216	Most na Soči
00050000-5612-2f18-9013-b2b72c6977c2	1221	Motnik
00050000-5612-2f18-7b3c-c370b648143c	3330	Mozirje
00050000-5612-2f18-a921-8ea764a882a9	9000	Murska Sobota 
00050000-5612-2f18-46c7-2ad5ec97bd84	9001	Murska Sobota - poštni predali
00050000-5612-2f18-aeb2-742505eec05d	2366	Muta
00050000-5612-2f18-1307-ee007d740fca	4202	Naklo
00050000-5612-2f18-97c6-2dac5963a023	3331	Nazarje
00050000-5612-2f18-ce51-295254e4b3f4	1357	Notranje Gorice
00050000-5612-2f18-db13-9ceac7a48ccb	3203	Nova Cerkev
00050000-5612-2f18-bb2d-2c50708ca137	5000	Nova Gorica 
00050000-5612-2f18-1810-fe1eb93be10e	5001	Nova Gorica - poštni predali
00050000-5612-2f18-0de1-a2c50a9646d3	1385	Nova vas
00050000-5612-2f18-2139-6e67d510a751	8000	Novo mesto
00050000-5612-2f18-9262-5682a7f3614d	8001	Novo mesto - poštni predali
00050000-5612-2f18-3697-d859f9c22311	6243	Obrov
00050000-5612-2f18-b346-8654680acbf6	9233	Odranci
00050000-5612-2f18-3184-e506a2d94bc4	2317	Oplotnica
00050000-5612-2f18-7d20-5c9e0a05db6d	2312	Orehova vas
00050000-5612-2f18-3ccf-42d7c4837d09	2270	Ormož
00050000-5612-2f18-26e1-48824bc0e952	1316	Ortnek
00050000-5612-2f18-7dca-70d7c22ed048	1337	Osilnica
00050000-5612-2f18-abec-ca4ff55b0849	8222	Otočec
00050000-5612-2f18-e790-54f39d7ad052	2361	Ožbalt
00050000-5612-2f18-9d4a-f9d6b17966a9	2231	Pernica
00050000-5612-2f18-9351-cb86aa748790	2211	Pesnica pri Mariboru
00050000-5612-2f18-d362-3dbdb730f4f1	9203	Petrovci
00050000-5612-2f18-f2ea-7a1164f3f843	3301	Petrovče
00050000-5612-2f18-58ad-8be63a616c42	6330	Piran/Pirano
00050000-5612-2f18-bd2f-0c1f3e8c5928	8255	Pišece
00050000-5612-2f18-2e57-5ca1c95aa093	6257	Pivka
00050000-5612-2f18-7275-49e6f10ccd32	6232	Planina
00050000-5612-2f18-6417-b8b500c6cca3	3225	Planina pri Sevnici
00050000-5612-2f18-c5ee-948246ee4147	6276	Pobegi
00050000-5612-2f18-9000-23cb2e1cc26e	8312	Podbočje
00050000-5612-2f18-084e-f2d3fd8d1a1d	5243	Podbrdo
00050000-5612-2f18-2f33-e726d02473c1	3254	Podčetrtek
00050000-5612-2f18-bf7e-298fb3c84623	2273	Podgorci
00050000-5612-2f18-7a1c-9c9a280459ea	6216	Podgorje
00050000-5612-2f18-cdad-90a668409cd2	2381	Podgorje pri Slovenj Gradcu
00050000-5612-2f18-dcf3-8134162e0ed2	6244	Podgrad
00050000-5612-2f18-3f70-5a4325a9f5ce	1414	Podkum
00050000-5612-2f18-8a23-130a401054cb	2286	Podlehnik
00050000-5612-2f18-341a-4e627da9127d	5272	Podnanos
00050000-5612-2f18-d25b-57a40c78d5fc	4244	Podnart
00050000-5612-2f18-4981-052d6275975b	3241	Podplat
00050000-5612-2f18-8ec6-480692589750	3257	Podsreda
00050000-5612-2f18-2b56-90cb6f032d41	2363	Podvelka
00050000-5612-2f18-7ea3-fc17f8239e73	2208	Pohorje
00050000-5612-2f18-64f8-2821561b6e19	2257	Polenšak
00050000-5612-2f18-43cd-fd2c6c77af85	1355	Polhov Gradec
00050000-5612-2f18-3979-c62ca128e6f4	4223	Poljane nad Škofjo Loko
00050000-5612-2f18-7ba1-8f52b93080e7	2319	Poljčane
00050000-5612-2f18-ee64-844c2e6bcb7d	1272	Polšnik
00050000-5612-2f18-657d-df4f6c89deff	3313	Polzela
00050000-5612-2f18-2016-9a20dc6016d1	3232	Ponikva
00050000-5612-2f18-607e-e2eb0e6b638c	6320	Portorož/Portorose
00050000-5612-2f18-d6c9-6800fe21a74d	6230	Postojna
00050000-5612-2f18-509e-5d1719a5787c	2331	Pragersko
00050000-5612-2f18-d3ca-7956a2b792a7	3312	Prebold
00050000-5612-2f18-269f-0a6714651dc5	4205	Preddvor
00050000-5612-2f18-e302-7b4f82befc4a	6255	Prem
00050000-5612-2f18-9282-020b6fefe63f	1352	Preserje
00050000-5612-2f18-af26-049a5cdaa1eb	6258	Prestranek
00050000-5612-2f18-ce93-52af1fde473d	2391	Prevalje
00050000-5612-2f18-3471-f5aab81339f3	3262	Prevorje
00050000-5612-2f18-6c25-8af8788fb315	1276	Primskovo 
00050000-5612-2f18-e364-da6e74e3a1a6	3253	Pristava pri Mestinju
00050000-5612-2f18-0077-ffa57517570c	9207	Prosenjakovci/Partosfalva
00050000-5612-2f18-8b81-1cbf77ed04e7	5297	Prvačina
00050000-5612-2f18-0dd4-d369ef33ff25	2250	Ptuj
00050000-5612-2f18-3f76-2b0959d86283	2323	Ptujska Gora
00050000-5612-2f18-ea3c-eb0a94b97444	9201	Puconci
00050000-5612-2f18-1ec7-df6781593088	2327	Rače
00050000-5612-2f18-b7e9-ced6b3d30de6	1433	Radeče
00050000-5612-2f18-cf63-f6f95786bad1	9252	Radenci
00050000-5612-2f18-3715-67f29fe2d9fc	2360	Radlje ob Dravi
00050000-5612-2f18-dcf0-98f9e92820f8	1235	Radomlje
00050000-5612-2f18-394e-c0dbfbb6e337	4240	Radovljica
00050000-5612-2f18-24d1-018785639c81	8274	Raka
00050000-5612-2f18-4766-50ac5acd4bb4	1381	Rakek
00050000-5612-2f18-f4b7-3f7bc8750e56	4283	Rateče - Planica
00050000-5612-2f18-a8c2-bcd9faa1b35b	2390	Ravne na Koroškem
00050000-5612-2f18-a64a-c62471c1a3ea	9246	Razkrižje
00050000-5612-2f18-4001-470e7a1bc269	3332	Rečica ob Savinji
00050000-5612-2f18-1f2f-3b6343e5ca11	5292	Renče
00050000-5612-2f18-c50b-c8c4a92e296e	1310	Ribnica
00050000-5612-2f18-f7b2-cdd8ae468dfb	2364	Ribnica na Pohorju
00050000-5612-2f18-14ba-d86790a08693	3272	Rimske Toplice
00050000-5612-2f18-a640-f9a68351dcfd	1314	Rob
00050000-5612-2f18-52fa-f3c3e403f5e8	5215	Ročinj
00050000-5612-2f18-cb2e-404368d60494	3250	Rogaška Slatina
00050000-5612-2f18-b24b-7d9c8bd29424	9262	Rogašovci
00050000-5612-2f18-6939-e39448dfe19f	3252	Rogatec
00050000-5612-2f18-2240-abf441ad3297	1373	Rovte
00050000-5612-2f18-b164-2975e169541e	2342	Ruše
00050000-5612-2f18-a2ba-fe63da5d1808	1282	Sava
00050000-5612-2f18-fb4d-851edce2c267	6333	Sečovlje/Sicciole
00050000-5612-2f18-d8d0-2ef8159968a6	4227	Selca
00050000-5612-2f18-4ff5-4da4550f6795	2352	Selnica ob Dravi
00050000-5612-2f18-53a9-e753e81a04cc	8333	Semič
00050000-5612-2f18-7668-76527abbe65c	8281	Senovo
00050000-5612-2f18-a629-06ff6112aa3a	6224	Senožeče
00050000-5612-2f18-f97b-6d595833d980	8290	Sevnica
00050000-5612-2f18-05c6-f839ccffb0e4	6210	Sežana
00050000-5612-2f18-0612-8edd04ac2a59	2214	Sladki Vrh
00050000-5612-2f18-3113-66b03ea71d78	5283	Slap ob Idrijci
00050000-5612-2f18-0fb0-23c1b6125de3	2380	Slovenj Gradec
00050000-5612-2f18-6f0c-d38397fa3fe0	2310	Slovenska Bistrica
00050000-5612-2f18-d728-5f794e6bc84d	3210	Slovenske Konjice
00050000-5612-2f18-81c3-6d225d28c77e	1216	Smlednik
00050000-5612-2f18-586e-202143fd3557	5232	Soča
00050000-5612-2f18-1b5d-df28cf2e3c1e	1317	Sodražica
00050000-5612-2f18-67b5-2ac20592d484	3335	Solčava
00050000-5612-2f18-20f8-3393b6b7bef7	5250	Solkan
00050000-5612-2f18-48a9-5d6334675793	4229	Sorica
00050000-5612-2f18-1d9c-6454e9c003c6	4225	Sovodenj
00050000-5612-2f18-18ec-fa1a8f4b6b3c	5281	Spodnja Idrija
00050000-5612-2f18-c867-b7d20f137c45	2241	Spodnji Duplek
00050000-5612-2f18-892f-7392e5b65363	9245	Spodnji Ivanjci
00050000-5612-2f18-870b-404b434534fa	2277	Središče ob Dravi
00050000-5612-2f18-f06b-c9aa0fe6abeb	4267	Srednja vas v Bohinju
00050000-5612-2f18-ebdf-cba4fa49aaac	8256	Sromlje 
00050000-5612-2f18-143d-0747ab226891	5224	Srpenica
00050000-5612-2f18-dd15-8774fe1a80a0	1242	Stahovica
00050000-5612-2f18-49bc-6743dc8ed1fc	1332	Stara Cerkev
00050000-5612-2f18-7af4-72753ef3301f	8342	Stari trg ob Kolpi
00050000-5612-2f18-d2bc-440a9b9305a1	1386	Stari trg pri Ložu
00050000-5612-2f18-58de-a413cab0d6b5	2205	Starše
00050000-5612-2f18-547e-b00154348d86	2289	Stoperce
00050000-5612-2f18-41a1-9741f029b774	8322	Stopiče
00050000-5612-2f18-2cc3-1340936b60b7	3206	Stranice
00050000-5612-2f18-3ac6-e4a27ad80886	8351	Straža
00050000-5612-2f18-3c98-f9b401088788	1313	Struge
00050000-5612-2f18-f623-27f70e60c915	8293	Studenec
00050000-5612-2f18-1993-1f93cc7f5240	8331	Suhor
00050000-5612-2f18-54ca-78bfbddfee43	2233	Sv. Ana v Slovenskih goricah
00050000-5612-2f18-3c39-66e5055f495d	2235	Sv. Trojica v Slovenskih goricah
00050000-5612-2f18-f1d9-1929293c1630	2353	Sveti Duh na Ostrem Vrhu
00050000-5612-2f18-1021-8555a527febd	9244	Sveti Jurij ob Ščavnici
00050000-5612-2f18-ff18-b12f6aa1f6f1	3264	Sveti Štefan
00050000-5612-2f18-447c-dcb12f96daf5	2258	Sveti Tomaž
00050000-5612-2f18-34e9-86dc6177c715	9204	Šalovci
00050000-5612-2f18-94ca-8cb6876d3b86	5261	Šempas
00050000-5612-2f18-0971-573bcec9b1e5	5290	Šempeter pri Gorici
00050000-5612-2f18-6303-4cc653de6649	3311	Šempeter v Savinjski dolini
00050000-5612-2f18-adf3-7898339a5689	4208	Šenčur
00050000-5612-2f18-669c-5e34eb243753	2212	Šentilj v Slovenskih goricah
00050000-5612-2f18-a35e-ba7b56f7a0ce	8297	Šentjanž
00050000-5612-2f18-20de-4b41f0eed550	2373	Šentjanž pri Dravogradu
00050000-5612-2f18-89a4-4845c0393685	8310	Šentjernej
00050000-5612-2f18-489a-fbe74dfb3a6d	3230	Šentjur
00050000-5612-2f18-b6e8-cd2402ec36f4	3271	Šentrupert
00050000-5612-2f18-aadc-cbadd20848e4	8232	Šentrupert
00050000-5612-2f18-2d6e-ff18f6426b59	1296	Šentvid pri Stični
00050000-5612-2f18-99f6-2d66ddf255d8	8275	Škocjan
00050000-5612-2f18-3c6f-7925ccd75430	6281	Škofije
00050000-5612-2f18-c15e-5c8dc87485d1	4220	Škofja Loka
00050000-5612-2f18-49e5-e569e768c32c	3211	Škofja vas
00050000-5612-2f18-83df-96a1eeb9a660	1291	Škofljica
00050000-5612-2f18-16da-e6589954280b	6274	Šmarje
00050000-5612-2f18-9baf-4abf4cfc5781	1293	Šmarje - Sap
00050000-5612-2f18-4ee5-b34db18d9bc1	3240	Šmarje pri Jelšah
00050000-5612-2f18-72e0-19a4a5a7bf91	8220	Šmarješke Toplice
00050000-5612-2f18-e17b-17a586bfde0a	2315	Šmartno na Pohorju
00050000-5612-2f18-9d78-0b901b056a7d	3341	Šmartno ob Dreti
00050000-5612-2f18-ce83-772ff5742382	3327	Šmartno ob Paki
00050000-5612-2f18-d31c-492033959d6b	1275	Šmartno pri Litiji
00050000-5612-2f18-5fce-76c99c984c21	2383	Šmartno pri Slovenj Gradcu
00050000-5612-2f18-827f-d295897423d4	3201	Šmartno v Rožni dolini
00050000-5612-2f18-5546-d4972cd936e7	3325	Šoštanj
00050000-5612-2f18-6fca-2bef35f825fa	6222	Štanjel
00050000-5612-2f18-5465-9b2c672e5f9b	3220	Štore
00050000-5612-2f18-3635-062206938460	3304	Tabor
00050000-5612-2f18-fee5-10bd2f5f28b9	3221	Teharje
00050000-5612-2f18-bd1a-0ba3a526dd6e	9251	Tišina
00050000-5612-2f18-2157-9fa6d15490e7	5220	Tolmin
00050000-5612-2f18-6509-4b1177b95d8d	3326	Topolšica
00050000-5612-2f18-6819-d7b115447399	2371	Trbonje
00050000-5612-2f18-f86e-ef7679fdb147	1420	Trbovlje
00050000-5612-2f18-b8d2-2a8e6f1e8aef	8231	Trebelno 
00050000-5612-2f18-8ca2-959141e295ef	8210	Trebnje
00050000-5612-2f18-3f5a-1bdfa517523e	5252	Trnovo pri Gorici
00050000-5612-2f18-f3c4-3d1cab60c557	2254	Trnovska vas
00050000-5612-2f18-a202-99b45c137b71	1222	Trojane
00050000-5612-2f18-ab44-1d419c2bd08d	1236	Trzin
00050000-5612-2f18-1833-9acb5d006880	4290	Tržič
00050000-5612-2f18-7fcf-ccf845c07375	8295	Tržišče
00050000-5612-2f18-6aa8-0eb0cb8324a4	1311	Turjak
00050000-5612-2f18-1e69-6ea57c5df3f0	9224	Turnišče
00050000-5612-2f18-8e3e-ebe606dbc543	8323	Uršna sela
00050000-5612-2f18-a7b4-f094fecee313	1252	Vače
00050000-5612-2f18-8a7a-4b669b1666ae	3320	Velenje 
00050000-5612-2f18-e059-7313735ce110	3322	Velenje - poštni predali
00050000-5612-2f18-210d-899488d2dcd5	8212	Velika Loka
00050000-5612-2f18-e0e8-8a51786d9c9e	2274	Velika Nedelja
00050000-5612-2f18-673b-cf1ce91e625d	9225	Velika Polana
00050000-5612-2f18-fb82-d2d73c7ed389	1315	Velike Lašče
00050000-5612-2f18-dfd4-4d1ad485bbd6	8213	Veliki Gaber
00050000-5612-2f18-9d73-21a238f49698	9241	Veržej
00050000-5612-2f18-b19f-5d67f2ec0d21	1312	Videm - Dobrepolje
00050000-5612-2f18-01c7-813607284d55	2284	Videm pri Ptuju
00050000-5612-2f18-cdac-1a8eece71290	8344	Vinica
00050000-5612-2f18-45a7-051679dcd368	5271	Vipava
00050000-5612-2f18-cc04-c2038b12fe12	4212	Visoko
00050000-5612-2f18-b67b-b8693d7ad9f6	1294	Višnja Gora
00050000-5612-2f18-036e-430495fc2cb0	3205	Vitanje
00050000-5612-2f18-cc96-5333b6d29b53	2255	Vitomarci
00050000-5612-2f18-6511-61e581ed4210	1217	Vodice
00050000-5612-2f18-a637-c540fe5336fc	3212	Vojnik\t
00050000-5612-2f18-afe3-7af0e9393e13	5293	Volčja Draga
00050000-5612-2f18-1a7f-046c7d28487e	2232	Voličina
00050000-5612-2f18-4560-71bd7ec63c56	3305	Vransko
00050000-5612-2f18-7427-6d380df5a284	6217	Vremski Britof
00050000-5612-2f18-ac5a-5625ceb6fe3b	1360	Vrhnika
00050000-5612-2f18-98ae-15f094668ea3	2365	Vuhred
00050000-5612-2f18-dd69-ee0ab9c71587	2367	Vuzenica
00050000-5612-2f18-3d85-891bb4675c0e	8292	Zabukovje 
00050000-5612-2f18-b547-7fc3f1a3afa6	1410	Zagorje ob Savi
00050000-5612-2f18-2fa1-67c3ce61fa8b	1303	Zagradec
00050000-5612-2f18-fe58-4b3d9b0a2c89	2283	Zavrč
00050000-5612-2f18-e0fb-5e3d5ab8b78a	8272	Zdole 
00050000-5612-2f18-4ce9-073652bd28bb	4201	Zgornja Besnica
00050000-5612-2f18-8ac1-5178dec71a93	2242	Zgornja Korena
00050000-5612-2f18-cbe1-dd425bbe0dc3	2201	Zgornja Kungota
00050000-5612-2f18-cb51-101a2d1e4bc3	2316	Zgornja Ložnica
00050000-5612-2f18-2042-beb4e62ed40e	2314	Zgornja Polskava
00050000-5612-2f18-49e3-95c9275437a4	2213	Zgornja Velka
00050000-5612-2f18-795a-cd58c4d8de55	4247	Zgornje Gorje
00050000-5612-2f18-0c31-cbc1353c1164	4206	Zgornje Jezersko
00050000-5612-2f18-1f06-00846e74bfab	2285	Zgornji Leskovec
00050000-5612-2f18-56a8-a06f72016e52	1432	Zidani Most
00050000-5612-2f18-0189-259e935b9c8d	3214	Zreče
00050000-5612-2f18-acdb-950cd631e1e0	4209	Žabnica
00050000-5612-2f18-3d7e-f69771ef4b63	3310	Žalec
00050000-5612-2f19-965e-a43e47d521a2	4228	Železniki
00050000-5612-2f19-1904-76575f9b1969	2287	Žetale
00050000-5612-2f19-7daf-6cdeea329d9e	4226	Žiri
00050000-5612-2f19-8970-fb5d2d95fefe	4274	Žirovnica
00050000-5612-2f19-315c-e72abcec8d0a	8360	Žužemberk
\.


--
-- TOC entry 3028 (class 0 OID 21229583)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21229205)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 21228985)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5612-2f1b-53a6-27483b2430b5	00080000-5612-2f1a-9816-1bede23e04a6	\N	00040000-5612-2f19-6bfd-e8ecec4552a0	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5612-2f1b-3796-52297bf0a0c3	00080000-5612-2f1a-9816-1bede23e04a6	\N	00040000-5612-2f19-6bfd-e8ecec4552a0	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5612-2f1b-c9d2-1512b88ab063	00080000-5612-2f1a-a590-8bad2d5108d3	\N	00040000-5612-2f19-6bfd-e8ecec4552a0	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2990 (class 0 OID 21229089)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21229217)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21229597)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21229607)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5612-2f1b-d662-3d6078a27792	00080000-5612-2f1a-a557-9612d590555e	0987	AK
00190000-5612-2f1b-9426-a4a99f4df3a6	00080000-5612-2f1a-a590-8bad2d5108d3	0989	AK
00190000-5612-2f1b-d4c0-a99a0abed5ac	00080000-5612-2f1a-1a90-d400f43a87fe	0986	AK
00190000-5612-2f1b-d075-ae01c1414d90	00080000-5612-2f1a-9c52-3972189819ba	0984	AK
00190000-5612-2f1b-9068-3daa212eb5c7	00080000-5612-2f1a-ad54-ec7d9cc05441	0983	AK
00190000-5612-2f1b-070c-23bdfbcaa85e	00080000-5612-2f1a-b7fd-ed017c0aa745	0982	AK
00190000-5612-2f1c-89c0-1004f1b574a6	00080000-5612-2f1c-3c1d-d8e98710bf44	1001	AK
\.


--
-- TOC entry 3027 (class 0 OID 21229540)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5612-2f1b-9197-2672eabf7ba6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 21229615)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 21229246)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5612-2f1a-0201-37aa2d2c303a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5612-2f1a-184a-b03f91b23d67	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5612-2f1a-bb7e-e58d94533618	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5612-2f1a-4e66-8cb32eecd8af	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5612-2f1a-9f07-ccbb9918c694	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5612-2f1a-a323-7a7453d4a4f1	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5612-2f1a-6f91-fc90a6904935	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2999 (class 0 OID 21229190)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21229180)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21229390)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21229320)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21229063)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21228858)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5612-2f1c-3c1d-d8e98710bf44	00010000-5612-2f19-cd36-1bd7d7a3c1a2	2015-10-05 10:04:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-5612-2f1c-6ce1-0f895a3c81b9	00010000-5612-2f19-cd36-1bd7d7a3c1a2	2015-10-05 10:04:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5612-2f1c-89c0-1004f1b574a6	00010000-5612-2f19-cd36-1bd7d7a3c1a2	2015-10-05 10:04:44	INS	a:0:{}
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 21229259)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21228896)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5612-2f19-6532-18aa72342f1b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5612-2f19-a8cc-f234fcc8762d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5612-2f19-8b25-b72992cd1103	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5612-2f19-ae27-c6d97dbca263	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5612-2f19-b75b-f516a710b814	planer	Planer dogodkov v koledarju	t
00020000-5612-2f19-5d6b-73b208637220	kadrovska	Kadrovska služba	t
00020000-5612-2f19-154d-ad7362fe28fe	arhivar	Ažuriranje arhivalij	t
00020000-5612-2f19-f350-c7638c528837	igralec	Igralec	t
00020000-5612-2f19-54a5-99d5a2640e0e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5612-2f1b-9257-3ab965062719	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2973 (class 0 OID 21228880)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5612-2f19-61cd-c20e3c8a9e7f	00020000-5612-2f19-8b25-b72992cd1103
00010000-5612-2f19-cd36-1bd7d7a3c1a2	00020000-5612-2f19-8b25-b72992cd1103
00010000-5612-2f1b-c9c4-8d42bb724754	00020000-5612-2f1b-9257-3ab965062719
\.


--
-- TOC entry 3010 (class 0 OID 21229273)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 21229211)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21229157)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21228845)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5612-2f19-ffb2-00e7df24c83d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5612-2f19-b959-aa5d1bc8d78d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5612-2f19-3473-203409dee180	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5612-2f19-653b-38af4335e846	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5612-2f19-c36a-1021fe0fa577	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2968 (class 0 OID 21228837)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5612-2f19-064f-df0bd7fcdae0	00230000-5612-2f19-653b-38af4335e846	popa
00240000-5612-2f19-16c9-a3e61cf15a62	00230000-5612-2f19-653b-38af4335e846	oseba
00240000-5612-2f19-422c-c8d1b4c7dca7	00230000-5612-2f19-653b-38af4335e846	sezona
00240000-5612-2f19-ec4e-d43a9d7e202b	00230000-5612-2f19-b959-aa5d1bc8d78d	prostor
00240000-5612-2f19-075b-a4b8e09d9b3d	00230000-5612-2f19-653b-38af4335e846	besedilo
00240000-5612-2f19-fbb3-22949df6cbcf	00230000-5612-2f19-653b-38af4335e846	uprizoritev
00240000-5612-2f19-fe40-2e32c98a0831	00230000-5612-2f19-653b-38af4335e846	funkcija
00240000-5612-2f19-9bbc-f8a89eee20ca	00230000-5612-2f19-653b-38af4335e846	tipfunkcije
00240000-5612-2f19-bb9b-ca8b70c823d6	00230000-5612-2f19-653b-38af4335e846	alternacija
00240000-5612-2f19-6cd8-16974dc50d96	00230000-5612-2f19-ffb2-00e7df24c83d	pogodba
00240000-5612-2f19-48f0-8d9b8ce7d9b1	00230000-5612-2f19-653b-38af4335e846	zaposlitev
00240000-5612-2f19-90fe-ed972e95903c	00230000-5612-2f19-653b-38af4335e846	zvrstuprizoritve
00240000-5612-2f19-2203-93b25aa674f1	00230000-5612-2f19-ffb2-00e7df24c83d	programdela
00240000-5612-2f19-3acc-a05d512f4943	00230000-5612-2f19-653b-38af4335e846	zapis
\.


--
-- TOC entry 2967 (class 0 OID 21228832)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
136fbbf4-8bae-4b5a-8bb5-5f12dc373b3f	00240000-5612-2f19-064f-df0bd7fcdae0	0	1001
\.


--
-- TOC entry 3016 (class 0 OID 21229337)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5612-2f1b-d4f3-fa7e48362998	000e0000-5612-2f1b-67f3-25f774fbe9b2	00080000-5612-2f1a-9816-1bede23e04a6	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5612-2f19-481d-384767c3bc84
00270000-5612-2f1b-98c3-8badad8e7452	000e0000-5612-2f1b-67f3-25f774fbe9b2	00080000-5612-2f1a-9816-1bede23e04a6	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5612-2f19-481d-384767c3bc84
\.


--
-- TOC entry 2980 (class 0 OID 21228958)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 21229167)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5612-2f1b-2755-d693d946d63a	00180000-5612-2f1b-708e-6ba70fa4a352	000c0000-5612-2f1b-16a1-54dc514280b6	00090000-5612-2f1b-0ea4-34a07f85944f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-2f1b-320f-97845760ce1f	00180000-5612-2f1b-708e-6ba70fa4a352	000c0000-5612-2f1b-0a0a-2b881a926859	00090000-5612-2f1b-9f72-a8c27f5f1bcc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-2f1b-44f8-6c651264c4bf	00180000-5612-2f1b-708e-6ba70fa4a352	000c0000-5612-2f1b-f1f9-cba5c180e9d5	00090000-5612-2f1b-a68c-861e174d8244	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-2f1b-2aae-c56aaaf39ad6	00180000-5612-2f1b-708e-6ba70fa4a352	000c0000-5612-2f1b-2f40-560bcc74e56a	00090000-5612-2f1b-2c02-581fa2dae086	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-2f1b-efc7-b5c00790fd20	00180000-5612-2f1b-708e-6ba70fa4a352	000c0000-5612-2f1b-0a6c-7dfe53a0dd14	00090000-5612-2f1b-066b-23ab9a160279	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-2f1b-b3dd-2b3849de7536	00180000-5612-2f1b-e424-92ad30911fd8	\N	00090000-5612-2f1b-066b-23ab9a160279	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3019 (class 0 OID 21229378)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5612-2f19-3c17-1d4d6778818a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5612-2f19-257e-d9af054be30c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5612-2f19-d72f-488b728440da	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5612-2f19-38cd-534ab3edcd0d	04	Režija	Režija	Režija	umetnik	30
000f0000-5612-2f19-db7b-89b37789f488	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5612-2f19-4425-c6819bef7ff9	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5612-2f19-a058-45e72e5d3418	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5612-2f19-55b2-6fd4c91f9bc2	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5612-2f19-a355-0156c9c54e30	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5612-2f19-f45c-0d0df5d1367f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5612-2f19-382b-e1b011a81ad1	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5612-2f19-ac85-499e075755c7	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5612-2f19-ac78-2aca3e9c972c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5612-2f19-a02a-b18a8d6af37d	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5612-2f19-072b-72ab485317d5	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5612-2f19-efca-4766a5c65feb	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5612-2f19-2224-8439535c26f7	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5612-2f19-5cb7-b0b15683585a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3032 (class 0 OID 21229626)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5612-2f19-ac8b-a421eab67f8b	01	Velika predstava	f	1.00	1.00
002b0000-5612-2f19-e4ee-94f51a0aa895	02	Mala predstava	f	0.50	0.50
002b0000-5612-2f19-0e9d-70793ce4a1d6	03	Mala koprodukcija	t	0.40	1.00
002b0000-5612-2f19-5bc2-f2e715208036	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5612-2f19-47b8-0aa71e702feb	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2985 (class 0 OID 21229020)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21228867)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5612-2f19-cd36-1bd7d7a3c1a2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6e0cxWntRb6MeKjqIIu8GMkXeYUHC5m	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-3474-ca233abb3a82	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-5eb7-8c86ef9d1398	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-3a67-455382c51b23	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-d3fd-49d75ce9f47e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-0d40-6adfd71d882e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-da87-1792621528eb	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-c5cf-1b33bb9ef031	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-0c15-7d6e5c3697de	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-fc25-3e070f58c9e8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5612-2f1b-c9c4-8d42bb724754	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5612-2f19-61cd-c20e3c8a9e7f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 21229428)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5612-2f1b-9ea1-14adf17d0f4e	00160000-5612-2f1a-213a-b50bbb34584c	\N	00140000-5612-2f19-1154-133ef38b8bd1	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5612-2f1a-9f07-ccbb9918c694
000e0000-5612-2f1b-67f3-25f774fbe9b2	00160000-5612-2f1a-3012-1b2134eaaac0	\N	00140000-5612-2f19-899b-53b47a6bd00c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5612-2f1a-a323-7a7453d4a4f1
000e0000-5612-2f1b-f0ac-d94d00133360	\N	\N	00140000-5612-2f19-899b-53b47a6bd00c	00190000-5612-2f1b-d662-3d6078a27792	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5612-2f1a-9f07-ccbb9918c694
000e0000-5612-2f1b-3f5b-2fa8a393df3f	\N	\N	00140000-5612-2f19-899b-53b47a6bd00c	00190000-5612-2f1b-d662-3d6078a27792	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5612-2f1a-9f07-ccbb9918c694
000e0000-5612-2f1b-7566-bf25c676dcd3	\N	\N	00140000-5612-2f19-899b-53b47a6bd00c	00190000-5612-2f1b-d662-3d6078a27792	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5612-2f1a-0201-37aa2d2c303a
000e0000-5612-2f1b-b617-a35ce05192c6	\N	\N	00140000-5612-2f19-899b-53b47a6bd00c	00190000-5612-2f1b-d662-3d6078a27792	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5612-2f1a-0201-37aa2d2c303a
\.


--
-- TOC entry 2992 (class 0 OID 21229111)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5612-2f1b-ba47-019fe080637c	000e0000-5612-2f1b-67f3-25f774fbe9b2	\N	1	
00200000-5612-2f1b-4f41-0326271633c9	000e0000-5612-2f1b-67f3-25f774fbe9b2	\N	2	
00200000-5612-2f1b-f3e4-832ae3a8b896	000e0000-5612-2f1b-67f3-25f774fbe9b2	\N	3	
00200000-5612-2f1b-2d40-f2dd274bedc7	000e0000-5612-2f1b-67f3-25f774fbe9b2	\N	4	
00200000-5612-2f1b-3a0c-b20742b1cbb6	000e0000-5612-2f1b-67f3-25f774fbe9b2	\N	5	
\.


--
-- TOC entry 3006 (class 0 OID 21229238)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21229351)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5612-2f19-f9f6-43f7c311c94d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5612-2f19-e603-05f7b66fcafb	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5612-2f19-0f64-ac7db793d84b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5612-2f19-5954-0b7917e3e350	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5612-2f19-3bbb-c783c1b65b51	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5612-2f19-d27f-eb74da2316af	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5612-2f19-abbf-31deb6130416	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5612-2f19-d2de-c176d4cdbbd3	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5612-2f19-481d-384767c3bc84	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5612-2f19-500f-32c61808951c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5612-2f19-8396-2368122e1be4	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5612-2f19-da15-3e5c93c961c5	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5612-2f19-5129-1ef06b1506c2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5612-2f19-212b-d43f5d2c6c43	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5612-2f19-2e11-3a144256e7ff	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5612-2f19-da39-1d8c8d2b5332	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5612-2f19-5a39-4f0abaee157e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5612-2f19-76d7-0e725f86c097	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5612-2f19-0dd8-6bf2ea6b1300	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5612-2f19-4637-e61857c9f919	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5612-2f19-2a89-abff1caad840	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5612-2f19-1a39-e13e8eaad4bd	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5612-2f19-4bf2-69084de3954d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5612-2f19-bbe9-b572b6330417	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5612-2f19-d672-0d963cfcf3a8	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5612-2f19-6589-e12fc78e120a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5612-2f19-0997-272340163ecc	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5612-2f19-51ef-9983e1ded7bd	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3035 (class 0 OID 21229673)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21229645)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21229685)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21229310)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5612-2f1b-7c52-2580b0b51d63	00090000-5612-2f1b-9f72-a8c27f5f1bcc	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-2f1b-95df-02c4eec19432	00090000-5612-2f1b-a68c-861e174d8244	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-2f1b-306a-1a1caa5ccb14	00090000-5612-2f1b-4a67-0d356d4d4a74	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-2f1b-47b8-29160f9c6dd5	00090000-5612-2f1b-ba66-cccdffd6144d	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-2f1b-77d8-2c4b72c4348f	00090000-5612-2f1b-0ea4-34a07f85944f	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-2f1b-52ed-98d7849a977d	00090000-5612-2f1b-46f2-26a272df1c7a	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2994 (class 0 OID 21229146)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21229418)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5612-2f19-1154-133ef38b8bd1	01	Drama	drama (SURS 01)
00140000-5612-2f19-f83d-f9ebb1bf73bb	02	Opera	opera (SURS 02)
00140000-5612-2f19-e915-7715c1c46eaa	03	Balet	balet (SURS 03)
00140000-5612-2f19-c125-d1b177c396c2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5612-2f19-6438-07cb46543f15	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5612-2f19-899b-53b47a6bd00c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5612-2f19-ed89-b9c7749cf598	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3012 (class 0 OID 21229300)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2499 (class 2606 OID 21228921)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 21229477)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21229467)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21229334)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21229376)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21229725)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21229135)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21229156)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21229643)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21229046)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 21229534)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21229296)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21229109)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21229084)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21229060)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21229203)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 21229702)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 21229709)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 21229733)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2611 (class 2606 OID 21229230)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21229018)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 21228930)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21228954)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 21228910)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2490 (class 2606 OID 21228895)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21229236)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21229272)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21229413)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21228982)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21229006)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21229595)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 21229209)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 21228996)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 21229097)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 21229221)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 21229604)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21229612)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 21229582)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 21229624)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 21229254)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 21229194)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21229185)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 21229400)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 21229327)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21229072)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21228866)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21229263)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21228884)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2492 (class 2606 OID 21228904)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 21229281)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21229216)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21229165)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21228854)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21228842)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21228836)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21229347)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 21228963)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21229176)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21229387)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21229636)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 21229031)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21228879)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21229446)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21229119)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21229244)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21229359)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21229683)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 21229667)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21229691)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21229318)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 21229150)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21229426)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 21229308)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 21229144)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2564 (class 1259 OID 21229145)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2565 (class 1259 OID 21229143)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2566 (class 1259 OID 21229142)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 21229141)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2653 (class 1259 OID 21229348)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2654 (class 1259 OID 21229349)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 21229350)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 21229704)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 21229703)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2513 (class 1259 OID 21228984)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 21229237)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 21229671)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 21229670)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 21229672)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 21229669)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 21229668)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 21229223)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 21229222)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 21229120)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 21229297)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 21229299)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 21229298)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2538 (class 1259 OID 21229062)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21229061)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2717 (class 1259 OID 21229625)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2669 (class 1259 OID 21229415)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 21229416)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 21229417)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 21229692)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2678 (class 1259 OID 21229451)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2679 (class 1259 OID 21229448)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2680 (class 1259 OID 21229452)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2681 (class 1259 OID 21229450)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2682 (class 1259 OID 21229449)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2528 (class 1259 OID 21229033)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 21229032)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2504 (class 1259 OID 21228957)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 21229264)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 21228911)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2495 (class 1259 OID 21228912)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 21229284)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 21229283)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 21229282)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 21229098)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 21229099)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 21228844)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 21229189)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 21229187)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 21229186)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 21229188)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 21228885)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 21228886)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 21229245)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 21229726)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2651 (class 1259 OID 21229336)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 21229335)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2750 (class 1259 OID 21229734)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 21229735)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 21229210)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 21229328)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 21229329)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 21229539)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2700 (class 1259 OID 21229538)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2701 (class 1259 OID 21229535)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21229536)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2703 (class 1259 OID 21229537)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2517 (class 1259 OID 21228998)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 21228997)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2519 (class 1259 OID 21228999)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 21229258)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 21229257)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 21229605)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2710 (class 1259 OID 21229606)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2692 (class 1259 OID 21229481)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 21229482)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2694 (class 1259 OID 21229479)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2695 (class 1259 OID 21229480)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 21229319)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 21229198)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 21229197)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 21229195)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 21229196)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2688 (class 1259 OID 21229469)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 21229468)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 21229073)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2545 (class 1259 OID 21229087)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2546 (class 1259 OID 21229086)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2547 (class 1259 OID 21229085)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2548 (class 1259 OID 21229088)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2557 (class 1259 OID 21229110)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 21229596)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2725 (class 1259 OID 21229644)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 21229710)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 21229711)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2500 (class 1259 OID 21228932)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 21228931)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2509 (class 1259 OID 21228964)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 21228965)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 21229151)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 21229179)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 21229178)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 21229177)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2568 (class 1259 OID 21229137)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 21229138)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 21229136)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 21229140)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2572 (class 1259 OID 21229139)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2516 (class 1259 OID 21228983)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 21229047)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 21229049)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2536 (class 1259 OID 21229048)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2537 (class 1259 OID 21229050)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 21229204)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21229414)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21229447)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 21229388)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 21229389)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2507 (class 1259 OID 21228955)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 21228956)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 21229309)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 21228855)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21229019)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 21228843)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2722 (class 1259 OID 21229637)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 21229256)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 21229255)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 21229478)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 21229007)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 21229427)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21229684)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2715 (class 1259 OID 21229613)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 21229614)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 21229377)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2580 (class 1259 OID 21229166)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 21228905)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2784 (class 2606 OID 21229866)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 21229871)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2779 (class 2606 OID 21229891)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2785 (class 2606 OID 21229861)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 21229881)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 21229886)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 21229876)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 21230056)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2819 (class 2606 OID 21230061)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 21230066)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 21230231)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 21230226)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 21229791)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 21229976)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 21230211)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 21230206)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 21230216)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 21230201)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2850 (class 2606 OID 21230196)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2800 (class 2606 OID 21229971)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 21229966)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 21229856)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21230016)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 21230026)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2811 (class 2606 OID 21230021)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 21229826)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 21229821)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 21229956)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 21230186)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 21230071)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 21230076)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 21230081)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 21230221)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 21230101)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2828 (class 2606 OID 21230086)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 21230106)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 21230096)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 21230091)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 21229816)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 21229811)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 21229776)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2762 (class 2606 OID 21229771)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21229996)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 21229751)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 21229756)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 21230011)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2808 (class 2606 OID 21230006)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 21230001)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2776 (class 2606 OID 21229841)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 21229846)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 21229736)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 21229931)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2792 (class 2606 OID 21229921)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2793 (class 2606 OID 21229916)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2791 (class 2606 OID 21229926)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 21229741)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 21229746)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2803 (class 2606 OID 21229981)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2856 (class 2606 OID 21230246)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 21230051)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21230046)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2858 (class 2606 OID 21230251)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2857 (class 2606 OID 21230256)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 21229961)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2815 (class 2606 OID 21230036)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2814 (class 2606 OID 21230041)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21230161)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 21230156)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2839 (class 2606 OID 21230141)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21230146)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2837 (class 2606 OID 21230151)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2767 (class 2606 OID 21229801)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 21229796)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 21229806)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21229991)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2805 (class 2606 OID 21229986)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 21230171)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 21230176)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2832 (class 2606 OID 21230131)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 21230136)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2834 (class 2606 OID 21230121)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2833 (class 2606 OID 21230126)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2813 (class 2606 OID 21230031)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 21229951)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2795 (class 2606 OID 21229946)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2797 (class 2606 OID 21229936)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2796 (class 2606 OID 21229941)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 21230116)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 21230111)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 21229831)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2774 (class 2606 OID 21229836)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21229851)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 21230166)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2843 (class 2606 OID 21230181)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21230191)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2855 (class 2606 OID 21230236)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2854 (class 2606 OID 21230241)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2759 (class 2606 OID 21229766)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 21229761)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2764 (class 2606 OID 21229781)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 21229786)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 21229896)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21229911)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 21229906)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 21229901)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-05 10:04:45 CEST

--
-- PostgreSQL database dump complete
--

