--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-21 11:20:20 CEST

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
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 250
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22818078)
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
-- TOC entry 234 (class 1259 OID 22818684)
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
-- TOC entry 233 (class 1259 OID 22818667)
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
-- TOC entry 224 (class 1259 OID 22818544)
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
-- TOC entry 227 (class 1259 OID 22818574)
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
-- TOC entry 248 (class 1259 OID 22818955)
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
-- TOC entry 201 (class 1259 OID 22818324)
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
-- TOC entry 203 (class 1259 OID 22818355)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 22818881)
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
-- TOC entry 192 (class 1259 OID 22818221)
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
-- TOC entry 235 (class 1259 OID 22818697)
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
-- TOC entry 220 (class 1259 OID 22818498)
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
-- TOC entry 198 (class 1259 OID 22818295)
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
-- TOC entry 195 (class 1259 OID 22818261)
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
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22818238)
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
-- TOC entry 209 (class 1259 OID 22818412)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 246 (class 1259 OID 22818936)
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
-- TOC entry 247 (class 1259 OID 22818948)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 22818970)
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
-- TOC entry 213 (class 1259 OID 22818437)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22818195)
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
-- TOC entry 183 (class 1259 OID 22818097)
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
-- TOC entry 187 (class 1259 OID 22818161)
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
-- TOC entry 184 (class 1259 OID 22818108)
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
-- TOC entry 178 (class 1259 OID 22818052)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22818071)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 22818444)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 22818478)
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
-- TOC entry 230 (class 1259 OID 22818615)
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
-- TOC entry 186 (class 1259 OID 22818141)
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
-- TOC entry 189 (class 1259 OID 22818187)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 22818826)
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
-- TOC entry 210 (class 1259 OID 22818418)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22818172)
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
-- TOC entry 200 (class 1259 OID 22818316)
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
-- TOC entry 196 (class 1259 OID 22818276)
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
-- TOC entry 197 (class 1259 OID 22818288)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22818430)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 22818840)
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
-- TOC entry 239 (class 1259 OID 22818850)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 22818765)
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
-- TOC entry 240 (class 1259 OID 22818858)
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
-- TOC entry 216 (class 1259 OID 22818459)
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
-- TOC entry 208 (class 1259 OID 22818403)
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
-- TOC entry 207 (class 1259 OID 22818393)
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
-- TOC entry 229 (class 1259 OID 22818604)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 22818534)
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
-- TOC entry 194 (class 1259 OID 22818250)
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
-- TOC entry 175 (class 1259 OID 22818023)
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
-- TOC entry 174 (class 1259 OID 22818021)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 217 (class 1259 OID 22818472)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22818061)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22818045)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 22818486)
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
-- TOC entry 211 (class 1259 OID 22818424)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 22818370)
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
-- TOC entry 173 (class 1259 OID 22818010)
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
-- TOC entry 172 (class 1259 OID 22818002)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22817997)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 225 (class 1259 OID 22818551)
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
-- TOC entry 185 (class 1259 OID 22818133)
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
-- TOC entry 206 (class 1259 OID 22818380)
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
-- TOC entry 228 (class 1259 OID 22818592)
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
-- TOC entry 182 (class 1259 OID 22818087)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 241 (class 1259 OID 22818869)
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
-- TOC entry 204 (class 1259 OID 22818360)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22818207)
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
-- TOC entry 176 (class 1259 OID 22818032)
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
-- TOC entry 232 (class 1259 OID 22818642)
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
-- TOC entry 199 (class 1259 OID 22818306)
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
-- TOC entry 215 (class 1259 OID 22818451)
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
-- TOC entry 226 (class 1259 OID 22818565)
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
-- TOC entry 244 (class 1259 OID 22818916)
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
-- TOC entry 243 (class 1259 OID 22818888)
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
-- TOC entry 245 (class 1259 OID 22818928)
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
-- TOC entry 222 (class 1259 OID 22818523)
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
-- TOC entry 202 (class 1259 OID 22818349)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 231 (class 1259 OID 22818632)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 221 (class 1259 OID 22818513)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2224 (class 2604 OID 22818026)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3063 (class 0 OID 22818078)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5627-58d1-cb3c-8ae37562b7ae	10	30	Otroci	Abonma za otroke	200
000a0000-5627-58d1-2232-f01c906c7863	20	60	Mladina	Abonma za mladino	400
000a0000-5627-58d1-e7fb-3a27063033b2	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3116 (class 0 OID 22818684)
-- Dependencies: 234
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5627-58d2-5e39-4b933f68e502	000d0000-5627-58d2-5db6-3fa50ae38830	\N	00090000-5627-58d1-ccf3-9c7e2f5059f2	000b0000-5627-58d1-a981-33a232f67dd8	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5627-58d2-dddf-4483be17faae	000d0000-5627-58d2-4146-fbe2bd9a83bd	00100000-5627-58d1-7153-252a19c60962	00090000-5627-58d1-51f2-f95ce10d5b22	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5627-58d2-e28f-8d70a85ef340	000d0000-5627-58d2-cb21-65d1ea07ea6d	00100000-5627-58d1-dfd0-2556144618a6	00090000-5627-58d1-04b8-1154b4570881	\N	0003	t	\N	2015-10-21	\N	2	t	\N	f	f
000c0000-5627-58d2-43be-401ae60b512d	000d0000-5627-58d2-e616-f0721d0c5328	\N	00090000-5627-58d1-1b3f-9033bca21fd7	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5627-58d2-ab32-c78fbc88dfae	000d0000-5627-58d2-90bc-a8fcb4159254	\N	00090000-5627-58d1-5ab5-bf665371fd67	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5627-58d2-2003-c7595134440d	000d0000-5627-58d2-23d7-29827ea4dd64	\N	00090000-5627-58d1-5133-664e98fd4b9c	000b0000-5627-58d1-7e6a-efe9be80ce6d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5627-58d2-ab56-e950a66ca3c6	000d0000-5627-58d2-9c77-03fbc8440a15	00100000-5627-58d1-ba64-8a9440374662	00090000-5627-58d1-6560-18124a996960	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5627-58d2-e02b-7c9ea2714d7f	000d0000-5627-58d2-6701-daf3d1b7058c	\N	00090000-5627-58d1-db90-aa85811d1196	000b0000-5627-58d1-3329-f684e034fa37	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5627-58d2-3ff3-a83f01dd65a4	000d0000-5627-58d2-9c77-03fbc8440a15	00100000-5627-58d1-896e-3da2bb1e396c	00090000-5627-58d1-1edc-77249334bd41	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5627-58d2-f8ba-98a3c9aa5543	000d0000-5627-58d2-9c77-03fbc8440a15	00100000-5627-58d1-5dd3-6380401529c1	00090000-5627-58d1-73fe-0ef9469d00ea	\N	0010	t	\N	2015-10-21	\N	16	f	\N	f	t
000c0000-5627-58d2-ae17-5af855d8e727	000d0000-5627-58d2-9c77-03fbc8440a15	00100000-5627-58d1-5405-774738c2d251	00090000-5627-58d1-036c-2043db342943	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5627-58d2-67b1-d30fcaad5284	000d0000-5627-58d2-f28c-6a11ef4f1021	\N	00090000-5627-58d1-51f2-f95ce10d5b22	000b0000-5627-58d1-0bc1-727cc9c4b4f9	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3115 (class 0 OID 22818667)
-- Dependencies: 233
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 22818544)
-- Dependencies: 224
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5627-58d1-881d-ec818d98db48	00160000-5627-58d1-e28a-b95db018368e	00090000-5627-58d1-23c4-074b3ac528bf	aizv	10	t
003d0000-5627-58d1-a502-6a2c14119056	00160000-5627-58d1-e28a-b95db018368e	00090000-5627-58d1-48e9-8fac9ef1db3d	apri	14	t
003d0000-5627-58d1-71aa-830e3a66bf2c	00160000-5627-58d1-756a-17fd84c766f9	00090000-5627-58d1-4fb6-e2ea9f66ed8e	aizv	11	t
003d0000-5627-58d1-5839-59d03060577b	00160000-5627-58d1-048c-4f7a990c712a	00090000-5627-58d1-ab02-d99b45e346b3	aizv	12	t
003d0000-5627-58d1-de04-94b338204911	00160000-5627-58d1-e28a-b95db018368e	00090000-5627-58d1-afc3-a1384c05c0a9	apri	18	f
\.


--
-- TOC entry 3109 (class 0 OID 22818574)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5627-58d1-e28a-b95db018368e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5627-58d1-756a-17fd84c766f9	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5627-58d1-048c-4f7a990c712a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3130 (class 0 OID 22818955)
-- Dependencies: 248
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22818324)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5627-58d2-651f-faae854f87ff	\N	\N	00200000-5627-58d2-1662-f9470d0b1121	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5627-58d2-f993-7d7a9ce3978c	\N	\N	00200000-5627-58d2-790c-0541b7c152d1	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5627-58d2-fddf-88dddfe6bbbb	\N	\N	00200000-5627-58d2-73b0-1cc7fd87b9a5	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5627-58d2-36dd-7021e0154727	\N	\N	00200000-5627-58d2-4251-6b2d0e9fa8c1	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5627-58d2-2ec4-f10dd61bc0e3	\N	\N	00200000-5627-58d2-86a3-71544f450a38	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3085 (class 0 OID 22818355)
-- Dependencies: 203
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 22818881)
-- Dependencies: 242
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 22818221)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5627-58cf-4086-0034c4b8ee47	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5627-58cf-dc76-791dbb5c81db	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5627-58cf-e558-f232def6b9d0	AL	ALB	008	Albania 	Albanija	\N
00040000-5627-58cf-7a79-82666e9451a1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5627-58cf-ccbc-850ece9a9388	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5627-58cf-6802-7955b3033fe6	AD	AND	020	Andorra 	Andora	\N
00040000-5627-58cf-405f-4d9fb932dc2f	AO	AGO	024	Angola 	Angola	\N
00040000-5627-58cf-5574-25418e32ba55	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5627-58cf-94ba-e0ac0d3389b0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5627-58cf-3e9c-0ed644e05903	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5627-58cf-992b-71943ed4074d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5627-58cf-9bd8-49ac9f784425	AM	ARM	051	Armenia 	Armenija	\N
00040000-5627-58cf-95f4-b6a7d869b376	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5627-58cf-38e2-930f090b69c0	AU	AUS	036	Australia 	Avstralija	\N
00040000-5627-58cf-777e-696ff7888683	AT	AUT	040	Austria 	Avstrija	\N
00040000-5627-58cf-8a32-47b6795b57f9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5627-58cf-519d-bf603a0ec77c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5627-58cf-9e63-affa9328f65e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5627-58cf-e526-63a0165a816d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5627-58cf-d872-0d0bd387fe78	BB	BRB	052	Barbados 	Barbados	\N
00040000-5627-58cf-fbc4-c13f09da5d67	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5627-58cf-ed30-a3ef2573eeb4	BE	BEL	056	Belgium 	Belgija	\N
00040000-5627-58cf-4f3d-651dce95d22e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5627-58cf-7be0-f479767b71b5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5627-58cf-fb28-79e0b91619a7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5627-58cf-1201-9c6a6dee4f7f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5627-58cf-9ae0-0494b8f11299	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5627-58cf-53db-c2bc8d344c27	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5627-58cf-c3df-861d67c7628e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5627-58cf-168c-af1b208fb171	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5627-58cf-832a-ff3578b9dd4e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5627-58cf-47e7-d7f24c2e5331	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5627-58cf-efde-3f38c1400fdb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5627-58cf-682c-a724e410b0e9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5627-58cf-c6cc-569295d06c13	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5627-58cf-c6c5-c8617e538936	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5627-58cf-824d-a3c043d371ab	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5627-58cf-d844-5f0a5f138d96	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5627-58cf-2bee-6006018d3bf5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5627-58cf-33b6-e3f43b2900c3	CA	CAN	124	Canada 	Kanada	\N
00040000-5627-58cf-f57d-86a167da4bfa	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5627-58cf-a80b-cce9a91511f6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5627-58cf-e869-429a1ecd67ca	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5627-58cf-e2c4-d0a97a05a777	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5627-58cf-c8ca-257b30d06a68	CL	CHL	152	Chile 	Čile	\N
00040000-5627-58cf-47b3-838c8e28e640	CN	CHN	156	China 	Kitajska	\N
00040000-5627-58cf-91ee-e8ad5aa32cc1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5627-58cf-c5d4-def4cb681e94	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5627-58cf-edfd-1c9efec19271	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5627-58cf-a7b4-195c6f0b6ae4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5627-58cf-a1e4-ff995ac11b2f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5627-58cf-fe06-979e37e13fd1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5627-58cf-c008-939aa1f5df4e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5627-58cf-d7fc-d169cb8bd593	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5627-58cf-5a31-9bfc8639eb34	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5627-58cf-b0a1-c6b0ee7fdf1a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5627-58cf-a51d-bfd3705273c9	CU	CUB	192	Cuba 	Kuba	\N
00040000-5627-58cf-186c-f488e2089964	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5627-58cf-b136-657bc6eae9aa	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5627-58cf-1935-f89b74dded21	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5627-58cf-cd2e-2e5cfa45bda1	DK	DNK	208	Denmark 	Danska	\N
00040000-5627-58cf-6d89-dc5d7d759f92	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5627-58cf-ae7b-8babb7421bc8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5627-58cf-e3ed-81f0b10bc97e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5627-58cf-1f89-9fc4e53fddd9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5627-58cf-2d84-d3175de4220d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5627-58cf-ff55-7a0c86a9582f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5627-58cf-afcd-78df676370e6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5627-58cf-e2aa-fc25b7e8751c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5627-58cf-3c49-bea56ec8e76b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5627-58cf-1d78-59087292ab76	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5627-58cf-c470-53d97ddb078f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5627-58cf-21a5-7feede9dcf15	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5627-58cf-0c5f-f37ee5ad8435	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5627-58cf-48e0-3163bf633eed	FI	FIN	246	Finland 	Finska	\N
00040000-5627-58cf-5b0d-f50a58739f17	FR	FRA	250	France 	Francija	\N
00040000-5627-58cf-bb83-212c10899d01	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5627-58cf-b119-ff18f2ffbf7a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5627-58cf-8d9b-9edcc217ca36	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5627-58cf-4f6c-ae585619c074	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5627-58cf-8ae3-19ee38495ae1	GA	GAB	266	Gabon 	Gabon	\N
00040000-5627-58cf-325c-b766ab7000fa	GM	GMB	270	Gambia 	Gambija	\N
00040000-5627-58cf-278a-ca68ab0dae19	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5627-58cf-1559-0c48fa341c61	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5627-58cf-231f-5305282c31e2	GH	GHA	288	Ghana 	Gana	\N
00040000-5627-58cf-6069-aeb0f8271826	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5627-58cf-d876-a524f9356832	GR	GRC	300	Greece 	Grčija	\N
00040000-5627-58cf-0bba-f0ff521f60d1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5627-58cf-636a-619301ca4468	GD	GRD	308	Grenada 	Grenada	\N
00040000-5627-58cf-d15c-eb16c7fa4f92	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5627-58cf-85a3-b383facecdae	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5627-58cf-25ef-b69041214b16	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5627-58cf-ad75-190f91ee7fa5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5627-58cf-1234-a12904fb049b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5627-58cf-1123-cee28ae8c725	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5627-58cf-d01a-af38d10a1d44	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5627-58cf-eafb-eb9cf8d26098	HT	HTI	332	Haiti 	Haiti	\N
00040000-5627-58cf-698c-1999288e629a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5627-58cf-97d3-49a10836468d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5627-58cf-40a6-581f2728f9a4	HN	HND	340	Honduras 	Honduras	\N
00040000-5627-58cf-b9e3-31abffe23c64	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5627-58cf-4541-21dcdc6d7bea	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5627-58cf-be16-2081d5b2cd10	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5627-58cf-ed16-6ab9da006001	IN	IND	356	India 	Indija	\N
00040000-5627-58cf-5d4f-c4f3afd5cb1c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5627-58cf-ee7a-cd2354fcb189	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5627-58cf-56f9-2bf4179f747c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5627-58cf-e051-e5add3cd7ed7	IE	IRL	372	Ireland 	Irska	\N
00040000-5627-58cf-f360-8a46ab7c5168	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5627-58cf-c951-9ff239eff5a7	IL	ISR	376	Israel 	Izrael	\N
00040000-5627-58cf-3353-ef91f14d3f09	IT	ITA	380	Italy 	Italija	\N
00040000-5627-58cf-8f89-510123e4cc11	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5627-58cf-9823-06df0e04e04e	JP	JPN	392	Japan 	Japonska	\N
00040000-5627-58cf-5f43-ba2f8bf77529	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5627-58cf-8e0b-035ff0fadab7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5627-58cf-961d-48816d100367	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5627-58cf-dc49-33bbe934ea3a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5627-58cf-0424-f31e3a471423	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5627-58cf-fab1-b04247d59c94	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5627-58cf-97db-523ac52f04d4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5627-58cf-7a75-130889102003	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5627-58cf-f0a5-95a2ced8e46c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5627-58cf-7c6a-2c4e1ed13f20	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5627-58cf-f96b-149cfd8122b3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5627-58cf-dcf2-5738046c1d72	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5627-58cf-f362-7fbabd6e66fd	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5627-58cf-069d-da890b0b6363	LR	LBR	430	Liberia 	Liberija	\N
00040000-5627-58cf-924c-36c620b379f7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5627-58cf-bc99-d65a4803bee1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5627-58cf-9c71-5ec5aef749f3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5627-58cf-e05d-b04e15e606c1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5627-58cf-7c15-2b4322409b24	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5627-58cf-c8b7-8b53c57a3a03	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5627-58cf-2a5f-ea143e6f5337	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5627-58cf-d3c0-77d70dc85807	MW	MWI	454	Malawi 	Malavi	\N
00040000-5627-58cf-53cb-75a71511fee8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5627-58cf-7643-a6e866c30b37	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5627-58cf-9bb3-817d59740789	ML	MLI	466	Mali 	Mali	\N
00040000-5627-58cf-45b0-022ccca0ccff	MT	MLT	470	Malta 	Malta	\N
00040000-5627-58cf-3b33-59688f8b0f9d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5627-58cf-5eaf-74274e036669	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5627-58cf-9adf-e65b36010065	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5627-58cf-68e2-108b74f258bf	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5627-58cf-f3df-068fc058f159	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5627-58cf-6143-20a7bef39f0d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5627-58cf-8472-6a11c7def4aa	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5627-58cf-578b-acdfefd4dc45	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5627-58cf-b9d7-5e1fd49c0b9c	MC	MCO	492	Monaco 	Monako	\N
00040000-5627-58cf-0c8b-0590c8d8fde0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5627-58cf-c1e1-25fa43d73c8a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5627-58cf-9f6b-3633a9591415	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5627-58cf-65fd-88264354ddae	MA	MAR	504	Morocco 	Maroko	\N
00040000-5627-58cf-cf21-5119374f463c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5627-58cf-3a28-79be87fd5509	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5627-58cf-02af-9583f1330f77	NA	NAM	516	Namibia 	Namibija	\N
00040000-5627-58cf-3ce8-e9b21a554c0d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5627-58cf-853e-78781963c036	NP	NPL	524	Nepal 	Nepal	\N
00040000-5627-58cf-9b23-056a870c0028	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5627-58cf-b4af-ad95964e1a54	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5627-58cf-c246-656e020cb2e2	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5627-58cf-cd26-2510d42793cb	NE	NER	562	Niger 	Niger 	\N
00040000-5627-58cf-cd18-dac2cae86887	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5627-58cf-9045-bb62d57e2bd7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5627-58cf-7487-35a3c99fc34a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5627-58cf-63a4-6b99c7c6bbc6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5627-58cf-fb96-a0b8f72b15bf	NO	NOR	578	Norway 	Norveška	\N
00040000-5627-58cf-d9df-6d5dbd5e5255	OM	OMN	512	Oman 	Oman	\N
00040000-5627-58cf-f90e-2b67d578aaf0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5627-58cf-4629-c7f2b4f9b13a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5627-58cf-652f-f4b27ecd2217	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5627-58cf-53a0-2d7b0f8dd5c9	PA	PAN	591	Panama 	Panama	\N
00040000-5627-58cf-a905-f6960322b1f7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5627-58cf-d8d6-51e62b1a53da	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5627-58cf-1b2d-330b1a7dfcd7	PE	PER	604	Peru 	Peru	\N
00040000-5627-58cf-87ca-15388866b5c0	PH	PHL	608	Philippines 	Filipini	\N
00040000-5627-58cf-2adb-1c0435877e13	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5627-58cf-ea4a-e250763c9d41	PL	POL	616	Poland 	Poljska	\N
00040000-5627-58cf-89eb-09020fe93ed2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5627-58cf-3e49-d07c6be28f73	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5627-58cf-ef88-0f62910f5e87	QA	QAT	634	Qatar 	Katar	\N
00040000-5627-58cf-2dd7-4cfc315b84a8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5627-58cf-3cf5-9c6bebc134ec	RO	ROU	642	Romania 	Romunija	\N
00040000-5627-58cf-4937-cd3cb0ea2744	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5627-58cf-24cb-a89441975ccf	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5627-58cf-a7dd-5f90cae9a577	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5627-58cf-8745-366ece99e30a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5627-58cf-b033-ac9d9c501535	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5627-58cf-0cdc-76f15092d026	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5627-58cf-f1ec-f919d083dd58	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5627-58cf-203f-cf737d5b2a23	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5627-58cf-1d48-0f8de4ae7688	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5627-58cf-16eb-6cb72c6648ee	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5627-58cf-4465-be710ab99e16	SM	SMR	674	San Marino 	San Marino	\N
00040000-5627-58cf-7469-139fbe94b9cf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5627-58cf-65a3-8e747c9f304c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5627-58cf-96c7-152a8939f643	SN	SEN	686	Senegal 	Senegal	\N
00040000-5627-58cf-9e2e-1940b7d5a9c6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5627-58cf-0739-4db79d5c8099	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5627-58cf-5656-04cc895c8125	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5627-58cf-1d4d-c4ab52d25b8f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5627-58cf-08e1-9d340a0999ca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5627-58cf-8159-e8f32a19690c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5627-58cf-a5c9-3bf4386b348f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5627-58cf-0705-bf21d7eca472	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5627-58cf-bdd0-877fd71e6d7b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5627-58cf-969d-73803346718d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5627-58cf-1c3b-74d4bc38a084	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5627-58cf-b19b-0e29e0362be9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5627-58cf-e5fe-fe86b578ce9b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5627-58cf-b843-c8675aaceba4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5627-58cf-90ae-a00f3baf2b03	SD	SDN	729	Sudan 	Sudan	\N
00040000-5627-58cf-dcea-09f109d51183	SR	SUR	740	Suriname 	Surinam	\N
00040000-5627-58cf-e29e-b4c631b1ce19	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5627-58cf-5b74-1c9d2e1a6154	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5627-58cf-3ce5-7c3bb913d5c0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5627-58cf-5281-fee844f92a42	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5627-58cf-6149-98ea3a07dfd0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5627-58cf-c325-58a8f7b31a15	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5627-58cf-1a8c-0b2af58f0e60	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5627-58cf-b8a5-c9ce011eb42c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5627-58cf-10ae-299a7c304c59	TH	THA	764	Thailand 	Tajska	\N
00040000-5627-58cf-dd84-e6d6e7625d97	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5627-58cf-c280-2b66fd394c91	TG	TGO	768	Togo 	Togo	\N
00040000-5627-58cf-bb9a-7a328c644fe3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5627-58cf-e383-45a83d66788f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5627-58cf-4ed0-7d822adb5f6c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5627-58cf-6866-80c4c6dd7e6e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5627-58cf-c8d7-870bc7cccd43	TR	TUR	792	Turkey 	Turčija	\N
00040000-5627-58cf-cbf0-721fcb6bb011	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5627-58cf-0e70-2c527d61f188	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5627-58cf-d6b8-98bab00c2e0b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5627-58cf-654b-fb8191b89325	UG	UGA	800	Uganda 	Uganda	\N
00040000-5627-58cf-6c02-8e44a945d30c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5627-58cf-b6c2-b29cdaf7d1f7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5627-58cf-c4a3-80ee7da1950d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5627-58cf-cfc1-2fd5351ea6dc	US	USA	840	United States 	Združene države Amerike	\N
00040000-5627-58cf-ac6d-9e871e417648	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5627-58cf-a253-da3211946519	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5627-58cf-c2f6-cbc0f136fa13	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5627-58cf-9799-95df2916c173	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5627-58cf-92fe-2ba68a11cc6e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5627-58cf-b550-4f5e61bcb588	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5627-58cf-6aa6-a164cf6fdcb6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5627-58cf-ed8a-6b6bae7cbd9b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5627-58cf-2f97-13b628ea8bf4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5627-58cf-fcc7-bf4a33ecae69	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5627-58cf-f033-f8d0c7741004	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5627-58cf-18ac-fc15b1cc28be	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5627-58cf-b182-c6845f138c4f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3117 (class 0 OID 22818697)
-- Dependencies: 235
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5627-58d2-9043-bedfbb32bc73	000e0000-5627-58d1-46e7-f45af92ac7cd	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-58cf-c173-69e211465060	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5627-58d2-2806-132a23286fe6	000e0000-5627-58d1-04f6-b58883e63609	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-58cf-bffa-36b92c120567	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5627-58d2-c89a-f87b543820a4	000e0000-5627-58d1-c039-36e8d5bf0f21	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-58cf-c173-69e211465060	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5627-58d2-b098-e49d5e77a319	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5627-58d2-c33f-1d6c73f0e74a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 22818498)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5627-58d2-5db6-3fa50ae38830	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-5e39-4b933f68e502	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5627-58cf-c532-312fcdde913c
000d0000-5627-58d2-4146-fbe2bd9a83bd	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-dddf-4483be17faae	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5627-58cf-018f-750e9abbc134
000d0000-5627-58d2-cb21-65d1ea07ea6d	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-e28f-8d70a85ef340	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5627-58cf-b9f5-a769a2fa24f9
000d0000-5627-58d2-e616-f0721d0c5328	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-43be-401ae60b512d	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5627-58cf-91be-d040c76fc713
000d0000-5627-58d2-90bc-a8fcb4159254	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-ab32-c78fbc88dfae	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5627-58cf-91be-d040c76fc713
000d0000-5627-58d2-23d7-29827ea4dd64	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-2003-c7595134440d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5627-58cf-c532-312fcdde913c
000d0000-5627-58d2-9c77-03fbc8440a15	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-3ff3-a83f01dd65a4	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5627-58cf-c532-312fcdde913c
000d0000-5627-58d2-6701-daf3d1b7058c	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-e02b-7c9ea2714d7f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5627-58cf-867c-c9546d5d95ea
000d0000-5627-58d2-f28c-6a11ef4f1021	000e0000-5627-58d1-04f6-b58883e63609	000c0000-5627-58d2-67b1-d30fcaad5284	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5627-58cf-3f89-9bd6f42ef448
\.


--
-- TOC entry 3080 (class 0 OID 22818295)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22818261)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 22818238)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5627-58d1-e0ea-754412bf5cf0	00080000-5627-58d1-3a01-2e490f9a7af8	00090000-5627-58d1-73fe-0ef9469d00ea	AK		igralka
\.


--
-- TOC entry 3091 (class 0 OID 22818412)
-- Dependencies: 209
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 22818936)
-- Dependencies: 246
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 22818948)
-- Dependencies: 247
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 22818970)
-- Dependencies: 249
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 22757748)
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
-- TOC entry 3095 (class 0 OID 22818437)
-- Dependencies: 213
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22818195)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5627-58d0-4473-b28f3ddeccf0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5627-58d0-24a1-57f710193a47	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5627-58d0-862b-f89d60c26d03	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5627-58d0-cae5-f6eaac5f81e4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5627-58d0-2fae-46e5324f101c	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5627-58d0-abed-aa6426c17280	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5627-58d0-f8cd-d796fbcaceee	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5627-58d0-1a7a-e1d8619be878	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5627-58d0-18fc-66fbd272da1c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5627-58d0-a301-bf4b0284d39e	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5627-58d0-22f0-20028de5779b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5627-58d0-1dcc-2e93ea5689ee	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5627-58d0-4cf8-ecfa82759d5a	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5627-58d0-f811-71946c923164	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5627-58d0-67cd-451d261b52d3	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5627-58d1-214d-8c9cf0e96c8e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5627-58d1-1b03-f8c398f0601e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5627-58d1-ca3c-e9f5ee4bb9ce	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5627-58d1-5e8f-878256d0702a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5627-58d1-b092-162de3236900	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5627-58d3-f2d0-4523f88cd8f8	application.tenant.maticnopodjetje	string	s:36:"00080000-5627-58d3-f650-73e179ad7bb4";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3065 (class 0 OID 22818097)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5627-58d1-a962-97b5a61b2633	00000000-5627-58d1-214d-8c9cf0e96c8e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5627-58d1-a8a9-e66d51d082b1	00000000-5627-58d1-214d-8c9cf0e96c8e	00010000-5627-58d0-533e-b9fea848637f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5627-58d1-4962-8e7c0cb07114	00000000-5627-58d1-1b03-f8c398f0601e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3069 (class 0 OID 22818161)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5627-58d1-1d45-1dbc8dbc35b2	\N	00100000-5627-58d1-7153-252a19c60962	00100000-5627-58d1-dfd0-2556144618a6	01	Gledališče Nimbis
00410000-5627-58d1-0939-93ecba30c1ab	00410000-5627-58d1-1d45-1dbc8dbc35b2	00100000-5627-58d1-7153-252a19c60962	00100000-5627-58d1-dfd0-2556144618a6	02	Tehnika
\.


--
-- TOC entry 3066 (class 0 OID 22818108)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5627-58d1-ccf3-9c7e2f5059f2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5627-58d1-1b3f-9033bca21fd7	00010000-5627-58d1-0ce3-f155e641e3a6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5627-58d1-04b8-1154b4570881	00010000-5627-58d1-4b74-547639a56fce	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5627-58d1-1edc-77249334bd41	00010000-5627-58d1-fc64-66f0f32baa3e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5627-58d1-2608-2b521348ce96	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5627-58d1-5133-664e98fd4b9c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5627-58d1-036c-2043db342943	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5627-58d1-6560-18124a996960	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5627-58d1-73fe-0ef9469d00ea	00010000-5627-58d1-7467-c2d835090035	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5627-58d1-51f2-f95ce10d5b22	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5627-58d1-2d60-e305ef18b2f7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5627-58d1-5ab5-bf665371fd67	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5627-58d1-db90-aa85811d1196	00010000-5627-58d1-60e7-d0e077b10fc2	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5627-58d1-23c4-074b3ac528bf	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-58d1-48e9-8fac9ef1db3d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-58d1-4fb6-e2ea9f66ed8e	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-58d1-ab02-d99b45e346b3	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5627-58d1-afc3-a1384c05c0a9	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3060 (class 0 OID 22818052)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5627-58d0-4a37-3f4c578babc9	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5627-58d0-2cd3-a84fb6bbdb97	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5627-58d0-b563-79d5add9dd6f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5627-58d0-3c03-5b3deff27c92	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5627-58d0-522a-84b301213cf8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5627-58d0-9190-66c6c42d311b	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5627-58d0-789d-00f4a19b8a1d	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5627-58d0-f727-0f0bb071b4b9	Abonma-read	Abonma - branje	f
00030000-5627-58d0-15f7-fe6215070537	Abonma-write	Abonma - spreminjanje	f
00030000-5627-58d0-1456-e03850e9ef66	Alternacija-read	Alternacija - branje	f
00030000-5627-58d0-b1d6-1bee743d640f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5627-58d0-d49e-3e439467a147	Arhivalija-read	Arhivalija - branje	f
00030000-5627-58d0-3613-a0b7956177bf	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5627-58d0-083c-a298699c6c2e	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5627-58d0-edb1-eade1c577bc8	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5627-58d0-bc41-615dc1029b66	Besedilo-read	Besedilo - branje	f
00030000-5627-58d0-19b2-6afe236d3668	Besedilo-write	Besedilo - spreminjanje	f
00030000-5627-58d0-15e7-1a89721fd829	DogodekIzven-read	DogodekIzven - branje	f
00030000-5627-58d0-b02d-8a06e675baa0	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5627-58d0-f30f-686f61831304	Dogodek-read	Dogodek - branje	f
00030000-5627-58d0-a2d2-0bc9019630df	Dogodek-write	Dogodek - spreminjanje	f
00030000-5627-58d0-ed76-b75aa839c8d3	DrugiVir-read	DrugiVir - branje	f
00030000-5627-58d0-bf9a-7b96f36b9427	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5627-58d0-b673-41b2c84066d4	Drzava-read	Drzava - branje	f
00030000-5627-58d0-c0ea-b65abdadbe74	Drzava-write	Drzava - spreminjanje	f
00030000-5627-58d0-8d1f-ea0f1d86abf5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5627-58d0-6c2f-83a051173ecf	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5627-58d0-554b-6eba67a1e784	Funkcija-read	Funkcija - branje	f
00030000-5627-58d0-6bc8-a481211abde9	Funkcija-write	Funkcija - spreminjanje	f
00030000-5627-58d0-3318-16b28a3da217	Gostovanje-read	Gostovanje - branje	f
00030000-5627-58d0-607a-a884bb482c78	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5627-58d0-3b56-d104f07c9ae4	Gostujoca-read	Gostujoca - branje	f
00030000-5627-58d0-2317-214e609e3741	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5627-58d0-21ec-d99954909c72	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5627-58d0-89ae-dacb5f2f8407	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5627-58d0-a744-9d479c7ec3dd	Kupec-read	Kupec - branje	f
00030000-5627-58d0-1748-790033c4005e	Kupec-write	Kupec - spreminjanje	f
00030000-5627-58d0-befe-ef254bd29e9a	NacinPlacina-read	NacinPlacina - branje	f
00030000-5627-58d0-3333-e9e415d81858	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5627-58d0-eb02-7a212ebc9772	Option-read	Option - branje	f
00030000-5627-58d0-8544-37b58fba5a0a	Option-write	Option - spreminjanje	f
00030000-5627-58d0-cec7-7da33732dec1	OptionValue-read	OptionValue - branje	f
00030000-5627-58d0-ce57-4067b9ddd959	OptionValue-write	OptionValue - spreminjanje	f
00030000-5627-58d0-b8b0-4b923973fbc6	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5627-58d0-7129-737ca227455e	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5627-58d0-6436-307d9f4300d4	Oseba-read	Oseba - branje	f
00030000-5627-58d0-1ffb-e0060b0a2a83	Oseba-write	Oseba - spreminjanje	f
00030000-5627-58d0-105e-38a507f73162	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5627-58d0-c373-bd54c9ddda25	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5627-58d0-84af-dd4d9475f2eb	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5627-58d0-d782-07741b742c40	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5627-58d0-843f-6c641886538c	Pogodba-read	Pogodba - branje	f
00030000-5627-58d0-83d4-e4608fe3a912	Pogodba-write	Pogodba - spreminjanje	f
00030000-5627-58d0-e073-ff27cade4ad5	Popa-read	Popa - branje	f
00030000-5627-58d0-f136-08541a80ce6b	Popa-write	Popa - spreminjanje	f
00030000-5627-58d0-2944-37cbfa9adf1a	Posta-read	Posta - branje	f
00030000-5627-58d0-316c-905e618773c5	Posta-write	Posta - spreminjanje	f
00030000-5627-58d0-089a-2d885d6a7ca8	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5627-58d0-e241-d8e417522f4d	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5627-58d0-8b25-9f354bb3d826	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5627-58d0-07a8-f77b0640776e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5627-58d0-71bf-f90b4a9d0e0e	PostniNaslov-read	PostniNaslov - branje	f
00030000-5627-58d0-c267-f7cbd21028c9	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5627-58d0-9468-a15a8fe2f13f	Predstava-read	Predstava - branje	f
00030000-5627-58d0-fbab-f8df4724a955	Predstava-write	Predstava - spreminjanje	f
00030000-5627-58d0-a4ff-254576194013	Praznik-read	Praznik - branje	f
00030000-5627-58d0-b2ee-f706fb96b0ff	Praznik-write	Praznik - spreminjanje	f
00030000-5627-58d0-afe7-e87cfdd77556	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5627-58d0-ce6d-2bd544aca318	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5627-58d0-40fd-d12c65792bde	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5627-58d0-267f-120cbbe37d97	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5627-58d0-3532-00469fb4d5fd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5627-58d0-f564-a2fcbcec57b9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5627-58d0-200d-69cc63a5788c	ProgramDela-read	ProgramDela - branje	f
00030000-5627-58d0-9567-64ae366e96ad	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5627-58d0-5643-43483f35f7de	ProgramFestival-read	ProgramFestival - branje	f
00030000-5627-58d0-be15-57875792e1d0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5627-58d0-0a7b-9c1f9217641e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5627-58d0-28e5-2f8c4d6e90a2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5627-58d0-b5f0-856d2a682fe8	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5627-58d0-0fe7-27d29caf92cc	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5627-58d0-9f95-f0e382cbf690	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5627-58d0-9f6d-21e75b1dd231	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5627-58d0-477b-1ade2daefe8e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5627-58d0-2db3-4fb44f388150	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5627-58d0-7dbb-152059e01418	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5627-58d0-e9d7-d554bb558f9a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5627-58d0-6897-eb185021b376	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5627-58d0-41a8-e6d786cb1894	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5627-58d0-45b6-9e5a95b24e2c	ProgramRazno-read	ProgramRazno - branje	f
00030000-5627-58d0-1594-5ab327cf20ed	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5627-58d0-7789-e24232d147c9	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5627-58d0-bf0a-77606cf0bb7b	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5627-58d0-5958-f10efa846662	Prostor-read	Prostor - branje	f
00030000-5627-58d0-2156-a08535bab974	Prostor-write	Prostor - spreminjanje	f
00030000-5627-58d0-a89a-733504977933	Racun-read	Racun - branje	f
00030000-5627-58d0-b37c-8cff26125331	Racun-write	Racun - spreminjanje	f
00030000-5627-58d0-f7f0-9085271ad617	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5627-58d0-76c6-e22e3dc9f396	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5627-58d0-c50e-328ede27ed2c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5627-58d0-db2d-615087305d4b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5627-58d0-a089-91e8b936dc9c	Rekvizit-read	Rekvizit - branje	f
00030000-5627-58d0-c775-25cdc8f54810	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5627-58d0-343d-a7fc6935e6d3	Revizija-read	Revizija - branje	f
00030000-5627-58d0-b2f1-cfbf81f8b3c5	Revizija-write	Revizija - spreminjanje	f
00030000-5627-58d0-6ba4-84730262a7b2	Rezervacija-read	Rezervacija - branje	f
00030000-5627-58d0-aa24-3fa4e8434683	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5627-58d0-da96-6b270abb2d53	SedezniRed-read	SedezniRed - branje	f
00030000-5627-58d0-edbc-3c40275033cb	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5627-58d0-7651-1477df387913	Sedez-read	Sedez - branje	f
00030000-5627-58d0-63ce-1185825319af	Sedez-write	Sedez - spreminjanje	f
00030000-5627-58d0-1156-7a1420c6e5ca	Sezona-read	Sezona - branje	f
00030000-5627-58d0-29fd-d708187946a7	Sezona-write	Sezona - spreminjanje	f
00030000-5627-58d0-f8b7-a05cbc7fa28f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5627-58d0-5159-363dc8eeb0b0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5627-58d0-9d33-5bf75b8b33c7	Stevilcenje-read	Stevilcenje - branje	f
00030000-5627-58d0-2162-4086140ed038	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5627-58d0-81b7-981d8cf7b5eb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5627-58d0-f7a1-c5fd107496b3	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5627-58d0-99a9-741d5f293214	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5627-58d0-7f05-28f3950f0b8e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5627-58d0-6417-40ad02143cde	Telefonska-read	Telefonska - branje	f
00030000-5627-58d0-2ff5-7ed6396d0d35	Telefonska-write	Telefonska - spreminjanje	f
00030000-5627-58d0-9059-984fea7d2c8e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5627-58d0-1373-45691965839e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5627-58d0-5557-562b3cbf5c70	TipFunkcije-read	TipFunkcije - branje	f
00030000-5627-58d0-34a1-017e0487be27	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5627-58d0-8c41-284e6b6183bd	TipPopa-read	TipPopa - branje	f
00030000-5627-58d0-b222-c191dd8ddedd	TipPopa-write	TipPopa - spreminjanje	f
00030000-5627-58d0-d34b-9e8f782cad60	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5627-58d0-0292-71fca990f154	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5627-58d0-e635-88408a610580	TipVaje-read	TipVaje - branje	f
00030000-5627-58d0-06b0-0de7c60c4bf7	TipVaje-write	TipVaje - spreminjanje	f
00030000-5627-58d0-9874-b31dd1db28d2	Trr-read	Trr - branje	f
00030000-5627-58d0-c827-1fa1b428d119	Trr-write	Trr - spreminjanje	f
00030000-5627-58d0-23ec-22de1b1dd131	Uprizoritev-read	Uprizoritev - branje	f
00030000-5627-58d0-4e3b-4aa98481358e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5627-58d0-47ba-5c46feadb812	Vaja-read	Vaja - branje	f
00030000-5627-58d0-f3b2-f45486528bb0	Vaja-write	Vaja - spreminjanje	f
00030000-5627-58d0-946f-d70b0397ff20	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5627-58d0-6bb0-b2d7a8e4323f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5627-58d0-6e76-037af84bc930	VrstaStroska-read	VrstaStroska - branje	f
00030000-5627-58d0-ca56-228594ee585d	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5627-58d0-2317-cdbe6da480a1	Zaposlitev-read	Zaposlitev - branje	f
00030000-5627-58d0-5132-9a96eea592d5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5627-58d0-f8cd-644ba119b16f	Zasedenost-read	Zasedenost - branje	f
00030000-5627-58d0-c761-8265e688d372	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5627-58d0-e51e-e84cc7db484a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5627-58d0-1333-34f24b042c06	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5627-58d0-17b5-2a18698db647	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5627-58d0-2c6c-6de058f50984	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5627-58d0-6a5b-f0d7a0ce735a	Job-read	Branje opravil - samo zase - branje	f
00030000-5627-58d0-92ea-2e515a367596	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5627-58d0-f912-69258276c75b	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5627-58d0-5d66-bc03f8510d42	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5627-58d0-47ad-0e3bac1e172d	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5627-58d0-486e-dacb32732eae	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5627-58d0-224f-3651ee016ac2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5627-58d0-c5e8-362ec8e3a303	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5627-58d0-83be-88b0ffe20b26	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5627-58d0-8ec0-83baa1fbf725	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5627-58d0-a779-81ed248c66b0	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5627-58d0-3248-c84be5120a05	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5627-58d0-206e-e51cf58eaead	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5627-58d0-773f-44a4f88e952e	Datoteka-write	Datoteka - spreminjanje	f
00030000-5627-58d0-d6ee-36a2dbc6df0f	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3062 (class 0 OID 22818071)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5627-58d0-6434-4e977d7efc8f	00030000-5627-58d0-2cd3-a84fb6bbdb97
00020000-5627-58d0-cc0f-f5b65608b186	00030000-5627-58d0-b673-41b2c84066d4
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-f727-0f0bb071b4b9
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-15f7-fe6215070537
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-1456-e03850e9ef66
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-b1d6-1bee743d640f
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-d49e-3e439467a147
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-f30f-686f61831304
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-3c03-5b3deff27c92
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-a2d2-0bc9019630df
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-b673-41b2c84066d4
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-c0ea-b65abdadbe74
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-554b-6eba67a1e784
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-6bc8-a481211abde9
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-3318-16b28a3da217
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-607a-a884bb482c78
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-3b56-d104f07c9ae4
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-2317-214e609e3741
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-21ec-d99954909c72
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-89ae-dacb5f2f8407
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-eb02-7a212ebc9772
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-cec7-7da33732dec1
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-6436-307d9f4300d4
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-1ffb-e0060b0a2a83
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-e073-ff27cade4ad5
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-f136-08541a80ce6b
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-2944-37cbfa9adf1a
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-316c-905e618773c5
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-71bf-f90b4a9d0e0e
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-c267-f7cbd21028c9
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-9468-a15a8fe2f13f
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-fbab-f8df4724a955
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-3532-00469fb4d5fd
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-f564-a2fcbcec57b9
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-5958-f10efa846662
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-2156-a08535bab974
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-c50e-328ede27ed2c
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-db2d-615087305d4b
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-a089-91e8b936dc9c
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-c775-25cdc8f54810
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-1156-7a1420c6e5ca
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-29fd-d708187946a7
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-5557-562b3cbf5c70
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-23ec-22de1b1dd131
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-4e3b-4aa98481358e
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-47ba-5c46feadb812
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-f3b2-f45486528bb0
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-f8cd-644ba119b16f
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-c761-8265e688d372
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-e51e-e84cc7db484a
00020000-5627-58d0-8457-557cae54ea42	00030000-5627-58d0-17b5-2a18698db647
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-f727-0f0bb071b4b9
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-d49e-3e439467a147
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-f30f-686f61831304
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-b673-41b2c84066d4
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-3318-16b28a3da217
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-3b56-d104f07c9ae4
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-21ec-d99954909c72
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-89ae-dacb5f2f8407
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-eb02-7a212ebc9772
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-cec7-7da33732dec1
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-6436-307d9f4300d4
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-1ffb-e0060b0a2a83
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-e073-ff27cade4ad5
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-2944-37cbfa9adf1a
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-71bf-f90b4a9d0e0e
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-c267-f7cbd21028c9
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-9468-a15a8fe2f13f
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-5958-f10efa846662
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-c50e-328ede27ed2c
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-a089-91e8b936dc9c
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-1156-7a1420c6e5ca
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-6417-40ad02143cde
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-2ff5-7ed6396d0d35
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-9874-b31dd1db28d2
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-c827-1fa1b428d119
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-2317-cdbe6da480a1
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-5132-9a96eea592d5
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-e51e-e84cc7db484a
00020000-5627-58d0-b3d6-3a816cb84c0f	00030000-5627-58d0-17b5-2a18698db647
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-f727-0f0bb071b4b9
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-1456-e03850e9ef66
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-d49e-3e439467a147
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-3613-a0b7956177bf
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-bc41-615dc1029b66
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-15e7-1a89721fd829
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-f30f-686f61831304
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-b673-41b2c84066d4
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-554b-6eba67a1e784
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-3318-16b28a3da217
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-3b56-d104f07c9ae4
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-21ec-d99954909c72
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-eb02-7a212ebc9772
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-cec7-7da33732dec1
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-6436-307d9f4300d4
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-e073-ff27cade4ad5
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-2944-37cbfa9adf1a
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-9468-a15a8fe2f13f
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-3532-00469fb4d5fd
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-5958-f10efa846662
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-c50e-328ede27ed2c
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-a089-91e8b936dc9c
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-1156-7a1420c6e5ca
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-5557-562b3cbf5c70
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-47ba-5c46feadb812
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-f8cd-644ba119b16f
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-e51e-e84cc7db484a
00020000-5627-58d0-1f6d-057474fce061	00030000-5627-58d0-17b5-2a18698db647
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-f727-0f0bb071b4b9
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-15f7-fe6215070537
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-b1d6-1bee743d640f
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-d49e-3e439467a147
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-f30f-686f61831304
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-b673-41b2c84066d4
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-3318-16b28a3da217
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-3b56-d104f07c9ae4
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-eb02-7a212ebc9772
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-cec7-7da33732dec1
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-e073-ff27cade4ad5
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-2944-37cbfa9adf1a
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-9468-a15a8fe2f13f
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-5958-f10efa846662
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-c50e-328ede27ed2c
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-a089-91e8b936dc9c
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-1156-7a1420c6e5ca
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-5557-562b3cbf5c70
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-e51e-e84cc7db484a
00020000-5627-58d0-0563-175b3f5197d3	00030000-5627-58d0-17b5-2a18698db647
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-f727-0f0bb071b4b9
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-d49e-3e439467a147
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-f30f-686f61831304
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-b673-41b2c84066d4
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-3318-16b28a3da217
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-3b56-d104f07c9ae4
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-eb02-7a212ebc9772
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-cec7-7da33732dec1
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-e073-ff27cade4ad5
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-2944-37cbfa9adf1a
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-9468-a15a8fe2f13f
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-5958-f10efa846662
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-c50e-328ede27ed2c
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-a089-91e8b936dc9c
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-1156-7a1420c6e5ca
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-9059-984fea7d2c8e
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-b563-79d5add9dd6f
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-5557-562b3cbf5c70
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-e51e-e84cc7db484a
00020000-5627-58d0-3508-708e17d7d9b0	00030000-5627-58d0-17b5-2a18698db647
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-4a37-3f4c578babc9
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2cd3-a84fb6bbdb97
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f727-0f0bb071b4b9
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-15f7-fe6215070537
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-1456-e03850e9ef66
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b1d6-1bee743d640f
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-d49e-3e439467a147
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-3613-a0b7956177bf
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-083c-a298699c6c2e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-edb1-eade1c577bc8
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-bc41-615dc1029b66
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-19b2-6afe236d3668
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-15e7-1a89721fd829
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b02d-8a06e675baa0
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f30f-686f61831304
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-3c03-5b3deff27c92
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-a2d2-0bc9019630df
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-ed76-b75aa839c8d3
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-bf9a-7b96f36b9427
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b673-41b2c84066d4
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-c0ea-b65abdadbe74
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-8d1f-ea0f1d86abf5
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6c2f-83a051173ecf
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-554b-6eba67a1e784
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6bc8-a481211abde9
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-3318-16b28a3da217
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-607a-a884bb482c78
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-3b56-d104f07c9ae4
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2317-214e609e3741
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-21ec-d99954909c72
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-89ae-dacb5f2f8407
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-a744-9d479c7ec3dd
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-1748-790033c4005e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-befe-ef254bd29e9a
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-3333-e9e415d81858
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-eb02-7a212ebc9772
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-cec7-7da33732dec1
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-ce57-4067b9ddd959
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-8544-37b58fba5a0a
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b8b0-4b923973fbc6
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-7129-737ca227455e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6436-307d9f4300d4
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-522a-84b301213cf8
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-1ffb-e0060b0a2a83
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-105e-38a507f73162
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-c373-bd54c9ddda25
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-84af-dd4d9475f2eb
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-d782-07741b742c40
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-843f-6c641886538c
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-83d4-e4608fe3a912
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-e073-ff27cade4ad5
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f136-08541a80ce6b
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2944-37cbfa9adf1a
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-089a-2d885d6a7ca8
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-e241-d8e417522f4d
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-8b25-9f354bb3d826
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-07a8-f77b0640776e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-316c-905e618773c5
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-71bf-f90b4a9d0e0e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-c267-f7cbd21028c9
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-a4ff-254576194013
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b2ee-f706fb96b0ff
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9468-a15a8fe2f13f
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-fbab-f8df4724a955
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-afe7-e87cfdd77556
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-ce6d-2bd544aca318
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-40fd-d12c65792bde
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-267f-120cbbe37d97
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-3532-00469fb4d5fd
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f564-a2fcbcec57b9
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9190-66c6c42d311b
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-200d-69cc63a5788c
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-789d-00f4a19b8a1d
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9567-64ae366e96ad
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-5643-43483f35f7de
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-be15-57875792e1d0
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-0a7b-9c1f9217641e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-28e5-2f8c4d6e90a2
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b5f0-856d2a682fe8
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-0fe7-27d29caf92cc
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9f95-f0e382cbf690
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9f6d-21e75b1dd231
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-477b-1ade2daefe8e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2db3-4fb44f388150
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-7dbb-152059e01418
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-e9d7-d554bb558f9a
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6897-eb185021b376
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-41a8-e6d786cb1894
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-45b6-9e5a95b24e2c
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-1594-5ab327cf20ed
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-7789-e24232d147c9
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-bf0a-77606cf0bb7b
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-5958-f10efa846662
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2156-a08535bab974
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-a89a-733504977933
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b37c-8cff26125331
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f7f0-9085271ad617
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-76c6-e22e3dc9f396
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-c50e-328ede27ed2c
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-db2d-615087305d4b
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-a089-91e8b936dc9c
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-c775-25cdc8f54810
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-343d-a7fc6935e6d3
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b2f1-cfbf81f8b3c5
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6ba4-84730262a7b2
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-aa24-3fa4e8434683
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-da96-6b270abb2d53
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-edbc-3c40275033cb
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-7651-1477df387913
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-63ce-1185825319af
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-1156-7a1420c6e5ca
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-29fd-d708187946a7
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f8b7-a05cbc7fa28f
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-5159-363dc8eeb0b0
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9d33-5bf75b8b33c7
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-81b7-981d8cf7b5eb
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f7a1-c5fd107496b3
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2162-4086140ed038
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-99a9-741d5f293214
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-7f05-28f3950f0b8e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6417-40ad02143cde
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2ff5-7ed6396d0d35
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9059-984fea7d2c8e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b563-79d5add9dd6f
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-1373-45691965839e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-5557-562b3cbf5c70
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-34a1-017e0487be27
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-8c41-284e6b6183bd
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-b222-c191dd8ddedd
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-d34b-9e8f782cad60
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-0292-71fca990f154
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-e635-88408a610580
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-06b0-0de7c60c4bf7
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-9874-b31dd1db28d2
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-c827-1fa1b428d119
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-23ec-22de1b1dd131
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-4e3b-4aa98481358e
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-47ba-5c46feadb812
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f3b2-f45486528bb0
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-946f-d70b0397ff20
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6bb0-b2d7a8e4323f
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-6e76-037af84bc930
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-ca56-228594ee585d
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2317-cdbe6da480a1
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-5132-9a96eea592d5
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-f8cd-644ba119b16f
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-c761-8265e688d372
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-e51e-e84cc7db484a
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-1333-34f24b042c06
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-17b5-2a18698db647
00020000-5627-58d1-f4dd-cb7c8153ccb1	00030000-5627-58d0-2c6c-6de058f50984
\.


--
-- TOC entry 3096 (class 0 OID 22818444)
-- Dependencies: 214
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22818478)
-- Dependencies: 218
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 22818615)
-- Dependencies: 230
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5627-58d1-a981-33a232f67dd8	00090000-5627-58d1-ccf3-9c7e2f5059f2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5627-58d1-7e6a-efe9be80ce6d	00090000-5627-58d1-5133-664e98fd4b9c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5627-58d1-3329-f684e034fa37	00090000-5627-58d1-db90-aa85811d1196	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5627-58d1-0bc1-727cc9c4b4f9	00090000-5627-58d1-51f2-f95ce10d5b22	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3068 (class 0 OID 22818141)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5627-58d1-3a01-2e490f9a7af8	\N	00040000-5627-58cf-a5c9-3bf4386b348f	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d1-e157-fb8c7a514a00	\N	00040000-5627-58cf-a5c9-3bf4386b348f	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5627-58d1-22d1-6d5b256be2ab	\N	00040000-5627-58cf-a5c9-3bf4386b348f	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d1-6908-93f3d0294a2c	\N	00040000-5627-58cf-a5c9-3bf4386b348f	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d1-afb4-d251830e51fc	\N	00040000-5627-58cf-a5c9-3bf4386b348f	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d1-593a-48c29a4c76e4	\N	00040000-5627-58cf-992b-71943ed4074d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d1-2bd8-ad4b4491f1bb	\N	00040000-5627-58cf-b0a1-c6b0ee7fdf1a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d1-fb07-b3e71b4466ba	\N	00040000-5627-58cf-777e-696ff7888683	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d1-a492-b9ed4ce8f3e5	\N	00040000-5627-58cf-1559-0c48fa341c61	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-58d3-f650-73e179ad7bb4	\N	00040000-5627-58cf-a5c9-3bf4386b348f	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3071 (class 0 OID 22818187)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5627-58cf-4620-45d854f282f6	8341	Adlešiči
00050000-5627-58cf-59f8-b9bb4b9096d4	5270	Ajdovščina
00050000-5627-58cf-4456-491c0b22321e	6280	Ankaran/Ancarano
00050000-5627-58cf-d2ed-f9fc105d1155	9253	Apače
00050000-5627-58cf-e465-d4683dff470d	8253	Artiče
00050000-5627-58cf-9148-1956f10f3ea8	4275	Begunje na Gorenjskem
00050000-5627-58cf-abbf-d47b8979b756	1382	Begunje pri Cerknici
00050000-5627-58cf-3c34-8d5d15d6be8c	9231	Beltinci
00050000-5627-58cf-f329-f0fbcf709887	2234	Benedikt
00050000-5627-58cf-cc1c-28b44b0d0977	2345	Bistrica ob Dravi
00050000-5627-58cf-271e-82c4946e7c4f	3256	Bistrica ob Sotli
00050000-5627-58cf-d793-e89b46d95e96	8259	Bizeljsko
00050000-5627-58cf-80ca-4fa339b6e981	1223	Blagovica
00050000-5627-58cf-609a-c118861ec6a9	8283	Blanca
00050000-5627-58cf-d03c-e18da2ad05d5	4260	Bled
00050000-5627-58cf-3b76-c55ec61eb547	4273	Blejska Dobrava
00050000-5627-58cf-bc3f-528f27a1ebb4	9265	Bodonci
00050000-5627-58cf-c286-e1fe5556d231	9222	Bogojina
00050000-5627-58cf-b086-7fe9dbeab824	4263	Bohinjska Bela
00050000-5627-58cf-ca19-72cdd18f921a	4264	Bohinjska Bistrica
00050000-5627-58cf-0445-b81a74d9eb36	4265	Bohinjsko jezero
00050000-5627-58cf-802b-421ff36763d2	1353	Borovnica
00050000-5627-58cf-f2c2-fdaac269631b	8294	Boštanj
00050000-5627-58cf-e8dc-24beaeab69ea	5230	Bovec
00050000-5627-58cf-8482-1e09b9462823	5295	Branik
00050000-5627-58cf-cef3-58f57a94e21d	3314	Braslovče
00050000-5627-58cf-396b-8f7688f0de0d	5223	Breginj
00050000-5627-58cf-5b0a-55aedc1959ae	8280	Brestanica
00050000-5627-58cf-d85e-1bce8c4c0448	2354	Bresternica
00050000-5627-58cf-f494-ffb61abaabe5	4243	Brezje
00050000-5627-58cf-cf52-80a8fa49cebc	1351	Brezovica pri Ljubljani
00050000-5627-58cf-68bd-ccfb37caab86	8250	Brežice
00050000-5627-58cf-1bbc-e93ff1f76d6c	4210	Brnik - Aerodrom
00050000-5627-58cf-1bb4-b1c8ff546c7f	8321	Brusnice
00050000-5627-58cf-f9f7-bbcf80437768	3255	Buče
00050000-5627-58cf-ed38-e23969cf74ec	8276	Bučka 
00050000-5627-58cf-e79c-c34791ea29e7	9261	Cankova
00050000-5627-58cf-fe4f-c38e81539a38	3000	Celje 
00050000-5627-58cf-a9e2-cecc9ccc8d5c	3001	Celje - poštni predali
00050000-5627-58cf-f8b3-ce340b1f67e0	4207	Cerklje na Gorenjskem
00050000-5627-58cf-9c8e-e77bf7a0e130	8263	Cerklje ob Krki
00050000-5627-58cf-19ee-be6312a6113c	1380	Cerknica
00050000-5627-58cf-2fe0-72c6d4d4af29	5282	Cerkno
00050000-5627-58cf-5e5c-f15974455dc6	2236	Cerkvenjak
00050000-5627-58cf-2f21-bbbae165aeeb	2215	Ceršak
00050000-5627-58cf-3982-61237ac41dce	2326	Cirkovce
00050000-5627-58cf-0867-513849c86de6	2282	Cirkulane
00050000-5627-58cf-ea07-fe254684aa8b	5273	Col
00050000-5627-58cf-dfaf-0032bd1b1b31	8251	Čatež ob Savi
00050000-5627-58cf-81f3-df831a7805df	1413	Čemšenik
00050000-5627-58cf-adaf-f6a96582aecc	5253	Čepovan
00050000-5627-58cf-9b3d-2e147992a406	9232	Črenšovci
00050000-5627-58cf-8054-2eee3ad75725	2393	Črna na Koroškem
00050000-5627-58cf-ef54-7ccb54328f29	6275	Črni Kal
00050000-5627-58cf-036d-9bece675ccf2	5274	Črni Vrh nad Idrijo
00050000-5627-58cf-12b3-c7156048c267	5262	Črniče
00050000-5627-58cf-7cf7-da8db4ac462f	8340	Črnomelj
00050000-5627-58cf-f069-655bfbd84e32	6271	Dekani
00050000-5627-58cf-12ac-5cbadc01fbe0	5210	Deskle
00050000-5627-58cf-7914-b29482e2f656	2253	Destrnik
00050000-5627-58cf-1256-0b14bfeee1c7	6215	Divača
00050000-5627-58cf-9914-ae02e3892f8b	1233	Dob
00050000-5627-58cf-79d7-079af2d03d80	3224	Dobje pri Planini
00050000-5627-58cf-6ccb-51a05b09d284	8257	Dobova
00050000-5627-58cf-a886-ac91a3e8372d	1423	Dobovec
00050000-5627-58cf-e50f-04d6c2c166d4	5263	Dobravlje
00050000-5627-58cf-a739-c1d4209b66d7	3204	Dobrna
00050000-5627-58cf-12e3-5a8b0f3a731b	8211	Dobrnič
00050000-5627-58cf-21dd-ca18de54156b	1356	Dobrova
00050000-5627-58cf-4e4c-3b7c5dbf3327	9223	Dobrovnik/Dobronak 
00050000-5627-58cf-9755-bb0a885f31e7	5212	Dobrovo v Brdih
00050000-5627-58cf-20fb-c86d79d88bd3	1431	Dol pri Hrastniku
00050000-5627-58cf-0e68-d2eed39a95e2	1262	Dol pri Ljubljani
00050000-5627-58cf-c99e-584fb7dd875b	1273	Dole pri Litiji
00050000-5627-58cf-05a9-a72e1faa7cbb	1331	Dolenja vas
00050000-5627-58cf-0fd2-30391e81dd0e	8350	Dolenjske Toplice
00050000-5627-58cf-aab9-b5276200dcac	1230	Domžale
00050000-5627-58cf-06a5-3c57cf4ecda1	2252	Dornava
00050000-5627-58cf-6e70-01f1e2ab13ac	5294	Dornberk
00050000-5627-58cf-9c5b-3fbb4249cefc	1319	Draga
00050000-5627-58cf-ee53-44d443cb8927	8343	Dragatuš
00050000-5627-58cf-e159-b4e7978b2319	3222	Dramlje
00050000-5627-58cf-ae64-85f8569206fb	2370	Dravograd
00050000-5627-58cf-68c1-34b4c32e7942	4203	Duplje
00050000-5627-58cf-f704-c72e107bd71c	6221	Dutovlje
00050000-5627-58cf-7ca3-423fb900fedf	8361	Dvor
00050000-5627-58cf-709b-5dc3dde9f73b	2343	Fala
00050000-5627-58cf-f3b2-4b5c6f94edb4	9208	Fokovci
00050000-5627-58cf-fe70-4ad6e25e8e03	2313	Fram
00050000-5627-58cf-c243-c59f3c52359d	3213	Frankolovo
00050000-5627-58cf-a12b-962836314e58	1274	Gabrovka
00050000-5627-58cf-bbb7-4909ccd85f59	8254	Globoko
00050000-5627-58cf-164c-9f5a74aeaa98	5275	Godovič
00050000-5627-58cf-a838-a0196e9cc570	4204	Golnik
00050000-5627-58cf-2857-604ffcb98dd5	3303	Gomilsko
00050000-5627-58cf-7208-e5a677799612	4224	Gorenja vas
00050000-5627-58cf-5472-96379ced516b	3263	Gorica pri Slivnici
00050000-5627-58cf-7914-4f49be3825e5	2272	Gorišnica
00050000-5627-58cf-644c-ac5049f13f4f	9250	Gornja Radgona
00050000-5627-58cf-eaa2-daba0ea2918c	3342	Gornji Grad
00050000-5627-58cf-aea2-90076a438828	4282	Gozd Martuljek
00050000-5627-58cf-e66d-ed3bce2f78f3	6272	Gračišče
00050000-5627-58cf-fd3e-2029551860fb	9264	Grad
00050000-5627-58cf-fda3-b99640524830	8332	Gradac
00050000-5627-58cf-94a5-558ab909b88f	1384	Grahovo
00050000-5627-58cf-549f-bd18afbc4233	5242	Grahovo ob Bači
00050000-5627-58cf-1532-64cc3428934b	5251	Grgar
00050000-5627-58cf-80c8-9b752f31999e	3302	Griže
00050000-5627-58cf-9caf-016523b3d91e	3231	Grobelno
00050000-5627-58cf-b888-231f2a363755	1290	Grosuplje
00050000-5627-58cf-5577-0d117ecbbc73	2288	Hajdina
00050000-5627-58cf-1eb0-dbc8ae7e3042	8362	Hinje
00050000-5627-58cf-ff8e-1307155d5bda	2311	Hoče
00050000-5627-58cf-84d1-fe887c13d9f4	9205	Hodoš/Hodos
00050000-5627-58cf-f35c-1d1bf2ed3fa2	1354	Horjul
00050000-5627-58cf-0a99-6c2501e91e28	1372	Hotedršica
00050000-5627-58cf-5e25-acd1b67d94ae	1430	Hrastnik
00050000-5627-58cf-6322-c87892fb13a0	6225	Hruševje
00050000-5627-58cf-ce01-5702b5b59fce	4276	Hrušica
00050000-5627-58cf-bad4-292269898563	5280	Idrija
00050000-5627-58cf-8f88-fb2cb3952b4e	1292	Ig
00050000-5627-58cf-10ee-1aeaec800e42	6250	Ilirska Bistrica
00050000-5627-58cf-0cad-1f1e2fb1506f	6251	Ilirska Bistrica-Trnovo
00050000-5627-58cf-3d28-64fd45e58276	1295	Ivančna Gorica
00050000-5627-58cf-b20b-0db8572c2491	2259	Ivanjkovci
00050000-5627-58cf-f47a-7caf4f691556	1411	Izlake
00050000-5627-58cf-8906-444dac79291d	6310	Izola/Isola
00050000-5627-58cf-6b2c-4affed2c7cd8	2222	Jakobski Dol
00050000-5627-58cf-87fa-233043947bc5	2221	Jarenina
00050000-5627-58cf-a13c-7b128d6cdba1	6254	Jelšane
00050000-5627-58cf-4d7b-1160777bdad0	4270	Jesenice
00050000-5627-58cf-efa8-52514de77845	8261	Jesenice na Dolenjskem
00050000-5627-58cf-f842-0e99ad793e4c	3273	Jurklošter
00050000-5627-58cf-0f4f-170bcb4df7c5	2223	Jurovski Dol
00050000-5627-58cf-5a3b-f91a126b0036	2256	Juršinci
00050000-5627-58cf-87da-cf0699f785c5	5214	Kal nad Kanalom
00050000-5627-58cf-faa3-788593350322	3233	Kalobje
00050000-5627-58cf-4cf1-aebf09fe0125	4246	Kamna Gorica
00050000-5627-58cf-db33-6c9b584cc058	2351	Kamnica
00050000-5627-58cf-65ca-ec2a5aac2ce1	1241	Kamnik
00050000-5627-58cf-3653-9249e2814455	5213	Kanal
00050000-5627-58cf-144d-6927d2224db1	8258	Kapele
00050000-5627-58cf-a657-83e5df043ec2	2362	Kapla
00050000-5627-58cf-cecc-5f106e13b9ef	2325	Kidričevo
00050000-5627-58cf-3a4c-c90eb8b000e7	1412	Kisovec
00050000-5627-58cf-e0d7-0b2f115c6654	6253	Knežak
00050000-5627-58cf-602d-172a9d73c2a1	5222	Kobarid
00050000-5627-58cf-0868-533517bac855	9227	Kobilje
00050000-5627-58cf-d128-166dcff14806	1330	Kočevje
00050000-5627-58cf-0619-2a5e34f594ac	1338	Kočevska Reka
00050000-5627-58cf-898c-694620b8e543	2276	Kog
00050000-5627-58cf-9eb4-5bcf5a655f14	5211	Kojsko
00050000-5627-58cf-f7dd-d2148b79d44d	6223	Komen
00050000-5627-58cf-f384-c465487c5b76	1218	Komenda
00050000-5627-58cf-2a0f-ebbd8840230c	6000	Koper/Capodistria 
00050000-5627-58cf-6365-35868d077159	6001	Koper/Capodistria - poštni predali
00050000-5627-58cf-bea4-2d8a089f39e1	8282	Koprivnica
00050000-5627-58cf-3668-558bffa1360a	5296	Kostanjevica na Krasu
00050000-5627-58cf-faf2-111456c8253c	8311	Kostanjevica na Krki
00050000-5627-58cf-f5f0-c4944e1d5053	1336	Kostel
00050000-5627-58cf-b3f0-704f20b37ca7	6256	Košana
00050000-5627-58cf-d955-9f4f5df434de	2394	Kotlje
00050000-5627-58cf-c3b7-d48a5efd58c8	6240	Kozina
00050000-5627-58cf-29c4-6997161e33ba	3260	Kozje
00050000-5627-58cf-1370-a355c683ea86	4000	Kranj 
00050000-5627-58cf-0f7c-3d5d5a3fed0b	4001	Kranj - poštni predali
00050000-5627-58cf-261c-e96fa4d412d8	4280	Kranjska Gora
00050000-5627-58cf-216f-2dc199b561f2	1281	Kresnice
00050000-5627-58cf-d8a5-d6d70a58cb87	4294	Križe
00050000-5627-58cf-61d5-bca19515c8c0	9206	Križevci
00050000-5627-58cf-3fe4-60390c961f16	9242	Križevci pri Ljutomeru
00050000-5627-58cf-0495-62c1c9c1efd9	1301	Krka
00050000-5627-58cf-f49b-ece1a4914211	8296	Krmelj
00050000-5627-58cf-25d7-98684d268bb0	4245	Kropa
00050000-5627-58cf-2b76-2f28d8f4db06	8262	Krška vas
00050000-5627-58cf-4a4c-4674df75564f	8270	Krško
00050000-5627-58cf-77ea-441058b725de	9263	Kuzma
00050000-5627-58cf-7564-89a1d876faba	2318	Laporje
00050000-5627-58cf-28d9-133c25134a4d	3270	Laško
00050000-5627-58cf-84ba-885197f5ed66	1219	Laze v Tuhinju
00050000-5627-58cf-ac93-dd05875b8b41	2230	Lenart v Slovenskih goricah
00050000-5627-58cf-6e49-0c6fc12aee19	9220	Lendava/Lendva
00050000-5627-58cf-1108-ca7792be234b	4248	Lesce
00050000-5627-58cf-3650-833b4c1f7893	3261	Lesično
00050000-5627-58cf-8987-7c562e761b7c	8273	Leskovec pri Krškem
00050000-5627-58cf-a161-cd8c5de4a600	2372	Libeliče
00050000-5627-58cf-f358-16efdfe97e5c	2341	Limbuš
00050000-5627-58cf-75d8-a41a56acdd19	1270	Litija
00050000-5627-58cf-1f0f-156cadefa26a	3202	Ljubečna
00050000-5627-58cf-7d81-097770c6a034	1000	Ljubljana 
00050000-5627-58cf-4697-1a275d2cf0fd	1001	Ljubljana - poštni predali
00050000-5627-58cf-d5dd-9bb6af331689	1231	Ljubljana - Črnuče
00050000-5627-58cf-3ada-d4bee4b0d4ad	1261	Ljubljana - Dobrunje
00050000-5627-58cf-39e4-d47ab42559cd	1260	Ljubljana - Polje
00050000-5627-58cf-0206-0193f58037b3	1210	Ljubljana - Šentvid
00050000-5627-58cf-df17-6eb95887e433	1211	Ljubljana - Šmartno
00050000-5627-58cf-6f9e-cf74e649f95e	3333	Ljubno ob Savinji
00050000-5627-58cf-8508-c911b1357cce	9240	Ljutomer
00050000-5627-58cf-7461-696700207eed	3215	Loče
00050000-5627-58cf-be45-53b8097f54c8	5231	Log pod Mangartom
00050000-5627-58cf-dd8c-c5f6c6083f17	1358	Log pri Brezovici
00050000-5627-58cf-7a4f-6a98c898cea3	1370	Logatec
00050000-5627-58cf-0cc4-a1d22a3a9461	1371	Logatec
00050000-5627-58cf-abb6-8a5dad6696e0	1434	Loka pri Zidanem Mostu
00050000-5627-58cf-7f16-0045c8175db8	3223	Loka pri Žusmu
00050000-5627-58cf-18d3-f5ecbdfbcc79	6219	Lokev
00050000-5627-58cf-c9b8-0714fbf9d54f	1318	Loški Potok
00050000-5627-58cf-036b-0a56cfeba07f	2324	Lovrenc na Dravskem polju
00050000-5627-58cf-f1c4-45b71542fda5	2344	Lovrenc na Pohorju
00050000-5627-58cf-38da-2f04c8dfb4a4	3334	Luče
00050000-5627-58cf-fa2f-55aabc031f80	1225	Lukovica
00050000-5627-58cf-aafc-de1add2348ec	9202	Mačkovci
00050000-5627-58cf-fa3e-4f75e8c0d7c7	2322	Majšperk
00050000-5627-58cf-448d-4abbcdb0396e	2321	Makole
00050000-5627-58cf-6352-f53b1cf7b530	9243	Mala Nedelja
00050000-5627-58cf-552b-ec8f29877e8d	2229	Malečnik
00050000-5627-58cf-252f-45be4a359a09	6273	Marezige
00050000-5627-58cf-ffee-a7437b2851a4	2000	Maribor 
00050000-5627-58cf-d5ea-1effec7d82eb	2001	Maribor - poštni predali
00050000-5627-58cf-f4bd-15282fe1a3e0	2206	Marjeta na Dravskem polju
00050000-5627-58cf-db64-145c4784ff66	2281	Markovci
00050000-5627-58cf-d273-090be9976f3c	9221	Martjanci
00050000-5627-58cf-66ed-20c2fb8b88d3	6242	Materija
00050000-5627-58cf-8348-4beae7160e7d	4211	Mavčiče
00050000-5627-58cf-8bff-6157f7564708	1215	Medvode
00050000-5627-58cf-59dc-0d6d4ccd099f	1234	Mengeš
00050000-5627-58cf-1f04-a6ec811f27a3	8330	Metlika
00050000-5627-58cf-b702-1848a2f6fba5	2392	Mežica
00050000-5627-58cf-a86e-172b25569bad	2204	Miklavž na Dravskem polju
00050000-5627-58cf-cdd5-8186fd2a7eea	2275	Miklavž pri Ormožu
00050000-5627-58cf-4349-72e521b7c74c	5291	Miren
00050000-5627-58cf-b364-5404612e281b	8233	Mirna
00050000-5627-58cf-6951-88a7ae7d71b7	8216	Mirna Peč
00050000-5627-58cf-e436-31dd1926473e	2382	Mislinja
00050000-5627-58cf-43b5-593ce242d511	4281	Mojstrana
00050000-5627-58cf-5511-dfa2581a9e75	8230	Mokronog
00050000-5627-58cf-bfe5-fa41010e0da7	1251	Moravče
00050000-5627-58cf-77f5-366e0f18d7d1	9226	Moravske Toplice
00050000-5627-58cf-95b5-0c298e71b79c	5216	Most na Soči
00050000-5627-58cf-36f0-37752fbe9a57	1221	Motnik
00050000-5627-58cf-0e24-6dfebd8dfbdf	3330	Mozirje
00050000-5627-58cf-6b47-80748e947893	9000	Murska Sobota 
00050000-5627-58cf-39f5-1074c112ce00	9001	Murska Sobota - poštni predali
00050000-5627-58cf-98c6-a6c13b313443	2366	Muta
00050000-5627-58cf-aff8-959d7a2223ce	4202	Naklo
00050000-5627-58cf-c964-548e52efd97e	3331	Nazarje
00050000-5627-58cf-613c-f7bd897d371c	1357	Notranje Gorice
00050000-5627-58cf-0c52-588baea96bb6	3203	Nova Cerkev
00050000-5627-58cf-670b-285f60330197	5000	Nova Gorica 
00050000-5627-58cf-2179-ef475ac57b51	5001	Nova Gorica - poštni predali
00050000-5627-58cf-4169-a02b750f126c	1385	Nova vas
00050000-5627-58cf-7458-0c5f0eb76b76	8000	Novo mesto
00050000-5627-58cf-c2d5-6ced07adef43	8001	Novo mesto - poštni predali
00050000-5627-58cf-7327-3d369077858e	6243	Obrov
00050000-5627-58cf-848d-649920400eca	9233	Odranci
00050000-5627-58cf-a4b0-152df1197a27	2317	Oplotnica
00050000-5627-58cf-9124-97a7183fb409	2312	Orehova vas
00050000-5627-58cf-54ed-5a206825de37	2270	Ormož
00050000-5627-58cf-65c5-ca620ad1efa1	1316	Ortnek
00050000-5627-58cf-c84d-bf35d68c13a2	1337	Osilnica
00050000-5627-58cf-975c-0eaacd1a88f6	8222	Otočec
00050000-5627-58cf-2a22-4c3b9c7014fe	2361	Ožbalt
00050000-5627-58cf-42fc-a71bc778a648	2231	Pernica
00050000-5627-58cf-6855-bc364a11d092	2211	Pesnica pri Mariboru
00050000-5627-58cf-02c5-efc7c4938625	9203	Petrovci
00050000-5627-58cf-557f-a768548f3dae	3301	Petrovče
00050000-5627-58cf-f6d7-9eadb0062200	6330	Piran/Pirano
00050000-5627-58cf-5c3f-8e0dc6005b23	8255	Pišece
00050000-5627-58cf-7da3-ac3d664d2a5c	6257	Pivka
00050000-5627-58cf-ba79-dbdbbe13e5ed	6232	Planina
00050000-5627-58cf-65b2-b073aa450b99	3225	Planina pri Sevnici
00050000-5627-58cf-8859-a1ba9f9a6733	6276	Pobegi
00050000-5627-58cf-39ab-00f13286d3c6	8312	Podbočje
00050000-5627-58cf-fd6d-b42feae5b3b6	5243	Podbrdo
00050000-5627-58cf-fa02-757cb329c837	3254	Podčetrtek
00050000-5627-58cf-0a98-5ee57e7f7f05	2273	Podgorci
00050000-5627-58cf-a741-502d3c175341	6216	Podgorje
00050000-5627-58cf-43de-ed35b7b7ed62	2381	Podgorje pri Slovenj Gradcu
00050000-5627-58cf-443c-ef93411cba9f	6244	Podgrad
00050000-5627-58cf-2b9c-e360f1febfa0	1414	Podkum
00050000-5627-58cf-0628-28c7ace6fe34	2286	Podlehnik
00050000-5627-58cf-d675-b743c500b468	5272	Podnanos
00050000-5627-58cf-7f65-79e56e6e3a8e	4244	Podnart
00050000-5627-58cf-4734-4c2e21b23e18	3241	Podplat
00050000-5627-58cf-5385-ee1a481ba74b	3257	Podsreda
00050000-5627-58cf-fca6-81ff16a05d99	2363	Podvelka
00050000-5627-58cf-6ede-32afc2f9b202	2208	Pohorje
00050000-5627-58cf-b869-e60347bf4560	2257	Polenšak
00050000-5627-58cf-31f5-6ba2ca643a8b	1355	Polhov Gradec
00050000-5627-58cf-f28b-b71a2a3e33e8	4223	Poljane nad Škofjo Loko
00050000-5627-58cf-17e7-8505d6ea08e2	2319	Poljčane
00050000-5627-58cf-57df-d01361ed267a	1272	Polšnik
00050000-5627-58cf-e7e9-2eb229b186a1	3313	Polzela
00050000-5627-58cf-dfec-3c194f35efa9	3232	Ponikva
00050000-5627-58cf-764e-45807129a807	6320	Portorož/Portorose
00050000-5627-58cf-178c-34578a37a744	6230	Postojna
00050000-5627-58cf-419d-ac641468e881	2331	Pragersko
00050000-5627-58cf-50a3-db00a115b172	3312	Prebold
00050000-5627-58cf-b2bc-14c0929bf1c6	4205	Preddvor
00050000-5627-58cf-a670-b7182a4a5f38	6255	Prem
00050000-5627-58cf-d0d9-804b1669308f	1352	Preserje
00050000-5627-58cf-f45b-67dbb3649afa	6258	Prestranek
00050000-5627-58cf-24ef-ca2bcf33cefb	2391	Prevalje
00050000-5627-58cf-1e02-bb1700a2ea0b	3262	Prevorje
00050000-5627-58cf-97fe-6cc0cb394a47	1276	Primskovo 
00050000-5627-58cf-8ad4-957a558079ec	3253	Pristava pri Mestinju
00050000-5627-58cf-14b4-40847814723b	9207	Prosenjakovci/Partosfalva
00050000-5627-58cf-9c33-2980c7da44a3	5297	Prvačina
00050000-5627-58cf-165d-8fb511dcb2e6	2250	Ptuj
00050000-5627-58cf-3988-3eeb5b8d4348	2323	Ptujska Gora
00050000-5627-58cf-c39f-106b2b087f08	9201	Puconci
00050000-5627-58cf-5e6d-738aaf93a29c	2327	Rače
00050000-5627-58cf-6380-7c888353a99d	1433	Radeče
00050000-5627-58cf-a999-3b1d99e4c45d	9252	Radenci
00050000-5627-58cf-7681-027237fa7596	2360	Radlje ob Dravi
00050000-5627-58cf-fa3c-73fe356eec66	1235	Radomlje
00050000-5627-58cf-3d83-024574c0fd53	4240	Radovljica
00050000-5627-58cf-4d98-163d74bc7bb9	8274	Raka
00050000-5627-58cf-bada-e5f513520502	1381	Rakek
00050000-5627-58cf-5142-7793b2503565	4283	Rateče - Planica
00050000-5627-58cf-bb9f-d2858323763c	2390	Ravne na Koroškem
00050000-5627-58cf-1fab-50d4c9408f4c	9246	Razkrižje
00050000-5627-58cf-799e-31ef0c7ce38d	3332	Rečica ob Savinji
00050000-5627-58cf-06e3-f20131be8d99	5292	Renče
00050000-5627-58cf-8e99-9fdcf31631c4	1310	Ribnica
00050000-5627-58cf-6291-b51023cdb512	2364	Ribnica na Pohorju
00050000-5627-58cf-7fd6-78959c68f9d9	3272	Rimske Toplice
00050000-5627-58cf-4819-4a71ebdcf711	1314	Rob
00050000-5627-58cf-1d0c-0d171eb80ede	5215	Ročinj
00050000-5627-58cf-df87-ae838b208064	3250	Rogaška Slatina
00050000-5627-58cf-8787-0f19e539bf63	9262	Rogašovci
00050000-5627-58cf-e829-da79883d6be5	3252	Rogatec
00050000-5627-58cf-aaab-1d8956bd4622	1373	Rovte
00050000-5627-58cf-b815-0512b8d5746b	2342	Ruše
00050000-5627-58cf-eb3b-d8d86f743839	1282	Sava
00050000-5627-58cf-31bc-78663e56adfa	6333	Sečovlje/Sicciole
00050000-5627-58cf-8f59-5da48cdcd738	4227	Selca
00050000-5627-58cf-6348-139f345d8d68	2352	Selnica ob Dravi
00050000-5627-58cf-e4f4-1b1e6bd3b2d6	8333	Semič
00050000-5627-58cf-9a6b-cc757773e78d	8281	Senovo
00050000-5627-58cf-b71c-1e369b0a67ce	6224	Senožeče
00050000-5627-58cf-23d8-9304dc823a97	8290	Sevnica
00050000-5627-58cf-3c92-4bae53192d9c	6210	Sežana
00050000-5627-58cf-7309-37083246feac	2214	Sladki Vrh
00050000-5627-58cf-a999-7fa81f1a535d	5283	Slap ob Idrijci
00050000-5627-58cf-15f0-788bf3d93a72	2380	Slovenj Gradec
00050000-5627-58cf-34c6-3b35076d4725	2310	Slovenska Bistrica
00050000-5627-58cf-0b9a-0c586b35de56	3210	Slovenske Konjice
00050000-5627-58cf-f3e7-f02b9c3238a9	1216	Smlednik
00050000-5627-58cf-3b39-08984a9bc6b0	5232	Soča
00050000-5627-58cf-7cf7-0a06bd7eaaf7	1317	Sodražica
00050000-5627-58cf-6181-6f564f46bbf4	3335	Solčava
00050000-5627-58cf-f7b7-d365c05bf088	5250	Solkan
00050000-5627-58cf-b1ab-0dbb39b3e4fb	4229	Sorica
00050000-5627-58cf-7de3-3175b572eb9d	4225	Sovodenj
00050000-5627-58cf-a297-a4a805168685	5281	Spodnja Idrija
00050000-5627-58cf-e8b5-73ef006018ed	2241	Spodnji Duplek
00050000-5627-58cf-b132-4bf5fa70a6be	9245	Spodnji Ivanjci
00050000-5627-58cf-1e41-53977a50baac	2277	Središče ob Dravi
00050000-5627-58cf-0af7-8b0c7f409fcf	4267	Srednja vas v Bohinju
00050000-5627-58cf-dec2-43fc88943673	8256	Sromlje 
00050000-5627-58cf-82de-ea93ad4be3d5	5224	Srpenica
00050000-5627-58cf-758f-f4ccba4341a1	1242	Stahovica
00050000-5627-58cf-eb36-f0fe5d19e478	1332	Stara Cerkev
00050000-5627-58cf-6f82-a6a07bb747d3	8342	Stari trg ob Kolpi
00050000-5627-58cf-e0e8-4b1285b979ac	1386	Stari trg pri Ložu
00050000-5627-58cf-1b29-4ba35047eab1	2205	Starše
00050000-5627-58cf-a74a-aef7355ccf2a	2289	Stoperce
00050000-5627-58cf-50f0-b09749d9b499	8322	Stopiče
00050000-5627-58cf-e95b-25f65912f3cb	3206	Stranice
00050000-5627-58cf-cd3d-f1b99a09d346	8351	Straža
00050000-5627-58cf-fb68-61d8820610dd	1313	Struge
00050000-5627-58cf-8a6f-be5f8cec58e1	8293	Studenec
00050000-5627-58cf-e37e-a234f5e22192	8331	Suhor
00050000-5627-58cf-11d3-67506303499a	2233	Sv. Ana v Slovenskih goricah
00050000-5627-58cf-fc7d-7c0c034caaf6	2235	Sv. Trojica v Slovenskih goricah
00050000-5627-58cf-8a9e-679af33cbe34	2353	Sveti Duh na Ostrem Vrhu
00050000-5627-58cf-702d-f74eea0cf79f	9244	Sveti Jurij ob Ščavnici
00050000-5627-58cf-02e1-3900ca0341aa	3264	Sveti Štefan
00050000-5627-58cf-11eb-8fdf0dbd6232	2258	Sveti Tomaž
00050000-5627-58cf-0184-df75b951b70e	9204	Šalovci
00050000-5627-58cf-a526-cb59e271e801	5261	Šempas
00050000-5627-58cf-8501-b9c710bc689c	5290	Šempeter pri Gorici
00050000-5627-58cf-02d7-038b2312323f	3311	Šempeter v Savinjski dolini
00050000-5627-58cf-6314-75ab22a18f0a	4208	Šenčur
00050000-5627-58cf-5a22-27bcb2b45af6	2212	Šentilj v Slovenskih goricah
00050000-5627-58cf-d89f-ca034e259e03	8297	Šentjanž
00050000-5627-58cf-7de3-55fe32e93df5	2373	Šentjanž pri Dravogradu
00050000-5627-58cf-971e-dc168442da72	8310	Šentjernej
00050000-5627-58cf-7ab2-545f02dcb5e1	3230	Šentjur
00050000-5627-58cf-7536-b624a9ce62bb	3271	Šentrupert
00050000-5627-58cf-bc42-0634ea7a17a4	8232	Šentrupert
00050000-5627-58cf-c756-be5c917c5cc7	1296	Šentvid pri Stični
00050000-5627-58cf-b848-1e172f0cfea0	8275	Škocjan
00050000-5627-58cf-73b1-bc126ffd1594	6281	Škofije
00050000-5627-58cf-8282-d9c2ad7c7cc3	4220	Škofja Loka
00050000-5627-58cf-cf24-11fd62a2257e	3211	Škofja vas
00050000-5627-58cf-734d-52b20633a50c	1291	Škofljica
00050000-5627-58cf-46e0-1d27ee5a3a4e	6274	Šmarje
00050000-5627-58cf-e35f-279cd7b9d2a1	1293	Šmarje - Sap
00050000-5627-58cf-f389-9d5ff69732e6	3240	Šmarje pri Jelšah
00050000-5627-58cf-be5d-14dd0ffb21d2	8220	Šmarješke Toplice
00050000-5627-58cf-4f9f-30dab2b2cb86	2315	Šmartno na Pohorju
00050000-5627-58cf-1b70-9c3775894c33	3341	Šmartno ob Dreti
00050000-5627-58cf-e9ed-83ef4f38a643	3327	Šmartno ob Paki
00050000-5627-58cf-0633-239c46976be6	1275	Šmartno pri Litiji
00050000-5627-58cf-2e80-41c0b8dec137	2383	Šmartno pri Slovenj Gradcu
00050000-5627-58cf-c807-8b89838eab92	3201	Šmartno v Rožni dolini
00050000-5627-58cf-878f-eaee3ea41472	3325	Šoštanj
00050000-5627-58cf-b377-caee38362e79	6222	Štanjel
00050000-5627-58cf-5589-7363ca40f5df	3220	Štore
00050000-5627-58cf-857d-698d5785f5ea	3304	Tabor
00050000-5627-58cf-8088-d18813873f1f	3221	Teharje
00050000-5627-58cf-9054-9f0a9c9bf0b4	9251	Tišina
00050000-5627-58cf-620e-2b2256ce3edb	5220	Tolmin
00050000-5627-58cf-381c-bb9960c95c2f	3326	Topolšica
00050000-5627-58cf-e9e4-5de810931c21	2371	Trbonje
00050000-5627-58cf-8753-949f59e44061	1420	Trbovlje
00050000-5627-58cf-c734-b17ef1c54b6e	8231	Trebelno 
00050000-5627-58cf-1f23-4d8b8ceec6ab	8210	Trebnje
00050000-5627-58cf-5f6d-de6a37fd346b	5252	Trnovo pri Gorici
00050000-5627-58cf-79ff-03fce49ece96	2254	Trnovska vas
00050000-5627-58cf-2f78-6f443fe0547b	1222	Trojane
00050000-5627-58cf-4a31-8fc5a0a8de73	1236	Trzin
00050000-5627-58cf-d052-20b57f646438	4290	Tržič
00050000-5627-58cf-7ee3-7f6978450a82	8295	Tržišče
00050000-5627-58cf-bc99-643e5c79f43e	1311	Turjak
00050000-5627-58cf-515c-747e7b3312e5	9224	Turnišče
00050000-5627-58cf-20e4-ad6920b94a2f	8323	Uršna sela
00050000-5627-58cf-985f-bd2758079d70	1252	Vače
00050000-5627-58cf-001e-6e5b40752db9	3320	Velenje 
00050000-5627-58cf-5bfe-197122a182ef	3322	Velenje - poštni predali
00050000-5627-58cf-fcbc-cf051fb06236	8212	Velika Loka
00050000-5627-58cf-bfb6-922af9765914	2274	Velika Nedelja
00050000-5627-58cf-2f6f-6198afff0ff1	9225	Velika Polana
00050000-5627-58cf-767d-1e2634978584	1315	Velike Lašče
00050000-5627-58cf-ccd4-9c6846336019	8213	Veliki Gaber
00050000-5627-58cf-a2b8-2852256d73e4	9241	Veržej
00050000-5627-58cf-ff9d-4457234a8c88	1312	Videm - Dobrepolje
00050000-5627-58cf-0fe4-b14a972bed8c	2284	Videm pri Ptuju
00050000-5627-58cf-d9ae-241cba8743fe	8344	Vinica
00050000-5627-58cf-e9fa-10bc7c4a11ed	5271	Vipava
00050000-5627-58cf-5baa-3227a5ac6599	4212	Visoko
00050000-5627-58cf-0757-92bdf09c8ff6	1294	Višnja Gora
00050000-5627-58cf-cede-0a1524df61a3	3205	Vitanje
00050000-5627-58cf-d22c-88de7032b04f	2255	Vitomarci
00050000-5627-58cf-55d2-81a7cf357ea6	1217	Vodice
00050000-5627-58cf-84e3-868eb964f214	3212	Vojnik\t
00050000-5627-58cf-33ac-21c2692b630b	5293	Volčja Draga
00050000-5627-58cf-04c8-291454872304	2232	Voličina
00050000-5627-58cf-67e7-a0378b26eafd	3305	Vransko
00050000-5627-58cf-3ae2-e606024e8e1c	6217	Vremski Britof
00050000-5627-58cf-d96b-4299d73a4fc0	1360	Vrhnika
00050000-5627-58cf-9a2c-f261f97838d6	2365	Vuhred
00050000-5627-58cf-4fe9-da41e3902b50	2367	Vuzenica
00050000-5627-58cf-ebb9-d57392957a63	8292	Zabukovje 
00050000-5627-58cf-1185-77a0cc67554d	1410	Zagorje ob Savi
00050000-5627-58cf-434c-9389e98bbd08	1303	Zagradec
00050000-5627-58cf-75e2-04b9f39adbaf	2283	Zavrč
00050000-5627-58cf-1b83-934029d116c5	8272	Zdole 
00050000-5627-58cf-6a55-d0e9c28bf5bb	4201	Zgornja Besnica
00050000-5627-58cf-18ca-4d3f05c74cae	2242	Zgornja Korena
00050000-5627-58cf-bb44-f42c58b693cd	2201	Zgornja Kungota
00050000-5627-58cf-1953-32daf8e328a5	2316	Zgornja Ložnica
00050000-5627-58cf-9403-fa5ae92ddb91	2314	Zgornja Polskava
00050000-5627-58cf-ff4f-8228556b30f5	2213	Zgornja Velka
00050000-5627-58cf-99cc-2ee8929281fe	4247	Zgornje Gorje
00050000-5627-58cf-885c-31c4ed513cf7	4206	Zgornje Jezersko
00050000-5627-58cf-1cab-dc654062d564	2285	Zgornji Leskovec
00050000-5627-58cf-f4c8-b37f78a85348	1432	Zidani Most
00050000-5627-58cf-2306-634246a953cc	3214	Zreče
00050000-5627-58cf-5d95-657c48dd699e	4209	Žabnica
00050000-5627-58cf-da8b-6b37d1cbe170	3310	Žalec
00050000-5627-58cf-9758-59540674ad07	4228	Železniki
00050000-5627-58cf-a7c8-60f9ab325c02	2287	Žetale
00050000-5627-58cf-d3bc-1a3b6b52f276	4226	Žiri
00050000-5627-58cf-54f7-f5f00b19972a	4274	Žirovnica
00050000-5627-58cf-f1cd-19724fd40c6f	8360	Žužemberk
\.


--
-- TOC entry 3119 (class 0 OID 22818826)
-- Dependencies: 237
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22818418)
-- Dependencies: 210
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22818172)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5627-58d1-d8ad-bee0df83b700	00080000-5627-58d1-3a01-2e490f9a7af8	\N	00040000-5627-58cf-a5c9-3bf4386b348f	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5627-58d1-e38f-b2bef01b3bdb	00080000-5627-58d1-3a01-2e490f9a7af8	\N	00040000-5627-58cf-a5c9-3bf4386b348f	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5627-58d1-1367-8b4a265760da	00080000-5627-58d1-e157-fb8c7a514a00	\N	00040000-5627-58cf-a5c9-3bf4386b348f	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3082 (class 0 OID 22818316)
-- Dependencies: 200
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5627-58d0-46db-1bb45e9fcaeb	novo leto	1	1	\N	t
00430000-5627-58d0-9acd-2ae945ec646f	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5627-58d0-57a1-be2aaadb88e6	dan upora proti okupatorju	27	4	\N	t
00430000-5627-58d0-556d-f6ccd7ba9b64	praznik dela	1	5	\N	t
00430000-5627-58d0-1759-f851bce41562	praznik dela	2	5	\N	t
00430000-5627-58d0-7cd2-bd3da43a59e5	dan Primoža Trubarja	8	6	\N	f
00430000-5627-58d0-b19a-d0a2ca3c77d9	dan državnosti	25	6	\N	t
00430000-5627-58d0-27a9-9b16454eeabc	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5627-58d0-ce48-2ec400b809c2	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5627-58d0-6e1e-f762a72ce7ad	dan suverenosti	25	10	\N	f
00430000-5627-58d0-cde3-db1f3f82a633	dan spomina na mrtve	1	11	\N	t
00430000-5627-58d0-88b5-7ebf9fa2f74c	dan Rudolfa Maistra	23	11	\N	f
00430000-5627-58d0-e3da-5c79abc1eba4	božič	25	12	\N	t
00430000-5627-58d0-a3fd-b4af82cdb0c3	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5627-58d0-736a-f715daa579ff	Marijino vnebovzetje	15	8	\N	t
00430000-5627-58d0-7e9b-29970f24e305	dan reformacije	31	10	\N	t
00430000-5627-58d0-bfa4-f6e08ffbad66	velikonočna nedelja	27	3	2016	t
00430000-5627-58d0-99f0-6b5c4fdb1b02	velikonočna nedelja	16	4	2017	t
00430000-5627-58d0-da84-43056bac8146	velikonočna nedelja	1	4	2018	t
00430000-5627-58d0-0e38-0ea15d6421a6	velikonočna nedelja	21	4	2019	t
00430000-5627-58d0-5c7b-1d5189696424	velikonočna nedelja	12	4	2020	t
00430000-5627-58d0-4026-287a0afa3617	velikonočna nedelja	4	4	2021	t
00430000-5627-58d0-b630-d330a345b7ed	velikonočna nedelja	17	4	2022	t
00430000-5627-58d0-2e64-289fea157cab	velikonočna nedelja	9	4	2023	t
00430000-5627-58d0-7c65-fb6b90fcdbf8	velikonočna nedelja	31	3	2024	t
00430000-5627-58d0-9e39-ba246b2f5abb	velikonočna nedelja	20	4	2025	t
00430000-5627-58d0-0c0d-f8abc8034828	velikonočna nedelja	5	4	2026	t
00430000-5627-58d0-2e1e-3efcb333f6a7	velikonočna nedelja	28	3	2027	t
00430000-5627-58d0-672c-424e4775022d	velikonočna nedelja	16	4	2028	t
00430000-5627-58d0-0a57-7943ba76a2ff	velikonočna nedelja	1	4	2029	t
00430000-5627-58d0-417e-7f564ddc0f22	velikonočna nedelja	21	4	2030	t
00430000-5627-58d0-a27f-f84788a22891	velikonočni ponedeljek	28	3	2016	t
00430000-5627-58d0-6e3c-ad27ba30c01a	velikonočni ponedeljek	17	4	2017	t
00430000-5627-58d0-d909-104355465b78	velikonočni ponedeljek	2	4	2018	t
00430000-5627-58d0-ad9d-2ebd49200241	velikonočni ponedeljek	22	4	2019	t
00430000-5627-58d0-dbdb-747f0a034805	velikonočni ponedeljek	13	4	2020	t
00430000-5627-58d0-c850-5fe1b1ab8c03	velikonočni ponedeljek	5	4	2021	t
00430000-5627-58d0-16fb-d0a4bafcb50e	velikonočni ponedeljek	18	4	2022	t
00430000-5627-58d0-f0be-2413242dccf9	velikonočni ponedeljek	10	4	2023	t
00430000-5627-58d0-eba5-1b3f735ff7a0	velikonočni ponedeljek	1	4	2024	t
00430000-5627-58d0-4c80-dffa17674574	velikonočni ponedeljek	21	4	2025	t
00430000-5627-58d0-522b-f5cab27f5ee2	velikonočni ponedeljek	6	4	2026	t
00430000-5627-58d0-a565-ef84d8333df4	velikonočni ponedeljek	29	3	2027	t
00430000-5627-58d0-e688-9bf5f04bf637	velikonočni ponedeljek	17	4	2028	t
00430000-5627-58d0-7475-38aed13eb97d	velikonočni ponedeljek	2	4	2029	t
00430000-5627-58d0-16c4-7dbce8af9ace	velikonočni ponedeljek	22	4	2030	t
00430000-5627-58d0-1ca8-7ce8adb18880	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5627-58d0-c734-e204942e1688	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5627-58d0-bdd1-ba44d9d1fa4b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5627-58d0-4fb8-5b1ed871f4e5	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5627-58d0-f250-20f5ceacd801	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5627-58d0-3c29-d32fb8b10267	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5627-58d0-4c20-55eae33af683	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5627-58d0-b3d5-562c797d1430	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5627-58d0-3518-a0d8395ca2d8	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5627-58d0-b2cb-867fb46eca50	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5627-58d0-58f1-f25a9a780c8c	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5627-58d0-4858-31e8e7ee7ff0	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5627-58d0-4f08-9ccf8caab0c0	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5627-58d0-9feb-c2a5610e13e1	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5627-58d0-a7c7-fa29574f150b	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3078 (class 0 OID 22818276)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22818288)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 22818430)
-- Dependencies: 212
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 22818840)
-- Dependencies: 238
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 22818850)
-- Dependencies: 239
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5627-58d1-397f-2032a7aefd41	00080000-5627-58d1-22d1-6d5b256be2ab	0987	AK
00190000-5627-58d1-6169-96b4ea66d878	00080000-5627-58d1-e157-fb8c7a514a00	0989	AK
00190000-5627-58d1-03a0-5fa975a17bc7	00080000-5627-58d1-6908-93f3d0294a2c	0986	AK
00190000-5627-58d1-1ae1-5d877b478318	00080000-5627-58d1-593a-48c29a4c76e4	0984	AK
00190000-5627-58d1-710b-056deb0e16b0	00080000-5627-58d1-2bd8-ad4b4491f1bb	0983	AK
00190000-5627-58d1-53b3-6c944d7172eb	00080000-5627-58d1-fb07-b3e71b4466ba	0982	AK
00190000-5627-58d3-e6e4-cdd4d3746efc	00080000-5627-58d3-f650-73e179ad7bb4	1001	AK
\.


--
-- TOC entry 3118 (class 0 OID 22818765)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5627-58d2-c8b5-9640a7ec939b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3122 (class 0 OID 22818858)
-- Dependencies: 240
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 22818459)
-- Dependencies: 216
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5627-58d1-dcfa-b0822cab95db	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5627-58d1-e244-8d3c66028a39	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5627-58d1-0162-81d31cb18a90	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5627-58d1-20a1-affe2d0bec2d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5627-58d1-cb72-bc23dade33d1	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5627-58d1-f6eb-76aac18e4246	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5627-58d1-99fd-b1839797188c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3090 (class 0 OID 22818403)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 22818393)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 22818604)
-- Dependencies: 229
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 22818534)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 22818250)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22818023)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5627-58d3-f650-73e179ad7bb4	00010000-5627-58d0-80ee-cd5068b57cb4	2015-10-21 11:20:19	INS	a:0:{}
2	App\\Entity\\Option	00000000-5627-58d3-f2d0-4523f88cd8f8	00010000-5627-58d0-80ee-cd5068b57cb4	2015-10-21 11:20:19	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5627-58d3-e6e4-cdd4d3746efc	00010000-5627-58d0-80ee-cd5068b57cb4	2015-10-21 11:20:19	INS	a:0:{}
\.


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3099 (class 0 OID 22818472)
-- Dependencies: 217
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 22818061)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5627-58d0-6434-4e977d7efc8f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5627-58d0-cc0f-f5b65608b186	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5627-58d0-fb18-f287f9a009bd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5627-58d0-0382-9ba74d5651bb	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5627-58d0-8457-557cae54ea42	planer	Planer dogodkov v koledarju	t
00020000-5627-58d0-b3d6-3a816cb84c0f	kadrovska	Kadrovska služba	t
00020000-5627-58d0-1f6d-057474fce061	arhivar	Ažuriranje arhivalij	t
00020000-5627-58d0-0563-175b3f5197d3	igralec	Igralec	t
00020000-5627-58d0-3508-708e17d7d9b0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5627-58d1-f4dd-cb7c8153ccb1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3059 (class 0 OID 22818045)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5627-58d0-533e-b9fea848637f	00020000-5627-58d0-fb18-f287f9a009bd
00010000-5627-58d0-80ee-cd5068b57cb4	00020000-5627-58d0-fb18-f287f9a009bd
00010000-5627-58d1-4495-0bcb58530c82	00020000-5627-58d1-f4dd-cb7c8153ccb1
\.


--
-- TOC entry 3101 (class 0 OID 22818486)
-- Dependencies: 219
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 22818424)
-- Dependencies: 211
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 22818370)
-- Dependencies: 205
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5627-58d1-91eb-9c0407a28bad	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5627-58d1-12ea-f398d42b4d5e	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5627-58d1-342d-c85775a68e84	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3055 (class 0 OID 22818010)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5627-58cf-ad6d-d8895730ad02	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5627-58cf-992b-f236a40205da	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5627-58cf-7b68-218666d61dd0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5627-58cf-6fe1-a74f0297613d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5627-58cf-e869-5663322950a7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3054 (class 0 OID 22818002)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5627-58cf-632a-056872ad9bbf	00230000-5627-58cf-6fe1-a74f0297613d	popa
00240000-5627-58cf-a9b3-7fcf6f001e88	00230000-5627-58cf-6fe1-a74f0297613d	oseba
00240000-5627-58cf-4c1f-8e4b15e4a63f	00230000-5627-58cf-6fe1-a74f0297613d	tippopa
00240000-5627-58cf-ba30-606f31f47891	00230000-5627-58cf-6fe1-a74f0297613d	organizacijskaenota
00240000-5627-58cf-d34c-efc8ed88c676	00230000-5627-58cf-6fe1-a74f0297613d	sezona
00240000-5627-58cf-03ad-7dc476772177	00230000-5627-58cf-6fe1-a74f0297613d	tipvaje
00240000-5627-58cf-43ec-615eb5721f97	00230000-5627-58cf-992b-f236a40205da	prostor
00240000-5627-58cf-90d2-90a6c21f8590	00230000-5627-58cf-6fe1-a74f0297613d	besedilo
00240000-5627-58cf-b89f-9d5f00fd729b	00230000-5627-58cf-6fe1-a74f0297613d	uprizoritev
00240000-5627-58cf-7aa6-84332f893a67	00230000-5627-58cf-6fe1-a74f0297613d	funkcija
00240000-5627-58cf-9d1b-1f27adda76d3	00230000-5627-58cf-6fe1-a74f0297613d	tipfunkcije
00240000-5627-58cf-010a-ef00e275fe8d	00230000-5627-58cf-6fe1-a74f0297613d	alternacija
00240000-5627-58cf-2200-46c4ed6fbc4b	00230000-5627-58cf-ad6d-d8895730ad02	pogodba
00240000-5627-58cf-95e6-4ec1026ebf1d	00230000-5627-58cf-6fe1-a74f0297613d	zaposlitev
00240000-5627-58cf-60a4-0bbc8997f98d	00230000-5627-58cf-6fe1-a74f0297613d	zvrstuprizoritve
00240000-5627-58cf-d128-4c1424c340ee	00230000-5627-58cf-ad6d-d8895730ad02	programdela
00240000-5627-58cf-0c7c-c2b79600579a	00230000-5627-58cf-6fe1-a74f0297613d	zapis
\.


--
-- TOC entry 3053 (class 0 OID 22817997)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b09b3328-a691-4307-be10-819e84ba4280	00240000-5627-58cf-632a-056872ad9bbf	0	1001
\.


--
-- TOC entry 3107 (class 0 OID 22818551)
-- Dependencies: 225
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5627-58d2-b26f-80c11f6f8ee8	000e0000-5627-58d1-04f6-b58883e63609	00080000-5627-58d1-3a01-2e490f9a7af8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5627-58d0-0d82-8d485277ff89
00270000-5627-58d2-3938-318b14b50d22	000e0000-5627-58d1-04f6-b58883e63609	00080000-5627-58d1-3a01-2e490f9a7af8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5627-58d0-0d82-8d485277ff89
\.


--
-- TOC entry 3067 (class 0 OID 22818133)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 22818380)
-- Dependencies: 206
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5627-58d2-fe3b-b79dedb32151	00180000-5627-58d2-651f-faae854f87ff	000c0000-5627-58d2-5e39-4b933f68e502	00090000-5627-58d1-ccf3-9c7e2f5059f2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-58d2-3e84-093f384d6b36	00180000-5627-58d2-651f-faae854f87ff	000c0000-5627-58d2-dddf-4483be17faae	00090000-5627-58d1-51f2-f95ce10d5b22	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-58d2-a373-2fea5db0c1e0	00180000-5627-58d2-651f-faae854f87ff	000c0000-5627-58d2-e28f-8d70a85ef340	00090000-5627-58d1-04b8-1154b4570881	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-58d2-2386-b504bd5146ed	00180000-5627-58d2-651f-faae854f87ff	000c0000-5627-58d2-43be-401ae60b512d	00090000-5627-58d1-1b3f-9033bca21fd7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-58d2-1d39-cee2871093f4	00180000-5627-58d2-651f-faae854f87ff	000c0000-5627-58d2-ab32-c78fbc88dfae	00090000-5627-58d1-5ab5-bf665371fd67	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-58d2-41c8-bc4245c44b02	00180000-5627-58d2-fddf-88dddfe6bbbb	\N	00090000-5627-58d1-5ab5-bf665371fd67	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5627-58d2-bb6f-fa2467f52759	00180000-5627-58d2-fddf-88dddfe6bbbb	\N	00090000-5627-58d1-51f2-f95ce10d5b22	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3110 (class 0 OID 22818592)
-- Dependencies: 228
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5627-58cf-3f89-9bd6f42ef448	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5627-58cf-e5c2-11a5eefd40a3	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5627-58cf-f65f-2bb94bb33652	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5627-58cf-018f-750e9abbc134	04	Režija	Režija	Režija	umetnik	30
000f0000-5627-58cf-898c-517f2eea812b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5627-58cf-2cff-64336edb4f62	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5627-58cf-f32c-989832490189	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5627-58cf-1fd0-a2bbec3ba053	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5627-58cf-83b5-a4455058d581	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5627-58cf-b462-4a5399422a40	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5627-58cf-867c-c9546d5d95ea	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5627-58cf-7beb-97045b34a258	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5627-58cf-a5d6-8042b602cb52	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5627-58cf-12a6-61c6b0bf469f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5627-58cf-c532-312fcdde913c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5627-58cf-cbb5-b1210fdcba74	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5627-58cf-91be-d040c76fc713	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5627-58cf-b9f5-a769a2fa24f9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3064 (class 0 OID 22818087)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5627-58d1-ea57-3208bd078fb8	0001	šola	osnovna ali srednja šola
00400000-5627-58d1-dde9-bb4fae2bdb18	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5627-58d1-a9d3-1cf2a6c9d599	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3123 (class 0 OID 22818869)
-- Dependencies: 241
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5627-58cf-0038-b2518d8dbf46	01	Velika predstava	f	1.00	1.00
002b0000-5627-58cf-66bd-26ee8e8eb98c	02	Mala predstava	f	0.50	0.50
002b0000-5627-58cf-9a51-45aca67c2e61	03	Mala koprodukcija	t	0.40	1.00
002b0000-5627-58cf-c173-69e211465060	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5627-58cf-bffa-36b92c120567	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3086 (class 0 OID 22818360)
-- Dependencies: 204
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5627-58cf-24c4-9456cd2261a9	0001	prva vaja	prva vaja
00420000-5627-58cf-9044-b3a8f9d51550	0002	tehnična vaja	tehnična vaja
00420000-5627-58cf-02af-73b76ed76e20	0003	lučna vaja	lučna vaja
00420000-5627-58cf-d7d3-cb4f2e05c0de	0004	kostumska vaja	kostumska vaja
00420000-5627-58cf-7409-55180c75af41	0005	foto vaja	foto vaja
00420000-5627-58cf-108f-19cb796f3e69	0006	1. glavna vaja	1. glavna vaja
00420000-5627-58cf-600b-bcc3e27ccfcf	0007	2. glavna vaja	2. glavna vaja
00420000-5627-58cf-d931-7e30c1e1bc37	0008	1. generalka	1. generalka
00420000-5627-58cf-c963-962f00ffb63b	0009	2. generalka	2. generalka
00420000-5627-58cf-e65b-a8fadf65e8b6	0010	odprta generalka	odprta generalka
00420000-5627-58cf-0eb1-9a736916d623	0011	obnovitvena vaja	obnovitvena vaja
00420000-5627-58cf-7d7c-0235f0fe7789	0012	pevska vaja	pevska vaja
00420000-5627-58cf-380b-d9fc9db32248	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5627-58cf-cc18-f5e550c169d4	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3073 (class 0 OID 22818207)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 22818032)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5627-58d0-80ee-cd5068b57cb4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROsmts9qyFMgvkB2D7BcjdUwpPSQX.KoS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5627-58d1-4b74-547639a56fce	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5627-58d1-0ce3-f155e641e3a6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5627-58d1-7467-c2d835090035	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5627-58d1-60e7-d0e077b10fc2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5627-58d1-fc64-66f0f32baa3e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5627-58d1-0739-db93ba63ce54	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5627-58d1-5d25-3060c1599908	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5627-58d1-8706-0cba3fc35fb6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5627-58d1-1a4b-fe5ac3b25b00	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5627-58d1-4495-0bcb58530c82	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5627-58d0-533e-b9fea848637f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3114 (class 0 OID 22818642)
-- Dependencies: 232
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5627-58d1-46e7-f45af92ac7cd	00160000-5627-58d1-e28a-b95db018368e	\N	00140000-5627-58cf-ff7a-d062331fecfa	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5627-58d1-cb72-bc23dade33d1
000e0000-5627-58d1-04f6-b58883e63609	00160000-5627-58d1-048c-4f7a990c712a	\N	00140000-5627-58cf-f6a0-021fd19ff635	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5627-58d1-f6eb-76aac18e4246
000e0000-5627-58d1-c039-36e8d5bf0f21	\N	\N	00140000-5627-58cf-f6a0-021fd19ff635	00190000-5627-58d1-397f-2032a7aefd41	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5627-58d1-cb72-bc23dade33d1
000e0000-5627-58d2-3ab1-4931779f67fd	\N	\N	00140000-5627-58cf-f6a0-021fd19ff635	00190000-5627-58d1-397f-2032a7aefd41	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5627-58d1-cb72-bc23dade33d1
000e0000-5627-58d2-cc18-c2d913ffc253	\N	\N	00140000-5627-58cf-f6a0-021fd19ff635	00190000-5627-58d1-397f-2032a7aefd41	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5627-58d1-dcfa-b0822cab95db
000e0000-5627-58d2-e54c-c22e81d2d874	\N	\N	00140000-5627-58cf-f6a0-021fd19ff635	00190000-5627-58d1-397f-2032a7aefd41	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5627-58d1-dcfa-b0822cab95db
\.


--
-- TOC entry 3081 (class 0 OID 22818306)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5627-58d2-1662-f9470d0b1121	\N	000e0000-5627-58d1-04f6-b58883e63609	1	
00200000-5627-58d2-790c-0541b7c152d1	\N	000e0000-5627-58d1-04f6-b58883e63609	2	
00200000-5627-58d2-73b0-1cc7fd87b9a5	\N	000e0000-5627-58d1-04f6-b58883e63609	3	
00200000-5627-58d2-4251-6b2d0e9fa8c1	\N	000e0000-5627-58d1-04f6-b58883e63609	4	
00200000-5627-58d2-86a3-71544f450a38	\N	000e0000-5627-58d1-04f6-b58883e63609	5	
\.


--
-- TOC entry 3097 (class 0 OID 22818451)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 22818565)
-- Dependencies: 226
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5627-58d0-4a5a-fb78d71f4162	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5627-58d0-9c87-4ffea83952e3	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5627-58d0-27bc-34d128bbc002	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5627-58d0-cbd5-1729fae9bccc	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5627-58d0-3fd3-e65f0a908655	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5627-58d0-d794-82c74fb79e17	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5627-58d0-7670-294ef456cfdc	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5627-58d0-1d5d-c9de267240fc	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5627-58d0-0d82-8d485277ff89	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5627-58d0-c3da-59a1022850cd	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5627-58d0-ae58-27e4ad4dd697	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5627-58d0-8714-579b961bbaed	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5627-58d0-afe6-edead11c6e26	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5627-58d0-c95d-0e9a7686f5b4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5627-58d0-edd6-91ecdce8f48a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5627-58d0-7903-e46d8e98ff8e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5627-58d0-7e6e-0067d20fe76f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5627-58d0-0b55-2a598e246b02	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5627-58d0-9a4c-b25f3471f98c	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5627-58d0-a1c6-81bef1d85d1f	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5627-58d0-6025-c901374643f3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5627-58d0-e429-a5210cbee877	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5627-58d0-805b-88f8be3d8f60	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5627-58d0-da07-15762340ab86	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5627-58d0-e261-6c34c1c43a89	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5627-58d0-4187-7889e2e8ab8f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5627-58d0-460f-0ce614b1bbcd	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5627-58d0-c96f-39c0621fb60f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3126 (class 0 OID 22818916)
-- Dependencies: 244
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 22818888)
-- Dependencies: 243
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 22818928)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22818523)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5627-58d1-7153-252a19c60962	00090000-5627-58d1-51f2-f95ce10d5b22	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-58d1-dfd0-2556144618a6	00090000-5627-58d1-04b8-1154b4570881	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-58d1-ba64-8a9440374662	00090000-5627-58d1-6560-18124a996960	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-58d1-896e-3da2bb1e396c	00090000-5627-58d1-1edc-77249334bd41	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-58d1-5dd3-6380401529c1	00090000-5627-58d1-73fe-0ef9469d00ea	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-58d1-5405-774738c2d251	00090000-5627-58d1-036c-2043db342943	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3084 (class 0 OID 22818349)
-- Dependencies: 202
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 22818632)
-- Dependencies: 231
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5627-58cf-ff7a-d062331fecfa	01	Drama	drama (SURS 01)
00140000-5627-58cf-7886-96c0d1282a4c	02	Opera	opera (SURS 02)
00140000-5627-58cf-48bc-5029e4b1a73f	03	Balet	balet (SURS 03)
00140000-5627-58cf-02fd-ebe669a96dc5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5627-58cf-e0f8-845b9d7de06a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5627-58cf-f6a0-021fd19ff635	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5627-58cf-aa15-545915cfe784	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3103 (class 0 OID 22818513)
-- Dependencies: 221
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2552 (class 2606 OID 22818086)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 22818691)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 22818681)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 22818548)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22818590)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 22818968)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 22818338)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 22818359)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 22818886)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 22818233)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22818759)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22818509)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 22818304)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 22818271)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 22818247)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 22818416)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 22818945)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 22818952)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2830 (class 2606 OID 22818976)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 22757752)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2687 (class 2606 OID 22818443)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 22818205)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22818105)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 22818167)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 22818129)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 22818075)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2543 (class 2606 OID 22818060)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 22818449)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 22818485)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 22818627)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 22818157)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 22818193)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22818838)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 22818422)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 22818183)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 22818323)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 22818292)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2619 (class 2606 OID 22818284)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 22818434)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 22818847)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 22818855)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22818825)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 22818867)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 22818467)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 22818407)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 22818398)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 22818614)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 22818541)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 22818259)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 22818031)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 22818476)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22818049)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2545 (class 2606 OID 22818069)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22818494)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 22818429)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 22818378)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22818019)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 22818007)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 22818001)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22818561)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 22818138)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 22818389)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 22818601)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 22818094)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 22818879)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 22818367)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 22818218)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 22818044)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 22818660)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 22818313)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 22818457)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 22818573)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 22818926)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 22818910)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 22818934)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 22818531)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 22818353)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 22818640)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 22818521)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 1259 OID 22818347)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2636 (class 1259 OID 22818348)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2637 (class 1259 OID 22818346)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2638 (class 1259 OID 22818345)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2639 (class 1259 OID 22818344)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2730 (class 1259 OID 22818562)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2731 (class 1259 OID 22818563)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2732 (class 1259 OID 22818564)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2816 (class 1259 OID 22818947)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2817 (class 1259 OID 22818946)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2570 (class 1259 OID 22818159)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2571 (class 1259 OID 22818160)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 22818450)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2803 (class 1259 OID 22818914)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2804 (class 1259 OID 22818913)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2805 (class 1259 OID 22818915)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2806 (class 1259 OID 22818912)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2807 (class 1259 OID 22818911)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2682 (class 1259 OID 22818436)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2683 (class 1259 OID 22818435)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2627 (class 1259 OID 22818314)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2628 (class 1259 OID 22818315)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2712 (class 1259 OID 22818510)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2713 (class 1259 OID 22818512)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2714 (class 1259 OID 22818511)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2602 (class 1259 OID 22818249)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 22818248)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2794 (class 1259 OID 22818868)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2746 (class 1259 OID 22818629)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 22818630)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2748 (class 1259 OID 22818631)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2813 (class 1259 OID 22818935)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2755 (class 1259 OID 22818665)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2756 (class 1259 OID 22818662)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2757 (class 1259 OID 22818666)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2758 (class 1259 OID 22818664)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2759 (class 1259 OID 22818663)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2592 (class 1259 OID 22818220)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2593 (class 1259 OID 22818219)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 22818132)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2700 (class 1259 OID 22818477)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2547 (class 1259 OID 22818076)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2548 (class 1259 OID 22818077)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2705 (class 1259 OID 22818497)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2706 (class 1259 OID 22818496)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2707 (class 1259 OID 22818495)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2575 (class 1259 OID 22818170)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2576 (class 1259 OID 22818169)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2577 (class 1259 OID 22818171)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2615 (class 1259 OID 22818287)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2616 (class 1259 OID 22818285)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 22818286)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2527 (class 1259 OID 22818009)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2662 (class 1259 OID 22818402)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2663 (class 1259 OID 22818400)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2664 (class 1259 OID 22818399)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2665 (class 1259 OID 22818401)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2538 (class 1259 OID 22818050)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 22818051)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2691 (class 1259 OID 22818458)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2826 (class 1259 OID 22818969)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2728 (class 1259 OID 22818550)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 22818549)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2827 (class 1259 OID 22818977)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2828 (class 1259 OID 22818978)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2677 (class 1259 OID 22818423)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2722 (class 1259 OID 22818542)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2723 (class 1259 OID 22818543)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2776 (class 1259 OID 22818764)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2777 (class 1259 OID 22818763)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2778 (class 1259 OID 22818760)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 22818761)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2780 (class 1259 OID 22818762)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2581 (class 1259 OID 22818185)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 22818184)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2583 (class 1259 OID 22818186)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2694 (class 1259 OID 22818471)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2695 (class 1259 OID 22818470)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 22818848)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2787 (class 1259 OID 22818849)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2769 (class 1259 OID 22818695)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 22818696)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2771 (class 1259 OID 22818693)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2772 (class 1259 OID 22818694)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2718 (class 1259 OID 22818532)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2719 (class 1259 OID 22818533)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2668 (class 1259 OID 22818411)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2669 (class 1259 OID 22818410)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2670 (class 1259 OID 22818408)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2671 (class 1259 OID 22818409)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2765 (class 1259 OID 22818683)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2766 (class 1259 OID 22818682)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2606 (class 1259 OID 22818260)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2609 (class 1259 OID 22818274)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2610 (class 1259 OID 22818273)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2611 (class 1259 OID 22818272)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2612 (class 1259 OID 22818275)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2626 (class 1259 OID 22818305)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2620 (class 1259 OID 22818293)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2621 (class 1259 OID 22818294)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2783 (class 1259 OID 22818839)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2802 (class 1259 OID 22818887)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2820 (class 1259 OID 22818953)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2821 (class 1259 OID 22818954)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2557 (class 1259 OID 22818107)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2558 (class 1259 OID 22818106)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2566 (class 1259 OID 22818139)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 22818140)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 22818354)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2657 (class 1259 OID 22818392)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2658 (class 1259 OID 22818391)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2659 (class 1259 OID 22818390)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2640 (class 1259 OID 22818340)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2641 (class 1259 OID 22818341)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2642 (class 1259 OID 22818339)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2643 (class 1259 OID 22818343)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2644 (class 1259 OID 22818342)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 22818158)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 22818095)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 22818096)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2598 (class 1259 OID 22818234)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 22818236)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2600 (class 1259 OID 22818235)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2601 (class 1259 OID 22818237)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2676 (class 1259 OID 22818417)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2751 (class 1259 OID 22818628)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2760 (class 1259 OID 22818661)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 22818602)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2743 (class 1259 OID 22818603)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2564 (class 1259 OID 22818130)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 22818131)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2715 (class 1259 OID 22818522)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 22818020)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 22818206)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2580 (class 1259 OID 22818168)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 22818008)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2799 (class 1259 OID 22818880)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2698 (class 1259 OID 22818469)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2699 (class 1259 OID 22818468)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 22818368)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 22818369)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2773 (class 1259 OID 22818692)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 22818194)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2752 (class 1259 OID 22818641)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 22818927)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2792 (class 1259 OID 22818856)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 22818857)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 22818591)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2656 (class 1259 OID 22818379)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 22818070)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2869 (class 2606 OID 22819149)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2868 (class 2606 OID 22819154)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2864 (class 2606 OID 22819174)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2870 (class 2606 OID 22819144)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2866 (class 2606 OID 22819164)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2865 (class 2606 OID 22819169)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2867 (class 2606 OID 22819159)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2906 (class 2606 OID 22819344)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2905 (class 2606 OID 22819349)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2904 (class 2606 OID 22819354)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2938 (class 2606 OID 22819519)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2939 (class 2606 OID 22819514)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2843 (class 2606 OID 22819034)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2842 (class 2606 OID 22819039)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2887 (class 2606 OID 22819259)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2933 (class 2606 OID 22819499)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2934 (class 2606 OID 22819494)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2932 (class 2606 OID 22819504)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2935 (class 2606 OID 22819489)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2936 (class 2606 OID 22819484)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2885 (class 2606 OID 22819254)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2886 (class 2606 OID 22819249)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2863 (class 2606 OID 22819134)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2862 (class 2606 OID 22819139)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 22819299)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 22819309)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2896 (class 2606 OID 22819304)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2852 (class 2606 OID 22819089)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 22819084)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2883 (class 2606 OID 22819239)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2930 (class 2606 OID 22819474)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2909 (class 2606 OID 22819359)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 22819364)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 22819369)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2937 (class 2606 OID 22819509)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2911 (class 2606 OID 22819389)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2914 (class 2606 OID 22819374)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2910 (class 2606 OID 22819394)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2912 (class 2606 OID 22819384)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2913 (class 2606 OID 22819379)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2850 (class 2606 OID 22819079)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 22819074)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 22819019)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2839 (class 2606 OID 22819014)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2891 (class 2606 OID 22819279)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2835 (class 2606 OID 22818994)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2834 (class 2606 OID 22818999)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2892 (class 2606 OID 22819294)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2893 (class 2606 OID 22819289)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2894 (class 2606 OID 22819284)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2845 (class 2606 OID 22819049)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2846 (class 2606 OID 22819044)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2844 (class 2606 OID 22819054)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2856 (class 2606 OID 22819114)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2858 (class 2606 OID 22819104)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2857 (class 2606 OID 22819109)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2831 (class 2606 OID 22818979)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2875 (class 2606 OID 22819214)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2877 (class 2606 OID 22819204)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2878 (class 2606 OID 22819199)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2876 (class 2606 OID 22819209)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2833 (class 2606 OID 22818984)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2832 (class 2606 OID 22818989)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2888 (class 2606 OID 22819264)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2942 (class 2606 OID 22819534)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 22819339)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 22819334)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2944 (class 2606 OID 22819539)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2943 (class 2606 OID 22819544)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2884 (class 2606 OID 22819244)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2901 (class 2606 OID 22819324)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2900 (class 2606 OID 22819329)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2921 (class 2606 OID 22819449)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 22819444)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 22819429)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 22819434)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2923 (class 2606 OID 22819439)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2848 (class 2606 OID 22819064)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 22819059)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 22819069)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2889 (class 2606 OID 22819274)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2890 (class 2606 OID 22819269)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2928 (class 2606 OID 22819459)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2927 (class 2606 OID 22819464)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2918 (class 2606 OID 22819419)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2917 (class 2606 OID 22819424)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2920 (class 2606 OID 22819409)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2919 (class 2606 OID 22819414)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2899 (class 2606 OID 22819314)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2898 (class 2606 OID 22819319)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 22819234)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2880 (class 2606 OID 22819229)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2882 (class 2606 OID 22819219)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2881 (class 2606 OID 22819224)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2915 (class 2606 OID 22819404)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2916 (class 2606 OID 22819399)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2854 (class 2606 OID 22819094)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2855 (class 2606 OID 22819099)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2861 (class 2606 OID 22819129)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 22819119)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2859 (class 2606 OID 22819124)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2926 (class 2606 OID 22819454)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2929 (class 2606 OID 22819469)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2931 (class 2606 OID 22819479)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2941 (class 2606 OID 22819524)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2940 (class 2606 OID 22819529)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2836 (class 2606 OID 22819009)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2837 (class 2606 OID 22819004)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2841 (class 2606 OID 22819024)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 22819029)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 22819179)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2872 (class 2606 OID 22819194)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2873 (class 2606 OID 22819189)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2874 (class 2606 OID 22819184)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-21 11:20:20 CEST

--
-- PostgreSQL database dump complete
--

