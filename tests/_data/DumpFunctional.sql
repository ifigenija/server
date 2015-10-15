--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-15 17:13:44 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 246 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22031671)
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
-- TOC entry 230 (class 1259 OID 22032239)
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
-- TOC entry 229 (class 1259 OID 22032222)
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
-- TOC entry 220 (class 1259 OID 22032099)
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
-- TOC entry 223 (class 1259 OID 22032129)
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
-- TOC entry 244 (class 1259 OID 22032510)
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
-- TOC entry 198 (class 1259 OID 22031890)
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
-- TOC entry 200 (class 1259 OID 22031921)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 22032436)
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
-- TOC entry 191 (class 1259 OID 22031803)
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
-- TOC entry 231 (class 1259 OID 22032252)
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
-- TOC entry 216 (class 1259 OID 22032054)
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
-- TOC entry 196 (class 1259 OID 22031869)
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
-- TOC entry 194 (class 1259 OID 22031843)
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
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 22031820)
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
-- TOC entry 205 (class 1259 OID 22031968)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 22032491)
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
-- TOC entry 243 (class 1259 OID 22032503)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 22032525)
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
-- TOC entry 170 (class 1259 OID 22028081)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 22031993)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 22031777)
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
-- TOC entry 183 (class 1259 OID 22031690)
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
-- TOC entry 184 (class 1259 OID 22031701)
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
-- TOC entry 178 (class 1259 OID 22031645)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22031664)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 22032000)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 22032034)
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
-- TOC entry 226 (class 1259 OID 22032170)
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
-- TOC entry 186 (class 1259 OID 22031734)
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
-- TOC entry 188 (class 1259 OID 22031769)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 22032381)
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
-- TOC entry 206 (class 1259 OID 22031974)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 22031754)
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
-- TOC entry 195 (class 1259 OID 22031858)
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
-- TOC entry 208 (class 1259 OID 22031986)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 22032395)
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
-- TOC entry 235 (class 1259 OID 22032405)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 22032320)
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
-- TOC entry 236 (class 1259 OID 22032413)
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
-- TOC entry 212 (class 1259 OID 22032015)
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
-- TOC entry 204 (class 1259 OID 22031959)
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
-- TOC entry 203 (class 1259 OID 22031949)
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
-- TOC entry 225 (class 1259 OID 22032159)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 22032089)
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
-- TOC entry 193 (class 1259 OID 22031832)
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
-- TOC entry 175 (class 1259 OID 22031616)
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
-- TOC entry 174 (class 1259 OID 22031614)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 22032028)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22031654)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22031638)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 22032042)
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
-- TOC entry 207 (class 1259 OID 22031980)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 22031926)
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
-- TOC entry 173 (class 1259 OID 22031603)
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
-- TOC entry 172 (class 1259 OID 22031595)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22031590)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 221 (class 1259 OID 22032106)
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
-- TOC entry 185 (class 1259 OID 22031726)
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
-- TOC entry 202 (class 1259 OID 22031936)
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
-- TOC entry 224 (class 1259 OID 22032147)
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
-- TOC entry 182 (class 1259 OID 22031680)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 237 (class 1259 OID 22032424)
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
-- TOC entry 190 (class 1259 OID 22031789)
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
-- TOC entry 176 (class 1259 OID 22031625)
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
-- TOC entry 228 (class 1259 OID 22032197)
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
-- TOC entry 197 (class 1259 OID 22031880)
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
-- TOC entry 211 (class 1259 OID 22032007)
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
-- TOC entry 222 (class 1259 OID 22032120)
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
-- TOC entry 240 (class 1259 OID 22032471)
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
-- TOC entry 239 (class 1259 OID 22032443)
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
-- TOC entry 241 (class 1259 OID 22032483)
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
-- TOC entry 218 (class 1259 OID 22032079)
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
-- TOC entry 199 (class 1259 OID 22031915)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 227 (class 1259 OID 22032187)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 22032069)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2206 (class 2604 OID 22031619)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3017 (class 0 OID 22031671)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22032239)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561f-c2a5-ad86-d85bd0a45301	000d0000-561f-c2a5-171e-c130f2d27f87	\N	00090000-561f-c2a5-5490-f38e31e9caca	000b0000-561f-c2a5-5a53-b2cac2b5282a	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561f-c2a5-15d5-94ae4348dbdf	000d0000-561f-c2a5-4fcb-c7166ddb899d	00100000-561f-c2a5-1ba5-bc37fc51819f	00090000-561f-c2a5-d2c4-08f02ce895cf	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561f-c2a5-a9a4-7795d6b896a2	000d0000-561f-c2a5-f42a-6656d3928310	00100000-561f-c2a5-fb0b-9148aecb4c76	00090000-561f-c2a5-b342-c476857e6b66	\N	0003	t	\N	2015-10-15	\N	2	t	\N	f	f
000c0000-561f-c2a5-2dae-128fe8ad13c0	000d0000-561f-c2a5-11aa-8fbbeb14fe1c	\N	00090000-561f-c2a5-a4a6-469034c9e823	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561f-c2a5-011f-08cd1963f9cb	000d0000-561f-c2a5-ef80-a062fb02914c	\N	00090000-561f-c2a5-5a6d-4f7c3243dfda	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561f-c2a5-7794-c1816985fdf2	000d0000-561f-c2a5-0a90-48a4b0a5530c	\N	00090000-561f-c2a5-fdaf-4e6e1dca63a5	000b0000-561f-c2a5-a69e-3baf1c850d07	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561f-c2a5-b307-b97af08f4f0e	000d0000-561f-c2a5-47a8-3b74b91e4ea7	00100000-561f-c2a5-ed32-fa6c9d587fca	00090000-561f-c2a5-6f67-b5db2ec345d4	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561f-c2a5-a192-4b09b60e9a9a	000d0000-561f-c2a5-30f5-37c9054b1c7c	\N	00090000-561f-c2a5-e109-3a3ffe915dfa	000b0000-561f-c2a5-e6db-d6aa2748e764	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561f-c2a5-8609-65029268b390	000d0000-561f-c2a5-47a8-3b74b91e4ea7	00100000-561f-c2a5-7341-85d6aad3f331	00090000-561f-c2a5-ef77-37f120455a1b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561f-c2a5-1ca0-7886734fa828	000d0000-561f-c2a5-47a8-3b74b91e4ea7	00100000-561f-c2a5-cdc8-339e9c1c7941	00090000-561f-c2a5-2c56-4c389c051b8a	\N	0010	t	\N	2015-10-15	\N	16	f	\N	f	t
000c0000-561f-c2a5-852d-3e21c4b03d91	000d0000-561f-c2a5-47a8-3b74b91e4ea7	00100000-561f-c2a5-be88-57aafc5ec3f1	00090000-561f-c2a5-e496-ac62ab15fb02	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561f-c2a5-804b-bf357ada2ca4	000d0000-561f-c2a5-2f23-3be7308507a3	\N	00090000-561f-c2a5-d2c4-08f02ce895cf	000b0000-561f-c2a5-df14-4cfdeb772ed4	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3065 (class 0 OID 22032222)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22032099)
-- Dependencies: 220
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561f-c2a5-c553-906a25cb53ac	00160000-561f-c2a5-2911-cfa61dff42fa	00090000-561f-c2a5-935c-6fa4801aacc6	aizv	10	t
003d0000-561f-c2a5-a35c-ff1d0350eda4	00160000-561f-c2a5-2911-cfa61dff42fa	00090000-561f-c2a5-5459-16b897ed3e16	apri	14	t
003d0000-561f-c2a5-8865-ccbae1e69b4d	00160000-561f-c2a5-0f1f-5c9455d350f0	00090000-561f-c2a5-7c09-e84fdbcf7bba	aizv	11	t
003d0000-561f-c2a5-63c6-d23b74b1395e	00160000-561f-c2a5-6fce-8ce88bd880da	00090000-561f-c2a5-d75d-6279938ebaec	aizv	12	t
003d0000-561f-c2a5-c9b7-0a566f8e8765	00160000-561f-c2a5-2911-cfa61dff42fa	00090000-561f-c2a5-0506-c3417728dec0	apri	18	f
\.


--
-- TOC entry 3059 (class 0 OID 22032129)
-- Dependencies: 223
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561f-c2a5-2911-cfa61dff42fa	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561f-c2a5-0f1f-5c9455d350f0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561f-c2a5-6fce-8ce88bd880da	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3080 (class 0 OID 22032510)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 22031890)
-- Dependencies: 198
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561f-c2a5-ae83-f51249b2c997	\N	\N	00200000-561f-c2a5-a373-614f6d03e1d6	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561f-c2a5-de14-4af0533fb281	\N	\N	00200000-561f-c2a5-cc69-cb7f884cc5ed	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561f-c2a5-86e6-71abaec12885	\N	\N	00200000-561f-c2a5-8df3-4938821947dd	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561f-c2a5-fabc-2bcc112c416e	\N	\N	00200000-561f-c2a5-cbce-961de12a9187	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561f-c2a5-1253-4d335f25a543	\N	\N	00200000-561f-c2a5-4e2d-53c8f40671e7	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3036 (class 0 OID 22031921)
-- Dependencies: 200
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 22032436)
-- Dependencies: 238
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 22031803)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561f-c2a2-bdb4-437edb28c7ba	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561f-c2a2-c8c7-80e8c207ea26	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561f-c2a2-042d-f2ee63c978da	AL	ALB	008	Albania 	Albanija	\N
00040000-561f-c2a2-549b-120e604ea158	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561f-c2a2-6368-528c881aaf6e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561f-c2a2-335b-e9b62366f903	AD	AND	020	Andorra 	Andora	\N
00040000-561f-c2a2-e84c-cd2da4a12a55	AO	AGO	024	Angola 	Angola	\N
00040000-561f-c2a2-1398-5834dd3bea16	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561f-c2a2-d328-dba177239d1a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561f-c2a2-c433-2cc4635c5903	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-c2a2-22fa-b23cb99903a4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561f-c2a2-0b39-25c63d45d748	AM	ARM	051	Armenia 	Armenija	\N
00040000-561f-c2a2-206f-687a2e083d21	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561f-c2a2-ddab-c9aca46af891	AU	AUS	036	Australia 	Avstralija	\N
00040000-561f-c2a2-0384-0db80963ff48	AT	AUT	040	Austria 	Avstrija	\N
00040000-561f-c2a2-b852-05308484aaae	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561f-c2a2-75d1-2302c60d700b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561f-c2a2-2e4f-36d6027a7eb8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561f-c2a2-9566-7412cb89dcef	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561f-c2a2-5fa3-acfd2ece2e8b	BB	BRB	052	Barbados 	Barbados	\N
00040000-561f-c2a2-3429-451408c7acd5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561f-c2a2-7437-d30f69727a03	BE	BEL	056	Belgium 	Belgija	\N
00040000-561f-c2a2-23b2-e2619f3632ce	BZ	BLZ	084	Belize 	Belize	\N
00040000-561f-c2a2-edec-7b5ff1c6f4f0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561f-c2a2-a9bf-82517d011e50	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561f-c2a2-cf83-757784c71698	BT	BTN	064	Bhutan 	Butan	\N
00040000-561f-c2a2-f6dc-a3eb87dae504	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561f-c2a2-6987-540c25a9e3f0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561f-c2a2-4df2-031265e4079b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561f-c2a2-0766-77d6ca255d97	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561f-c2a2-6034-4bd7b8ce5ae1	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561f-c2a2-59f5-aa81f5582a38	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561f-c2a2-a5af-6864f29cfa5d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561f-c2a2-93b4-8fa9ad992ba9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561f-c2a2-02c2-ef6b01897a7d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561f-c2a2-4158-a7fab56d3bfb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561f-c2a2-e478-1ccc4a993761	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561f-c2a2-1cf7-06607b893317	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561f-c2a2-71dc-e7c05379061e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561f-c2a2-155e-6f829bbdfe28	CA	CAN	124	Canada 	Kanada	\N
00040000-561f-c2a2-6697-f7405efc23d6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561f-c2a2-aadc-5578ba9f3524	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561f-c2a2-8daf-2c0d632374c5	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561f-c2a2-6326-ae6cb58571d0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561f-c2a2-c661-34daecac7263	CL	CHL	152	Chile 	Čile	\N
00040000-561f-c2a2-d649-95fff0328b58	CN	CHN	156	China 	Kitajska	\N
00040000-561f-c2a2-b9c9-ddae9406c574	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561f-c2a2-83fc-da37c323a323	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561f-c2a2-5fd7-f6014e8869b3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561f-c2a2-e195-fb38ba68f645	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561f-c2a2-04b8-c8c0068146c6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561f-c2a2-2c2d-6a9d43c7b975	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561f-c2a2-e348-3c55595126e9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561f-c2a2-8a6a-9ef8b5f70ace	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561f-c2a2-9e0b-6fd37c83e867	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561f-c2a2-0276-bbd2c7360e40	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561f-c2a2-5549-76f1a767d673	CU	CUB	192	Cuba 	Kuba	\N
00040000-561f-c2a2-32ab-b4acc5d832d3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561f-c2a2-242f-05dd61fd3d65	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561f-c2a2-172e-c097f9f40da3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561f-c2a2-6fc7-a4e10698eab2	DK	DNK	208	Denmark 	Danska	\N
00040000-561f-c2a2-838f-22353b57c9fc	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561f-c2a2-1bfe-73fded0ec4e2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-c2a2-ca35-7e219b95e631	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561f-c2a2-f78d-43c81a5bbab0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561f-c2a2-77b5-2c304ea835ee	EG	EGY	818	Egypt 	Egipt	\N
00040000-561f-c2a2-50a0-ab5f7c340297	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561f-c2a2-93cf-446f1c14de7a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561f-c2a2-3002-92e1a116b712	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561f-c2a2-7e7a-7c9572ee07e3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561f-c2a2-28c1-c0372480533f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561f-c2a2-b45b-85bbdb5383dd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561f-c2a2-2406-626a21849854	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561f-c2a2-8163-f706f3dd0f73	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561f-c2a2-42d6-4902befc6d10	FI	FIN	246	Finland 	Finska	\N
00040000-561f-c2a2-c74e-232306dc07ac	FR	FRA	250	France 	Francija	\N
00040000-561f-c2a2-0d34-6438b7b9e050	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561f-c2a3-4e2b-1bd0e4782d52	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561f-c2a2-d976-9f15e878a27d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561f-c2a2-f2f4-0c91c7700ad8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561f-c2a2-ab68-1c706c7c2e51	GA	GAB	266	Gabon 	Gabon	\N
00040000-561f-c2a2-1983-d8c3d38c563a	GM	GMB	270	Gambia 	Gambija	\N
00040000-561f-c2a2-e87d-8a24211a49b1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561f-c2a2-3429-0c9c42155f4d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561f-c2a2-f971-cf2c9d568d3f	GH	GHA	288	Ghana 	Gana	\N
00040000-561f-c2a2-c243-6c2f84534ddf	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561f-c2a2-fb71-890d1fa6c4a7	GR	GRC	300	Greece 	Grčija	\N
00040000-561f-c2a2-afcf-e1a4c23411f5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561f-c2a2-f05c-74dc884fd8d2	GD	GRD	308	Grenada 	Grenada	\N
00040000-561f-c2a2-28ec-6d39118d0c5b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561f-c2a2-2d40-f0c38dba331c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561f-c2a2-fbc8-fb6f6956bfce	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561f-c2a2-5a9f-34d5ed322b47	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561f-c2a2-028e-fa8ebb4881bd	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561f-c2a2-6455-c9d8176ec6d0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561f-c2a2-d920-764c4c4799a1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561f-c2a2-109c-f53741414825	HT	HTI	332	Haiti 	Haiti	\N
00040000-561f-c2a2-30e9-a66441565797	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561f-c2a2-337b-6843caa4948f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561f-c2a2-e192-061740a6566b	HN	HND	340	Honduras 	Honduras	\N
00040000-561f-c2a2-f4e2-8621c5db7af3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561f-c2a2-656c-459be27efe94	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561f-c2a2-d274-3830f1ee99e8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561f-c2a2-a8a9-c4b9beb86ffd	IN	IND	356	India 	Indija	\N
00040000-561f-c2a2-0bad-86718f09838a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561f-c2a2-3c33-849fd7b98a29	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561f-c2a2-d520-f0aa569efc5c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561f-c2a2-191c-dbd4168b2b36	IE	IRL	372	Ireland 	Irska	\N
00040000-561f-c2a2-f134-945de3495954	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561f-c2a2-5a24-7b39c3a24702	IL	ISR	376	Israel 	Izrael	\N
00040000-561f-c2a2-4ddf-6dba3dc87dd5	IT	ITA	380	Italy 	Italija	\N
00040000-561f-c2a2-ee01-4b109527f4dd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561f-c2a2-006b-393f32fb29fa	JP	JPN	392	Japan 	Japonska	\N
00040000-561f-c2a2-dc3f-74b933111a6c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561f-c2a2-c27b-eff5d2279ea4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561f-c2a2-333e-423772c0d0f6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561f-c2a2-5d30-c3c342740489	KE	KEN	404	Kenya 	Kenija	\N
00040000-561f-c2a2-8b79-e22247246c99	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561f-c2a2-ba86-495ea0d3d932	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561f-c2a2-d0cb-c52aba9e5386	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561f-c2a2-4e19-69e834b29e71	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561f-c2a2-d8f5-337202f64040	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561f-c2a2-dcad-9cd66a678933	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561f-c2a2-e74e-902fcd3d15e9	LV	LVA	428	Latvia 	Latvija	\N
00040000-561f-c2a2-ceb3-8afa7033f089	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561f-c2a2-67be-a60650eb582c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561f-c2a2-2cb2-b1c277c549cf	LR	LBR	430	Liberia 	Liberija	\N
00040000-561f-c2a2-14ce-56b8aaf958af	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561f-c2a2-d640-3543b411e29b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561f-c2a2-0985-30dd769515bb	LT	LTU	440	Lithuania 	Litva	\N
00040000-561f-c2a2-e1b9-388bba77ed3f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561f-c2a2-3d30-14f8e5e46241	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561f-c2a2-e7bb-5fd5c14c3930	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561f-c2a2-ab91-0d31b13ed046	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561f-c2a2-5bfd-cd91eeb07933	MW	MWI	454	Malawi 	Malavi	\N
00040000-561f-c2a2-5717-fc32d56a5e9d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561f-c2a2-4c6f-365de8519a96	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561f-c2a2-9749-a687d4d71242	ML	MLI	466	Mali 	Mali	\N
00040000-561f-c2a2-a163-a18193b9690c	MT	MLT	470	Malta 	Malta	\N
00040000-561f-c2a2-21dd-2ac04823146f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561f-c2a2-b7bd-3de45803366a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561f-c2a3-b0d7-604440d19734	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561f-c2a3-a682-4c9b7de2884a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561f-c2a3-1132-5bea09d9dfeb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561f-c2a3-cf60-060b6cfca446	MX	MEX	484	Mexico 	Mehika	\N
00040000-561f-c2a3-57c8-d76d6fa31afd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561f-c2a3-8b97-9a8ffd52dbbd	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561f-c2a3-369e-e9cc0f760fdd	MC	MCO	492	Monaco 	Monako	\N
00040000-561f-c2a3-5585-4d37d78278a9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561f-c2a3-5cd5-4542bb9e5461	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561f-c2a3-c76b-dba92b06c0f7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561f-c2a3-0a80-ca6b11537549	MA	MAR	504	Morocco 	Maroko	\N
00040000-561f-c2a3-fd7d-cb66d731d59b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561f-c2a3-aebd-97fcebe88c14	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561f-c2a3-78a4-89669772f1ab	NA	NAM	516	Namibia 	Namibija	\N
00040000-561f-c2a3-43cb-0a790ada4617	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561f-c2a3-3368-67bcd6095d48	NP	NPL	524	Nepal 	Nepal	\N
00040000-561f-c2a3-0af6-3610ebdc011c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561f-c2a3-5801-afd761593fc3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561f-c2a3-6e7d-63a9df4653f4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561f-c2a3-8445-1c7cda2c3f3f	NE	NER	562	Niger 	Niger 	\N
00040000-561f-c2a3-7ca2-51aa2da8161c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561f-c2a3-d2a2-746469e91dda	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561f-c2a3-6a2d-9927754de257	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561f-c2a3-6fda-f14b99622e32	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561f-c2a3-2401-96c44f63f785	NO	NOR	578	Norway 	Norveška	\N
00040000-561f-c2a3-6c88-7fe33c709337	OM	OMN	512	Oman 	Oman	\N
00040000-561f-c2a3-84f7-862739a6e5c3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561f-c2a3-cd30-60336fafcf13	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561f-c2a3-a04a-26200c87c6b3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561f-c2a3-4758-3a24f359cd95	PA	PAN	591	Panama 	Panama	\N
00040000-561f-c2a3-21e2-371598e0b8ff	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561f-c2a3-3e47-bd1d01bce0ba	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561f-c2a3-4285-dfacb617f234	PE	PER	604	Peru 	Peru	\N
00040000-561f-c2a3-e1a5-9d67f6017b74	PH	PHL	608	Philippines 	Filipini	\N
00040000-561f-c2a3-436b-04c47d187c68	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561f-c2a3-23d6-422c1a0a854a	PL	POL	616	Poland 	Poljska	\N
00040000-561f-c2a3-e30b-697899bfa250	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561f-c2a3-e0fc-eb82339e488b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561f-c2a3-facc-1a65292cda3a	QA	QAT	634	Qatar 	Katar	\N
00040000-561f-c2a3-88dd-86da66135e88	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561f-c2a3-ece1-66cace5aaae3	RO	ROU	642	Romania 	Romunija	\N
00040000-561f-c2a3-3acb-cf7fa30786b3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561f-c2a3-1363-f2e070f080ce	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561f-c2a3-326a-1073e11c280e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561f-c2a3-50ca-97e9ad5da90f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561f-c2a3-b59b-3e875d5de257	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561f-c2a3-d507-fe3b008e8ba7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561f-c2a3-9d14-16ac8ac400bf	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561f-c2a3-3b4a-6eaac365ec5c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561f-c2a3-4ce2-f3bcf957b369	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561f-c2a3-c8d6-171846e814ea	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561f-c2a3-7155-2f6207134bc1	SM	SMR	674	San Marino 	San Marino	\N
00040000-561f-c2a3-f86b-7114e4302d64	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561f-c2a3-a030-d80645530e3a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561f-c2a3-93ab-3d4af02bd849	SN	SEN	686	Senegal 	Senegal	\N
00040000-561f-c2a3-1837-a93e43987f3a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561f-c2a3-1e03-fece32a0dd1a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561f-c2a3-5915-b55f5bdf3442	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561f-c2a3-7315-85f9650a5c24	SG	SGP	702	Singapore 	Singapur	\N
00040000-561f-c2a3-a4b1-36bddbcac25a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561f-c2a3-51c6-5b301f8757fd	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561f-c2a3-6f01-e63cd2fc7b30	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561f-c2a3-725b-a67fe4ccd108	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561f-c2a3-b50f-2f60b8cdbcb2	SO	SOM	706	Somalia 	Somalija	\N
00040000-561f-c2a3-f9fe-7ba0e6fc965f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561f-c2a3-b7f0-35b9609313fd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561f-c2a3-b27b-b8b8e5b2e68d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561f-c2a3-6763-cd5bbc331f0a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561f-c2a3-84c3-3206cd09da8c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561f-c2a3-d0b1-0259a4c6a179	SD	SDN	729	Sudan 	Sudan	\N
00040000-561f-c2a3-8659-c9fa37d4f370	SR	SUR	740	Suriname 	Surinam	\N
00040000-561f-c2a3-8a00-360617b8cb89	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561f-c2a3-739c-49440a0a01d6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561f-c2a3-2bff-ad381a134596	SE	SWE	752	Sweden 	Švedska	\N
00040000-561f-c2a3-4fea-39df26a779fa	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561f-c2a3-bddc-66ddca11e1a9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561f-c2a3-7582-7488f4dd8051	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561f-c2a3-8965-03a8ab4f857d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561f-c2a3-6ea0-903967bc3c8d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561f-c2a3-ea45-185300e365b9	TH	THA	764	Thailand 	Tajska	\N
00040000-561f-c2a3-446b-7a0cbfa2eaf7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561f-c2a3-5429-b877a5b5bffe	TG	TGO	768	Togo 	Togo	\N
00040000-561f-c2a3-8de9-7d3744f3bf61	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561f-c2a3-d71a-de76f1abc893	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561f-c2a3-96b2-fd8d257a2c0e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561f-c2a3-7848-dbbf5d6a6537	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561f-c2a3-a21e-369f8fa02350	TR	TUR	792	Turkey 	Turčija	\N
00040000-561f-c2a3-1e05-25b132cfeebb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561f-c2a3-6a4a-9fb685c2c7ca	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-c2a3-6bed-8f81f509298f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561f-c2a3-98df-784b34b853c2	UG	UGA	800	Uganda 	Uganda	\N
00040000-561f-c2a3-8400-bf24a8a9e0ba	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561f-c2a3-94d5-69c5c027f76a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561f-c2a3-063b-ea0cbf4b79d7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561f-c2a3-c896-3b5931529a89	US	USA	840	United States 	Združene države Amerike	\N
00040000-561f-c2a3-b499-199a6c586e6d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561f-c2a3-44a6-0fc16ae73ae3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561f-c2a3-f23a-85cddfcbba38	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561f-c2a3-e74d-2641ac7e8968	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561f-c2a3-316d-5e9734e69ae9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561f-c2a3-cca5-1125a4a6fcc0	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561f-c2a3-9a08-829546acc0cf	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-c2a3-69ed-0dc0baa65b5b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561f-c2a3-8889-ca655a94dd69	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561f-c2a3-41b9-061ada5c010d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561f-c2a3-c862-8a7ecb8963c0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561f-c2a3-7be0-de1aa4848a57	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561f-c2a3-c806-96f1cb8ba970	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3067 (class 0 OID 22032252)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561f-c2a5-3555-30141bf2279b	000e0000-561f-c2a5-3664-de6982aeabb2	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-c2a2-f721-3db50bb663e4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-c2a5-bd1a-940540097837	000e0000-561f-c2a5-9474-bef743a3c39d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-c2a2-301f-03b3b2219fa9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-c2a5-b73a-7299f7f78eae	000e0000-561f-c2a5-6aca-7d47b1c166c4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-c2a2-f721-3db50bb663e4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561f-c2a5-1ce3-6395a503e77f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561f-c2a5-2754-18e29c691295	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 22032054)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561f-c2a5-171e-c130f2d27f87	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-ad86-d85bd0a45301	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-c2a2-5362-efcb458a0a0d
000d0000-561f-c2a5-4fcb-c7166ddb899d	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-15d5-94ae4348dbdf	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561f-c2a2-8689-d20475f51c53
000d0000-561f-c2a5-f42a-6656d3928310	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-a9a4-7795d6b896a2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561f-c2a2-2728-4d192de08d9f
000d0000-561f-c2a5-11aa-8fbbeb14fe1c	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-2dae-128fe8ad13c0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561f-c2a2-9095-1287bc7ce9f3
000d0000-561f-c2a5-ef80-a062fb02914c	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-011f-08cd1963f9cb	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561f-c2a2-9095-1287bc7ce9f3
000d0000-561f-c2a5-0a90-48a4b0a5530c	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-7794-c1816985fdf2	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-c2a2-5362-efcb458a0a0d
000d0000-561f-c2a5-47a8-3b74b91e4ea7	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-8609-65029268b390	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561f-c2a2-5362-efcb458a0a0d
000d0000-561f-c2a5-30f5-37c9054b1c7c	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-a192-4b09b60e9a9a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561f-c2a2-ec16-11c185bf7b0d
000d0000-561f-c2a5-2f23-3be7308507a3	000e0000-561f-c2a5-9474-bef743a3c39d	000c0000-561f-c2a5-804b-bf357ada2ca4	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561f-c2a2-ef39-e02d3d837b42
\.


--
-- TOC entry 3032 (class 0 OID 22031869)
-- Dependencies: 196
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 22031843)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 22031820)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561f-c2a5-853a-a76663bd8579	00080000-561f-c2a5-730f-153b4b3cf990	00090000-561f-c2a5-2c56-4c389c051b8a	AK		igralka
\.


--
-- TOC entry 3041 (class 0 OID 22031968)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 22032491)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22032503)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 22032525)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 22028081)
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
\.


--
-- TOC entry 3045 (class 0 OID 22031993)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 22031777)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561f-c2a3-7fc0-e2487809a9fd	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561f-c2a3-088d-a2185feffb4a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561f-c2a3-055e-3712b326960f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561f-c2a3-b00b-cc9e84b9518e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561f-c2a3-6225-fac407529cb6	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561f-c2a3-0ff4-e48c652bd59e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561f-c2a3-f1b5-13a65b6b6c49	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561f-c2a3-d82b-ac556e2b8eb7	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-c2a3-ce3f-0fec559fd25b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-c2a3-b5f2-722ed26d89e1	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561f-c2a3-a327-73721749f5f4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561f-c2a3-e345-14b29bc752a2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561f-c2a3-cdd5-228df254bc41	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561f-c2a3-5694-2256f0bb7557	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561f-c2a3-27c4-cbabf015f069	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561f-c2a5-5f8d-37bf1f1c73f5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561f-c2a5-403c-313bac10c816	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561f-c2a5-ba2b-54a2749b5c61	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561f-c2a5-ca5c-bd0b98fca752	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561f-c2a5-459f-c6f8596da196	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561f-c2a7-1114-e8188b330b9b	application.tenant.maticnopodjetje	string	s:36:"00080000-561f-c2a7-e401-98b2786f18f0";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3019 (class 0 OID 22031690)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561f-c2a5-3d34-252bd0512615	00000000-561f-c2a5-5f8d-37bf1f1c73f5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561f-c2a5-0b39-f3fa638c2d91	00000000-561f-c2a5-5f8d-37bf1f1c73f5	00010000-561f-c2a3-4b11-e845264cd5fa	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561f-c2a5-b26a-65ac40fbce6f	00000000-561f-c2a5-403c-313bac10c816	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3020 (class 0 OID 22031701)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561f-c2a5-5490-f38e31e9caca	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561f-c2a5-a4a6-469034c9e823	00010000-561f-c2a5-b861-43837dc9ac01	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561f-c2a5-b342-c476857e6b66	00010000-561f-c2a5-b874-0c64db869014	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561f-c2a5-ef77-37f120455a1b	00010000-561f-c2a5-6784-92560e6205ac	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561f-c2a5-abca-910d0b7a1b97	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561f-c2a5-fdaf-4e6e1dca63a5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561f-c2a5-e496-ac62ab15fb02	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561f-c2a5-6f67-b5db2ec345d4	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561f-c2a5-2c56-4c389c051b8a	00010000-561f-c2a5-945d-8a915b85b1a3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561f-c2a5-d2c4-08f02ce895cf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561f-c2a5-a2ec-2ccd948ac498	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-c2a5-5a6d-4f7c3243dfda	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561f-c2a5-e109-3a3ffe915dfa	00010000-561f-c2a5-3053-1da4acb10bb6	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-c2a5-935c-6fa4801aacc6	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-c2a5-5459-16b897ed3e16	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-c2a5-7c09-e84fdbcf7bba	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-c2a5-d75d-6279938ebaec	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561f-c2a5-0506-c3417728dec0	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 22031645)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561f-c2a3-b4cf-8a5909b76118	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561f-c2a3-e14a-d13b4d5d0143	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561f-c2a3-aa1d-2e54587e914c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561f-c2a3-4076-29091d2a1231	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561f-c2a3-c676-732bda9415ee	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561f-c2a3-c3a0-989cad710971	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561f-c2a3-f246-9ff0cb115964	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561f-c2a3-438b-4976a7bd94c2	Abonma-read	Abonma - branje	f
00030000-561f-c2a3-3926-9f9f3cf67597	Abonma-write	Abonma - spreminjanje	f
00030000-561f-c2a3-2ca3-14834219acef	Alternacija-read	Alternacija - branje	f
00030000-561f-c2a3-5bfd-6d9c8e46fc36	Alternacija-write	Alternacija - spreminjanje	f
00030000-561f-c2a3-15cd-4e1faddc7c51	Arhivalija-read	Arhivalija - branje	f
00030000-561f-c2a3-c891-0c84e83c9759	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561f-c2a3-201c-0ad32527b013	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561f-c2a3-365c-8ca88ecf8501	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561f-c2a3-ced2-92aee49e33e5	Besedilo-read	Besedilo - branje	f
00030000-561f-c2a3-2586-87ab507c696e	Besedilo-write	Besedilo - spreminjanje	f
00030000-561f-c2a3-1df7-5b5eb4210801	DogodekIzven-read	DogodekIzven - branje	f
00030000-561f-c2a3-2c41-d9e458c7b3b2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561f-c2a3-1702-754a74532b33	Dogodek-read	Dogodek - branje	f
00030000-561f-c2a3-3f3b-de06f0792810	Dogodek-write	Dogodek - spreminjanje	f
00030000-561f-c2a3-fdae-ae9b5457075a	DrugiVir-read	DrugiVir - branje	f
00030000-561f-c2a3-7848-866a8a77248b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561f-c2a3-8073-4c4c9e1b6f7d	Drzava-read	Drzava - branje	f
00030000-561f-c2a3-3a5e-172422030a2a	Drzava-write	Drzava - spreminjanje	f
00030000-561f-c2a3-5886-6fd9c23011d7	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561f-c2a3-fcff-10824d287900	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561f-c2a3-6a15-5f96dbe11a0f	Funkcija-read	Funkcija - branje	f
00030000-561f-c2a3-0d52-073d7ac9f81c	Funkcija-write	Funkcija - spreminjanje	f
00030000-561f-c2a3-7a5a-cab79cc3ba54	Gostovanje-read	Gostovanje - branje	f
00030000-561f-c2a3-0f25-7d77e143290d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561f-c2a3-1851-bb2dcbfbb08b	Gostujoca-read	Gostujoca - branje	f
00030000-561f-c2a3-2c47-335005e33b44	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561f-c2a3-2f31-76c79d499796	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561f-c2a3-3a99-1b281ecd8aa6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561f-c2a3-caf6-0ad6463fbd0a	Kupec-read	Kupec - branje	f
00030000-561f-c2a3-8609-4406f4143952	Kupec-write	Kupec - spreminjanje	f
00030000-561f-c2a3-7af4-43227ff2ab1b	NacinPlacina-read	NacinPlacina - branje	f
00030000-561f-c2a3-e667-a6c6ecbe1a23	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561f-c2a3-4cad-d6f0b8b5e343	Option-read	Option - branje	f
00030000-561f-c2a3-4ac4-653d8d27579a	Option-write	Option - spreminjanje	f
00030000-561f-c2a3-d16c-b55f55800b68	OptionValue-read	OptionValue - branje	f
00030000-561f-c2a3-61bb-a6a1ec44743c	OptionValue-write	OptionValue - spreminjanje	f
00030000-561f-c2a3-ed5a-44bcacc05711	Oseba-read	Oseba - branje	f
00030000-561f-c2a3-efd7-120660fde8c8	Oseba-write	Oseba - spreminjanje	f
00030000-561f-c2a3-79a4-dc2dea1dae2e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561f-c2a3-36e1-dea3dfb70c17	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561f-c2a3-a459-65cbe1b80a72	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561f-c2a3-430a-350c1ceea18b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561f-c2a3-07b7-6688c1ed83f9	Pogodba-read	Pogodba - branje	f
00030000-561f-c2a3-147f-31e17f63c25e	Pogodba-write	Pogodba - spreminjanje	f
00030000-561f-c2a3-a2eb-4fd171a6431c	Popa-read	Popa - branje	f
00030000-561f-c2a3-fb3d-f476dc1b0f90	Popa-write	Popa - spreminjanje	f
00030000-561f-c2a3-e4c5-c162d7832a4f	Posta-read	Posta - branje	f
00030000-561f-c2a3-acda-73ecf9392149	Posta-write	Posta - spreminjanje	f
00030000-561f-c2a3-f4f5-2e3810eb9fab	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561f-c2a3-76e2-1bd5c7cc54f6	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561f-c2a3-5c7c-27614d41bbbe	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561f-c2a3-4369-ca0fbbabaf98	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561f-c2a3-7285-ccf9fba70bae	PostniNaslov-read	PostniNaslov - branje	f
00030000-561f-c2a3-bf0d-9e4b895ba3f8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561f-c2a3-b5ee-91df9b1391ff	Predstava-read	Predstava - branje	f
00030000-561f-c2a3-73ee-712da4997121	Predstava-write	Predstava - spreminjanje	f
00030000-561f-c2a3-b602-5a2e45ba0420	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561f-c2a3-a808-bb830f33c94d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561f-c2a3-e77c-1eb17de380ff	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561f-c2a3-0eef-f1b39a9f2b7d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561f-c2a3-ec05-97a7191f9c6c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561f-c2a3-6d71-4e4eea5de12e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561f-c2a3-d6fe-7e3ce4938287	ProgramDela-read	ProgramDela - branje	f
00030000-561f-c2a3-90d2-a1fc45406632	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561f-c2a3-5e2d-b17d658865c6	ProgramFestival-read	ProgramFestival - branje	f
00030000-561f-c2a3-3e5e-4add1c9b0c00	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561f-c2a3-2642-6b0c778a4e78	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561f-c2a3-2f4e-e5e4aa397ccf	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561f-c2a3-2e25-b479c3b6ff57	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561f-c2a3-b494-b30cdd125f2e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561f-c2a3-25f6-b6013c753458	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561f-c2a3-65fd-80698694e682	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561f-c2a3-6673-e1755dee2755	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561f-c2a3-0066-420a0dd3e794	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561f-c2a3-868c-cecff94ea1d3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561f-c2a3-6c73-f987145099c6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561f-c2a3-afac-96b06ef6325b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561f-c2a3-449e-38a4ed22cc81	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561f-c2a3-5dcc-abd9c61cb484	ProgramRazno-read	ProgramRazno - branje	f
00030000-561f-c2a3-4728-7e4a7e4d48ad	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561f-c2a3-c42c-a70f8d758afc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561f-c2a3-1210-b08aaecbc524	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561f-c2a3-4349-d7c839bdbe0b	Prostor-read	Prostor - branje	f
00030000-561f-c2a3-354e-4ab2a726384a	Prostor-write	Prostor - spreminjanje	f
00030000-561f-c2a3-cf34-4bc03dd1ec22	Racun-read	Racun - branje	f
00030000-561f-c2a3-db96-bf8bd072fc68	Racun-write	Racun - spreminjanje	f
00030000-561f-c2a3-e617-94d98b1c22fb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561f-c2a3-547d-d8f0050f84c4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561f-c2a3-a8fa-9c4e9860def2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561f-c2a3-4026-1733acb5e2cc	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561f-c2a3-dc3d-a5540a341ebb	Rekvizit-read	Rekvizit - branje	f
00030000-561f-c2a3-64db-51662162cffa	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561f-c2a3-04da-f7ab38496be1	Revizija-read	Revizija - branje	f
00030000-561f-c2a3-3e7e-b361df037faf	Revizija-write	Revizija - spreminjanje	f
00030000-561f-c2a3-128d-6a942d601726	Rezervacija-read	Rezervacija - branje	f
00030000-561f-c2a3-a4bd-f078098ea9df	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561f-c2a3-77bf-b11457557780	SedezniRed-read	SedezniRed - branje	f
00030000-561f-c2a3-137b-def482e2670f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561f-c2a3-9afd-6b9fd8736648	Sedez-read	Sedez - branje	f
00030000-561f-c2a3-1a8d-19f98fc5afaf	Sedez-write	Sedez - spreminjanje	f
00030000-561f-c2a3-5de8-294e136f2d04	Sezona-read	Sezona - branje	f
00030000-561f-c2a3-7457-bda74721ae1a	Sezona-write	Sezona - spreminjanje	f
00030000-561f-c2a3-3305-4c10c84eb1e7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561f-c2a3-b550-ae7b33f7499f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561f-c2a3-b79d-85f28786e7b8	Stevilcenje-read	Stevilcenje - branje	f
00030000-561f-c2a3-2e8e-2dbaad462c70	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561f-c2a3-f36b-01d5dfc67af8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561f-c2a3-4c4c-50c3b8f518ae	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561f-c2a3-1b3f-d54cadad87c4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561f-c2a3-319d-b4cdb4c6253e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561f-c2a3-1675-9a4da4655df5	Telefonska-read	Telefonska - branje	f
00030000-561f-c2a3-4048-8a74adfd335d	Telefonska-write	Telefonska - spreminjanje	f
00030000-561f-c2a3-47a4-bbb87078b914	TerminStoritve-read	TerminStoritve - branje	f
00030000-561f-c2a3-981a-dc4e496825ff	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561f-c2a3-b926-86e11bb32d8a	TipFunkcije-read	TipFunkcije - branje	f
00030000-561f-c2a3-de92-f7502a9d5eec	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561f-c2a3-1f8b-6c8933711ae1	TipPopa-read	TipPopa - branje	f
00030000-561f-c2a3-9532-a53aef6be3fe	TipPopa-write	TipPopa - spreminjanje	f
00030000-561f-c2a3-21f5-d9476f1d8c19	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561f-c2a3-f636-64eecfe46657	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561f-c2a3-e0b8-87951002faca	Trr-read	Trr - branje	f
00030000-561f-c2a3-555f-bf37c6a49416	Trr-write	Trr - spreminjanje	f
00030000-561f-c2a3-42bf-f427afffb731	Uprizoritev-read	Uprizoritev - branje	f
00030000-561f-c2a3-28ea-e114ee0389c1	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561f-c2a3-a1a0-6eea4efcf183	Vaja-read	Vaja - branje	f
00030000-561f-c2a3-fbee-5b291710effb	Vaja-write	Vaja - spreminjanje	f
00030000-561f-c2a3-16b5-4dd56f63c592	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561f-c2a3-66d4-cda041aff143	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561f-c2a3-18b6-5af268c8df24	VrstaStroska-read	VrstaStroska - branje	f
00030000-561f-c2a3-2b0d-86436812df09	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561f-c2a3-c4f8-5b86d24aadbf	Zaposlitev-read	Zaposlitev - branje	f
00030000-561f-c2a3-db76-c3ba1486b12e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561f-c2a3-f7b8-87dea7ca3577	Zasedenost-read	Zasedenost - branje	f
00030000-561f-c2a3-9696-fb1b9302008e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561f-c2a3-01f7-58d6f9416b45	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561f-c2a3-7ef6-de1d36408595	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561f-c2a3-4868-78321b62e1be	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561f-c2a3-7359-f4c45573ea65	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561f-c2a3-35e8-7b80279d5221	Job-read	Branje opravil - samo zase - branje	f
00030000-561f-c2a3-90ba-1c157e96e8e9	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561f-c2a3-362a-3feb862c1729	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561f-c2a3-5cae-341ab5904386	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561f-c2a3-50a5-59011526fa10	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561f-c2a3-cf46-a955bc55cf8d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561f-c2a3-3f14-f9e3e2b2c103	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561f-c2a3-12dc-4b658baa9acc	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-c2a3-9114-1d941538c027	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-c2a3-8a18-f294ac978b15	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-c2a3-7d5c-bbe97519dabb	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-c2a3-085c-45f0055c4882	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561f-c2a3-fa67-6778987ba127	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561f-c2a3-462e-b3cd9c318b55	Datoteka-write	Datoteka - spreminjanje	f
00030000-561f-c2a3-e18b-03734f8b6448	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3016 (class 0 OID 22031664)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561f-c2a3-7ac6-3836df6a6eba	00030000-561f-c2a3-e14a-d13b4d5d0143
00020000-561f-c2a3-ab12-7e95bc572e0d	00030000-561f-c2a3-8073-4c4c9e1b6f7d
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-438b-4976a7bd94c2
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-3926-9f9f3cf67597
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-2ca3-14834219acef
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-5bfd-6d9c8e46fc36
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-15cd-4e1faddc7c51
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-1702-754a74532b33
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-4076-29091d2a1231
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-3f3b-de06f0792810
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-8073-4c4c9e1b6f7d
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-3a5e-172422030a2a
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-6a15-5f96dbe11a0f
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-0d52-073d7ac9f81c
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-7a5a-cab79cc3ba54
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-0f25-7d77e143290d
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-1851-bb2dcbfbb08b
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-2c47-335005e33b44
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-2f31-76c79d499796
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-3a99-1b281ecd8aa6
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-4cad-d6f0b8b5e343
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-d16c-b55f55800b68
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-ed5a-44bcacc05711
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-efd7-120660fde8c8
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-a2eb-4fd171a6431c
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-fb3d-f476dc1b0f90
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-e4c5-c162d7832a4f
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-acda-73ecf9392149
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-7285-ccf9fba70bae
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-bf0d-9e4b895ba3f8
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-b5ee-91df9b1391ff
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-73ee-712da4997121
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-ec05-97a7191f9c6c
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-6d71-4e4eea5de12e
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-4349-d7c839bdbe0b
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-354e-4ab2a726384a
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-a8fa-9c4e9860def2
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-4026-1733acb5e2cc
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-dc3d-a5540a341ebb
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-64db-51662162cffa
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-5de8-294e136f2d04
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-7457-bda74721ae1a
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-b926-86e11bb32d8a
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-42bf-f427afffb731
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-28ea-e114ee0389c1
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-a1a0-6eea4efcf183
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-fbee-5b291710effb
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-f7b8-87dea7ca3577
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-9696-fb1b9302008e
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-01f7-58d6f9416b45
00020000-561f-c2a3-0979-ef5eb0f1300c	00030000-561f-c2a3-4868-78321b62e1be
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-438b-4976a7bd94c2
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-15cd-4e1faddc7c51
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-1702-754a74532b33
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-8073-4c4c9e1b6f7d
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-7a5a-cab79cc3ba54
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-1851-bb2dcbfbb08b
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-2f31-76c79d499796
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-3a99-1b281ecd8aa6
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-4cad-d6f0b8b5e343
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-d16c-b55f55800b68
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-ed5a-44bcacc05711
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-efd7-120660fde8c8
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-a2eb-4fd171a6431c
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-e4c5-c162d7832a4f
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-7285-ccf9fba70bae
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-bf0d-9e4b895ba3f8
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-b5ee-91df9b1391ff
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-4349-d7c839bdbe0b
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-a8fa-9c4e9860def2
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-dc3d-a5540a341ebb
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-5de8-294e136f2d04
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-1675-9a4da4655df5
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-4048-8a74adfd335d
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-e0b8-87951002faca
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-555f-bf37c6a49416
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-c4f8-5b86d24aadbf
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-db76-c3ba1486b12e
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-01f7-58d6f9416b45
00020000-561f-c2a3-043c-39d2255d8297	00030000-561f-c2a3-4868-78321b62e1be
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-438b-4976a7bd94c2
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-2ca3-14834219acef
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-15cd-4e1faddc7c51
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-c891-0c84e83c9759
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-ced2-92aee49e33e5
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-1df7-5b5eb4210801
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-1702-754a74532b33
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-8073-4c4c9e1b6f7d
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-6a15-5f96dbe11a0f
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-7a5a-cab79cc3ba54
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-1851-bb2dcbfbb08b
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-2f31-76c79d499796
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-4cad-d6f0b8b5e343
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-d16c-b55f55800b68
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-ed5a-44bcacc05711
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-a2eb-4fd171a6431c
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-e4c5-c162d7832a4f
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-b5ee-91df9b1391ff
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-ec05-97a7191f9c6c
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-4349-d7c839bdbe0b
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-a8fa-9c4e9860def2
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-dc3d-a5540a341ebb
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-5de8-294e136f2d04
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-b926-86e11bb32d8a
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-a1a0-6eea4efcf183
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-f7b8-87dea7ca3577
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-01f7-58d6f9416b45
00020000-561f-c2a3-5833-733fda676d39	00030000-561f-c2a3-4868-78321b62e1be
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-438b-4976a7bd94c2
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-3926-9f9f3cf67597
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-5bfd-6d9c8e46fc36
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-15cd-4e1faddc7c51
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-1702-754a74532b33
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-8073-4c4c9e1b6f7d
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-7a5a-cab79cc3ba54
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-1851-bb2dcbfbb08b
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-4cad-d6f0b8b5e343
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-d16c-b55f55800b68
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-a2eb-4fd171a6431c
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-e4c5-c162d7832a4f
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-b5ee-91df9b1391ff
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-4349-d7c839bdbe0b
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-a8fa-9c4e9860def2
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-dc3d-a5540a341ebb
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-5de8-294e136f2d04
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-b926-86e11bb32d8a
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-01f7-58d6f9416b45
00020000-561f-c2a3-cbab-ad433dde1df2	00030000-561f-c2a3-4868-78321b62e1be
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-438b-4976a7bd94c2
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-15cd-4e1faddc7c51
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-1702-754a74532b33
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-8073-4c4c9e1b6f7d
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-7a5a-cab79cc3ba54
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-1851-bb2dcbfbb08b
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-4cad-d6f0b8b5e343
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-d16c-b55f55800b68
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-a2eb-4fd171a6431c
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-e4c5-c162d7832a4f
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-b5ee-91df9b1391ff
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-4349-d7c839bdbe0b
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-a8fa-9c4e9860def2
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-dc3d-a5540a341ebb
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-5de8-294e136f2d04
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-47a4-bbb87078b914
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-aa1d-2e54587e914c
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-b926-86e11bb32d8a
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-01f7-58d6f9416b45
00020000-561f-c2a3-67d1-2090023883df	00030000-561f-c2a3-4868-78321b62e1be
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-b4cf-8a5909b76118
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-e14a-d13b4d5d0143
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-aa1d-2e54587e914c
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4076-29091d2a1231
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-c676-732bda9415ee
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-c3a0-989cad710971
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-f246-9ff0cb115964
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-438b-4976a7bd94c2
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-3926-9f9f3cf67597
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2ca3-14834219acef
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-5bfd-6d9c8e46fc36
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-15cd-4e1faddc7c51
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-c891-0c84e83c9759
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-ced2-92aee49e33e5
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2586-87ab507c696e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-1df7-5b5eb4210801
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2c41-d9e458c7b3b2
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-1702-754a74532b33
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-3f3b-de06f0792810
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-8073-4c4c9e1b6f7d
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-3a5e-172422030a2a
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-fdae-ae9b5457075a
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-7848-866a8a77248b
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-5886-6fd9c23011d7
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-fcff-10824d287900
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-6a15-5f96dbe11a0f
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-0d52-073d7ac9f81c
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-7a5a-cab79cc3ba54
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-0f25-7d77e143290d
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-1851-bb2dcbfbb08b
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2c47-335005e33b44
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2f31-76c79d499796
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-3a99-1b281ecd8aa6
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-caf6-0ad6463fbd0a
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-8609-4406f4143952
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-7af4-43227ff2ab1b
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-e667-a6c6ecbe1a23
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4cad-d6f0b8b5e343
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4ac4-653d8d27579a
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-d16c-b55f55800b68
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-61bb-a6a1ec44743c
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-ed5a-44bcacc05711
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-efd7-120660fde8c8
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-79a4-dc2dea1dae2e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-36e1-dea3dfb70c17
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-a459-65cbe1b80a72
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-430a-350c1ceea18b
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-07b7-6688c1ed83f9
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-147f-31e17f63c25e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-a2eb-4fd171a6431c
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-fb3d-f476dc1b0f90
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-e4c5-c162d7832a4f
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-acda-73ecf9392149
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-f4f5-2e3810eb9fab
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-76e2-1bd5c7cc54f6
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-5c7c-27614d41bbbe
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4369-ca0fbbabaf98
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-7285-ccf9fba70bae
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-bf0d-9e4b895ba3f8
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-b5ee-91df9b1391ff
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-73ee-712da4997121
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-b602-5a2e45ba0420
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-a808-bb830f33c94d
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-e77c-1eb17de380ff
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-0eef-f1b39a9f2b7d
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-ec05-97a7191f9c6c
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-6d71-4e4eea5de12e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-d6fe-7e3ce4938287
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-90d2-a1fc45406632
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-5e2d-b17d658865c6
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-3e5e-4add1c9b0c00
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2642-6b0c778a4e78
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2f4e-e5e4aa397ccf
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2e25-b479c3b6ff57
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-b494-b30cdd125f2e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-25f6-b6013c753458
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-65fd-80698694e682
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-6673-e1755dee2755
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-0066-420a0dd3e794
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-868c-cecff94ea1d3
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-6c73-f987145099c6
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-afac-96b06ef6325b
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-449e-38a4ed22cc81
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-5dcc-abd9c61cb484
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4728-7e4a7e4d48ad
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-c42c-a70f8d758afc
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-1210-b08aaecbc524
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4349-d7c839bdbe0b
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-354e-4ab2a726384a
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-cf34-4bc03dd1ec22
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-db96-bf8bd072fc68
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-e617-94d98b1c22fb
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-547d-d8f0050f84c4
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-a8fa-9c4e9860def2
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4026-1733acb5e2cc
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-dc3d-a5540a341ebb
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-64db-51662162cffa
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-04da-f7ab38496be1
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-3e7e-b361df037faf
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-128d-6a942d601726
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-a4bd-f078098ea9df
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-77bf-b11457557780
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-137b-def482e2670f
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-9afd-6b9fd8736648
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-1a8d-19f98fc5afaf
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-5de8-294e136f2d04
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-7457-bda74721ae1a
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-3305-4c10c84eb1e7
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-b550-ae7b33f7499f
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-b79d-85f28786e7b8
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2e8e-2dbaad462c70
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-f36b-01d5dfc67af8
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4c4c-50c3b8f518ae
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-1b3f-d54cadad87c4
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-319d-b4cdb4c6253e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-1675-9a4da4655df5
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4048-8a74adfd335d
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-47a4-bbb87078b914
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-981a-dc4e496825ff
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-b926-86e11bb32d8a
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-de92-f7502a9d5eec
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-21f5-d9476f1d8c19
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-f636-64eecfe46657
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-e0b8-87951002faca
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-555f-bf37c6a49416
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-42bf-f427afffb731
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-28ea-e114ee0389c1
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-a1a0-6eea4efcf183
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-fbee-5b291710effb
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-16b5-4dd56f63c592
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-66d4-cda041aff143
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-18b6-5af268c8df24
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-2b0d-86436812df09
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-c4f8-5b86d24aadbf
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-db76-c3ba1486b12e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-f7b8-87dea7ca3577
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-9696-fb1b9302008e
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-01f7-58d6f9416b45
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-7ef6-de1d36408595
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-4868-78321b62e1be
00020000-561f-c2a5-209d-441cc3fe20c3	00030000-561f-c2a3-7359-f4c45573ea65
\.


--
-- TOC entry 3046 (class 0 OID 22032000)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 22032034)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 22032170)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561f-c2a5-5a53-b2cac2b5282a	00090000-561f-c2a5-5490-f38e31e9caca	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561f-c2a5-a69e-3baf1c850d07	00090000-561f-c2a5-fdaf-4e6e1dca63a5	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561f-c2a5-e6db-d6aa2748e764	00090000-561f-c2a5-e109-3a3ffe915dfa	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561f-c2a5-df14-4cfdeb772ed4	00090000-561f-c2a5-d2c4-08f02ce895cf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3022 (class 0 OID 22031734)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561f-c2a5-730f-153b4b3cf990	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a5-19ca-5722176833b1	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561f-c2a5-4eaf-93875d09f532	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a5-9cad-776de036071a	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a5-f315-b58a069ce0e3	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a5-0db4-47fab0206029	\N	00040000-561f-c2a2-22fa-b23cb99903a4	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a5-0c33-0f87e9d715b4	\N	00040000-561f-c2a2-0276-bbd2c7360e40	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a5-e2da-e81373a7ab2c	\N	00040000-561f-c2a2-0384-0db80963ff48	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a5-6356-cf1394a842d5	\N	00040000-561f-c2a2-3429-0c9c42155f4d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-c2a7-e401-98b2786f18f0	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3024 (class 0 OID 22031769)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561f-c2a2-d929-e12ff8e50cba	8341	Adlešiči
00050000-561f-c2a2-d10f-0ae68ef87611	5270	Ajdovščina
00050000-561f-c2a2-519b-db2b387fe30a	6280	Ankaran/Ancarano
00050000-561f-c2a2-1738-0869590efcf4	9253	Apače
00050000-561f-c2a2-8d2b-f4dab3f6370e	8253	Artiče
00050000-561f-c2a2-863e-dde08988b643	4275	Begunje na Gorenjskem
00050000-561f-c2a2-4b47-f0a78ad176b6	1382	Begunje pri Cerknici
00050000-561f-c2a2-e885-b412a197979f	9231	Beltinci
00050000-561f-c2a2-9c0a-bd551b8a18eb	2234	Benedikt
00050000-561f-c2a2-af26-d1f3d97a58ec	2345	Bistrica ob Dravi
00050000-561f-c2a2-9929-ce2fe8a17a77	3256	Bistrica ob Sotli
00050000-561f-c2a2-ffbc-261b5518fdbf	8259	Bizeljsko
00050000-561f-c2a2-6f3f-78b1a27fc69a	1223	Blagovica
00050000-561f-c2a2-4e08-9ac20e405332	8283	Blanca
00050000-561f-c2a2-0146-741948af0c51	4260	Bled
00050000-561f-c2a2-cfcf-9c0fb0062f7d	4273	Blejska Dobrava
00050000-561f-c2a2-30d6-ad6216aef52d	9265	Bodonci
00050000-561f-c2a2-5bb4-19fbd0ad2455	9222	Bogojina
00050000-561f-c2a2-ee56-0f277cd322b9	4263	Bohinjska Bela
00050000-561f-c2a2-30af-863cffc2e2cd	4264	Bohinjska Bistrica
00050000-561f-c2a2-0464-cdde3bad0282	4265	Bohinjsko jezero
00050000-561f-c2a2-53f3-5064798d1e63	1353	Borovnica
00050000-561f-c2a2-0f66-1928b18fba35	8294	Boštanj
00050000-561f-c2a2-147d-0e7bd9257e9f	5230	Bovec
00050000-561f-c2a2-8347-d64e344d3138	5295	Branik
00050000-561f-c2a2-59e8-7553ef37c3f1	3314	Braslovče
00050000-561f-c2a2-5527-d715de4465ac	5223	Breginj
00050000-561f-c2a2-a985-d74f7ec9ab48	8280	Brestanica
00050000-561f-c2a2-95bd-37ac8bd276f9	2354	Bresternica
00050000-561f-c2a2-ec67-65f7fe5a076e	4243	Brezje
00050000-561f-c2a2-2ac6-59ff05931f9f	1351	Brezovica pri Ljubljani
00050000-561f-c2a2-9f11-e4bf04ddbaad	8250	Brežice
00050000-561f-c2a2-8700-ec534281daa5	4210	Brnik - Aerodrom
00050000-561f-c2a2-b71e-6688d2957403	8321	Brusnice
00050000-561f-c2a2-26d7-050e0264ecf1	3255	Buče
00050000-561f-c2a2-0f98-0a563b82f8ff	8276	Bučka 
00050000-561f-c2a2-e6c6-4d4073d96d55	9261	Cankova
00050000-561f-c2a2-bacb-31600a8a9342	3000	Celje 
00050000-561f-c2a2-6f34-64fc51503be9	3001	Celje - poštni predali
00050000-561f-c2a2-4af5-d63a9292cd22	4207	Cerklje na Gorenjskem
00050000-561f-c2a2-c6a0-c12dbbea2a76	8263	Cerklje ob Krki
00050000-561f-c2a2-d9de-799a5743b4b9	1380	Cerknica
00050000-561f-c2a2-574f-324f2dd92c77	5282	Cerkno
00050000-561f-c2a2-15ba-c7b23afb7c00	2236	Cerkvenjak
00050000-561f-c2a2-957f-f6e9da6124cb	2215	Ceršak
00050000-561f-c2a2-cf36-81ea1ed55da8	2326	Cirkovce
00050000-561f-c2a2-6781-09cf910ad1c9	2282	Cirkulane
00050000-561f-c2a2-a9b8-e024241d9a3f	5273	Col
00050000-561f-c2a2-fe92-6babceafcaaf	8251	Čatež ob Savi
00050000-561f-c2a2-8015-6fcbcfb12060	1413	Čemšenik
00050000-561f-c2a2-7a19-2d2849e7fbd4	5253	Čepovan
00050000-561f-c2a2-38e8-0af57e5e9f56	9232	Črenšovci
00050000-561f-c2a2-5bdb-005f1379815b	2393	Črna na Koroškem
00050000-561f-c2a2-7d34-5f784420cd7a	6275	Črni Kal
00050000-561f-c2a2-6f11-31de7e863ca3	5274	Črni Vrh nad Idrijo
00050000-561f-c2a2-3a78-97c30687ab02	5262	Črniče
00050000-561f-c2a2-f73a-8d4574a02907	8340	Črnomelj
00050000-561f-c2a2-382e-aa80977c7474	6271	Dekani
00050000-561f-c2a2-09a8-8a4ad991d9d2	5210	Deskle
00050000-561f-c2a2-63f5-97c687d95796	2253	Destrnik
00050000-561f-c2a2-f7e8-86221695b3f1	6215	Divača
00050000-561f-c2a2-12be-20da8bf7d62e	1233	Dob
00050000-561f-c2a2-f104-e285768b7da5	3224	Dobje pri Planini
00050000-561f-c2a2-bb2b-f9f510e444f4	8257	Dobova
00050000-561f-c2a2-1fab-c8db9ecf5c63	1423	Dobovec
00050000-561f-c2a2-6212-1dbe22636fa4	5263	Dobravlje
00050000-561f-c2a2-a582-bc4f4e5cfc7b	3204	Dobrna
00050000-561f-c2a2-4f9b-1aaa85ae1f7c	8211	Dobrnič
00050000-561f-c2a2-0e45-76c1b4281d9b	1356	Dobrova
00050000-561f-c2a2-0d8c-1e2f09d1598d	9223	Dobrovnik/Dobronak 
00050000-561f-c2a2-a280-e2d973fc6430	5212	Dobrovo v Brdih
00050000-561f-c2a2-fa25-145b7aaaf382	1431	Dol pri Hrastniku
00050000-561f-c2a2-e6f9-3a019c9a81f3	1262	Dol pri Ljubljani
00050000-561f-c2a2-25f9-df9db4e4f418	1273	Dole pri Litiji
00050000-561f-c2a2-b7c6-c983d1e06312	1331	Dolenja vas
00050000-561f-c2a2-5eb2-a81ad399180a	8350	Dolenjske Toplice
00050000-561f-c2a2-7c31-9995385f73fc	1230	Domžale
00050000-561f-c2a2-fe55-2bfb0c4698a1	2252	Dornava
00050000-561f-c2a2-03f1-00eb7bdfd9c2	5294	Dornberk
00050000-561f-c2a2-4e6f-18b669a74dd3	1319	Draga
00050000-561f-c2a2-da52-e8c6ac4fac04	8343	Dragatuš
00050000-561f-c2a2-42e7-20eaebc65ad9	3222	Dramlje
00050000-561f-c2a2-a7ba-2c084cb9e5d6	2370	Dravograd
00050000-561f-c2a2-5445-e485f6f4269c	4203	Duplje
00050000-561f-c2a2-5ce3-0c298366c8e2	6221	Dutovlje
00050000-561f-c2a2-d5cf-2b5a7799faf0	8361	Dvor
00050000-561f-c2a2-05d3-098ff56b16f5	2343	Fala
00050000-561f-c2a2-5d7c-4fb7558add1f	9208	Fokovci
00050000-561f-c2a2-c2b7-c61045d9661a	2313	Fram
00050000-561f-c2a2-3b9e-92aea608a873	3213	Frankolovo
00050000-561f-c2a2-a026-70d4b7e3918b	1274	Gabrovka
00050000-561f-c2a2-e14c-f621a6840d19	8254	Globoko
00050000-561f-c2a2-8527-70cc8f693da7	5275	Godovič
00050000-561f-c2a2-e6d2-b46a51b21f15	4204	Golnik
00050000-561f-c2a2-7f08-dc67639cceae	3303	Gomilsko
00050000-561f-c2a2-d1b3-a1d3b4890b19	4224	Gorenja vas
00050000-561f-c2a2-567f-3d05c13ab908	3263	Gorica pri Slivnici
00050000-561f-c2a2-d279-3d8ca5d2a322	2272	Gorišnica
00050000-561f-c2a2-de9f-a978bd7dc168	9250	Gornja Radgona
00050000-561f-c2a2-1a45-44093e42c9b7	3342	Gornji Grad
00050000-561f-c2a2-3207-cbfee09eb8b0	4282	Gozd Martuljek
00050000-561f-c2a2-12db-3594b93088f7	6272	Gračišče
00050000-561f-c2a2-ffac-9f6579976e60	9264	Grad
00050000-561f-c2a2-a5aa-4478d20a7922	8332	Gradac
00050000-561f-c2a2-be77-cd9f76c9a5ab	1384	Grahovo
00050000-561f-c2a2-cd79-fcd805a8c45c	5242	Grahovo ob Bači
00050000-561f-c2a2-4961-a0a59caf3316	5251	Grgar
00050000-561f-c2a2-8d63-99217ddf9ba1	3302	Griže
00050000-561f-c2a2-9ec2-9384d6f7aa41	3231	Grobelno
00050000-561f-c2a2-43da-ae63929115a1	1290	Grosuplje
00050000-561f-c2a2-0881-6a880f0405eb	2288	Hajdina
00050000-561f-c2a2-3305-7ce1b367405f	8362	Hinje
00050000-561f-c2a2-3a42-2b7d5d38ff62	2311	Hoče
00050000-561f-c2a2-191c-f9e954d36307	9205	Hodoš/Hodos
00050000-561f-c2a2-7a95-5c209ef84a9d	1354	Horjul
00050000-561f-c2a2-4251-2b2bfcb97fa5	1372	Hotedršica
00050000-561f-c2a2-79ab-5fc7bbdb99d0	1430	Hrastnik
00050000-561f-c2a2-3922-1428f77489c1	6225	Hruševje
00050000-561f-c2a2-5c95-233ea12b3cd7	4276	Hrušica
00050000-561f-c2a2-c5dd-17456bb34653	5280	Idrija
00050000-561f-c2a2-e934-f5010118be9d	1292	Ig
00050000-561f-c2a2-8834-f7a18881d63f	6250	Ilirska Bistrica
00050000-561f-c2a2-ee70-422c43426d50	6251	Ilirska Bistrica-Trnovo
00050000-561f-c2a2-79f0-0ec3439a88fd	1295	Ivančna Gorica
00050000-561f-c2a2-4929-37cdad57e283	2259	Ivanjkovci
00050000-561f-c2a2-629e-6a46c56d9e4a	1411	Izlake
00050000-561f-c2a2-8f56-e64f0a6f82c2	6310	Izola/Isola
00050000-561f-c2a2-840c-d4001b1bb2e6	2222	Jakobski Dol
00050000-561f-c2a2-3fe6-c3965c28bd1c	2221	Jarenina
00050000-561f-c2a2-5dc0-685bf4d57f71	6254	Jelšane
00050000-561f-c2a2-521f-a7d4809a4934	4270	Jesenice
00050000-561f-c2a2-aa8f-a0af816c5d8e	8261	Jesenice na Dolenjskem
00050000-561f-c2a2-b764-569605773efd	3273	Jurklošter
00050000-561f-c2a2-bb8e-8d9a032e1a0e	2223	Jurovski Dol
00050000-561f-c2a2-0ef4-59b248f198cd	2256	Juršinci
00050000-561f-c2a2-cd5b-52afa084a08c	5214	Kal nad Kanalom
00050000-561f-c2a2-1387-12d1eb144976	3233	Kalobje
00050000-561f-c2a2-411a-db93383d400e	4246	Kamna Gorica
00050000-561f-c2a2-baf0-8034244d94c5	2351	Kamnica
00050000-561f-c2a2-aac3-f0e4827b9b6c	1241	Kamnik
00050000-561f-c2a2-45cf-ccb53395e5eb	5213	Kanal
00050000-561f-c2a2-50f8-4150bd7f4252	8258	Kapele
00050000-561f-c2a2-99ae-036a04cdddf3	2362	Kapla
00050000-561f-c2a2-5068-3f1bce6b6843	2325	Kidričevo
00050000-561f-c2a2-14c0-c99830d13161	1412	Kisovec
00050000-561f-c2a2-cc27-611b739d9a5a	6253	Knežak
00050000-561f-c2a2-00b1-c02f59b9ba32	5222	Kobarid
00050000-561f-c2a2-9db0-c7b46206240b	9227	Kobilje
00050000-561f-c2a2-c3a8-3e57f9cc7d36	1330	Kočevje
00050000-561f-c2a2-61a3-6fb2cffcfd4c	1338	Kočevska Reka
00050000-561f-c2a2-c969-1978a14545cb	2276	Kog
00050000-561f-c2a2-fdc9-0b00c444d6de	5211	Kojsko
00050000-561f-c2a2-8957-7b7a43871448	6223	Komen
00050000-561f-c2a2-4aec-353ae51a70f6	1218	Komenda
00050000-561f-c2a2-fb39-7796a1785f3a	6000	Koper/Capodistria 
00050000-561f-c2a2-2661-7b415f6853d5	6001	Koper/Capodistria - poštni predali
00050000-561f-c2a2-f56e-1079dd35fe2c	8282	Koprivnica
00050000-561f-c2a2-394c-b049c3c8e02a	5296	Kostanjevica na Krasu
00050000-561f-c2a2-64bd-36529e1fe43c	8311	Kostanjevica na Krki
00050000-561f-c2a2-071f-8372fd2f102c	1336	Kostel
00050000-561f-c2a2-6821-18f5accc1734	6256	Košana
00050000-561f-c2a2-e3b5-d18bfa9c3717	2394	Kotlje
00050000-561f-c2a2-8d88-e892bc79d655	6240	Kozina
00050000-561f-c2a2-de9e-642485820934	3260	Kozje
00050000-561f-c2a2-2e03-3e8d8a96fb04	4000	Kranj 
00050000-561f-c2a2-7058-3ac0759be083	4001	Kranj - poštni predali
00050000-561f-c2a2-6a4c-91ceaf76d253	4280	Kranjska Gora
00050000-561f-c2a2-8e37-efa1353c3ccb	1281	Kresnice
00050000-561f-c2a2-e44b-7ea7dced904e	4294	Križe
00050000-561f-c2a2-0710-6c4c149e5a74	9206	Križevci
00050000-561f-c2a2-298e-80cb6d457085	9242	Križevci pri Ljutomeru
00050000-561f-c2a2-76ee-908f7a9f07cb	1301	Krka
00050000-561f-c2a2-578a-2e8a04649442	8296	Krmelj
00050000-561f-c2a2-dd29-d41efaaac27d	4245	Kropa
00050000-561f-c2a2-6872-0434ec643471	8262	Krška vas
00050000-561f-c2a2-740c-23b99567c360	8270	Krško
00050000-561f-c2a2-018d-6ee55d5a9490	9263	Kuzma
00050000-561f-c2a2-b3d6-53e0df668beb	2318	Laporje
00050000-561f-c2a2-7e41-d7cf9656c73f	3270	Laško
00050000-561f-c2a2-27a9-28d8c32a11cf	1219	Laze v Tuhinju
00050000-561f-c2a2-2db6-1ee3a6f2c527	2230	Lenart v Slovenskih goricah
00050000-561f-c2a2-3dd5-64eebbc663ec	9220	Lendava/Lendva
00050000-561f-c2a2-c862-5757ee06c32e	4248	Lesce
00050000-561f-c2a2-0f80-69c42fc546c4	3261	Lesično
00050000-561f-c2a2-4e0d-a27ed5656f9f	8273	Leskovec pri Krškem
00050000-561f-c2a2-11ee-2722031558d4	2372	Libeliče
00050000-561f-c2a2-5209-7315f805c5d7	2341	Limbuš
00050000-561f-c2a2-9dc4-6e129b9159f5	1270	Litija
00050000-561f-c2a2-97e8-c6d44b2a53d4	3202	Ljubečna
00050000-561f-c2a2-be61-eafd19c28bf7	1000	Ljubljana 
00050000-561f-c2a2-d600-f025d71495ac	1001	Ljubljana - poštni predali
00050000-561f-c2a2-fac7-c5c20d2ba2a2	1231	Ljubljana - Črnuče
00050000-561f-c2a2-a15e-908d7b31a28d	1261	Ljubljana - Dobrunje
00050000-561f-c2a2-c83a-d00416baa85f	1260	Ljubljana - Polje
00050000-561f-c2a2-0f38-682ff00d5f08	1210	Ljubljana - Šentvid
00050000-561f-c2a2-e7ac-9bfaa3c3548e	1211	Ljubljana - Šmartno
00050000-561f-c2a2-928d-0465f1bd1b9f	3333	Ljubno ob Savinji
00050000-561f-c2a2-6b79-b1948d8a9e77	9240	Ljutomer
00050000-561f-c2a2-99d2-c9a4c28259d1	3215	Loče
00050000-561f-c2a2-200e-9db104148e77	5231	Log pod Mangartom
00050000-561f-c2a2-2dbe-b70cf871fb48	1358	Log pri Brezovici
00050000-561f-c2a2-4179-06d51253ae02	1370	Logatec
00050000-561f-c2a2-e8d5-4b01f7bae094	1371	Logatec
00050000-561f-c2a2-8a92-474f19e0b2d4	1434	Loka pri Zidanem Mostu
00050000-561f-c2a2-544d-1cc820a68103	3223	Loka pri Žusmu
00050000-561f-c2a2-fac1-29605e058b90	6219	Lokev
00050000-561f-c2a2-0512-38260d3a021f	1318	Loški Potok
00050000-561f-c2a2-e3f5-c9f4c9dc0519	2324	Lovrenc na Dravskem polju
00050000-561f-c2a2-46e5-40e6b450b0d4	2344	Lovrenc na Pohorju
00050000-561f-c2a2-a614-a7c7bea49d69	3334	Luče
00050000-561f-c2a2-5f25-6cb4916f6a75	1225	Lukovica
00050000-561f-c2a2-6b9f-1013025ee53b	9202	Mačkovci
00050000-561f-c2a2-9cde-2d2fcc062c7c	2322	Majšperk
00050000-561f-c2a2-387e-1f9996fda5df	2321	Makole
00050000-561f-c2a2-1048-01f239d4ad31	9243	Mala Nedelja
00050000-561f-c2a2-d28e-920886cf16f9	2229	Malečnik
00050000-561f-c2a2-298d-b023008d1ef3	6273	Marezige
00050000-561f-c2a2-17cc-449b38f94dcc	2000	Maribor 
00050000-561f-c2a2-929c-5586ebae38aa	2001	Maribor - poštni predali
00050000-561f-c2a2-c944-75f017b13808	2206	Marjeta na Dravskem polju
00050000-561f-c2a2-71e8-01166c13b683	2281	Markovci
00050000-561f-c2a2-84e3-443319c5c8dc	9221	Martjanci
00050000-561f-c2a2-bb0a-396a3d5ed598	6242	Materija
00050000-561f-c2a2-cb4e-698849ce0eb4	4211	Mavčiče
00050000-561f-c2a2-2958-7e22a24e87f7	1215	Medvode
00050000-561f-c2a2-fb9b-53dd10718f52	1234	Mengeš
00050000-561f-c2a2-4c96-1ef5fa74006b	8330	Metlika
00050000-561f-c2a2-0ad8-e6eadb345a5e	2392	Mežica
00050000-561f-c2a2-2350-5a13716100df	2204	Miklavž na Dravskem polju
00050000-561f-c2a2-5dfe-8d00a935653c	2275	Miklavž pri Ormožu
00050000-561f-c2a2-980f-b7a186fb5b77	5291	Miren
00050000-561f-c2a2-07cd-e388454419d1	8233	Mirna
00050000-561f-c2a2-e91f-d96a54dbd404	8216	Mirna Peč
00050000-561f-c2a2-ec6f-d8aa81c93050	2382	Mislinja
00050000-561f-c2a2-6549-36ee86b6c566	4281	Mojstrana
00050000-561f-c2a2-19ee-eae3dfb97bd2	8230	Mokronog
00050000-561f-c2a2-2200-859ba4301da5	1251	Moravče
00050000-561f-c2a2-a051-dd7abc79fa5e	9226	Moravske Toplice
00050000-561f-c2a2-7567-e069fa337dfb	5216	Most na Soči
00050000-561f-c2a2-4703-29399ce07d8f	1221	Motnik
00050000-561f-c2a2-4a2d-9a0bf46f1179	3330	Mozirje
00050000-561f-c2a2-b613-27c5f5e03e18	9000	Murska Sobota 
00050000-561f-c2a2-4135-df7ca9e4a7cb	9001	Murska Sobota - poštni predali
00050000-561f-c2a2-7914-3c00f4c0c3d0	2366	Muta
00050000-561f-c2a2-96de-e25c2be65a5e	4202	Naklo
00050000-561f-c2a2-1254-f34a44951907	3331	Nazarje
00050000-561f-c2a2-9299-c4087b5d4379	1357	Notranje Gorice
00050000-561f-c2a2-d57a-f636da779d3b	3203	Nova Cerkev
00050000-561f-c2a2-d80d-6bc1d37fc1d5	5000	Nova Gorica 
00050000-561f-c2a2-1fdb-cd6c568f9839	5001	Nova Gorica - poštni predali
00050000-561f-c2a2-29af-45e3fd8fd5d8	1385	Nova vas
00050000-561f-c2a2-9547-e16afcea7cd4	8000	Novo mesto
00050000-561f-c2a2-c103-d5fdd13c1e7e	8001	Novo mesto - poštni predali
00050000-561f-c2a2-c469-2f68d5d9d96d	6243	Obrov
00050000-561f-c2a2-aa67-77646b593961	9233	Odranci
00050000-561f-c2a2-1862-9fe264901ff5	2317	Oplotnica
00050000-561f-c2a2-b6d7-1ad452ddea57	2312	Orehova vas
00050000-561f-c2a2-0660-c30705b195cd	2270	Ormož
00050000-561f-c2a2-f131-6317f98f9504	1316	Ortnek
00050000-561f-c2a2-84f9-a58ba22ab5f0	1337	Osilnica
00050000-561f-c2a2-b25d-3c181035d559	8222	Otočec
00050000-561f-c2a2-67ba-4ec16dc36432	2361	Ožbalt
00050000-561f-c2a2-2fdb-07837fcb1d39	2231	Pernica
00050000-561f-c2a2-ed20-95fe73fe3880	2211	Pesnica pri Mariboru
00050000-561f-c2a2-6156-41b526ab9ad8	9203	Petrovci
00050000-561f-c2a2-5f0a-07b24ff6e350	3301	Petrovče
00050000-561f-c2a2-9c22-93a3781e0f8c	6330	Piran/Pirano
00050000-561f-c2a2-70b5-3a12b0fc457f	8255	Pišece
00050000-561f-c2a2-e573-a3cd57ca27f3	6257	Pivka
00050000-561f-c2a2-2efe-cd5931034b82	6232	Planina
00050000-561f-c2a2-417b-90c5e2eb5002	3225	Planina pri Sevnici
00050000-561f-c2a2-9e20-78d9ec75dbf7	6276	Pobegi
00050000-561f-c2a2-370b-3f7bd42b18a9	8312	Podbočje
00050000-561f-c2a2-2836-859794e04255	5243	Podbrdo
00050000-561f-c2a2-0b41-9323e2425e14	3254	Podčetrtek
00050000-561f-c2a2-04de-739ecc1ffd25	2273	Podgorci
00050000-561f-c2a2-84e9-eb9821a10851	6216	Podgorje
00050000-561f-c2a2-f878-1e1a58165963	2381	Podgorje pri Slovenj Gradcu
00050000-561f-c2a2-e4a2-c54b0e771576	6244	Podgrad
00050000-561f-c2a2-3712-b952c8155bf7	1414	Podkum
00050000-561f-c2a2-c7d9-b24c627defa9	2286	Podlehnik
00050000-561f-c2a2-8d7b-6b11da0809d9	5272	Podnanos
00050000-561f-c2a2-5cbb-36c9f2b3b3fb	4244	Podnart
00050000-561f-c2a2-53cb-76290b305483	3241	Podplat
00050000-561f-c2a2-67c9-3fee57ca2edb	3257	Podsreda
00050000-561f-c2a2-6833-f5c77f31be9d	2363	Podvelka
00050000-561f-c2a2-bfc8-8f1dca6276b0	2208	Pohorje
00050000-561f-c2a2-6739-576c624b1156	2257	Polenšak
00050000-561f-c2a2-930b-ab207c170f99	1355	Polhov Gradec
00050000-561f-c2a2-dcec-b90d156d60f3	4223	Poljane nad Škofjo Loko
00050000-561f-c2a2-e212-1688e81b47e4	2319	Poljčane
00050000-561f-c2a2-8ede-5af00f8788f4	1272	Polšnik
00050000-561f-c2a2-78e9-e06d6fa7de88	3313	Polzela
00050000-561f-c2a2-69a1-f540b79cf83a	3232	Ponikva
00050000-561f-c2a2-d881-1b3054af863c	6320	Portorož/Portorose
00050000-561f-c2a2-ebc4-d93a9dc27aeb	6230	Postojna
00050000-561f-c2a2-cec0-c18017fef7fc	2331	Pragersko
00050000-561f-c2a2-23ca-95fe29948cc5	3312	Prebold
00050000-561f-c2a2-4eef-6e91f3bde526	4205	Preddvor
00050000-561f-c2a2-e2ae-9dfd56c10330	6255	Prem
00050000-561f-c2a2-e390-954bf5e6f24f	1352	Preserje
00050000-561f-c2a2-57fb-1ea2dba1ecfb	6258	Prestranek
00050000-561f-c2a2-6210-058b143b11ad	2391	Prevalje
00050000-561f-c2a2-2fad-b22b868da4d7	3262	Prevorje
00050000-561f-c2a2-f861-09950c663c91	1276	Primskovo 
00050000-561f-c2a2-89e1-64d7f9c8c53a	3253	Pristava pri Mestinju
00050000-561f-c2a2-e471-4e781fe6901a	9207	Prosenjakovci/Partosfalva
00050000-561f-c2a2-de35-6145381a8530	5297	Prvačina
00050000-561f-c2a2-8961-49061ba6bf40	2250	Ptuj
00050000-561f-c2a2-426c-db5310af58f2	2323	Ptujska Gora
00050000-561f-c2a2-6164-8a55c0be56e4	9201	Puconci
00050000-561f-c2a2-3b78-3c5b0084c70a	2327	Rače
00050000-561f-c2a2-1c48-8bfc0b1d6dbd	1433	Radeče
00050000-561f-c2a2-61fe-9f48ac3a189c	9252	Radenci
00050000-561f-c2a2-93dc-2e32e53a3579	2360	Radlje ob Dravi
00050000-561f-c2a2-a2d7-f0c4091813ed	1235	Radomlje
00050000-561f-c2a2-4c18-7748ee72e629	4240	Radovljica
00050000-561f-c2a2-56be-e02e5525dad7	8274	Raka
00050000-561f-c2a2-2a1d-a9eea97eac16	1381	Rakek
00050000-561f-c2a2-ba3f-be7bb2d9bff9	4283	Rateče - Planica
00050000-561f-c2a2-1cd7-6c47d7013a36	2390	Ravne na Koroškem
00050000-561f-c2a2-afdf-78841bf03db3	9246	Razkrižje
00050000-561f-c2a2-71a4-512be44af010	3332	Rečica ob Savinji
00050000-561f-c2a2-1f25-e4e27cf35296	5292	Renče
00050000-561f-c2a2-245c-0a75408a89c0	1310	Ribnica
00050000-561f-c2a2-3a67-cee49682d2e9	2364	Ribnica na Pohorju
00050000-561f-c2a2-f33f-9343ec9c6a9e	3272	Rimske Toplice
00050000-561f-c2a2-01ad-0f9ece657add	1314	Rob
00050000-561f-c2a2-8930-9194e4a14444	5215	Ročinj
00050000-561f-c2a2-f48e-a76379d847e0	3250	Rogaška Slatina
00050000-561f-c2a2-df8a-d691d3f88c00	9262	Rogašovci
00050000-561f-c2a2-b33d-fad212d9734c	3252	Rogatec
00050000-561f-c2a2-bdff-8051cc069a84	1373	Rovte
00050000-561f-c2a2-f8db-19c1fd766ac3	2342	Ruše
00050000-561f-c2a2-aac7-0869893f31f9	1282	Sava
00050000-561f-c2a2-ed29-82db580448ab	6333	Sečovlje/Sicciole
00050000-561f-c2a2-85b1-a327d318a2c4	4227	Selca
00050000-561f-c2a2-5ed6-8d113a9892d1	2352	Selnica ob Dravi
00050000-561f-c2a2-2b70-e00fc7559071	8333	Semič
00050000-561f-c2a2-78bb-257ba2c6355e	8281	Senovo
00050000-561f-c2a2-897b-24b5bd8b4f09	6224	Senožeče
00050000-561f-c2a2-4f21-766bee72dd56	8290	Sevnica
00050000-561f-c2a2-4ab5-bb80fc1ed18e	6210	Sežana
00050000-561f-c2a2-7f18-05edd1769bc9	2214	Sladki Vrh
00050000-561f-c2a2-6a40-30411f20d272	5283	Slap ob Idrijci
00050000-561f-c2a2-6dd8-c33a20f2cba1	2380	Slovenj Gradec
00050000-561f-c2a2-f8a9-c92fcc8ab3d2	2310	Slovenska Bistrica
00050000-561f-c2a2-37f5-b879c63e8ff8	3210	Slovenske Konjice
00050000-561f-c2a2-0721-f9ef3edf28f2	1216	Smlednik
00050000-561f-c2a2-c83e-0e1dec04e5cb	5232	Soča
00050000-561f-c2a2-52dd-648682575569	1317	Sodražica
00050000-561f-c2a2-772f-0a9477890956	3335	Solčava
00050000-561f-c2a2-38c0-998410c6cb4c	5250	Solkan
00050000-561f-c2a2-5f6a-4566c13aebb2	4229	Sorica
00050000-561f-c2a2-a0dd-5ad04da9efba	4225	Sovodenj
00050000-561f-c2a2-d17d-b472fa854497	5281	Spodnja Idrija
00050000-561f-c2a2-9290-875cc6469135	2241	Spodnji Duplek
00050000-561f-c2a2-4e7e-fda806c6e293	9245	Spodnji Ivanjci
00050000-561f-c2a2-739b-0b93a0ca5a29	2277	Središče ob Dravi
00050000-561f-c2a2-55af-541158bfc7bf	4267	Srednja vas v Bohinju
00050000-561f-c2a2-e24b-1d0437997b5b	8256	Sromlje 
00050000-561f-c2a2-6083-b3d7adfea72a	5224	Srpenica
00050000-561f-c2a2-1fa6-b029d5fc7a85	1242	Stahovica
00050000-561f-c2a2-2053-3a391cebad9d	1332	Stara Cerkev
00050000-561f-c2a2-4e62-cb0fd6d78682	8342	Stari trg ob Kolpi
00050000-561f-c2a2-a9ec-f18dcd8f276f	1386	Stari trg pri Ložu
00050000-561f-c2a2-9db9-1312ece5e27f	2205	Starše
00050000-561f-c2a2-6a29-d832200f8565	2289	Stoperce
00050000-561f-c2a2-9ba5-7b577b72142b	8322	Stopiče
00050000-561f-c2a2-d7d9-2a2dbd6341a4	3206	Stranice
00050000-561f-c2a2-d8a1-030b9f036b51	8351	Straža
00050000-561f-c2a2-1e2b-9261def43fea	1313	Struge
00050000-561f-c2a2-2d8e-5f0d277684fe	8293	Studenec
00050000-561f-c2a2-6508-26bbce5e1962	8331	Suhor
00050000-561f-c2a2-56a7-466b48f2850f	2233	Sv. Ana v Slovenskih goricah
00050000-561f-c2a2-353b-8aa0fc3fd32e	2235	Sv. Trojica v Slovenskih goricah
00050000-561f-c2a2-965f-cf530709fea1	2353	Sveti Duh na Ostrem Vrhu
00050000-561f-c2a2-4812-d3ad3f96cd1d	9244	Sveti Jurij ob Ščavnici
00050000-561f-c2a2-e2cd-ed88f6dbc881	3264	Sveti Štefan
00050000-561f-c2a2-1c9c-c2d08d437058	2258	Sveti Tomaž
00050000-561f-c2a2-a90f-141a41ff81a9	9204	Šalovci
00050000-561f-c2a2-c032-8d4581cac2de	5261	Šempas
00050000-561f-c2a2-36db-9a76b7907bb4	5290	Šempeter pri Gorici
00050000-561f-c2a2-3b45-7db6d5eef90d	3311	Šempeter v Savinjski dolini
00050000-561f-c2a2-9ff5-8c7aadb01914	4208	Šenčur
00050000-561f-c2a2-04d6-4e273d8fb3cc	2212	Šentilj v Slovenskih goricah
00050000-561f-c2a2-72a0-19d220c3c2cf	8297	Šentjanž
00050000-561f-c2a2-2e16-90b127a7146e	2373	Šentjanž pri Dravogradu
00050000-561f-c2a2-3a27-af85dd192648	8310	Šentjernej
00050000-561f-c2a2-7917-17f8d5249ef2	3230	Šentjur
00050000-561f-c2a2-1860-27cced96f0ee	3271	Šentrupert
00050000-561f-c2a2-9590-ff0f02cd9f41	8232	Šentrupert
00050000-561f-c2a2-1694-57009bc65cc4	1296	Šentvid pri Stični
00050000-561f-c2a2-eee2-7d7811e0a882	8275	Škocjan
00050000-561f-c2a2-119e-e5a7b481e9ac	6281	Škofije
00050000-561f-c2a2-8854-a6f8ce7a668e	4220	Škofja Loka
00050000-561f-c2a2-37d2-5f8e08b948ab	3211	Škofja vas
00050000-561f-c2a2-b171-215861a95fc3	1291	Škofljica
00050000-561f-c2a2-5157-7ff2406820ea	6274	Šmarje
00050000-561f-c2a2-d4a0-a93d9ce61780	1293	Šmarje - Sap
00050000-561f-c2a2-8b6a-e6e3074044ca	3240	Šmarje pri Jelšah
00050000-561f-c2a2-5278-972b5639ec18	8220	Šmarješke Toplice
00050000-561f-c2a2-cd48-6a70abd7a16b	2315	Šmartno na Pohorju
00050000-561f-c2a2-cae8-3cc230594057	3341	Šmartno ob Dreti
00050000-561f-c2a2-704d-9d4a81311d6b	3327	Šmartno ob Paki
00050000-561f-c2a2-28a1-ebb1c243670e	1275	Šmartno pri Litiji
00050000-561f-c2a2-46a7-6e8d194dc92a	2383	Šmartno pri Slovenj Gradcu
00050000-561f-c2a2-c2cf-87ef809f001c	3201	Šmartno v Rožni dolini
00050000-561f-c2a2-acf6-197d080c3655	3325	Šoštanj
00050000-561f-c2a2-8bff-3328a1572610	6222	Štanjel
00050000-561f-c2a2-8226-1d276b911a63	3220	Štore
00050000-561f-c2a2-661f-b454642e2468	3304	Tabor
00050000-561f-c2a2-922c-bf08e5602b2f	3221	Teharje
00050000-561f-c2a2-2fa7-2b422e58ed14	9251	Tišina
00050000-561f-c2a2-82b4-aca66b793e81	5220	Tolmin
00050000-561f-c2a2-5acf-231c59927dd0	3326	Topolšica
00050000-561f-c2a2-7a3b-3d88da6b1495	2371	Trbonje
00050000-561f-c2a2-1993-045feae70bcd	1420	Trbovlje
00050000-561f-c2a2-05f2-fa20665b3138	8231	Trebelno 
00050000-561f-c2a2-d224-cf8eb29086a1	8210	Trebnje
00050000-561f-c2a2-ae0b-2c92402c43fd	5252	Trnovo pri Gorici
00050000-561f-c2a2-3e39-bec31c6b83e5	2254	Trnovska vas
00050000-561f-c2a2-7f0a-54f0065d8439	1222	Trojane
00050000-561f-c2a2-c535-a3a473536d0b	1236	Trzin
00050000-561f-c2a2-50bd-cf6b6d51657f	4290	Tržič
00050000-561f-c2a2-3c75-5e024b5c36ce	8295	Tržišče
00050000-561f-c2a2-f328-691f85fc0427	1311	Turjak
00050000-561f-c2a2-29cd-c8e0846d4d34	9224	Turnišče
00050000-561f-c2a2-0f58-5d83b52a918a	8323	Uršna sela
00050000-561f-c2a2-3273-29728f71301f	1252	Vače
00050000-561f-c2a2-bb24-d49778c849dd	3320	Velenje 
00050000-561f-c2a2-b944-6623f610e6c7	3322	Velenje - poštni predali
00050000-561f-c2a2-f8d4-725e544830bb	8212	Velika Loka
00050000-561f-c2a2-f634-6c94fbebd517	2274	Velika Nedelja
00050000-561f-c2a2-22e9-079a5827ed0b	9225	Velika Polana
00050000-561f-c2a2-2b3e-616f1837f798	1315	Velike Lašče
00050000-561f-c2a2-a906-badaaaf148a6	8213	Veliki Gaber
00050000-561f-c2a2-edf1-c5d8d33abf60	9241	Veržej
00050000-561f-c2a2-dd1a-d904df868050	1312	Videm - Dobrepolje
00050000-561f-c2a2-ac30-0292d08e13c4	2284	Videm pri Ptuju
00050000-561f-c2a2-1080-3f456aba2aad	8344	Vinica
00050000-561f-c2a2-d649-482ac64362cd	5271	Vipava
00050000-561f-c2a2-e7a6-9d1210f678ec	4212	Visoko
00050000-561f-c2a2-9dd5-b284aa170966	1294	Višnja Gora
00050000-561f-c2a2-8f27-57acf5e7593f	3205	Vitanje
00050000-561f-c2a2-56b8-9602874a4036	2255	Vitomarci
00050000-561f-c2a2-1e66-8fc3ef793a46	1217	Vodice
00050000-561f-c2a2-3cce-afb0fe8ba2fa	3212	Vojnik\t
00050000-561f-c2a2-ea6a-9a4690fbf216	5293	Volčja Draga
00050000-561f-c2a2-e5ad-5b6f53c7a7ec	2232	Voličina
00050000-561f-c2a2-1142-fbb15ca96a40	3305	Vransko
00050000-561f-c2a2-c3cc-05f5293d5ddf	6217	Vremski Britof
00050000-561f-c2a2-e30f-6ef2e9d05571	1360	Vrhnika
00050000-561f-c2a2-90df-2e073fb07dc1	2365	Vuhred
00050000-561f-c2a2-1bcd-fd24b8627e2c	2367	Vuzenica
00050000-561f-c2a2-3683-51fd1abd3653	8292	Zabukovje 
00050000-561f-c2a2-9e6a-ceca16edbd4a	1410	Zagorje ob Savi
00050000-561f-c2a2-d128-2f8595bba3c2	1303	Zagradec
00050000-561f-c2a2-6754-03e35fbf9319	2283	Zavrč
00050000-561f-c2a2-6f50-ec9d6e86eb58	8272	Zdole 
00050000-561f-c2a2-3bd1-a5eaaab83b8f	4201	Zgornja Besnica
00050000-561f-c2a2-6ac6-60fb3423e3d4	2242	Zgornja Korena
00050000-561f-c2a2-9f63-c9d28922895f	2201	Zgornja Kungota
00050000-561f-c2a2-3f24-c562bf69851b	2316	Zgornja Ložnica
00050000-561f-c2a2-bb86-0d54b4c4ec08	2314	Zgornja Polskava
00050000-561f-c2a2-4825-b19b13ca7952	2213	Zgornja Velka
00050000-561f-c2a2-021d-9b67b42f063a	4247	Zgornje Gorje
00050000-561f-c2a2-0f4b-3abdbc3061ee	4206	Zgornje Jezersko
00050000-561f-c2a2-e3de-259cc0a4fd79	2285	Zgornji Leskovec
00050000-561f-c2a2-9615-88f8e9b14a14	1432	Zidani Most
00050000-561f-c2a2-aa16-087d7682f771	3214	Zreče
00050000-561f-c2a2-f256-b8081e97256c	4209	Žabnica
00050000-561f-c2a2-2866-e171d2d7ca49	3310	Žalec
00050000-561f-c2a2-6946-59d8db5ef42c	4228	Železniki
00050000-561f-c2a2-52e7-5dd91147edda	2287	Žetale
00050000-561f-c2a2-5810-b95eb2442078	4226	Žiri
00050000-561f-c2a2-5799-da905d77623d	4274	Žirovnica
00050000-561f-c2a2-addc-292d97afd556	8360	Žužemberk
\.


--
-- TOC entry 3069 (class 0 OID 22032381)
-- Dependencies: 233
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 22031974)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 22031754)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561f-c2a5-5982-61167db5c1b4	00080000-561f-c2a5-730f-153b4b3cf990	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561f-c2a5-1be8-3a670b5d2bf4	00080000-561f-c2a5-730f-153b4b3cf990	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561f-c2a5-84c5-3c0c77b658bd	00080000-561f-c2a5-19ca-5722176833b1	\N	00040000-561f-c2a3-6f01-e63cd2fc7b30	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3031 (class 0 OID 22031858)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 22031986)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22032395)
-- Dependencies: 234
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22032405)
-- Dependencies: 235
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561f-c2a5-2657-3ad9a54d4efb	00080000-561f-c2a5-4eaf-93875d09f532	0987	AK
00190000-561f-c2a5-c641-0d3f6ffbbeff	00080000-561f-c2a5-19ca-5722176833b1	0989	AK
00190000-561f-c2a5-fcea-aeea97af148c	00080000-561f-c2a5-9cad-776de036071a	0986	AK
00190000-561f-c2a5-0c01-96ccc80b0b7e	00080000-561f-c2a5-0db4-47fab0206029	0984	AK
00190000-561f-c2a5-8fc3-2e1efad1ee94	00080000-561f-c2a5-0c33-0f87e9d715b4	0983	AK
00190000-561f-c2a5-a731-37cc02a03676	00080000-561f-c2a5-e2da-e81373a7ab2c	0982	AK
00190000-561f-c2a7-d056-e1b3f0e7da8d	00080000-561f-c2a7-e401-98b2786f18f0	1001	AK
\.


--
-- TOC entry 3068 (class 0 OID 22032320)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561f-c2a5-d1d2-788892573074	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3072 (class 0 OID 22032413)
-- Dependencies: 236
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 22032015)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561f-c2a5-22d2-cda72bc25e0a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561f-c2a5-3cea-bb0d48cfad04	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561f-c2a5-c845-773362159445	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561f-c2a5-22ea-9b9833807d70	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561f-c2a5-0d3a-7d7a7f39fba2	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561f-c2a5-5989-c3bd885fd3a9	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561f-c2a5-407f-6c83d293184c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3040 (class 0 OID 22031959)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 22031949)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 22032159)
-- Dependencies: 225
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22032089)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 22031832)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 22031616)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561f-c2a7-e401-98b2786f18f0	00010000-561f-c2a3-3bae-047dc5424e07	2015-10-15 17:13:43	INS	a:0:{}
2	App\\Entity\\Option	00000000-561f-c2a7-1114-e8188b330b9b	00010000-561f-c2a3-3bae-047dc5424e07	2015-10-15 17:13:43	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561f-c2a7-d056-e1b3f0e7da8d	00010000-561f-c2a3-3bae-047dc5424e07	2015-10-15 17:13:43	INS	a:0:{}
\.


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3049 (class 0 OID 22032028)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 22031654)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561f-c2a3-7ac6-3836df6a6eba	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561f-c2a3-ab12-7e95bc572e0d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561f-c2a3-a5c4-4f0559cdf2b6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561f-c2a3-6f49-4a6de85af335	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561f-c2a3-0979-ef5eb0f1300c	planer	Planer dogodkov v koledarju	t
00020000-561f-c2a3-043c-39d2255d8297	kadrovska	Kadrovska služba	t
00020000-561f-c2a3-5833-733fda676d39	arhivar	Ažuriranje arhivalij	t
00020000-561f-c2a3-cbab-ad433dde1df2	igralec	Igralec	t
00020000-561f-c2a3-67d1-2090023883df	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561f-c2a5-209d-441cc3fe20c3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3013 (class 0 OID 22031638)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561f-c2a3-4b11-e845264cd5fa	00020000-561f-c2a3-a5c4-4f0559cdf2b6
00010000-561f-c2a3-3bae-047dc5424e07	00020000-561f-c2a3-a5c4-4f0559cdf2b6
00010000-561f-c2a5-b385-606152b329ab	00020000-561f-c2a5-209d-441cc3fe20c3
\.


--
-- TOC entry 3051 (class 0 OID 22032042)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 22031980)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 22031926)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 22031603)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561f-c2a2-6abb-3ed38054c08a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561f-c2a2-36e7-f8dc5d2c635f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561f-c2a2-214d-02de64a2248b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561f-c2a2-6b63-7511dc6d0d44	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561f-c2a2-d244-9f5350d9c9e3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3008 (class 0 OID 22031595)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561f-c2a2-32c1-2fc09a34c366	00230000-561f-c2a2-6b63-7511dc6d0d44	popa
00240000-561f-c2a2-c177-23f6bc2808b1	00230000-561f-c2a2-6b63-7511dc6d0d44	oseba
00240000-561f-c2a2-1ce7-bb04621b300a	00230000-561f-c2a2-6b63-7511dc6d0d44	tippopa
00240000-561f-c2a2-d40b-aa1ff5354731	00230000-561f-c2a2-6b63-7511dc6d0d44	sezona
00240000-561f-c2a2-6102-dfc0630a333e	00230000-561f-c2a2-36e7-f8dc5d2c635f	prostor
00240000-561f-c2a2-716e-f2b7b54fc8e0	00230000-561f-c2a2-6b63-7511dc6d0d44	besedilo
00240000-561f-c2a2-45b8-f297900577ed	00230000-561f-c2a2-6b63-7511dc6d0d44	uprizoritev
00240000-561f-c2a2-e9c5-8cefabff6ed5	00230000-561f-c2a2-6b63-7511dc6d0d44	funkcija
00240000-561f-c2a2-f193-aa8e50bf3cf7	00230000-561f-c2a2-6b63-7511dc6d0d44	tipfunkcije
00240000-561f-c2a2-3e47-ae247dee36c5	00230000-561f-c2a2-6b63-7511dc6d0d44	alternacija
00240000-561f-c2a2-733c-7a9b22498fba	00230000-561f-c2a2-6abb-3ed38054c08a	pogodba
00240000-561f-c2a2-1fa0-557a4bf43fb8	00230000-561f-c2a2-6b63-7511dc6d0d44	zaposlitev
00240000-561f-c2a2-5b20-e7d21bda330a	00230000-561f-c2a2-6b63-7511dc6d0d44	zvrstuprizoritve
00240000-561f-c2a2-9cfd-9128432ed3ff	00230000-561f-c2a2-6abb-3ed38054c08a	programdela
00240000-561f-c2a2-9bb0-0e588f018882	00230000-561f-c2a2-6b63-7511dc6d0d44	zapis
\.


--
-- TOC entry 3007 (class 0 OID 22031590)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
43420cd1-ea56-4dc4-b7e7-ec404ca0a597	00240000-561f-c2a2-32c1-2fc09a34c366	0	1001
\.


--
-- TOC entry 3057 (class 0 OID 22032106)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561f-c2a5-6218-b3b150091dc1	000e0000-561f-c2a5-9474-bef743a3c39d	00080000-561f-c2a5-730f-153b4b3cf990	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561f-c2a3-7c98-3da2772ee62b
00270000-561f-c2a5-f617-de8f459860c1	000e0000-561f-c2a5-9474-bef743a3c39d	00080000-561f-c2a5-730f-153b4b3cf990	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561f-c2a3-7c98-3da2772ee62b
\.


--
-- TOC entry 3021 (class 0 OID 22031726)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 22031936)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-561f-c2a5-3f8d-b5c18884d6ea	00180000-561f-c2a5-ae83-f51249b2c997	000c0000-561f-c2a5-ad86-d85bd0a45301	00090000-561f-c2a5-2c56-4c389c051b8a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-c2a5-be83-69126db796b8	00180000-561f-c2a5-ae83-f51249b2c997	000c0000-561f-c2a5-15d5-94ae4348dbdf	00090000-561f-c2a5-d2c4-08f02ce895cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-c2a5-a237-8f0c0dae14d2	00180000-561f-c2a5-ae83-f51249b2c997	000c0000-561f-c2a5-a9a4-7795d6b896a2	00090000-561f-c2a5-b342-c476857e6b66	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-c2a5-0b15-26bc9f5c7524	00180000-561f-c2a5-ae83-f51249b2c997	000c0000-561f-c2a5-2dae-128fe8ad13c0	00090000-561f-c2a5-a4a6-469034c9e823	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-c2a5-3e74-64be1efc660a	00180000-561f-c2a5-ae83-f51249b2c997	000c0000-561f-c2a5-011f-08cd1963f9cb	00090000-561f-c2a5-5a6d-4f7c3243dfda	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-c2a5-e583-5836b0594302	00180000-561f-c2a5-86e6-71abaec12885	\N	00090000-561f-c2a5-5a6d-4f7c3243dfda	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3060 (class 0 OID 22032147)
-- Dependencies: 224
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561f-c2a2-ef39-e02d3d837b42	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561f-c2a2-147a-d5ee6798399c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561f-c2a2-3bcc-380ef60263d6	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561f-c2a2-8689-d20475f51c53	04	Režija	Režija	Režija	umetnik	30
000f0000-561f-c2a2-1b3d-c2d00957a906	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561f-c2a2-e910-f64c660c2c2c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561f-c2a2-61ef-3916458b04ca	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561f-c2a2-fb54-5b650019ae25	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561f-c2a2-bffe-9440f1d61ce8	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561f-c2a2-1f51-aa81bc26d4e5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561f-c2a2-ec16-11c185bf7b0d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561f-c2a2-51ac-b34c694e3782	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561f-c2a2-0491-449b2f2c0bc6	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561f-c2a2-65b6-b1f5ec8bc900	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561f-c2a2-5362-efcb458a0a0d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561f-c2a2-1fed-783ab09c80ea	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561f-c2a2-9095-1287bc7ce9f3	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561f-c2a2-2728-4d192de08d9f	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3018 (class 0 OID 22031680)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-561f-c2a5-5167-9ae9ca1e7c1d	0001	šola	osnovna ali srednja šola
00400000-561f-c2a5-c71f-df6e2efb42f7	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-561f-c2a5-989f-79462703b374	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3073 (class 0 OID 22032424)
-- Dependencies: 237
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561f-c2a2-744c-e899607a137a	01	Velika predstava	f	1.00	1.00
002b0000-561f-c2a2-a856-0e88e7d3e5a2	02	Mala predstava	f	0.50	0.50
002b0000-561f-c2a2-bc27-cea6159ece04	03	Mala koprodukcija	t	0.40	1.00
002b0000-561f-c2a2-f721-3db50bb663e4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561f-c2a2-301f-03b3b2219fa9	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3026 (class 0 OID 22031789)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 22031625)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561f-c2a3-3bae-047dc5424e07	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROX0zZFpqg3H5qGVMQWIn9gYVtdvNCtYC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-b874-0c64db869014	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-b861-43837dc9ac01	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-945d-8a915b85b1a3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-3053-1da4acb10bb6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-6784-92560e6205ac	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-d432-ce4ee730ab83	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-6e70-ddcaba5361ec	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-8163-93a9021dbff4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-ac69-89c682025cfc	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561f-c2a5-b385-606152b329ab	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561f-c2a3-4b11-e845264cd5fa	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3064 (class 0 OID 22032197)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561f-c2a5-3664-de6982aeabb2	00160000-561f-c2a5-2911-cfa61dff42fa	\N	00140000-561f-c2a2-65cd-9117095a3a6b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561f-c2a5-0d3a-7d7a7f39fba2
000e0000-561f-c2a5-9474-bef743a3c39d	00160000-561f-c2a5-6fce-8ce88bd880da	\N	00140000-561f-c2a2-51fe-270ab55198a4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561f-c2a5-5989-c3bd885fd3a9
000e0000-561f-c2a5-6aca-7d47b1c166c4	\N	\N	00140000-561f-c2a2-51fe-270ab55198a4	00190000-561f-c2a5-2657-3ad9a54d4efb	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-c2a5-0d3a-7d7a7f39fba2
000e0000-561f-c2a5-9d6c-c9cf0ec93111	\N	\N	00140000-561f-c2a2-51fe-270ab55198a4	00190000-561f-c2a5-2657-3ad9a54d4efb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-c2a5-0d3a-7d7a7f39fba2
000e0000-561f-c2a5-f7bd-77c38f66194f	\N	\N	00140000-561f-c2a2-51fe-270ab55198a4	00190000-561f-c2a5-2657-3ad9a54d4efb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-c2a5-22d2-cda72bc25e0a
000e0000-561f-c2a5-68fe-438f165e2b09	\N	\N	00140000-561f-c2a2-51fe-270ab55198a4	00190000-561f-c2a5-2657-3ad9a54d4efb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-c2a5-22d2-cda72bc25e0a
\.


--
-- TOC entry 3033 (class 0 OID 22031880)
-- Dependencies: 197
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561f-c2a5-a373-614f6d03e1d6	000e0000-561f-c2a5-9474-bef743a3c39d	\N	1	
00200000-561f-c2a5-cc69-cb7f884cc5ed	000e0000-561f-c2a5-9474-bef743a3c39d	\N	2	
00200000-561f-c2a5-8df3-4938821947dd	000e0000-561f-c2a5-9474-bef743a3c39d	\N	3	
00200000-561f-c2a5-cbce-961de12a9187	000e0000-561f-c2a5-9474-bef743a3c39d	\N	4	
00200000-561f-c2a5-4e2d-53c8f40671e7	000e0000-561f-c2a5-9474-bef743a3c39d	\N	5	
\.


--
-- TOC entry 3047 (class 0 OID 22032007)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 22032120)
-- Dependencies: 222
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561f-c2a3-1f7c-df06272da469	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561f-c2a3-bd3c-ca7c2268b53f	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561f-c2a3-1301-cb90f6c9f4e0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561f-c2a3-a254-0f8c40375c08	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561f-c2a3-999d-326e3eb24b52	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561f-c2a3-adfa-ced9efa39a4a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561f-c2a3-08cd-452c7c745d34	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561f-c2a3-6645-7f672efe4af1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561f-c2a3-7c98-3da2772ee62b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561f-c2a3-b1bd-8c84debd318e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561f-c2a3-da02-c370c7fb14f7	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561f-c2a3-0bbe-5869a4feec2e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561f-c2a3-0363-c4bb46b07fcf	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561f-c2a3-2d07-ac1ed8c702b9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561f-c2a3-e16a-9e5631461b8b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561f-c2a3-cc03-d381b09b0601	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561f-c2a3-17b9-cd18a0f2b353	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561f-c2a3-ca3a-ae9427cab4c8	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561f-c2a3-132b-36d5d6e9ebd5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561f-c2a3-01f2-650009c7bc14	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561f-c2a3-1929-e609d55f5164	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561f-c2a3-4e59-06225d747944	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561f-c2a3-5081-212c0526dc65	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561f-c2a3-7ef7-6281ec89063f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561f-c2a3-9ca5-bd0a5fed4100	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561f-c2a3-e6f9-a827d0c96508	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561f-c2a3-ca71-329d38576dcd	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561f-c2a3-df1b-d50588776ca5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3076 (class 0 OID 22032471)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 22032443)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22032483)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 22032079)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561f-c2a5-1ba5-bc37fc51819f	00090000-561f-c2a5-d2c4-08f02ce895cf	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-c2a5-fb0b-9148aecb4c76	00090000-561f-c2a5-b342-c476857e6b66	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-c2a5-ed32-fa6c9d587fca	00090000-561f-c2a5-6f67-b5db2ec345d4	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-c2a5-7341-85d6aad3f331	00090000-561f-c2a5-ef77-37f120455a1b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-c2a5-cdc8-339e9c1c7941	00090000-561f-c2a5-2c56-4c389c051b8a	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-c2a5-be88-57aafc5ec3f1	00090000-561f-c2a5-e496-ac62ab15fb02	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3035 (class 0 OID 22031915)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 22032187)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561f-c2a2-65cd-9117095a3a6b	01	Drama	drama (SURS 01)
00140000-561f-c2a2-90ba-37a4345aa02d	02	Opera	opera (SURS 02)
00140000-561f-c2a2-1dc9-222a49fc6263	03	Balet	balet (SURS 03)
00140000-561f-c2a2-a64f-d0ce6951ffcd	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561f-c2a2-0a9c-33bf3917c9a2	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561f-c2a2-51fe-270ab55198a4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561f-c2a2-9cba-5af19c383201	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3053 (class 0 OID 22032069)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2533 (class 2606 OID 22031679)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 22032246)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 22032236)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 22032103)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 22032145)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 22032523)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 22031904)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 22031925)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 22032441)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 22031815)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 22032314)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22032065)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 22031878)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 22031853)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 22031829)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 22031972)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 22032500)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22032507)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2792 (class 2606 OID 22032531)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 22028085)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2650 (class 2606 OID 22031999)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 22031787)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22031698)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 22031722)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 22031668)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2524 (class 2606 OID 22031653)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 22032005)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 22032041)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 22032182)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 22031750)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 22031775)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 22032393)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 22031978)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22031765)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 22031866)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 22031990)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 22032402)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 22032410)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 22032380)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 22032422)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 22032023)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 22031963)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 22031954)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 22032169)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 22032096)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 22031841)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 22031624)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22032032)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 22031642)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2526 (class 2606 OID 22031662)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 22032050)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 22031985)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22031934)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 22031612)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 22031600)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 22031594)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 22032116)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 22031731)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 22031945)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 22032156)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 22031687)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 22032434)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 22031800)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 22031637)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 22032215)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 22031888)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 22032013)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 22032128)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 22032481)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 22032465)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 22032489)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 22032087)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 22031919)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 22032195)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 22032077)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 1259 OID 22031913)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2603 (class 1259 OID 22031914)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2604 (class 1259 OID 22031912)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2605 (class 1259 OID 22031911)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2606 (class 1259 OID 22031910)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2692 (class 1259 OID 22032117)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2693 (class 1259 OID 22032118)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 22032119)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22032502)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2779 (class 1259 OID 22032501)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 22031752)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2552 (class 1259 OID 22031753)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2651 (class 1259 OID 22032006)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2765 (class 1259 OID 22032469)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2766 (class 1259 OID 22032468)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2767 (class 1259 OID 22032470)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2768 (class 1259 OID 22032467)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2769 (class 1259 OID 22032466)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 22031992)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2646 (class 1259 OID 22031991)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2597 (class 1259 OID 22031889)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 22032066)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 22032068)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2677 (class 1259 OID 22032067)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2577 (class 1259 OID 22031831)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 22031830)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 22032423)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2708 (class 1259 OID 22032184)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 22032185)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2710 (class 1259 OID 22032186)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2775 (class 1259 OID 22032490)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2717 (class 1259 OID 22032220)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2718 (class 1259 OID 22032217)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2719 (class 1259 OID 22032221)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2720 (class 1259 OID 22032219)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2721 (class 1259 OID 22032218)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2567 (class 1259 OID 22031802)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 22031801)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 22031725)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2663 (class 1259 OID 22032033)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2528 (class 1259 OID 22031669)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2529 (class 1259 OID 22031670)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2668 (class 1259 OID 22032053)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2669 (class 1259 OID 22032052)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2670 (class 1259 OID 22032051)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2590 (class 1259 OID 22031867)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 22031868)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2508 (class 1259 OID 22031602)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2625 (class 1259 OID 22031958)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2626 (class 1259 OID 22031956)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2627 (class 1259 OID 22031955)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2628 (class 1259 OID 22031957)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2519 (class 1259 OID 22031643)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2520 (class 1259 OID 22031644)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2654 (class 1259 OID 22032014)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2788 (class 1259 OID 22032524)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2690 (class 1259 OID 22032105)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2691 (class 1259 OID 22032104)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2789 (class 1259 OID 22032532)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2790 (class 1259 OID 22032533)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2640 (class 1259 OID 22031979)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2684 (class 1259 OID 22032097)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2685 (class 1259 OID 22032098)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2738 (class 1259 OID 22032319)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2739 (class 1259 OID 22032318)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2740 (class 1259 OID 22032315)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 22032316)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2742 (class 1259 OID 22032317)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2556 (class 1259 OID 22031767)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 22031766)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2558 (class 1259 OID 22031768)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 22032027)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2658 (class 1259 OID 22032026)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2748 (class 1259 OID 22032403)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2749 (class 1259 OID 22032404)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2731 (class 1259 OID 22032250)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 22032251)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2733 (class 1259 OID 22032248)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2734 (class 1259 OID 22032249)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2681 (class 1259 OID 22032088)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 22031967)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2632 (class 1259 OID 22031966)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2633 (class 1259 OID 22031964)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2634 (class 1259 OID 22031965)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2727 (class 1259 OID 22032238)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 22032237)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2581 (class 1259 OID 22031842)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2584 (class 1259 OID 22031856)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2585 (class 1259 OID 22031855)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2586 (class 1259 OID 22031854)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 22031857)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2596 (class 1259 OID 22031879)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2745 (class 1259 OID 22032394)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2764 (class 1259 OID 22032442)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2782 (class 1259 OID 22032508)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2783 (class 1259 OID 22032509)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 22031700)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 22031699)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 22031732)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 22031733)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 22031920)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 22031948)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 22031947)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2622 (class 1259 OID 22031946)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 22031906)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2608 (class 1259 OID 22031907)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2609 (class 1259 OID 22031905)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2610 (class 1259 OID 22031909)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2611 (class 1259 OID 22031908)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2555 (class 1259 OID 22031751)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 22031688)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 22031689)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2573 (class 1259 OID 22031816)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2574 (class 1259 OID 22031818)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2575 (class 1259 OID 22031817)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2576 (class 1259 OID 22031819)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2639 (class 1259 OID 22031973)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2713 (class 1259 OID 22032183)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 22032216)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 22032157)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 22032158)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2545 (class 1259 OID 22031723)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 22031724)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 22032078)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 22031613)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 22031788)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2511 (class 1259 OID 22031601)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2761 (class 1259 OID 22032435)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 22032025)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2662 (class 1259 OID 22032024)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 22032247)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 22031776)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 22032196)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2772 (class 1259 OID 22032482)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2754 (class 1259 OID 22032411)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2755 (class 1259 OID 22032412)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2701 (class 1259 OID 22032146)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2619 (class 1259 OID 22031935)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 22031663)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2824 (class 2606 OID 22032669)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2823 (class 2606 OID 22032674)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2819 (class 2606 OID 22032694)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2825 (class 2606 OID 22032664)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2821 (class 2606 OID 22032684)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2820 (class 2606 OID 22032689)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2822 (class 2606 OID 22032679)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2860 (class 2606 OID 22032859)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2859 (class 2606 OID 22032864)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2858 (class 2606 OID 22032869)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2892 (class 2606 OID 22033034)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2893 (class 2606 OID 22033029)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2805 (class 2606 OID 22032589)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2804 (class 2606 OID 22032594)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 22032779)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2887 (class 2606 OID 22033014)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 22033009)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2886 (class 2606 OID 22033019)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 22033004)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2890 (class 2606 OID 22032999)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2840 (class 2606 OID 22032774)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2841 (class 2606 OID 22032769)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2818 (class 2606 OID 22032659)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 22032819)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 22032829)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2851 (class 2606 OID 22032824)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2811 (class 2606 OID 22032629)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2812 (class 2606 OID 22032624)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 22032759)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 22032989)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2863 (class 2606 OID 22032874)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2862 (class 2606 OID 22032879)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 22032884)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2891 (class 2606 OID 22033024)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2865 (class 2606 OID 22032904)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2868 (class 2606 OID 22032889)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2864 (class 2606 OID 22032909)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2866 (class 2606 OID 22032899)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2867 (class 2606 OID 22032894)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2809 (class 2606 OID 22032619)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2810 (class 2606 OID 22032614)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 22032574)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2801 (class 2606 OID 22032569)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 22032799)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2797 (class 2606 OID 22032549)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2796 (class 2606 OID 22032554)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2847 (class 2606 OID 22032814)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2848 (class 2606 OID 22032809)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2849 (class 2606 OID 22032804)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2816 (class 2606 OID 22032644)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 22032649)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2793 (class 2606 OID 22032534)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2830 (class 2606 OID 22032734)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2832 (class 2606 OID 22032724)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2833 (class 2606 OID 22032719)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2831 (class 2606 OID 22032729)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2795 (class 2606 OID 22032539)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 22032544)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2843 (class 2606 OID 22032784)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2896 (class 2606 OID 22033049)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2856 (class 2606 OID 22032854)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2857 (class 2606 OID 22032849)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2898 (class 2606 OID 22033054)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2897 (class 2606 OID 22033059)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2839 (class 2606 OID 22032764)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2855 (class 2606 OID 22032839)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2854 (class 2606 OID 22032844)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2875 (class 2606 OID 22032964)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 22032959)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2879 (class 2606 OID 22032944)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2878 (class 2606 OID 22032949)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2877 (class 2606 OID 22032954)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2807 (class 2606 OID 22032604)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2808 (class 2606 OID 22032599)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2806 (class 2606 OID 22032609)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2844 (class 2606 OID 22032794)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2845 (class 2606 OID 22032789)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 22032974)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2881 (class 2606 OID 22032979)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2872 (class 2606 OID 22032934)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2871 (class 2606 OID 22032939)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2874 (class 2606 OID 22032924)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2873 (class 2606 OID 22032929)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2853 (class 2606 OID 22032834)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 22032754)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2835 (class 2606 OID 22032749)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 22032739)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2836 (class 2606 OID 22032744)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2869 (class 2606 OID 22032919)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2870 (class 2606 OID 22032914)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2813 (class 2606 OID 22032634)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2814 (class 2606 OID 22032639)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2817 (class 2606 OID 22032654)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 22032969)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 22032984)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 22032994)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2895 (class 2606 OID 22033039)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 22033044)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2798 (class 2606 OID 22032564)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2799 (class 2606 OID 22032559)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2803 (class 2606 OID 22032579)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2802 (class 2606 OID 22032584)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2826 (class 2606 OID 22032699)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 22032714)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 22032709)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2829 (class 2606 OID 22032704)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-15 17:13:45 CEST

--
-- PostgreSQL database dump complete
--

