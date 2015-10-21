--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-21 11:50:07 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 250 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 250
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22867052)
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
-- TOC entry 234 (class 1259 OID 22867657)
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
-- TOC entry 233 (class 1259 OID 22867640)
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
-- TOC entry 224 (class 1259 OID 22867517)
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
-- TOC entry 227 (class 1259 OID 22867547)
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
-- TOC entry 248 (class 1259 OID 22867928)
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
-- TOC entry 201 (class 1259 OID 22867297)
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
-- TOC entry 203 (class 1259 OID 22867328)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 22867854)
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
-- TOC entry 192 (class 1259 OID 22867194)
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
-- TOC entry 235 (class 1259 OID 22867670)
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
-- TOC entry 220 (class 1259 OID 22867471)
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
-- TOC entry 198 (class 1259 OID 22867268)
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
-- TOC entry 195 (class 1259 OID 22867234)
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
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22867211)
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
-- TOC entry 209 (class 1259 OID 22867385)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 246 (class 1259 OID 22867909)
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
-- TOC entry 247 (class 1259 OID 22867921)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 22867943)
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
-- TOC entry 170 (class 1259 OID 22757748)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 22867410)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22867168)
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
-- TOC entry 183 (class 1259 OID 22867071)
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
-- TOC entry 187 (class 1259 OID 22867135)
-- Name: organizacijskaenota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizacijskaenota (
    id uuid NOT NULL,
    parent_id uuid,
    vodja_id uuid,
    namestnik_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 22867082)
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
-- TOC entry 178 (class 1259 OID 22867026)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22867045)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 22867417)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 22867451)
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
-- TOC entry 230 (class 1259 OID 22867588)
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
-- TOC entry 186 (class 1259 OID 22867115)
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
-- TOC entry 189 (class 1259 OID 22867160)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 22867799)
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
-- TOC entry 210 (class 1259 OID 22867391)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22867145)
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
-- TOC entry 200 (class 1259 OID 22867289)
-- Name: praznik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE praznik (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    dan character varying(255) NOT NULL,
    mesec integer NOT NULL,
    leto integer,
    delaprost boolean NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 22867249)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 197 (class 1259 OID 22867261)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22867403)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 22867813)
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
-- TOC entry 239 (class 1259 OID 22867823)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 22867738)
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
-- TOC entry 240 (class 1259 OID 22867831)
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
-- TOC entry 216 (class 1259 OID 22867432)
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
-- TOC entry 208 (class 1259 OID 22867376)
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
-- TOC entry 207 (class 1259 OID 22867366)
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
-- TOC entry 229 (class 1259 OID 22867577)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 22867507)
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
-- TOC entry 194 (class 1259 OID 22867223)
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
-- TOC entry 175 (class 1259 OID 22866997)
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
-- TOC entry 174 (class 1259 OID 22866995)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 217 (class 1259 OID 22867445)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22867035)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22867019)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 22867459)
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
-- TOC entry 211 (class 1259 OID 22867397)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 22867343)
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
-- TOC entry 173 (class 1259 OID 22866984)
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
-- TOC entry 172 (class 1259 OID 22866976)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22866971)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 225 (class 1259 OID 22867524)
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
-- TOC entry 185 (class 1259 OID 22867107)
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
-- TOC entry 206 (class 1259 OID 22867353)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 228 (class 1259 OID 22867565)
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
-- TOC entry 182 (class 1259 OID 22867061)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 241 (class 1259 OID 22867842)
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
-- TOC entry 204 (class 1259 OID 22867333)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22867180)
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
-- TOC entry 176 (class 1259 OID 22867006)
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
-- TOC entry 232 (class 1259 OID 22867615)
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
-- TOC entry 199 (class 1259 OID 22867279)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 215 (class 1259 OID 22867424)
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
-- TOC entry 226 (class 1259 OID 22867538)
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
-- TOC entry 244 (class 1259 OID 22867889)
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
-- TOC entry 243 (class 1259 OID 22867861)
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
-- TOC entry 245 (class 1259 OID 22867901)
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
-- TOC entry 222 (class 1259 OID 22867496)
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
-- TOC entry 202 (class 1259 OID 22867322)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 231 (class 1259 OID 22867605)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 221 (class 1259 OID 22867486)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2224 (class 2604 OID 22867000)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3062 (class 0 OID 22867052)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5627-5fcc-6ae0-1fb0d2a6a8b7	10	30	Otroci	Abonma za otroke	200
000a0000-5627-5fcc-bf0f-87a783efcbdd	20	60	Mladina	Abonma za mladino	400
000a0000-5627-5fcc-6019-c2d95102c043	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3115 (class 0 OID 22867657)
-- Dependencies: 234
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5627-5fcc-a245-3d1736999a99	000d0000-5627-5fcc-331d-5079ee1d0afe	\N	00090000-5627-5fcc-4e23-1a72afc72062	000b0000-5627-5fcc-1b0e-86ee0cf1f6d2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5627-5fcc-a461-e8729ca5e54d	000d0000-5627-5fcc-e178-288bec2c0f3e	00100000-5627-5fcc-ac47-9594cc378f48	00090000-5627-5fcc-d1bd-58a0fd1cdcad	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5627-5fcc-acea-01acd1675f8a	000d0000-5627-5fcc-aa93-a05fbe1b7f4f	00100000-5627-5fcc-51b6-b159642d3f1f	00090000-5627-5fcc-a1ee-9c29003c3c83	\N	0003	t	\N	2015-10-21	\N	2	t	\N	f	f
000c0000-5627-5fcc-1df4-3c2bc4a1c696	000d0000-5627-5fcc-e8b9-4657400f4372	\N	00090000-5627-5fcc-1585-977f2742ac45	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5627-5fcc-5276-e210d6a6450b	000d0000-5627-5fcc-edae-d5e14ffbac08	\N	00090000-5627-5fcc-81ef-3aaf578175e6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5627-5fcc-4378-305e9c93f77a	000d0000-5627-5fcc-e23d-120a00e6efd1	\N	00090000-5627-5fcc-74bc-c678457a029c	000b0000-5627-5fcc-d25d-23e2d1791655	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5627-5fcc-013a-ce28c945b6e3	000d0000-5627-5fcc-d4fe-7ff3de3023ac	00100000-5627-5fcc-6222-2885f597fab3	00090000-5627-5fcc-c466-ad70d9622cfc	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5627-5fcc-fc7b-58bbf670334a	000d0000-5627-5fcc-75c7-1a70335315a9	\N	00090000-5627-5fcc-3d96-2671c385aab3	000b0000-5627-5fcc-cedb-095124568382	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5627-5fcc-6c42-20b641f55baa	000d0000-5627-5fcc-d4fe-7ff3de3023ac	00100000-5627-5fcc-a0c7-56eefb5d23a6	00090000-5627-5fcc-8d5a-e4e65f877f12	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5627-5fcc-b7f5-b0b07bc47b42	000d0000-5627-5fcc-d4fe-7ff3de3023ac	00100000-5627-5fcc-e07a-2a613fb516d9	00090000-5627-5fcc-26a0-c202ad14dd71	\N	0010	t	\N	2015-10-21	\N	16	f	\N	f	t
000c0000-5627-5fcc-16f0-358d8a932423	000d0000-5627-5fcc-d4fe-7ff3de3023ac	00100000-5627-5fcc-c685-c32abb844f3f	00090000-5627-5fcc-e140-cd14fd9e81d4	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5627-5fcc-4fda-557f4cde8269	000d0000-5627-5fcc-50c9-4f03b81b9a87	\N	00090000-5627-5fcc-d1bd-58a0fd1cdcad	000b0000-5627-5fcc-cbea-856d492ef8ac	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3114 (class 0 OID 22867640)
-- Dependencies: 233
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 22867517)
-- Dependencies: 224
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5627-5fcc-d550-7cfc2c29fc35	00160000-5627-5fcc-e3b2-7e5c420395cf	00090000-5627-5fcc-9b9e-13544a93e77c	aizv	10	t
003d0000-5627-5fcc-ca86-c96e4957d8c9	00160000-5627-5fcc-e3b2-7e5c420395cf	00090000-5627-5fcc-1f04-8cf0f79424d4	apri	14	t
003d0000-5627-5fcc-2074-5387bc48a139	00160000-5627-5fcc-ecf5-37509cffa7ea	00090000-5627-5fcc-7ea0-a6da9a09fa3a	aizv	11	t
003d0000-5627-5fcc-d9e2-0f60c23c5323	00160000-5627-5fcc-5bd4-8167a6172815	00090000-5627-5fcc-d85b-23668fde400b	aizv	12	t
003d0000-5627-5fcc-d3b5-3a2ab349c583	00160000-5627-5fcc-e3b2-7e5c420395cf	00090000-5627-5fcc-f75c-787e093a6844	apri	18	f
\.


--
-- TOC entry 3108 (class 0 OID 22867547)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5627-5fcc-e3b2-7e5c420395cf	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5627-5fcc-ecf5-37509cffa7ea	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5627-5fcc-5bd4-8167a6172815	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3129 (class 0 OID 22867928)
-- Dependencies: 248
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 22867297)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5627-5fcc-dd82-13a877d65942	\N	\N	00200000-5627-5fcc-5d76-f4fc220ab2b2	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5627-5fcc-2dc0-3fa3ca6f2c9f	\N	\N	00200000-5627-5fcc-00b9-bb2728462b8d	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5627-5fcc-f60b-d35a1a8dc082	\N	\N	00200000-5627-5fcc-51be-32e0f15a21c9	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5627-5fcc-db36-fdfd07fd5bb5	\N	\N	00200000-5627-5fcc-d2b8-2bd8e3319245	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5627-5fcc-85f3-32d9aa6b6710	\N	\N	00200000-5627-5fcc-58f3-aa208be8e06e	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3084 (class 0 OID 22867328)
-- Dependencies: 203
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 22867854)
-- Dependencies: 242
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22867194)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5627-5fca-dc57-f47218eebfb9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5627-5fca-c205-5ef2822aaa84	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5627-5fca-018c-2e3cfff243a1	AL	ALB	008	Albania 	Albanija	\N
00040000-5627-5fca-fe93-35450ac36fc6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5627-5fca-b379-6d6d9af98864	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5627-5fca-46cf-6dcf36ada0e8	AD	AND	020	Andorra 	Andora	\N
00040000-5627-5fca-95e0-1a08ca01e18f	AO	AGO	024	Angola 	Angola	\N
00040000-5627-5fca-729c-47e6afc1d6ca	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5627-5fca-464d-a2d8d53631b0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5627-5fca-d866-f68b105ffd50	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5627-5fca-174d-57aa2127ffca	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5627-5fca-aed0-2db6b5dc1216	AM	ARM	051	Armenia 	Armenija	\N
00040000-5627-5fca-674d-abeb9edf4881	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5627-5fca-039d-3da4e806ea23	AU	AUS	036	Australia 	Avstralija	\N
00040000-5627-5fca-d731-53fcd049913d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5627-5fca-9ddc-5975e27e9a46	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5627-5fca-6127-12d685c54f17	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5627-5fca-2de3-3ce5bbb5fcdb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5627-5fca-8933-33044a7a6c72	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5627-5fca-8549-4392e1461f00	BB	BRB	052	Barbados 	Barbados	\N
00040000-5627-5fca-bacf-18eb44009053	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5627-5fca-e9e1-b8ac68f13afb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5627-5fca-b4b6-3429e1683341	BZ	BLZ	084	Belize 	Belize	\N
00040000-5627-5fca-0413-79049a29402c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5627-5fca-fec0-b7a6a34dacc9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5627-5fca-c37c-70a21fee1852	BT	BTN	064	Bhutan 	Butan	\N
00040000-5627-5fca-5bec-7d5013e26417	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5627-5fca-108d-87462ee401cb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5627-5fca-434d-b7403092f505	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5627-5fca-672b-788ea44e322c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5627-5fca-ebc5-4338c6526b16	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5627-5fca-3cd5-4cf9cc208df1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5627-5fca-01a7-226282f34950	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5627-5fca-d2dd-c1217d5120de	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5627-5fca-048c-4d649d568536	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5627-5fca-6cd0-b4e9acde76c1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5627-5fca-7469-8c879fbbd126	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5627-5fca-7c84-00d8f0b07991	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5627-5fca-4912-df118f014ac4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5627-5fca-5693-f326c69d8b89	CA	CAN	124	Canada 	Kanada	\N
00040000-5627-5fca-7c3d-a0ff9605d3a4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5627-5fca-d995-a064a36ad4d4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5627-5fca-28c4-7b4cc1334a45	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5627-5fca-f6b8-bd7ef44e940e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5627-5fca-dcbd-1ca5caf6a4c7	CL	CHL	152	Chile 	Čile	\N
00040000-5627-5fca-5c95-b11c6a061abc	CN	CHN	156	China 	Kitajska	\N
00040000-5627-5fca-6dc6-472430fb9bf9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5627-5fca-734e-14a28cdd0a70	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5627-5fca-8472-e03046f8de42	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5627-5fca-01f0-e61e81166e92	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5627-5fca-2a76-7683d8c1088b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5627-5fca-bee3-b26309b53944	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5627-5fca-2985-2d80b280ead3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5627-5fca-1f86-0e51357007f0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5627-5fca-0ef1-18a5686046a3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5627-5fca-c7da-c5d7b8828c25	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5627-5fca-f804-37e5a88f2920	CU	CUB	192	Cuba 	Kuba	\N
00040000-5627-5fca-5689-4d6f235627be	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5627-5fca-2ea1-ff4ab2ab014e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5627-5fca-7893-edfece9478a8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5627-5fca-8ba3-e3104c46ab2e	DK	DNK	208	Denmark 	Danska	\N
00040000-5627-5fca-26fe-2b9f428b7eb2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5627-5fca-d360-232e4aed2e24	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5627-5fca-84a8-3963efc247dc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5627-5fca-0426-734a9a61b573	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5627-5fca-92cc-529d54270404	EG	EGY	818	Egypt 	Egipt	\N
00040000-5627-5fca-a827-294fd8e72549	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5627-5fca-2228-583a1adcd77a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5627-5fca-0f4a-e56d0f965fce	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5627-5fca-a5d1-826019614f31	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5627-5fca-6578-7c1ce0577d45	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5627-5fca-de00-e1ea1727165a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5627-5fca-3e0c-8ccf0447dcd6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5627-5fca-83ef-22ee4ab8f759	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5627-5fca-f404-d5e72261ed54	FI	FIN	246	Finland 	Finska	\N
00040000-5627-5fca-da28-7a7afdd09999	FR	FRA	250	France 	Francija	\N
00040000-5627-5fca-56e1-87546c427e8a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5627-5fca-ab79-991a96fda1d9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5627-5fca-48ac-ec42510be689	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5627-5fca-119b-7c35a36da919	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5627-5fca-42a8-693fd3e2e069	GA	GAB	266	Gabon 	Gabon	\N
00040000-5627-5fca-bf79-13448dae636c	GM	GMB	270	Gambia 	Gambija	\N
00040000-5627-5fca-2958-f408bd62233c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5627-5fca-ad54-f6c3d5a4bdd8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5627-5fca-9c55-61e380471f19	GH	GHA	288	Ghana 	Gana	\N
00040000-5627-5fca-03b8-91f0f23d9b01	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5627-5fca-00ac-90378aa693de	GR	GRC	300	Greece 	Grčija	\N
00040000-5627-5fca-bcb8-a0d2a45eca04	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5627-5fca-f12a-b4ae46446aee	GD	GRD	308	Grenada 	Grenada	\N
00040000-5627-5fca-a024-3427753de97d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5627-5fca-2dec-2e1a8666756c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5627-5fca-6ac0-2d917027ac9c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5627-5fca-162d-2492a9e7d171	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5627-5fca-d52f-29212df59939	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5627-5fca-fc2e-5ba8125e7c93	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5627-5fca-fa6c-45dee9ed238a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5627-5fca-2997-5ecf8b402c6f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5627-5fca-cfc6-6e3bddb400e6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5627-5fca-a185-60b023138d59	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5627-5fca-2c43-0658b3e02869	HN	HND	340	Honduras 	Honduras	\N
00040000-5627-5fca-c542-2083f999f473	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5627-5fca-95a2-cba34e59851e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5627-5fca-1b0a-af8dab060f0c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5627-5fca-611b-0aa15bb039c4	IN	IND	356	India 	Indija	\N
00040000-5627-5fca-d92b-a4dddc7a8787	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5627-5fca-ca70-827eee90d6b4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5627-5fca-ce32-07d116aa20b4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5627-5fca-137a-4491ba078522	IE	IRL	372	Ireland 	Irska	\N
00040000-5627-5fca-bbe5-fc650adcd4df	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5627-5fca-2e21-a2cff81dbe38	IL	ISR	376	Israel 	Izrael	\N
00040000-5627-5fca-4009-fa4aff7b4c2b	IT	ITA	380	Italy 	Italija	\N
00040000-5627-5fca-abe2-0ab9df822b70	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5627-5fca-f6ef-58edc56834cf	JP	JPN	392	Japan 	Japonska	\N
00040000-5627-5fca-0661-a794a3b3a45c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5627-5fca-6d1d-804f1e71b66b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5627-5fca-b07b-8b65f0409b93	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5627-5fca-db71-b428d815a056	KE	KEN	404	Kenya 	Kenija	\N
00040000-5627-5fca-4c7b-331630f472c8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5627-5fca-0aec-b9ece1eebca9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5627-5fca-4f5d-e05a8cfb08a3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5627-5fca-012f-0262408df101	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5627-5fca-70eb-48b41c05eba3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5627-5fca-362f-a8a9ca1bcd81	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5627-5fca-d774-e3fe7b3f9a02	LV	LVA	428	Latvia 	Latvija	\N
00040000-5627-5fca-9d80-4034fefd4f6d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5627-5fca-c738-98a6b4607eae	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5627-5fca-7a43-2f3e516633d2	LR	LBR	430	Liberia 	Liberija	\N
00040000-5627-5fca-aca6-b95ed01de826	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5627-5fca-33af-2daf1e8736d6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5627-5fca-f74d-dd4927789297	LT	LTU	440	Lithuania 	Litva	\N
00040000-5627-5fca-d1e8-2f6fed8c74ed	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5627-5fca-f60d-632a51115677	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5627-5fca-8b48-c76f9ca6ff79	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5627-5fca-9436-3f09f5d215ed	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5627-5fca-0b5c-eeb584ddee77	MW	MWI	454	Malawi 	Malavi	\N
00040000-5627-5fca-171f-6d58256ab528	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5627-5fca-f9aa-0a7abc9ad1ae	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5627-5fca-9c13-85b4a508ad68	ML	MLI	466	Mali 	Mali	\N
00040000-5627-5fca-2304-39f8382a773a	MT	MLT	470	Malta 	Malta	\N
00040000-5627-5fca-6466-7a42502b7e44	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5627-5fca-24bf-d0790dd232a7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5627-5fca-40d2-6da92aab2b2c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5627-5fca-4f6f-8913659b3689	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5627-5fca-738e-16a98bfcab58	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5627-5fca-894f-7891e85bb498	MX	MEX	484	Mexico 	Mehika	\N
00040000-5627-5fca-4970-eb3d4e5ee443	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5627-5fca-3f37-aa008ca9d9d7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5627-5fca-529b-921b9759c229	MC	MCO	492	Monaco 	Monako	\N
00040000-5627-5fca-df92-297ff1e2139f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5627-5fca-5e5d-c8a1a3bbe73f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5627-5fca-ec37-8eb75ea0bfc3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5627-5fca-efd3-d39be841f1d0	MA	MAR	504	Morocco 	Maroko	\N
00040000-5627-5fca-96b1-69ebbe310090	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5627-5fca-a987-2e0cc4b6cd71	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5627-5fca-c3d2-9bb2d6968a87	NA	NAM	516	Namibia 	Namibija	\N
00040000-5627-5fca-2e2e-1a2ebe75160e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5627-5fca-476f-5036c9f9d1bc	NP	NPL	524	Nepal 	Nepal	\N
00040000-5627-5fca-a5fe-1a8494e57885	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5627-5fca-56d2-e4c8ef93c3a3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5627-5fca-498a-a66ac958a6d6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5627-5fca-45d4-6b933fd4f908	NE	NER	562	Niger 	Niger 	\N
00040000-5627-5fca-db26-1f9fbaa5c00b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5627-5fca-20e6-116c047f4ee9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5627-5fca-2035-58ec1b3d54f5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5627-5fca-9b47-5aa99f57a694	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5627-5fca-5054-28b7655a4451	NO	NOR	578	Norway 	Norveška	\N
00040000-5627-5fca-d26b-44a1a4d6ebb2	OM	OMN	512	Oman 	Oman	\N
00040000-5627-5fca-5078-3cb8d4962104	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5627-5fca-cab9-7099204ba700	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5627-5fca-5829-09316d884e7d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5627-5fca-4cf4-2f4f54fabbf2	PA	PAN	591	Panama 	Panama	\N
00040000-5627-5fca-f626-3847fbe1d3a8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5627-5fca-103c-8ca4ca4978cb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5627-5fca-b99a-2256d1884b6f	PE	PER	604	Peru 	Peru	\N
00040000-5627-5fca-d8b2-882a30c8ed24	PH	PHL	608	Philippines 	Filipini	\N
00040000-5627-5fca-4ff2-1f43b8c810e2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5627-5fca-da6f-41d0fecc1b6b	PL	POL	616	Poland 	Poljska	\N
00040000-5627-5fca-2180-52405caeed6e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5627-5fca-44a2-bc26034a01c2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5627-5fca-3fc5-62c90ab26271	QA	QAT	634	Qatar 	Katar	\N
00040000-5627-5fca-2e2a-e876519498d1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5627-5fca-573d-004bac01e2d3	RO	ROU	642	Romania 	Romunija	\N
00040000-5627-5fca-6344-c8dc06c7f087	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5627-5fca-e212-0eb39ad18eb5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5627-5fca-7802-f6f7bcb66629	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5627-5fca-d13f-229b1e4b0b0c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5627-5fca-3640-2103f893c1ed	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5627-5fca-6b8b-983f45910d97	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5627-5fca-5885-3348329e53fb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5627-5fca-579d-66b96e1f264c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5627-5fca-9cf8-75141ff8094b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5627-5fca-48bd-c75a26818ae9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5627-5fca-1f0a-966273e2ad89	SM	SMR	674	San Marino 	San Marino	\N
00040000-5627-5fca-aef4-6f1bd080c4cc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5627-5fca-2b5b-eed1821d4001	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5627-5fca-bf44-a31341b0e15b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5627-5fca-dd8d-e53862cea537	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5627-5fca-a86a-99a74f57b5ed	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5627-5fca-48aa-b40a88287d42	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5627-5fca-1007-e3fb26078957	SG	SGP	702	Singapore 	Singapur	\N
00040000-5627-5fca-41eb-3e2350c65103	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5627-5fca-ba23-4244f2d0b764	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5627-5fca-876b-b19054e5754d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5627-5fca-e605-476a63659b3b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5627-5fca-652f-626df735c9fe	SO	SOM	706	Somalia 	Somalija	\N
00040000-5627-5fca-6044-54da668c52e0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5627-5fca-326d-da2b3eab2441	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5627-5fca-43e6-fb68152f1fc0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5627-5fca-28a2-aece58e67813	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5627-5fca-7613-bc02da183134	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5627-5fca-8bf1-617ec3c6bbe2	SD	SDN	729	Sudan 	Sudan	\N
00040000-5627-5fca-79f5-582951e8d8eb	SR	SUR	740	Suriname 	Surinam	\N
00040000-5627-5fca-3d36-01e4f7da09f2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5627-5fca-5faa-158db6d40723	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5627-5fca-d67e-7df6487b7808	SE	SWE	752	Sweden 	Švedska	\N
00040000-5627-5fca-c383-dd279bd639c9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5627-5fca-1e93-177bb3607198	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5627-5fca-ba52-107c44a62eb8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5627-5fca-2669-efb80f45af24	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5627-5fca-f0c0-cbf90e7b50c6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5627-5fca-b95a-d5e2f0637ffa	TH	THA	764	Thailand 	Tajska	\N
00040000-5627-5fca-e9c1-712ce63b4801	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5627-5fca-e59b-05983e791313	TG	TGO	768	Togo 	Togo	\N
00040000-5627-5fca-564d-4304d48616f6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5627-5fca-1bda-15d2522d2ebb	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5627-5fca-bc9e-1fa644dc4d93	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5627-5fca-6f8f-0a842a141959	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5627-5fca-bf05-c646ac2fa2d2	TR	TUR	792	Turkey 	Turčija	\N
00040000-5627-5fca-885a-34e11f0d7fef	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5627-5fca-8c11-0b96f7690605	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5627-5fca-1561-bc5a9afd382d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5627-5fca-8b13-b6020e8aa5cb	UG	UGA	800	Uganda 	Uganda	\N
00040000-5627-5fca-93a1-6872db99a412	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5627-5fca-a71a-dcf36f717fba	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5627-5fca-4b5a-a846ecd72fde	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5627-5fca-03bd-30b29e5121d7	US	USA	840	United States 	Združene države Amerike	\N
00040000-5627-5fca-7f4b-7e77585334a2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5627-5fca-d967-a966d5560ed3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5627-5fca-d399-c4dbd04e5c79	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5627-5fca-9e56-e0f62b5e05a3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5627-5fca-9ded-f41a8f6c4cfc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5627-5fca-b78c-7bf251129b70	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5627-5fca-73ae-c4352eabf18d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5627-5fca-2842-169dde6b48ab	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5627-5fca-8b1d-363cc76ff653	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5627-5fca-84dd-10f777cd3294	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5627-5fca-1512-18c8dc800dfe	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5627-5fca-f0c3-8234a16dcabf	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5627-5fca-e8c2-a8f32a035522	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3116 (class 0 OID 22867670)
-- Dependencies: 235
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5627-5fcc-2064-07f5a5ea3f39	000e0000-5627-5fcc-3f5e-75943e5b2dd6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-5fca-901c-007f9c0f4a4e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5627-5fcc-7272-619cdf9a13c1	000e0000-5627-5fcc-f302-a1d82c519fbc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-5fca-4ef5-807692442ad7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5627-5fcc-34ac-6175b1a38b3c	000e0000-5627-5fcc-4613-402333db289e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-5fca-901c-007f9c0f4a4e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5627-5fcc-bd67-ba62a15bd19a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5627-5fcc-90a1-9e787b9f7680	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3101 (class 0 OID 22867471)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5627-5fcc-331d-5079ee1d0afe	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-a245-3d1736999a99	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5627-5fca-00b9-48df844fc5a3
000d0000-5627-5fcc-e178-288bec2c0f3e	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-a461-e8729ca5e54d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5627-5fca-39ce-d6cf8ef77e9f
000d0000-5627-5fcc-aa93-a05fbe1b7f4f	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-acea-01acd1675f8a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5627-5fca-a9a5-0656818327b7
000d0000-5627-5fcc-e8b9-4657400f4372	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-1df4-3c2bc4a1c696	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5627-5fca-3a93-bf9252748054
000d0000-5627-5fcc-edae-d5e14ffbac08	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-5276-e210d6a6450b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5627-5fca-3a93-bf9252748054
000d0000-5627-5fcc-e23d-120a00e6efd1	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-4378-305e9c93f77a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5627-5fca-00b9-48df844fc5a3
000d0000-5627-5fcc-d4fe-7ff3de3023ac	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-6c42-20b641f55baa	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5627-5fca-00b9-48df844fc5a3
000d0000-5627-5fcc-75c7-1a70335315a9	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-fc7b-58bbf670334a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5627-5fca-72d2-18454ea91799
000d0000-5627-5fcc-50c9-4f03b81b9a87	000e0000-5627-5fcc-f302-a1d82c519fbc	000c0000-5627-5fcc-4fda-557f4cde8269	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5627-5fca-4b3a-f748b52139d8
\.


--
-- TOC entry 3079 (class 0 OID 22867268)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 22867234)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 22867211)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5627-5fcc-be00-d440145f7bdd	00080000-5627-5fcc-c6b8-b9d3e7b82018	00090000-5627-5fcc-26a0-c202ad14dd71	AK		igralka
\.


--
-- TOC entry 3090 (class 0 OID 22867385)
-- Dependencies: 209
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 22867909)
-- Dependencies: 246
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 22867921)
-- Dependencies: 247
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 22867943)
-- Dependencies: 249
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22757748)
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
20150930165014
20151012154609
20151013160827
20151015150048
\.


--
-- TOC entry 3094 (class 0 OID 22867410)
-- Dependencies: 213
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22867168)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5627-5fca-241f-0453aac13a6a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5627-5fca-4887-b31799098934	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5627-5fca-52b7-285fe2d9bc85	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5627-5fca-b038-539fdf020605	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5627-5fca-7245-c0f1716deae9	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5627-5fca-69b2-89bb0837f609	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5627-5fca-56ee-60671388e508	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5627-5fca-68a6-e52a55bdef10	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5627-5fca-0bf5-279faf4a783f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5627-5fca-7ff0-42d95c54b249	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5627-5fca-8cae-bd2e56644c74	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5627-5fca-5d5b-69974bd0f6f0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5627-5fca-c756-147b6acc4dc3	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5627-5fca-4e3b-5b27571c7dc8	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5627-5fca-a628-e4de0f8aa33c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5627-5fcc-6fc6-ed545b342e6c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5627-5fcc-fc8a-4abf529322e7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5627-5fcc-13d3-2b144bfc00d5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5627-5fcc-2f4c-eb4461cc3a4e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5627-5fcc-4f02-aec7237ed6cc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5627-5fcd-ca4c-4f96ee9049fd	application.tenant.maticnopodjetje	string	s:36:"00080000-5627-5fcd-5645-33ffdc27829b";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3064 (class 0 OID 22867071)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5627-5fcc-e1d1-21893cc0a2b7	00000000-5627-5fcc-6fc6-ed545b342e6c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5627-5fcc-982d-57b3de29bc30	00000000-5627-5fcc-6fc6-ed545b342e6c	00010000-5627-5fca-7002-8f55986da792	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5627-5fcc-e582-5e7e7ddf2a23	00000000-5627-5fcc-fc8a-4abf529322e7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3068 (class 0 OID 22867135)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5627-5fcc-6406-587fe39f8143	\N	00100000-5627-5fcc-ac47-9594cc378f48	00100000-5627-5fcc-51b6-b159642d3f1f	01	Gledališče Nimbis
00410000-5627-5fcc-717d-544d4e009c9b	00410000-5627-5fcc-6406-587fe39f8143	00100000-5627-5fcc-ac47-9594cc378f48	00100000-5627-5fcc-51b6-b159642d3f1f	02	Tehnika
\.


--
-- TOC entry 3065 (class 0 OID 22867082)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5627-5fcc-4e23-1a72afc72062	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5627-5fcc-1585-977f2742ac45	00010000-5627-5fcc-386e-e4fd5cee53f0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5627-5fcc-a1ee-9c29003c3c83	00010000-5627-5fcc-9573-099607c6bd70	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5627-5fcc-8d5a-e4e65f877f12	00010000-5627-5fcc-e547-e58cc7bc4b24	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5627-5fcc-eb4d-7f982d99c3d7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5627-5fcc-74bc-c678457a029c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5627-5fcc-e140-cd14fd9e81d4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5627-5fcc-c466-ad70d9622cfc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5627-5fcc-26a0-c202ad14dd71	00010000-5627-5fcc-71f7-b524b1fad699	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5627-5fcc-d1bd-58a0fd1cdcad	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5627-5fcc-6a5c-63b12ab99602	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5627-5fcc-81ef-3aaf578175e6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5627-5fcc-3d96-2671c385aab3	00010000-5627-5fcc-f185-b248bc059153	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5627-5fcc-9b9e-13544a93e77c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-5fcc-1f04-8cf0f79424d4	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-5fcc-7ea0-a6da9a09fa3a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-5fcc-d85b-23668fde400b	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5627-5fcc-f75c-787e093a6844	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 22867026)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5627-5fca-44cf-9c4199d69f66	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5627-5fca-fe70-93afaae6b20a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5627-5fca-0011-6c00e2c7c4d7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5627-5fca-72e3-86cafb21d6c8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5627-5fca-bde2-808dfb22a7e1	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5627-5fca-054a-c0cb48fe06db	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5627-5fca-11c7-d51c2f777b72	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5627-5fca-210d-7ac4f5a18e7f	Abonma-read	Abonma - branje	f
00030000-5627-5fca-e227-64b71995d79e	Abonma-write	Abonma - spreminjanje	f
00030000-5627-5fca-a778-1cc4adac5d47	Alternacija-read	Alternacija - branje	f
00030000-5627-5fca-14a3-e68c420831ba	Alternacija-write	Alternacija - spreminjanje	f
00030000-5627-5fca-3e08-8502bd0acffe	Arhivalija-read	Arhivalija - branje	f
00030000-5627-5fca-4d75-2541e1369a91	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5627-5fca-5bc6-8421da178e5e	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5627-5fca-45c8-b6ee0bdf18be	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5627-5fca-092b-b0c2236ad3a2	Besedilo-read	Besedilo - branje	f
00030000-5627-5fca-bb63-1811221f50b0	Besedilo-write	Besedilo - spreminjanje	f
00030000-5627-5fca-824e-0e3ee50b731a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5627-5fca-7c22-d7b511b84a5e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5627-5fca-da54-17de4e0081b0	Dogodek-read	Dogodek - branje	f
00030000-5627-5fca-f49b-7985708282f7	Dogodek-write	Dogodek - spreminjanje	f
00030000-5627-5fca-3184-79afb8cfc873	DrugiVir-read	DrugiVir - branje	f
00030000-5627-5fca-87d9-6e75e87b17e4	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5627-5fca-9d59-c17e293dbd64	Drzava-read	Drzava - branje	f
00030000-5627-5fca-c8e2-c0290d6db9ea	Drzava-write	Drzava - spreminjanje	f
00030000-5627-5fca-faf1-b5227ea883d6	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5627-5fca-d2ab-394138629e14	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5627-5fca-2988-426cf0c19f6f	Funkcija-read	Funkcija - branje	f
00030000-5627-5fca-4ce0-9251c2b1338b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5627-5fca-ef79-a50fef4e266e	Gostovanje-read	Gostovanje - branje	f
00030000-5627-5fca-1488-319103438b5a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5627-5fca-b009-8e86c33960f1	Gostujoca-read	Gostujoca - branje	f
00030000-5627-5fca-6e0f-629181b699f7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5627-5fca-2175-949982f8cb6d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5627-5fca-d415-8669933b4bef	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5627-5fca-6bd3-36d58483651a	Kupec-read	Kupec - branje	f
00030000-5627-5fca-b74c-b2055c70bddc	Kupec-write	Kupec - spreminjanje	f
00030000-5627-5fca-f6c9-859d45086969	NacinPlacina-read	NacinPlacina - branje	f
00030000-5627-5fca-cb58-cd9fa0561490	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5627-5fca-4215-509e0289254a	Option-read	Option - branje	f
00030000-5627-5fca-288a-ed24ca5f5bdc	Option-write	Option - spreminjanje	f
00030000-5627-5fca-d94b-60bc0c9f6514	OptionValue-read	OptionValue - branje	f
00030000-5627-5fca-8c12-ee8d17eaa4f4	OptionValue-write	OptionValue - spreminjanje	f
00030000-5627-5fca-472e-496124179810	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5627-5fca-3fda-238e8d320554	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5627-5fca-9daa-df7e67b8ba01	Oseba-read	Oseba - branje	f
00030000-5627-5fca-63d2-b84fe23fd09b	Oseba-write	Oseba - spreminjanje	f
00030000-5627-5fca-ee51-2ba53e54d1c3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5627-5fca-361d-fcc37185cc6a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5627-5fca-83ef-ca025e612c7c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5627-5fca-3ac2-711fd33951b2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5627-5fca-a682-eabf8beb7133	Pogodba-read	Pogodba - branje	f
00030000-5627-5fca-2ff7-88ecb6fad10f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5627-5fca-1cfe-e7946c0ef40a	Popa-read	Popa - branje	f
00030000-5627-5fca-4925-77362e7576e9	Popa-write	Popa - spreminjanje	f
00030000-5627-5fca-3791-1b37a231da25	Posta-read	Posta - branje	f
00030000-5627-5fca-883e-a34b58cc77f0	Posta-write	Posta - spreminjanje	f
00030000-5627-5fca-8ae6-441b3a712aa2	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5627-5fca-ef8f-34bd3bea5d0d	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5627-5fca-8560-4f338f6d846c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5627-5fca-78b0-e15e28fbc671	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5627-5fca-7b94-7b25e5772ec7	PostniNaslov-read	PostniNaslov - branje	f
00030000-5627-5fca-b925-ec17a4bee952	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5627-5fca-d519-611f4c13484c	Predstava-read	Predstava - branje	f
00030000-5627-5fca-a4a5-3709448d19af	Predstava-write	Predstava - spreminjanje	f
00030000-5627-5fca-444e-860249f70bda	Praznik-read	Praznik - branje	f
00030000-5627-5fca-c507-58e727ece261	Praznik-write	Praznik - spreminjanje	f
00030000-5627-5fca-d174-f217f70ae394	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5627-5fca-b174-f2414bb8b6fb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5627-5fca-647f-df206bb2f718	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5627-5fca-9a19-521a11918d2e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5627-5fca-c409-a485ee5f0b2f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5627-5fca-8957-4d98249ca036	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5627-5fca-281d-2640e283e807	ProgramDela-read	ProgramDela - branje	f
00030000-5627-5fca-399d-80ff06e59d04	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5627-5fca-4304-bfaae2b2ed3d	ProgramFestival-read	ProgramFestival - branje	f
00030000-5627-5fca-9b08-86ddad424685	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5627-5fca-9e90-7f8feddc650b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5627-5fca-53a9-985b021ddd73	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5627-5fca-f31d-12de09323d0c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5627-5fca-0839-df34f12ae4af	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5627-5fca-b6b3-af057c2711b2	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5627-5fca-fd73-bb331f9ea2e6	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5627-5fca-2ea6-971906553b02	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5627-5fca-6bf7-151548fa2a57	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5627-5fca-dc0a-13148aa546ae	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5627-5fca-911f-a04f76ec186f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5627-5fca-00f7-5f111a127835	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5627-5fca-929c-9ee40af45f54	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5627-5fca-5872-94996b4294f0	ProgramRazno-read	ProgramRazno - branje	f
00030000-5627-5fca-30d3-80cf9511e548	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5627-5fca-593d-cbc55db841f0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5627-5fca-8248-8881e2320b88	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5627-5fca-d207-0e8b26ab5aad	Prostor-read	Prostor - branje	f
00030000-5627-5fca-9699-47cb2cff2ea5	Prostor-write	Prostor - spreminjanje	f
00030000-5627-5fca-2c3d-914c6e80aa78	Racun-read	Racun - branje	f
00030000-5627-5fca-9ca9-0ef8acb768b4	Racun-write	Racun - spreminjanje	f
00030000-5627-5fca-49f0-aa28860280f2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5627-5fca-e034-05915d1b78b2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5627-5fca-ed23-59c4bae88abd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5627-5fca-ee72-dfe1dcb84631	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5627-5fca-df7c-3b2508721d7e	Rekvizit-read	Rekvizit - branje	f
00030000-5627-5fca-5833-fb365e940499	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5627-5fca-7438-9f61b31fe22a	Revizija-read	Revizija - branje	f
00030000-5627-5fca-fc83-e97d80966142	Revizija-write	Revizija - spreminjanje	f
00030000-5627-5fca-9e12-b5ff59b17ec0	Rezervacija-read	Rezervacija - branje	f
00030000-5627-5fca-3eec-6f066c037512	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5627-5fca-0454-3e092986926c	SedezniRed-read	SedezniRed - branje	f
00030000-5627-5fca-ad1b-90847747d6fe	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5627-5fca-b62f-9a02488e69af	Sedez-read	Sedez - branje	f
00030000-5627-5fca-6563-e20d3e18e0e3	Sedez-write	Sedez - spreminjanje	f
00030000-5627-5fca-5ac2-b436a2860157	Sezona-read	Sezona - branje	f
00030000-5627-5fca-0897-e2a19ac31907	Sezona-write	Sezona - spreminjanje	f
00030000-5627-5fca-2a11-937ce547b97c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5627-5fca-97b5-f66605258c70	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5627-5fca-5dd7-22f1a3c95a25	Stevilcenje-read	Stevilcenje - branje	f
00030000-5627-5fca-8950-aa14d7c710be	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5627-5fca-b60e-4c4db473d983	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5627-5fca-565a-045d953468c0	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5627-5fca-76ae-35333d583fef	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5627-5fca-e281-7cf3024317c8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5627-5fca-7158-ea1ce1c529e3	Telefonska-read	Telefonska - branje	f
00030000-5627-5fca-a846-ee5814a784fe	Telefonska-write	Telefonska - spreminjanje	f
00030000-5627-5fca-25ba-1f9f2964274b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5627-5fca-ed64-43af28cc0b24	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5627-5fca-a894-50698bc74de5	TipFunkcije-read	TipFunkcije - branje	f
00030000-5627-5fca-4ca5-a3a6a3dc916d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5627-5fca-cc13-b6c7b53ef9b4	TipPopa-read	TipPopa - branje	f
00030000-5627-5fca-9c6a-b161c94c242b	TipPopa-write	TipPopa - spreminjanje	f
00030000-5627-5fca-cc10-b06591a1f5a6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5627-5fca-2fa9-2cf68093e5a4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5627-5fca-c9fe-c22389e9df5a	TipVaje-read	TipVaje - branje	f
00030000-5627-5fca-599f-de7f3108a4cb	TipVaje-write	TipVaje - spreminjanje	f
00030000-5627-5fca-b731-c3a969e7da33	Trr-read	Trr - branje	f
00030000-5627-5fca-cecb-00854a9ee2f0	Trr-write	Trr - spreminjanje	f
00030000-5627-5fca-7eb4-4bfe7224b6a2	Uprizoritev-read	Uprizoritev - branje	f
00030000-5627-5fca-7e99-00ecaf0ae94a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5627-5fca-3c9c-4b4167311cdd	Vaja-read	Vaja - branje	f
00030000-5627-5fca-3ba0-cb1caf3cea2d	Vaja-write	Vaja - spreminjanje	f
00030000-5627-5fca-3723-7f64d4c6bc4c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5627-5fca-6dd6-0e69a8e29feb	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5627-5fca-a1e6-20ec0d463cf0	VrstaStroska-read	VrstaStroska - branje	f
00030000-5627-5fca-a72c-0313dd705b1e	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5627-5fca-73e9-a22ce76a4bb1	Zaposlitev-read	Zaposlitev - branje	f
00030000-5627-5fca-122b-8a02dd46860d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5627-5fca-906c-8823f4fcf138	Zasedenost-read	Zasedenost - branje	f
00030000-5627-5fca-72d4-e1b85e587cd1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5627-5fca-535a-b498f865c6ad	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5627-5fca-34a3-a66cfa3fb827	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5627-5fca-4590-dd8255e9ee73	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5627-5fca-6357-f001d751b717	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5627-5fca-e6ec-b40107278ca0	Job-read	Branje opravil - samo zase - branje	f
00030000-5627-5fca-4073-da2b8ddb846c	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5627-5fca-f78a-c1be75a537e5	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5627-5fca-94a7-96e5a05bb770	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5627-5fca-129a-e99cf0b1c33b	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5627-5fca-fed3-e000b4b66e62	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5627-5fca-78e7-49ded1d1c9e0	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5627-5fca-0419-b8131b64901b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5627-5fca-0d21-f84c55ce4dd8	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5627-5fca-5f98-bbe4ab225840	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5627-5fca-9f76-910efe890206	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5627-5fca-69e7-73794fd6c429	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5627-5fca-a461-5946103e3328	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5627-5fca-4673-11f164a9c95d	Datoteka-write	Datoteka - spreminjanje	f
00030000-5627-5fca-d264-288b28152eef	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3061 (class 0 OID 22867045)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5627-5fca-68dc-b5da1e4e59fe	00030000-5627-5fca-fe70-93afaae6b20a
00020000-5627-5fca-beac-1e1c9816ccbd	00030000-5627-5fca-9d59-c17e293dbd64
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-210d-7ac4f5a18e7f
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-e227-64b71995d79e
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-a778-1cc4adac5d47
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-14a3-e68c420831ba
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-3e08-8502bd0acffe
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-da54-17de4e0081b0
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-72e3-86cafb21d6c8
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-f49b-7985708282f7
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-9d59-c17e293dbd64
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-c8e2-c0290d6db9ea
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-2988-426cf0c19f6f
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-4ce0-9251c2b1338b
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-ef79-a50fef4e266e
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-1488-319103438b5a
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-b009-8e86c33960f1
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-6e0f-629181b699f7
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-2175-949982f8cb6d
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-d415-8669933b4bef
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-4215-509e0289254a
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-d94b-60bc0c9f6514
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-9daa-df7e67b8ba01
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-63d2-b84fe23fd09b
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-1cfe-e7946c0ef40a
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-4925-77362e7576e9
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-3791-1b37a231da25
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-883e-a34b58cc77f0
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-7b94-7b25e5772ec7
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-b925-ec17a4bee952
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-d519-611f4c13484c
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-a4a5-3709448d19af
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-c409-a485ee5f0b2f
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-8957-4d98249ca036
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-d207-0e8b26ab5aad
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-9699-47cb2cff2ea5
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-ed23-59c4bae88abd
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-ee72-dfe1dcb84631
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-df7c-3b2508721d7e
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-5833-fb365e940499
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-5ac2-b436a2860157
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-0897-e2a19ac31907
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-a894-50698bc74de5
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-7eb4-4bfe7224b6a2
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-7e99-00ecaf0ae94a
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-3c9c-4b4167311cdd
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-3ba0-cb1caf3cea2d
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-906c-8823f4fcf138
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-72d4-e1b85e587cd1
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-535a-b498f865c6ad
00020000-5627-5fca-f5ed-f3cfb689aa4a	00030000-5627-5fca-4590-dd8255e9ee73
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-210d-7ac4f5a18e7f
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-3e08-8502bd0acffe
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-da54-17de4e0081b0
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-9d59-c17e293dbd64
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-ef79-a50fef4e266e
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-b009-8e86c33960f1
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-2175-949982f8cb6d
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-d415-8669933b4bef
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-4215-509e0289254a
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-d94b-60bc0c9f6514
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-9daa-df7e67b8ba01
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-63d2-b84fe23fd09b
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-1cfe-e7946c0ef40a
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-3791-1b37a231da25
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-7b94-7b25e5772ec7
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-b925-ec17a4bee952
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-d519-611f4c13484c
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-d207-0e8b26ab5aad
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-ed23-59c4bae88abd
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-df7c-3b2508721d7e
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-5ac2-b436a2860157
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-7158-ea1ce1c529e3
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-a846-ee5814a784fe
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-b731-c3a969e7da33
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-cecb-00854a9ee2f0
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-73e9-a22ce76a4bb1
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-122b-8a02dd46860d
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-535a-b498f865c6ad
00020000-5627-5fca-7183-e6085f8f4e9a	00030000-5627-5fca-4590-dd8255e9ee73
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-210d-7ac4f5a18e7f
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-a778-1cc4adac5d47
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-3e08-8502bd0acffe
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-4d75-2541e1369a91
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-092b-b0c2236ad3a2
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-824e-0e3ee50b731a
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-da54-17de4e0081b0
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-9d59-c17e293dbd64
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-2988-426cf0c19f6f
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-ef79-a50fef4e266e
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-b009-8e86c33960f1
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-2175-949982f8cb6d
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-4215-509e0289254a
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-d94b-60bc0c9f6514
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-9daa-df7e67b8ba01
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-1cfe-e7946c0ef40a
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-3791-1b37a231da25
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-d519-611f4c13484c
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-c409-a485ee5f0b2f
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-d207-0e8b26ab5aad
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-ed23-59c4bae88abd
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-df7c-3b2508721d7e
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-5ac2-b436a2860157
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-a894-50698bc74de5
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-3c9c-4b4167311cdd
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-906c-8823f4fcf138
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-535a-b498f865c6ad
00020000-5627-5fca-73d4-9e3d21c7473a	00030000-5627-5fca-4590-dd8255e9ee73
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-210d-7ac4f5a18e7f
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-e227-64b71995d79e
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-14a3-e68c420831ba
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-3e08-8502bd0acffe
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-da54-17de4e0081b0
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-9d59-c17e293dbd64
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-ef79-a50fef4e266e
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-b009-8e86c33960f1
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-4215-509e0289254a
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-d94b-60bc0c9f6514
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-1cfe-e7946c0ef40a
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-3791-1b37a231da25
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-d519-611f4c13484c
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-d207-0e8b26ab5aad
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-ed23-59c4bae88abd
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-df7c-3b2508721d7e
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-5ac2-b436a2860157
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-a894-50698bc74de5
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-535a-b498f865c6ad
00020000-5627-5fca-1cd1-3d9866e3989a	00030000-5627-5fca-4590-dd8255e9ee73
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-210d-7ac4f5a18e7f
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-3e08-8502bd0acffe
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-da54-17de4e0081b0
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-9d59-c17e293dbd64
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-ef79-a50fef4e266e
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-b009-8e86c33960f1
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-4215-509e0289254a
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-d94b-60bc0c9f6514
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-1cfe-e7946c0ef40a
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-3791-1b37a231da25
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-d519-611f4c13484c
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-d207-0e8b26ab5aad
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-ed23-59c4bae88abd
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-df7c-3b2508721d7e
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-5ac2-b436a2860157
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-25ba-1f9f2964274b
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-0011-6c00e2c7c4d7
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-a894-50698bc74de5
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-535a-b498f865c6ad
00020000-5627-5fca-8af4-8be5cd2f7396	00030000-5627-5fca-4590-dd8255e9ee73
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-44cf-9c4199d69f66
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-fe70-93afaae6b20a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-210d-7ac4f5a18e7f
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-e227-64b71995d79e
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-a778-1cc4adac5d47
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-14a3-e68c420831ba
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3e08-8502bd0acffe
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-4d75-2541e1369a91
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-5bc6-8421da178e5e
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-45c8-b6ee0bdf18be
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-092b-b0c2236ad3a2
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-bb63-1811221f50b0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-824e-0e3ee50b731a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-7c22-d7b511b84a5e
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-da54-17de4e0081b0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-72e3-86cafb21d6c8
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-f49b-7985708282f7
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3184-79afb8cfc873
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-87d9-6e75e87b17e4
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9d59-c17e293dbd64
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-c8e2-c0290d6db9ea
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-faf1-b5227ea883d6
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-d2ab-394138629e14
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-2988-426cf0c19f6f
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-4ce0-9251c2b1338b
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-ef79-a50fef4e266e
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-1488-319103438b5a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b009-8e86c33960f1
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-6e0f-629181b699f7
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-2175-949982f8cb6d
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-d415-8669933b4bef
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-6bd3-36d58483651a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b74c-b2055c70bddc
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-f6c9-859d45086969
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-cb58-cd9fa0561490
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-4215-509e0289254a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-d94b-60bc0c9f6514
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-8c12-ee8d17eaa4f4
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-288a-ed24ca5f5bdc
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-472e-496124179810
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3fda-238e8d320554
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9daa-df7e67b8ba01
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-bde2-808dfb22a7e1
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-63d2-b84fe23fd09b
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-ee51-2ba53e54d1c3
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-361d-fcc37185cc6a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-83ef-ca025e612c7c
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3ac2-711fd33951b2
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-a682-eabf8beb7133
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-2ff7-88ecb6fad10f
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-1cfe-e7946c0ef40a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-4925-77362e7576e9
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3791-1b37a231da25
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-8ae6-441b3a712aa2
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-ef8f-34bd3bea5d0d
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-8560-4f338f6d846c
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-78b0-e15e28fbc671
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-883e-a34b58cc77f0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-7b94-7b25e5772ec7
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b925-ec17a4bee952
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-444e-860249f70bda
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-c507-58e727ece261
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-d519-611f4c13484c
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-a4a5-3709448d19af
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-d174-f217f70ae394
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b174-f2414bb8b6fb
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-647f-df206bb2f718
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9a19-521a11918d2e
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-c409-a485ee5f0b2f
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-8957-4d98249ca036
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-054a-c0cb48fe06db
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-281d-2640e283e807
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-11c7-d51c2f777b72
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-399d-80ff06e59d04
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-4304-bfaae2b2ed3d
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9b08-86ddad424685
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9e90-7f8feddc650b
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-53a9-985b021ddd73
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-f31d-12de09323d0c
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-0839-df34f12ae4af
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b6b3-af057c2711b2
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-fd73-bb331f9ea2e6
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-2ea6-971906553b02
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-6bf7-151548fa2a57
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-dc0a-13148aa546ae
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-911f-a04f76ec186f
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-00f7-5f111a127835
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-929c-9ee40af45f54
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-5872-94996b4294f0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-30d3-80cf9511e548
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-593d-cbc55db841f0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-8248-8881e2320b88
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-d207-0e8b26ab5aad
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9699-47cb2cff2ea5
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-2c3d-914c6e80aa78
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9ca9-0ef8acb768b4
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-49f0-aa28860280f2
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-e034-05915d1b78b2
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-ed23-59c4bae88abd
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-ee72-dfe1dcb84631
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-df7c-3b2508721d7e
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-5833-fb365e940499
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-7438-9f61b31fe22a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-fc83-e97d80966142
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9e12-b5ff59b17ec0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3eec-6f066c037512
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-0454-3e092986926c
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-ad1b-90847747d6fe
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b62f-9a02488e69af
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-6563-e20d3e18e0e3
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-5ac2-b436a2860157
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-0897-e2a19ac31907
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-2a11-937ce547b97c
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-97b5-f66605258c70
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-5dd7-22f1a3c95a25
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b60e-4c4db473d983
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-565a-045d953468c0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-8950-aa14d7c710be
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-76ae-35333d583fef
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-e281-7cf3024317c8
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-7158-ea1ce1c529e3
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-a846-ee5814a784fe
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-25ba-1f9f2964274b
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-0011-6c00e2c7c4d7
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-ed64-43af28cc0b24
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-a894-50698bc74de5
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-4ca5-a3a6a3dc916d
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-cc13-b6c7b53ef9b4
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-9c6a-b161c94c242b
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-cc10-b06591a1f5a6
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-2fa9-2cf68093e5a4
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-c9fe-c22389e9df5a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-599f-de7f3108a4cb
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-b731-c3a969e7da33
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-cecb-00854a9ee2f0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-7eb4-4bfe7224b6a2
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-7e99-00ecaf0ae94a
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3c9c-4b4167311cdd
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3ba0-cb1caf3cea2d
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-3723-7f64d4c6bc4c
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-6dd6-0e69a8e29feb
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-a1e6-20ec0d463cf0
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-a72c-0313dd705b1e
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-73e9-a22ce76a4bb1
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-122b-8a02dd46860d
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-906c-8823f4fcf138
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-72d4-e1b85e587cd1
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-535a-b498f865c6ad
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-34a3-a66cfa3fb827
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-4590-dd8255e9ee73
00020000-5627-5fcc-c686-492d7f442077	00030000-5627-5fca-6357-f001d751b717
\.


--
-- TOC entry 3095 (class 0 OID 22867417)
-- Dependencies: 214
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 22867451)
-- Dependencies: 218
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 22867588)
-- Dependencies: 230
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5627-5fcc-1b0e-86ee0cf1f6d2	00090000-5627-5fcc-4e23-1a72afc72062	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5627-5fcc-d25d-23e2d1791655	00090000-5627-5fcc-74bc-c678457a029c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5627-5fcc-cedb-095124568382	00090000-5627-5fcc-3d96-2671c385aab3	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5627-5fcc-cbea-856d492ef8ac	00090000-5627-5fcc-d1bd-58a0fd1cdcad	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3067 (class 0 OID 22867115)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5627-5fcc-c6b8-b9d3e7b82018	\N	00040000-5627-5fca-876b-b19054e5754d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcc-c95e-73b3bfbe831f	\N	00040000-5627-5fca-876b-b19054e5754d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5627-5fcc-7bce-42e41cdda4b9	\N	00040000-5627-5fca-876b-b19054e5754d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcc-1af8-61d048c2c0a9	\N	00040000-5627-5fca-876b-b19054e5754d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcc-dab7-8b7d01b86d90	\N	00040000-5627-5fca-876b-b19054e5754d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcc-0a20-eac2024abee1	\N	00040000-5627-5fca-174d-57aa2127ffca	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcc-4624-ae9db04d56e3	\N	00040000-5627-5fca-c7da-c5d7b8828c25	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcc-1c69-ffcb504381f1	\N	00040000-5627-5fca-d731-53fcd049913d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcc-a069-279128b90d1d	\N	00040000-5627-5fca-ad54-f6c3d5a4bdd8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-5fcd-5645-33ffdc27829b	\N	00040000-5627-5fca-876b-b19054e5754d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3070 (class 0 OID 22867160)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5627-5fc9-d8de-545a0dce01b2	8341	Adlešiči
00050000-5627-5fc9-5aee-a04843059972	5270	Ajdovščina
00050000-5627-5fc9-2ac0-38c7ec7cecbc	6280	Ankaran/Ancarano
00050000-5627-5fc9-4e74-b385c2f65635	9253	Apače
00050000-5627-5fc9-368d-c82aaebd1991	8253	Artiče
00050000-5627-5fc9-75ee-554fa2754a27	4275	Begunje na Gorenjskem
00050000-5627-5fc9-52c5-8ef9df4f3568	1382	Begunje pri Cerknici
00050000-5627-5fc9-ce15-56826b7a5ad3	9231	Beltinci
00050000-5627-5fc9-ae0c-670cfe1e6c96	2234	Benedikt
00050000-5627-5fc9-d578-78fb4f0be484	2345	Bistrica ob Dravi
00050000-5627-5fc9-ae49-68f889405790	3256	Bistrica ob Sotli
00050000-5627-5fc9-bfe7-2959828cdb0f	8259	Bizeljsko
00050000-5627-5fc9-b994-968fe6f52d7f	1223	Blagovica
00050000-5627-5fc9-d94e-34064c6435d8	8283	Blanca
00050000-5627-5fc9-95ff-fcc4b9c71f6d	4260	Bled
00050000-5627-5fc9-c875-b0606faaa053	4273	Blejska Dobrava
00050000-5627-5fc9-f0c2-679ef80ba883	9265	Bodonci
00050000-5627-5fc9-c29a-8e463eee535c	9222	Bogojina
00050000-5627-5fc9-95d5-c1942d1b5b10	4263	Bohinjska Bela
00050000-5627-5fc9-31f5-bc8c66ddaca2	4264	Bohinjska Bistrica
00050000-5627-5fc9-80f9-8d8b7359c5f5	4265	Bohinjsko jezero
00050000-5627-5fc9-780b-56ec4e27536d	1353	Borovnica
00050000-5627-5fc9-aed7-c9a75e38a2f1	8294	Boštanj
00050000-5627-5fc9-00fb-4da825dbdd78	5230	Bovec
00050000-5627-5fc9-8e7e-36a9f347d6c3	5295	Branik
00050000-5627-5fc9-d6b3-7ae0b096f850	3314	Braslovče
00050000-5627-5fc9-ffd5-f62ec96144f3	5223	Breginj
00050000-5627-5fc9-f634-8295cea31c92	8280	Brestanica
00050000-5627-5fc9-b918-5fc47801e763	2354	Bresternica
00050000-5627-5fc9-88f4-6bc12eb8a33c	4243	Brezje
00050000-5627-5fc9-dcfc-e2a3577bc5fa	1351	Brezovica pri Ljubljani
00050000-5627-5fc9-406e-38f908c517e3	8250	Brežice
00050000-5627-5fc9-fed3-e1b56bf88092	4210	Brnik - Aerodrom
00050000-5627-5fc9-44ef-603a655bd74c	8321	Brusnice
00050000-5627-5fc9-0dc3-b1414f48b781	3255	Buče
00050000-5627-5fc9-cb49-5d7a1d1b58c0	8276	Bučka 
00050000-5627-5fc9-2054-ff117f8e3996	9261	Cankova
00050000-5627-5fc9-46fc-ca76abc820eb	3000	Celje 
00050000-5627-5fc9-2e10-52c1f02fc2bc	3001	Celje - poštni predali
00050000-5627-5fc9-5a47-e63f67ac698a	4207	Cerklje na Gorenjskem
00050000-5627-5fc9-a922-306be0723009	8263	Cerklje ob Krki
00050000-5627-5fc9-82e0-5c7a359ae699	1380	Cerknica
00050000-5627-5fc9-d589-58ccc3bc5bb3	5282	Cerkno
00050000-5627-5fc9-7d78-69bdd7ba94ad	2236	Cerkvenjak
00050000-5627-5fc9-9531-87b34e78f389	2215	Ceršak
00050000-5627-5fc9-3f7a-1791da4dfd78	2326	Cirkovce
00050000-5627-5fc9-b317-dcbb180ab503	2282	Cirkulane
00050000-5627-5fc9-9638-39793cc51000	5273	Col
00050000-5627-5fc9-9ab6-3634030ff168	8251	Čatež ob Savi
00050000-5627-5fc9-776d-0a0c71b70e32	1413	Čemšenik
00050000-5627-5fc9-2f38-b52db10ae970	5253	Čepovan
00050000-5627-5fc9-2420-6597cae83657	9232	Črenšovci
00050000-5627-5fc9-6b6d-d8043de9dbd1	2393	Črna na Koroškem
00050000-5627-5fc9-8115-4f9c25cfdbb7	6275	Črni Kal
00050000-5627-5fc9-eaf3-c270ea0e8915	5274	Črni Vrh nad Idrijo
00050000-5627-5fc9-d8f4-1fc1ff0c4e14	5262	Črniče
00050000-5627-5fc9-2cc3-5d666d19dcaa	8340	Črnomelj
00050000-5627-5fc9-8b76-955322a5795c	6271	Dekani
00050000-5627-5fc9-8bea-aeabc534b567	5210	Deskle
00050000-5627-5fc9-7372-0ed257dfdd8f	2253	Destrnik
00050000-5627-5fc9-64f5-3ec2af428c8d	6215	Divača
00050000-5627-5fc9-c3f2-cb4cfad5c239	1233	Dob
00050000-5627-5fc9-5a65-d948a4945dcd	3224	Dobje pri Planini
00050000-5627-5fc9-0c3d-649da4825c70	8257	Dobova
00050000-5627-5fc9-c358-818f2aeddeef	1423	Dobovec
00050000-5627-5fc9-0279-2c2e80a130ef	5263	Dobravlje
00050000-5627-5fc9-7263-23ecdaa78d70	3204	Dobrna
00050000-5627-5fc9-6069-416fdacc99f2	8211	Dobrnič
00050000-5627-5fc9-6d03-01ac7f71ca7f	1356	Dobrova
00050000-5627-5fc9-3194-2523a18d5179	9223	Dobrovnik/Dobronak 
00050000-5627-5fc9-5504-88c2c611c327	5212	Dobrovo v Brdih
00050000-5627-5fc9-d0ac-8b467f0d4538	1431	Dol pri Hrastniku
00050000-5627-5fc9-4c5b-dd663d0b27b7	1262	Dol pri Ljubljani
00050000-5627-5fc9-4eb5-0209ca89d5bc	1273	Dole pri Litiji
00050000-5627-5fc9-39d7-32af4323048e	1331	Dolenja vas
00050000-5627-5fc9-8cf4-96a2b546da1d	8350	Dolenjske Toplice
00050000-5627-5fc9-cfbb-9dd1de3c9383	1230	Domžale
00050000-5627-5fc9-7703-736dbf583d85	2252	Dornava
00050000-5627-5fc9-909a-70782dc3e5ff	5294	Dornberk
00050000-5627-5fc9-90fd-1b060358683a	1319	Draga
00050000-5627-5fc9-710f-7f93ad97fd09	8343	Dragatuš
00050000-5627-5fc9-727f-82e13e65b402	3222	Dramlje
00050000-5627-5fc9-2445-27cc84c731a7	2370	Dravograd
00050000-5627-5fc9-5996-14036b513c84	4203	Duplje
00050000-5627-5fc9-eb60-2d8fc23f06b7	6221	Dutovlje
00050000-5627-5fc9-f850-fae77ac46c4a	8361	Dvor
00050000-5627-5fc9-b101-636df6d92f77	2343	Fala
00050000-5627-5fc9-266b-7cff2a6e844c	9208	Fokovci
00050000-5627-5fc9-8264-e892a1d2098c	2313	Fram
00050000-5627-5fc9-638a-915ed880b5ee	3213	Frankolovo
00050000-5627-5fc9-e7c6-5d8223142d58	1274	Gabrovka
00050000-5627-5fc9-6582-370e315ae43e	8254	Globoko
00050000-5627-5fc9-ac14-e81c69e64861	5275	Godovič
00050000-5627-5fc9-6cf4-66aba381dda2	4204	Golnik
00050000-5627-5fc9-6687-2e3b2c099b23	3303	Gomilsko
00050000-5627-5fc9-2e6c-97c962f302d9	4224	Gorenja vas
00050000-5627-5fc9-1357-8ef7792a6442	3263	Gorica pri Slivnici
00050000-5627-5fc9-167d-81c66a119d04	2272	Gorišnica
00050000-5627-5fc9-7028-df37f8f76be8	9250	Gornja Radgona
00050000-5627-5fca-6213-65a031bd5b92	3342	Gornji Grad
00050000-5627-5fca-c7e6-62c44a756296	4282	Gozd Martuljek
00050000-5627-5fca-88ad-ee363703e086	6272	Gračišče
00050000-5627-5fca-1cd8-11f2a44c8718	9264	Grad
00050000-5627-5fca-16c3-9a8295313e96	8332	Gradac
00050000-5627-5fca-a238-6ab623c72243	1384	Grahovo
00050000-5627-5fca-1b24-a68956f938b8	5242	Grahovo ob Bači
00050000-5627-5fca-62ac-306d7d20e3b2	5251	Grgar
00050000-5627-5fca-7ae8-5caca56ea045	3302	Griže
00050000-5627-5fca-110a-e3d078730061	3231	Grobelno
00050000-5627-5fca-103d-64f85c658427	1290	Grosuplje
00050000-5627-5fca-52aa-6ceec3a72bb5	2288	Hajdina
00050000-5627-5fca-992d-08d454cc6849	8362	Hinje
00050000-5627-5fca-806f-97686c001757	2311	Hoče
00050000-5627-5fca-62a9-5d283161834e	9205	Hodoš/Hodos
00050000-5627-5fca-d783-613c9b69783d	1354	Horjul
00050000-5627-5fca-db53-71fc108e4f89	1372	Hotedršica
00050000-5627-5fca-e66a-0db8418ef71b	1430	Hrastnik
00050000-5627-5fca-922d-a5608fb577fd	6225	Hruševje
00050000-5627-5fca-30e7-fd81866d1f1e	4276	Hrušica
00050000-5627-5fca-4e58-97ac850922b6	5280	Idrija
00050000-5627-5fca-97a6-0719523a6c0e	1292	Ig
00050000-5627-5fca-a91e-c3b7a23d6912	6250	Ilirska Bistrica
00050000-5627-5fca-5151-6c9e7e166665	6251	Ilirska Bistrica-Trnovo
00050000-5627-5fca-efca-4d3f952a8a16	1295	Ivančna Gorica
00050000-5627-5fca-87a3-d40d0cd835fb	2259	Ivanjkovci
00050000-5627-5fca-bd73-a91970891c1c	1411	Izlake
00050000-5627-5fca-cf83-d948f6c80901	6310	Izola/Isola
00050000-5627-5fca-dd99-84f3dcb94d37	2222	Jakobski Dol
00050000-5627-5fca-f463-a2e356a63e7b	2221	Jarenina
00050000-5627-5fca-a5e2-e0cc13ee094a	6254	Jelšane
00050000-5627-5fca-c31c-ad8ec84c6ada	4270	Jesenice
00050000-5627-5fca-65c4-e31e3e3220c7	8261	Jesenice na Dolenjskem
00050000-5627-5fca-8d4d-09cc62337641	3273	Jurklošter
00050000-5627-5fca-bd67-c6528c350832	2223	Jurovski Dol
00050000-5627-5fca-5395-6d2222bcd1c8	2256	Juršinci
00050000-5627-5fca-7b7a-bb1346c37ec7	5214	Kal nad Kanalom
00050000-5627-5fca-593f-626a0b1f458a	3233	Kalobje
00050000-5627-5fca-0981-1e4c6472a5d5	4246	Kamna Gorica
00050000-5627-5fca-1538-aa112ba57abb	2351	Kamnica
00050000-5627-5fca-be93-3cc9647be457	1241	Kamnik
00050000-5627-5fca-8948-e29cf409de9d	5213	Kanal
00050000-5627-5fca-5b86-ad520ec0e690	8258	Kapele
00050000-5627-5fca-b058-0c7c84b88d07	2362	Kapla
00050000-5627-5fca-26e9-1571b9046f7d	2325	Kidričevo
00050000-5627-5fca-cab4-6f21087e0a0d	1412	Kisovec
00050000-5627-5fca-c2d1-11171efa457c	6253	Knežak
00050000-5627-5fca-86ce-35a60153244a	5222	Kobarid
00050000-5627-5fca-5f63-0a2405f9523a	9227	Kobilje
00050000-5627-5fca-2c94-3009ef461e44	1330	Kočevje
00050000-5627-5fca-9c0f-79530fb5f3cf	1338	Kočevska Reka
00050000-5627-5fca-363d-7382acbd14f2	2276	Kog
00050000-5627-5fca-6a4e-0b73c5faea9b	5211	Kojsko
00050000-5627-5fca-d26d-e46e16d6c2b7	6223	Komen
00050000-5627-5fca-0901-1abf480c57b2	1218	Komenda
00050000-5627-5fca-c86a-4a52df76238d	6000	Koper/Capodistria 
00050000-5627-5fca-d55b-27674a7970aa	6001	Koper/Capodistria - poštni predali
00050000-5627-5fca-5121-413564921c9f	8282	Koprivnica
00050000-5627-5fca-0794-4382cc31f45b	5296	Kostanjevica na Krasu
00050000-5627-5fca-3f53-ba1ed4ac9054	8311	Kostanjevica na Krki
00050000-5627-5fca-2451-1afa542354d8	1336	Kostel
00050000-5627-5fca-2e16-0323ed35d777	6256	Košana
00050000-5627-5fca-1633-3f92cf94ab81	2394	Kotlje
00050000-5627-5fca-8277-47f66e21b63a	6240	Kozina
00050000-5627-5fca-4154-1d62bc925926	3260	Kozje
00050000-5627-5fca-6625-544c61ae0a18	4000	Kranj 
00050000-5627-5fca-b2ae-c23a0fda7ca2	4001	Kranj - poštni predali
00050000-5627-5fca-074b-aead31ab9a88	4280	Kranjska Gora
00050000-5627-5fca-40fe-d3bcbb77420a	1281	Kresnice
00050000-5627-5fca-bfed-15a17143a0da	4294	Križe
00050000-5627-5fca-b9ab-655bbf93936b	9206	Križevci
00050000-5627-5fca-9f41-82ad4fd56f8c	9242	Križevci pri Ljutomeru
00050000-5627-5fca-acd1-ed0ec03bf49c	1301	Krka
00050000-5627-5fca-bb05-7a043330d440	8296	Krmelj
00050000-5627-5fca-de6c-83f07ed7b2bc	4245	Kropa
00050000-5627-5fca-d1ca-c168e210735c	8262	Krška vas
00050000-5627-5fca-59e8-1c832498bcf9	8270	Krško
00050000-5627-5fca-15bc-34ecc87b5907	9263	Kuzma
00050000-5627-5fca-8b66-d7d928012abb	2318	Laporje
00050000-5627-5fca-5fca-c4bb1959190f	3270	Laško
00050000-5627-5fca-e370-d90e8a1356ab	1219	Laze v Tuhinju
00050000-5627-5fca-3054-d6e62c2b0a43	2230	Lenart v Slovenskih goricah
00050000-5627-5fca-8468-69d154b09c31	9220	Lendava/Lendva
00050000-5627-5fca-cfbf-0d44767e4095	4248	Lesce
00050000-5627-5fca-5f1c-f15c3611467d	3261	Lesično
00050000-5627-5fca-728a-d976a0031054	8273	Leskovec pri Krškem
00050000-5627-5fca-9086-bcced0a362f0	2372	Libeliče
00050000-5627-5fca-477b-779be981feda	2341	Limbuš
00050000-5627-5fca-c21a-c3d4de6d85e8	1270	Litija
00050000-5627-5fca-1f20-519a0e4885bd	3202	Ljubečna
00050000-5627-5fca-a31b-afdd9972a4fa	1000	Ljubljana 
00050000-5627-5fca-8906-13b57a067b4f	1001	Ljubljana - poštni predali
00050000-5627-5fca-8ba7-87ec7aebca9b	1231	Ljubljana - Črnuče
00050000-5627-5fca-61f5-704513aa6078	1261	Ljubljana - Dobrunje
00050000-5627-5fca-d1af-015a41847ade	1260	Ljubljana - Polje
00050000-5627-5fca-efdf-d0094a944fc6	1210	Ljubljana - Šentvid
00050000-5627-5fca-a949-16a3c3b0ff14	1211	Ljubljana - Šmartno
00050000-5627-5fca-f75d-a1d3d2bb2674	3333	Ljubno ob Savinji
00050000-5627-5fca-6be7-3ef76ec8a010	9240	Ljutomer
00050000-5627-5fca-c0c7-a3227210bb82	3215	Loče
00050000-5627-5fca-77a9-1057a741e83b	5231	Log pod Mangartom
00050000-5627-5fca-0bb3-b10a5f5a7beb	1358	Log pri Brezovici
00050000-5627-5fca-137f-765fe2399dc4	1370	Logatec
00050000-5627-5fca-04aa-57b8d4b1aa5d	1371	Logatec
00050000-5627-5fca-183a-fb8f6fd57ae1	1434	Loka pri Zidanem Mostu
00050000-5627-5fca-2cba-94a6028f3a89	3223	Loka pri Žusmu
00050000-5627-5fca-14c1-8bb7fc039b44	6219	Lokev
00050000-5627-5fca-ff4f-59614c7bbde0	1318	Loški Potok
00050000-5627-5fca-f3dd-ef6dd8f314f1	2324	Lovrenc na Dravskem polju
00050000-5627-5fca-458a-9f871220a172	2344	Lovrenc na Pohorju
00050000-5627-5fca-306f-acea362e218b	3334	Luče
00050000-5627-5fca-b74e-217f5916466e	1225	Lukovica
00050000-5627-5fca-183f-831fe6f84eed	9202	Mačkovci
00050000-5627-5fca-d6bb-cb34e912cd30	2322	Majšperk
00050000-5627-5fca-581d-db8199c42487	2321	Makole
00050000-5627-5fca-e18d-6ff3a1a2ddf4	9243	Mala Nedelja
00050000-5627-5fca-c59f-f0a3558aa3f4	2229	Malečnik
00050000-5627-5fca-1006-7815251d53a8	6273	Marezige
00050000-5627-5fca-4a0d-8d32c6dd351b	2000	Maribor 
00050000-5627-5fca-797e-6b0086ba5861	2001	Maribor - poštni predali
00050000-5627-5fca-96b0-b340c6c6a3b9	2206	Marjeta na Dravskem polju
00050000-5627-5fca-e0d0-54215357208a	2281	Markovci
00050000-5627-5fca-ddc4-1785f393de8c	9221	Martjanci
00050000-5627-5fca-a0fe-5bbd86e8d326	6242	Materija
00050000-5627-5fca-1b21-90a89e041d97	4211	Mavčiče
00050000-5627-5fca-abaa-d033859ce1cf	1215	Medvode
00050000-5627-5fca-6799-d80849b49feb	1234	Mengeš
00050000-5627-5fca-7e05-b8884bc772ed	8330	Metlika
00050000-5627-5fca-9317-f43188116311	2392	Mežica
00050000-5627-5fca-6c5c-b5c42d0ab898	2204	Miklavž na Dravskem polju
00050000-5627-5fca-4676-5825afb00d47	2275	Miklavž pri Ormožu
00050000-5627-5fca-c090-31f065bcfba4	5291	Miren
00050000-5627-5fca-9789-982f93616468	8233	Mirna
00050000-5627-5fca-53d8-eeda68094e4f	8216	Mirna Peč
00050000-5627-5fca-2672-a3c00e55c622	2382	Mislinja
00050000-5627-5fca-9af7-cf2739d1add0	4281	Mojstrana
00050000-5627-5fca-6dc1-f8d93f54ec91	8230	Mokronog
00050000-5627-5fca-a918-1a0653f0e633	1251	Moravče
00050000-5627-5fca-77da-38fa1da7d4ce	9226	Moravske Toplice
00050000-5627-5fca-78c7-3f017d150bc7	5216	Most na Soči
00050000-5627-5fca-259b-b8d54d7daa3c	1221	Motnik
00050000-5627-5fca-86ae-d2c5a667aec6	3330	Mozirje
00050000-5627-5fca-dd08-8b956ea6a284	9000	Murska Sobota 
00050000-5627-5fca-25aa-7821ac3f8035	9001	Murska Sobota - poštni predali
00050000-5627-5fca-ac1c-01b1e3c396a1	2366	Muta
00050000-5627-5fca-d3a9-0507ca712c7f	4202	Naklo
00050000-5627-5fca-f7a5-01d53b823d47	3331	Nazarje
00050000-5627-5fca-0053-a65487e326f9	1357	Notranje Gorice
00050000-5627-5fca-45b1-8bc45089c594	3203	Nova Cerkev
00050000-5627-5fca-8d38-3e972a2badda	5000	Nova Gorica 
00050000-5627-5fca-4da7-e7798d666bea	5001	Nova Gorica - poštni predali
00050000-5627-5fca-2851-07941aa02fe1	1385	Nova vas
00050000-5627-5fca-4839-df71f4e14cd0	8000	Novo mesto
00050000-5627-5fca-d0c1-2fd3c8c8e872	8001	Novo mesto - poštni predali
00050000-5627-5fca-b0f7-c630cf01c454	6243	Obrov
00050000-5627-5fca-3e05-a9c33fd7cd22	9233	Odranci
00050000-5627-5fca-c466-09bd050e9649	2317	Oplotnica
00050000-5627-5fca-cfb7-9018e0178af9	2312	Orehova vas
00050000-5627-5fca-f38d-67e69f262b79	2270	Ormož
00050000-5627-5fca-011d-ce5df5c53d90	1316	Ortnek
00050000-5627-5fca-840b-6e99cdd114e2	1337	Osilnica
00050000-5627-5fca-6b57-e65b233a5080	8222	Otočec
00050000-5627-5fca-d3fe-7d8cc951d882	2361	Ožbalt
00050000-5627-5fca-47a9-4a40bf66c967	2231	Pernica
00050000-5627-5fca-5902-aea282f50858	2211	Pesnica pri Mariboru
00050000-5627-5fca-bee6-04dcda03b280	9203	Petrovci
00050000-5627-5fca-52b2-402f23be0977	3301	Petrovče
00050000-5627-5fca-331e-515d4ac75eaf	6330	Piran/Pirano
00050000-5627-5fca-0dee-bf136109c086	8255	Pišece
00050000-5627-5fca-30b8-747f61d1ecb7	6257	Pivka
00050000-5627-5fca-c719-790da0cc80d5	6232	Planina
00050000-5627-5fca-8404-20f4ebc31c72	3225	Planina pri Sevnici
00050000-5627-5fca-64f9-203158c878cc	6276	Pobegi
00050000-5627-5fca-8a0a-1b5e20a6d320	8312	Podbočje
00050000-5627-5fca-357b-db31f54b2aae	5243	Podbrdo
00050000-5627-5fca-7cc0-b249f6d4bfcc	3254	Podčetrtek
00050000-5627-5fca-1ae1-cf953470c52b	2273	Podgorci
00050000-5627-5fca-2670-cd3dfdab42ef	6216	Podgorje
00050000-5627-5fca-4a24-baf0e921d18c	2381	Podgorje pri Slovenj Gradcu
00050000-5627-5fca-1639-5bc828ee0b59	6244	Podgrad
00050000-5627-5fca-0919-ceb71e06937d	1414	Podkum
00050000-5627-5fca-748b-c13507a2f2b5	2286	Podlehnik
00050000-5627-5fca-f2d4-a1b6572c63d3	5272	Podnanos
00050000-5627-5fca-66d7-4d1332e31f47	4244	Podnart
00050000-5627-5fca-43c0-8a4d980c7472	3241	Podplat
00050000-5627-5fca-1b21-4769251c360b	3257	Podsreda
00050000-5627-5fca-0f87-2da9a9170851	2363	Podvelka
00050000-5627-5fca-a0b2-32db610af0f2	2208	Pohorje
00050000-5627-5fca-57c1-1ebdd66f6253	2257	Polenšak
00050000-5627-5fca-8d1d-d1065d0841de	1355	Polhov Gradec
00050000-5627-5fca-5ccc-fb98d458101c	4223	Poljane nad Škofjo Loko
00050000-5627-5fca-d35d-638f51d3004c	2319	Poljčane
00050000-5627-5fca-7cda-97499187f504	1272	Polšnik
00050000-5627-5fca-2c61-a21f3cc750e3	3313	Polzela
00050000-5627-5fca-6c83-aafc215041ec	3232	Ponikva
00050000-5627-5fca-7db6-1214b5b52322	6320	Portorož/Portorose
00050000-5627-5fca-7bb9-49a01048d9e8	6230	Postojna
00050000-5627-5fca-4452-5432abc73479	2331	Pragersko
00050000-5627-5fca-63b8-d6d995562c12	3312	Prebold
00050000-5627-5fca-05cc-e0d60d32bc4a	4205	Preddvor
00050000-5627-5fca-b7fa-185255199151	6255	Prem
00050000-5627-5fca-157e-f0029d7a780c	1352	Preserje
00050000-5627-5fca-02c0-0ca923d99cdd	6258	Prestranek
00050000-5627-5fca-8fdc-c3eda4aec874	2391	Prevalje
00050000-5627-5fca-8163-93af0dc9f476	3262	Prevorje
00050000-5627-5fca-7b10-f1c5a836811f	1276	Primskovo 
00050000-5627-5fca-d3df-3527b1a15ed8	3253	Pristava pri Mestinju
00050000-5627-5fca-2143-5e957f7dff2b	9207	Prosenjakovci/Partosfalva
00050000-5627-5fca-d15d-28ba541069a9	5297	Prvačina
00050000-5627-5fca-f8bd-41dae64e73de	2250	Ptuj
00050000-5627-5fca-0e36-135e87034754	2323	Ptujska Gora
00050000-5627-5fca-ec58-570de35c735b	9201	Puconci
00050000-5627-5fca-6ede-8cb705854974	2327	Rače
00050000-5627-5fca-9ac0-e155a0628b7d	1433	Radeče
00050000-5627-5fca-5641-db1706bcc841	9252	Radenci
00050000-5627-5fca-6aad-19d67dc2b4e0	2360	Radlje ob Dravi
00050000-5627-5fca-8b01-529822f879a4	1235	Radomlje
00050000-5627-5fca-b2ab-6e5e3796c03b	4240	Radovljica
00050000-5627-5fca-e0b4-9199f1ee3387	8274	Raka
00050000-5627-5fca-2585-ac1604436cdf	1381	Rakek
00050000-5627-5fca-c341-d57430669ffb	4283	Rateče - Planica
00050000-5627-5fca-e86c-ee3c073671ce	2390	Ravne na Koroškem
00050000-5627-5fca-b44d-9722b4d34c76	9246	Razkrižje
00050000-5627-5fca-1ad9-e1179fa0ff38	3332	Rečica ob Savinji
00050000-5627-5fca-e144-0e5b2a64a592	5292	Renče
00050000-5627-5fca-ad63-561534addc74	1310	Ribnica
00050000-5627-5fca-3983-a72ce4d53eef	2364	Ribnica na Pohorju
00050000-5627-5fca-cae4-d783736668de	3272	Rimske Toplice
00050000-5627-5fca-3a71-3312ece6cb64	1314	Rob
00050000-5627-5fca-7e08-590320baf4ac	5215	Ročinj
00050000-5627-5fca-7636-651c35a36af5	3250	Rogaška Slatina
00050000-5627-5fca-c028-fa14da9511f3	9262	Rogašovci
00050000-5627-5fca-23ea-b99d1e11055c	3252	Rogatec
00050000-5627-5fca-d00e-827df1e24e9f	1373	Rovte
00050000-5627-5fca-b58c-b5b2700cf18e	2342	Ruše
00050000-5627-5fca-345c-d4fc4359d0c4	1282	Sava
00050000-5627-5fca-a3e1-95d0729e855c	6333	Sečovlje/Sicciole
00050000-5627-5fca-fda8-6b7eba001d66	4227	Selca
00050000-5627-5fca-0243-ff4d706abdb2	2352	Selnica ob Dravi
00050000-5627-5fca-08a2-e246cb3eef0f	8333	Semič
00050000-5627-5fca-bd9b-927bc44da53f	8281	Senovo
00050000-5627-5fca-3208-449842db3b37	6224	Senožeče
00050000-5627-5fca-aa87-787a3ad2b619	8290	Sevnica
00050000-5627-5fca-ee25-34a49677648f	6210	Sežana
00050000-5627-5fca-8bb9-4f667609e625	2214	Sladki Vrh
00050000-5627-5fca-dad9-fae56d302466	5283	Slap ob Idrijci
00050000-5627-5fca-5aa4-74616d421334	2380	Slovenj Gradec
00050000-5627-5fca-cc62-3cbcd19fa04e	2310	Slovenska Bistrica
00050000-5627-5fca-981d-d2c60690b7ee	3210	Slovenske Konjice
00050000-5627-5fca-c0b2-eececc2cef94	1216	Smlednik
00050000-5627-5fca-afe5-c697d3f714d0	5232	Soča
00050000-5627-5fca-f201-9f46c4598677	1317	Sodražica
00050000-5627-5fca-44c0-5fe783cf8d31	3335	Solčava
00050000-5627-5fca-c3b8-7547701d8628	5250	Solkan
00050000-5627-5fca-cc07-3d63fd787ab6	4229	Sorica
00050000-5627-5fca-8b94-c82d53ee431e	4225	Sovodenj
00050000-5627-5fca-e7bf-7f30d8d1217e	5281	Spodnja Idrija
00050000-5627-5fca-170b-3226f7bd9353	2241	Spodnji Duplek
00050000-5627-5fca-c0a8-696d5803e4ec	9245	Spodnji Ivanjci
00050000-5627-5fca-9bf6-ca46afd0e100	2277	Središče ob Dravi
00050000-5627-5fca-9db3-ce8a6057d66f	4267	Srednja vas v Bohinju
00050000-5627-5fca-87cf-5ed598b950fc	8256	Sromlje 
00050000-5627-5fca-fa8c-3fe7f3ba9d65	5224	Srpenica
00050000-5627-5fca-2cf7-be8a916f45c3	1242	Stahovica
00050000-5627-5fca-92f9-8e13fc6141f3	1332	Stara Cerkev
00050000-5627-5fca-7f36-037caf3fbdfc	8342	Stari trg ob Kolpi
00050000-5627-5fca-ad8d-20c88450650e	1386	Stari trg pri Ložu
00050000-5627-5fca-9502-fb9b25f9eea7	2205	Starše
00050000-5627-5fca-652f-2a293004cd8a	2289	Stoperce
00050000-5627-5fca-7cce-93b19c7bbe5a	8322	Stopiče
00050000-5627-5fca-2be7-cf6d70a14ff4	3206	Stranice
00050000-5627-5fca-9752-39c4d01fc62e	8351	Straža
00050000-5627-5fca-a632-b40f03ed3864	1313	Struge
00050000-5627-5fca-6332-94e1fb7ed263	8293	Studenec
00050000-5627-5fca-f80c-ed78cb728aaa	8331	Suhor
00050000-5627-5fca-212d-900df4dd0428	2233	Sv. Ana v Slovenskih goricah
00050000-5627-5fca-10b3-3491bf3195b7	2235	Sv. Trojica v Slovenskih goricah
00050000-5627-5fca-6a15-0194fbe05c31	2353	Sveti Duh na Ostrem Vrhu
00050000-5627-5fca-1098-5d2164c9f08f	9244	Sveti Jurij ob Ščavnici
00050000-5627-5fca-a9eb-11e252e2a244	3264	Sveti Štefan
00050000-5627-5fca-5a41-900a4e16a313	2258	Sveti Tomaž
00050000-5627-5fca-0222-9ead518a90d0	9204	Šalovci
00050000-5627-5fca-feaa-aaf649e1d1d6	5261	Šempas
00050000-5627-5fca-a01e-8b7c87b9e5d7	5290	Šempeter pri Gorici
00050000-5627-5fca-d330-d758c602a39f	3311	Šempeter v Savinjski dolini
00050000-5627-5fca-4e56-f231c418d9a8	4208	Šenčur
00050000-5627-5fca-861a-4e211c9a7c42	2212	Šentilj v Slovenskih goricah
00050000-5627-5fca-adb0-150765ff60cb	8297	Šentjanž
00050000-5627-5fca-477c-56df129ccdd6	2373	Šentjanž pri Dravogradu
00050000-5627-5fca-ece6-0b8cf56bbb42	8310	Šentjernej
00050000-5627-5fca-1ed7-28ec225bb318	3230	Šentjur
00050000-5627-5fca-dbde-cc866d8a8484	3271	Šentrupert
00050000-5627-5fca-5ec1-e2d407a34d94	8232	Šentrupert
00050000-5627-5fca-68fc-ed4fc15c1b17	1296	Šentvid pri Stični
00050000-5627-5fca-5978-77e4e43c904e	8275	Škocjan
00050000-5627-5fca-8a5b-addf7690f574	6281	Škofije
00050000-5627-5fca-8baf-5c751c16a77b	4220	Škofja Loka
00050000-5627-5fca-44c2-b4fd8ee84b76	3211	Škofja vas
00050000-5627-5fca-3db0-befef161b3bc	1291	Škofljica
00050000-5627-5fca-1911-4c2c4ab608dc	6274	Šmarje
00050000-5627-5fca-123f-4e1d9eedaf96	1293	Šmarje - Sap
00050000-5627-5fca-71f2-a351e5703a9c	3240	Šmarje pri Jelšah
00050000-5627-5fca-ef3e-3954955825e1	8220	Šmarješke Toplice
00050000-5627-5fca-d8f4-0bf5aa7716d1	2315	Šmartno na Pohorju
00050000-5627-5fca-b9bb-6f19368d5fac	3341	Šmartno ob Dreti
00050000-5627-5fca-1a97-ecf2e80c75d4	3327	Šmartno ob Paki
00050000-5627-5fca-fd26-736f4c358e58	1275	Šmartno pri Litiji
00050000-5627-5fca-72ef-cf3e318b9abe	2383	Šmartno pri Slovenj Gradcu
00050000-5627-5fca-7423-e9195db4a517	3201	Šmartno v Rožni dolini
00050000-5627-5fca-7cb6-453090c516d6	3325	Šoštanj
00050000-5627-5fca-ae0f-91d179146b63	6222	Štanjel
00050000-5627-5fca-7936-366fb87888b6	3220	Štore
00050000-5627-5fca-13e5-7bf3f83b8049	3304	Tabor
00050000-5627-5fca-e743-1f5adceb163c	3221	Teharje
00050000-5627-5fca-695f-42aaa8eca8de	9251	Tišina
00050000-5627-5fca-cacb-3e2adbff2ac3	5220	Tolmin
00050000-5627-5fca-7613-92d690d4417b	3326	Topolšica
00050000-5627-5fca-31ff-9e8fcd1c15b0	2371	Trbonje
00050000-5627-5fca-2902-55ecbc46c579	1420	Trbovlje
00050000-5627-5fca-0538-1d7d48f00d7e	8231	Trebelno 
00050000-5627-5fca-871b-4713bf76261e	8210	Trebnje
00050000-5627-5fca-f433-879c265ac371	5252	Trnovo pri Gorici
00050000-5627-5fca-d45b-f5956d10ae5b	2254	Trnovska vas
00050000-5627-5fca-d4c3-ee35b1a7c71b	1222	Trojane
00050000-5627-5fca-78f8-4fb45fb32e31	1236	Trzin
00050000-5627-5fca-39bd-a98362d1d388	4290	Tržič
00050000-5627-5fca-c6b3-7b1a813d8971	8295	Tržišče
00050000-5627-5fca-d12c-9d6d23601451	1311	Turjak
00050000-5627-5fca-37d5-c3b6806911c2	9224	Turnišče
00050000-5627-5fca-bf02-66bc3f2bfad2	8323	Uršna sela
00050000-5627-5fca-980f-fb3528c4b39a	1252	Vače
00050000-5627-5fca-2a88-afa1841c7f8c	3320	Velenje 
00050000-5627-5fca-764f-09c7662356ed	3322	Velenje - poštni predali
00050000-5627-5fca-49b2-a8edb5785ccc	8212	Velika Loka
00050000-5627-5fca-94b8-93d764b6a7b3	2274	Velika Nedelja
00050000-5627-5fca-2873-007f39eb28f4	9225	Velika Polana
00050000-5627-5fca-3551-12604e9adf62	1315	Velike Lašče
00050000-5627-5fca-bdc6-0824d7fc42dd	8213	Veliki Gaber
00050000-5627-5fca-2bf4-f577e298c610	9241	Veržej
00050000-5627-5fca-8bec-e42f0b4ee89c	1312	Videm - Dobrepolje
00050000-5627-5fca-04f3-2fceb4832f24	2284	Videm pri Ptuju
00050000-5627-5fca-3af7-51be5c427ef4	8344	Vinica
00050000-5627-5fca-b94a-e57c8235981f	5271	Vipava
00050000-5627-5fca-f550-28c81bd96a17	4212	Visoko
00050000-5627-5fca-06d9-180ff26b2ff7	1294	Višnja Gora
00050000-5627-5fca-f153-40491516658a	3205	Vitanje
00050000-5627-5fca-7562-909b2bd0f6ed	2255	Vitomarci
00050000-5627-5fca-2ee7-eb1422b1a839	1217	Vodice
00050000-5627-5fca-2d11-8f487ace4b5a	3212	Vojnik\t
00050000-5627-5fca-64fa-8385d5c04aa4	5293	Volčja Draga
00050000-5627-5fca-3818-9e5448cabac6	2232	Voličina
00050000-5627-5fca-500a-b2a8cc0c654e	3305	Vransko
00050000-5627-5fca-bd8b-53f35b0764ba	6217	Vremski Britof
00050000-5627-5fca-3ce2-277cecb25857	1360	Vrhnika
00050000-5627-5fca-66cf-a005f5317a43	2365	Vuhred
00050000-5627-5fca-8270-6ff46e10e74f	2367	Vuzenica
00050000-5627-5fca-8774-81490942fe2f	8292	Zabukovje 
00050000-5627-5fca-eba8-2bf8b066e458	1410	Zagorje ob Savi
00050000-5627-5fca-44af-37cf5e58ffd5	1303	Zagradec
00050000-5627-5fca-36a4-be26943bd18c	2283	Zavrč
00050000-5627-5fca-8c8e-9a242abf50b5	8272	Zdole 
00050000-5627-5fca-55c2-51ee83e2123b	4201	Zgornja Besnica
00050000-5627-5fca-7cca-64d01fde660d	2242	Zgornja Korena
00050000-5627-5fca-0c70-27e5a4c20826	2201	Zgornja Kungota
00050000-5627-5fca-2d03-4916cfbc7ad3	2316	Zgornja Ložnica
00050000-5627-5fca-a31e-7de41fd22980	2314	Zgornja Polskava
00050000-5627-5fca-536e-e40266749fd2	2213	Zgornja Velka
00050000-5627-5fca-886e-dd48b75ccddf	4247	Zgornje Gorje
00050000-5627-5fca-1e51-b27aa7cc1138	4206	Zgornje Jezersko
00050000-5627-5fca-f411-47f3eec33323	2285	Zgornji Leskovec
00050000-5627-5fca-2fff-7a3d63d24de8	1432	Zidani Most
00050000-5627-5fca-c53f-298c20f111dc	3214	Zreče
00050000-5627-5fca-e4f7-026157940038	4209	Žabnica
00050000-5627-5fca-77f9-816b972e14a1	3310	Žalec
00050000-5627-5fca-71fa-fd0e77086dd6	4228	Železniki
00050000-5627-5fca-fec7-e42471de5ae7	2287	Žetale
00050000-5627-5fca-30a8-7177c5bf7337	4226	Žiri
00050000-5627-5fca-76dd-ef5af5c15fd1	4274	Žirovnica
00050000-5627-5fca-38c3-f4ad0e5a7cfc	8360	Žužemberk
\.


--
-- TOC entry 3118 (class 0 OID 22867799)
-- Dependencies: 237
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 22867391)
-- Dependencies: 210
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 22867145)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5627-5fcc-ff17-3b9fae3b9309	00080000-5627-5fcc-c6b8-b9d3e7b82018	\N	00040000-5627-5fca-876b-b19054e5754d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5627-5fcc-5b67-e5f2e2424222	00080000-5627-5fcc-c6b8-b9d3e7b82018	\N	00040000-5627-5fca-876b-b19054e5754d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5627-5fcc-d2b2-4fe884a39748	00080000-5627-5fcc-c95e-73b3bfbe831f	\N	00040000-5627-5fca-876b-b19054e5754d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3081 (class 0 OID 22867289)
-- Dependencies: 200
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5627-5fca-1e40-c2b6228edad6	novo leto	1	1	\N	t
00430000-5627-5fca-28fa-8c56863eb6e4	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5627-5fca-a5b8-f4bd4af9cfa4	dan upora proti okupatorju	27	4	\N	t
00430000-5627-5fca-78f1-0586add44a4f	praznik dela	1	5	\N	t
00430000-5627-5fca-2419-630fbaa940b7	praznik dela	2	5	\N	t
00430000-5627-5fca-ab78-35d8a2ee3215	dan Primoža Trubarja	8	6	\N	f
00430000-5627-5fca-d9e0-05fea440beba	dan državnosti	25	6	\N	t
00430000-5627-5fca-d681-db886daa7217	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5627-5fca-cece-4e9797093fb8	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5627-5fca-b34b-03eb128093da	dan suverenosti	25	10	\N	f
00430000-5627-5fca-f1e1-ce21186100cc	dan spomina na mrtve	1	11	\N	t
00430000-5627-5fca-62fb-a97d3fccd49f	dan Rudolfa Maistra	23	11	\N	f
00430000-5627-5fca-df3c-e7c80d01f5e3	božič	25	12	\N	t
00430000-5627-5fca-cfb0-ef8644dedba4	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5627-5fca-adc1-5e954ee71b3a	Marijino vnebovzetje	15	8	\N	t
00430000-5627-5fca-a844-8c4a7870ea4a	dan reformacije	31	10	\N	t
00430000-5627-5fca-4055-77b5ff8ee7ce	velikonočna nedelja	27	3	2016	t
00430000-5627-5fca-0ad6-6465dcf295b0	velikonočna nedelja	16	4	2017	t
00430000-5627-5fca-23a5-2b59d23605e0	velikonočna nedelja	1	4	2018	t
00430000-5627-5fca-b98b-90718aca9e0b	velikonočna nedelja	21	4	2019	t
00430000-5627-5fca-582e-59f1f90de866	velikonočna nedelja	12	4	2020	t
00430000-5627-5fca-5f30-e8a91efea4b7	velikonočna nedelja	4	4	2021	t
00430000-5627-5fca-9ebe-59510b47d59f	velikonočna nedelja	17	4	2022	t
00430000-5627-5fca-1484-9026b1790ff9	velikonočna nedelja	9	4	2023	t
00430000-5627-5fca-fa86-84bcb8ff713b	velikonočna nedelja	31	3	2024	t
00430000-5627-5fca-8a18-f0c3647cc368	velikonočna nedelja	20	4	2025	t
00430000-5627-5fca-e0b1-b5e870bad344	velikonočna nedelja	5	4	2026	t
00430000-5627-5fca-6cfb-7dad9ccbe603	velikonočna nedelja	28	3	2027	t
00430000-5627-5fca-54df-2da70a6e18cc	velikonočna nedelja	16	4	2028	t
00430000-5627-5fca-083a-c2064844e050	velikonočna nedelja	1	4	2029	t
00430000-5627-5fca-789e-4273f3a9ee6d	velikonočna nedelja	21	4	2030	t
00430000-5627-5fca-8321-9880ab5f5685	velikonočni ponedeljek	28	3	2016	t
00430000-5627-5fca-1e0a-7a91a9a67500	velikonočni ponedeljek	17	4	2017	t
00430000-5627-5fca-ba8e-f6198a3ef4d8	velikonočni ponedeljek	2	4	2018	t
00430000-5627-5fca-a7fb-8eaf5aa71733	velikonočni ponedeljek	22	4	2019	t
00430000-5627-5fca-4be0-3228c8f2cd00	velikonočni ponedeljek	13	4	2020	t
00430000-5627-5fca-a646-f7329f73a5ca	velikonočni ponedeljek	5	4	2021	t
00430000-5627-5fca-e49f-320541a51770	velikonočni ponedeljek	18	4	2022	t
00430000-5627-5fca-08ec-290229ed7b3a	velikonočni ponedeljek	10	4	2023	t
00430000-5627-5fca-8b91-a52e5a947b06	velikonočni ponedeljek	1	4	2024	t
00430000-5627-5fca-e888-94f06e917817	velikonočni ponedeljek	21	4	2025	t
00430000-5627-5fca-a2b5-6863098a6e2f	velikonočni ponedeljek	6	4	2026	t
00430000-5627-5fca-d921-af30dad57d3d	velikonočni ponedeljek	29	3	2027	t
00430000-5627-5fca-4c81-3eaaea1db3ad	velikonočni ponedeljek	17	4	2028	t
00430000-5627-5fca-ba9b-96a0dcccbeed	velikonočni ponedeljek	2	4	2029	t
00430000-5627-5fca-aa3b-0dae55aff12b	velikonočni ponedeljek	22	4	2030	t
00430000-5627-5fca-cac3-9499cbe54321	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5627-5fca-51a7-de407e5c5ab8	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5627-5fca-d37e-adf07448c4e2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5627-5fca-0d6c-3c7f371fc9b5	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5627-5fca-cab7-d58b6a7baefa	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5627-5fca-cd75-563e2e6b2f36	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5627-5fca-0d82-7bdaf420c606	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5627-5fca-2563-20e370c8d693	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5627-5fca-4acb-01065e26a9f1	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5627-5fca-cd29-54d3388c2fe7	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5627-5fca-5311-ac2dd03937b7	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5627-5fca-2c6c-cb415f65fd0a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5627-5fca-de89-29208cf50fde	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5627-5fca-d7de-afd13f7861dc	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5627-5fca-ba1d-df20ac9762a2	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3077 (class 0 OID 22867249)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 22867261)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 22867403)
-- Dependencies: 212
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 22867813)
-- Dependencies: 238
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 22867823)
-- Dependencies: 239
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5627-5fcc-6924-778c0d5983e5	00080000-5627-5fcc-7bce-42e41cdda4b9	0987	AK
00190000-5627-5fcc-6d82-037af0406340	00080000-5627-5fcc-c95e-73b3bfbe831f	0989	AK
00190000-5627-5fcc-576d-3cdfadb51066	00080000-5627-5fcc-1af8-61d048c2c0a9	0986	AK
00190000-5627-5fcc-0721-4701f6b4c42d	00080000-5627-5fcc-0a20-eac2024abee1	0984	AK
00190000-5627-5fcc-fbba-546b10e7980e	00080000-5627-5fcc-4624-ae9db04d56e3	0983	AK
00190000-5627-5fcc-6906-fef954c13391	00080000-5627-5fcc-1c69-ffcb504381f1	0982	AK
00190000-5627-5fcd-913d-8ff2cfcedf33	00080000-5627-5fcd-5645-33ffdc27829b	1001	AK
\.


--
-- TOC entry 3117 (class 0 OID 22867738)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5627-5fcc-da00-34444a0bb6aa	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3121 (class 0 OID 22867831)
-- Dependencies: 240
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 22867432)
-- Dependencies: 216
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5627-5fcc-2c14-730a13b3281b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5627-5fcc-e613-59728dad1f1d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5627-5fcc-bc7c-8bd45f33cf68	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5627-5fcc-a517-79dd544161a8	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5627-5fcc-0fd0-4c26b65ab7f3	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5627-5fcc-4c29-d318d181bcd8	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5627-5fcc-301c-12a7e5d57a92	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3089 (class 0 OID 22867376)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 22867366)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22867577)
-- Dependencies: 229
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22867507)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 22867223)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22866997)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5627-5fcd-5645-33ffdc27829b	00010000-5627-5fca-5d8d-d3569ddffc2d	2015-10-21 11:50:05	INS	a:0:{}
2	App\\Entity\\Option	00000000-5627-5fcd-ca4c-4f96ee9049fd	00010000-5627-5fca-5d8d-d3569ddffc2d	2015-10-21 11:50:05	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5627-5fcd-913d-8ff2cfcedf33	00010000-5627-5fca-5d8d-d3569ddffc2d	2015-10-21 11:50:05	INS	a:0:{}
\.


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3098 (class 0 OID 22867445)
-- Dependencies: 217
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 22867035)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5627-5fca-68dc-b5da1e4e59fe	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5627-5fca-beac-1e1c9816ccbd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5627-5fca-da1c-7465ef98fbaf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5627-5fca-08a1-342778b6e557	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5627-5fca-f5ed-f3cfb689aa4a	planer	Planer dogodkov v koledarju	t
00020000-5627-5fca-7183-e6085f8f4e9a	kadrovska	Kadrovska služba	t
00020000-5627-5fca-73d4-9e3d21c7473a	arhivar	Ažuriranje arhivalij	t
00020000-5627-5fca-1cd1-3d9866e3989a	igralec	Igralec	t
00020000-5627-5fca-8af4-8be5cd2f7396	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5627-5fcc-c686-492d7f442077	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3058 (class 0 OID 22867019)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5627-5fca-7002-8f55986da792	00020000-5627-5fca-da1c-7465ef98fbaf
00010000-5627-5fca-5d8d-d3569ddffc2d	00020000-5627-5fca-da1c-7465ef98fbaf
00010000-5627-5fcc-22aa-14b5fa9bc645	00020000-5627-5fcc-c686-492d7f442077
\.


--
-- TOC entry 3100 (class 0 OID 22867459)
-- Dependencies: 219
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22867397)
-- Dependencies: 211
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 22867343)
-- Dependencies: 205
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5627-5fcc-ba88-2fe44474e826	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5627-5fcc-6f7d-4f983df1189d	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5627-5fcc-1dfc-2ef421b1029d	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3054 (class 0 OID 22866984)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5627-5fca-b918-fda7cd483c51	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5627-5fca-d2ec-2c3da780a50c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5627-5fca-615c-188b4ec0ccb4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5627-5fca-ac40-bd76acf07c25	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5627-5fca-9521-5d5d19bbcf70	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3053 (class 0 OID 22866976)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5627-5fca-a68a-e7f6e9c7ac4d	00230000-5627-5fca-ac40-bd76acf07c25	popa
00240000-5627-5fca-2c21-c7e66ecd95c9	00230000-5627-5fca-ac40-bd76acf07c25	oseba
00240000-5627-5fca-ce17-af83a472d095	00230000-5627-5fca-ac40-bd76acf07c25	tippopa
00240000-5627-5fca-32da-bc0b142c3a7b	00230000-5627-5fca-ac40-bd76acf07c25	organizacijskaenota
00240000-5627-5fca-3f85-be1b2cdba10c	00230000-5627-5fca-ac40-bd76acf07c25	sezona
00240000-5627-5fca-2b39-327775715b61	00230000-5627-5fca-ac40-bd76acf07c25	tipvaje
00240000-5627-5fca-dc34-4860e7c041be	00230000-5627-5fca-d2ec-2c3da780a50c	prostor
00240000-5627-5fca-b3fd-2f4921b6e606	00230000-5627-5fca-ac40-bd76acf07c25	besedilo
00240000-5627-5fca-6de2-85972ba43195	00230000-5627-5fca-ac40-bd76acf07c25	uprizoritev
00240000-5627-5fca-45f3-2d5177a689de	00230000-5627-5fca-ac40-bd76acf07c25	funkcija
00240000-5627-5fca-41c5-553c155aba46	00230000-5627-5fca-ac40-bd76acf07c25	tipfunkcije
00240000-5627-5fca-25f5-d7276028208c	00230000-5627-5fca-ac40-bd76acf07c25	alternacija
00240000-5627-5fca-bc12-f63053b3c9e9	00230000-5627-5fca-b918-fda7cd483c51	pogodba
00240000-5627-5fca-c4d5-93df8d182010	00230000-5627-5fca-ac40-bd76acf07c25	zaposlitev
00240000-5627-5fca-f290-ee0b21d96d8a	00230000-5627-5fca-ac40-bd76acf07c25	zvrstuprizoritve
00240000-5627-5fca-d601-e620ecef4eff	00230000-5627-5fca-b918-fda7cd483c51	programdela
00240000-5627-5fca-b7ad-28d81eee43e6	00230000-5627-5fca-ac40-bd76acf07c25	zapis
\.


--
-- TOC entry 3052 (class 0 OID 22866971)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
70a01dc6-f348-4d8e-ae33-19606d0e70f8	00240000-5627-5fca-a68a-e7f6e9c7ac4d	0	1001
\.


--
-- TOC entry 3106 (class 0 OID 22867524)
-- Dependencies: 225
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5627-5fcc-da73-9f73919b401b	000e0000-5627-5fcc-f302-a1d82c519fbc	00080000-5627-5fcc-c6b8-b9d3e7b82018	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5627-5fca-2bbb-55defbc2444e
00270000-5627-5fcc-48a6-f0fcdf00a32c	000e0000-5627-5fcc-f302-a1d82c519fbc	00080000-5627-5fcc-c6b8-b9d3e7b82018	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5627-5fca-2bbb-55defbc2444e
\.


--
-- TOC entry 3066 (class 0 OID 22867107)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 22867353)
-- Dependencies: 206
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5627-5fcc-6c5e-3918fe6b45ce	00180000-5627-5fcc-dd82-13a877d65942	000c0000-5627-5fcc-a245-3d1736999a99	00090000-5627-5fcc-4e23-1a72afc72062	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-5fcc-63b9-2b4c6f716381	00180000-5627-5fcc-dd82-13a877d65942	000c0000-5627-5fcc-a461-e8729ca5e54d	00090000-5627-5fcc-d1bd-58a0fd1cdcad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-5fcc-31e1-333877fd31c3	00180000-5627-5fcc-dd82-13a877d65942	000c0000-5627-5fcc-acea-01acd1675f8a	00090000-5627-5fcc-a1ee-9c29003c3c83	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-5fcc-eb92-427762667ebd	00180000-5627-5fcc-dd82-13a877d65942	000c0000-5627-5fcc-1df4-3c2bc4a1c696	00090000-5627-5fcc-1585-977f2742ac45	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-5fcc-0587-0232890a5618	00180000-5627-5fcc-dd82-13a877d65942	000c0000-5627-5fcc-5276-e210d6a6450b	00090000-5627-5fcc-81ef-3aaf578175e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-5fcc-844a-092ac0210e96	00180000-5627-5fcc-f60b-d35a1a8dc082	\N	00090000-5627-5fcc-81ef-3aaf578175e6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5627-5fcc-ba14-7c4b54f8de20	00180000-5627-5fcc-f60b-d35a1a8dc082	\N	00090000-5627-5fcc-d1bd-58a0fd1cdcad	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3109 (class 0 OID 22867565)
-- Dependencies: 228
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5627-5fca-4b3a-f748b52139d8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5627-5fca-d221-9abf3c62145c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5627-5fca-393c-b8ead1cd0f53	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5627-5fca-39ce-d6cf8ef77e9f	04	Režija	Režija	Režija	umetnik	30
000f0000-5627-5fca-f635-decc88a7e1fe	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5627-5fca-bce9-58577a7214b0	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5627-5fca-0e33-19a0fc20264f	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5627-5fca-b29b-4d8ab27f198c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5627-5fca-b14f-1d0b82f0b11a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5627-5fca-c274-6d9420703d7e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5627-5fca-72d2-18454ea91799	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5627-5fca-5e4a-3500d95c7eac	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5627-5fca-431a-29b67df6056d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5627-5fca-6c9c-60b55d457c1c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5627-5fca-00b9-48df844fc5a3	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5627-5fca-0fb2-fc01669b5cae	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5627-5fca-3a93-bf9252748054	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5627-5fca-a9a5-0656818327b7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3063 (class 0 OID 22867061)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5627-5fcc-aa79-b8dee482bce3	0001	šola	osnovna ali srednja šola
00400000-5627-5fcc-3dd5-c92e3590620e	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5627-5fcc-7916-7e8920af8d98	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3122 (class 0 OID 22867842)
-- Dependencies: 241
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5627-5fca-b23c-dd91059fb3e8	01	Velika predstava	f	1.00	1.00
002b0000-5627-5fca-7d30-164478eb2eda	02	Mala predstava	f	0.50	0.50
002b0000-5627-5fca-3a91-8166e5d90360	03	Mala koprodukcija	t	0.40	1.00
002b0000-5627-5fca-901c-007f9c0f4a4e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5627-5fca-4ef5-807692442ad7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3085 (class 0 OID 22867333)
-- Dependencies: 204
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5627-5fca-f3e1-c8c710cc3930	0001	prva vaja	prva vaja
00420000-5627-5fca-0207-300f89ae144d	0002	tehnična vaja	tehnična vaja
00420000-5627-5fca-6ac3-c3aebb68c7c0	0003	lučna vaja	lučna vaja
00420000-5627-5fca-5414-ade3673cce37	0004	kostumska vaja	kostumska vaja
00420000-5627-5fca-cb00-91c3be989ae2	0005	foto vaja	foto vaja
00420000-5627-5fca-68ae-8201c590c41d	0006	1. glavna vaja	1. glavna vaja
00420000-5627-5fca-2bc2-f04816e7dea4	0007	2. glavna vaja	2. glavna vaja
00420000-5627-5fca-2b61-d081712c0235	0008	1. generalka	1. generalka
00420000-5627-5fca-75c8-49dd383c418b	0009	2. generalka	2. generalka
00420000-5627-5fca-f2f3-ef1e3130cd64	0010	odprta generalka	odprta generalka
00420000-5627-5fca-54e5-ed61c746dac8	0011	obnovitvena vaja	obnovitvena vaja
00420000-5627-5fca-711e-9799ba447731	0012	pevska vaja	pevska vaja
00420000-5627-5fca-def3-abc69a7e04e7	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5627-5fca-2a99-553702bd1047	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3072 (class 0 OID 22867180)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22867006)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5627-5fca-5d8d-d3569ddffc2d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROZneiOmnvsz86TDprW1rVG81zx4XQgzC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-9573-099607c6bd70	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-386e-e4fd5cee53f0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-71f7-b524b1fad699	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-f185-b248bc059153	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-e547-e58cc7bc4b24	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-a8e0-c29f5350cdc6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-3bb2-01d677b41758	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-a08c-099f07218cd8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-0d34-177372338424	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5627-5fcc-22aa-14b5fa9bc645	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5627-5fca-7002-8f55986da792	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 22867615)
-- Dependencies: 232
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5627-5fcc-3f5e-75943e5b2dd6	00160000-5627-5fcc-e3b2-7e5c420395cf	\N	00140000-5627-5fca-39b3-eb31bbc25c33	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5627-5fcc-0fd0-4c26b65ab7f3
000e0000-5627-5fcc-f302-a1d82c519fbc	00160000-5627-5fcc-5bd4-8167a6172815	\N	00140000-5627-5fca-5ad2-68892ca08e3a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5627-5fcc-4c29-d318d181bcd8
000e0000-5627-5fcc-4613-402333db289e	\N	\N	00140000-5627-5fca-5ad2-68892ca08e3a	00190000-5627-5fcc-6924-778c0d5983e5	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5627-5fcc-0fd0-4c26b65ab7f3
000e0000-5627-5fcc-052e-2cb7c5cbdd6d	\N	\N	00140000-5627-5fca-5ad2-68892ca08e3a	00190000-5627-5fcc-6924-778c0d5983e5	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5627-5fcc-0fd0-4c26b65ab7f3
000e0000-5627-5fcc-1b6e-38aae543bc50	\N	\N	00140000-5627-5fca-5ad2-68892ca08e3a	00190000-5627-5fcc-6924-778c0d5983e5	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5627-5fcc-2c14-730a13b3281b
000e0000-5627-5fcc-2e4e-4d29c63c8e1d	\N	\N	00140000-5627-5fca-5ad2-68892ca08e3a	00190000-5627-5fcc-6924-778c0d5983e5	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5627-5fcc-2c14-730a13b3281b
\.


--
-- TOC entry 3080 (class 0 OID 22867279)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5627-5fcc-5d76-f4fc220ab2b2	\N	000e0000-5627-5fcc-f302-a1d82c519fbc	1	
00200000-5627-5fcc-00b9-bb2728462b8d	\N	000e0000-5627-5fcc-f302-a1d82c519fbc	2	
00200000-5627-5fcc-51be-32e0f15a21c9	\N	000e0000-5627-5fcc-f302-a1d82c519fbc	3	
00200000-5627-5fcc-d2b8-2bd8e3319245	\N	000e0000-5627-5fcc-f302-a1d82c519fbc	4	
00200000-5627-5fcc-58f3-aa208be8e06e	\N	000e0000-5627-5fcc-f302-a1d82c519fbc	5	
\.


--
-- TOC entry 3096 (class 0 OID 22867424)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 22867538)
-- Dependencies: 226
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5627-5fca-a8fe-e8926a73c01d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5627-5fca-e2af-eafb6f43dcfd	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5627-5fca-841e-3efb83e25746	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5627-5fca-56e6-6b2cacfdafa6	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5627-5fca-5be9-20876ae15b3b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5627-5fca-8cf0-211a86d50cf5	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5627-5fca-2b9f-710b1454cd3e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5627-5fca-fbd2-548889fdccef	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5627-5fca-2bbb-55defbc2444e	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5627-5fca-06d2-0168ed6316bb	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5627-5fca-0aba-4266c0cad068	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5627-5fca-95cb-bff4e72ba419	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5627-5fca-7c58-209b3c80f756	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5627-5fca-00e6-2fbf262945db	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5627-5fca-5e89-df0e97fc2ec2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5627-5fca-1de8-67b7ec852ff2	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5627-5fca-d158-0971d05c61ff	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5627-5fca-65c8-63e73a7bc2ba	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5627-5fca-8809-192166227989	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5627-5fca-866c-219596f3a0b1	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5627-5fca-2bd9-820785d28221	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5627-5fca-68be-f3fd70fda415	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5627-5fca-4987-026df48f0b7e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5627-5fca-2887-8741408309b8	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5627-5fca-2f5d-270ec2334671	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5627-5fca-e9ab-87afa164af5e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5627-5fca-c15f-a8b13cb7463c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5627-5fca-ceaa-26ab9eaad14d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3125 (class 0 OID 22867889)
-- Dependencies: 244
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 22867861)
-- Dependencies: 243
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 22867901)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22867496)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5627-5fcc-ac47-9594cc378f48	00090000-5627-5fcc-d1bd-58a0fd1cdcad	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-5fcc-51b6-b159642d3f1f	00090000-5627-5fcc-a1ee-9c29003c3c83	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-5fcc-6222-2885f597fab3	00090000-5627-5fcc-c466-ad70d9622cfc	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-5fcc-a0c7-56eefb5d23a6	00090000-5627-5fcc-8d5a-e4e65f877f12	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-5fcc-e07a-2a613fb516d9	00090000-5627-5fcc-26a0-c202ad14dd71	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-5fcc-c685-c32abb844f3f	00090000-5627-5fcc-e140-cd14fd9e81d4	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3083 (class 0 OID 22867322)
-- Dependencies: 202
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 22867605)
-- Dependencies: 231
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5627-5fca-39b3-eb31bbc25c33	01	Drama	drama (SURS 01)
00140000-5627-5fca-c2d5-7d0f00b1acc5	02	Opera	opera (SURS 02)
00140000-5627-5fca-e4b1-2a029a8961a3	03	Balet	balet (SURS 03)
00140000-5627-5fca-00f9-7cfef6de257d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5627-5fca-6de0-6d935a83f5c4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5627-5fca-5ad2-68892ca08e3a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5627-5fca-7c20-cc78f279abfa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3102 (class 0 OID 22867486)
-- Dependencies: 221
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2551 (class 2606 OID 22867060)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 22867664)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 22867654)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 22867521)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 22867563)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 22867941)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 22867311)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 22867332)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 22867859)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 22867206)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 22867732)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 22867482)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 22867277)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 22867244)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 22867220)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22867389)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 22867918)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 22867925)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2829 (class 2606 OID 22867949)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 22757752)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2686 (class 2606 OID 22867416)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 22867178)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 22867079)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 22867140)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 22867103)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 22867049)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2542 (class 2606 OID 22867034)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 22867422)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 22867458)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 22867600)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 22867131)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 22867166)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 22867811)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 22867395)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 22867156)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 22867296)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 22867265)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2618 (class 2606 OID 22867257)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 22867407)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 22867820)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 22867828)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 22867798)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 22867840)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 22867440)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 22867380)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 22867371)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 22867587)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 22867514)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 22867232)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 22867005)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22867449)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 22867023)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2544 (class 2606 OID 22867043)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 22867467)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 22867402)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 22867351)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 22866993)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 22866981)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 22866975)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 22867534)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 22867112)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 22867362)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 22867574)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 22867068)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 22867852)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 22867340)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 22867191)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 22867018)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 22867633)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 22867286)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 22867430)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 22867546)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 22867899)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 22867883)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 22867907)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22867504)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 22867326)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 22867613)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 22867494)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 1259 OID 22867320)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2635 (class 1259 OID 22867321)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2636 (class 1259 OID 22867319)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2637 (class 1259 OID 22867318)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2638 (class 1259 OID 22867317)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2729 (class 1259 OID 22867535)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2730 (class 1259 OID 22867536)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2731 (class 1259 OID 22867537)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2815 (class 1259 OID 22867920)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2816 (class 1259 OID 22867919)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2569 (class 1259 OID 22867133)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2570 (class 1259 OID 22867134)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2687 (class 1259 OID 22867423)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2802 (class 1259 OID 22867887)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2803 (class 1259 OID 22867886)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2804 (class 1259 OID 22867888)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2805 (class 1259 OID 22867885)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2806 (class 1259 OID 22867884)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2681 (class 1259 OID 22867409)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2682 (class 1259 OID 22867408)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2626 (class 1259 OID 22867287)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2627 (class 1259 OID 22867288)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2711 (class 1259 OID 22867483)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2712 (class 1259 OID 22867485)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2713 (class 1259 OID 22867484)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2601 (class 1259 OID 22867222)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 22867221)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2793 (class 1259 OID 22867841)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2745 (class 1259 OID 22867602)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2746 (class 1259 OID 22867603)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 22867604)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2812 (class 1259 OID 22867908)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2754 (class 1259 OID 22867638)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2755 (class 1259 OID 22867635)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2756 (class 1259 OID 22867639)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2757 (class 1259 OID 22867637)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2758 (class 1259 OID 22867636)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2591 (class 1259 OID 22867193)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 22867192)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2560 (class 1259 OID 22867106)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2699 (class 1259 OID 22867450)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2546 (class 1259 OID 22867050)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 22867051)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2704 (class 1259 OID 22867470)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2705 (class 1259 OID 22867469)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2706 (class 1259 OID 22867468)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2574 (class 1259 OID 22867143)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2575 (class 1259 OID 22867142)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2576 (class 1259 OID 22867144)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2614 (class 1259 OID 22867260)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2615 (class 1259 OID 22867258)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 22867259)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 22866983)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2661 (class 1259 OID 22867375)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2662 (class 1259 OID 22867373)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2663 (class 1259 OID 22867372)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2664 (class 1259 OID 22867374)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2537 (class 1259 OID 22867024)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2538 (class 1259 OID 22867025)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2690 (class 1259 OID 22867431)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2825 (class 1259 OID 22867942)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2727 (class 1259 OID 22867523)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 22867522)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2826 (class 1259 OID 22867950)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2827 (class 1259 OID 22867951)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2676 (class 1259 OID 22867396)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2721 (class 1259 OID 22867515)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2722 (class 1259 OID 22867516)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2775 (class 1259 OID 22867737)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2776 (class 1259 OID 22867736)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2777 (class 1259 OID 22867733)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 22867734)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2779 (class 1259 OID 22867735)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2580 (class 1259 OID 22867158)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 22867157)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2582 (class 1259 OID 22867159)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2693 (class 1259 OID 22867444)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2694 (class 1259 OID 22867443)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2785 (class 1259 OID 22867821)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2786 (class 1259 OID 22867822)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2768 (class 1259 OID 22867668)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2769 (class 1259 OID 22867669)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2770 (class 1259 OID 22867666)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2771 (class 1259 OID 22867667)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2717 (class 1259 OID 22867505)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2718 (class 1259 OID 22867506)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2667 (class 1259 OID 22867384)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2668 (class 1259 OID 22867383)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2669 (class 1259 OID 22867381)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2670 (class 1259 OID 22867382)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2764 (class 1259 OID 22867656)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 22867655)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2605 (class 1259 OID 22867233)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2608 (class 1259 OID 22867247)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2609 (class 1259 OID 22867246)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2610 (class 1259 OID 22867245)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2611 (class 1259 OID 22867248)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2625 (class 1259 OID 22867278)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2619 (class 1259 OID 22867266)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2620 (class 1259 OID 22867267)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2782 (class 1259 OID 22867812)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2801 (class 1259 OID 22867860)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2819 (class 1259 OID 22867926)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2820 (class 1259 OID 22867927)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2556 (class 1259 OID 22867081)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2557 (class 1259 OID 22867080)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2565 (class 1259 OID 22867113)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 22867114)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2644 (class 1259 OID 22867327)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2656 (class 1259 OID 22867365)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2657 (class 1259 OID 22867364)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 22867363)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 22867313)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2640 (class 1259 OID 22867314)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2641 (class 1259 OID 22867312)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2642 (class 1259 OID 22867316)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2643 (class 1259 OID 22867315)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2573 (class 1259 OID 22867132)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2554 (class 1259 OID 22867069)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 22867070)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2597 (class 1259 OID 22867207)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 22867209)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2599 (class 1259 OID 22867208)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2600 (class 1259 OID 22867210)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2675 (class 1259 OID 22867390)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2750 (class 1259 OID 22867601)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2759 (class 1259 OID 22867634)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 22867575)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 22867576)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2563 (class 1259 OID 22867104)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 22867105)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2714 (class 1259 OID 22867495)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 22866994)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 22867179)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2579 (class 1259 OID 22867141)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 22866982)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2798 (class 1259 OID 22867853)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2697 (class 1259 OID 22867442)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2698 (class 1259 OID 22867441)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 22867341)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 22867342)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2772 (class 1259 OID 22867665)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 22867167)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2751 (class 1259 OID 22867614)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 22867900)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2791 (class 1259 OID 22867829)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2792 (class 1259 OID 22867830)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2738 (class 1259 OID 22867564)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2655 (class 1259 OID 22867352)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 22867044)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2868 (class 2606 OID 22868122)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2867 (class 2606 OID 22868127)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2863 (class 2606 OID 22868147)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2869 (class 2606 OID 22868117)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2865 (class 2606 OID 22868137)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2864 (class 2606 OID 22868142)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2866 (class 2606 OID 22868132)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2905 (class 2606 OID 22868317)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2904 (class 2606 OID 22868322)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2903 (class 2606 OID 22868327)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2937 (class 2606 OID 22868492)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2938 (class 2606 OID 22868487)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 22868007)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2841 (class 2606 OID 22868012)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2886 (class 2606 OID 22868232)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 22868472)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 22868467)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2931 (class 2606 OID 22868477)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2934 (class 2606 OID 22868462)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2935 (class 2606 OID 22868457)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2884 (class 2606 OID 22868227)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2885 (class 2606 OID 22868222)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2862 (class 2606 OID 22868107)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2861 (class 2606 OID 22868112)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 22868272)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2894 (class 2606 OID 22868282)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2895 (class 2606 OID 22868277)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2851 (class 2606 OID 22868062)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 22868057)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 22868212)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2929 (class 2606 OID 22868447)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2908 (class 2606 OID 22868332)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2907 (class 2606 OID 22868337)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2906 (class 2606 OID 22868342)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2936 (class 2606 OID 22868482)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2910 (class 2606 OID 22868362)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2913 (class 2606 OID 22868347)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 22868367)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2911 (class 2606 OID 22868357)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2912 (class 2606 OID 22868352)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2849 (class 2606 OID 22868052)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2850 (class 2606 OID 22868047)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2837 (class 2606 OID 22867992)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2838 (class 2606 OID 22867987)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2890 (class 2606 OID 22868252)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2834 (class 2606 OID 22867967)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2833 (class 2606 OID 22867972)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2891 (class 2606 OID 22868267)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2892 (class 2606 OID 22868262)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2893 (class 2606 OID 22868257)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2844 (class 2606 OID 22868022)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2845 (class 2606 OID 22868017)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2843 (class 2606 OID 22868027)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2855 (class 2606 OID 22868087)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2857 (class 2606 OID 22868077)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 22868082)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2830 (class 2606 OID 22867952)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2874 (class 2606 OID 22868187)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2876 (class 2606 OID 22868177)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2877 (class 2606 OID 22868172)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2875 (class 2606 OID 22868182)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 22867957)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2831 (class 2606 OID 22867962)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 22868237)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2941 (class 2606 OID 22868507)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2901 (class 2606 OID 22868312)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 22868307)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2943 (class 2606 OID 22868512)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2942 (class 2606 OID 22868517)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2883 (class 2606 OID 22868217)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2900 (class 2606 OID 22868297)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2899 (class 2606 OID 22868302)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2920 (class 2606 OID 22868422)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2921 (class 2606 OID 22868417)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2924 (class 2606 OID 22868402)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 22868407)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2922 (class 2606 OID 22868412)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2847 (class 2606 OID 22868037)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 22868032)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 22868042)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2888 (class 2606 OID 22868247)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2889 (class 2606 OID 22868242)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 22868432)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2926 (class 2606 OID 22868437)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2917 (class 2606 OID 22868392)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 22868397)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2919 (class 2606 OID 22868382)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2918 (class 2606 OID 22868387)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 22868287)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 22868292)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2878 (class 2606 OID 22868207)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2879 (class 2606 OID 22868202)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2881 (class 2606 OID 22868192)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2880 (class 2606 OID 22868197)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 22868377)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2915 (class 2606 OID 22868372)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2853 (class 2606 OID 22868067)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2854 (class 2606 OID 22868072)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2860 (class 2606 OID 22868102)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2859 (class 2606 OID 22868092)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2858 (class 2606 OID 22868097)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2925 (class 2606 OID 22868427)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2928 (class 2606 OID 22868442)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2930 (class 2606 OID 22868452)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2940 (class 2606 OID 22868497)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 22868502)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2835 (class 2606 OID 22867982)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2836 (class 2606 OID 22867977)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2840 (class 2606 OID 22867997)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 22868002)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2870 (class 2606 OID 22868152)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2871 (class 2606 OID 22868167)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2872 (class 2606 OID 22868162)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2873 (class 2606 OID 22868157)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-21 11:50:07 CEST

--
-- PostgreSQL database dump complete
--

