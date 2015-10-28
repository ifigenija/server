--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-28 09:47:09 CET

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
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 250
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 23560858)
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
-- TOC entry 234 (class 1259 OID 23561466)
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
-- TOC entry 233 (class 1259 OID 23561449)
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
-- TOC entry 224 (class 1259 OID 23561326)
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
-- TOC entry 227 (class 1259 OID 23561356)
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
-- TOC entry 248 (class 1259 OID 23561737)
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
-- TOC entry 201 (class 1259 OID 23561106)
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
-- TOC entry 203 (class 1259 OID 23561137)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 23561663)
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
-- TOC entry 192 (class 1259 OID 23561003)
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
-- TOC entry 235 (class 1259 OID 23561479)
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
-- TOC entry 220 (class 1259 OID 23561280)
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
-- TOC entry 198 (class 1259 OID 23561077)
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
-- TOC entry 195 (class 1259 OID 23561043)
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
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 23561020)
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
-- TOC entry 209 (class 1259 OID 23561194)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 246 (class 1259 OID 23561718)
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
-- TOC entry 247 (class 1259 OID 23561730)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 23561752)
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
-- TOC entry 170 (class 1259 OID 23558673)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23561219)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 23560977)
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
-- TOC entry 183 (class 1259 OID 23560877)
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
-- TOC entry 187 (class 1259 OID 23560944)
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
-- TOC entry 184 (class 1259 OID 23560888)
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
    twitter character varying(255) DEFAULT NULL::character varying,
    skype character varying(255) DEFAULT NULL::character varying,
    fb character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 178 (class 1259 OID 23560832)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 23560851)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 23561226)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 23561260)
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
-- TOC entry 230 (class 1259 OID 23561397)
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
-- TOC entry 186 (class 1259 OID 23560924)
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
-- TOC entry 189 (class 1259 OID 23560969)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 23561608)
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
-- TOC entry 210 (class 1259 OID 23561200)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 23560954)
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
-- TOC entry 200 (class 1259 OID 23561098)
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
-- TOC entry 196 (class 1259 OID 23561058)
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
-- TOC entry 197 (class 1259 OID 23561070)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 23561212)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 23561622)
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
-- TOC entry 239 (class 1259 OID 23561632)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23561547)
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
-- TOC entry 240 (class 1259 OID 23561640)
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
-- TOC entry 216 (class 1259 OID 23561241)
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
-- TOC entry 208 (class 1259 OID 23561185)
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
-- TOC entry 207 (class 1259 OID 23561175)
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
-- TOC entry 229 (class 1259 OID 23561386)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 23561316)
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
-- TOC entry 194 (class 1259 OID 23561032)
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
-- TOC entry 175 (class 1259 OID 23560803)
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
-- TOC entry 174 (class 1259 OID 23560801)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 217 (class 1259 OID 23561254)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 23560841)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 23560825)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 23561268)
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
-- TOC entry 211 (class 1259 OID 23561206)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 23561152)
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
-- TOC entry 173 (class 1259 OID 23560790)
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
-- TOC entry 172 (class 1259 OID 23560782)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 23560777)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 225 (class 1259 OID 23561333)
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
-- TOC entry 185 (class 1259 OID 23560916)
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
-- TOC entry 206 (class 1259 OID 23561162)
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
-- TOC entry 228 (class 1259 OID 23561374)
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
-- TOC entry 182 (class 1259 OID 23560867)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 241 (class 1259 OID 23561651)
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
-- TOC entry 204 (class 1259 OID 23561142)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 23560989)
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
-- TOC entry 176 (class 1259 OID 23560812)
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
-- TOC entry 232 (class 1259 OID 23561424)
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
-- TOC entry 199 (class 1259 OID 23561088)
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
-- TOC entry 215 (class 1259 OID 23561233)
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
-- TOC entry 226 (class 1259 OID 23561347)
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
-- TOC entry 244 (class 1259 OID 23561698)
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
-- TOC entry 243 (class 1259 OID 23561670)
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
-- TOC entry 245 (class 1259 OID 23561710)
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
-- TOC entry 222 (class 1259 OID 23561305)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 202 (class 1259 OID 23561131)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 231 (class 1259 OID 23561414)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 221 (class 1259 OID 23561295)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2224 (class 2604 OID 23560806)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3065 (class 0 OID 23560858)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5630-8b8a-442a-ea145e10ac23	10	30	Otroci	Abonma za otroke	200
000a0000-5630-8b8a-31f9-41206e1975b0	20	60	Mladina	Abonma za mladino	400
000a0000-5630-8b8a-9af2-604c8c23553d	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3118 (class 0 OID 23561466)
-- Dependencies: 234
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5630-8b8a-5869-a810171c7a7a	000d0000-5630-8b8a-8574-f1c3eb974f78	\N	00090000-5630-8b8a-3a3d-1991bdcf3289	000b0000-5630-8b8a-ce78-e0afd28941c2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5630-8b8a-940d-35036ae0adf8	000d0000-5630-8b8a-9331-d8aff6c8d30b	00100000-5630-8b8a-6eee-d05087e61309	00090000-5630-8b8a-ada2-dd9b948e933c	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5630-8b8a-5127-912c837326ca	000d0000-5630-8b8a-6499-bf4273cf4fbe	00100000-5630-8b8a-44c3-3ae228271ceb	00090000-5630-8b8a-b8fe-b2669efb4e5c	\N	0003	t	\N	2015-10-28	\N	2	t	\N	f	f
000c0000-5630-8b8a-a853-ca272dc72b74	000d0000-5630-8b8a-ea2f-97618929e061	\N	00090000-5630-8b8a-9461-1c839fe21c1e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5630-8b8a-c1fa-748cd3d040f7	000d0000-5630-8b8a-43f8-8b108c90e749	\N	00090000-5630-8b8a-ba68-17994b226ac6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5630-8b8a-7e95-76b1a02efcea	000d0000-5630-8b8a-0b3a-e3aa3223f93b	\N	00090000-5630-8b8a-b864-9808542504e2	000b0000-5630-8b8a-6331-6843aad88b36	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5630-8b8a-1bf2-6be84e847691	000d0000-5630-8b8a-143c-0052213ee6e4	00100000-5630-8b8a-ba0d-7dab18ad759a	00090000-5630-8b8a-2805-96d9e3a6650d	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5630-8b8a-1fe4-0112de0f03ad	000d0000-5630-8b8a-dfc8-914b88cef7c8	\N	00090000-5630-8b8a-fb7d-fdc6e0379c8d	000b0000-5630-8b8a-bc38-12edc67dc9a9	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5630-8b8a-f56f-1fa1d62c1868	000d0000-5630-8b8a-143c-0052213ee6e4	00100000-5630-8b8a-a3c3-4c506d481eac	00090000-5630-8b8a-87eb-2d06914bd2b1	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5630-8b8a-6f15-a5ea8f3ef0fd	000d0000-5630-8b8a-143c-0052213ee6e4	00100000-5630-8b8a-d6c1-438b1b68496d	00090000-5630-8b8a-a501-f0f9961cd633	\N	0010	t	\N	2015-10-28	\N	16	f	\N	f	t
000c0000-5630-8b8a-aff6-69a957ebf7b5	000d0000-5630-8b8a-143c-0052213ee6e4	00100000-5630-8b8a-8c32-c417221666b7	00090000-5630-8b8a-cf00-ac41a6af0bc4	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5630-8b8a-5661-6b1db1c1d7d6	000d0000-5630-8b8a-96a0-720e454cf3e3	00100000-5630-8b8a-6eee-d05087e61309	00090000-5630-8b8a-ada2-dd9b948e933c	000b0000-5630-8b8a-78d5-7bbaf609d9f6	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3117 (class 0 OID 23561449)
-- Dependencies: 233
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23561326)
-- Dependencies: 224
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5630-8b8a-5083-abb3e5cfa479	00160000-5630-8b8a-c320-682557478837	00090000-5630-8b8a-39e1-b3747f38840b	aizv	10	t
003d0000-5630-8b8a-5af5-9ab743604eab	00160000-5630-8b8a-c320-682557478837	00090000-5630-8b8a-fcb1-79eb5789ff40	apri	14	t
003d0000-5630-8b8a-b5ec-1e6d8607acb5	00160000-5630-8b8a-8cb2-785ff544a91e	00090000-5630-8b8a-9f2d-7dc922d891ce	aizv	11	t
003d0000-5630-8b8a-d44d-1c80937141d8	00160000-5630-8b8a-b05a-78c2883d445c	00090000-5630-8b8a-9b90-3ea10da907e5	aizv	12	t
003d0000-5630-8b8a-a3f0-a9ef31b7ae0b	00160000-5630-8b8a-c320-682557478837	00090000-5630-8b8a-ce6b-12411d804974	apri	18	f
\.


--
-- TOC entry 3111 (class 0 OID 23561356)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5630-8b8a-c320-682557478837	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5630-8b8a-8cb2-785ff544a91e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5630-8b8a-b05a-78c2883d445c	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3132 (class 0 OID 23561737)
-- Dependencies: 248
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 23561106)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5630-8b8a-8683-7d2ebf91ff44	\N	\N	00200000-5630-8b8a-9713-003bfd0243f4	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5630-8b8a-8510-7400c160ae45	\N	\N	00200000-5630-8b8a-441c-80fd180a6fb3	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5630-8b8a-0f7d-e6c0b910dbc9	\N	\N	00200000-5630-8b8a-c592-60a368a16a36	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5630-8b8a-b54b-b9cd5a03a644	\N	\N	00200000-5630-8b8a-6e3e-24b4c31f23cb	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5630-8b8a-2f9c-999ac8cf35f9	\N	\N	00200000-5630-8b8a-78d2-94a240afe7ae	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3087 (class 0 OID 23561137)
-- Dependencies: 203
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23561663)
-- Dependencies: 242
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 23561003)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5630-8b88-09e1-763566688389	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5630-8b88-a307-439adfc1f5b3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5630-8b88-f22a-5a3472397761	AL	ALB	008	Albania 	Albanija	\N
00040000-5630-8b88-7227-3183e4ce4502	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5630-8b88-94aa-dd32422f357a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5630-8b88-dede-5a1647cfc73d	AD	AND	020	Andorra 	Andora	\N
00040000-5630-8b88-79c8-ea8165e94be2	AO	AGO	024	Angola 	Angola	\N
00040000-5630-8b88-256a-7c53d61740b2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5630-8b88-1ba0-a66d4076a67d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5630-8b88-b1e0-1ede60aab435	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5630-8b88-c345-f2e32b035a12	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5630-8b88-4ed3-396afc0cb26b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5630-8b88-68af-982df37d3419	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5630-8b88-c1fc-23dd7bffbffb	AU	AUS	036	Australia 	Avstralija	\N
00040000-5630-8b88-3463-4e2a3dc3d9be	AT	AUT	040	Austria 	Avstrija	\N
00040000-5630-8b88-ae9e-0091f35c7be8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5630-8b88-8bc8-0a5767be38c0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5630-8b88-1d10-77a52e9880cd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5630-8b88-a2ca-00b31411483c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5630-8b88-7921-4eecc4fbca7f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5630-8b88-0a67-e4048e22b1f7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5630-8b88-fe92-d78ecf7b5f47	BE	BEL	056	Belgium 	Belgija	\N
00040000-5630-8b88-783a-abf4c5dd5fbd	BZ	BLZ	084	Belize 	Belize	\N
00040000-5630-8b88-6f4f-8cf0832913aa	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5630-8b88-10c2-7f700a0a2b80	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5630-8b88-dc5a-e8bf2dbf9cea	BT	BTN	064	Bhutan 	Butan	\N
00040000-5630-8b88-b553-d09976364b23	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5630-8b88-1b1a-958047a70b38	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5630-8b88-172a-5303c3ad36ec	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5630-8b88-b7c2-f1559797c613	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5630-8b88-23b5-705a6ed3477f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5630-8b88-fc57-c9d6aa981a98	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5630-8b88-6321-6e9c165e2655	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5630-8b88-8305-975664bf9d4e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5630-8b88-3d25-518e6968fa53	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5630-8b88-2db1-7d8eac4ff71b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5630-8b88-85b9-c12c43dffcea	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5630-8b88-0c3b-67bdd6213ef2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5630-8b88-0b4c-ab7d130c7b09	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5630-8b88-7773-0b15cc9ae929	CA	CAN	124	Canada 	Kanada	\N
00040000-5630-8b88-572a-5f574cd10b12	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5630-8b88-0bcc-ed8fd2d9c262	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5630-8b88-d1ba-49fe266eb700	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5630-8b88-fbe7-75a12c20916c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5630-8b88-af05-08db71c75c36	CL	CHL	152	Chile 	Čile	\N
00040000-5630-8b88-d45e-63582c74cba6	CN	CHN	156	China 	Kitajska	\N
00040000-5630-8b88-ed8c-00ab81732fe3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5630-8b88-7129-1e7f178f1023	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5630-8b88-b4ce-987bc7ef82bc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5630-8b88-9c79-7a6558e32e33	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5630-8b88-4e84-c399fc7b763f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5630-8b88-a84c-8528243b9136	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5630-8b88-65a2-ec7b54fec494	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5630-8b88-6adb-2f0a29e34ae7	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5630-8b88-3812-609404f47b13	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5630-8b88-77ff-ee0b72c57bf8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5630-8b88-cc59-c795ffd2b84d	CU	CUB	192	Cuba 	Kuba	\N
00040000-5630-8b88-f19e-285025c17a88	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5630-8b88-aed6-e69610bc501e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5630-8b88-02ff-fdb1f3c60fe0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5630-8b88-f023-9337fe140f9e	DK	DNK	208	Denmark 	Danska	\N
00040000-5630-8b88-88aa-af0f67480ffb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5630-8b88-8f05-0ce103754e54	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5630-8b88-1763-1b362ad5827b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5630-8b88-74f9-07c5d98ff59c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5630-8b88-d107-39f9ccfd803e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5630-8b88-fa86-4dab5e96d550	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5630-8b88-c421-97c54494397a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5630-8b88-a676-ff02eccd0523	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5630-8b88-e1d2-b417033d3f0b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5630-8b88-25df-1e65ba3ae511	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5630-8b88-d85f-da598a45be5d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5630-8b88-bb59-c753e6867777	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5630-8b88-75db-de69b0bcc901	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5630-8b88-b4d2-1c70f6e5bdaf	FI	FIN	246	Finland 	Finska	\N
00040000-5630-8b88-6eea-1a792595dbad	FR	FRA	250	France 	Francija	\N
00040000-5630-8b88-fde9-4750ae210997	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5630-8b88-1092-ba18c2af702d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5630-8b88-67a2-366df89ea1ea	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5630-8b88-7057-7eae5de8b62f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5630-8b88-f412-75fe8c77c7c9	GA	GAB	266	Gabon 	Gabon	\N
00040000-5630-8b88-481c-1c62a15a8ab9	GM	GMB	270	Gambia 	Gambija	\N
00040000-5630-8b88-baca-7ec0bae28814	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5630-8b88-ea2d-08dfb9b173e8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5630-8b88-f39f-d96c377d5867	GH	GHA	288	Ghana 	Gana	\N
00040000-5630-8b88-9342-cb4ecad349d3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5630-8b88-96ff-dbbc922954c6	GR	GRC	300	Greece 	Grčija	\N
00040000-5630-8b88-0bb8-a9b68d5c5d0f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5630-8b88-6c5e-bb434ffbdd2b	GD	GRD	308	Grenada 	Grenada	\N
00040000-5630-8b88-2e89-5e8d1143eba1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5630-8b88-7008-3ec56777e4c7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5630-8b88-28ea-6c381d138e37	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5630-8b88-ab67-2b8fb3a40fb5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5630-8b88-428f-248c814d9380	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5630-8b88-8bf7-da4f60fb4d5a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5630-8b88-16ed-64d2b2b54188	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5630-8b88-e6d7-8cf3edd27def	HT	HTI	332	Haiti 	Haiti	\N
00040000-5630-8b88-c7f9-be67615526fc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5630-8b88-1e0e-71c6d47b7c62	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5630-8b88-a16d-a358296e2a98	HN	HND	340	Honduras 	Honduras	\N
00040000-5630-8b88-c9dc-3001512001bf	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5630-8b88-dea2-a9184b99535b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5630-8b88-a10d-32d12df0b9e1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5630-8b88-ae3c-c00235b4dce7	IN	IND	356	India 	Indija	\N
00040000-5630-8b88-d2eb-69e316849632	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5630-8b88-5258-0065b5a68535	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5630-8b88-6bb7-fdb5e9663dbb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5630-8b88-6b59-da2d0bf54574	IE	IRL	372	Ireland 	Irska	\N
00040000-5630-8b88-cb98-68bf085a2044	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5630-8b88-2b9f-3359ab22bb43	IL	ISR	376	Israel 	Izrael	\N
00040000-5630-8b88-2d8f-d86843e0e269	IT	ITA	380	Italy 	Italija	\N
00040000-5630-8b88-4cf9-302f3cc65103	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5630-8b88-b286-52ab1ce3351b	JP	JPN	392	Japan 	Japonska	\N
00040000-5630-8b88-ca59-87c5a6d94e11	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5630-8b88-a8fb-d03bf2cb2afe	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5630-8b88-e153-3146bba84200	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5630-8b88-a488-b4b85781e5f9	KE	KEN	404	Kenya 	Kenija	\N
00040000-5630-8b88-4422-25cf5e875c68	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5630-8b88-44f3-d278beb2f2ba	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5630-8b88-1176-abf55fc83ca5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5630-8b88-8565-94f489194766	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5630-8b88-70cf-4f43d809711d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5630-8b88-4f02-5a5824149198	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5630-8b88-3c82-1728e15ee335	LV	LVA	428	Latvia 	Latvija	\N
00040000-5630-8b88-f02f-f9548713ea6e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5630-8b88-a450-fad6950531d8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5630-8b88-d332-e2c7f64b5378	LR	LBR	430	Liberia 	Liberija	\N
00040000-5630-8b88-6eaa-022f5d86c508	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5630-8b88-092f-65e813b1fcf6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5630-8b88-c4b3-5514626f4617	LT	LTU	440	Lithuania 	Litva	\N
00040000-5630-8b88-124a-74487031eb59	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5630-8b88-519d-d1e87716f7ea	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5630-8b88-4278-77c9712f4030	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5630-8b88-126b-efa6f98edddb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5630-8b88-d7a1-de30b47bb9ad	MW	MWI	454	Malawi 	Malavi	\N
00040000-5630-8b88-9c0f-43a8e74a8885	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5630-8b88-37b9-ff163ea2b380	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5630-8b88-66a1-a5e068876bde	ML	MLI	466	Mali 	Mali	\N
00040000-5630-8b88-c94e-9324fec57b32	MT	MLT	470	Malta 	Malta	\N
00040000-5630-8b88-d632-881411608031	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5630-8b88-8b1b-aa5cb4ccad69	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5630-8b88-70ad-7a6221876d4a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5630-8b88-b023-0f2dc8a548ee	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5630-8b88-8582-e2638230f1c6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5630-8b88-d3ad-27a10f85a471	MX	MEX	484	Mexico 	Mehika	\N
00040000-5630-8b88-4d65-eeb7539a0ddd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5630-8b88-c8af-97e880ec4eb1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5630-8b88-3686-4a8eb26a4c4c	MC	MCO	492	Monaco 	Monako	\N
00040000-5630-8b88-835c-ce8e405c938a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5630-8b88-7b65-70660f5380e1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5630-8b88-e847-c854b7721a6d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5630-8b88-0090-21bc4350a535	MA	MAR	504	Morocco 	Maroko	\N
00040000-5630-8b88-fcf5-dfcc79334fda	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5630-8b88-8a2f-6a750cfbbb40	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5630-8b88-c8bc-67caec7abe81	NA	NAM	516	Namibia 	Namibija	\N
00040000-5630-8b88-7f03-458ab00f41c7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5630-8b88-1413-f2ab2ee41a45	NP	NPL	524	Nepal 	Nepal	\N
00040000-5630-8b88-b533-4c502798fe46	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5630-8b88-30fa-381248844429	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5630-8b88-1fb1-df80cadb14f7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5630-8b88-2274-14029421dca9	NE	NER	562	Niger 	Niger 	\N
00040000-5630-8b88-876d-7a4eecf410ee	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5630-8b88-b1d5-1ae4a07e584e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5630-8b88-6a22-b59bdbb65fe4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5630-8b88-4d21-b49321c96729	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5630-8b88-6762-c7fe2ed1eba6	NO	NOR	578	Norway 	Norveška	\N
00040000-5630-8b88-8d4a-aa9c92d6c3cb	OM	OMN	512	Oman 	Oman	\N
00040000-5630-8b88-8a87-00757f012b75	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5630-8b88-a511-89cc92bd7354	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5630-8b88-b0b3-4df1cd904176	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5630-8b88-86bd-abe4bcf77b0f	PA	PAN	591	Panama 	Panama	\N
00040000-5630-8b88-7a9c-e1117e7a6646	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5630-8b88-1116-ede7bba098f3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5630-8b88-30a3-e1bec6bcfbad	PE	PER	604	Peru 	Peru	\N
00040000-5630-8b88-868c-5b49285fa2e1	PH	PHL	608	Philippines 	Filipini	\N
00040000-5630-8b88-1096-96c391437e46	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5630-8b88-f9cf-b7e6d24b6d8b	PL	POL	616	Poland 	Poljska	\N
00040000-5630-8b88-340f-4a4673ef40d4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5630-8b88-b811-4a0e0335bc27	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5630-8b88-ff9c-97597bea97b5	QA	QAT	634	Qatar 	Katar	\N
00040000-5630-8b88-7bfc-a27710223142	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5630-8b88-b58a-b86bace22c72	RO	ROU	642	Romania 	Romunija	\N
00040000-5630-8b88-bb5e-28121ac051bc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5630-8b88-d71a-feeef3f26431	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5630-8b88-d3bb-002590df881c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5630-8b88-cb98-4f19fb7f5c36	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5630-8b88-5c01-aade8966214e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5630-8b88-332d-b88526f66d5d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5630-8b88-9253-9c9e2595063f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5630-8b88-d5c0-a6ab020d5717	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5630-8b88-5912-3ca77c7fac43	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5630-8b88-7bad-d8b4eec7867d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5630-8b88-488d-f99d88ea36e0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5630-8b88-588e-84b98846c657	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5630-8b88-7961-d21880129ed5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5630-8b88-9e25-e12d86ca5323	SN	SEN	686	Senegal 	Senegal	\N
00040000-5630-8b88-b033-3133d069718a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5630-8b88-e238-c8cc4432b06d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5630-8b88-d829-375593cd2746	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5630-8b88-3566-8a3781a6d3a7	SG	SGP	702	Singapore 	Singapur	\N
00040000-5630-8b88-3c1e-b2b9133b4553	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5630-8b88-f4e9-d87d42b5ccb0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5630-8b88-8d31-b8f82df4bde8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5630-8b88-7221-a2b22220e139	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5630-8b88-b810-e7323e8207c2	SO	SOM	706	Somalia 	Somalija	\N
00040000-5630-8b88-2d04-16786875e348	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5630-8b88-980f-9abfc506add3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5630-8b88-4420-a3891b037d68	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5630-8b88-607e-be7e30aa52a4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5630-8b88-97a9-75f058175574	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5630-8b88-78e3-b3a3a9827f5b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5630-8b88-7ac2-ba743dfd8880	SR	SUR	740	Suriname 	Surinam	\N
00040000-5630-8b88-375b-4ace0296bb35	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5630-8b88-2acb-d72991407ac0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5630-8b88-4609-2fc54f0d06ec	SE	SWE	752	Sweden 	Švedska	\N
00040000-5630-8b88-ef4a-991127aec506	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5630-8b88-b0b9-29ca777a79ed	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5630-8b88-66a3-ed00c9af5094	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5630-8b88-e3bc-d502b849b1de	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5630-8b88-6f4d-32692f1dada7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5630-8b88-e4a7-25d1a55db4d8	TH	THA	764	Thailand 	Tajska	\N
00040000-5630-8b88-399b-681b252714e9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5630-8b88-a179-b615e113fc37	TG	TGO	768	Togo 	Togo	\N
00040000-5630-8b88-2670-cc55e52e304f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5630-8b88-ad4f-16426eee2222	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5630-8b88-4f37-1be08ad4b63b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5630-8b88-a361-18391dfe18f8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5630-8b88-0e08-a7d8b37aa299	TR	TUR	792	Turkey 	Turčija	\N
00040000-5630-8b88-5ab4-6908a71ab8b4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5630-8b88-6a86-a481cafa0cef	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5630-8b88-8863-f198df8d8056	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5630-8b88-f815-af9e43c0fcaf	UG	UGA	800	Uganda 	Uganda	\N
00040000-5630-8b88-e29f-3da38e0f11be	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5630-8b88-0c5f-8edb3d8df5c1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5630-8b88-110a-7dec7fecc2f4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5630-8b88-ec71-ddf642b7b710	US	USA	840	United States 	Združene države Amerike	\N
00040000-5630-8b88-0fdb-13f28215ffa8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5630-8b88-e9bd-f2f65ca9baa8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5630-8b88-203a-6ea27a4d0251	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5630-8b88-5d93-5d9d8250f6b4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5630-8b88-e5c0-c8b1e1a1dab8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5630-8b88-8e39-c1251811eae2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5630-8b88-b974-365b468d9141	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5630-8b88-efd1-a518188147e9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5630-8b88-2270-a30b65ff24c1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5630-8b88-e887-bf0a66cb28ed	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5630-8b88-ed60-f8f7765ab177	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5630-8b88-4223-37e61931d142	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5630-8b88-09d1-ef41e1cf3acf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3119 (class 0 OID 23561479)
-- Dependencies: 235
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5630-8b8a-5951-3600155101f1	000e0000-5630-8b8a-bd6e-b1cc79a1b31c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5630-8b88-68c1-ec7546264095	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5630-8b8a-ac16-c1dbbf2ac528	000e0000-5630-8b8a-e272-8ea31d834e9f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5630-8b88-24c4-838cf2886069	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5630-8b8a-50ed-60fe9e836ed6	000e0000-5630-8b8a-f8bd-d2df11ee4979	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5630-8b88-68c1-ec7546264095	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5630-8b8a-8d2d-b3ccd71a4a49	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5630-8b8a-bef8-8f9607891715	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3104 (class 0 OID 23561280)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5630-8b8a-143c-0052213ee6e4	000e0000-5630-8b8a-e272-8ea31d834e9f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5630-8b88-d317-06bf63e816b6
000d0000-5630-8b8a-8574-f1c3eb974f78	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-5869-a810171c7a7a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5630-8b88-d317-06bf63e816b6
000d0000-5630-8b8a-9331-d8aff6c8d30b	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-940d-35036ae0adf8	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5630-8b88-04eb-50daefcf7a12
000d0000-5630-8b8a-6499-bf4273cf4fbe	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-5127-912c837326ca	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5630-8b88-9d2b-337ce42b6f20
000d0000-5630-8b8a-ea2f-97618929e061	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-a853-ca272dc72b74	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5630-8b88-eca9-ed30aec4da66
000d0000-5630-8b8a-43f8-8b108c90e749	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-c1fa-748cd3d040f7	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5630-8b88-eca9-ed30aec4da66
000d0000-5630-8b8a-0b3a-e3aa3223f93b	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-7e95-76b1a02efcea	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5630-8b88-d317-06bf63e816b6
000d0000-5630-8b8a-dfc8-914b88cef7c8	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-1fe4-0112de0f03ad	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5630-8b88-72e8-b25230af7c16
000d0000-5630-8b8a-96a0-720e454cf3e3	000e0000-5630-8b8a-e272-8ea31d834e9f	000c0000-5630-8b8a-5661-6b1db1c1d7d6	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5630-8b88-98d9-bcca9e142e9d
\.


--
-- TOC entry 3082 (class 0 OID 23561077)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 23561043)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 23561020)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5630-8b8a-a459-b2dfd3c876a2	00080000-5630-8b8a-deaa-88607b60706c	00090000-5630-8b8a-a501-f0f9961cd633	AK		igralka
\.


--
-- TOC entry 3093 (class 0 OID 23561194)
-- Dependencies: 209
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 23561718)
-- Dependencies: 246
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 23561730)
-- Dependencies: 247
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 23561752)
-- Dependencies: 249
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 23558673)
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
20151021092904
\.


--
-- TOC entry 3097 (class 0 OID 23561219)
-- Dependencies: 213
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23560977)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5630-8b89-c50d-0499243d634d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5630-8b89-0fb2-307e1a4b2257	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5630-8b89-89ed-028808164dec	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5630-8b89-66aa-1131d116d986	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5630-8b89-d4d8-9652d2b9b88e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5630-8b89-46b3-fe178d870a1a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5630-8b89-699e-2084e7479c8d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5630-8b89-0f51-a2d17d1f6e11	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5630-8b89-b34f-475ba826f146	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5630-8b89-13ce-e309cc5e05f4	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5630-8b89-afd9-24af108eea37	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5630-8b89-1ce1-e263d30ff9d8	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5630-8b89-7445-c7d9fa20fe72	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5630-8b89-8a9d-d7208cb291ec	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5630-8b89-14f0-3e48a9e2979a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5630-8b8a-faa9-2930980cbcdb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5630-8b8a-e885-6f9d5ac83f75	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5630-8b8a-c390-4b03a791f6a5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5630-8b8a-8175-f8d94116e621	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5630-8b8a-b83a-0c1669423e48	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5630-8b8c-2b2e-486149be4cc4	application.tenant.maticnopodjetje	string	s:36:"00080000-5630-8b8c-1172-39c51ec87f7e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3067 (class 0 OID 23560877)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5630-8b8a-81c4-ed162c16c0b2	00000000-5630-8b8a-faa9-2930980cbcdb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5630-8b8a-a104-a2f2b08bb6a4	00000000-5630-8b8a-faa9-2930980cbcdb	00010000-5630-8b89-a938-83bcd37758bc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5630-8b8a-ea91-19cd9d80f199	00000000-5630-8b8a-e885-6f9d5ac83f75	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3071 (class 0 OID 23560944)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5630-8b8a-0b80-3bc45c1fc746	\N	00100000-5630-8b8a-6eee-d05087e61309	00100000-5630-8b8a-44c3-3ae228271ceb	01	Gledališče Nimbis
00410000-5630-8b8a-a36d-f0502595cf38	00410000-5630-8b8a-0b80-3bc45c1fc746	00100000-5630-8b8a-6eee-d05087e61309	00100000-5630-8b8a-44c3-3ae228271ceb	02	Tehnika
\.


--
-- TOC entry 3068 (class 0 OID 23560888)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5630-8b8a-3a3d-1991bdcf3289	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5630-8b8a-9461-1c839fe21c1e	00010000-5630-8b8a-3196-524e6ebb8abe	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5630-8b8a-b8fe-b2669efb4e5c	00010000-5630-8b8a-7114-fd640146df06	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5630-8b8a-87eb-2d06914bd2b1	00010000-5630-8b8a-e49a-a635974f1c51	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5630-8b8a-7c6e-4025bd1459c5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5630-8b8a-b864-9808542504e2	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5630-8b8a-cf00-ac41a6af0bc4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5630-8b8a-2805-96d9e3a6650d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5630-8b8a-a501-f0f9961cd633	00010000-5630-8b8a-f7cd-e460abbbdce9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5630-8b8a-ada2-dd9b948e933c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5630-8b8a-91a0-2df6afa6e17a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5630-8b8a-ba68-17994b226ac6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5630-8b8a-fb7d-fdc6e0379c8d	00010000-5630-8b8a-67d2-9016b2e07bdd	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5630-8b8a-39e1-b3747f38840b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-8b8a-fcb1-79eb5789ff40	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-8b8a-9f2d-7dc922d891ce	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-8b8a-9b90-3ea10da907e5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5630-8b8a-ce6b-12411d804974	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5630-8b8a-5d31-f47d3b4a17e1	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-8b8a-eb56-402ae6fbc278	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-8b8a-5d3d-7f159ece3cf1	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3062 (class 0 OID 23560832)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5630-8b88-1709-5cf3e5ca8dc1	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5630-8b88-ff14-4d47d48c2a19	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5630-8b88-0d14-0230d2aa6c92	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5630-8b88-db8f-8d2a25f200c2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5630-8b88-7564-1d9ed5e751a2	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5630-8b88-b906-9ec40f5f11a7	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5630-8b88-07f4-e281d3ea7563	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5630-8b88-66bb-abe7246db8e4	Abonma-read	Abonma - branje	t
00030000-5630-8b88-a067-7f39b43039e1	Abonma-write	Abonma - spreminjanje	t
00030000-5630-8b88-168c-15b74c72b0f7	Alternacija-read	Alternacija - branje	t
00030000-5630-8b88-7f4d-2e5fa28596b5	Alternacija-write	Alternacija - spreminjanje	t
00030000-5630-8b88-6497-02881edf5973	Arhivalija-read	Arhivalija - branje	t
00030000-5630-8b88-8a28-3edcbda84ac8	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5630-8b88-9355-dfb9d6d28637	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5630-8b88-70bc-52b9d12565f4	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5630-8b88-2797-38aecd97a2ed	Besedilo-read	Besedilo - branje	t
00030000-5630-8b88-8b8e-8fadd17fb316	Besedilo-write	Besedilo - spreminjanje	t
00030000-5630-8b88-16d7-ff8f469e6c87	DogodekIzven-read	DogodekIzven - branje	t
00030000-5630-8b88-df4c-4ade56e9bd75	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5630-8b88-90c1-3d3f8b7474ca	Dogodek-read	Dogodek - branje	t
00030000-5630-8b88-f6b3-6e6d9a5e3acd	Dogodek-write	Dogodek - spreminjanje	t
00030000-5630-8b88-240a-61fee42d6af2	DrugiVir-read	DrugiVir - branje	t
00030000-5630-8b88-1981-aeeb716f8b61	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5630-8b88-734d-4fc29d122ce1	Drzava-read	Drzava - branje	t
00030000-5630-8b88-7828-8e11e469cc1b	Drzava-write	Drzava - spreminjanje	t
00030000-5630-8b88-e918-714ceb6451ac	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5630-8b88-774f-85d69f24305d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5630-8b88-8398-d8ce30ba3489	Funkcija-read	Funkcija - branje	t
00030000-5630-8b88-1ced-3cd761e66d41	Funkcija-write	Funkcija - spreminjanje	t
00030000-5630-8b88-b30c-f29ae8ec45b7	Gostovanje-read	Gostovanje - branje	t
00030000-5630-8b88-85b4-44e6672a23f7	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5630-8b88-c1b8-f56f3fd5ab13	Gostujoca-read	Gostujoca - branje	t
00030000-5630-8b88-9e08-769ef0f3de3f	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5630-8b88-00a6-c1074bbf0467	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5630-8b88-b71b-33e2b9fe8a62	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5630-8b88-ab54-0b897da15b7f	Kupec-read	Kupec - branje	t
00030000-5630-8b88-9904-7a8a4e395fa8	Kupec-write	Kupec - spreminjanje	t
00030000-5630-8b88-221e-2697543b806d	NacinPlacina-read	NacinPlacina - branje	t
00030000-5630-8b88-f8cf-1a78260e1717	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5630-8b88-a0d9-b84c9a7680eb	Option-read	Option - branje	t
00030000-5630-8b88-9f3a-4643efd97886	Option-write	Option - spreminjanje	t
00030000-5630-8b88-a6c0-ddb0133a6a7a	OptionValue-read	OptionValue - branje	t
00030000-5630-8b88-82cc-430ba1dac8cb	OptionValue-write	OptionValue - spreminjanje	t
00030000-5630-8b88-963d-bce0ca1b30b5	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5630-8b88-6d8c-61f2385fb7a2	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5630-8b88-f3b9-d248614f8c06	Oseba-read	Oseba - branje	t
00030000-5630-8b88-dae0-0b898af26a18	Oseba-write	Oseba - spreminjanje	t
00030000-5630-8b88-0806-9d04216cef06	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5630-8b88-67fe-7857d2931a5a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5630-8b88-9423-2d19243b6d6b	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5630-8b88-eb5f-31eeae975240	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5630-8b88-78b2-613ccedc86a7	Pogodba-read	Pogodba - branje	t
00030000-5630-8b88-3b76-5aa345e7f39d	Pogodba-write	Pogodba - spreminjanje	t
00030000-5630-8b88-ff1f-d3315320e459	Popa-read	Popa - branje	t
00030000-5630-8b88-5884-89c59700e343	Popa-write	Popa - spreminjanje	t
00030000-5630-8b88-b177-ee34acd1dcbd	Posta-read	Posta - branje	t
00030000-5630-8b88-077b-fda436b008f4	Posta-write	Posta - spreminjanje	t
00030000-5630-8b88-2c79-badf3bd23b3f	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5630-8b88-3c7b-b8e0ab944290	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5630-8b88-c597-b34ac54bfa4a	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5630-8b88-c746-156e8224e426	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5630-8b88-0586-8625e9912236	PostniNaslov-read	PostniNaslov - branje	t
00030000-5630-8b88-c29b-798357f844af	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5630-8b88-21e3-3ef6c3508c5f	Predstava-read	Predstava - branje	t
00030000-5630-8b88-b99a-40b35335be48	Predstava-write	Predstava - spreminjanje	t
00030000-5630-8b88-0cba-67df2cf23ea6	Praznik-read	Praznik - branje	t
00030000-5630-8b88-38f1-13beef5e3108	Praznik-write	Praznik - spreminjanje	t
00030000-5630-8b88-4c0e-0cfc011acb9d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5630-8b88-0919-deb58bdff917	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5630-8b88-daa1-782661c0d642	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5630-8b88-b88b-6abb1c81f4a5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5630-8b88-463a-7033125cdf47	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5630-8b88-dd70-616be64b9b6c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5630-8b88-5310-7ee2c3070c04	ProgramDela-read	ProgramDela - branje	t
00030000-5630-8b88-a300-0d6fb3f9b56b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5630-8b88-cb89-f99c7dc0c719	ProgramFestival-read	ProgramFestival - branje	t
00030000-5630-8b88-bd95-7c83a9c449a7	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5630-8b88-517f-86707a481e61	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5630-8b88-1d31-4b0fd022919b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5630-8b88-67ce-e8fa174b19ef	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5630-8b88-bcb7-6b90d19d1a15	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5630-8b88-ae62-e6c7fd730edb	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5630-8b88-c055-6045923880a1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5630-8b88-8f45-b480d90a622d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5630-8b88-aa28-9344cfa475dd	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5630-8b88-3976-acec9abc8638	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5630-8b88-5b6d-ba5d79bd6a69	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5630-8b88-bdf5-3716a72ad13f	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5630-8b88-772d-bb36af2f43c5	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5630-8b88-851a-566bf896aea3	ProgramRazno-read	ProgramRazno - branje	t
00030000-5630-8b88-888a-8f476143b9de	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5630-8b88-3399-3d857897ba87	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5630-8b88-5fd9-41a11bf35c26	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5630-8b88-bfc8-820429c5fe71	Prostor-read	Prostor - branje	t
00030000-5630-8b88-54a7-dc21738da309	Prostor-write	Prostor - spreminjanje	t
00030000-5630-8b88-0a7f-a51ff2fae9ca	Racun-read	Racun - branje	t
00030000-5630-8b88-5fbf-6f8c2cafb7f4	Racun-write	Racun - spreminjanje	t
00030000-5630-8b88-f3fa-530242ef0357	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5630-8b88-0a5a-4ac5d6769231	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5630-8b88-7098-4bd9707bb806	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5630-8b88-3579-05552a8414b5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5630-8b88-472f-b42bca9cd32a	Rekvizit-read	Rekvizit - branje	t
00030000-5630-8b88-d67b-f4cae0b174f3	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5630-8b88-049a-6e3f681be49a	Revizija-read	Revizija - branje	t
00030000-5630-8b88-2899-636f373f9355	Revizija-write	Revizija - spreminjanje	t
00030000-5630-8b88-7fc6-711dd153c023	Rezervacija-read	Rezervacija - branje	t
00030000-5630-8b88-a93d-20b4a250967c	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5630-8b88-f245-3bd3059b6367	SedezniRed-read	SedezniRed - branje	t
00030000-5630-8b88-c651-2624f096fdd9	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5630-8b88-260d-18068f7c1068	Sedez-read	Sedez - branje	t
00030000-5630-8b88-c268-cecc86c1d873	Sedez-write	Sedez - spreminjanje	t
00030000-5630-8b88-4121-f8ed4610a070	Sezona-read	Sezona - branje	t
00030000-5630-8b88-c7db-d513f8cab4dc	Sezona-write	Sezona - spreminjanje	t
00030000-5630-8b88-1d48-82bbcccb4e23	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5630-8b88-7fcc-aeb6367cb7df	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5630-8b88-dbfc-2f3a606be5c2	Stevilcenje-read	Stevilcenje - branje	t
00030000-5630-8b88-5d5f-ea6adda50cf2	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5630-8b88-14d6-7a4106a2117c	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5630-8b88-eb37-7855031e4864	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5630-8b88-7ffb-6585ee953368	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5630-8b88-2c2c-fd58bba11f87	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5630-8b88-37a6-afaece4e575b	Telefonska-read	Telefonska - branje	t
00030000-5630-8b88-0bee-8ced3d0e1058	Telefonska-write	Telefonska - spreminjanje	t
00030000-5630-8b88-dd23-c07a275e5070	TerminStoritve-read	TerminStoritve - branje	t
00030000-5630-8b88-7a1d-43801367fe5b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5630-8b88-843c-94445f060014	TipFunkcije-read	TipFunkcije - branje	t
00030000-5630-8b88-9f2d-cc7379e96333	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5630-8b88-742c-9764a12605d9	TipPopa-read	TipPopa - branje	t
00030000-5630-8b88-71b6-b71041f6fa95	TipPopa-write	TipPopa - spreminjanje	t
00030000-5630-8b88-82b5-0f50c9ef1abf	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5630-8b88-698b-e40dfd11dbe3	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5630-8b88-a24f-2dff15a5cc65	TipVaje-read	TipVaje - branje	t
00030000-5630-8b88-5c14-f6009c3d0ab0	TipVaje-write	TipVaje - spreminjanje	t
00030000-5630-8b88-bdde-0203b50635ff	Trr-read	Trr - branje	t
00030000-5630-8b88-fab1-f9ed3d501585	Trr-write	Trr - spreminjanje	t
00030000-5630-8b88-c86b-63042bbb7531	Uprizoritev-read	Uprizoritev - branje	t
00030000-5630-8b88-3b83-fd6b9fac4ff5	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5630-8b88-791d-02f42b6e98ea	Vaja-read	Vaja - branje	t
00030000-5630-8b88-229b-435ea374766b	Vaja-write	Vaja - spreminjanje	t
00030000-5630-8b88-0146-c079ab77bb36	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5630-8b88-c80e-6fc43acbd8ef	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5630-8b88-2a94-7b0ededa6810	VrstaStroska-read	VrstaStroska - branje	t
00030000-5630-8b88-5add-75e41719dae7	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5630-8b88-3ccf-edc16caeaaa0	Zaposlitev-read	Zaposlitev - branje	t
00030000-5630-8b88-5632-d304e5429843	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5630-8b88-25f4-9099f4f1dd1f	Zasedenost-read	Zasedenost - branje	t
00030000-5630-8b88-73c0-542bf0dcc3fe	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5630-8b88-4b1a-93f0619cf8bd	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5630-8b88-9a8d-f30b4cfcf696	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5630-8b88-7963-ae6d43a23b7e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5630-8b88-eed3-1bdb106bfc62	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5630-8b88-5f5b-1a316fb9d165	Job-read	Branje opravil - samo zase - branje	t
00030000-5630-8b88-ec79-9ab4070418c8	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5630-8b88-827e-c0e848e337b5	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5630-8b88-b6ca-6952e49248ea	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5630-8b88-7280-549768e48d66	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5630-8b88-090b-7b0777fede98	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5630-8b88-ce4f-9d1138ab0d2f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5630-8b88-470a-770d44980560	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5630-8b88-aa83-8d47f03f17c4	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5630-8b88-57aa-4039285e2704	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5630-8b88-c452-35ae8a00508f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5630-8b88-bb57-01410add541c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5630-8b88-f63b-98c3158985dd	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5630-8b88-dd2f-bd83739176bc	Datoteka-write	Datoteka - spreminjanje	t
00030000-5630-8b88-f96c-26ca4ed274a3	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3064 (class 0 OID 23560851)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5630-8b88-3f9e-ce7a74afc3d9	00030000-5630-8b88-ff14-4d47d48c2a19
00020000-5630-8b88-189f-2c4dc87300dc	00030000-5630-8b88-734d-4fc29d122ce1
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-66bb-abe7246db8e4
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-a067-7f39b43039e1
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-168c-15b74c72b0f7
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-7f4d-2e5fa28596b5
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-6497-02881edf5973
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-90c1-3d3f8b7474ca
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-db8f-8d2a25f200c2
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-f6b3-6e6d9a5e3acd
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-734d-4fc29d122ce1
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-7828-8e11e469cc1b
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-8398-d8ce30ba3489
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-1ced-3cd761e66d41
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-b30c-f29ae8ec45b7
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-85b4-44e6672a23f7
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-c1b8-f56f3fd5ab13
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-9e08-769ef0f3de3f
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-00a6-c1074bbf0467
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-b71b-33e2b9fe8a62
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-a0d9-b84c9a7680eb
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-a6c0-ddb0133a6a7a
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-f3b9-d248614f8c06
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-dae0-0b898af26a18
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-ff1f-d3315320e459
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-5884-89c59700e343
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-b177-ee34acd1dcbd
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-077b-fda436b008f4
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-0586-8625e9912236
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-c29b-798357f844af
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-21e3-3ef6c3508c5f
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-b99a-40b35335be48
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-463a-7033125cdf47
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-dd70-616be64b9b6c
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-bfc8-820429c5fe71
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-54a7-dc21738da309
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-7098-4bd9707bb806
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-3579-05552a8414b5
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-472f-b42bca9cd32a
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-d67b-f4cae0b174f3
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-4121-f8ed4610a070
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-c7db-d513f8cab4dc
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-843c-94445f060014
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-c86b-63042bbb7531
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-3b83-fd6b9fac4ff5
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-791d-02f42b6e98ea
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-229b-435ea374766b
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-25f4-9099f4f1dd1f
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-73c0-542bf0dcc3fe
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-4b1a-93f0619cf8bd
00020000-5630-8b88-5c44-884c755716e5	00030000-5630-8b88-7963-ae6d43a23b7e
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-66bb-abe7246db8e4
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-6497-02881edf5973
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-90c1-3d3f8b7474ca
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-734d-4fc29d122ce1
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-b30c-f29ae8ec45b7
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-c1b8-f56f3fd5ab13
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-00a6-c1074bbf0467
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-b71b-33e2b9fe8a62
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-a0d9-b84c9a7680eb
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-a6c0-ddb0133a6a7a
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-f3b9-d248614f8c06
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-dae0-0b898af26a18
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-ff1f-d3315320e459
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-b177-ee34acd1dcbd
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-0586-8625e9912236
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-c29b-798357f844af
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-21e3-3ef6c3508c5f
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-bfc8-820429c5fe71
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-7098-4bd9707bb806
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-472f-b42bca9cd32a
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-4121-f8ed4610a070
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-37a6-afaece4e575b
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-0bee-8ced3d0e1058
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-bdde-0203b50635ff
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-fab1-f9ed3d501585
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-3ccf-edc16caeaaa0
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-5632-d304e5429843
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-4b1a-93f0619cf8bd
00020000-5630-8b88-d972-0c297c3ca724	00030000-5630-8b88-7963-ae6d43a23b7e
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-66bb-abe7246db8e4
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-168c-15b74c72b0f7
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-6497-02881edf5973
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-8a28-3edcbda84ac8
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-2797-38aecd97a2ed
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-16d7-ff8f469e6c87
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-90c1-3d3f8b7474ca
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-734d-4fc29d122ce1
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-8398-d8ce30ba3489
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-b30c-f29ae8ec45b7
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-c1b8-f56f3fd5ab13
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-00a6-c1074bbf0467
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-a0d9-b84c9a7680eb
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-a6c0-ddb0133a6a7a
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-f3b9-d248614f8c06
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-ff1f-d3315320e459
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-b177-ee34acd1dcbd
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-21e3-3ef6c3508c5f
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-463a-7033125cdf47
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-bfc8-820429c5fe71
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-7098-4bd9707bb806
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-472f-b42bca9cd32a
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-4121-f8ed4610a070
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-843c-94445f060014
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-791d-02f42b6e98ea
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-25f4-9099f4f1dd1f
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-4b1a-93f0619cf8bd
00020000-5630-8b88-cfb4-16c991467f11	00030000-5630-8b88-7963-ae6d43a23b7e
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-66bb-abe7246db8e4
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-a067-7f39b43039e1
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-7f4d-2e5fa28596b5
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-6497-02881edf5973
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-90c1-3d3f8b7474ca
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-734d-4fc29d122ce1
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-b30c-f29ae8ec45b7
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-c1b8-f56f3fd5ab13
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-a0d9-b84c9a7680eb
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-a6c0-ddb0133a6a7a
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-ff1f-d3315320e459
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-b177-ee34acd1dcbd
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-21e3-3ef6c3508c5f
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-bfc8-820429c5fe71
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-7098-4bd9707bb806
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-472f-b42bca9cd32a
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-4121-f8ed4610a070
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-843c-94445f060014
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-4b1a-93f0619cf8bd
00020000-5630-8b88-c0c9-3fc400534e4a	00030000-5630-8b88-7963-ae6d43a23b7e
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-66bb-abe7246db8e4
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-6497-02881edf5973
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-90c1-3d3f8b7474ca
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-734d-4fc29d122ce1
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-b30c-f29ae8ec45b7
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-c1b8-f56f3fd5ab13
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-a0d9-b84c9a7680eb
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-a6c0-ddb0133a6a7a
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-ff1f-d3315320e459
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-b177-ee34acd1dcbd
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-21e3-3ef6c3508c5f
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-bfc8-820429c5fe71
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-7098-4bd9707bb806
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-472f-b42bca9cd32a
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-4121-f8ed4610a070
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-dd23-c07a275e5070
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-0d14-0230d2aa6c92
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-843c-94445f060014
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-4b1a-93f0619cf8bd
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	00030000-5630-8b88-7963-ae6d43a23b7e
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-1709-5cf3e5ca8dc1
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-ff14-4d47d48c2a19
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-66bb-abe7246db8e4
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-a067-7f39b43039e1
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-168c-15b74c72b0f7
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7f4d-2e5fa28596b5
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-6497-02881edf5973
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-8a28-3edcbda84ac8
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-9355-dfb9d6d28637
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-70bc-52b9d12565f4
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-2797-38aecd97a2ed
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-8b8e-8fadd17fb316
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-16d7-ff8f469e6c87
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-df4c-4ade56e9bd75
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-90c1-3d3f8b7474ca
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-db8f-8d2a25f200c2
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-f6b3-6e6d9a5e3acd
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-240a-61fee42d6af2
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-1981-aeeb716f8b61
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-734d-4fc29d122ce1
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7828-8e11e469cc1b
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-e918-714ceb6451ac
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-774f-85d69f24305d
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-8398-d8ce30ba3489
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-1ced-3cd761e66d41
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-b30c-f29ae8ec45b7
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-85b4-44e6672a23f7
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c1b8-f56f3fd5ab13
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-9e08-769ef0f3de3f
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-00a6-c1074bbf0467
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-b71b-33e2b9fe8a62
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-ab54-0b897da15b7f
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-9904-7a8a4e395fa8
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-221e-2697543b806d
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-f8cf-1a78260e1717
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-a0d9-b84c9a7680eb
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-a6c0-ddb0133a6a7a
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-82cc-430ba1dac8cb
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-9f3a-4643efd97886
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-963d-bce0ca1b30b5
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-6d8c-61f2385fb7a2
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-f3b9-d248614f8c06
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7564-1d9ed5e751a2
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-dae0-0b898af26a18
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0806-9d04216cef06
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-67fe-7857d2931a5a
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-9423-2d19243b6d6b
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-eb5f-31eeae975240
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-78b2-613ccedc86a7
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-3b76-5aa345e7f39d
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-ff1f-d3315320e459
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5884-89c59700e343
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-b177-ee34acd1dcbd
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-2c79-badf3bd23b3f
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-3c7b-b8e0ab944290
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c597-b34ac54bfa4a
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c746-156e8224e426
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-077b-fda436b008f4
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0586-8625e9912236
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c29b-798357f844af
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0cba-67df2cf23ea6
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-38f1-13beef5e3108
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-21e3-3ef6c3508c5f
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-b99a-40b35335be48
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-4c0e-0cfc011acb9d
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0919-deb58bdff917
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-daa1-782661c0d642
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-b88b-6abb1c81f4a5
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-463a-7033125cdf47
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-dd70-616be64b9b6c
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-b906-9ec40f5f11a7
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5310-7ee2c3070c04
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-07f4-e281d3ea7563
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-a300-0d6fb3f9b56b
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-cb89-f99c7dc0c719
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-bd95-7c83a9c449a7
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-517f-86707a481e61
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-1d31-4b0fd022919b
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-67ce-e8fa174b19ef
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-bcb7-6b90d19d1a15
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-ae62-e6c7fd730edb
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c055-6045923880a1
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-8f45-b480d90a622d
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-aa28-9344cfa475dd
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-3976-acec9abc8638
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5b6d-ba5d79bd6a69
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-bdf5-3716a72ad13f
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-772d-bb36af2f43c5
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-851a-566bf896aea3
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-888a-8f476143b9de
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-3399-3d857897ba87
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5fd9-41a11bf35c26
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-bfc8-820429c5fe71
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-54a7-dc21738da309
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0a7f-a51ff2fae9ca
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5fbf-6f8c2cafb7f4
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-f3fa-530242ef0357
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0a5a-4ac5d6769231
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7098-4bd9707bb806
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-3579-05552a8414b5
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-472f-b42bca9cd32a
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-d67b-f4cae0b174f3
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-049a-6e3f681be49a
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-2899-636f373f9355
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7fc6-711dd153c023
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-a93d-20b4a250967c
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-f245-3bd3059b6367
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c651-2624f096fdd9
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-260d-18068f7c1068
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c268-cecc86c1d873
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-4121-f8ed4610a070
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c7db-d513f8cab4dc
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-1d48-82bbcccb4e23
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7fcc-aeb6367cb7df
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-dbfc-2f3a606be5c2
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-14d6-7a4106a2117c
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-eb37-7855031e4864
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5d5f-ea6adda50cf2
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7ffb-6585ee953368
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-2c2c-fd58bba11f87
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-37a6-afaece4e575b
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0bee-8ced3d0e1058
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-dd23-c07a275e5070
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0d14-0230d2aa6c92
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7a1d-43801367fe5b
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-843c-94445f060014
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-9f2d-cc7379e96333
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-742c-9764a12605d9
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-71b6-b71041f6fa95
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-82b5-0f50c9ef1abf
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-698b-e40dfd11dbe3
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-a24f-2dff15a5cc65
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5c14-f6009c3d0ab0
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-bdde-0203b50635ff
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-fab1-f9ed3d501585
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c86b-63042bbb7531
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-3b83-fd6b9fac4ff5
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-791d-02f42b6e98ea
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-229b-435ea374766b
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-0146-c079ab77bb36
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-c80e-6fc43acbd8ef
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-2a94-7b0ededa6810
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5add-75e41719dae7
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-3ccf-edc16caeaaa0
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-5632-d304e5429843
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-25f4-9099f4f1dd1f
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-73c0-542bf0dcc3fe
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-4b1a-93f0619cf8bd
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-9a8d-f30b4cfcf696
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-7963-ae6d43a23b7e
00020000-5630-8b8a-2cd8-bcb92a9b88e4	00030000-5630-8b88-eed3-1bdb106bfc62
\.


--
-- TOC entry 3098 (class 0 OID 23561226)
-- Dependencies: 214
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 23561260)
-- Dependencies: 218
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 23561397)
-- Dependencies: 230
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5630-8b8a-ce78-e0afd28941c2	00090000-5630-8b8a-3a3d-1991bdcf3289	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5630-8b8a-6331-6843aad88b36	00090000-5630-8b8a-b864-9808542504e2	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5630-8b8a-bc38-12edc67dc9a9	00090000-5630-8b8a-fb7d-fdc6e0379c8d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5630-8b8a-78d5-7bbaf609d9f6	00090000-5630-8b8a-ada2-dd9b948e933c	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3070 (class 0 OID 23560924)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5630-8b8a-deaa-88607b60706c	\N	00040000-5630-8b88-8d31-b8f82df4bde8	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8a-20f3-c7057a8c4178	\N	00040000-5630-8b88-8d31-b8f82df4bde8	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5630-8b8a-6443-104dc205ba0e	\N	00040000-5630-8b88-8d31-b8f82df4bde8	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8a-22fb-604399d0ee21	\N	00040000-5630-8b88-8d31-b8f82df4bde8	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8a-1d6a-25cb3379a4d3	\N	00040000-5630-8b88-8d31-b8f82df4bde8	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8a-ce7b-f1493b81e5c0	\N	00040000-5630-8b88-c345-f2e32b035a12	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8a-5bf4-b1ed0c8c613c	\N	00040000-5630-8b88-77ff-ee0b72c57bf8	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8a-0e95-5301c719c7e6	\N	00040000-5630-8b88-3463-4e2a3dc3d9be	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8a-6722-8b89c46d90de	\N	00040000-5630-8b88-ea2d-08dfb9b173e8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-8b8c-1172-39c51ec87f7e	\N	00040000-5630-8b88-8d31-b8f82df4bde8	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3073 (class 0 OID 23560969)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5630-8b87-ad66-221336058973	8341	Adlešiči
00050000-5630-8b87-040f-74da0bd687be	5270	Ajdovščina
00050000-5630-8b87-aaa0-3a6b2d6a9987	6280	Ankaran/Ancarano
00050000-5630-8b87-c6ca-4da1a5dfdc56	9253	Apače
00050000-5630-8b87-2f58-d7c06a83457f	8253	Artiče
00050000-5630-8b87-098b-aeb60a8ec040	4275	Begunje na Gorenjskem
00050000-5630-8b87-8fb1-161eef5a8f99	1382	Begunje pri Cerknici
00050000-5630-8b87-e4f3-6c6eab2d1b94	9231	Beltinci
00050000-5630-8b87-fa35-2874fa0eb945	2234	Benedikt
00050000-5630-8b87-ce8c-bd6e20a1d2a0	2345	Bistrica ob Dravi
00050000-5630-8b87-e520-43ddb5e9a7ef	3256	Bistrica ob Sotli
00050000-5630-8b87-30e6-d3d11f62837b	8259	Bizeljsko
00050000-5630-8b87-7098-befbf16a46c8	1223	Blagovica
00050000-5630-8b87-2232-412dfc17df72	8283	Blanca
00050000-5630-8b87-b1e4-954ad7ec8f79	4260	Bled
00050000-5630-8b87-665d-65baf75522db	4273	Blejska Dobrava
00050000-5630-8b87-dfbe-2b392808db55	9265	Bodonci
00050000-5630-8b87-c588-080ec43285c5	9222	Bogojina
00050000-5630-8b87-9dcf-b92c47915de5	4263	Bohinjska Bela
00050000-5630-8b87-ed01-78f4968e530c	4264	Bohinjska Bistrica
00050000-5630-8b87-edda-78cfa2f72f60	4265	Bohinjsko jezero
00050000-5630-8b87-a585-9f4da18366cd	1353	Borovnica
00050000-5630-8b87-1f5b-0ee6a3006660	8294	Boštanj
00050000-5630-8b87-9d6e-b197d222eca7	5230	Bovec
00050000-5630-8b87-d4c5-0f4ee5095fa6	5295	Branik
00050000-5630-8b87-aab9-b3bc8c047a33	3314	Braslovče
00050000-5630-8b87-7f24-bfc0a36d4d09	5223	Breginj
00050000-5630-8b87-2421-b6e745068496	8280	Brestanica
00050000-5630-8b87-5096-e145a56da717	2354	Bresternica
00050000-5630-8b87-521b-ea4fc8b3c13e	4243	Brezje
00050000-5630-8b87-d414-1470e27eb9fc	1351	Brezovica pri Ljubljani
00050000-5630-8b87-4753-e733cec6448d	8250	Brežice
00050000-5630-8b87-7e85-699087dd5600	4210	Brnik - Aerodrom
00050000-5630-8b87-89a6-431b69a40581	8321	Brusnice
00050000-5630-8b87-345d-c386f85ad3ce	3255	Buče
00050000-5630-8b87-b780-57e710cf8d6c	8276	Bučka 
00050000-5630-8b87-8070-039d284acfb1	9261	Cankova
00050000-5630-8b87-2d30-dc389d20cf47	3000	Celje 
00050000-5630-8b87-0a27-de86586474bc	3001	Celje - poštni predali
00050000-5630-8b87-8ae7-24db9b1dcb83	4207	Cerklje na Gorenjskem
00050000-5630-8b87-62a9-a3a06f72ccc8	8263	Cerklje ob Krki
00050000-5630-8b88-9f24-4122bf3c89e0	1380	Cerknica
00050000-5630-8b88-6e14-c39ed01e9751	5282	Cerkno
00050000-5630-8b88-4afa-f7deaae425a6	2236	Cerkvenjak
00050000-5630-8b88-65c4-8a8c6cae5fc7	2215	Ceršak
00050000-5630-8b88-3981-f760a0a03b70	2326	Cirkovce
00050000-5630-8b88-9ba4-8625211b58c9	2282	Cirkulane
00050000-5630-8b88-7519-d4099ffa947e	5273	Col
00050000-5630-8b88-3611-4acf11441d39	8251	Čatež ob Savi
00050000-5630-8b88-2f88-b878b5ee0ad3	1413	Čemšenik
00050000-5630-8b88-9d1d-2269fd056cf1	5253	Čepovan
00050000-5630-8b88-ff22-117c443932d7	9232	Črenšovci
00050000-5630-8b88-2500-7e056a413eaf	2393	Črna na Koroškem
00050000-5630-8b88-b86c-62851cd3b15b	6275	Črni Kal
00050000-5630-8b88-6db7-300dee94ce49	5274	Črni Vrh nad Idrijo
00050000-5630-8b88-6192-aedaf6c64a27	5262	Črniče
00050000-5630-8b88-3721-1c0c9b960bab	8340	Črnomelj
00050000-5630-8b88-7781-a0d64b9e2f68	6271	Dekani
00050000-5630-8b88-7004-19e8e16147ec	5210	Deskle
00050000-5630-8b88-f401-e2999c2baabc	2253	Destrnik
00050000-5630-8b88-cb35-74c887adfa49	6215	Divača
00050000-5630-8b88-cc37-d32176da2477	1233	Dob
00050000-5630-8b88-551e-4df45ebc8129	3224	Dobje pri Planini
00050000-5630-8b88-8bdd-6c5eb7cd9dbb	8257	Dobova
00050000-5630-8b88-8418-cd15168b8d85	1423	Dobovec
00050000-5630-8b88-87b7-4f265f6d2a7c	5263	Dobravlje
00050000-5630-8b88-3ab5-e7d8f408bef2	3204	Dobrna
00050000-5630-8b88-3d71-5c65532fd5e1	8211	Dobrnič
00050000-5630-8b88-5409-1455e22b2221	1356	Dobrova
00050000-5630-8b88-8678-e5202b899d8c	9223	Dobrovnik/Dobronak 
00050000-5630-8b88-4b2e-d01fa1559026	5212	Dobrovo v Brdih
00050000-5630-8b88-0441-3217bcaccf65	1431	Dol pri Hrastniku
00050000-5630-8b88-2e4d-ad576a8d3346	1262	Dol pri Ljubljani
00050000-5630-8b88-030d-49c6a5474dd7	1273	Dole pri Litiji
00050000-5630-8b88-48df-838f331687ca	1331	Dolenja vas
00050000-5630-8b88-a7aa-5000b124716c	8350	Dolenjske Toplice
00050000-5630-8b88-7278-d20a4192fa24	1230	Domžale
00050000-5630-8b88-bbad-0d86da00db5d	2252	Dornava
00050000-5630-8b88-6e04-a1d9d5fce29a	5294	Dornberk
00050000-5630-8b88-31a8-059e0298c8db	1319	Draga
00050000-5630-8b88-60a4-a28edad5780e	8343	Dragatuš
00050000-5630-8b88-bccd-70b925880b7c	3222	Dramlje
00050000-5630-8b88-0e23-57e54ebb8445	2370	Dravograd
00050000-5630-8b88-4e59-f23399714a2a	4203	Duplje
00050000-5630-8b88-502a-90d178de8458	6221	Dutovlje
00050000-5630-8b88-978b-a690beacb9f4	8361	Dvor
00050000-5630-8b88-f40c-53701e64d63b	2343	Fala
00050000-5630-8b88-623e-a5c2001161ab	9208	Fokovci
00050000-5630-8b88-a38b-3a2641802e0e	2313	Fram
00050000-5630-8b88-ab27-0d0fcfb6d974	3213	Frankolovo
00050000-5630-8b88-4bfb-e2233b5631fe	1274	Gabrovka
00050000-5630-8b88-f973-be5f80e536e0	8254	Globoko
00050000-5630-8b88-3eaf-4a7277e92105	5275	Godovič
00050000-5630-8b88-f6a4-47387fe8a525	4204	Golnik
00050000-5630-8b88-a354-4f3f038153ee	3303	Gomilsko
00050000-5630-8b88-fdd1-b57e5c6ebf19	4224	Gorenja vas
00050000-5630-8b88-c76d-4b9656c856f2	3263	Gorica pri Slivnici
00050000-5630-8b88-046d-7647f43503a9	2272	Gorišnica
00050000-5630-8b88-9c42-4b4f718873b8	9250	Gornja Radgona
00050000-5630-8b88-ffce-e7b3aa0fd3fd	3342	Gornji Grad
00050000-5630-8b88-d5aa-5212605b764f	4282	Gozd Martuljek
00050000-5630-8b88-c4c5-931eb1e0ca22	6272	Gračišče
00050000-5630-8b88-bf39-c345f34aaa4d	9264	Grad
00050000-5630-8b88-cb0a-886788349d60	8332	Gradac
00050000-5630-8b88-6a52-2da346748455	1384	Grahovo
00050000-5630-8b88-d459-2946b201291e	5242	Grahovo ob Bači
00050000-5630-8b88-94f6-7816f6b43265	5251	Grgar
00050000-5630-8b88-7011-ea483c9e7446	3302	Griže
00050000-5630-8b88-9398-26969029d045	3231	Grobelno
00050000-5630-8b88-3163-8e643bd48816	1290	Grosuplje
00050000-5630-8b88-e9ec-c46db00c2c5e	2288	Hajdina
00050000-5630-8b88-e28a-7f501caf8468	8362	Hinje
00050000-5630-8b88-dac7-cf77c8aa635f	2311	Hoče
00050000-5630-8b88-d77e-1ac47c554311	9205	Hodoš/Hodos
00050000-5630-8b88-3bd3-f7721378d28e	1354	Horjul
00050000-5630-8b88-1a02-d3dff39d0338	1372	Hotedršica
00050000-5630-8b88-7708-27be970e6512	1430	Hrastnik
00050000-5630-8b88-d33d-f170ecfbb860	6225	Hruševje
00050000-5630-8b88-c50b-9ca6dc650741	4276	Hrušica
00050000-5630-8b88-cd1b-6c002200ae75	5280	Idrija
00050000-5630-8b88-8aee-ab8837eee440	1292	Ig
00050000-5630-8b88-6291-c763e20c0bcb	6250	Ilirska Bistrica
00050000-5630-8b88-0d16-0a1da156fb1e	6251	Ilirska Bistrica-Trnovo
00050000-5630-8b88-dfb7-c92fcefb336e	1295	Ivančna Gorica
00050000-5630-8b88-b63a-8e6ffc4a25d7	2259	Ivanjkovci
00050000-5630-8b88-9d89-fd6b6bb52ecb	1411	Izlake
00050000-5630-8b88-1452-29cf3b0e6057	6310	Izola/Isola
00050000-5630-8b88-3308-26e24d35e3b6	2222	Jakobski Dol
00050000-5630-8b88-2b07-7c26753eb87c	2221	Jarenina
00050000-5630-8b88-3ef3-dbd9d90eea99	6254	Jelšane
00050000-5630-8b88-5bc7-8dff00bbf30e	4270	Jesenice
00050000-5630-8b88-4083-f3f961e3069b	8261	Jesenice na Dolenjskem
00050000-5630-8b88-7c99-194d82a1f5a9	3273	Jurklošter
00050000-5630-8b88-a119-0c70a2506f83	2223	Jurovski Dol
00050000-5630-8b88-bfdc-3397320c26a5	2256	Juršinci
00050000-5630-8b88-c60b-44fd65feffcd	5214	Kal nad Kanalom
00050000-5630-8b88-237d-0fadc747ec5d	3233	Kalobje
00050000-5630-8b88-ac04-264170f7b025	4246	Kamna Gorica
00050000-5630-8b88-3493-f7e7dc97ade2	2351	Kamnica
00050000-5630-8b88-1813-6c663d7701b0	1241	Kamnik
00050000-5630-8b88-289c-16e100af13ae	5213	Kanal
00050000-5630-8b88-0f8b-1cf448f4bb65	8258	Kapele
00050000-5630-8b88-40d9-6dd3a70b3c18	2362	Kapla
00050000-5630-8b88-a3d7-8d303ef8ad43	2325	Kidričevo
00050000-5630-8b88-089e-a9ac654cdb4f	1412	Kisovec
00050000-5630-8b88-e9df-27c3e35ab49c	6253	Knežak
00050000-5630-8b88-b552-a216a8c8c6ae	5222	Kobarid
00050000-5630-8b88-8e3c-f5b14d4593f1	9227	Kobilje
00050000-5630-8b88-63d8-e2e837bfdeb8	1330	Kočevje
00050000-5630-8b88-dcd9-97327f3c416f	1338	Kočevska Reka
00050000-5630-8b88-e710-53dc19edb248	2276	Kog
00050000-5630-8b88-4d88-eddd9c622c76	5211	Kojsko
00050000-5630-8b88-57da-bf9e082700b4	6223	Komen
00050000-5630-8b88-105a-d687dd3fd1d7	1218	Komenda
00050000-5630-8b88-212c-280c3f178896	6000	Koper/Capodistria 
00050000-5630-8b88-3c3b-0bc6de5b2046	6001	Koper/Capodistria - poštni predali
00050000-5630-8b88-3634-1c047e195688	8282	Koprivnica
00050000-5630-8b88-67eb-c92d018424fc	5296	Kostanjevica na Krasu
00050000-5630-8b88-7dfc-e9814d763d7b	8311	Kostanjevica na Krki
00050000-5630-8b88-3d5b-fe9867307b9d	1336	Kostel
00050000-5630-8b88-3201-76c4d7a05636	6256	Košana
00050000-5630-8b88-8914-04538518a04b	2394	Kotlje
00050000-5630-8b88-09ab-9c4717c5cc3b	6240	Kozina
00050000-5630-8b88-7821-d98313d041e0	3260	Kozje
00050000-5630-8b88-40de-01a443069ccc	4000	Kranj 
00050000-5630-8b88-bd56-7423af22df34	4001	Kranj - poštni predali
00050000-5630-8b88-83a0-6eb983c04da7	4280	Kranjska Gora
00050000-5630-8b88-8008-b557a3a595c4	1281	Kresnice
00050000-5630-8b88-adcf-3fb25250e422	4294	Križe
00050000-5630-8b88-0123-c4bc38474789	9206	Križevci
00050000-5630-8b88-bf8e-183aea3fee41	9242	Križevci pri Ljutomeru
00050000-5630-8b88-c673-3d7790dc919e	1301	Krka
00050000-5630-8b88-fc54-1cfd2ff76d9c	8296	Krmelj
00050000-5630-8b88-cd3a-bf0d8c6c3093	4245	Kropa
00050000-5630-8b88-4ce2-68d98badefc1	8262	Krška vas
00050000-5630-8b88-1cde-be5cf5bad3b9	8270	Krško
00050000-5630-8b88-ad80-f3922a22c962	9263	Kuzma
00050000-5630-8b88-f060-53abde6956af	2318	Laporje
00050000-5630-8b88-3433-bbaf4afe33dd	3270	Laško
00050000-5630-8b88-fc88-ca098335e0d3	1219	Laze v Tuhinju
00050000-5630-8b88-6877-50be8c5b1e6b	2230	Lenart v Slovenskih goricah
00050000-5630-8b88-26a4-725f5825fa2f	9220	Lendava/Lendva
00050000-5630-8b88-41f5-673a26b719e7	4248	Lesce
00050000-5630-8b88-127f-c36d9b38bf4e	3261	Lesično
00050000-5630-8b88-3a54-ab7654d4a609	8273	Leskovec pri Krškem
00050000-5630-8b88-7a2e-beb8dfe69845	2372	Libeliče
00050000-5630-8b88-a69f-772c7fcaa94c	2341	Limbuš
00050000-5630-8b88-1db1-4354d3f7acf6	1270	Litija
00050000-5630-8b88-4a9c-fb5105224224	3202	Ljubečna
00050000-5630-8b88-f2a2-b1f025188521	1000	Ljubljana 
00050000-5630-8b88-eae9-6e9f26b9c57a	1001	Ljubljana - poštni predali
00050000-5630-8b88-a763-fe05b0f10422	1231	Ljubljana - Črnuče
00050000-5630-8b88-4339-78f1ca280829	1261	Ljubljana - Dobrunje
00050000-5630-8b88-6b30-64c2077bcae2	1260	Ljubljana - Polje
00050000-5630-8b88-3f55-86c620f24cd5	1210	Ljubljana - Šentvid
00050000-5630-8b88-f936-9b2838e8a280	1211	Ljubljana - Šmartno
00050000-5630-8b88-3cf0-77e89fe18565	3333	Ljubno ob Savinji
00050000-5630-8b88-8fea-31cdcb6396c2	9240	Ljutomer
00050000-5630-8b88-35f6-1486fa87c809	3215	Loče
00050000-5630-8b88-b532-cd6c97cf8948	5231	Log pod Mangartom
00050000-5630-8b88-2077-7d7a8d9a74c4	1358	Log pri Brezovici
00050000-5630-8b88-277d-15d52a720f38	1370	Logatec
00050000-5630-8b88-da51-8585092f5348	1371	Logatec
00050000-5630-8b88-77c5-f10719a3b0d2	1434	Loka pri Zidanem Mostu
00050000-5630-8b88-fe99-2e762e647419	3223	Loka pri Žusmu
00050000-5630-8b88-f07c-63d761e9d6ef	6219	Lokev
00050000-5630-8b88-186a-d09dbb962cee	1318	Loški Potok
00050000-5630-8b88-aac1-88eb61298970	2324	Lovrenc na Dravskem polju
00050000-5630-8b88-5d56-112df5323974	2344	Lovrenc na Pohorju
00050000-5630-8b88-dcfb-97a9a4929871	3334	Luče
00050000-5630-8b88-85ec-59c17d21d1e2	1225	Lukovica
00050000-5630-8b88-1d09-1f4fb19d4a90	9202	Mačkovci
00050000-5630-8b88-8f25-9330eb50ef41	2322	Majšperk
00050000-5630-8b88-8bf7-a6f33b9708bd	2321	Makole
00050000-5630-8b88-b8ad-d78533e42879	9243	Mala Nedelja
00050000-5630-8b88-a417-1181dd83288e	2229	Malečnik
00050000-5630-8b88-6f41-3d6c136cbac7	6273	Marezige
00050000-5630-8b88-26fe-270be8f5aeb3	2000	Maribor 
00050000-5630-8b88-8e7d-c1fe4aba5ffa	2001	Maribor - poštni predali
00050000-5630-8b88-96e7-f4022ab265ac	2206	Marjeta na Dravskem polju
00050000-5630-8b88-752e-e207df2e1b48	2281	Markovci
00050000-5630-8b88-9aac-209b56cdf124	9221	Martjanci
00050000-5630-8b88-b92a-8bfef8c46318	6242	Materija
00050000-5630-8b88-c8f4-fd06da6c96c2	4211	Mavčiče
00050000-5630-8b88-44b5-b3d5f483a837	1215	Medvode
00050000-5630-8b88-5af8-7d16303ccbb9	1234	Mengeš
00050000-5630-8b88-8229-530c04e06c9e	8330	Metlika
00050000-5630-8b88-1334-52e13a8390d0	2392	Mežica
00050000-5630-8b88-82e8-f9bac45f67a9	2204	Miklavž na Dravskem polju
00050000-5630-8b88-32d2-e569a76f5378	2275	Miklavž pri Ormožu
00050000-5630-8b88-6bc4-b6786b00599f	5291	Miren
00050000-5630-8b88-afcc-c70fc009b3bd	8233	Mirna
00050000-5630-8b88-155a-ce0a9f63e112	8216	Mirna Peč
00050000-5630-8b88-79d0-21521f06779c	2382	Mislinja
00050000-5630-8b88-ccd2-16bb85238f1c	4281	Mojstrana
00050000-5630-8b88-9eab-9199bd9d48dd	8230	Mokronog
00050000-5630-8b88-ddfc-7268abbe82b9	1251	Moravče
00050000-5630-8b88-67aa-4497695d31b6	9226	Moravske Toplice
00050000-5630-8b88-dfee-4ba65e22065e	5216	Most na Soči
00050000-5630-8b88-968d-0920d51ea522	1221	Motnik
00050000-5630-8b88-91ce-ff974ab7b481	3330	Mozirje
00050000-5630-8b88-f6d2-67d1fbb39e98	9000	Murska Sobota 
00050000-5630-8b88-de2b-92f5d01b2c93	9001	Murska Sobota - poštni predali
00050000-5630-8b88-5b05-9ee83034e3b5	2366	Muta
00050000-5630-8b88-c5ca-7d9d08fdecda	4202	Naklo
00050000-5630-8b88-6842-bd9f820a0b87	3331	Nazarje
00050000-5630-8b88-089c-0118fc8e26fa	1357	Notranje Gorice
00050000-5630-8b88-b072-fe21139a6429	3203	Nova Cerkev
00050000-5630-8b88-28f9-082658b0fbf4	5000	Nova Gorica 
00050000-5630-8b88-9185-0738efa59808	5001	Nova Gorica - poštni predali
00050000-5630-8b88-e640-20eca3747e86	1385	Nova vas
00050000-5630-8b88-b990-fcab4183fc9f	8000	Novo mesto
00050000-5630-8b88-4948-3b9dd500c40a	8001	Novo mesto - poštni predali
00050000-5630-8b88-8f22-aa6640aac717	6243	Obrov
00050000-5630-8b88-639f-1834b359505a	9233	Odranci
00050000-5630-8b88-f06b-42031bf4885c	2317	Oplotnica
00050000-5630-8b88-90ab-1ada9021be76	2312	Orehova vas
00050000-5630-8b88-8d51-dc349df25f0f	2270	Ormož
00050000-5630-8b88-cb32-d8acd356e5bd	1316	Ortnek
00050000-5630-8b88-886f-55cd9820754b	1337	Osilnica
00050000-5630-8b88-129f-85defc2d4d8f	8222	Otočec
00050000-5630-8b88-4799-e2807c9eac47	2361	Ožbalt
00050000-5630-8b88-29ab-9e6b1dfe47d1	2231	Pernica
00050000-5630-8b88-e8f6-827bd9a4d90b	2211	Pesnica pri Mariboru
00050000-5630-8b88-44ee-0c25c855e617	9203	Petrovci
00050000-5630-8b88-3f0c-0f09092eda7a	3301	Petrovče
00050000-5630-8b88-f107-2b8bf4e5b9cd	6330	Piran/Pirano
00050000-5630-8b88-e931-d0dc6d86b34d	8255	Pišece
00050000-5630-8b88-1d32-909d567a52eb	6257	Pivka
00050000-5630-8b88-91ed-56edf903a406	6232	Planina
00050000-5630-8b88-1516-d8b92b93b0c4	3225	Planina pri Sevnici
00050000-5630-8b88-84d1-2f81953ef612	6276	Pobegi
00050000-5630-8b88-46b6-85bd23c2f254	8312	Podbočje
00050000-5630-8b88-b253-23753c8d91e3	5243	Podbrdo
00050000-5630-8b88-a1aa-1529eaf17055	3254	Podčetrtek
00050000-5630-8b88-3651-d995030efd97	2273	Podgorci
00050000-5630-8b88-3e6b-dbb60de18400	6216	Podgorje
00050000-5630-8b88-cc7c-9b0c96964553	2381	Podgorje pri Slovenj Gradcu
00050000-5630-8b88-7923-0dc12ac7b15c	6244	Podgrad
00050000-5630-8b88-679d-0ac0c1317315	1414	Podkum
00050000-5630-8b88-e176-0cb2ce0ad8a7	2286	Podlehnik
00050000-5630-8b88-e3c2-c21ad2ded939	5272	Podnanos
00050000-5630-8b88-fea7-a0bdd4484c02	4244	Podnart
00050000-5630-8b88-fe7a-3fe47b8ebaef	3241	Podplat
00050000-5630-8b88-b562-eaae18a60b7f	3257	Podsreda
00050000-5630-8b88-09e4-3f558208fcc0	2363	Podvelka
00050000-5630-8b88-6860-aaa795bf1eb2	2208	Pohorje
00050000-5630-8b88-b58f-b21ac777940b	2257	Polenšak
00050000-5630-8b88-fb17-6e8981a7e5c2	1355	Polhov Gradec
00050000-5630-8b88-9bc4-530d3e0213be	4223	Poljane nad Škofjo Loko
00050000-5630-8b88-04af-48e3911c05b1	2319	Poljčane
00050000-5630-8b88-5c80-4962c1758578	1272	Polšnik
00050000-5630-8b88-0b6e-aa9f1a9a7740	3313	Polzela
00050000-5630-8b88-7957-a3036486ed5a	3232	Ponikva
00050000-5630-8b88-d8a4-76276fda5cd4	6320	Portorož/Portorose
00050000-5630-8b88-2573-d5213e557c7e	6230	Postojna
00050000-5630-8b88-f01a-657b7c9f9c04	2331	Pragersko
00050000-5630-8b88-7298-7d06ee44fded	3312	Prebold
00050000-5630-8b88-8f87-6367d8844935	4205	Preddvor
00050000-5630-8b88-840c-175dc2bc9f7c	6255	Prem
00050000-5630-8b88-2e4e-db98e3634418	1352	Preserje
00050000-5630-8b88-4b38-006990b0274f	6258	Prestranek
00050000-5630-8b88-32f1-0d6a5f7f608c	2391	Prevalje
00050000-5630-8b88-80aa-b6472f0321ad	3262	Prevorje
00050000-5630-8b88-cf23-8332bf715bce	1276	Primskovo 
00050000-5630-8b88-6719-49f54c6935d8	3253	Pristava pri Mestinju
00050000-5630-8b88-9eec-8730a6929691	9207	Prosenjakovci/Partosfalva
00050000-5630-8b88-952a-36f1757789f6	5297	Prvačina
00050000-5630-8b88-09f3-b8f38fdc8ee2	2250	Ptuj
00050000-5630-8b88-ab9c-a90d845e8557	2323	Ptujska Gora
00050000-5630-8b88-8004-4b179915120c	9201	Puconci
00050000-5630-8b88-42ef-e24b30a103fa	2327	Rače
00050000-5630-8b88-61c5-0352b799f787	1433	Radeče
00050000-5630-8b88-1a9b-39c6a6228862	9252	Radenci
00050000-5630-8b88-a903-5b17d96ec310	2360	Radlje ob Dravi
00050000-5630-8b88-a6bf-8fd2c7fa5bf2	1235	Radomlje
00050000-5630-8b88-5320-c5051db9535b	4240	Radovljica
00050000-5630-8b88-8dc6-b53b29f41509	8274	Raka
00050000-5630-8b88-afb1-08a816062c38	1381	Rakek
00050000-5630-8b88-0179-05e4dc9767a9	4283	Rateče - Planica
00050000-5630-8b88-a61c-fe301fca6cb0	2390	Ravne na Koroškem
00050000-5630-8b88-6b0a-a68d575cfbd1	9246	Razkrižje
00050000-5630-8b88-f62f-0ea2f82ea485	3332	Rečica ob Savinji
00050000-5630-8b88-c513-474a73d37a9f	5292	Renče
00050000-5630-8b88-df3d-69f728f51310	1310	Ribnica
00050000-5630-8b88-5106-71e3a40a3b43	2364	Ribnica na Pohorju
00050000-5630-8b88-d469-f885937fac50	3272	Rimske Toplice
00050000-5630-8b88-2fa0-9da4d9687293	1314	Rob
00050000-5630-8b88-a057-bf5f115323a7	5215	Ročinj
00050000-5630-8b88-e4db-96732c297e1d	3250	Rogaška Slatina
00050000-5630-8b88-fe1d-9c461d1a5594	9262	Rogašovci
00050000-5630-8b88-94a1-edbb0eacdcd4	3252	Rogatec
00050000-5630-8b88-8e21-817030bd8065	1373	Rovte
00050000-5630-8b88-0115-c77e4cfd0b1d	2342	Ruše
00050000-5630-8b88-5b36-dbb21e82bbb4	1282	Sava
00050000-5630-8b88-110d-04740b249d1c	6333	Sečovlje/Sicciole
00050000-5630-8b88-c742-2b2b671ab28b	4227	Selca
00050000-5630-8b88-382c-fc69b06efb91	2352	Selnica ob Dravi
00050000-5630-8b88-e2b9-69f7721e24b6	8333	Semič
00050000-5630-8b88-ab2d-35ed83276847	8281	Senovo
00050000-5630-8b88-4c69-bbc6bd2109eb	6224	Senožeče
00050000-5630-8b88-73b4-e90d0af6c91a	8290	Sevnica
00050000-5630-8b88-43c5-8c0a4bed0bae	6210	Sežana
00050000-5630-8b88-c52b-f1bcd58b3d5f	2214	Sladki Vrh
00050000-5630-8b88-a9c9-806ef25837a3	5283	Slap ob Idrijci
00050000-5630-8b88-a438-b2b3d9db0638	2380	Slovenj Gradec
00050000-5630-8b88-f108-bec1bf82892c	2310	Slovenska Bistrica
00050000-5630-8b88-3a4b-20d97a94deea	3210	Slovenske Konjice
00050000-5630-8b88-1de4-f919f0c0565d	1216	Smlednik
00050000-5630-8b88-3728-72a9a4e474eb	5232	Soča
00050000-5630-8b88-576b-37e1300abc58	1317	Sodražica
00050000-5630-8b88-7ff8-bbc65cb34cd4	3335	Solčava
00050000-5630-8b88-f819-28064d33979e	5250	Solkan
00050000-5630-8b88-b3e2-f481403cbe70	4229	Sorica
00050000-5630-8b88-d106-63ebc3dfa1c3	4225	Sovodenj
00050000-5630-8b88-bae3-629010002a26	5281	Spodnja Idrija
00050000-5630-8b88-a895-bd1699f88fdd	2241	Spodnji Duplek
00050000-5630-8b88-4c7d-808356494486	9245	Spodnji Ivanjci
00050000-5630-8b88-3a66-4b929abf31c1	2277	Središče ob Dravi
00050000-5630-8b88-ddba-66d4b4970c20	4267	Srednja vas v Bohinju
00050000-5630-8b88-f0b4-af6d0851b8bd	8256	Sromlje 
00050000-5630-8b88-5bfc-88de3783bf13	5224	Srpenica
00050000-5630-8b88-8f01-0ead8177ff0b	1242	Stahovica
00050000-5630-8b88-aca6-0448a31ed71e	1332	Stara Cerkev
00050000-5630-8b88-56af-0b9eb9a4bbf2	8342	Stari trg ob Kolpi
00050000-5630-8b88-9301-b0dc24e6deee	1386	Stari trg pri Ložu
00050000-5630-8b88-c986-abb41248abb9	2205	Starše
00050000-5630-8b88-c713-fd62f20a3874	2289	Stoperce
00050000-5630-8b88-b771-988728c8507c	8322	Stopiče
00050000-5630-8b88-1220-077bb733c380	3206	Stranice
00050000-5630-8b88-b6bd-46a34b0cec8e	8351	Straža
00050000-5630-8b88-1600-3480d2a26ef9	1313	Struge
00050000-5630-8b88-ec81-ded5b67e4d15	8293	Studenec
00050000-5630-8b88-dc58-6c00419f2b88	8331	Suhor
00050000-5630-8b88-29ab-7499c01c02bc	2233	Sv. Ana v Slovenskih goricah
00050000-5630-8b88-733d-3ee960f2a651	2235	Sv. Trojica v Slovenskih goricah
00050000-5630-8b88-c488-5115eabf271c	2353	Sveti Duh na Ostrem Vrhu
00050000-5630-8b88-709f-4ed732f01c31	9244	Sveti Jurij ob Ščavnici
00050000-5630-8b88-994e-c5003642dd65	3264	Sveti Štefan
00050000-5630-8b88-15d4-8dd84586d881	2258	Sveti Tomaž
00050000-5630-8b88-5f66-8089893d818a	9204	Šalovci
00050000-5630-8b88-13e9-f4a6d6c4aac7	5261	Šempas
00050000-5630-8b88-c6eb-30aed44455da	5290	Šempeter pri Gorici
00050000-5630-8b88-ba90-47c11d716ca1	3311	Šempeter v Savinjski dolini
00050000-5630-8b88-759f-505176fca2b4	4208	Šenčur
00050000-5630-8b88-b1cf-bd28031de632	2212	Šentilj v Slovenskih goricah
00050000-5630-8b88-9a2e-f4f6bff50015	8297	Šentjanž
00050000-5630-8b88-fad2-a82856f0093e	2373	Šentjanž pri Dravogradu
00050000-5630-8b88-8c1b-706275804a71	8310	Šentjernej
00050000-5630-8b88-6f3b-9b56c8d686bb	3230	Šentjur
00050000-5630-8b88-c333-f801e6f51a40	3271	Šentrupert
00050000-5630-8b88-1277-bee392c04527	8232	Šentrupert
00050000-5630-8b88-a980-7fbe8020bad0	1296	Šentvid pri Stični
00050000-5630-8b88-d853-39ed54d0bd34	8275	Škocjan
00050000-5630-8b88-dce1-4a62e1000ff9	6281	Škofije
00050000-5630-8b88-7d42-48d3867968e5	4220	Škofja Loka
00050000-5630-8b88-2e27-d86339f5dd5f	3211	Škofja vas
00050000-5630-8b88-744e-1286b4f5dc2f	1291	Škofljica
00050000-5630-8b88-5fec-fa72d3c2f8c8	6274	Šmarje
00050000-5630-8b88-b81d-2bbe4007dbbb	1293	Šmarje - Sap
00050000-5630-8b88-a948-34584a4c682f	3240	Šmarje pri Jelšah
00050000-5630-8b88-035d-4dfeeb930db7	8220	Šmarješke Toplice
00050000-5630-8b88-ddce-cd4d2f544ceb	2315	Šmartno na Pohorju
00050000-5630-8b88-a61f-6e9a8c2d4353	3341	Šmartno ob Dreti
00050000-5630-8b88-d893-f7c680eec432	3327	Šmartno ob Paki
00050000-5630-8b88-cd35-ddb9099d5e5b	1275	Šmartno pri Litiji
00050000-5630-8b88-7d37-9dba9aef66f9	2383	Šmartno pri Slovenj Gradcu
00050000-5630-8b88-f06a-eaa62ea1d664	3201	Šmartno v Rožni dolini
00050000-5630-8b88-7089-01ef8decd619	3325	Šoštanj
00050000-5630-8b88-543f-e87a065c182b	6222	Štanjel
00050000-5630-8b88-761e-af34e56f4b10	3220	Štore
00050000-5630-8b88-72ca-a35382f8c280	3304	Tabor
00050000-5630-8b88-c0c3-59ea57e7967f	3221	Teharje
00050000-5630-8b88-9142-4ef6281fa890	9251	Tišina
00050000-5630-8b88-4ba1-6426fdfb10cf	5220	Tolmin
00050000-5630-8b88-4aaa-860c85c9c815	3326	Topolšica
00050000-5630-8b88-138f-9a7bb50033f0	2371	Trbonje
00050000-5630-8b88-a0ac-053022538c9a	1420	Trbovlje
00050000-5630-8b88-4050-77286bdce23c	8231	Trebelno 
00050000-5630-8b88-cf3d-b8da61b68fd5	8210	Trebnje
00050000-5630-8b88-4a03-4754eda52b0f	5252	Trnovo pri Gorici
00050000-5630-8b88-c362-f14faae5314a	2254	Trnovska vas
00050000-5630-8b88-6094-d547207f6046	1222	Trojane
00050000-5630-8b88-cba5-a479ab169991	1236	Trzin
00050000-5630-8b88-483e-45d00d9cd931	4290	Tržič
00050000-5630-8b88-4ecc-f1302fe9e744	8295	Tržišče
00050000-5630-8b88-f9ee-cd3b80c3a9ab	1311	Turjak
00050000-5630-8b88-c016-e8c052acd033	9224	Turnišče
00050000-5630-8b88-b23a-49f5aea5b8e0	8323	Uršna sela
00050000-5630-8b88-a52a-efe7028540ee	1252	Vače
00050000-5630-8b88-a703-e432e9aaeb7b	3320	Velenje 
00050000-5630-8b88-6a29-9d2396a54915	3322	Velenje - poštni predali
00050000-5630-8b88-c7d4-0aedd8fe1eda	8212	Velika Loka
00050000-5630-8b88-3fa1-076f0610bb9d	2274	Velika Nedelja
00050000-5630-8b88-4c11-3987d57e6121	9225	Velika Polana
00050000-5630-8b88-98c7-0861bcc7a888	1315	Velike Lašče
00050000-5630-8b88-b782-f55587dc365f	8213	Veliki Gaber
00050000-5630-8b88-595f-6279bcfce8e6	9241	Veržej
00050000-5630-8b88-4d6a-8ddbe213df63	1312	Videm - Dobrepolje
00050000-5630-8b88-c4ea-bf12a678c3c4	2284	Videm pri Ptuju
00050000-5630-8b88-6855-4e4f57ee9170	8344	Vinica
00050000-5630-8b88-2e23-45c5d6b857c0	5271	Vipava
00050000-5630-8b88-f849-9d8601d3a445	4212	Visoko
00050000-5630-8b88-1440-068fc1dafb0f	1294	Višnja Gora
00050000-5630-8b88-8fbf-89554bedbf32	3205	Vitanje
00050000-5630-8b88-33a6-47347d726c5a	2255	Vitomarci
00050000-5630-8b88-faf5-bbc2dfc90319	1217	Vodice
00050000-5630-8b88-f474-afaa6804a02f	3212	Vojnik\t
00050000-5630-8b88-9bc2-8ce351bf9c18	5293	Volčja Draga
00050000-5630-8b88-a6cb-c8c292d51c17	2232	Voličina
00050000-5630-8b88-4e2e-e4fba01ea4ae	3305	Vransko
00050000-5630-8b88-f943-350c0df54246	6217	Vremski Britof
00050000-5630-8b88-8a63-4e8017f1199e	1360	Vrhnika
00050000-5630-8b88-63cd-a1e34c8d5187	2365	Vuhred
00050000-5630-8b88-ded4-3e7092650415	2367	Vuzenica
00050000-5630-8b88-c94d-279e2ab4104d	8292	Zabukovje 
00050000-5630-8b88-c22c-43f94ac44180	1410	Zagorje ob Savi
00050000-5630-8b88-2fe7-c7d5a1cf51fa	1303	Zagradec
00050000-5630-8b88-c760-b3a8f6909ddc	2283	Zavrč
00050000-5630-8b88-9adf-7ca0ed8b697e	8272	Zdole 
00050000-5630-8b88-1ddc-3b2fef0a3866	4201	Zgornja Besnica
00050000-5630-8b88-a73b-62582ffef146	2242	Zgornja Korena
00050000-5630-8b88-d46f-7ffb9106c3fe	2201	Zgornja Kungota
00050000-5630-8b88-04a8-9136860bfda0	2316	Zgornja Ložnica
00050000-5630-8b88-e405-be1b8a781827	2314	Zgornja Polskava
00050000-5630-8b88-f585-5bb05295993f	2213	Zgornja Velka
00050000-5630-8b88-6711-a9a6f1328e33	4247	Zgornje Gorje
00050000-5630-8b88-0c27-b298a6ff7b50	4206	Zgornje Jezersko
00050000-5630-8b88-4cd6-eab96323d71e	2285	Zgornji Leskovec
00050000-5630-8b88-2509-778f2e0c161e	1432	Zidani Most
00050000-5630-8b88-c34e-757ab21c16f5	3214	Zreče
00050000-5630-8b88-5c22-fe87c10a6bca	4209	Žabnica
00050000-5630-8b88-c8bf-28d57c7b55f7	3310	Žalec
00050000-5630-8b88-3d4a-15edafe74a04	4228	Železniki
00050000-5630-8b88-aa38-464b833b8422	2287	Žetale
00050000-5630-8b88-1163-da55a94fb33c	4226	Žiri
00050000-5630-8b88-9e2f-45768edf4030	4274	Žirovnica
00050000-5630-8b88-0afd-ce09638a9690	8360	Žužemberk
\.


--
-- TOC entry 3121 (class 0 OID 23561608)
-- Dependencies: 237
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 23561200)
-- Dependencies: 210
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23560954)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5630-8b8a-52f0-325f935a78c1	00080000-5630-8b8a-deaa-88607b60706c	\N	00040000-5630-8b88-8d31-b8f82df4bde8	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5630-8b8a-b76a-4630c6a90a55	00080000-5630-8b8a-deaa-88607b60706c	\N	00040000-5630-8b88-8d31-b8f82df4bde8	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5630-8b8a-9d83-993f3188a4ec	00080000-5630-8b8a-20f3-c7057a8c4178	\N	00040000-5630-8b88-8d31-b8f82df4bde8	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3084 (class 0 OID 23561098)
-- Dependencies: 200
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5630-8b88-913c-2c3522e7ade3	novo leto	1	1	\N	t
00430000-5630-8b88-c305-23db3973e6db	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5630-8b88-6138-884a46642240	dan upora proti okupatorju	27	4	\N	t
00430000-5630-8b88-efc7-9df811ab7d36	praznik dela	1	5	\N	t
00430000-5630-8b88-e22b-39fa77d0f148	praznik dela	2	5	\N	t
00430000-5630-8b88-36a7-d1458ebf780c	dan Primoža Trubarja	8	6	\N	f
00430000-5630-8b88-f740-64555e217186	dan državnosti	25	6	\N	t
00430000-5630-8b88-5e99-7b58c28013e3	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5630-8b88-841d-0989d6ca2788	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5630-8b88-ec2c-a94e05b43766	dan suverenosti	25	10	\N	f
00430000-5630-8b88-18f8-b557fb6b7aec	dan spomina na mrtve	1	11	\N	t
00430000-5630-8b88-d30f-ac2fd4435c64	dan Rudolfa Maistra	23	11	\N	f
00430000-5630-8b88-c024-dab9d29f9823	božič	25	12	\N	t
00430000-5630-8b88-e2aa-91c25e17dd6b	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5630-8b88-f7a5-8cd86e127ad6	Marijino vnebovzetje	15	8	\N	t
00430000-5630-8b88-3657-0c06ed04dbd3	dan reformacije	31	10	\N	t
00430000-5630-8b88-6c29-f89a093d62ef	velikonočna nedelja	27	3	2016	t
00430000-5630-8b88-654a-40b6399f4faf	velikonočna nedelja	16	4	2017	t
00430000-5630-8b88-8866-855ab80c7102	velikonočna nedelja	1	4	2018	t
00430000-5630-8b88-3874-5f5137da211d	velikonočna nedelja	21	4	2019	t
00430000-5630-8b88-eaf2-604eeb808e89	velikonočna nedelja	12	4	2020	t
00430000-5630-8b88-a44a-35e45dd0f1d3	velikonočna nedelja	4	4	2021	t
00430000-5630-8b88-2583-739cedb726d9	velikonočna nedelja	17	4	2022	t
00430000-5630-8b88-bcf5-d5b532159b4e	velikonočna nedelja	9	4	2023	t
00430000-5630-8b88-b270-b003fd87fbcc	velikonočna nedelja	31	3	2024	t
00430000-5630-8b88-990b-e398277569ab	velikonočna nedelja	20	4	2025	t
00430000-5630-8b88-d5b6-40e9dd05a330	velikonočna nedelja	5	4	2026	t
00430000-5630-8b88-b885-3f41c10ec2ad	velikonočna nedelja	28	3	2027	t
00430000-5630-8b88-ade6-3ccf8dc9035e	velikonočna nedelja	16	4	2028	t
00430000-5630-8b88-3f81-12da0d18d41a	velikonočna nedelja	1	4	2029	t
00430000-5630-8b88-1916-c48fd49d1ca8	velikonočna nedelja	21	4	2030	t
00430000-5630-8b88-4ae2-30ff8bdd8c3c	velikonočni ponedeljek	28	3	2016	t
00430000-5630-8b88-1184-aca60899c58c	velikonočni ponedeljek	17	4	2017	t
00430000-5630-8b88-8c5f-4ae4fef74fbc	velikonočni ponedeljek	2	4	2018	t
00430000-5630-8b88-7273-ba40b6b22628	velikonočni ponedeljek	22	4	2019	t
00430000-5630-8b88-3dce-1a95627fd72d	velikonočni ponedeljek	13	4	2020	t
00430000-5630-8b88-ac95-0c28b9695ccd	velikonočni ponedeljek	5	4	2021	t
00430000-5630-8b88-3c36-fdf423186473	velikonočni ponedeljek	18	4	2022	t
00430000-5630-8b88-e91f-7a5f0c1c564b	velikonočni ponedeljek	10	4	2023	t
00430000-5630-8b88-7563-91e716648e01	velikonočni ponedeljek	1	4	2024	t
00430000-5630-8b88-ced9-eb8b5ba6110b	velikonočni ponedeljek	21	4	2025	t
00430000-5630-8b88-32cf-e04b56a27a9f	velikonočni ponedeljek	6	4	2026	t
00430000-5630-8b88-bad9-b5ca69e4eba8	velikonočni ponedeljek	29	3	2027	t
00430000-5630-8b88-95c1-94bb29c00df8	velikonočni ponedeljek	17	4	2028	t
00430000-5630-8b88-a9b0-e2461ee7425b	velikonočni ponedeljek	2	4	2029	t
00430000-5630-8b88-21f1-6df6600fd400	velikonočni ponedeljek	22	4	2030	t
00430000-5630-8b88-decc-de754f963cbd	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5630-8b88-a387-84574866b698	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5630-8b88-fc2f-1e9e37882be4	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5630-8b88-c895-6a3fa3ef0933	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5630-8b88-8a6f-c9386a754c42	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5630-8b88-6cf0-dc8ab25cb9ee	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5630-8b88-3b62-3f923225eeca	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5630-8b88-0438-a31d61909b68	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5630-8b88-f552-08a411f7584d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5630-8b88-2437-a0c0014d5785	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5630-8b88-f280-4ce01094d9db	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5630-8b88-1517-31fd6a894a9b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5630-8b88-4722-f6ce7966af78	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5630-8b88-0925-ddeaf25e18e7	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5630-8b88-2059-8661081155a6	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3080 (class 0 OID 23561058)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 23561070)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 23561212)
-- Dependencies: 212
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23561622)
-- Dependencies: 238
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23561632)
-- Dependencies: 239
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5630-8b8a-d88d-8b196b56efc6	00080000-5630-8b8a-6443-104dc205ba0e	0987	AK
00190000-5630-8b8a-e844-990be86a1f87	00080000-5630-8b8a-20f3-c7057a8c4178	0989	AK
00190000-5630-8b8a-30db-f9b6451a9ffb	00080000-5630-8b8a-22fb-604399d0ee21	0986	AK
00190000-5630-8b8a-3181-3b6fd7f941bf	00080000-5630-8b8a-ce7b-f1493b81e5c0	0984	AK
00190000-5630-8b8a-59a6-ef8d5398b086	00080000-5630-8b8a-5bf4-b1ed0c8c613c	0983	AK
00190000-5630-8b8a-9384-d6c8b980bec1	00080000-5630-8b8a-0e95-5301c719c7e6	0982	AK
00190000-5630-8b8c-95a7-b01a8b0899f6	00080000-5630-8b8c-1172-39c51ec87f7e	1001	AK
\.


--
-- TOC entry 3120 (class 0 OID 23561547)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5630-8b8a-be06-bac93c51a4b1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3124 (class 0 OID 23561640)
-- Dependencies: 240
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23561241)
-- Dependencies: 216
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5630-8b8a-8916-12bf18248e46	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5630-8b8a-b523-70500bea8018	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5630-8b8a-a38a-05d03689c344	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5630-8b8a-17cd-a11b311c1880	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5630-8b8a-e672-db4a917dc2e6	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5630-8b8a-2573-70cefee08606	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5630-8b8a-1a57-a3a6093f97f5	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3092 (class 0 OID 23561185)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 23561175)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 23561386)
-- Dependencies: 229
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23561316)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23561032)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 23560803)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5630-8b8c-1172-39c51ec87f7e	00010000-5630-8b89-e00a-107388c8a653	2015-10-28 09:47:08	INS	a:0:{}
2	App\\Entity\\Option	00000000-5630-8b8c-2b2e-486149be4cc4	00010000-5630-8b89-e00a-107388c8a653	2015-10-28 09:47:08	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5630-8b8c-95a7-b01a8b0899f6	00010000-5630-8b89-e00a-107388c8a653	2015-10-28 09:47:08	INS	a:0:{}
\.


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3101 (class 0 OID 23561254)
-- Dependencies: 217
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 23560841)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5630-8b88-3f9e-ce7a74afc3d9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5630-8b88-189f-2c4dc87300dc	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5630-8b88-7368-7584167a8da0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5630-8b88-efd2-6d3d1f9322e4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5630-8b88-5c44-884c755716e5	planer	Planer dogodkov v koledarju	t
00020000-5630-8b88-d972-0c297c3ca724	kadrovska	Kadrovska služba	t
00020000-5630-8b88-cfb4-16c991467f11	arhivar	Ažuriranje arhivalij	t
00020000-5630-8b88-c0c9-3fc400534e4a	igralec	Igralec	t
00020000-5630-8b88-bdb2-1dd3d7bfd6a0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5630-8b8a-2cd8-bcb92a9b88e4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3061 (class 0 OID 23560825)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5630-8b89-a938-83bcd37758bc	00020000-5630-8b88-7368-7584167a8da0
00010000-5630-8b89-e00a-107388c8a653	00020000-5630-8b88-7368-7584167a8da0
00010000-5630-8b8a-6c0f-fc5ebaba54c7	00020000-5630-8b8a-2cd8-bcb92a9b88e4
\.


--
-- TOC entry 3103 (class 0 OID 23561268)
-- Dependencies: 219
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23561206)
-- Dependencies: 211
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23561152)
-- Dependencies: 205
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5630-8b8a-15c2-f2076d899f88	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5630-8b8a-3589-22c54e456b12	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5630-8b8a-bbb4-f581fab86a30	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3057 (class 0 OID 23560790)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5630-8b88-f5a7-61dd0970d088	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5630-8b88-cf48-2dde0e9a2172	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5630-8b88-cab9-2e097585a5e9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5630-8b88-f594-3d7758c3e509	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5630-8b88-6ee0-ab72ed539977	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3056 (class 0 OID 23560782)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5630-8b88-e369-c89bc02f3ac6	00230000-5630-8b88-f594-3d7758c3e509	popa
00240000-5630-8b88-2931-61e196447df4	00230000-5630-8b88-f594-3d7758c3e509	oseba
00240000-5630-8b88-1a95-6591d139f709	00230000-5630-8b88-f594-3d7758c3e509	tippopa
00240000-5630-8b88-54ed-1b05df00f3ea	00230000-5630-8b88-f594-3d7758c3e509	organizacijskaenota
00240000-5630-8b88-00b3-eaeece7f86c3	00230000-5630-8b88-f594-3d7758c3e509	sezona
00240000-5630-8b88-6a14-36851905accb	00230000-5630-8b88-f594-3d7758c3e509	tipvaje
00240000-5630-8b88-5be2-f0c39922abf6	00230000-5630-8b88-cf48-2dde0e9a2172	prostor
00240000-5630-8b88-14c6-1d2ecd77ea02	00230000-5630-8b88-f594-3d7758c3e509	besedilo
00240000-5630-8b88-fdfe-85f0add27135	00230000-5630-8b88-f594-3d7758c3e509	uprizoritev
00240000-5630-8b88-0b82-08003a127fb1	00230000-5630-8b88-f594-3d7758c3e509	funkcija
00240000-5630-8b88-4342-e4f12ad05f7a	00230000-5630-8b88-f594-3d7758c3e509	tipfunkcije
00240000-5630-8b88-1919-eac3920a7aa9	00230000-5630-8b88-f594-3d7758c3e509	alternacija
00240000-5630-8b88-7f3c-3475660af61c	00230000-5630-8b88-f5a7-61dd0970d088	pogodba
00240000-5630-8b88-a840-513d9bb3165f	00230000-5630-8b88-f594-3d7758c3e509	zaposlitev
00240000-5630-8b88-d02c-783f1dde4f2a	00230000-5630-8b88-f594-3d7758c3e509	zvrstuprizoritve
00240000-5630-8b88-627f-a005bba62a0b	00230000-5630-8b88-f5a7-61dd0970d088	programdela
00240000-5630-8b88-3ff4-d6d63f6f1a36	00230000-5630-8b88-f594-3d7758c3e509	zapis
\.


--
-- TOC entry 3055 (class 0 OID 23560777)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
44d156bd-59c8-490a-af5f-24bb5e236b6a	00240000-5630-8b88-e369-c89bc02f3ac6	0	1001
\.


--
-- TOC entry 3109 (class 0 OID 23561333)
-- Dependencies: 225
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5630-8b8a-5a00-a97fd23492b6	000e0000-5630-8b8a-e272-8ea31d834e9f	00080000-5630-8b8a-deaa-88607b60706c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5630-8b88-58c2-4d4c0d2f5b17
00270000-5630-8b8a-d647-56cf8adf59b4	000e0000-5630-8b8a-e272-8ea31d834e9f	00080000-5630-8b8a-deaa-88607b60706c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5630-8b88-58c2-4d4c0d2f5b17
\.


--
-- TOC entry 3069 (class 0 OID 23560916)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23561162)
-- Dependencies: 206
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5630-8b8a-0eea-219ae3d65ce9	00180000-5630-8b8a-8683-7d2ebf91ff44	000c0000-5630-8b8a-5869-a810171c7a7a	00090000-5630-8b8a-3a3d-1991bdcf3289	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-8b8a-8f14-eb494ec0941b	00180000-5630-8b8a-8683-7d2ebf91ff44	000c0000-5630-8b8a-940d-35036ae0adf8	00090000-5630-8b8a-ada2-dd9b948e933c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-8b8a-47a9-e87806cc3ea9	00180000-5630-8b8a-8683-7d2ebf91ff44	000c0000-5630-8b8a-5127-912c837326ca	00090000-5630-8b8a-b8fe-b2669efb4e5c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-8b8a-8d52-e697e4e9aa33	00180000-5630-8b8a-8683-7d2ebf91ff44	000c0000-5630-8b8a-a853-ca272dc72b74	00090000-5630-8b8a-9461-1c839fe21c1e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-8b8a-b4b5-6587cb8d8ea6	00180000-5630-8b8a-8683-7d2ebf91ff44	000c0000-5630-8b8a-c1fa-748cd3d040f7	00090000-5630-8b8a-ba68-17994b226ac6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-8b8a-305c-453c7ccbf63d	00180000-5630-8b8a-0f7d-e6c0b910dbc9	\N	00090000-5630-8b8a-ba68-17994b226ac6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5630-8b8a-aecd-112d83f439e8	00180000-5630-8b8a-0f7d-e6c0b910dbc9	\N	00090000-5630-8b8a-ada2-dd9b948e933c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3112 (class 0 OID 23561374)
-- Dependencies: 228
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5630-8b88-98d9-bcca9e142e9d	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5630-8b88-b2ae-be950b3dd479	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5630-8b88-f980-03ca4336e0e8	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5630-8b88-04eb-50daefcf7a12	04	Režija	Režija	Režija	umetnik	30
000f0000-5630-8b88-bb97-1029eeaa37bd	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5630-8b88-01d1-2d33b214a6f9	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5630-8b88-f732-cccc80f56f37	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5630-8b88-38e0-31dc44c5f42b	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5630-8b88-8ed8-5eb957e562a8	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5630-8b88-45d1-0dfc039d83f9	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5630-8b88-72e8-b25230af7c16	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5630-8b88-8403-71ec9297c9cd	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5630-8b88-e333-e1d32fd32968	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5630-8b88-ae89-42e994b1effe	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5630-8b88-d317-06bf63e816b6	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5630-8b88-6d19-ce56021f512b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5630-8b88-eca9-ed30aec4da66	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5630-8b88-9d2b-337ce42b6f20	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3066 (class 0 OID 23560867)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5630-8b8a-ed39-e37b589c04d0	0001	šola	osnovna ali srednja šola
00400000-5630-8b8a-3d29-6b80dbda3db3	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5630-8b8a-72f9-a4bfbd09c2c4	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3125 (class 0 OID 23561651)
-- Dependencies: 241
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5630-8b88-9052-1dba0605c381	01	Velika predstava	f	1.00	1.00
002b0000-5630-8b88-e753-20987049f492	02	Mala predstava	f	0.50	0.50
002b0000-5630-8b88-7ab2-9210157e5dab	03	Mala koprodukcija	t	0.40	1.00
002b0000-5630-8b88-68c1-ec7546264095	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5630-8b88-24c4-838cf2886069	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3088 (class 0 OID 23561142)
-- Dependencies: 204
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5630-8b88-bb62-3fd36f319d3c	0001	prva vaja	prva vaja
00420000-5630-8b88-ee3d-ac3ec004cd44	0002	tehnična vaja	tehnična vaja
00420000-5630-8b88-7c54-69a27095af6c	0003	lučna vaja	lučna vaja
00420000-5630-8b88-e9c7-a6363b58ce1c	0004	kostumska vaja	kostumska vaja
00420000-5630-8b88-dd59-c09747ab734e	0005	foto vaja	foto vaja
00420000-5630-8b88-4d1d-b25a10247357	0006	1. glavna vaja	1. glavna vaja
00420000-5630-8b88-eb22-a7329374c043	0007	2. glavna vaja	2. glavna vaja
00420000-5630-8b88-5e32-9896074e98db	0008	1. generalka	1. generalka
00420000-5630-8b88-f2f4-8e229d3c089a	0009	2. generalka	2. generalka
00420000-5630-8b88-7444-1410a9317771	0010	odprta generalka	odprta generalka
00420000-5630-8b88-59fb-03e8e358261b	0011	obnovitvena vaja	obnovitvena vaja
00420000-5630-8b88-645f-f42a9e10cff3	0012	pevska vaja	pevska vaja
00420000-5630-8b88-8e78-e953653bfd05	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5630-8b88-c5c9-8e7805d57beb	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3075 (class 0 OID 23560989)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 23560812)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5630-8b89-e00a-107388c8a653	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROr/Y8qI0K797jCwu8iVTJ/bnj1W32PAW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-7114-fd640146df06	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-3196-524e6ebb8abe	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-f7cd-e460abbbdce9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-67d2-9016b2e07bdd	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-e49a-a635974f1c51	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-827b-182eef0087da	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-59e9-a11508be3c5f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-24d5-1de243e8045b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-1275-2c89d94d70b7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5630-8b8a-6c0f-fc5ebaba54c7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5630-8b89-a938-83bcd37758bc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3116 (class 0 OID 23561424)
-- Dependencies: 232
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5630-8b8a-bd6e-b1cc79a1b31c	00160000-5630-8b8a-c320-682557478837	\N	00140000-5630-8b88-ba49-4ffad7665e88	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5630-8b8a-e672-db4a917dc2e6
000e0000-5630-8b8a-e272-8ea31d834e9f	00160000-5630-8b8a-b05a-78c2883d445c	\N	00140000-5630-8b88-a783-ef87db66ec08	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5630-8b8a-2573-70cefee08606
000e0000-5630-8b8a-f8bd-d2df11ee4979	\N	\N	00140000-5630-8b88-a783-ef87db66ec08	00190000-5630-8b8a-d88d-8b196b56efc6	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5630-8b8a-e672-db4a917dc2e6
000e0000-5630-8b8a-7ec5-8a2dcdb17ddf	\N	\N	00140000-5630-8b88-a783-ef87db66ec08	00190000-5630-8b8a-d88d-8b196b56efc6	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5630-8b8a-e672-db4a917dc2e6
000e0000-5630-8b8a-4480-63b77998291e	\N	\N	00140000-5630-8b88-a783-ef87db66ec08	00190000-5630-8b8a-d88d-8b196b56efc6	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5630-8b8a-8916-12bf18248e46
000e0000-5630-8b8a-09be-2b330e51d6a2	\N	\N	00140000-5630-8b88-a783-ef87db66ec08	00190000-5630-8b8a-d88d-8b196b56efc6	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5630-8b8a-8916-12bf18248e46
\.


--
-- TOC entry 3083 (class 0 OID 23561088)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5630-8b8a-9713-003bfd0243f4	\N	000e0000-5630-8b8a-e272-8ea31d834e9f	1	
00200000-5630-8b8a-441c-80fd180a6fb3	\N	000e0000-5630-8b8a-e272-8ea31d834e9f	2	
00200000-5630-8b8a-c592-60a368a16a36	\N	000e0000-5630-8b8a-e272-8ea31d834e9f	3	
00200000-5630-8b8a-6e3e-24b4c31f23cb	\N	000e0000-5630-8b8a-e272-8ea31d834e9f	4	
00200000-5630-8b8a-78d2-94a240afe7ae	\N	000e0000-5630-8b8a-e272-8ea31d834e9f	5	
\.


--
-- TOC entry 3099 (class 0 OID 23561233)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 23561347)
-- Dependencies: 226
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5630-8b88-ff04-7df4f5d18831	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5630-8b88-5979-db0eb487b4f8	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5630-8b88-8042-c129adbd7116	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5630-8b88-26a0-00ddfb05d65a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5630-8b88-db8d-a1636570a1e5	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5630-8b88-c033-a25d62c06194	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5630-8b88-af83-bb3ec360b79f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5630-8b88-f2b5-bac028682dca	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5630-8b88-58c2-4d4c0d2f5b17	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5630-8b88-8e65-a06eeadb4663	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5630-8b88-2a1d-32e1cd480058	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5630-8b88-2a05-92e66254d0df	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5630-8b88-6f9a-51925d56f9cc	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5630-8b88-bd5c-ccb2765122db	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5630-8b88-6aba-bc54fcefb45c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5630-8b88-0c0c-11e595a21463	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5630-8b88-b722-3a46a3829b04	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5630-8b88-d40f-d92c2a083221	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5630-8b88-f542-0f3ba617522f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5630-8b88-3842-eba136cb72a0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5630-8b88-7008-e30fe4d7973b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5630-8b88-7bec-6438dd7a414f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5630-8b88-24b0-824b5ffdad84	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5630-8b88-c777-cbe4876a84be	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5630-8b88-d00a-96c073b69407	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5630-8b88-8e3c-eda2f2de6f55	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5630-8b88-53b8-b69ddb2d1b57	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5630-8b88-075e-77b95b705cb5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3128 (class 0 OID 23561698)
-- Dependencies: 244
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 23561670)
-- Dependencies: 243
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 23561710)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23561305)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5630-8b8a-6eee-d05087e61309	00090000-5630-8b8a-ada2-dd9b948e933c	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-8b8a-44c3-3ae228271ceb	00090000-5630-8b8a-b8fe-b2669efb4e5c	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-8b8a-ba0d-7dab18ad759a	00090000-5630-8b8a-2805-96d9e3a6650d	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-8b8a-a3c3-4c506d481eac	00090000-5630-8b8a-87eb-2d06914bd2b1	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-8b8a-d6c1-438b1b68496d	00090000-5630-8b8a-a501-f0f9961cd633	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-8b8a-8c32-c417221666b7	00090000-5630-8b8a-cf00-ac41a6af0bc4	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3086 (class 0 OID 23561131)
-- Dependencies: 202
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23561414)
-- Dependencies: 231
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5630-8b88-ba49-4ffad7665e88	01	Drama	drama (SURS 01)
00140000-5630-8b88-1b3c-e05d865b3c4b	02	Opera	opera (SURS 02)
00140000-5630-8b88-7afb-cf1676937210	03	Balet	balet (SURS 03)
00140000-5630-8b88-5a11-900d52e9e08c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5630-8b88-e4b4-896944297c2d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5630-8b88-a783-ef87db66ec08	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5630-8b88-3d3b-6635528a3aac	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3105 (class 0 OID 23561295)
-- Dependencies: 221
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2554 (class 2606 OID 23560866)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 23561473)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 23561463)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 23561330)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 23561372)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 23561750)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 23561120)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23561141)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 23561668)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 23561015)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 23561541)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23561291)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 23561086)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 23561053)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 23561029)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23561198)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23561727)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 23561734)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2832 (class 2606 OID 23561758)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 23558677)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2689 (class 2606 OID 23561225)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 23560987)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 23560885)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23560949)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23560912)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 23560855)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2545 (class 2606 OID 23560840)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 23561231)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 23561267)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 23561409)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23560940)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 23560975)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23561620)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23561204)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 23560965)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 23561105)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 23561074)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2621 (class 2606 OID 23561066)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 23561216)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 23561629)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 23561637)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 23561607)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 23561649)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 23561249)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23561189)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23561180)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 23561396)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 23561323)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23561041)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23560811)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 23561258)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 23560829)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2547 (class 2606 OID 23560849)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 23561276)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23561211)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23561160)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23560799)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23560787)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23560781)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 23561343)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 23560921)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23561171)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 23561383)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23560874)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 23561661)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 23561149)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 23561000)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 23560824)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23561442)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 23561095)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 23561239)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 23561355)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 23561708)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23561692)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 23561716)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23561313)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 23561135)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 23561422)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 23561303)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 1259 OID 23561129)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2638 (class 1259 OID 23561130)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2639 (class 1259 OID 23561128)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2640 (class 1259 OID 23561127)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2641 (class 1259 OID 23561126)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2732 (class 1259 OID 23561344)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2733 (class 1259 OID 23561345)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2734 (class 1259 OID 23561346)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 23561729)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2819 (class 1259 OID 23561728)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2572 (class 1259 OID 23560942)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2573 (class 1259 OID 23560943)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23561232)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2805 (class 1259 OID 23561696)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2806 (class 1259 OID 23561695)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2807 (class 1259 OID 23561697)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2808 (class 1259 OID 23561694)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2809 (class 1259 OID 23561693)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2684 (class 1259 OID 23561218)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2685 (class 1259 OID 23561217)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 23561096)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2630 (class 1259 OID 23561097)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2714 (class 1259 OID 23561292)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2715 (class 1259 OID 23561294)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2716 (class 1259 OID 23561293)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2604 (class 1259 OID 23561031)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 23561030)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2796 (class 1259 OID 23561650)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2748 (class 1259 OID 23561411)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 23561412)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2750 (class 1259 OID 23561413)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2815 (class 1259 OID 23561717)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2757 (class 1259 OID 23561447)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2758 (class 1259 OID 23561444)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2759 (class 1259 OID 23561448)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2760 (class 1259 OID 23561446)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2761 (class 1259 OID 23561445)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2594 (class 1259 OID 23561002)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 23561001)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 23560915)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2702 (class 1259 OID 23561259)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2549 (class 1259 OID 23560856)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2550 (class 1259 OID 23560857)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2707 (class 1259 OID 23561279)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2708 (class 1259 OID 23561278)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2709 (class 1259 OID 23561277)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2577 (class 1259 OID 23560952)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2578 (class 1259 OID 23560951)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2579 (class 1259 OID 23560953)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2617 (class 1259 OID 23561069)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2618 (class 1259 OID 23561067)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 23561068)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2529 (class 1259 OID 23560789)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2664 (class 1259 OID 23561184)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2665 (class 1259 OID 23561182)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2666 (class 1259 OID 23561181)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2667 (class 1259 OID 23561183)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2540 (class 1259 OID 23560830)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2541 (class 1259 OID 23560831)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2693 (class 1259 OID 23561240)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2828 (class 1259 OID 23561751)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2730 (class 1259 OID 23561332)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 23561331)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2829 (class 1259 OID 23561759)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2830 (class 1259 OID 23561760)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2679 (class 1259 OID 23561205)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2724 (class 1259 OID 23561324)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2725 (class 1259 OID 23561325)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 23561546)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2779 (class 1259 OID 23561545)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2780 (class 1259 OID 23561542)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2781 (class 1259 OID 23561543)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2782 (class 1259 OID 23561544)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 23560967)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 23560966)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2585 (class 1259 OID 23560968)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2696 (class 1259 OID 23561253)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2697 (class 1259 OID 23561252)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2788 (class 1259 OID 23561630)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2789 (class 1259 OID 23561631)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2771 (class 1259 OID 23561477)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2772 (class 1259 OID 23561478)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2773 (class 1259 OID 23561475)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2774 (class 1259 OID 23561476)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2720 (class 1259 OID 23561314)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2721 (class 1259 OID 23561315)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2670 (class 1259 OID 23561193)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2671 (class 1259 OID 23561192)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2672 (class 1259 OID 23561190)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2673 (class 1259 OID 23561191)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2767 (class 1259 OID 23561465)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2768 (class 1259 OID 23561464)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2608 (class 1259 OID 23561042)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2611 (class 1259 OID 23561056)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2612 (class 1259 OID 23561055)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2613 (class 1259 OID 23561054)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 23561057)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2628 (class 1259 OID 23561087)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2622 (class 1259 OID 23561075)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2623 (class 1259 OID 23561076)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2785 (class 1259 OID 23561621)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2804 (class 1259 OID 23561669)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 23561735)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2823 (class 1259 OID 23561736)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2559 (class 1259 OID 23560887)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2560 (class 1259 OID 23560886)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2568 (class 1259 OID 23560922)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2569 (class 1259 OID 23560923)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2647 (class 1259 OID 23561136)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 23561174)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 23561173)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2661 (class 1259 OID 23561172)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 23561122)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2643 (class 1259 OID 23561123)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2644 (class 1259 OID 23561121)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2645 (class 1259 OID 23561125)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2646 (class 1259 OID 23561124)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2576 (class 1259 OID 23560941)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 23560875)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2558 (class 1259 OID 23560876)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 23561016)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 23561018)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2602 (class 1259 OID 23561017)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2603 (class 1259 OID 23561019)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2678 (class 1259 OID 23561199)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2753 (class 1259 OID 23561410)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2762 (class 1259 OID 23561443)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 23561384)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 23561385)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2566 (class 1259 OID 23560913)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 23560914)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2717 (class 1259 OID 23561304)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 23560800)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 23560988)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2582 (class 1259 OID 23560950)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 23560788)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2801 (class 1259 OID 23561662)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 23561251)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2701 (class 1259 OID 23561250)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 23561150)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 23561151)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2775 (class 1259 OID 23561474)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 23560976)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 23561423)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 23561709)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2794 (class 1259 OID 23561638)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 23561639)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 23561373)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2658 (class 1259 OID 23561161)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 23560850)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2871 (class 2606 OID 23561931)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2870 (class 2606 OID 23561936)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2866 (class 2606 OID 23561956)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2872 (class 2606 OID 23561926)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2868 (class 2606 OID 23561946)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2867 (class 2606 OID 23561951)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2869 (class 2606 OID 23561941)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2908 (class 2606 OID 23562126)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2907 (class 2606 OID 23562131)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2906 (class 2606 OID 23562136)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2940 (class 2606 OID 23562301)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2941 (class 2606 OID 23562296)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 23561816)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2844 (class 2606 OID 23561821)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2889 (class 2606 OID 23562041)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 23562281)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2936 (class 2606 OID 23562276)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2934 (class 2606 OID 23562286)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 23562271)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2938 (class 2606 OID 23562266)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2887 (class 2606 OID 23562036)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2888 (class 2606 OID 23562031)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2865 (class 2606 OID 23561916)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2864 (class 2606 OID 23561921)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 23562081)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 23562091)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2898 (class 2606 OID 23562086)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2854 (class 2606 OID 23561871)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2855 (class 2606 OID 23561866)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 23562021)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2932 (class 2606 OID 23562256)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2911 (class 2606 OID 23562141)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 23562146)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 23562151)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2939 (class 2606 OID 23562291)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2913 (class 2606 OID 23562171)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2916 (class 2606 OID 23562156)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2912 (class 2606 OID 23562176)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 23562166)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2915 (class 2606 OID 23562161)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2852 (class 2606 OID 23561861)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 23561856)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 23561801)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2841 (class 2606 OID 23561796)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 23562061)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2837 (class 2606 OID 23561776)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2836 (class 2606 OID 23561781)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2894 (class 2606 OID 23562076)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2895 (class 2606 OID 23562071)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2896 (class 2606 OID 23562066)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2847 (class 2606 OID 23561831)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2848 (class 2606 OID 23561826)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2846 (class 2606 OID 23561836)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2858 (class 2606 OID 23561896)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2860 (class 2606 OID 23561886)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2859 (class 2606 OID 23561891)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2833 (class 2606 OID 23561761)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2877 (class 2606 OID 23561996)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2879 (class 2606 OID 23561986)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2880 (class 2606 OID 23561981)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2878 (class 2606 OID 23561991)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2835 (class 2606 OID 23561766)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2834 (class 2606 OID 23561771)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2890 (class 2606 OID 23562046)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2944 (class 2606 OID 23562316)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2904 (class 2606 OID 23562121)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 23562116)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2946 (class 2606 OID 23562321)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2945 (class 2606 OID 23562326)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2886 (class 2606 OID 23562026)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2903 (class 2606 OID 23562106)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2902 (class 2606 OID 23562111)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 23562231)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23562226)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 23562211)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2926 (class 2606 OID 23562216)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2925 (class 2606 OID 23562221)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2850 (class 2606 OID 23561846)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 23561841)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2849 (class 2606 OID 23561851)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2891 (class 2606 OID 23562056)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2892 (class 2606 OID 23562051)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2930 (class 2606 OID 23562241)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2929 (class 2606 OID 23562246)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2920 (class 2606 OID 23562201)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 23562206)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2922 (class 2606 OID 23562191)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2921 (class 2606 OID 23562196)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2901 (class 2606 OID 23562096)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 23562101)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2881 (class 2606 OID 23562016)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2882 (class 2606 OID 23562011)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2884 (class 2606 OID 23562001)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2883 (class 2606 OID 23562006)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2917 (class 2606 OID 23562186)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2918 (class 2606 OID 23562181)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2856 (class 2606 OID 23561876)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2857 (class 2606 OID 23561881)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2863 (class 2606 OID 23561911)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2862 (class 2606 OID 23561901)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2861 (class 2606 OID 23561906)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2928 (class 2606 OID 23562236)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2931 (class 2606 OID 23562251)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2933 (class 2606 OID 23562261)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2943 (class 2606 OID 23562306)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2942 (class 2606 OID 23562311)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2838 (class 2606 OID 23561791)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 23561786)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2843 (class 2606 OID 23561806)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2842 (class 2606 OID 23561811)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 23561961)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2874 (class 2606 OID 23561976)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 23561971)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2876 (class 2606 OID 23561966)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-28 09:47:09 CET

--
-- PostgreSQL database dump complete
--

