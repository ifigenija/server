--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-15 16:41:08 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 247 (class 3079 OID 3264641)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 247
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 4427274)
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
-- TOC entry 228 (class 1259 OID 4427811)
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
-- TOC entry 223 (class 1259 OID 4427741)
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
-- TOC entry 227 (class 1259 OID 4427804)
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
-- TOC entry 229 (class 1259 OID 4427824)
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
-- TOC entry 240 (class 1259 OID 4428058)
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
-- TOC entry 201 (class 1259 OID 4427520)
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
-- TOC entry 202 (class 1259 OID 4427545)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 4428033)
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
-- TOC entry 190 (class 1259 OID 4427395)
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
-- TOC entry 234 (class 1259 OID 4427940)
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer DEFAULT 0,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
-- TOC entry 231 (class 1259 OID 4427852)
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
-- TOC entry 196 (class 1259 OID 4427472)
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
-- TOC entry 194 (class 1259 OID 4427446)
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
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 170 (class 1259 OID 4211950)
-- Name: job_datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job_datoteka (
    job_id uuid NOT NULL,
    datoteka_id uuid NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 4427434)
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
-- TOC entry 213 (class 1259 OID 4427641)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 4428073)
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
-- TOC entry 242 (class 1259 OID 4428085)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 4428092)
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
-- TOC entry 216 (class 1259 OID 4427661)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 186 (class 1259 OID 4427339)
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
-- TOC entry 184 (class 1259 OID 4427318)
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
-- TOC entry 188 (class 1259 OID 4427376)
-- Name: organizacijskaenota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizacijskaenota (
    id uuid NOT NULL,
    parent_id uuid,
    vodja_id uuid,
    namestnik_id uuid,
    sifra character varying(2) DEFAULT NULL::character varying,
    naziv character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4427351)
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
-- TOC entry 180 (class 1259 OID 4427265)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4427258)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4427624)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 4427582)
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
-- TOC entry 222 (class 1259 OID 4427724)
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
-- TOC entry 182 (class 1259 OID 4427283)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
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
-- TOC entry 192 (class 1259 OID 4427426)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 4428019)
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
-- TOC entry 206 (class 1259 OID 4427576)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 4427303)
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
-- TOC entry 200 (class 1259 OID 4427509)
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
-- TOC entry 204 (class 1259 OID 4427563)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 4428048)
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
-- TOC entry 238 (class 1259 OID 4428040)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 4427879)
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
    stpremiervelikih integer DEFAULT 0,
    stpremiermalih integer DEFAULT 0,
    stpremiermalihkopr integer DEFAULT 0,
    stpremiervelikihkopr integer DEFAULT 0,
    stpremiersredkopr integer DEFAULT 0,
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
-- TOC entry 235 (class 1259 OID 4428008)
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
-- TOC entry 209 (class 1259 OID 4427599)
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
-- TOC entry 208 (class 1259 OID 4427590)
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
-- TOC entry 212 (class 1259 OID 4427631)
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
-- TOC entry 218 (class 1259 OID 4427682)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 4427714)
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
-- TOC entry 195 (class 1259 OID 4427461)
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
-- TOC entry 177 (class 1259 OID 4427239)
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
-- TOC entry 176 (class 1259 OID 4427237)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 215 (class 1259 OID 4427655)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4427248)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4427230)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 4427612)
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
-- TOC entry 205 (class 1259 OID 4427570)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4427493)
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
-- TOC entry 171 (class 1259 OID 4427193)
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
-- TOC entry 172 (class 1259 OID 4427204)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 4427212)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 4427668)
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
-- TOC entry 189 (class 1259 OID 4427387)
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
-- TOC entry 203 (class 1259 OID 4427550)
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
-- TOC entry 220 (class 1259 OID 4427702)
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
-- TOC entry 185 (class 1259 OID 4427329)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    sort integer
);


--
-- TOC entry 232 (class 1259 OID 4427867)
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
-- TOC entry 191 (class 1259 OID 4427412)
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
-- TOC entry 174 (class 1259 OID 4427217)
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
-- TOC entry 225 (class 1259 OID 4427768)
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
-- TOC entry 197 (class 1259 OID 4427483)
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
-- TOC entry 214 (class 1259 OID 4427647)
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
-- TOC entry 219 (class 1259 OID 4427693)
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
-- TOC entry 245 (class 1259 OID 4428129)
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
-- TOC entry 244 (class 1259 OID 4428101)
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
-- TOC entry 246 (class 1259 OID 4428141)
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
-- TOC entry 226 (class 1259 OID 4427793)
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
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 199 (class 1259 OID 4427503)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 224 (class 1259 OID 4427758)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 230 (class 1259 OID 4427842)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2215 (class 2604 OID 4427242)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3036 (class 0 OID 4427274)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 4427811)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561f-6b34-843e-16a436f0994a	000d0000-561f-6b34-60bb-ba1d3c857b6b	\N	00090000-561f-6b33-a7fb-7e922a7d4f49	000b0000-561f-6b33-58cc-c9a867ad3a8f	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561f-6b34-9b72-58e0e81dec74	000d0000-561f-6b34-2430-07071d85e36b	00100000-561f-6b33-710b-ecbd4b702b95	00090000-561f-6b33-19e6-510da508e11e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561f-6b34-899d-dd1da0735eb5	000d0000-561f-6b34-9deb-1197ebaca506	00100000-561f-6b33-295e-55acfe4abd12	00090000-561f-6b33-6a22-3013b8014cbc	\N	0003	t	\N	2015-10-15	\N	2	t	\N	f	f
000c0000-561f-6b34-8c2f-8adbb88ddf44	000d0000-561f-6b34-37d1-7fadc37e0c81	\N	00090000-561f-6b33-226c-9b7e4d5a7ca4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561f-6b34-e60a-0dfd7d23fb8a	000d0000-561f-6b34-8744-de7386c08b7e	\N	00090000-561f-6b33-2e69-c54a3dc8b4a5	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561f-6b34-a4bc-b7a4b785a78c	000d0000-561f-6b34-b15e-b0553643b69f	\N	00090000-561f-6b33-cd5e-dfd7da20729b	000b0000-561f-6b33-b39c-4ee7ca58ddc4	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561f-6b34-7f28-1711afc53d26	000d0000-561f-6b34-2762-e5ac0c83127b	00100000-561f-6b33-a428-2dc861ab1c17	00090000-561f-6b33-30d2-d29f8bbf8fbe	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561f-6b34-afd1-92c0feaa0183	000d0000-561f-6b34-8dac-0c9418a9c01a	\N	00090000-561f-6b33-ebfb-d08ee085437b	000b0000-561f-6b33-d8ff-a4a58fdc5cf3	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561f-6b34-bea7-9b263d493b8d	000d0000-561f-6b34-2762-e5ac0c83127b	00100000-561f-6b33-084d-b9d73891a53b	00090000-561f-6b33-cc65-b7863b2b3758	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561f-6b34-f86a-339145cba04b	000d0000-561f-6b34-2762-e5ac0c83127b	00100000-561f-6b33-fc85-9020ad28b716	00090000-561f-6b33-b492-e0ebfa214ec9	\N	0010	t	\N	2015-10-15	\N	16	f	\N	f	t
000c0000-561f-6b34-b4d0-a879594b6fdb	000d0000-561f-6b34-2762-e5ac0c83127b	00100000-561f-6b33-9ee7-ab4583c9f539	00090000-561f-6b33-0de0-b2a05cda3074	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561f-6b34-53f5-bf1d6e307fdf	000d0000-561f-6b34-82f2-e246725ef145	\N	00090000-561f-6b33-19e6-510da508e11e	000b0000-561f-6b33-555b-ee87cfb1a66e	0012	f	\N	\N	\N	2	t	\N	t	t
000c0000-561f-98da-ab2a-f33f81065540	000d0000-561f-98d5-57bc-07d2a2452cbd	00100000-561f-6b33-710b-ecbd4b702b95	00090000-561f-6b33-19e6-510da508e11e	\N	1001	t	\N	\N	\N	0	t	t	f	t
\.


--
-- TOC entry 3078 (class 0 OID 4427741)
-- Dependencies: 223
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 4427804)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561f-6b33-ee42-da572d6be7fd	00160000-561f-6b33-1099-4230fdf361fe	00090000-561f-6b33-280d-f83470274ad1	aizv	10	t
003d0000-561f-6b33-17f5-3144820046e8	00160000-561f-6b33-1099-4230fdf361fe	00090000-561f-6b33-4444-22f9f6c3ba06	apri	14	t
003d0000-561f-6b33-6ea8-2f36a6d89672	00160000-561f-6b33-3e01-870a29f25c04	00090000-561f-6b33-b736-5fb586ad3f0f	aizv	11	t
003d0000-561f-6b33-2d58-05a7acb448eb	00160000-561f-6b33-9904-2d64985f6a1d	00090000-561f-6b33-f9e8-774825a0e2c5	aizv	12	t
003d0000-561f-6b33-60e1-b62134fd3fe8	00160000-561f-6b33-1099-4230fdf361fe	00090000-561f-6b33-25a1-331b622ccaac	apri	18	f
\.


--
-- TOC entry 3084 (class 0 OID 4427824)
-- Dependencies: 229
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561f-6b33-1099-4230fdf361fe	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561f-6b33-3e01-870a29f25c04	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561f-6b33-9904-2d64985f6a1d	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3095 (class 0 OID 4428058)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 4427520)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561f-6b34-59c9-dd47ed203b71	\N	\N	00200000-561f-6b34-c8ac-54f96bda3bf8	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561f-6b34-842d-f565fbd6490c	\N	\N	00200000-561f-6b34-2778-bed9c87627c8	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561f-6b34-01cd-28e35d9efbfa	\N	\N	00200000-561f-6b34-13c5-77286bb3ba35	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561f-6b34-8caf-dd0c58beb1ab	\N	\N	00200000-561f-6b34-a176-e67d015052b5	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561f-6b34-a6f2-93071d4b7ce9	\N	\N	00200000-561f-6b34-5552-00d3b33c2d50	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3057 (class 0 OID 4427545)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 4428033)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3045 (class 0 OID 4427395)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561f-6b31-60b1-25a747ecc254	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561f-6b31-0fd7-f82bbda057ab	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561f-6b31-3669-aea5790e7f79	AL	ALB	008	Albania 	Albanija	\N
00040000-561f-6b31-8a2f-3502217cb061	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561f-6b31-16ff-f97204559912	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561f-6b31-a54a-592727095331	AD	AND	020	Andorra 	Andora	\N
00040000-561f-6b31-9639-7811587be19f	AO	AGO	024	Angola 	Angola	\N
00040000-561f-6b31-1796-f94c32ab7e11	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561f-6b31-5a54-10d32940c4c0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561f-6b31-9462-4951862296be	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-6b31-f226-c81f1b3f2a8d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561f-6b31-d342-535ecc1233ff	AM	ARM	051	Armenia 	Armenija	\N
00040000-561f-6b31-d998-0fa09124125a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561f-6b31-cbc7-062827921091	AU	AUS	036	Australia 	Avstralija	\N
00040000-561f-6b31-5018-aa0807971af4	AT	AUT	040	Austria 	Avstrija	\N
00040000-561f-6b31-1bd3-af658fca2b1e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561f-6b31-b123-9e4212fb0444	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561f-6b31-e2e6-cf0e234f7958	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561f-6b31-327b-c89a057bb769	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561f-6b31-e865-ddb078719b0d	BB	BRB	052	Barbados 	Barbados	\N
00040000-561f-6b31-822a-4c59e4cbf888	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561f-6b31-58f6-29eb0fc3c2fe	BE	BEL	056	Belgium 	Belgija	\N
00040000-561f-6b31-9210-c61c23c168b8	BZ	BLZ	084	Belize 	Belize	\N
00040000-561f-6b31-1620-b8fc900189fa	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561f-6b31-5638-552bb4921ce6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561f-6b31-b033-dc9edf2a32aa	BT	BTN	064	Bhutan 	Butan	\N
00040000-561f-6b31-42e7-c8a03cf28008	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561f-6b31-0395-ebdd17dd576a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561f-6b31-3ebf-2b18c7e7cb1f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561f-6b31-cec4-3c776920eb98	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561f-6b31-e1b6-9419d1f27781	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561f-6b31-823f-4086d541fbcc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561f-6b31-3bf6-3854ab18f216	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561f-6b31-dfb1-3c16102b29a6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561f-6b31-2535-a8d1fd0c911e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561f-6b31-281d-1fd8d22d2ab6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561f-6b31-6da5-4e06a23ff35e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561f-6b31-1055-84e1a5eae051	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561f-6b31-dbac-f1bdc33c12fb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561f-6b31-77e9-5bb6a49b7bd4	CA	CAN	124	Canada 	Kanada	\N
00040000-561f-6b31-5e6c-6409393cd26c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561f-6b31-e37f-938f950c9423	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561f-6b31-fc1d-ddb033d487c6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561f-6b31-3a15-bc4f67bf6550	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561f-6b31-300e-ef651c8793fe	CL	CHL	152	Chile 	Čile	\N
00040000-561f-6b31-6d94-5fdc21cf6e85	CN	CHN	156	China 	Kitajska	\N
00040000-561f-6b31-aa66-5f9334a3b060	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561f-6b31-a261-235427a1aaee	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561f-6b31-eae2-ef563a585a2b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561f-6b31-0774-20cfb0944c88	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561f-6b31-195e-a90f63d23494	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561f-6b31-77a2-875729583728	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561f-6b31-fa7d-3ee283517fae	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561f-6b31-ce74-8787741a509d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561f-6b31-cbcc-7db5107fa0d6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561f-6b31-fe84-a521e3961adf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561f-6b31-8910-8ab9a7c155d8	CU	CUB	192	Cuba 	Kuba	\N
00040000-561f-6b31-8769-c3baba718f00	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561f-6b31-17c2-eae25761e644	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561f-6b31-4014-3831da4fc9e1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561f-6b31-5830-2e5b28a826eb	DK	DNK	208	Denmark 	Danska	\N
00040000-561f-6b31-2330-883c7fd9bb32	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561f-6b31-f51c-779df0609ce3	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-6b31-6345-c6f6dc9012ed	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561f-6b31-f538-e1a397253c33	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561f-6b31-afb4-63d19e986501	EG	EGY	818	Egypt 	Egipt	\N
00040000-561f-6b31-f3b0-550abfdc5ebc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561f-6b31-5c67-627b6705076b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561f-6b31-7f13-61d35e162d30	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561f-6b31-3cd8-c7b091cf5deb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561f-6b31-f43f-ca0cf5396edb	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561f-6b31-da24-1f7a0f0b85a2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561f-6b31-f9e4-c074dfdfed30	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561f-6b31-7a61-fb1837d8189f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561f-6b31-7178-bc330ec85592	FI	FIN	246	Finland 	Finska	\N
00040000-561f-6b31-683f-57ad2aede1e1	FR	FRA	250	France 	Francija	\N
00040000-561f-6b31-f7a3-a47a518b1611	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561f-6b31-3a6f-363c811fa607	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561f-6b31-d7e5-6bdd87c6001b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561f-6b31-ae95-c142457022c2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561f-6b31-c379-abd5a16710c2	GA	GAB	266	Gabon 	Gabon	\N
00040000-561f-6b31-6fdb-a33e6c9437a5	GM	GMB	270	Gambia 	Gambija	\N
00040000-561f-6b31-3024-b22b57b3d5a7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561f-6b31-86da-047e4b2041ac	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561f-6b31-3895-1c4de98245bf	GH	GHA	288	Ghana 	Gana	\N
00040000-561f-6b31-7023-fd6d27cff31e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561f-6b31-bfc9-80620088c71d	GR	GRC	300	Greece 	Grčija	\N
00040000-561f-6b31-f183-1374f2309b89	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561f-6b31-eeea-e74fb2fc1b01	GD	GRD	308	Grenada 	Grenada	\N
00040000-561f-6b31-3a5f-1a40f46beca0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561f-6b31-ffff-9d2c8eece13e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561f-6b31-11e5-26122e0cc140	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561f-6b31-981a-8760c60e8584	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561f-6b31-39bb-b7f4e7cdad1e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561f-6b31-9a0b-8b11b05d1667	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561f-6b31-c89f-12ff9d6a9937	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561f-6b31-c2f1-cc2e70d3578b	HT	HTI	332	Haiti 	Haiti	\N
00040000-561f-6b31-ce35-6746540515d8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561f-6b31-958a-f667400e5acb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561f-6b31-3313-16a3b3494ad3	HN	HND	340	Honduras 	Honduras	\N
00040000-561f-6b31-99b0-7b786e23dcc3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561f-6b31-06d4-26de77072bd9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561f-6b31-02ab-35e75806967c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561f-6b31-1dba-2fea77b1dab4	IN	IND	356	India 	Indija	\N
00040000-561f-6b31-4399-c4e7b82ee0ab	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561f-6b31-c22f-e3f215e36ca2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561f-6b31-4f85-49dbc5d97580	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561f-6b31-ffb8-53c959422b6a	IE	IRL	372	Ireland 	Irska	\N
00040000-561f-6b31-7cde-52577f7c3dad	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561f-6b31-7965-8e57dfea60f3	IL	ISR	376	Israel 	Izrael	\N
00040000-561f-6b31-6ac3-025bf800ebc2	IT	ITA	380	Italy 	Italija	\N
00040000-561f-6b31-7bb4-9bf84d34e835	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561f-6b31-ff66-30caf947cd82	JP	JPN	392	Japan 	Japonska	\N
00040000-561f-6b31-27da-32ede4563cb3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561f-6b31-f545-ebdaf39ce59e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561f-6b31-ba36-b5e8b870baa9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561f-6b31-9d65-9dbbca5ffc79	KE	KEN	404	Kenya 	Kenija	\N
00040000-561f-6b31-6210-366c0e8396c4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561f-6b31-7d85-f1cb5c5788ba	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561f-6b31-0254-83c7156d75a4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561f-6b31-713d-d558da5f8cb4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561f-6b31-c3ea-1139d8e1619a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561f-6b31-9b52-f073d6e9591c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561f-6b31-0a82-f96f419379c4	LV	LVA	428	Latvia 	Latvija	\N
00040000-561f-6b31-7247-e5c93dc06a63	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561f-6b31-e6ea-36a9d30f5c04	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561f-6b31-7f8c-48fb68a426cc	LR	LBR	430	Liberia 	Liberija	\N
00040000-561f-6b31-60a6-4fbb731df9f0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561f-6b31-732f-005711a21ba2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561f-6b31-21bd-47a1329dd0d0	LT	LTU	440	Lithuania 	Litva	\N
00040000-561f-6b31-e6bf-89637da38e2b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561f-6b31-1575-200c0e80ea28	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561f-6b31-3e0d-4953119e4a36	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561f-6b31-f75a-eb5057509dd3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561f-6b31-1d84-47052c434483	MW	MWI	454	Malawi 	Malavi	\N
00040000-561f-6b31-957d-045fe18a7d60	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561f-6b31-1395-8ccd78a7fd06	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561f-6b31-d37e-eb08efe0fbf9	ML	MLI	466	Mali 	Mali	\N
00040000-561f-6b31-8ae8-6fbe0d0617b2	MT	MLT	470	Malta 	Malta	\N
00040000-561f-6b31-efad-a0211890678f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561f-6b31-da5f-9d8d2fcb3bea	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561f-6b31-14b4-f816b1c60fcb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561f-6b31-9fdf-21812d7c2dbf	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561f-6b31-1bc2-f2c4e4c1fe51	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561f-6b31-cda6-815f6d5dc803	MX	MEX	484	Mexico 	Mehika	\N
00040000-561f-6b31-f64c-948a08d75a49	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561f-6b31-88bb-5b75c0a1bf7d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561f-6b31-60fe-a6a0b35ed954	MC	MCO	492	Monaco 	Monako	\N
00040000-561f-6b31-60a0-6207819e9ca8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561f-6b31-1eee-a1ca91c3cc95	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561f-6b31-44c7-5c90a3e4c89c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561f-6b31-8dd8-ec484b81caf6	MA	MAR	504	Morocco 	Maroko	\N
00040000-561f-6b31-8e65-5e97de603971	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561f-6b31-7dac-0f1144394e94	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561f-6b31-2096-1bd9a176385d	NA	NAM	516	Namibia 	Namibija	\N
00040000-561f-6b31-cb95-deefaaa3c89b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561f-6b31-afde-530556529fd0	NP	NPL	524	Nepal 	Nepal	\N
00040000-561f-6b31-893c-3626adbaa8e8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561f-6b31-4e6b-ca321e1be227	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561f-6b31-e760-39829e941d2f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561f-6b31-889b-403688dbba87	NE	NER	562	Niger 	Niger 	\N
00040000-561f-6b31-d4b1-7378e0e34932	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561f-6b31-85bd-9cb38d2c4a8a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561f-6b31-a58b-1d9e39a927af	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561f-6b31-9e26-41454d12c61a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561f-6b31-c154-263cbe40fbe0	NO	NOR	578	Norway 	Norveška	\N
00040000-561f-6b31-f025-61fa81157b9b	OM	OMN	512	Oman 	Oman	\N
00040000-561f-6b31-44b9-9002e9bcc6d4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561f-6b31-71a7-70de8c680c57	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561f-6b31-a626-381dcb028b89	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561f-6b31-f117-3e6f025ec8c5	PA	PAN	591	Panama 	Panama	\N
00040000-561f-6b31-3857-2df642932d84	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561f-6b31-6c52-ac4d0265a873	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561f-6b31-82e7-d39ea684fcd7	PE	PER	604	Peru 	Peru	\N
00040000-561f-6b31-4e45-f1f5421a52d6	PH	PHL	608	Philippines 	Filipini	\N
00040000-561f-6b31-2c01-115e3e56f39d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561f-6b31-cbe8-5c58d4ad8079	PL	POL	616	Poland 	Poljska	\N
00040000-561f-6b31-7c25-ff95f17541e4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561f-6b31-45d9-d461dcbd15a2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561f-6b31-8c3b-2760a49a5d62	QA	QAT	634	Qatar 	Katar	\N
00040000-561f-6b31-67f6-8040bf02ce3d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561f-6b31-4b63-ec22e7ccf2ce	RO	ROU	642	Romania 	Romunija	\N
00040000-561f-6b31-dc09-bb6af21ff3e8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561f-6b31-0507-e9384567389b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561f-6b31-41a3-20b2d4e24b01	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561f-6b31-3f52-570da32a058b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561f-6b31-758b-2c290e6438f6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561f-6b31-8426-fc60b956e817	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561f-6b31-f9c5-edce0959a5a9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561f-6b31-05cb-ca0ea89d073d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561f-6b31-7c1c-1eda5b2945a4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561f-6b31-4f03-cfd1b1c4601b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561f-6b31-8929-71f1c8148a1b	SM	SMR	674	San Marino 	San Marino	\N
00040000-561f-6b31-5e97-f95abed799cd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561f-6b31-1bb4-e5acfd85f09f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561f-6b31-2796-05f2236490e0	SN	SEN	686	Senegal 	Senegal	\N
00040000-561f-6b31-8b6e-6adfabcdd541	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561f-6b31-1034-c0262dc105fe	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561f-6b31-e0f3-dec009518e33	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561f-6b31-f80a-ec06f02746f6	SG	SGP	702	Singapore 	Singapur	\N
00040000-561f-6b31-f89c-1e0a73270a06	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561f-6b31-04a0-a1958e6fb66a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561f-6b31-8f84-70dee20f309a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561f-6b31-724f-806ca39f6f47	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561f-6b31-c98f-def43c139548	SO	SOM	706	Somalia 	Somalija	\N
00040000-561f-6b31-de2a-80ddb7c7784c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561f-6b31-4a69-900c1c6720e9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561f-6b31-9a37-450bd1a384cb	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561f-6b31-f819-4ae509d52f8d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561f-6b31-f005-dc6bdbed718d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561f-6b31-3090-a45e5c993760	SD	SDN	729	Sudan 	Sudan	\N
00040000-561f-6b31-39fc-d8017b708667	SR	SUR	740	Suriname 	Surinam	\N
00040000-561f-6b31-75e8-d7225df2ab00	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561f-6b31-8faa-7ee60210c62d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561f-6b31-eea5-b746321f7951	SE	SWE	752	Sweden 	Švedska	\N
00040000-561f-6b31-8bd3-bd74c7af8536	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561f-6b31-7a43-9a737b18f2f9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561f-6b31-aafe-7ac17847aed2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561f-6b31-ff2b-1d52e1e2061f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561f-6b31-54c0-de0239bab709	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561f-6b31-fa21-fd42ba2dc655	TH	THA	764	Thailand 	Tajska	\N
00040000-561f-6b31-73c5-cf9f0cd9defa	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561f-6b31-4ca4-5f69b70d5b43	TG	TGO	768	Togo 	Togo	\N
00040000-561f-6b31-7ae1-d4f807b2a681	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561f-6b31-52b4-22de5a076d69	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561f-6b31-c6c6-769d5eb330bd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561f-6b31-e3cb-1b9935388f42	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561f-6b31-8380-d4fe74f7cba3	TR	TUR	792	Turkey 	Turčija	\N
00040000-561f-6b31-e0ca-afde33ebb7b3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561f-6b31-63fe-e035253ea102	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-6b31-1bb3-4800624ebfe0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561f-6b31-9cde-c2bbfb2b99e7	UG	UGA	800	Uganda 	Uganda	\N
00040000-561f-6b31-cd8d-e0ef60148f65	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561f-6b31-dfea-28f4a3df99c1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561f-6b31-29e1-8c704c2a4b3d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561f-6b31-9e9c-b445d89399f7	US	USA	840	United States 	Združene države Amerike	\N
00040000-561f-6b31-fedc-6af8cfe56d6a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561f-6b31-12e7-92e2eac3e454	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561f-6b31-24e1-dbe4740a8f44	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561f-6b31-9fce-c08e913f68b6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561f-6b31-5928-46b35e425e38	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561f-6b31-dbd2-07df058e44d5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561f-6b31-6107-a106df8bccba	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-6b31-dc71-4154d9819b6c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561f-6b31-2621-8ba11c9b87a1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561f-6b31-8b88-2f7f0661e2a6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561f-6b31-2178-08d7f54ff130	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561f-6b31-1b39-a0686dcc2fb3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561f-6b31-0e4e-520274471bc5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3089 (class 0 OID 4427940)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-561f-6b34-c75b-61c4ea200071	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561f-6b34-2ecb-ad3c28d37243	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-6b34-692a-92ed6f413057	000e0000-561f-6b33-61ec-251290f9ac0d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-6b32-f2b6-68ccad81cd6d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-6b34-e5e1-02f64e6ea761	000e0000-561f-6b33-1be5-b9b135325a94	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-6b32-8669-fea61bba924c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-6b34-ef7f-4492a8b82407	000e0000-561f-6b33-35bf-707aa163510f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-6b32-f2b6-68ccad81cd6d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3086 (class 0 OID 4427852)
-- Dependencies: 231
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561f-6b34-60bb-ba1d3c857b6b	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-843e-16a436f0994a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-6b32-ee9d-b4da5fb42c56
000d0000-561f-6b34-2430-07071d85e36b	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-9b72-58e0e81dec74	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561f-6b32-aba2-5f8a48e9a68c
000d0000-561f-6b34-9deb-1197ebaca506	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-899d-dd1da0735eb5	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561f-6b32-b7bf-c70017a9e435
000d0000-561f-6b34-37d1-7fadc37e0c81	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-8c2f-8adbb88ddf44	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561f-6b32-4a05-9f5ccd934998
000d0000-561f-6b34-8744-de7386c08b7e	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-e60a-0dfd7d23fb8a	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561f-6b32-4a05-9f5ccd934998
000d0000-561f-6b34-b15e-b0553643b69f	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-a4bc-b7a4b785a78c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-6b32-ee9d-b4da5fb42c56
000d0000-561f-6b34-2762-e5ac0c83127b	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-bea7-9b263d493b8d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561f-6b32-ee9d-b4da5fb42c56
000d0000-561f-6b34-8dac-0c9418a9c01a	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-afd1-92c0feaa0183	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561f-6b32-da3f-e42d01253224
000d0000-561f-6b34-82f2-e246725ef145	000e0000-561f-6b33-1be5-b9b135325a94	000c0000-561f-6b34-53f5-bf1d6e307fdf	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561f-6b32-185c-45173dbfcabd
000d0000-561f-98d5-57bc-07d2a2452cbd	000e0000-561f-6b33-48ca-858e93c1a4ca	000c0000-561f-98da-ab2a-f33f81065540	umetnik	f	dfsd			f	1	f	f	0	000f0000-561f-6b32-aba2-5f8a48e9a68c
\.


--
-- TOC entry 3051 (class 0 OID 4427472)
-- Dependencies: 196
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 4427446)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 4211950)
-- Dependencies: 170
-- Data for Name: job_datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job_datoteka (job_id, datoteka_id) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 4427434)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561f-6b33-f667-d01f30363b6d	00080000-561f-6b33-ae61-e8c53518f5b0	00090000-561f-6b33-b492-e0ebfa214ec9	AK		igralka
\.


--
-- TOC entry 3068 (class 0 OID 4427641)
-- Dependencies: 213
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 4428073)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 4428085)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 4428092)
-- Dependencies: 243
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 4427661)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 4427339)
-- Dependencies: 186
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561f-6b32-10b1-d31d49f7ad65	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561f-6b32-269c-456b35107310	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561f-6b32-817f-51c0ef98e6e9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561f-6b32-a8d2-3331b6c46a85	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561f-6b32-2430-4ced233d3110	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561f-6b32-5084-c0cac5dfa0ef	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561f-6b32-3d18-5374f847abd0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561f-6b32-4e97-15609978fc44	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-6b32-bd0a-436f292a9d2b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-6b32-b9d2-75105201df4f	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561f-6b32-0c9d-e155ff9d4067	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561f-6b32-ac6d-59202c7c9421	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561f-6b32-81db-6f439c4bca00	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561f-6b32-0388-a9698f80e4fe	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561f-6b32-c17c-813ccc4c5216	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561f-6b33-2eaa-92c2944f07d0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561f-6b33-42cc-fcc100131a57	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561f-6b33-ec92-40cd8f01326d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561f-6b33-afa9-c4310f082717	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561f-6b33-24ab-b506ddd84bf1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561f-6b35-dcc9-b797f995c92e	application.tenant.maticnopodjetje	string	s:36:"00080000-561f-6b35-da66-5a805c164878";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3039 (class 0 OID 4427318)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561f-6b33-1f39-1b8504b47d9e	00000000-561f-6b33-2eaa-92c2944f07d0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561f-6b33-08e1-d7028fd6ce8e	00000000-561f-6b33-2eaa-92c2944f07d0	00010000-561f-6b32-b8dd-33fdac33919d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561f-6b33-4914-229a2571199b	00000000-561f-6b33-42cc-fcc100131a57	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3043 (class 0 OID 4427376)
-- Dependencies: 188
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 4427351)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561f-6b33-a7fb-7e922a7d4f49	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561f-6b33-226c-9b7e4d5a7ca4	00010000-561f-6b33-ded7-47e94df4f5d4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561f-6b33-6a22-3013b8014cbc	00010000-561f-6b33-76a3-d22b21070325	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561f-6b33-cc65-b7863b2b3758	00010000-561f-6b33-6f43-4cac439d3141	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561f-6b33-7cd9-2dff0e5d6483	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561f-6b33-cd5e-dfd7da20729b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561f-6b33-0de0-b2a05cda3074	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561f-6b33-30d2-d29f8bbf8fbe	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561f-6b33-b492-e0ebfa214ec9	00010000-561f-6b33-7008-22fb714fe371	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561f-6b33-19e6-510da508e11e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561f-6b33-4a4e-30f6aac495cf	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-6b33-2e69-c54a3dc8b4a5	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561f-6b33-ebfb-d08ee085437b	00010000-561f-6b33-e049-2a56c7f6d356	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-6b33-280d-f83470274ad1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-6b33-4444-22f9f6c3ba06	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-6b33-b736-5fb586ad3f0f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-6b33-f9e8-774825a0e2c5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561f-6b33-25a1-331b622ccaac	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561f-a8fb-a7b0-0bd8f06f17c8	\N	\N	1001		Lovro	Žužek			Lovro Žužek			\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3035 (class 0 OID 4427265)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561f-6b32-fef5-8b5ac370f715	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561f-6b32-35f0-4843d582b6dc	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561f-6b32-86de-3b6d28fbd826	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561f-6b32-530e-051256dfb671	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561f-6b32-b1fb-85694ae605c2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561f-6b32-b130-5816bd49b6f9	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561f-6b32-f99b-6ae5de4346b6	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561f-6b32-f526-fd6cdd979868	Abonma-read	Abonma - branje	f
00030000-561f-6b32-9970-d09fd6e92ba1	Abonma-write	Abonma - spreminjanje	f
00030000-561f-6b32-d6b5-11f38da675e6	Alternacija-read	Alternacija - branje	f
00030000-561f-6b32-1a4a-9a6eeeeb56a8	Alternacija-write	Alternacija - spreminjanje	f
00030000-561f-6b32-5643-a60648066881	Arhivalija-read	Arhivalija - branje	f
00030000-561f-6b32-ec41-7439ae03b9f4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561f-6b32-7320-e60e5de4b283	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561f-6b32-a447-38857ac91eef	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561f-6b32-5446-330a16c7950a	Besedilo-read	Besedilo - branje	f
00030000-561f-6b32-e6d8-fda45d9b13cf	Besedilo-write	Besedilo - spreminjanje	f
00030000-561f-6b32-a099-16bdb7ffd164	DogodekIzven-read	DogodekIzven - branje	f
00030000-561f-6b32-d93c-fb163aa99dac	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561f-6b32-5acc-adf82f7581a5	Dogodek-read	Dogodek - branje	f
00030000-561f-6b32-c709-eb5c33c88ab4	Dogodek-write	Dogodek - spreminjanje	f
00030000-561f-6b32-078d-af2ae83b80d3	DrugiVir-read	DrugiVir - branje	f
00030000-561f-6b32-f154-e798b94c1be1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561f-6b32-7f21-20dbb548a85b	Drzava-read	Drzava - branje	f
00030000-561f-6b32-dc7b-7736958e9f73	Drzava-write	Drzava - spreminjanje	f
00030000-561f-6b32-5bef-b832857896e5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561f-6b32-d89a-592373db1c80	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561f-6b32-4a1d-b7d4738c3ea1	Funkcija-read	Funkcija - branje	f
00030000-561f-6b32-2d81-ec8cb20837a0	Funkcija-write	Funkcija - spreminjanje	f
00030000-561f-6b32-9b8d-3b6b4d3918b4	Gostovanje-read	Gostovanje - branje	f
00030000-561f-6b32-49f2-fcf8e6d220b9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561f-6b32-b176-c3c5a49de8fd	Gostujoca-read	Gostujoca - branje	f
00030000-561f-6b32-cc26-163d5b666c24	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561f-6b32-457c-79ee786abbef	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561f-6b32-4edd-d9f7f87471c5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561f-6b32-7cd4-15dea5f11ebd	Kupec-read	Kupec - branje	f
00030000-561f-6b32-ba4a-894a963f53bc	Kupec-write	Kupec - spreminjanje	f
00030000-561f-6b32-421a-a5ce20fcb224	NacinPlacina-read	NacinPlacina - branje	f
00030000-561f-6b32-5546-8b69ad13f893	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561f-6b32-1a4d-cd0d75d6f6dd	Option-read	Option - branje	f
00030000-561f-6b32-f58b-5e01c22e7de3	Option-write	Option - spreminjanje	f
00030000-561f-6b32-d089-36eb72f188b5	OptionValue-read	OptionValue - branje	f
00030000-561f-6b32-ddd7-f0c997f0253d	OptionValue-write	OptionValue - spreminjanje	f
00030000-561f-6b32-e54f-29ec0c0187a1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-561f-6b32-3171-461e03a2d72d	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-561f-6b32-f57c-c0bebd84c19f	Oseba-read	Oseba - branje	f
00030000-561f-6b32-1566-ee14e73ac22c	Oseba-write	Oseba - spreminjanje	f
00030000-561f-6b32-4837-e8e0c3e635ae	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561f-6b32-0a09-b032682f8581	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561f-6b32-9476-8adb4b0e0d57	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561f-6b32-9d49-060ed14954b7	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561f-6b32-a088-565050ef8abe	Pogodba-read	Pogodba - branje	f
00030000-561f-6b32-ff4d-b0e436ccc3f3	Pogodba-write	Pogodba - spreminjanje	f
00030000-561f-6b32-baeb-ad685374e774	Popa-read	Popa - branje	f
00030000-561f-6b32-0101-4e22c2d3660c	Popa-write	Popa - spreminjanje	f
00030000-561f-6b32-0a39-54cc733afce2	Posta-read	Posta - branje	f
00030000-561f-6b32-1d7f-f927712e03f8	Posta-write	Posta - spreminjanje	f
00030000-561f-6b32-e6dd-d1a667f54447	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561f-6b32-d323-996a27df67ae	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561f-6b32-2b82-568ae9cb0943	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561f-6b32-3353-0d8f970cc78d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561f-6b32-fe74-7d5b003e267a	PostniNaslov-read	PostniNaslov - branje	f
00030000-561f-6b32-9c6b-328eac32bc3a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561f-6b32-ded2-5ee4ef4c6695	Predstava-read	Predstava - branje	f
00030000-561f-6b32-dc33-8de9e22a457d	Predstava-write	Predstava - spreminjanje	f
00030000-561f-6b32-6282-f2770e3b9d32	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561f-6b32-d1ce-20735c33cba3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561f-6b32-b2e3-265bddff2d90	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561f-6b32-4560-e65814095ee2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561f-6b32-f77f-977811190d7a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561f-6b32-e24b-5e5dd83cdd8c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561f-6b32-f9a8-687207669a8b	ProgramDela-read	ProgramDela - branje	f
00030000-561f-6b32-3341-bb688ebaaee9	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561f-6b32-4387-ee57244f0fc2	ProgramFestival-read	ProgramFestival - branje	f
00030000-561f-6b32-eb6e-0db021187023	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561f-6b32-aa3c-a72989b053c6	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561f-6b32-24ab-e26a2e23c576	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561f-6b32-96e9-ec6e335b279d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561f-6b32-1eb6-dbb5ef402d86	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561f-6b32-000a-d5012c5a9f79	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561f-6b32-dd84-54bb71978ea3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561f-6b32-cdb5-8ad4d49e722b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561f-6b32-4452-067d9136de6a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561f-6b32-debc-3a283da7e0ff	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561f-6b32-4cb0-e2e6ef1bccf0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561f-6b32-9626-cae837d10ee1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561f-6b32-219a-1561deae6c4e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561f-6b32-99a7-38c74fd6f318	ProgramRazno-read	ProgramRazno - branje	f
00030000-561f-6b32-8944-de0d97b4e8f4	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561f-6b32-9ab6-6289a0554582	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561f-6b32-ab06-a144310d0ad2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561f-6b32-9cc3-6d5677f83341	Prostor-read	Prostor - branje	f
00030000-561f-6b32-7767-cb34877574b6	Prostor-write	Prostor - spreminjanje	f
00030000-561f-6b32-3480-417df89f2e92	Racun-read	Racun - branje	f
00030000-561f-6b32-0313-379a341d0a04	Racun-write	Racun - spreminjanje	f
00030000-561f-6b32-e313-918f46e59052	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561f-6b32-19c4-7c33cca28ade	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561f-6b32-64ad-d4b651a3a5a9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561f-6b32-9d2e-2f0c4a91a2db	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561f-6b32-9116-8b75b729301d	Rekvizit-read	Rekvizit - branje	f
00030000-561f-6b32-fdfa-9c87923d197b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561f-6b32-a064-822454bef52e	Revizija-read	Revizija - branje	f
00030000-561f-6b32-9574-25cd5387a05e	Revizija-write	Revizija - spreminjanje	f
00030000-561f-6b32-9e40-e71a2aff1517	Rezervacija-read	Rezervacija - branje	f
00030000-561f-6b32-a370-a677418fceab	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561f-6b32-10ef-ab8bfe8828ff	SedezniRed-read	SedezniRed - branje	f
00030000-561f-6b32-abdc-9c9cdc89694c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561f-6b32-c110-9573cb8fc7f7	Sedez-read	Sedez - branje	f
00030000-561f-6b32-9af3-1f027960bc59	Sedez-write	Sedez - spreminjanje	f
00030000-561f-6b32-8805-b5d0fef93229	Sezona-read	Sezona - branje	f
00030000-561f-6b32-552d-24ad9717232a	Sezona-write	Sezona - spreminjanje	f
00030000-561f-6b32-9cb9-4fd3999d1f48	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561f-6b32-0d18-7436c3ad341b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561f-6b32-2a91-0a8614a2bbc1	Stevilcenje-read	Stevilcenje - branje	f
00030000-561f-6b32-00a0-a5fa5d6d2f95	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561f-6b32-8994-e003c72ad4ac	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561f-6b32-4812-6025f6ae72f1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561f-6b32-da6c-a5d37539fcc7	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561f-6b32-81b0-abb8e184220f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561f-6b32-9a85-792b96546a5e	Telefonska-read	Telefonska - branje	f
00030000-561f-6b32-0589-a0bdc35c641c	Telefonska-write	Telefonska - spreminjanje	f
00030000-561f-6b32-0642-441b7338a8ba	TerminStoritve-read	TerminStoritve - branje	f
00030000-561f-6b32-3549-d8360c23ee95	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561f-6b32-255e-1fad7088af30	TipFunkcije-read	TipFunkcije - branje	f
00030000-561f-6b32-0fd5-ffe3fd24b87f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561f-6b32-e478-a9a055aaaeb3	TipPopa-read	TipPopa - branje	f
00030000-561f-6b32-95a1-8d4af3307927	TipPopa-write	TipPopa - spreminjanje	f
00030000-561f-6b32-bba2-d46a0d4dcf1e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561f-6b32-45c8-ffd5931180a7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561f-6b32-082f-df50495b80bb	Trr-read	Trr - branje	f
00030000-561f-6b32-ee4e-1eb0c8f34a9c	Trr-write	Trr - spreminjanje	f
00030000-561f-6b32-4da6-141c12e380cd	Uprizoritev-read	Uprizoritev - branje	f
00030000-561f-6b32-3a3a-9fd90a27bfc5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561f-6b32-872f-c1eb75956df8	Vaja-read	Vaja - branje	f
00030000-561f-6b32-e9af-1d902f1c6470	Vaja-write	Vaja - spreminjanje	f
00030000-561f-6b32-37ea-5b1d2e573e0c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561f-6b32-2c5e-f1a51dc61a42	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561f-6b32-f4d6-2fd4a898e9f9	VrstaStroska-read	VrstaStroska - branje	f
00030000-561f-6b32-bcf7-bb58e7e8c911	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561f-6b32-64b5-0dc02308bf12	Zaposlitev-read	Zaposlitev - branje	f
00030000-561f-6b32-8f62-e891eaafa126	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561f-6b32-7674-fb4445997c07	Zasedenost-read	Zasedenost - branje	f
00030000-561f-6b32-e116-433500886dc8	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561f-6b32-3ea1-9cd405553bf2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561f-6b32-29df-64bd7f32e621	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561f-6b32-8aec-9a3e1f6264ce	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561f-6b32-356a-f4d0c307eff2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561f-6b32-da9f-7a730a278a1b	Job-read	Branje opravil - samo zase - branje	f
00030000-561f-6b32-2502-1f3cc159a0e5	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561f-6b32-bba1-6880f6347336	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561f-6b32-826f-729efb7b612a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561f-6b32-b624-a5b7a8986aab	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561f-6b32-c4f6-341c438d43ac	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561f-6b32-c283-b5c8a6894cc7	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561f-6b32-8396-db78bb3da751	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-6b32-f4fe-d4f6c3c255ac	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-6b32-75ad-5119e45b3452	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-6b32-db49-cd20275f3ab2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-6b32-19e8-3d77ec7c0731	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561f-6b32-ac02-053a6f8435ea	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561f-6b32-8ffd-61ff845e502a	Datoteka-write	Datoteka - spreminjanje	f
00030000-561f-6b32-8a97-940b150a60ff	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3034 (class 0 OID 4427258)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561f-6b32-8825-56ac6d19ef9c	00030000-561f-6b32-35f0-4843d582b6dc
00020000-561f-6b32-956b-86a642aa241f	00030000-561f-6b32-7f21-20dbb548a85b
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-f526-fd6cdd979868
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-9970-d09fd6e92ba1
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-d6b5-11f38da675e6
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-1a4a-9a6eeeeb56a8
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-5643-a60648066881
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-5acc-adf82f7581a5
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-530e-051256dfb671
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-c709-eb5c33c88ab4
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-7f21-20dbb548a85b
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-dc7b-7736958e9f73
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-4a1d-b7d4738c3ea1
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-2d81-ec8cb20837a0
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-9b8d-3b6b4d3918b4
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-49f2-fcf8e6d220b9
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-b176-c3c5a49de8fd
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-cc26-163d5b666c24
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-457c-79ee786abbef
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-4edd-d9f7f87471c5
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-1a4d-cd0d75d6f6dd
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-d089-36eb72f188b5
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-f57c-c0bebd84c19f
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-1566-ee14e73ac22c
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-baeb-ad685374e774
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-0101-4e22c2d3660c
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-0a39-54cc733afce2
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-1d7f-f927712e03f8
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-fe74-7d5b003e267a
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-9c6b-328eac32bc3a
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-ded2-5ee4ef4c6695
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-dc33-8de9e22a457d
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-f77f-977811190d7a
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-e24b-5e5dd83cdd8c
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-9cc3-6d5677f83341
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-7767-cb34877574b6
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-64ad-d4b651a3a5a9
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-9d2e-2f0c4a91a2db
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-9116-8b75b729301d
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-fdfa-9c87923d197b
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-8805-b5d0fef93229
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-552d-24ad9717232a
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-255e-1fad7088af30
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-4da6-141c12e380cd
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-3a3a-9fd90a27bfc5
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-872f-c1eb75956df8
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-e9af-1d902f1c6470
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-7674-fb4445997c07
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-e116-433500886dc8
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-3ea1-9cd405553bf2
00020000-561f-6b32-d15d-defc04433259	00030000-561f-6b32-8aec-9a3e1f6264ce
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-f526-fd6cdd979868
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-5643-a60648066881
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-5acc-adf82f7581a5
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-7f21-20dbb548a85b
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-9b8d-3b6b4d3918b4
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-b176-c3c5a49de8fd
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-457c-79ee786abbef
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-4edd-d9f7f87471c5
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-1a4d-cd0d75d6f6dd
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-d089-36eb72f188b5
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-f57c-c0bebd84c19f
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-1566-ee14e73ac22c
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-baeb-ad685374e774
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-0a39-54cc733afce2
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-fe74-7d5b003e267a
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-9c6b-328eac32bc3a
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-ded2-5ee4ef4c6695
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-9cc3-6d5677f83341
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-64ad-d4b651a3a5a9
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-9116-8b75b729301d
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-8805-b5d0fef93229
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-9a85-792b96546a5e
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-0589-a0bdc35c641c
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-082f-df50495b80bb
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-ee4e-1eb0c8f34a9c
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-64b5-0dc02308bf12
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-8f62-e891eaafa126
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-3ea1-9cd405553bf2
00020000-561f-6b32-3e4e-fd1b991ae6ef	00030000-561f-6b32-8aec-9a3e1f6264ce
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-f526-fd6cdd979868
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-d6b5-11f38da675e6
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-5643-a60648066881
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-ec41-7439ae03b9f4
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-5446-330a16c7950a
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-a099-16bdb7ffd164
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-5acc-adf82f7581a5
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-7f21-20dbb548a85b
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-4a1d-b7d4738c3ea1
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-9b8d-3b6b4d3918b4
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-b176-c3c5a49de8fd
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-457c-79ee786abbef
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-1a4d-cd0d75d6f6dd
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-d089-36eb72f188b5
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-f57c-c0bebd84c19f
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-baeb-ad685374e774
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-0a39-54cc733afce2
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-ded2-5ee4ef4c6695
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-f77f-977811190d7a
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-9cc3-6d5677f83341
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-64ad-d4b651a3a5a9
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-9116-8b75b729301d
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-8805-b5d0fef93229
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-255e-1fad7088af30
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-872f-c1eb75956df8
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-7674-fb4445997c07
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-3ea1-9cd405553bf2
00020000-561f-6b32-64bf-b0d5a62678c9	00030000-561f-6b32-8aec-9a3e1f6264ce
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-f526-fd6cdd979868
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-9970-d09fd6e92ba1
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-1a4a-9a6eeeeb56a8
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-5643-a60648066881
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-5acc-adf82f7581a5
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-7f21-20dbb548a85b
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-9b8d-3b6b4d3918b4
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-b176-c3c5a49de8fd
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-1a4d-cd0d75d6f6dd
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-d089-36eb72f188b5
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-baeb-ad685374e774
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-0a39-54cc733afce2
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-ded2-5ee4ef4c6695
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-9cc3-6d5677f83341
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-64ad-d4b651a3a5a9
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-9116-8b75b729301d
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-8805-b5d0fef93229
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-255e-1fad7088af30
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-3ea1-9cd405553bf2
00020000-561f-6b32-bcc2-dea3d7cadcdd	00030000-561f-6b32-8aec-9a3e1f6264ce
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-f526-fd6cdd979868
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-5643-a60648066881
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-5acc-adf82f7581a5
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-7f21-20dbb548a85b
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-9b8d-3b6b4d3918b4
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-b176-c3c5a49de8fd
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-1a4d-cd0d75d6f6dd
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-d089-36eb72f188b5
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-baeb-ad685374e774
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-0a39-54cc733afce2
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-ded2-5ee4ef4c6695
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-9cc3-6d5677f83341
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-64ad-d4b651a3a5a9
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-9116-8b75b729301d
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-8805-b5d0fef93229
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-0642-441b7338a8ba
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-86de-3b6d28fbd826
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-255e-1fad7088af30
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-3ea1-9cd405553bf2
00020000-561f-6b32-0a01-d77688b9b7cd	00030000-561f-6b32-8aec-9a3e1f6264ce
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-fef5-8b5ac370f715
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-35f0-4843d582b6dc
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-86de-3b6d28fbd826
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-530e-051256dfb671
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-b1fb-85694ae605c2
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-b130-5816bd49b6f9
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f99b-6ae5de4346b6
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f526-fd6cdd979868
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9970-d09fd6e92ba1
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-d6b5-11f38da675e6
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-1a4a-9a6eeeeb56a8
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-5643-a60648066881
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-ec41-7439ae03b9f4
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-5446-330a16c7950a
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-e6d8-fda45d9b13cf
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-a099-16bdb7ffd164
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-d93c-fb163aa99dac
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-5acc-adf82f7581a5
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-c709-eb5c33c88ab4
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-7f21-20dbb548a85b
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-dc7b-7736958e9f73
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-078d-af2ae83b80d3
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f154-e798b94c1be1
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-5bef-b832857896e5
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-d89a-592373db1c80
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4a1d-b7d4738c3ea1
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-2d81-ec8cb20837a0
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9b8d-3b6b4d3918b4
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-49f2-fcf8e6d220b9
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-b176-c3c5a49de8fd
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-cc26-163d5b666c24
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-457c-79ee786abbef
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4edd-d9f7f87471c5
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-7cd4-15dea5f11ebd
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-ba4a-894a963f53bc
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-421a-a5ce20fcb224
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-5546-8b69ad13f893
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-1a4d-cd0d75d6f6dd
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f58b-5e01c22e7de3
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-d089-36eb72f188b5
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-ddd7-f0c997f0253d
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f57c-c0bebd84c19f
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-1566-ee14e73ac22c
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4837-e8e0c3e635ae
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0a09-b032682f8581
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9476-8adb4b0e0d57
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9d49-060ed14954b7
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-a088-565050ef8abe
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-ff4d-b0e436ccc3f3
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-baeb-ad685374e774
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0101-4e22c2d3660c
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0a39-54cc733afce2
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-1d7f-f927712e03f8
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-e6dd-d1a667f54447
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-d323-996a27df67ae
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-2b82-568ae9cb0943
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-3353-0d8f970cc78d
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-fe74-7d5b003e267a
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9c6b-328eac32bc3a
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-ded2-5ee4ef4c6695
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-dc33-8de9e22a457d
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-6282-f2770e3b9d32
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-d1ce-20735c33cba3
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-b2e3-265bddff2d90
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4560-e65814095ee2
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f77f-977811190d7a
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-e24b-5e5dd83cdd8c
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f9a8-687207669a8b
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-3341-bb688ebaaee9
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4387-ee57244f0fc2
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-eb6e-0db021187023
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-aa3c-a72989b053c6
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-24ab-e26a2e23c576
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-96e9-ec6e335b279d
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-1eb6-dbb5ef402d86
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-000a-d5012c5a9f79
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-dd84-54bb71978ea3
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-cdb5-8ad4d49e722b
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4452-067d9136de6a
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-debc-3a283da7e0ff
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4cb0-e2e6ef1bccf0
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9626-cae837d10ee1
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-219a-1561deae6c4e
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-99a7-38c74fd6f318
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-8944-de0d97b4e8f4
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9ab6-6289a0554582
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-ab06-a144310d0ad2
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9cc3-6d5677f83341
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-7767-cb34877574b6
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-3480-417df89f2e92
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0313-379a341d0a04
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-e313-918f46e59052
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-19c4-7c33cca28ade
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-64ad-d4b651a3a5a9
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9d2e-2f0c4a91a2db
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9116-8b75b729301d
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-fdfa-9c87923d197b
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-a064-822454bef52e
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9574-25cd5387a05e
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9e40-e71a2aff1517
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-a370-a677418fceab
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-10ef-ab8bfe8828ff
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-abdc-9c9cdc89694c
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-c110-9573cb8fc7f7
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9af3-1f027960bc59
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-8805-b5d0fef93229
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-552d-24ad9717232a
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9cb9-4fd3999d1f48
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0d18-7436c3ad341b
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-2a91-0a8614a2bbc1
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-00a0-a5fa5d6d2f95
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-8994-e003c72ad4ac
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4812-6025f6ae72f1
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-da6c-a5d37539fcc7
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-81b0-abb8e184220f
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-9a85-792b96546a5e
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0589-a0bdc35c641c
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0642-441b7338a8ba
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-3549-d8360c23ee95
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-255e-1fad7088af30
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-0fd5-ffe3fd24b87f
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-bba2-d46a0d4dcf1e
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-45c8-ffd5931180a7
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-082f-df50495b80bb
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-ee4e-1eb0c8f34a9c
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-4da6-141c12e380cd
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-3a3a-9fd90a27bfc5
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-872f-c1eb75956df8
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-e9af-1d902f1c6470
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-37ea-5b1d2e573e0c
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-2c5e-f1a51dc61a42
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-f4d6-2fd4a898e9f9
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-bcf7-bb58e7e8c911
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-64b5-0dc02308bf12
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-8f62-e891eaafa126
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-7674-fb4445997c07
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-e116-433500886dc8
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-3ea1-9cd405553bf2
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-29df-64bd7f32e621
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-8aec-9a3e1f6264ce
00020000-561f-6b33-8225-e515be8a35be	00030000-561f-6b32-356a-f4d0c307eff2
\.


--
-- TOC entry 3066 (class 0 OID 4427624)
-- Dependencies: 211
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 4427582)
-- Dependencies: 207
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 4427724)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561f-6b33-58cc-c9a867ad3a8f	00090000-561f-6b33-a7fb-7e922a7d4f49	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561f-6b33-b39c-4ee7ca58ddc4	00090000-561f-6b33-cd5e-dfd7da20729b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561f-6b33-d8ff-a4a58fdc5cf3	00090000-561f-6b33-ebfb-d08ee085437b	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561f-6b33-555b-ee87cfb1a66e	00090000-561f-6b33-19e6-510da508e11e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3037 (class 0 OID 4427283)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561f-6b33-ae61-e8c53518f5b0	\N	00040000-561f-6b31-8f84-70dee20f309a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b33-6dba-b1594cacaafb	\N	00040000-561f-6b31-8f84-70dee20f309a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561f-6b33-7a9e-a756aac4b83e	\N	00040000-561f-6b31-8f84-70dee20f309a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b33-3836-1d46e380bbcf	\N	00040000-561f-6b31-8f84-70dee20f309a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b33-f7fc-de38469967b3	\N	00040000-561f-6b31-8f84-70dee20f309a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b33-85c8-8c54f1dc116d	\N	00040000-561f-6b31-f226-c81f1b3f2a8d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b33-7bf2-1d56192cbd5b	\N	00040000-561f-6b31-fe84-a521e3961adf	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b33-26c5-6654fe1d8f7c	\N	00040000-561f-6b31-5018-aa0807971af4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b33-0b15-1176540c6733	\N	00040000-561f-6b31-86da-047e4b2041ac	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-6b35-da66-5a805c164878	\N	00040000-561f-6b31-8f84-70dee20f309a	1001	AK	Mestno gledališče XYZ		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3047 (class 0 OID 4427426)
-- Dependencies: 192
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561f-6b31-cb93-295cb1abdbf0	8341	Adlešiči
00050000-561f-6b31-43f0-53a9e373e514	5270	Ajdovščina
00050000-561f-6b31-e56e-d91137bc720a	6280	Ankaran/Ancarano
00050000-561f-6b31-29da-6a031eb1aed6	9253	Apače
00050000-561f-6b31-453b-dd687d204334	8253	Artiče
00050000-561f-6b31-3f8d-7750bce8149b	4275	Begunje na Gorenjskem
00050000-561f-6b31-8b59-4617768e36a1	1382	Begunje pri Cerknici
00050000-561f-6b31-2316-2b74593d6aef	9231	Beltinci
00050000-561f-6b31-f825-44097fbaa878	2234	Benedikt
00050000-561f-6b31-bece-5b5cbf201d8d	2345	Bistrica ob Dravi
00050000-561f-6b31-f7ff-097c66338589	3256	Bistrica ob Sotli
00050000-561f-6b31-91f0-7c92dfa87ae9	8259	Bizeljsko
00050000-561f-6b31-ffe4-aad8c79d472b	1223	Blagovica
00050000-561f-6b31-1c9d-1a10b94298cf	8283	Blanca
00050000-561f-6b31-ecaf-6d4fa0b5ad5a	4260	Bled
00050000-561f-6b31-ddab-791707e46474	4273	Blejska Dobrava
00050000-561f-6b31-b989-f102b52ae864	9265	Bodonci
00050000-561f-6b31-e970-619635416f02	9222	Bogojina
00050000-561f-6b31-cb4d-cdabc50583a1	4263	Bohinjska Bela
00050000-561f-6b31-6f97-a807c98823a7	4264	Bohinjska Bistrica
00050000-561f-6b31-a776-34b1f7fbc099	4265	Bohinjsko jezero
00050000-561f-6b31-76d4-5a18b085c8a0	1353	Borovnica
00050000-561f-6b31-b1fc-293fb88e964a	8294	Boštanj
00050000-561f-6b31-6cbb-7b8964a72845	5230	Bovec
00050000-561f-6b31-24ad-93ac43439e31	5295	Branik
00050000-561f-6b31-8379-e6b53336023c	3314	Braslovče
00050000-561f-6b31-a647-405bfdbb1129	5223	Breginj
00050000-561f-6b31-36c6-a304aad54b4e	8280	Brestanica
00050000-561f-6b31-6c2d-1791c58c6241	2354	Bresternica
00050000-561f-6b31-362a-a5776678a18c	4243	Brezje
00050000-561f-6b31-6614-27f0c6777c41	1351	Brezovica pri Ljubljani
00050000-561f-6b31-e285-f04f50f29862	8250	Brežice
00050000-561f-6b31-537e-50f0f5db51c6	4210	Brnik - Aerodrom
00050000-561f-6b31-88f8-918be46eedf6	8321	Brusnice
00050000-561f-6b31-29fd-97eb5d7aea88	3255	Buče
00050000-561f-6b31-db5c-82bf1665543c	8276	Bučka 
00050000-561f-6b31-086c-db32d289fda9	9261	Cankova
00050000-561f-6b31-b870-8be72b3d81ef	3000	Celje 
00050000-561f-6b31-d8a8-4f212c2feebb	3001	Celje - poštni predali
00050000-561f-6b31-a14a-33541282d1c8	4207	Cerklje na Gorenjskem
00050000-561f-6b31-6034-30a6e4766dbb	8263	Cerklje ob Krki
00050000-561f-6b31-3045-523e3c819f1f	1380	Cerknica
00050000-561f-6b31-1e8f-40385455c9c2	5282	Cerkno
00050000-561f-6b31-b7d1-26ecb5f59422	2236	Cerkvenjak
00050000-561f-6b31-47eb-2491a51cea3f	2215	Ceršak
00050000-561f-6b31-dbb3-2329a797a0c7	2326	Cirkovce
00050000-561f-6b31-ca7f-d5dcb12603e4	2282	Cirkulane
00050000-561f-6b31-1f76-87bac671b72c	5273	Col
00050000-561f-6b31-a97e-6431fbb7cd09	8251	Čatež ob Savi
00050000-561f-6b31-b9dc-a24620f8d2e0	1413	Čemšenik
00050000-561f-6b31-af09-9b8bf0d1175d	5253	Čepovan
00050000-561f-6b31-3dfd-c166841d319f	9232	Črenšovci
00050000-561f-6b31-46d7-1dc11bde3f1d	2393	Črna na Koroškem
00050000-561f-6b31-ae12-1db6bb227b00	6275	Črni Kal
00050000-561f-6b31-6a6d-3d4b0cf638d6	5274	Črni Vrh nad Idrijo
00050000-561f-6b31-caa4-6c620b630283	5262	Črniče
00050000-561f-6b31-7bda-a55e4595df63	8340	Črnomelj
00050000-561f-6b31-e4cd-82c1bc08ad40	6271	Dekani
00050000-561f-6b31-900f-69799ca6f994	5210	Deskle
00050000-561f-6b31-97ad-3bd7d45cbe46	2253	Destrnik
00050000-561f-6b31-adbc-3816b0df3e00	6215	Divača
00050000-561f-6b31-16f5-f61a4c6e918e	1233	Dob
00050000-561f-6b31-0650-d2eef046785c	3224	Dobje pri Planini
00050000-561f-6b31-ecdb-0709ab237db6	8257	Dobova
00050000-561f-6b31-1399-b8c4bc459cb3	1423	Dobovec
00050000-561f-6b31-3159-850b0e76c6c1	5263	Dobravlje
00050000-561f-6b31-436b-28c9880d1721	3204	Dobrna
00050000-561f-6b31-ab9a-34faea28b64b	8211	Dobrnič
00050000-561f-6b31-df1e-7bc86e6f41ff	1356	Dobrova
00050000-561f-6b31-6788-5f056fe38f1a	9223	Dobrovnik/Dobronak 
00050000-561f-6b31-4bc6-858846971cda	5212	Dobrovo v Brdih
00050000-561f-6b31-7cdf-240696431382	1431	Dol pri Hrastniku
00050000-561f-6b31-8581-4626ac6444d9	1262	Dol pri Ljubljani
00050000-561f-6b31-0a33-f3e461ac3bc9	1273	Dole pri Litiji
00050000-561f-6b31-b94c-9c8be5fd52f1	1331	Dolenja vas
00050000-561f-6b31-9a9f-3c7014e848c7	8350	Dolenjske Toplice
00050000-561f-6b31-64db-e0818bf313fb	1230	Domžale
00050000-561f-6b32-8c7a-c393ed870247	2252	Dornava
00050000-561f-6b32-a177-afc0483ba8bc	5294	Dornberk
00050000-561f-6b32-e732-956def09456d	1319	Draga
00050000-561f-6b32-9594-eef4fbf1b8db	8343	Dragatuš
00050000-561f-6b32-ed52-0e9cac63e433	3222	Dramlje
00050000-561f-6b32-9c9b-5f336e20ffd0	2370	Dravograd
00050000-561f-6b32-3698-a147e60c74eb	4203	Duplje
00050000-561f-6b32-0f5e-8b531b240b4d	6221	Dutovlje
00050000-561f-6b32-24e5-591a78d2ff06	8361	Dvor
00050000-561f-6b32-9e9d-681cb37ccc66	2343	Fala
00050000-561f-6b32-249a-10b96521125c	9208	Fokovci
00050000-561f-6b32-e43e-7198a80ecc4b	2313	Fram
00050000-561f-6b32-0622-04b85f1a5c71	3213	Frankolovo
00050000-561f-6b32-6f34-ebacaa4bd9ca	1274	Gabrovka
00050000-561f-6b32-a8e6-d4175b333bbb	8254	Globoko
00050000-561f-6b32-28b9-52c1c73125cd	5275	Godovič
00050000-561f-6b32-af3c-d99af0ba0613	4204	Golnik
00050000-561f-6b32-fc46-f9c643541b32	3303	Gomilsko
00050000-561f-6b32-3332-b48b3d7f034b	4224	Gorenja vas
00050000-561f-6b32-2d80-eeb65026ac08	3263	Gorica pri Slivnici
00050000-561f-6b32-8600-303318140b9a	2272	Gorišnica
00050000-561f-6b32-163c-08fc612f4045	9250	Gornja Radgona
00050000-561f-6b32-5207-b4714d7d7c3f	3342	Gornji Grad
00050000-561f-6b32-e2f5-42fab0474faa	4282	Gozd Martuljek
00050000-561f-6b32-8820-ab8030155d76	6272	Gračišče
00050000-561f-6b32-ea5a-70cd7f1d4f3d	9264	Grad
00050000-561f-6b32-10de-e53655476bf4	8332	Gradac
00050000-561f-6b32-d75f-abbc3ff78d6a	1384	Grahovo
00050000-561f-6b32-5b1b-b87d6b2b0af4	5242	Grahovo ob Bači
00050000-561f-6b32-ee24-ae3cc21a8234	5251	Grgar
00050000-561f-6b32-15ff-5cff3f01298a	3302	Griže
00050000-561f-6b32-b0ec-91cf3ec98014	3231	Grobelno
00050000-561f-6b32-eaeb-dba0683270fa	1290	Grosuplje
00050000-561f-6b32-0b08-b3f628b12112	2288	Hajdina
00050000-561f-6b32-2c41-2ecd2d716758	8362	Hinje
00050000-561f-6b32-906a-d301117c23ba	2311	Hoče
00050000-561f-6b32-86b8-002aca252d5a	9205	Hodoš/Hodos
00050000-561f-6b32-c2fe-fcee2b76e7bf	1354	Horjul
00050000-561f-6b32-bc46-0cf9700fa366	1372	Hotedršica
00050000-561f-6b32-150b-2b70f6cf3500	1430	Hrastnik
00050000-561f-6b32-2786-c1de71ce8afb	6225	Hruševje
00050000-561f-6b32-d54d-a8cd01bbf1bd	4276	Hrušica
00050000-561f-6b32-f937-e256d0e94ae5	5280	Idrija
00050000-561f-6b32-28ca-56884c2d69a9	1292	Ig
00050000-561f-6b32-0ff7-40887cad5672	6250	Ilirska Bistrica
00050000-561f-6b32-3346-942a1354f53b	6251	Ilirska Bistrica-Trnovo
00050000-561f-6b32-834a-8c790d1936c8	1295	Ivančna Gorica
00050000-561f-6b32-dc7c-f9cb8f7dacaf	2259	Ivanjkovci
00050000-561f-6b32-bdfb-21df85255912	1411	Izlake
00050000-561f-6b32-7d07-ca91aa61b59d	6310	Izola/Isola
00050000-561f-6b32-10f5-8df0f3860704	2222	Jakobski Dol
00050000-561f-6b32-0752-7e454af19fd1	2221	Jarenina
00050000-561f-6b32-177b-75364ba95651	6254	Jelšane
00050000-561f-6b32-95b0-b47fd805da75	4270	Jesenice
00050000-561f-6b32-36ef-e28446ee7c48	8261	Jesenice na Dolenjskem
00050000-561f-6b32-e52a-50c0a7d4fca3	3273	Jurklošter
00050000-561f-6b32-ff1a-dfe6c82d1f0d	2223	Jurovski Dol
00050000-561f-6b32-1593-115b693b3322	2256	Juršinci
00050000-561f-6b32-6917-fe9eddb86e86	5214	Kal nad Kanalom
00050000-561f-6b32-1ada-b682663c6d75	3233	Kalobje
00050000-561f-6b32-0fbf-975ccecbb120	4246	Kamna Gorica
00050000-561f-6b32-1e80-bba093260af4	2351	Kamnica
00050000-561f-6b32-4615-91d50e708bba	1241	Kamnik
00050000-561f-6b32-98b8-49bdfce6f26e	5213	Kanal
00050000-561f-6b32-cc5f-0e725e666286	8258	Kapele
00050000-561f-6b32-bb46-d2a963d16fb2	2362	Kapla
00050000-561f-6b32-4977-5d0519988307	2325	Kidričevo
00050000-561f-6b32-ddac-bc821f5b4a9d	1412	Kisovec
00050000-561f-6b32-daae-ec240ebd1d64	6253	Knežak
00050000-561f-6b32-ad77-00c0201d9fe0	5222	Kobarid
00050000-561f-6b32-5734-e2fc93f5a341	9227	Kobilje
00050000-561f-6b32-8706-951dbe4ac45d	1330	Kočevje
00050000-561f-6b32-d156-35f95c1ce1de	1338	Kočevska Reka
00050000-561f-6b32-7927-503b1bc889a8	2276	Kog
00050000-561f-6b32-5ac1-3fc425e9c8cc	5211	Kojsko
00050000-561f-6b32-992d-dd61b8f8c979	6223	Komen
00050000-561f-6b32-b6be-1b9c9ca85b37	1218	Komenda
00050000-561f-6b32-00b7-4a7703b3128b	6000	Koper/Capodistria 
00050000-561f-6b32-b5c1-125dd63f327d	6001	Koper/Capodistria - poštni predali
00050000-561f-6b32-6d5b-c84ea13633cc	8282	Koprivnica
00050000-561f-6b32-8e8a-b9fdff7a20b4	5296	Kostanjevica na Krasu
00050000-561f-6b32-cc9b-f48829bb8ce5	8311	Kostanjevica na Krki
00050000-561f-6b32-3157-c2e650261d78	1336	Kostel
00050000-561f-6b32-ed74-64a42f0b1055	6256	Košana
00050000-561f-6b32-edd5-7cba2bbccd95	2394	Kotlje
00050000-561f-6b32-9b29-a5d4f22850ff	6240	Kozina
00050000-561f-6b32-95e4-17f2c6d7a32f	3260	Kozje
00050000-561f-6b32-7fc7-d8ee2f3d99c1	4000	Kranj 
00050000-561f-6b32-a5a5-419fbde59031	4001	Kranj - poštni predali
00050000-561f-6b32-7e2b-d0f802286cec	4280	Kranjska Gora
00050000-561f-6b32-37b3-e36d92bf7c86	1281	Kresnice
00050000-561f-6b32-c646-44d6c0ac290e	4294	Križe
00050000-561f-6b32-886f-c8c310dd5fab	9206	Križevci
00050000-561f-6b32-614a-ceb301fc2d79	9242	Križevci pri Ljutomeru
00050000-561f-6b32-d9e1-922269e44561	1301	Krka
00050000-561f-6b32-936b-c61e553a32c6	8296	Krmelj
00050000-561f-6b32-875e-01c4b05ec3df	4245	Kropa
00050000-561f-6b32-4a92-8ea745e08cb6	8262	Krška vas
00050000-561f-6b32-2085-63585ed5f800	8270	Krško
00050000-561f-6b32-3373-2054a21fa179	9263	Kuzma
00050000-561f-6b32-25a4-ea88898c5015	2318	Laporje
00050000-561f-6b32-41da-bde513a066df	3270	Laško
00050000-561f-6b32-164f-b58d0d865406	1219	Laze v Tuhinju
00050000-561f-6b32-0aa4-ba3c16e93294	2230	Lenart v Slovenskih goricah
00050000-561f-6b32-405f-d807353682d3	9220	Lendava/Lendva
00050000-561f-6b32-b514-7d67ce1d2945	4248	Lesce
00050000-561f-6b32-1ecf-9b459479ac47	3261	Lesično
00050000-561f-6b32-dd87-3d7115e8803d	8273	Leskovec pri Krškem
00050000-561f-6b32-af9c-a3fd0130d7bc	2372	Libeliče
00050000-561f-6b32-e4c9-11c3fa224c0a	2341	Limbuš
00050000-561f-6b32-ef9c-46965c1a7395	1270	Litija
00050000-561f-6b32-a626-0e5fb49e1165	3202	Ljubečna
00050000-561f-6b32-bb2f-d44780c49505	1000	Ljubljana 
00050000-561f-6b32-9b74-ab0fc9057c64	1001	Ljubljana - poštni predali
00050000-561f-6b32-1c33-7bd4b873c71d	1231	Ljubljana - Črnuče
00050000-561f-6b32-4f2c-c6abed871925	1261	Ljubljana - Dobrunje
00050000-561f-6b32-9c4d-db8adc36f6a1	1260	Ljubljana - Polje
00050000-561f-6b32-976f-03229e43e61e	1210	Ljubljana - Šentvid
00050000-561f-6b32-6ec5-40bee2ac3c3f	1211	Ljubljana - Šmartno
00050000-561f-6b32-0f15-d4079499af39	3333	Ljubno ob Savinji
00050000-561f-6b32-553b-61bac0a16486	9240	Ljutomer
00050000-561f-6b32-7181-3623a68bcbec	3215	Loče
00050000-561f-6b32-c8ed-22c2640bdc2a	5231	Log pod Mangartom
00050000-561f-6b32-4f0e-8c0e4c56f850	1358	Log pri Brezovici
00050000-561f-6b32-b386-dcf204b65b87	1370	Logatec
00050000-561f-6b32-d5ea-8f98db1b7e98	1371	Logatec
00050000-561f-6b32-68aa-d3cd74ca220b	1434	Loka pri Zidanem Mostu
00050000-561f-6b32-eaf6-60ececcffcf8	3223	Loka pri Žusmu
00050000-561f-6b32-8030-d157d281f46b	6219	Lokev
00050000-561f-6b32-c762-8b30341711c8	1318	Loški Potok
00050000-561f-6b32-157e-49c19ace588b	2324	Lovrenc na Dravskem polju
00050000-561f-6b32-e9e2-d69867c19ae6	2344	Lovrenc na Pohorju
00050000-561f-6b32-21ff-2021858a1882	3334	Luče
00050000-561f-6b32-3cd5-6591295072e7	1225	Lukovica
00050000-561f-6b32-ed5c-38163e46a14e	9202	Mačkovci
00050000-561f-6b32-d59a-8d5b28f2d687	2322	Majšperk
00050000-561f-6b32-1326-30896dedd841	2321	Makole
00050000-561f-6b32-0bfe-9970dc79d966	9243	Mala Nedelja
00050000-561f-6b32-b84c-3f50d1f930cf	2229	Malečnik
00050000-561f-6b32-00b6-20d4125a1451	6273	Marezige
00050000-561f-6b32-4b48-c859bd55d5ca	2000	Maribor 
00050000-561f-6b32-656b-6be22dc095da	2001	Maribor - poštni predali
00050000-561f-6b32-37b0-47dab9eda0d4	2206	Marjeta na Dravskem polju
00050000-561f-6b32-b284-870084db5872	2281	Markovci
00050000-561f-6b32-7dcb-5ab3386ea677	9221	Martjanci
00050000-561f-6b32-91bb-ac65d0d41aad	6242	Materija
00050000-561f-6b32-c7e7-3608ec444930	4211	Mavčiče
00050000-561f-6b32-1cac-b27406f029c8	1215	Medvode
00050000-561f-6b32-6f33-a6fe9fe9d4e8	1234	Mengeš
00050000-561f-6b32-a40b-3ff392517cf3	8330	Metlika
00050000-561f-6b32-f115-0f97c4d1374c	2392	Mežica
00050000-561f-6b32-36fa-35ef066011d1	2204	Miklavž na Dravskem polju
00050000-561f-6b32-956a-ec00036a2d7f	2275	Miklavž pri Ormožu
00050000-561f-6b32-3d25-1d531ce11b50	5291	Miren
00050000-561f-6b32-14aa-470f667b54e0	8233	Mirna
00050000-561f-6b32-2b23-7bcd08893a12	8216	Mirna Peč
00050000-561f-6b32-9d5a-0dec8a994c02	2382	Mislinja
00050000-561f-6b32-d559-6e1768c69573	4281	Mojstrana
00050000-561f-6b32-f677-5e32ee76a89a	8230	Mokronog
00050000-561f-6b32-6ab5-3f1dadddafa7	1251	Moravče
00050000-561f-6b32-09fe-defd23754339	9226	Moravske Toplice
00050000-561f-6b32-a598-0874f16cdd0e	5216	Most na Soči
00050000-561f-6b32-b281-63c559d86b47	1221	Motnik
00050000-561f-6b32-d104-43d7f23dafd2	3330	Mozirje
00050000-561f-6b32-ee3d-f836e6f03325	9000	Murska Sobota 
00050000-561f-6b32-cdc0-60a44c9a27b6	9001	Murska Sobota - poštni predali
00050000-561f-6b32-556d-26d7ad0b458f	2366	Muta
00050000-561f-6b32-eef9-8e4d3932f94e	4202	Naklo
00050000-561f-6b32-e597-e288281d86d5	3331	Nazarje
00050000-561f-6b32-ae8c-d46c9286c2af	1357	Notranje Gorice
00050000-561f-6b32-3a68-9921d52170b7	3203	Nova Cerkev
00050000-561f-6b32-47f8-f83cdb02db8f	5000	Nova Gorica 
00050000-561f-6b32-c467-86eaab3f8d46	5001	Nova Gorica - poštni predali
00050000-561f-6b32-d6a3-f1bf29c87dfe	1385	Nova vas
00050000-561f-6b32-203c-6a6a62b4df04	8000	Novo mesto
00050000-561f-6b32-0b02-218a19b0fac7	8001	Novo mesto - poštni predali
00050000-561f-6b32-e06c-791a62890853	6243	Obrov
00050000-561f-6b32-e9fb-53d6f12ecdcd	9233	Odranci
00050000-561f-6b32-d9ed-e8f045f5c11a	2317	Oplotnica
00050000-561f-6b32-fd33-c99bafd49bb0	2312	Orehova vas
00050000-561f-6b32-7d6b-9ca4cf9483b5	2270	Ormož
00050000-561f-6b32-bb04-aebb01fabf96	1316	Ortnek
00050000-561f-6b32-1b62-0ce86d5dd723	1337	Osilnica
00050000-561f-6b32-8c39-615f94257357	8222	Otočec
00050000-561f-6b32-2b86-12c9821b0021	2361	Ožbalt
00050000-561f-6b32-b5cf-67d27720ec6a	2231	Pernica
00050000-561f-6b32-09ed-8479835600cd	2211	Pesnica pri Mariboru
00050000-561f-6b32-7f65-94a1717c5261	9203	Petrovci
00050000-561f-6b32-37f2-8c35d832a37d	3301	Petrovče
00050000-561f-6b32-eea0-e2f472122e96	6330	Piran/Pirano
00050000-561f-6b32-e16d-acbf03398fd0	8255	Pišece
00050000-561f-6b32-74e3-64f9c6c01a6f	6257	Pivka
00050000-561f-6b32-dc4c-1664ac37df4b	6232	Planina
00050000-561f-6b32-4e48-a4c6a9b7dc1e	3225	Planina pri Sevnici
00050000-561f-6b32-3afb-a6aa66fddd3b	6276	Pobegi
00050000-561f-6b32-1764-8ddd74e56eec	8312	Podbočje
00050000-561f-6b32-2cf5-53b7d98da95c	5243	Podbrdo
00050000-561f-6b32-8501-f43fc864a127	3254	Podčetrtek
00050000-561f-6b32-006f-782734f44abc	2273	Podgorci
00050000-561f-6b32-deda-0e0b8c66fad6	6216	Podgorje
00050000-561f-6b32-6205-4c49896a14c7	2381	Podgorje pri Slovenj Gradcu
00050000-561f-6b32-1cdb-91dcf39f55d9	6244	Podgrad
00050000-561f-6b32-0d91-8581eb16f5e7	1414	Podkum
00050000-561f-6b32-c6f0-8668eb95d2e1	2286	Podlehnik
00050000-561f-6b32-b265-3e29d7e3a35a	5272	Podnanos
00050000-561f-6b32-05fd-7109d00fb264	4244	Podnart
00050000-561f-6b32-eeb3-0b8cad48cf73	3241	Podplat
00050000-561f-6b32-9c4a-83a54c66e1ad	3257	Podsreda
00050000-561f-6b32-b18b-b3af5f414136	2363	Podvelka
00050000-561f-6b32-b615-4a6f6b2f6d41	2208	Pohorje
00050000-561f-6b32-9695-badf14ec3485	2257	Polenšak
00050000-561f-6b32-2a59-3fc50de0b25a	1355	Polhov Gradec
00050000-561f-6b32-db49-2a4d9a4800d2	4223	Poljane nad Škofjo Loko
00050000-561f-6b32-368a-54303770db34	2319	Poljčane
00050000-561f-6b32-99be-64601d940eb7	1272	Polšnik
00050000-561f-6b32-f335-98f730e0bfd4	3313	Polzela
00050000-561f-6b32-bb54-adcd388c640c	3232	Ponikva
00050000-561f-6b32-b5fe-efa07179fab4	6320	Portorož/Portorose
00050000-561f-6b32-36ec-bb82bf6af6a8	6230	Postojna
00050000-561f-6b32-9b21-925c0ebc9947	2331	Pragersko
00050000-561f-6b32-59c0-1156a3fd63f2	3312	Prebold
00050000-561f-6b32-afb8-19acaae2c681	4205	Preddvor
00050000-561f-6b32-1cab-5e5d7d3f2abd	6255	Prem
00050000-561f-6b32-8ad9-c4ea7ce6c776	1352	Preserje
00050000-561f-6b32-0ca1-815c1142f62e	6258	Prestranek
00050000-561f-6b32-3fe4-4050d17b6f5c	2391	Prevalje
00050000-561f-6b32-90a4-be7b5663e314	3262	Prevorje
00050000-561f-6b32-70f1-e905bfcdc6da	1276	Primskovo 
00050000-561f-6b32-4e3f-396d4aa5ddb3	3253	Pristava pri Mestinju
00050000-561f-6b32-7110-e63d5ad154b9	9207	Prosenjakovci/Partosfalva
00050000-561f-6b32-e28f-3308a5291e6d	5297	Prvačina
00050000-561f-6b32-b053-e4e7636af8ab	2250	Ptuj
00050000-561f-6b32-2ae0-a8ecef3862b1	2323	Ptujska Gora
00050000-561f-6b32-8e14-063e647b907f	9201	Puconci
00050000-561f-6b32-631e-ecdb1d58c5f4	2327	Rače
00050000-561f-6b32-339a-977524ff8931	1433	Radeče
00050000-561f-6b32-8a4a-c5e3fe511434	9252	Radenci
00050000-561f-6b32-89e2-3c05e315c86d	2360	Radlje ob Dravi
00050000-561f-6b32-1b4e-0c7db2ac07e8	1235	Radomlje
00050000-561f-6b32-2a8f-15218068c4f5	4240	Radovljica
00050000-561f-6b32-533b-01afb082fa5d	8274	Raka
00050000-561f-6b32-d916-1a45aa9a5322	1381	Rakek
00050000-561f-6b32-81cb-9f82cd496f99	4283	Rateče - Planica
00050000-561f-6b32-452a-211f82a1e29a	2390	Ravne na Koroškem
00050000-561f-6b32-8a38-14b78db9392e	9246	Razkrižje
00050000-561f-6b32-86fd-2612aa20c866	3332	Rečica ob Savinji
00050000-561f-6b32-6e5e-10ce1a469c55	5292	Renče
00050000-561f-6b32-dcdd-df1ab8f39100	1310	Ribnica
00050000-561f-6b32-33c5-79b7e7ec43b4	2364	Ribnica na Pohorju
00050000-561f-6b32-bb6f-c9ef46a5d733	3272	Rimske Toplice
00050000-561f-6b32-87b1-6bb55dce5d0e	1314	Rob
00050000-561f-6b32-c059-bcfb87447e23	5215	Ročinj
00050000-561f-6b32-fa7e-a032c796ada2	3250	Rogaška Slatina
00050000-561f-6b32-3969-f2d194e4d0f7	9262	Rogašovci
00050000-561f-6b32-cc7c-f53465f6052d	3252	Rogatec
00050000-561f-6b32-dada-f253d668a354	1373	Rovte
00050000-561f-6b32-689a-f137c77cae69	2342	Ruše
00050000-561f-6b32-cdfc-daff1d340095	1282	Sava
00050000-561f-6b32-093e-23a1483a405a	6333	Sečovlje/Sicciole
00050000-561f-6b32-6fe5-c7f65cbcd214	4227	Selca
00050000-561f-6b32-2e16-3efd7935573f	2352	Selnica ob Dravi
00050000-561f-6b32-362e-c1f69e89db36	8333	Semič
00050000-561f-6b32-fe55-622d5ea877ea	8281	Senovo
00050000-561f-6b32-cd4e-3372c4402825	6224	Senožeče
00050000-561f-6b32-a743-fe6a681c27dd	8290	Sevnica
00050000-561f-6b32-fb7f-822b8d4f93cc	6210	Sežana
00050000-561f-6b32-ab37-eeb434d6b3ce	2214	Sladki Vrh
00050000-561f-6b32-604d-e68956e959ba	5283	Slap ob Idrijci
00050000-561f-6b32-e22a-b05a2d1b7d88	2380	Slovenj Gradec
00050000-561f-6b32-aa4b-8515e14a1e61	2310	Slovenska Bistrica
00050000-561f-6b32-f0ee-52f3fee3c64e	3210	Slovenske Konjice
00050000-561f-6b32-fda8-7fdf1db22f17	1216	Smlednik
00050000-561f-6b32-8636-d1a37488a200	5232	Soča
00050000-561f-6b32-173a-7bfa0790cd60	1317	Sodražica
00050000-561f-6b32-ebcf-10dba99dd2dd	3335	Solčava
00050000-561f-6b32-9b85-17ac98c4a164	5250	Solkan
00050000-561f-6b32-675b-d450b5ecf21a	4229	Sorica
00050000-561f-6b32-c053-9a55f1da451b	4225	Sovodenj
00050000-561f-6b32-11ea-fc73986a0774	5281	Spodnja Idrija
00050000-561f-6b32-e7d9-de7d4a3bfe30	2241	Spodnji Duplek
00050000-561f-6b32-9282-f94415abb3b5	9245	Spodnji Ivanjci
00050000-561f-6b32-3a2c-ea673f010c5f	2277	Središče ob Dravi
00050000-561f-6b32-5523-1837e42e63f6	4267	Srednja vas v Bohinju
00050000-561f-6b32-e61c-87693e3bccf4	8256	Sromlje 
00050000-561f-6b32-3d65-0b2a78771501	5224	Srpenica
00050000-561f-6b32-28b9-5baa85d95b53	1242	Stahovica
00050000-561f-6b32-93c8-bb1137800372	1332	Stara Cerkev
00050000-561f-6b32-7ec5-f6f835643c22	8342	Stari trg ob Kolpi
00050000-561f-6b32-3a37-032a9d3dc71b	1386	Stari trg pri Ložu
00050000-561f-6b32-606e-f3081e5ba256	2205	Starše
00050000-561f-6b32-510e-cfbd7fe84cda	2289	Stoperce
00050000-561f-6b32-a7c6-05de2065346a	8322	Stopiče
00050000-561f-6b32-0ab7-4e17f8d93c20	3206	Stranice
00050000-561f-6b32-a2c6-741ba4f1f367	8351	Straža
00050000-561f-6b32-c97d-dd3e7ff7682f	1313	Struge
00050000-561f-6b32-de52-a09649887dff	8293	Studenec
00050000-561f-6b32-cf51-d069a049ca00	8331	Suhor
00050000-561f-6b32-2980-118cdb722bbd	2233	Sv. Ana v Slovenskih goricah
00050000-561f-6b32-585a-e942f0a9c648	2235	Sv. Trojica v Slovenskih goricah
00050000-561f-6b32-f7d5-c65c85ed9b69	2353	Sveti Duh na Ostrem Vrhu
00050000-561f-6b32-e9eb-9a19b232243a	9244	Sveti Jurij ob Ščavnici
00050000-561f-6b32-245b-6242d1a51b45	3264	Sveti Štefan
00050000-561f-6b32-75b0-874ed4b7d14e	2258	Sveti Tomaž
00050000-561f-6b32-30ed-9c58329a8898	9204	Šalovci
00050000-561f-6b32-acf4-a0e7b1ec98a7	5261	Šempas
00050000-561f-6b32-2646-1cc70cbfa651	5290	Šempeter pri Gorici
00050000-561f-6b32-6dd3-7d05a0f7add9	3311	Šempeter v Savinjski dolini
00050000-561f-6b32-e27d-c87c50c3e1f6	4208	Šenčur
00050000-561f-6b32-178d-a3d3c8473bb3	2212	Šentilj v Slovenskih goricah
00050000-561f-6b32-c9ec-b5de5b76dd7c	8297	Šentjanž
00050000-561f-6b32-52f7-360230d19e50	2373	Šentjanž pri Dravogradu
00050000-561f-6b32-e888-1088e62a237b	8310	Šentjernej
00050000-561f-6b32-9d73-c8b13b058183	3230	Šentjur
00050000-561f-6b32-d90d-dd8ccd239438	3271	Šentrupert
00050000-561f-6b32-bf3c-5cdde2cb46c7	8232	Šentrupert
00050000-561f-6b32-e587-7e3f54967707	1296	Šentvid pri Stični
00050000-561f-6b32-2d25-4a209573ba5f	8275	Škocjan
00050000-561f-6b32-1093-16d1c275974b	6281	Škofije
00050000-561f-6b32-65ff-8e1c051e6d32	4220	Škofja Loka
00050000-561f-6b32-fb51-318246d7e9e8	3211	Škofja vas
00050000-561f-6b32-3c79-a5730804696c	1291	Škofljica
00050000-561f-6b32-d68e-5f9132f75d3e	6274	Šmarje
00050000-561f-6b32-39d4-0ac61e5fc4c2	1293	Šmarje - Sap
00050000-561f-6b32-f5e4-9c0a3318b6cc	3240	Šmarje pri Jelšah
00050000-561f-6b32-c915-952a2713cc7a	8220	Šmarješke Toplice
00050000-561f-6b32-36c1-cd4c652c969c	2315	Šmartno na Pohorju
00050000-561f-6b32-eb09-506ecc201929	3341	Šmartno ob Dreti
00050000-561f-6b32-3f69-eaaba5391ab4	3327	Šmartno ob Paki
00050000-561f-6b32-1776-2bbcb6c8ae6a	1275	Šmartno pri Litiji
00050000-561f-6b32-18f3-574ee96a70e5	2383	Šmartno pri Slovenj Gradcu
00050000-561f-6b32-308a-f9f83e75a5ab	3201	Šmartno v Rožni dolini
00050000-561f-6b32-e843-0b4d3540ffd0	3325	Šoštanj
00050000-561f-6b32-3b06-fdd6f5b7fb24	6222	Štanjel
00050000-561f-6b32-9434-85d3667f7b52	3220	Štore
00050000-561f-6b32-45ff-dbb3d65ec4fd	3304	Tabor
00050000-561f-6b32-74e4-3f7b7f2a0b47	3221	Teharje
00050000-561f-6b32-d515-90ee0b01b0f4	9251	Tišina
00050000-561f-6b32-0f59-b8e1ac29eebb	5220	Tolmin
00050000-561f-6b32-cad9-4fa8fd452cb6	3326	Topolšica
00050000-561f-6b32-7f73-14a85125a1df	2371	Trbonje
00050000-561f-6b32-d498-a7dab911652b	1420	Trbovlje
00050000-561f-6b32-9880-a21f50c28e86	8231	Trebelno 
00050000-561f-6b32-32e0-975c7464a252	8210	Trebnje
00050000-561f-6b32-2b8b-23ddb75a73e6	5252	Trnovo pri Gorici
00050000-561f-6b32-aa29-7ef49394e84a	2254	Trnovska vas
00050000-561f-6b32-d8ca-4ad81918756d	1222	Trojane
00050000-561f-6b32-ad88-3f70c4a991b8	1236	Trzin
00050000-561f-6b32-5076-92202e68d89f	4290	Tržič
00050000-561f-6b32-1c79-9d9dff4dfb92	8295	Tržišče
00050000-561f-6b32-8260-be6e93406b18	1311	Turjak
00050000-561f-6b32-1d28-dc1fb4f9016d	9224	Turnišče
00050000-561f-6b32-9e3b-e72188147369	8323	Uršna sela
00050000-561f-6b32-14bb-89ff0bee103b	1252	Vače
00050000-561f-6b32-d9b6-881f426324fe	3320	Velenje 
00050000-561f-6b32-dcfa-ebde9901cacf	3322	Velenje - poštni predali
00050000-561f-6b32-85a2-08e628104777	8212	Velika Loka
00050000-561f-6b32-8161-202e3cc22112	2274	Velika Nedelja
00050000-561f-6b32-264a-32c3bd7663be	9225	Velika Polana
00050000-561f-6b32-1813-cbf24eed8d57	1315	Velike Lašče
00050000-561f-6b32-81f3-eb16af464fce	8213	Veliki Gaber
00050000-561f-6b32-cf48-0240dd4845cb	9241	Veržej
00050000-561f-6b32-7c6a-7809ae9c3ede	1312	Videm - Dobrepolje
00050000-561f-6b32-d275-a829431dedbd	2284	Videm pri Ptuju
00050000-561f-6b32-dd94-f65266124dcf	8344	Vinica
00050000-561f-6b32-bbc2-6a0ac0bd611d	5271	Vipava
00050000-561f-6b32-c20e-e23c21f72bba	4212	Visoko
00050000-561f-6b32-be22-3899acfb6fe4	1294	Višnja Gora
00050000-561f-6b32-0692-7b5950d281dd	3205	Vitanje
00050000-561f-6b32-03d5-8564c387ca8f	2255	Vitomarci
00050000-561f-6b32-9f63-f3264f0b11c7	1217	Vodice
00050000-561f-6b32-46b6-062df4e9a2b8	3212	Vojnik\t
00050000-561f-6b32-e9e3-6d52d32fd1a3	5293	Volčja Draga
00050000-561f-6b32-2a14-e858527d3b72	2232	Voličina
00050000-561f-6b32-edbc-12136605048b	3305	Vransko
00050000-561f-6b32-5dbd-3f68ef5649ae	6217	Vremski Britof
00050000-561f-6b32-8004-0a6ecc11906e	1360	Vrhnika
00050000-561f-6b32-337e-a8a172474f45	2365	Vuhred
00050000-561f-6b32-4518-c6a127c4c65a	2367	Vuzenica
00050000-561f-6b32-60a6-35785f19663f	8292	Zabukovje 
00050000-561f-6b32-e753-5c9733ccbe0e	1410	Zagorje ob Savi
00050000-561f-6b32-23f6-89b10f6a8324	1303	Zagradec
00050000-561f-6b32-a8a9-25419b53d9d5	2283	Zavrč
00050000-561f-6b32-be3a-966ea299d555	8272	Zdole 
00050000-561f-6b32-a4ff-16ff428f72c9	4201	Zgornja Besnica
00050000-561f-6b32-a5b8-ed0b9cf7fa7b	2242	Zgornja Korena
00050000-561f-6b32-06c3-b9341495ee42	2201	Zgornja Kungota
00050000-561f-6b32-34dc-26464eae3e7c	2316	Zgornja Ložnica
00050000-561f-6b32-44e5-619d691be73f	2314	Zgornja Polskava
00050000-561f-6b32-4e1e-33d0d254d000	2213	Zgornja Velka
00050000-561f-6b32-0374-f85cd12789c3	4247	Zgornje Gorje
00050000-561f-6b32-3a3a-b0668ede1d73	4206	Zgornje Jezersko
00050000-561f-6b32-491e-270465ebdde0	2285	Zgornji Leskovec
00050000-561f-6b32-55e3-8b3fce837de1	1432	Zidani Most
00050000-561f-6b32-9791-3d17180d4e2f	3214	Zreče
00050000-561f-6b32-54c2-2beb895db28b	4209	Žabnica
00050000-561f-6b32-a852-4a3c6945951a	3310	Žalec
00050000-561f-6b32-015a-37537fa79fcf	4228	Železniki
00050000-561f-6b32-2a82-5dbd0bea8ea0	2287	Žetale
00050000-561f-6b32-2d77-269ad07f04f2	4226	Žiri
00050000-561f-6b32-b1cd-2818594886a1	4274	Žirovnica
00050000-561f-6b32-9ca3-cb4b11c03774	8360	Žužemberk
\.


--
-- TOC entry 3091 (class 0 OID 4428019)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 4427576)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 4427303)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561f-6b33-7139-cf710ce4d950	00080000-561f-6b33-ae61-e8c53518f5b0	\N	00040000-561f-6b31-8f84-70dee20f309a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561f-6b33-d952-a70c6645446b	00080000-561f-6b33-ae61-e8c53518f5b0	\N	00040000-561f-6b31-8f84-70dee20f309a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561f-6b33-1bc2-2857fce70f1c	00080000-561f-6b33-6dba-b1594cacaafb	\N	00040000-561f-6b31-8f84-70dee20f309a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3055 (class 0 OID 4427509)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 4427563)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 4428048)
-- Dependencies: 239
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 4428040)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561f-6b33-8b5e-a0a7785098a4	00080000-561f-6b33-7a9e-a756aac4b83e	0987	AK
00190000-561f-6b33-21dc-c8a428c9f996	00080000-561f-6b33-6dba-b1594cacaafb	0989	AK
00190000-561f-6b33-6541-9f42210d1865	00080000-561f-6b33-3836-1d46e380bbcf	0986	AK
00190000-561f-6b33-b32b-7d7214714516	00080000-561f-6b33-85c8-8c54f1dc116d	0984	AK
00190000-561f-6b33-0be3-869beda0fc73	00080000-561f-6b33-7bf2-1d56192cbd5b	0983	AK
00190000-561f-6b33-fdaa-d5342b742be7	00080000-561f-6b33-26c5-6654fe1d8f7c	0982	AK
00190000-561f-6b35-cf6c-51c381fc343e	00080000-561f-6b35-da66-5a805c164878	1001	AK
\.


--
-- TOC entry 3088 (class 0 OID 4427879)
-- Dependencies: 233
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561f-6b34-9381-c69b9a1ec7ec	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3090 (class 0 OID 4428008)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 4427599)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561f-6b33-701b-7e205ad093f6	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561f-6b33-dc80-037adccf0235	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561f-6b33-baa5-a7ad90792946	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561f-6b33-19fb-13c2bb821303	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561f-6b33-8678-515857226bcd	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561f-6b33-b900-95608bdc06cb	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561f-6b33-c08f-9b3881736bc8	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3063 (class 0 OID 4427590)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 4427631)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 4427682)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 4427714)
-- Dependencies: 221
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 4427461)
-- Dependencies: 195
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 4427239)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561f-6b35-da66-5a805c164878	00010000-561f-6b32-d14f-09d88f026c94	2015-10-15 11:00:37	INS	a:0:{}
2	App\\Entity\\Option	00000000-561f-6b35-dcc9-b797f995c92e	00010000-561f-6b32-d14f-09d88f026c94	2015-10-15 11:00:37	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561f-6b35-cf6c-51c381fc343e	00010000-561f-6b32-d14f-09d88f026c94	2015-10-15 11:00:37	INS	a:0:{}
4	Produkcija\\Entity\\Funkcija	000d0000-561f-98d5-57bc-07d2a2452cbd	00010000-561f-6b32-b8dd-33fdac33919d	2015-10-15 14:15:17	INS	a:0:{}
5	Produkcija\\Entity\\Alternacija	000c0000-561f-98da-ab2a-f33f81065540	00010000-561f-6b32-b8dd-33fdac33919d	2015-10-15 14:15:22	INS	a:0:{}
6	Produkcija\\Entity\\Funkcija	000d0000-561f-98d5-57bc-07d2a2452cbd	00010000-561f-6b32-b8dd-33fdac33919d	2015-10-15 14:15:22	UPD	a:1:{s:8:"privzeti";a:2:{i:0;N;i:1;s:36:"000c0000-561f-98da-ab2a-f33f81065540";}}
7	App\\Entity\\Oseba	00090000-561f-a8fb-a7b0-0bd8f06f17c8	00010000-561f-6b32-b8dd-33fdac33919d	2015-10-15 15:24:11	INS	a:0:{}
\.


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 7, true);


--
-- TOC entry 3070 (class 0 OID 4427655)
-- Dependencies: 215
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 4427248)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561f-6b32-8825-56ac6d19ef9c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561f-6b32-956b-86a642aa241f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561f-6b32-3f84-7739137cc553	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561f-6b32-8049-9b844b761ec8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561f-6b32-d15d-defc04433259	planer	Planer dogodkov v koledarju	t
00020000-561f-6b32-3e4e-fd1b991ae6ef	kadrovska	Kadrovska služba	t
00020000-561f-6b32-64bf-b0d5a62678c9	arhivar	Ažuriranje arhivalij	t
00020000-561f-6b32-bcc2-dea3d7cadcdd	igralec	Igralec	t
00020000-561f-6b32-0a01-d77688b9b7cd	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561f-6b33-8225-e515be8a35be	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3030 (class 0 OID 4427230)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561f-6b32-b8dd-33fdac33919d	00020000-561f-6b32-3f84-7739137cc553
00010000-561f-6b32-d14f-09d88f026c94	00020000-561f-6b32-3f84-7739137cc553
00010000-561f-6b33-6a5e-5817712c05fc	00020000-561f-6b33-8225-e515be8a35be
\.


--
-- TOC entry 3065 (class 0 OID 4427612)
-- Dependencies: 210
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 4427570)
-- Dependencies: 205
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 4427493)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 4427193)
-- Dependencies: 171
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561f-6b32-2851-b397ca1c4582	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561f-6b32-5dcc-2ccc3d2fa69d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561f-6b32-4d52-c4452ee4c6f4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561f-6b32-37c0-5122fca03293	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561f-6b32-683b-b66c0dba7bf4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3027 (class 0 OID 4427204)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561f-6b32-751f-b7f066920ae7	00230000-561f-6b32-37c0-5122fca03293	popa
00240000-561f-6b32-4b68-2f69155ea437	00230000-561f-6b32-37c0-5122fca03293	oseba
00240000-561f-6b32-90c7-0eb24174d732	00230000-561f-6b32-37c0-5122fca03293	tippopa
00240000-561f-6b32-9273-1a1d31a067a7	00230000-561f-6b32-37c0-5122fca03293	sezona
00240000-561f-6b32-7202-e4acd661a1ee	00230000-561f-6b32-5dcc-2ccc3d2fa69d	prostor
00240000-561f-6b32-eee3-c6f1cac360dd	00230000-561f-6b32-37c0-5122fca03293	besedilo
00240000-561f-6b32-f13c-fafe0015bea1	00230000-561f-6b32-37c0-5122fca03293	uprizoritev
00240000-561f-6b32-17e2-ba37fd4bba1a	00230000-561f-6b32-37c0-5122fca03293	funkcija
00240000-561f-6b32-a34e-0a62def9b232	00230000-561f-6b32-37c0-5122fca03293	tipfunkcije
00240000-561f-6b32-ddd4-8aa71fcbca2e	00230000-561f-6b32-37c0-5122fca03293	alternacija
00240000-561f-6b32-0ab3-18acea3d9e2c	00230000-561f-6b32-2851-b397ca1c4582	pogodba
00240000-561f-6b32-506c-69845acc7624	00230000-561f-6b32-37c0-5122fca03293	zaposlitev
00240000-561f-6b32-0138-f5bc563b0754	00230000-561f-6b32-37c0-5122fca03293	zvrstuprizoritve
00240000-561f-6b32-fee0-af8baad5b091	00230000-561f-6b32-2851-b397ca1c4582	programdela
00240000-561f-6b32-9be7-eed6e98cefc6	00230000-561f-6b32-37c0-5122fca03293	zapis
\.


--
-- TOC entry 3028 (class 0 OID 4427212)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ce52dfac-741f-48f0-bd94-ca09cb93d4f6	00240000-561f-6b32-751f-b7f066920ae7	0	1001
b7642bf1-39d7-42b3-82ad-e0074083b8d9	00240000-561f-6b32-ddd4-8aa71fcbca2e	0	1001
ad2520b8-8a37-4437-9bdc-24bfe7b6a568	00240000-561f-6b32-4b68-2f69155ea437	0	1001
\.


--
-- TOC entry 3072 (class 0 OID 4427668)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561f-6b34-b89f-5fcd3b20f67f	000e0000-561f-6b33-1be5-b9b135325a94	00080000-561f-6b33-ae61-e8c53518f5b0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561f-6b32-27f3-146cce4163f5
00270000-561f-6b34-5c48-c6f58013e2df	000e0000-561f-6b33-1be5-b9b135325a94	00080000-561f-6b33-ae61-e8c53518f5b0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561f-6b32-27f3-146cce4163f5
\.


--
-- TOC entry 3044 (class 0 OID 4427387)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 4427550)
-- Dependencies: 203
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561f-6b34-c223-012303527f32	00180000-561f-6b34-59c9-dd47ed203b71	000c0000-561f-6b34-843e-16a436f0994a	00090000-561f-6b33-b492-e0ebfa214ec9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-6b34-698c-0dd22a268f7d	00180000-561f-6b34-59c9-dd47ed203b71	000c0000-561f-6b34-9b72-58e0e81dec74	00090000-561f-6b33-19e6-510da508e11e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-6b34-6a68-8f32842f8ed2	00180000-561f-6b34-59c9-dd47ed203b71	000c0000-561f-6b34-899d-dd1da0735eb5	00090000-561f-6b33-6a22-3013b8014cbc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-6b34-aaf2-7d9df3746b45	00180000-561f-6b34-59c9-dd47ed203b71	000c0000-561f-6b34-8c2f-8adbb88ddf44	00090000-561f-6b33-226c-9b7e4d5a7ca4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-6b34-d7a6-0391713b462b	00180000-561f-6b34-59c9-dd47ed203b71	000c0000-561f-6b34-e60a-0dfd7d23fb8a	00090000-561f-6b33-2e69-c54a3dc8b4a5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-6b34-4d2e-04165c1cff6e	00180000-561f-6b34-01cd-28e35d9efbfa	\N	00090000-561f-6b33-2e69-c54a3dc8b4a5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3075 (class 0 OID 4427702)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561f-6b32-185c-45173dbfcabd	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561f-6b32-d574-d630f35fdbc7	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561f-6b32-d97c-5d77a8155a48	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561f-6b32-aba2-5f8a48e9a68c	04	Režija	Režija	Režija	umetnik	30
000f0000-561f-6b32-ca99-3945cae6d99c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561f-6b32-959d-83cfe2f2e22a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561f-6b32-15f4-944949866f67	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561f-6b32-db5b-6f5dff416429	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561f-6b32-a95c-71b8cdc06c91	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561f-6b32-68d6-222a3b8e8754	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561f-6b32-da3f-e42d01253224	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561f-6b32-2511-3f456d520948	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561f-6b32-691c-5185215fa07a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561f-6b32-bd54-7c1783b712bb	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561f-6b32-ee9d-b4da5fb42c56	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561f-6b32-613d-484aff7e1792	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561f-6b32-4a05-9f5ccd934998	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561f-6b32-b7bf-c70017a9e435	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3040 (class 0 OID 4427329)
-- Dependencies: 185
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis, sort) FROM stdin;
00400000-561f-6b33-6e27-16cfcd3181b0	0001	šola	osnovna ali srednja šola	1
00400000-561f-6b33-5cea-f0ece4a456af	0002	gledalec	gledalec, ki ima abonma ali podobno	2
00400000-561f-6b33-4437-f89fbec93f5b	0003	sponzor	sponzor dogodkov	3
\.


--
-- TOC entry 3087 (class 0 OID 4427867)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561f-6b32-96bf-288bcd3440f1	01	Velika predstava	f	1.00	1.00
002b0000-561f-6b32-a2c5-92bb0599963e	02	Mala predstava	f	0.50	0.50
002b0000-561f-6b32-09ce-d21b0c48d821	03	Mala koprodukcija	t	0.40	1.00
002b0000-561f-6b32-f2b6-68ccad81cd6d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561f-6b32-8669-fea61bba924c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3046 (class 0 OID 4427412)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 4427217)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561f-6b32-d14f-09d88f026c94	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROLJVnN72A29MAzAUBy1iQn0QUDGOUNX6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561f-6b33-76a3-d22b21070325	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561f-6b33-ded7-47e94df4f5d4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561f-6b33-7008-22fb714fe371	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561f-6b33-e049-2a56c7f6d356	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561f-6b33-6f43-4cac439d3141	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561f-6b33-a17d-ecf23c7ab38b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561f-6b33-c518-ba1506570ba3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561f-6b33-4fea-bb1ab2b09400	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561f-6b33-83de-f56b6a4c360a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561f-6b33-6a5e-5817712c05fc	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561f-6b32-b8dd-33fdac33919d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3080 (class 0 OID 4427768)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561f-6b33-61ec-251290f9ac0d	00160000-561f-6b33-1099-4230fdf361fe	\N	00140000-561f-6b31-9b7e-400e8d57019d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561f-6b33-8678-515857226bcd
000e0000-561f-6b33-1be5-b9b135325a94	00160000-561f-6b33-9904-2d64985f6a1d	\N	00140000-561f-6b31-5fd8-b1f65d9137f6	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561f-6b33-b900-95608bdc06cb
000e0000-561f-6b33-35bf-707aa163510f	\N	\N	00140000-561f-6b31-5fd8-b1f65d9137f6	00190000-561f-6b33-8b5e-a0a7785098a4	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-6b33-8678-515857226bcd
000e0000-561f-6b33-6d91-72380de30328	\N	\N	00140000-561f-6b31-5fd8-b1f65d9137f6	00190000-561f-6b33-8b5e-a0a7785098a4	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-6b33-8678-515857226bcd
000e0000-561f-6b33-a9ce-3912c07bb51b	\N	\N	00140000-561f-6b31-5fd8-b1f65d9137f6	00190000-561f-6b33-8b5e-a0a7785098a4	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-6b33-701b-7e205ad093f6
000e0000-561f-6b33-48ca-858e93c1a4ca	\N	\N	00140000-561f-6b31-5fd8-b1f65d9137f6	00190000-561f-6b33-8b5e-a0a7785098a4	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-6b33-701b-7e205ad093f6
\.


--
-- TOC entry 3052 (class 0 OID 4427483)
-- Dependencies: 197
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561f-6b34-c8ac-54f96bda3bf8	000e0000-561f-6b33-1be5-b9b135325a94	\N	1	
00200000-561f-6b34-2778-bed9c87627c8	000e0000-561f-6b33-1be5-b9b135325a94	\N	2	
00200000-561f-6b34-13c5-77286bb3ba35	000e0000-561f-6b33-1be5-b9b135325a94	\N	3	
00200000-561f-6b34-a176-e67d015052b5	000e0000-561f-6b33-1be5-b9b135325a94	\N	4	
00200000-561f-6b34-5552-00d3b33c2d50	000e0000-561f-6b33-1be5-b9b135325a94	\N	5	
\.


--
-- TOC entry 3069 (class 0 OID 4427647)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 4427693)
-- Dependencies: 219
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561f-6b32-2ad0-63e904db9868	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561f-6b32-fd95-7029f5e95224	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561f-6b32-9f9b-97e22e53581f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561f-6b32-9710-02c5b4bb521e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561f-6b32-3933-29059a18e364	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561f-6b32-321e-d9e3a8daeec6	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561f-6b32-7d8a-36911cd0ad39	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561f-6b32-3533-c37b7990a0b4	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561f-6b32-27f3-146cce4163f5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561f-6b32-a740-8871fff4086c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561f-6b32-fd89-3dc15015ecb3	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561f-6b32-81a2-3060a98dee54	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561f-6b32-e857-510f9aceac44	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561f-6b32-10d4-d15db8a154f6	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561f-6b32-cd9f-cb9ae7b0ce78	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561f-6b32-8f74-eaf8839ff059	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561f-6b32-315c-569d4621e997	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561f-6b32-8dff-442269f1f7ac	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561f-6b32-42c5-0d2242d6a7e0	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561f-6b32-411f-69d8dbd916aa	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561f-6b32-6075-439de5b40860	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561f-6b32-6828-e497a087abe4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561f-6b32-2c27-ceb84df0e0ca	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561f-6b32-a8c1-e97fbe2860fe	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561f-6b32-572f-48f9e62203d3	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561f-6b32-4748-302295726d26	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561f-6b32-dc34-1d0571827958	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561f-6b32-991e-0677befad106	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3100 (class 0 OID 4428129)
-- Dependencies: 245
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 4428101)
-- Dependencies: 244
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 4428141)
-- Dependencies: 246
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 4427793)
-- Dependencies: 226
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-561f-6b33-710b-ecbd4b702b95	00090000-561f-6b33-19e6-510da508e11e	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-6b33-a428-2dc861ab1c17	00090000-561f-6b33-30d2-d29f8bbf8fbe	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-6b33-084d-b9d73891a53b	00090000-561f-6b33-cc65-b7863b2b3758	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-6b33-fc85-9020ad28b716	00090000-561f-6b33-b492-e0ebfa214ec9	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-6b33-9ee7-ab4583c9f539	00090000-561f-6b33-0de0-b2a05cda3074	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-6b33-295e-55acfe4abd12	00090000-561f-6b33-6a22-3013b8014cbc	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3054 (class 0 OID 4427503)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 4427758)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561f-6b31-9b7e-400e8d57019d	01	Drama	drama (SURS 01)
00140000-561f-6b31-8df0-8f9d4637cbca	02	Opera	opera (SURS 02)
00140000-561f-6b31-2d1a-a0f1c4d43be8	03	Balet	balet (SURS 03)
00140000-561f-6b31-e422-4831a4587d43	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561f-6b31-124a-de021fa58585	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561f-6b31-5fd8-b1f65d9137f6	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561f-6b31-cde9-19309c7d63de	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3085 (class 0 OID 4427842)
-- Dependencies: 230
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2541 (class 2606 OID 4427282)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 4427818)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 4427755)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 4427808)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 4427840)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 4428071)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 4427534)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 4427549)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 4428038)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 4427407)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 4428002)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 4427863)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 4427481)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 4211954)
-- Name: job_datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_datoteka
    ADD CONSTRAINT job_datoteka_pkey PRIMARY KEY (job_id, datoteka_id);


--
-- TOC entry 2600 (class 2606 OID 4427456)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 4427443)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 4427645)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 4428082)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 4428089)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2794 (class 2606 OID 4428098)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 4427667)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 4427349)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 4427326)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 4427382)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 4427372)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 4427262)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2539 (class 2606 OID 4427273)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 4427629)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 4427589)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 4427736)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 4427299)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 4427432)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 4428031)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 4427580)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 4427314)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 4427517)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 4427567)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 4428055)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 4428045)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 4427939)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 4428017)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 4427607)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 4427594)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 4427636)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 4427692)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 4427721)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 4427470)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 4427247)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 4427659)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 4427234)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2532 (class 2606 OID 4427256)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 4427620)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 4427575)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 4427501)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 4427202)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 4427209)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 4427216)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 4427678)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 4427392)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 4427559)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 4427711)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 4427336)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 4427877)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 4427423)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 4427229)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 4427786)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 4427491)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 4427653)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 4427701)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 4428139)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 4428123)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 4428147)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 4427801)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 4427507)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 4427766)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 4427850)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 1259 OID 4427543)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2623 (class 1259 OID 4427544)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2624 (class 1259 OID 4427542)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2625 (class 1259 OID 4427541)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2626 (class 1259 OID 4427540)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2687 (class 1259 OID 4427679)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2688 (class 1259 OID 4427680)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 4427681)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 4428084)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2784 (class 1259 OID 4428083)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2542 (class 1259 OID 4427301)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2543 (class 1259 OID 4427302)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2667 (class 1259 OID 4427630)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2795 (class 1259 OID 4428127)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2796 (class 1259 OID 4428126)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2797 (class 1259 OID 4428128)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2798 (class 1259 OID 4428125)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2799 (class 1259 OID 4428124)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2639 (class 1259 OID 4427569)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2640 (class 1259 OID 4427568)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2607 (class 1259 OID 4427492)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 4427864)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2749 (class 1259 OID 4427866)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2750 (class 1259 OID 4427865)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2591 (class 1259 OID 4427445)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 4427444)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2763 (class 1259 OID 4428018)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2704 (class 1259 OID 4427738)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2705 (class 1259 OID 4427739)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2706 (class 1259 OID 4427740)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2805 (class 1259 OID 4428148)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2717 (class 1259 OID 4427791)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2718 (class 1259 OID 4427788)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2719 (class 1259 OID 4427792)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2720 (class 1259 OID 4427790)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2721 (class 1259 OID 4427789)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2584 (class 1259 OID 4427425)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 4427424)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 4427375)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2682 (class 1259 OID 4427660)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 4427263)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2535 (class 1259 OID 4427264)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2662 (class 1259 OID 4427623)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2663 (class 1259 OID 4427622)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2664 (class 1259 OID 4427621)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 4427385)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2569 (class 1259 OID 4427384)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2570 (class 1259 OID 4427386)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2616 (class 1259 OID 4427518)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 4427519)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2517 (class 1259 OID 4427211)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2670 (class 1259 OID 4427640)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2671 (class 1259 OID 4427638)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2672 (class 1259 OID 4427637)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2673 (class 1259 OID 4427639)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2525 (class 1259 OID 4427235)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2526 (class 1259 OID 4427236)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2679 (class 1259 OID 4427654)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2782 (class 1259 OID 4428072)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2731 (class 1259 OID 4427810)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 4427809)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2791 (class 1259 OID 4428099)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2792 (class 1259 OID 4428100)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2645 (class 1259 OID 4427581)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2700 (class 1259 OID 4427722)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2701 (class 1259 OID 4427723)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2758 (class 1259 OID 4428007)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2759 (class 1259 OID 4428006)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2760 (class 1259 OID 4428003)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2761 (class 1259 OID 4428004)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2762 (class 1259 OID 4428005)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 4427316)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 4427315)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2549 (class 1259 OID 4427317)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 4427611)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2657 (class 1259 OID 4427610)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2776 (class 1259 OID 4428056)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2777 (class 1259 OID 4428057)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2735 (class 1259 OID 4427822)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 4427823)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2737 (class 1259 OID 4427820)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2738 (class 1259 OID 4427821)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2725 (class 1259 OID 4427802)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2726 (class 1259 OID 4427803)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2650 (class 1259 OID 4427598)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2651 (class 1259 OID 4427597)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2652 (class 1259 OID 4427595)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2653 (class 1259 OID 4427596)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2712 (class 1259 OID 4427757)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2713 (class 1259 OID 4427756)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2601 (class 1259 OID 4427471)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2595 (class 1259 OID 4427459)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2596 (class 1259 OID 4427458)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2597 (class 1259 OID 4427457)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2598 (class 1259 OID 4427460)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2606 (class 1259 OID 4427482)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2766 (class 1259 OID 4428032)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2510 (class 1259 OID 4211956)
-- Name: idx_e629e1eba54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e629e1eba54dbb1f ON job_datoteka USING btree (datoteka_id);


--
-- TOC entry 2511 (class 1259 OID 4211955)
-- Name: idx_e629e1ebbe04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e629e1ebbe04ea9 ON job_datoteka USING btree (job_id);


--
-- TOC entry 2771 (class 1259 OID 4428039)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2787 (class 1259 OID 4428090)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2788 (class 1259 OID 4428091)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2552 (class 1259 OID 4427328)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2553 (class 1259 OID 4427327)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2574 (class 1259 OID 4427393)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2575 (class 1259 OID 4427394)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2613 (class 1259 OID 4427508)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2634 (class 1259 OID 4427562)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 4427561)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2636 (class 1259 OID 4427560)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 4427536)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2628 (class 1259 OID 4427537)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2629 (class 1259 OID 4427535)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2630 (class 1259 OID 4427539)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2631 (class 1259 OID 4427538)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2546 (class 1259 OID 4427300)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2558 (class 1259 OID 4427337)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 4427338)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2580 (class 1259 OID 4427408)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 4427410)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2582 (class 1259 OID 4427409)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2583 (class 1259 OID 4427411)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2678 (class 1259 OID 4427646)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 4427737)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 4427787)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2698 (class 1259 OID 4427712)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2699 (class 1259 OID 4427713)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2566 (class 1259 OID 4427373)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 4427374)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2743 (class 1259 OID 4427851)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2516 (class 1259 OID 4427203)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2562 (class 1259 OID 4427350)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 4427383)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 4427210)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2753 (class 1259 OID 4427878)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 4427609)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2661 (class 1259 OID 4427608)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 4427819)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 4427433)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 4427767)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2802 (class 1259 OID 4428140)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2774 (class 1259 OID 4428046)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2775 (class 1259 OID 4428047)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2742 (class 1259 OID 4427841)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2612 (class 1259 OID 4427502)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 4427257)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2839 (class 2606 OID 4428304)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2840 (class 2606 OID 4428309)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2844 (class 2606 OID 4428329)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2838 (class 2606 OID 4428299)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2842 (class 2606 OID 4428319)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2843 (class 2606 OID 4428324)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 4428314)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2868 (class 2606 OID 4428449)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2869 (class 2606 OID 4428454)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2870 (class 2606 OID 4428459)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 4428644)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2906 (class 2606 OID 4428639)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 4428174)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2814 (class 2606 OID 4428179)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 4428409)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2915 (class 2606 OID 4428684)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 4428679)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2916 (class 2606 OID 4428689)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 4428674)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2912 (class 2606 OID 4428669)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2849 (class 2606 OID 4428354)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2848 (class 2606 OID 4428349)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2834 (class 2606 OID 4428279)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2891 (class 2606 OID 4428564)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2893 (class 2606 OID 4428574)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2892 (class 2606 OID 4428569)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2830 (class 2606 OID 4428259)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2829 (class 2606 OID 4428254)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2865 (class 2606 OID 4428434)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 4428604)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2873 (class 2606 OID 4428474)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2874 (class 2606 OID 4428479)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2875 (class 2606 OID 4428484)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2917 (class 2606 OID 4428694)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2881 (class 2606 OID 4428514)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2878 (class 2606 OID 4428499)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2882 (class 2606 OID 4428519)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2880 (class 2606 OID 4428509)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2879 (class 2606 OID 4428504)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2828 (class 2606 OID 4428249)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 4428244)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 4428214)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2820 (class 2606 OID 4428209)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 4428444)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2811 (class 2606 OID 4428164)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2812 (class 2606 OID 4428169)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2859 (class 2606 OID 4428404)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2858 (class 2606 OID 4428399)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2857 (class 2606 OID 4428394)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2823 (class 2606 OID 4428224)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2822 (class 2606 OID 4428219)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2824 (class 2606 OID 4428229)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2836 (class 2606 OID 4428289)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 4428294)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2808 (class 2606 OID 4428149)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2864 (class 2606 OID 4428429)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2862 (class 2606 OID 4428419)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2861 (class 2606 OID 4428414)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2863 (class 2606 OID 4428424)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 4428154)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2810 (class 2606 OID 4428159)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2866 (class 2606 OID 4428439)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2905 (class 2606 OID 4428634)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2886 (class 2606 OID 4428539)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2885 (class 2606 OID 4428534)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2910 (class 2606 OID 4428659)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2911 (class 2606 OID 4428664)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2850 (class 2606 OID 4428359)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2871 (class 2606 OID 4428464)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2872 (class 2606 OID 4428469)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 4428599)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2897 (class 2606 OID 4428594)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2894 (class 2606 OID 4428579)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 4428584)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2896 (class 2606 OID 4428589)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2816 (class 2606 OID 4428189)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2815 (class 2606 OID 4428184)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 4428194)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 4428389)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2855 (class 2606 OID 4428384)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 4428624)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2904 (class 2606 OID 4428629)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2889 (class 2606 OID 4428554)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 4428559)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2887 (class 2606 OID 4428544)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2888 (class 2606 OID 4428549)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2883 (class 2606 OID 4428524)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 4428529)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2854 (class 2606 OID 4428379)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2853 (class 2606 OID 4428374)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2851 (class 2606 OID 4428364)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2852 (class 2606 OID 4428369)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2877 (class 2606 OID 4428494)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2876 (class 2606 OID 4428489)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2832 (class 2606 OID 4428269)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2831 (class 2606 OID 4428264)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 4428274)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2900 (class 2606 OID 4428609)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2902 (class 2606 OID 4428619)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 4428614)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2908 (class 2606 OID 4428649)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2909 (class 2606 OID 4428654)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 4428204)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2818 (class 2606 OID 4428199)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2825 (class 2606 OID 4428234)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2826 (class 2606 OID 4428239)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2835 (class 2606 OID 4428284)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2847 (class 2606 OID 4428344)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 4428339)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2845 (class 2606 OID 4428334)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-15 16:41:08 CEST

--
-- PostgreSQL database dump complete
--

