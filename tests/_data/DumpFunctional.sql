--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-14 09:26:20 CEST

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
-- TOC entry 181 (class 1259 OID 21949763)
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
-- TOC entry 230 (class 1259 OID 21950331)
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
-- TOC entry 229 (class 1259 OID 21950314)
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
-- TOC entry 220 (class 1259 OID 21950191)
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
-- TOC entry 223 (class 1259 OID 21950221)
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
-- TOC entry 244 (class 1259 OID 21950602)
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
-- TOC entry 198 (class 1259 OID 21949982)
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
-- TOC entry 200 (class 1259 OID 21950013)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 21950528)
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
-- TOC entry 191 (class 1259 OID 21949895)
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
-- TOC entry 231 (class 1259 OID 21950344)
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
-- TOC entry 216 (class 1259 OID 21950146)
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
-- TOC entry 196 (class 1259 OID 21949961)
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
-- TOC entry 194 (class 1259 OID 21949935)
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
-- TOC entry 192 (class 1259 OID 21949912)
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
-- TOC entry 205 (class 1259 OID 21950060)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 21950583)
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
-- TOC entry 243 (class 1259 OID 21950595)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 21950617)
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
-- TOC entry 170 (class 1259 OID 21932907)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21950085)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 21949869)
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
-- TOC entry 183 (class 1259 OID 21949782)
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
-- TOC entry 184 (class 1259 OID 21949793)
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
-- TOC entry 178 (class 1259 OID 21949737)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21949756)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 21950092)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 21950126)
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
-- TOC entry 226 (class 1259 OID 21950262)
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
-- TOC entry 186 (class 1259 OID 21949826)
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
-- TOC entry 188 (class 1259 OID 21949861)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 21950473)
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
-- TOC entry 206 (class 1259 OID 21950066)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 21949846)
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
-- TOC entry 195 (class 1259 OID 21949950)
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
-- TOC entry 208 (class 1259 OID 21950078)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 21950487)
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
-- TOC entry 235 (class 1259 OID 21950497)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21950412)
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
-- TOC entry 236 (class 1259 OID 21950505)
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
-- TOC entry 212 (class 1259 OID 21950107)
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
-- TOC entry 204 (class 1259 OID 21950051)
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
-- TOC entry 203 (class 1259 OID 21950041)
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
-- TOC entry 225 (class 1259 OID 21950251)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 21950181)
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
-- TOC entry 193 (class 1259 OID 21949924)
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
-- TOC entry 175 (class 1259 OID 21949708)
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
-- TOC entry 174 (class 1259 OID 21949706)
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
-- TOC entry 213 (class 1259 OID 21950120)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21949746)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21949730)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 21950134)
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
-- TOC entry 207 (class 1259 OID 21950072)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 21950018)
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
-- TOC entry 173 (class 1259 OID 21949695)
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
-- TOC entry 172 (class 1259 OID 21949687)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21949682)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 221 (class 1259 OID 21950198)
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
-- TOC entry 185 (class 1259 OID 21949818)
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
-- TOC entry 202 (class 1259 OID 21950028)
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
-- TOC entry 224 (class 1259 OID 21950239)
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
-- TOC entry 182 (class 1259 OID 21949772)
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
-- TOC entry 237 (class 1259 OID 21950516)
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
-- TOC entry 190 (class 1259 OID 21949881)
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
-- TOC entry 176 (class 1259 OID 21949717)
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
-- TOC entry 228 (class 1259 OID 21950289)
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
-- TOC entry 197 (class 1259 OID 21949972)
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
-- TOC entry 211 (class 1259 OID 21950099)
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
-- TOC entry 222 (class 1259 OID 21950212)
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
-- TOC entry 240 (class 1259 OID 21950563)
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
-- TOC entry 239 (class 1259 OID 21950535)
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
-- TOC entry 241 (class 1259 OID 21950575)
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
-- TOC entry 218 (class 1259 OID 21950171)
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
-- TOC entry 199 (class 1259 OID 21950007)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 227 (class 1259 OID 21950279)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 21950161)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2206 (class 2604 OID 21949711)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3017 (class 0 OID 21949763)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 21950331)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561e-0393-6ce0-0aa53335c56d	000d0000-561e-0393-8e16-d66e28df4b4b	\N	00090000-561e-0393-37da-0f4cb3d9559c	000b0000-561e-0393-dd7d-850f34b24186	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561e-0393-107b-50bb185305b5	000d0000-561e-0393-0ff5-aced599e4fc4	00100000-561e-0393-d8e4-c3bb6ec27a82	00090000-561e-0393-26b7-a59871562c0e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561e-0393-5f15-f12a8cb166cf	000d0000-561e-0393-bbed-a7c718e086f2	00100000-561e-0393-2177-5063f735f6a0	00090000-561e-0393-418f-31fef3d16722	\N	0003	t	\N	2015-10-14	\N	2	t	\N	f	f
000c0000-561e-0393-e70c-7882a3743ad2	000d0000-561e-0393-762e-54ca8ace2593	\N	00090000-561e-0393-7fe2-913f07ea31e0	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561e-0393-8a45-f85dec4b8ba3	000d0000-561e-0393-686a-84025c6ca7b3	\N	00090000-561e-0393-9b8f-cc061b2101b4	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561e-0393-649e-87e8c2a68cf0	000d0000-561e-0393-1651-4a08f10171a1	\N	00090000-561e-0393-4da2-83a8e48369f8	000b0000-561e-0393-edac-ca8319ab5f21	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561e-0393-ba98-b445dd84af0f	000d0000-561e-0393-e05c-f79be551a060	00100000-561e-0393-ca2c-12a85deae6d8	00090000-561e-0393-bb70-e6b35672724d	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561e-0393-7587-87487301164f	000d0000-561e-0393-df73-a8368431fc3f	\N	00090000-561e-0393-5bd5-fac18300a486	000b0000-561e-0393-44ac-ecbe9ee44637	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561e-0393-1c78-2dfad13b84be	000d0000-561e-0393-e05c-f79be551a060	00100000-561e-0393-4650-3f78a08076bb	00090000-561e-0393-ee48-d2c7946c7d58	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561e-0393-2eb1-835f9d7f3344	000d0000-561e-0393-e05c-f79be551a060	00100000-561e-0393-a1de-b2fbc747c65b	00090000-561e-0393-dc75-e8e1e474306c	\N	0010	t	\N	2015-10-14	\N	16	f	\N	f	t
000c0000-561e-0393-0924-cd4e51073161	000d0000-561e-0393-e05c-f79be551a060	00100000-561e-0393-8248-4d3b21ab10a0	00090000-561e-0393-b27e-bc979946209e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561e-0393-4e22-783743497925	000d0000-561e-0393-8699-87d57308ddbc	\N	00090000-561e-0393-26b7-a59871562c0e	000b0000-561e-0393-88eb-aa6d3ed1e0eb	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3065 (class 0 OID 21950314)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 21950191)
-- Dependencies: 220
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561e-0393-994f-2363a75257d4	00160000-561e-0392-7f0d-ca797fe39b6f	00090000-561e-0393-95ab-2377bb1d156d	aizv	10	t
003d0000-561e-0393-8dfe-7a3003b7c085	00160000-561e-0392-7f0d-ca797fe39b6f	00090000-561e-0393-cc89-71ad1decb030	apri	14	t
003d0000-561e-0393-0b9f-83e80cefb84a	00160000-561e-0392-4652-ffecde760dd5	00090000-561e-0393-79bf-329496acc423	aizv	11	t
003d0000-561e-0393-c054-b625433ba1de	00160000-561e-0392-bb95-d287742d839d	00090000-561e-0393-770b-aadc986464fc	aizv	12	t
003d0000-561e-0393-84fc-fe5414f411bf	00160000-561e-0392-7f0d-ca797fe39b6f	00090000-561e-0393-66ca-34832e2a175e	apri	18	f
\.


--
-- TOC entry 3059 (class 0 OID 21950221)
-- Dependencies: 223
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561e-0392-7f0d-ca797fe39b6f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561e-0392-4652-ffecde760dd5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561e-0392-bb95-d287742d839d	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3080 (class 0 OID 21950602)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21949982)
-- Dependencies: 198
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561e-0393-a8c2-b2aea616ff77	\N	\N	00200000-561e-0393-3e96-b58ea63cf4cd	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561e-0393-91f4-f4a4f265e4c5	\N	\N	00200000-561e-0393-5464-5fa2606c3e5e	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561e-0393-22c9-ea4cd0254235	\N	\N	00200000-561e-0393-3862-10631526fd33	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561e-0393-dffe-6745596efee9	\N	\N	00200000-561e-0393-1ea7-1c9d2421b0ee	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561e-0393-91f6-a8ee644150b0	\N	\N	00200000-561e-0393-6518-821895a135cb	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3036 (class 0 OID 21950013)
-- Dependencies: 200
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 21950528)
-- Dependencies: 238
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21949895)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561e-038c-45c0-86408af666fe	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561e-038c-c7df-d4cd3fd115cd	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561e-038c-f2c2-9323321b6a77	AL	ALB	008	Albania 	Albanija	\N
00040000-561e-038c-2f65-c6dbec383eb2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561e-038c-f37e-1ffe78d5ac45	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561e-038c-b567-6029d50eca75	AD	AND	020	Andorra 	Andora	\N
00040000-561e-038c-559b-ed3c173f70c5	AO	AGO	024	Angola 	Angola	\N
00040000-561e-038c-8f55-1d3f05ee9720	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561e-038c-ff9c-05506232f1d5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561e-038c-d2fc-7c2adbe27ce3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561e-038c-52f7-e1861b4db94e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561e-038c-8df3-42d0a41da18e	AM	ARM	051	Armenia 	Armenija	\N
00040000-561e-038c-9e8e-e1722b66e6f0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561e-038c-6f89-38a6c385cefc	AU	AUS	036	Australia 	Avstralija	\N
00040000-561e-038c-0ffb-21fa15d5b17f	AT	AUT	040	Austria 	Avstrija	\N
00040000-561e-038c-3d2d-12a141cc6b5e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561e-038c-decd-e2b3bd9468fb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561e-038c-3b38-7b5a085708bf	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561e-038c-d02a-79d198e64cc0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561e-038c-5d2d-8e3b13847b9f	BB	BRB	052	Barbados 	Barbados	\N
00040000-561e-038c-d4ea-d7d0522cbbf7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561e-038c-66d6-9e20b78797a2	BE	BEL	056	Belgium 	Belgija	\N
00040000-561e-038c-4345-911ee8308c31	BZ	BLZ	084	Belize 	Belize	\N
00040000-561e-038c-2159-60d5261f7ddd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561e-038c-6e1f-b0b51a90dcdd	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561e-038c-2278-d69dff7a6f04	BT	BTN	064	Bhutan 	Butan	\N
00040000-561e-038c-c1a4-3eed1ab2841e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561e-038c-17c6-ad7d270d3a53	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561e-038c-1b6f-5f43f90dbeb3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561e-038c-c080-ef8b6ecd154d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561e-038c-1e3d-745dffcaebe6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561e-038c-7586-5ff0c8f35332	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561e-038c-89a4-056a41899f69	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561e-038c-094c-b89b847a6af1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561e-038c-63e3-15b7af401978	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561e-038c-7a38-c7415a2d8bf9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561e-038c-af5e-bf33c8ec1d77	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561e-038c-0402-fbc4cd89f4b3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561e-038c-788e-613d3ea7e2b8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561e-038c-7c26-9709557fd89f	CA	CAN	124	Canada 	Kanada	\N
00040000-561e-038c-b1e9-8ae6907ab2ff	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561e-038c-d644-1ab17afec322	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561e-038c-88c3-ed15b11ee11f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561e-038c-5a9d-db59cd7bd3d3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561e-038c-5eb2-f6d5abcbad80	CL	CHL	152	Chile 	Čile	\N
00040000-561e-038c-ecce-263258b9e81a	CN	CHN	156	China 	Kitajska	\N
00040000-561e-038c-31a2-91d270b61fc7	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561e-038c-4055-adbbdc9d40c0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561e-038c-e232-b99633e9678d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561e-038c-5ab4-495a767dc934	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561e-038c-d546-4b906da8ab14	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561e-038c-2340-e6d6e4033aeb	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561e-038c-0505-7030fb843ab9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561e-038c-68da-038700744b0e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561e-038c-586b-22dd669f2016	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561e-038c-0566-a687109647ef	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561e-038c-b8c1-bed9cfa60cfc	CU	CUB	192	Cuba 	Kuba	\N
00040000-561e-038d-64b4-a8e38d1a53c7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561e-038d-55e9-2cf2f813a3f7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561e-038d-f7f4-747a010cbca3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561e-038d-a99e-0086f2471a7d	DK	DNK	208	Denmark 	Danska	\N
00040000-561e-038d-21e2-1d98b8905a83	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561e-038d-c051-fc435bccb614	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561e-038d-0f84-b06b8e693e36	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561e-038d-94c4-80d5103aba3c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561e-038d-ef04-2aacc64f6209	EG	EGY	818	Egypt 	Egipt	\N
00040000-561e-038d-7a24-ee21555dec7e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561e-038d-25e0-28dbfb9be2c5	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561e-038d-e247-511821b18132	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561e-038d-44fe-6acd80cbc9bf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561e-038d-044d-3a52feb3b434	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561e-038d-c42e-c0d9abf63aef	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561e-038d-5b02-0bd9f41ba91b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561e-038d-6d05-de24413f01a6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561e-038d-96cc-5cec7193d52a	FI	FIN	246	Finland 	Finska	\N
00040000-561e-038d-601e-de0b72f8ff7f	FR	FRA	250	France 	Francija	\N
00040000-561e-038d-853c-eff6be364e55	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561e-038d-52ff-e60ec1ad7474	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561e-038d-ab9e-d6b4b08ca477	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561e-038d-4655-197d09ec10f7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561e-038d-62df-de1f8ae7dc83	GA	GAB	266	Gabon 	Gabon	\N
00040000-561e-038d-b0f6-ba66b4525026	GM	GMB	270	Gambia 	Gambija	\N
00040000-561e-038d-bcac-34b6ea0dac46	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561e-038d-b01e-51a441020e26	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561e-038d-5e15-1baca0e2657e	GH	GHA	288	Ghana 	Gana	\N
00040000-561e-038d-1f43-544a9a7f249e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561e-038d-79cd-ef9bbf04f103	GR	GRC	300	Greece 	Grčija	\N
00040000-561e-038d-0576-9c5fd3788db4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561e-038d-6fee-7d33aa811837	GD	GRD	308	Grenada 	Grenada	\N
00040000-561e-038d-ad22-1cd39414a278	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561e-038d-7158-58c764e32588	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561e-038d-7e37-0d6dc915fda0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561e-038d-c260-dd0b188fc2d0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561e-038d-786d-7dce53e4b4f1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561e-038d-5498-b89c2b430e0a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561e-038d-c3f0-1fb4b8528b09	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561e-038d-3794-4a41de840b8f	HT	HTI	332	Haiti 	Haiti	\N
00040000-561e-038d-b06d-2dbff128b0f4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561e-038d-9a39-4303d7114ec7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561e-038d-b50a-c0fc33306311	HN	HND	340	Honduras 	Honduras	\N
00040000-561e-038d-2b69-e843d18bd469	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561e-038d-56fd-4000edc17bd5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561e-038d-bf33-223104128af2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561e-038d-9b05-01555af92806	IN	IND	356	India 	Indija	\N
00040000-561e-038d-073c-0446ab306578	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561e-038d-7e83-73ebdcd1945b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561e-038d-83c8-3bbe0631d233	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561e-038d-ec3d-4b20a26bec5b	IE	IRL	372	Ireland 	Irska	\N
00040000-561e-038d-e7e6-3a88472a502e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561e-038d-08b0-b75a468d61cb	IL	ISR	376	Israel 	Izrael	\N
00040000-561e-038d-cfcc-2b68c4013dc6	IT	ITA	380	Italy 	Italija	\N
00040000-561e-038d-23b1-6486074921ac	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561e-038d-ac59-1c8b08d32a92	JP	JPN	392	Japan 	Japonska	\N
00040000-561e-038d-742d-a4c7e5677218	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561e-038d-4240-5f8d628b6752	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561e-038d-66eb-7b887d133840	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561e-038d-b558-8866d178bfc4	KE	KEN	404	Kenya 	Kenija	\N
00040000-561e-038d-0176-65ed5d2ef73e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561e-038d-0e31-32e692e1d472	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561e-038d-0e4b-b525cbbdb4d2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561e-038d-fee1-ece0008895a2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561e-038d-1105-02eea23b64aa	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561e-038d-4bce-ce401a23d2a5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561e-038d-981d-412ab5349f11	LV	LVA	428	Latvia 	Latvija	\N
00040000-561e-038d-9ad1-3cc9501c1711	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561e-038d-17ee-9eadcbcbd203	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561e-038d-93bd-c70d4286eae3	LR	LBR	430	Liberia 	Liberija	\N
00040000-561e-038d-f460-69d2a7f04b79	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561e-038d-dc0b-d4be4119d610	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561e-038d-f8e4-a837db4b35b3	LT	LTU	440	Lithuania 	Litva	\N
00040000-561e-038d-2027-b83db94c91e6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561e-038d-4e96-2c7a660ce699	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561e-038d-f032-2dca43ba8811	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561e-038d-d886-2ba872b9d1db	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561e-038d-df66-42deeab452f9	MW	MWI	454	Malawi 	Malavi	\N
00040000-561e-038d-eae9-b21d70e3b170	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561e-038d-979c-e2a2e399761a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561e-038d-1eeb-c5d32e7a0218	ML	MLI	466	Mali 	Mali	\N
00040000-561e-038d-d0b9-7f16f2247600	MT	MLT	470	Malta 	Malta	\N
00040000-561e-038d-d8f4-1fd8e81dfbc7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561e-038d-25de-5ec6096712b9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561e-038d-942b-9dd04027f694	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561e-038d-f644-2d616ad84836	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561e-038d-f6e3-7403c71de7fd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561e-038d-8107-6882880f40e6	MX	MEX	484	Mexico 	Mehika	\N
00040000-561e-038d-4b95-baee39e711bc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561e-038d-bda1-21b3d84b6ce9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561e-038d-3ef2-4093cdf109c7	MC	MCO	492	Monaco 	Monako	\N
00040000-561e-038d-b1de-35f5d1b79cfd	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561e-038d-94ec-a9aae322b112	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561e-038d-ba4c-2d5eb38458b2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561e-038d-1e2d-a728e73e642a	MA	MAR	504	Morocco 	Maroko	\N
00040000-561e-038d-919a-81a87c10c893	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561e-038d-b3a0-9d51a5e9db51	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561e-038d-505c-1f377bf3d98a	NA	NAM	516	Namibia 	Namibija	\N
00040000-561e-038d-0a16-186a0177d494	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561e-038d-e206-e8becab7c596	NP	NPL	524	Nepal 	Nepal	\N
00040000-561e-038d-5140-34ddbf08f564	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561e-038d-3b01-71e3a728fb03	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561e-038d-1042-8d20732b35b6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561e-038d-b985-7b44405dcbc2	NE	NER	562	Niger 	Niger 	\N
00040000-561e-038d-f540-af4f9fe04a6d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561e-038d-c705-9776ecb7e1b6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561e-038d-e1fa-4f12caed669a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561e-038d-987b-8592e645e789	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561e-038d-c3c8-6eb2293e8b55	NO	NOR	578	Norway 	Norveška	\N
00040000-561e-038d-817f-39d2f1aa123f	OM	OMN	512	Oman 	Oman	\N
00040000-561e-038d-f2be-744e70f042d4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561e-038d-b730-3fe4cca66d1b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561e-038d-62d3-c8ac9331823f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561e-038d-a4b7-1b4ab3494442	PA	PAN	591	Panama 	Panama	\N
00040000-561e-038d-6013-6bfe3df8b1e7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561e-038d-d631-18dfebe53294	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561e-038d-03ae-fa201126cb57	PE	PER	604	Peru 	Peru	\N
00040000-561e-038d-2b6e-a8decbb9ef2b	PH	PHL	608	Philippines 	Filipini	\N
00040000-561e-038d-7a9f-bcfa214b4759	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561e-038d-59ef-f08a3c4e546c	PL	POL	616	Poland 	Poljska	\N
00040000-561e-038d-5326-96afd337fcf1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561e-038d-0759-532ad2ba4b00	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561e-038d-487d-caeac465e968	QA	QAT	634	Qatar 	Katar	\N
00040000-561e-038d-47a9-b6f2554468b1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561e-038d-45c0-29757d2cf885	RO	ROU	642	Romania 	Romunija	\N
00040000-561e-038d-68e2-270faf091992	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561e-038d-4c81-dd084f7585dc	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561e-038d-baa6-66aeff0a25fb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561e-038d-631e-f7c63d9739ef	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561e-038d-d8a9-47dad92b25f7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561e-038d-1cdf-78fd02960078	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561e-038d-b1a5-b2f127be83e2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561e-038d-9d6b-5631876e3819	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561e-038d-8b6d-6a53cf8da494	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561e-038d-cb9c-ff1052792cb3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561e-038d-0382-5d5facd6a180	SM	SMR	674	San Marino 	San Marino	\N
00040000-561e-038d-a933-b90b1c4e2a7a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561e-038d-0ec5-364cf0591618	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561e-038d-1c12-8a1ab56d42bb	SN	SEN	686	Senegal 	Senegal	\N
00040000-561e-038d-0f03-6fb3d9f89b98	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561e-038d-46d1-b91608bbda76	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561e-038d-45f5-11655d59c69b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561e-038d-2feb-70c2919d18a8	SG	SGP	702	Singapore 	Singapur	\N
00040000-561e-038d-5391-90283ba33236	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561e-038d-3c53-18743abc522b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561e-038d-e12b-1fba2d2f9256	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561e-038d-96e2-64f5d790fca5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561e-038d-eb55-c96d84f14578	SO	SOM	706	Somalia 	Somalija	\N
00040000-561e-038d-1722-5fe9d65feb6b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561e-038d-8a29-bf0a6cdc6ee5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561e-038d-6245-cc552a2aad8c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561e-038d-710a-c5b13b7b91af	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561e-038d-c884-b8197764c773	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561e-038d-f4c7-6a5e51b9b6bd	SD	SDN	729	Sudan 	Sudan	\N
00040000-561e-038d-cb9a-67f2dd618c6f	SR	SUR	740	Suriname 	Surinam	\N
00040000-561e-038d-c2d8-49c860761d7d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561e-038d-8a50-f180df8308a1	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561e-038d-2527-56fa725b8089	SE	SWE	752	Sweden 	Švedska	\N
00040000-561e-038d-b55c-0aee4717be56	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561e-038d-c739-ddf604e0184a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561e-038d-9759-1b69d79ff7e4	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561e-038d-d166-f737a176c1d9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561e-038d-deca-8742c015548d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561e-038d-6c00-5dfd84ea1917	TH	THA	764	Thailand 	Tajska	\N
00040000-561e-038d-2a29-43753cdb9788	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561e-038d-a63a-c4511d7f0beb	TG	TGO	768	Togo 	Togo	\N
00040000-561e-038d-8ae0-dd92fbec9a4e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561e-038d-fa49-01c8ac41f0ea	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561e-038d-1bda-d3bd71ff7064	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561e-038d-c377-1302af761779	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561e-038d-5a1a-d101a2e32f55	TR	TUR	792	Turkey 	Turčija	\N
00040000-561e-038d-8f85-9242a69cf625	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561e-038d-f01d-41dac0255a58	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561e-038d-2b2d-4e88c13138c3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561e-038d-6dd2-882ccffeaede	UG	UGA	800	Uganda 	Uganda	\N
00040000-561e-038d-fafc-9b9fa414b0a4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561e-038d-396b-52b10539684f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561e-038d-89a8-bea8369fb6cd	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561e-038d-7ec2-c204cc900c4d	US	USA	840	United States 	Združene države Amerike	\N
00040000-561e-038d-0a81-d4bd599d8133	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561e-038d-cf8b-3369116e3cd8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561e-038d-853e-4f447c29acbe	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561e-038d-d221-f0e70fa4664d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561e-038d-03f6-ab75c37e90da	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561e-038d-3aac-c53de548b054	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561e-038d-c187-3a3e77e98418	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561e-038d-ee0c-5deb74c27c66	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561e-038d-7008-76da9e28fbc5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561e-038d-de67-37eba1204e7f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561e-038d-a739-0f90791f6c65	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561e-038d-fe43-25dfd1bf1974	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561e-038d-7ab6-4a3082c99f3f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3067 (class 0 OID 21950344)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561e-0393-1a72-ea4422f8b43d	000e0000-561e-0393-8e59-64e159d86f78	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561e-038c-fd39-63eddcf7504c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561e-0393-f338-704ece48506c	000e0000-561e-0393-a733-9df6d8d65432	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561e-038c-d24c-d3e4e4d419ac	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561e-0393-7e0f-3a716e9ad917	000e0000-561e-0393-dbb5-bf593c797b46	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561e-038c-fd39-63eddcf7504c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561e-0393-a997-69e15c3ac4db	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561e-0393-5100-dea208ccbb63	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 21950146)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561e-0393-8e16-d66e28df4b4b	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-6ce0-0aa53335c56d	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561e-038c-512d-72cc0465d2a4
000d0000-561e-0393-0ff5-aced599e4fc4	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-107b-50bb185305b5	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561e-038c-80eb-fa59835a0060
000d0000-561e-0393-bbed-a7c718e086f2	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-5f15-f12a8cb166cf	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561e-038c-d1c3-f47fb1dfb899
000d0000-561e-0393-762e-54ca8ace2593	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-e70c-7882a3743ad2	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561e-038c-bd49-9ad9f95d253f
000d0000-561e-0393-686a-84025c6ca7b3	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-8a45-f85dec4b8ba3	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561e-038c-bd49-9ad9f95d253f
000d0000-561e-0393-1651-4a08f10171a1	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-649e-87e8c2a68cf0	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561e-038c-512d-72cc0465d2a4
000d0000-561e-0393-e05c-f79be551a060	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-1c78-2dfad13b84be	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561e-038c-512d-72cc0465d2a4
000d0000-561e-0393-df73-a8368431fc3f	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-7587-87487301164f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561e-038c-81c4-1f9f6bfbb165
000d0000-561e-0393-8699-87d57308ddbc	000e0000-561e-0393-a733-9df6d8d65432	000c0000-561e-0393-4e22-783743497925	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561e-038c-4063-12d1ac2b2927
\.


--
-- TOC entry 3032 (class 0 OID 21949961)
-- Dependencies: 196
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21949935)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 21949912)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561e-0393-fe24-14827f3c1c60	00080000-561e-0393-baa2-386b453d1e74	00090000-561e-0393-dc75-e8e1e474306c	AK		igralka
\.


--
-- TOC entry 3041 (class 0 OID 21950060)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 21950583)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 21950595)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 21950617)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21932907)
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
\.


--
-- TOC entry 3045 (class 0 OID 21950085)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21949869)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561e-038e-7dce-ecb455b15a11	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561e-038e-53f5-f67c4c31355a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561e-038e-5311-77fafe8442ee	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561e-038e-f195-c1d07755f54b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561e-038e-8440-d794d6b12f11	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561e-038e-397a-b0ed7e554717	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561e-038e-8e94-01218437e477	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561e-038e-52d5-e3b027e97ddd	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561e-038e-753b-10feb9652b09	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561e-038e-9aac-beb46bd07ba8	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561e-038e-c226-49dbba2cc16b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561e-038e-baee-6c710f10c39b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561e-038e-8888-79946974e64b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561e-038e-dceb-06c90f64415d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561e-038e-1ed0-8976b83e5b36	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561e-0392-125a-36ef5bd98b6a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561e-0392-86a6-352f200b12b4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561e-0392-06e2-b8c8bfbb7d89	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561e-0392-9fc8-5c66a74617a3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561e-0392-4f0b-5a784647fca0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561e-0398-7a6e-77edee5906c2	application.tenant.maticnopodjetje	string	s:36:"00080000-561e-0398-08a2-98a34d3e963a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3019 (class 0 OID 21949782)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561e-0392-14ca-ec1b8bd63668	00000000-561e-0392-125a-36ef5bd98b6a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561e-0392-5be4-5b22351893b3	00000000-561e-0392-125a-36ef5bd98b6a	00010000-561e-038e-eda8-5f2b285de750	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561e-0392-8642-183bce346e4d	00000000-561e-0392-86a6-352f200b12b4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3020 (class 0 OID 21949793)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561e-0393-37da-0f4cb3d9559c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561e-0393-7fe2-913f07ea31e0	00010000-561e-0393-37ba-0f786b1305cc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561e-0393-418f-31fef3d16722	00010000-561e-0393-f108-a497fe2d8b73	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561e-0393-ee48-d2c7946c7d58	00010000-561e-0393-f8ef-d813968a669a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561e-0393-1813-e5a7ea9c1d60	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561e-0393-4da2-83a8e48369f8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561e-0393-b27e-bc979946209e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561e-0393-bb70-e6b35672724d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561e-0393-dc75-e8e1e474306c	00010000-561e-0393-43ac-b20854828c3a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561e-0393-26b7-a59871562c0e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561e-0393-f98a-a2c57bbbcb49	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561e-0393-9b8f-cc061b2101b4	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561e-0393-5bd5-fac18300a486	00010000-561e-0393-8068-66e721be80d8	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561e-0393-95ab-2377bb1d156d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561e-0393-cc89-71ad1decb030	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561e-0393-79bf-329496acc423	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561e-0393-770b-aadc986464fc	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561e-0393-66ca-34832e2a175e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 21949737)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561e-038d-db12-49948ea7e982	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561e-038d-528a-6d5320497061	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561e-038d-57f6-e617ca6521e1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561e-038d-1562-e1344ec3d014	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561e-038d-7a66-975759d5be64	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561e-038d-50a1-d59e49338f44	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561e-038d-2181-a9b8c7d23ab6	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561e-038d-a0d3-94fefb5ba2eb	Abonma-read	Abonma - branje	f
00030000-561e-038d-0897-4c7e87769d2f	Abonma-write	Abonma - spreminjanje	f
00030000-561e-038d-30ae-ee3851d22f20	Alternacija-read	Alternacija - branje	f
00030000-561e-038d-6242-a75809584d2d	Alternacija-write	Alternacija - spreminjanje	f
00030000-561e-038d-4473-14c4fb174e65	Arhivalija-read	Arhivalija - branje	f
00030000-561e-038d-5ea0-822a6d4a53f5	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561e-038d-64f3-0891d2f9c32b	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561e-038d-2dc5-c38bd670335a	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561e-038d-9a8d-47bffa499d3e	Besedilo-read	Besedilo - branje	f
00030000-561e-038d-0f53-cff1705f4e3a	Besedilo-write	Besedilo - spreminjanje	f
00030000-561e-038d-c33d-48f4c2cdd18f	DogodekIzven-read	DogodekIzven - branje	f
00030000-561e-038d-b9d2-364c8d75ebce	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561e-038d-bb3c-d89f8111257c	Dogodek-read	Dogodek - branje	f
00030000-561e-038d-4119-bf92f7e21e46	Dogodek-write	Dogodek - spreminjanje	f
00030000-561e-038d-dea6-2f64d7a5aa42	DrugiVir-read	DrugiVir - branje	f
00030000-561e-038d-7f95-6b008b43c1df	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561e-038d-d37e-ecc394f557a1	Drzava-read	Drzava - branje	f
00030000-561e-038d-ab32-82a9ed79d61e	Drzava-write	Drzava - spreminjanje	f
00030000-561e-038d-eaaa-b81b09de7f3b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561e-038d-8b96-9bf89a76cad5	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561e-038d-e31d-b8c21e5571ec	Funkcija-read	Funkcija - branje	f
00030000-561e-038d-f59f-d011f92116a9	Funkcija-write	Funkcija - spreminjanje	f
00030000-561e-038d-1c28-2aae7913adda	Gostovanje-read	Gostovanje - branje	f
00030000-561e-038d-a798-16a32bd83d24	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561e-038d-408d-8752959c6be0	Gostujoca-read	Gostujoca - branje	f
00030000-561e-038d-477f-3d9d80560e9d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561e-038d-8e1a-9c55879dfafd	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561e-038d-00d2-37b5f55d8141	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561e-038d-dc9b-878261ff8069	Kupec-read	Kupec - branje	f
00030000-561e-038d-ffd9-ada2dcd4dcdc	Kupec-write	Kupec - spreminjanje	f
00030000-561e-038d-ec73-120ad41a658c	NacinPlacina-read	NacinPlacina - branje	f
00030000-561e-038d-78cb-56daf47e512e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561e-038d-a280-9e1231fe4fbd	Option-read	Option - branje	f
00030000-561e-038d-b2d8-9a6164ebbb7c	Option-write	Option - spreminjanje	f
00030000-561e-038d-0558-1af8360899a7	OptionValue-read	OptionValue - branje	f
00030000-561e-038d-62d8-351533eaa0b6	OptionValue-write	OptionValue - spreminjanje	f
00030000-561e-038d-72f7-8466d1a7305c	Oseba-read	Oseba - branje	f
00030000-561e-038d-2714-bd7507635284	Oseba-write	Oseba - spreminjanje	f
00030000-561e-038d-f06f-0fef60fa1895	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561e-038d-2c21-fb963782b450	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561e-038d-9c18-ca138e6e4e56	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561e-038d-dd69-3e0659c08814	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561e-038d-1bc5-3056445c574c	Pogodba-read	Pogodba - branje	f
00030000-561e-038d-251a-2544485ea38f	Pogodba-write	Pogodba - spreminjanje	f
00030000-561e-038d-7e74-41f082a989fe	Popa-read	Popa - branje	f
00030000-561e-038d-da01-89f6bb0ddb88	Popa-write	Popa - spreminjanje	f
00030000-561e-038d-b9b8-7d8559afcf4d	Posta-read	Posta - branje	f
00030000-561e-038d-ba8c-e65d47425f87	Posta-write	Posta - spreminjanje	f
00030000-561e-038d-cce3-ec3487820e52	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561e-038d-1c7b-a28b792bfe70	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561e-038d-6c03-876a489b6408	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561e-038d-5d48-f4fbf44566ea	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561e-038d-e66a-02930a19a266	PostniNaslov-read	PostniNaslov - branje	f
00030000-561e-038d-84a3-62c4dc2c543a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561e-038d-6a02-206a1e993d3c	Predstava-read	Predstava - branje	f
00030000-561e-038d-ff35-694013d5606b	Predstava-write	Predstava - spreminjanje	f
00030000-561e-038d-dd41-b642d747bfa1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561e-038d-1b26-ce3ae3367969	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561e-038d-4560-9fa2b327f376	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561e-038d-044f-4f52db67e31e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561e-038d-d2b6-e554eb14c745	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561e-038d-9f57-57b4b96d8a12	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561e-038d-e008-f6ef1d181b03	ProgramDela-read	ProgramDela - branje	f
00030000-561e-038d-98e5-bf6b3c90ab72	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561e-038d-9c20-983fd7bebc69	ProgramFestival-read	ProgramFestival - branje	f
00030000-561e-038d-e0a3-e6e8fbfc9780	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561e-038d-b804-02649320718e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561e-038d-3c51-fbfdc99458a0	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561e-038d-ee07-67714f5c82a6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561e-038d-a4ce-63ca81530d8c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561e-038d-01c8-d0446d2e3678	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561e-038d-faf7-c61b99d92fe9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561e-038d-2178-9c1b32e05935	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561e-038d-6709-89f84ac928a7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561e-038d-28ff-bf056bc9c578	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561e-038d-6620-a3ad6d5457fb	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561e-038d-4659-a78061514490	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561e-038d-25ce-20e2ac1a6d94	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561e-038d-a39c-60580af26b71	ProgramRazno-read	ProgramRazno - branje	f
00030000-561e-038d-1dc4-2cca0dc3e8fa	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561e-038d-e61e-f869607eac75	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561e-038d-01ed-3a7f7b4973b8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561e-038d-75b0-34722de2138a	Prostor-read	Prostor - branje	f
00030000-561e-038d-b09b-3cbfd9af6127	Prostor-write	Prostor - spreminjanje	f
00030000-561e-038d-1c9d-762e3734fa3a	Racun-read	Racun - branje	f
00030000-561e-038d-361c-d5815112b3d4	Racun-write	Racun - spreminjanje	f
00030000-561e-038d-c674-38b27a52a051	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561e-038d-6fac-300834fb4e9c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561e-038d-cc09-dade71d96eeb	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561e-038d-e51d-c92fe92a4267	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561e-038d-5f61-ced742c68f34	Rekvizit-read	Rekvizit - branje	f
00030000-561e-038d-0371-c12eaede8cda	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561e-038d-98e4-80ff8462d074	Revizija-read	Revizija - branje	f
00030000-561e-038d-c385-47f8f41cf914	Revizija-write	Revizija - spreminjanje	f
00030000-561e-038d-df56-e9d3045a9231	Rezervacija-read	Rezervacija - branje	f
00030000-561e-038d-d0d2-f8e8a66f6dd0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561e-038d-c95e-418180706c0a	SedezniRed-read	SedezniRed - branje	f
00030000-561e-038d-8d8c-688fb6ce1004	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561e-038d-1d80-6b63c5b7bde1	Sedez-read	Sedez - branje	f
00030000-561e-038d-26a7-08764529c8e7	Sedez-write	Sedez - spreminjanje	f
00030000-561e-038d-2ef7-df6e8954b575	Sezona-read	Sezona - branje	f
00030000-561e-038d-0ad9-503019ae37e7	Sezona-write	Sezona - spreminjanje	f
00030000-561e-038d-0ee5-1fe83a009b80	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561e-038d-2f5b-a549c0fa1ec5	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561e-038d-cbd6-876e3a93617b	Stevilcenje-read	Stevilcenje - branje	f
00030000-561e-038d-6913-26bcac51c7ac	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561e-038d-de2e-9606d71dabb5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561e-038d-892e-24b02e24e397	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561e-038d-95d0-0d39654fcdd5	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561e-038d-ba99-4396bec60f02	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561e-038d-680a-661be671890a	Telefonska-read	Telefonska - branje	f
00030000-561e-038d-2ce2-df1ff6e146b1	Telefonska-write	Telefonska - spreminjanje	f
00030000-561e-038d-36a8-3f7b13d68bc0	TerminStoritve-read	TerminStoritve - branje	f
00030000-561e-038d-0162-923b3d05aa2c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561e-038d-f0e9-be166806801c	TipFunkcije-read	TipFunkcije - branje	f
00030000-561e-038d-abf9-e25cd11a4a76	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561e-038d-bd63-802f5135a257	TipPopa-read	TipPopa - branje	f
00030000-561e-038d-1fa0-9df1e4eaee12	TipPopa-write	TipPopa - spreminjanje	f
00030000-561e-038d-0adb-1abc50b5c2ef	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561e-038d-5ae9-1b0af7ec2d48	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561e-038d-107e-b88b62920845	Trr-read	Trr - branje	f
00030000-561e-038d-cc90-6b4a077a1fea	Trr-write	Trr - spreminjanje	f
00030000-561e-038d-c7cd-75eac84257ef	Uprizoritev-read	Uprizoritev - branje	f
00030000-561e-038d-1e8c-8305b6c61ca2	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561e-038d-28cd-9596be1b262f	Vaja-read	Vaja - branje	f
00030000-561e-038d-4f19-417b54f849f7	Vaja-write	Vaja - spreminjanje	f
00030000-561e-038d-5fd2-c1899b5ddb26	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561e-038d-8af4-267b74990479	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561e-038d-37b9-0dd234fe9521	VrstaStroska-read	VrstaStroska - branje	f
00030000-561e-038d-415c-317c49e77610	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561e-038d-af40-f61f4afe1d91	Zaposlitev-read	Zaposlitev - branje	f
00030000-561e-038d-2696-a72ad4e54982	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561e-038d-8a1f-e34ac649b8c5	Zasedenost-read	Zasedenost - branje	f
00030000-561e-038d-80ee-4a3deadb7317	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561e-038d-76d4-10bbc34ed3a3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561e-038d-429f-f97fefa1a7af	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561e-038d-6f9f-efaddb828c68	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561e-038d-2e11-c26e17b5db58	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561e-038d-2de9-d72b92c4b522	Job-read	Branje opravil - samo zase - branje	f
00030000-561e-038d-cac7-1827ade73e6f	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561e-038d-acde-b6171ce59aa6	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561e-038d-d4ef-93d8771848a4	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561e-038d-718a-97951f2a1a43	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561e-038d-b52f-a59ce8dd76b7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561e-038d-97f8-e45d02716c7f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561e-038d-36f6-1ad6854e19ad	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561e-038d-25da-2d6e5fbc47ed	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561e-038d-15e1-bd1a9395bef6	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561e-038d-6499-6405805d17fd	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561e-038d-9648-f411d39962c1	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561e-038d-64f7-235fcbc35e21	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561e-038d-9e7f-6cf210e37b66	Datoteka-write	Datoteka - spreminjanje	f
00030000-561e-038d-8394-e34bfa0b1efe	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3016 (class 0 OID 21949756)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561e-038d-dc36-8301ba8d33dc	00030000-561e-038d-528a-6d5320497061
00020000-561e-038d-83e7-2cf4e3b21ce2	00030000-561e-038d-d37e-ecc394f557a1
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-a0d3-94fefb5ba2eb
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-0897-4c7e87769d2f
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-30ae-ee3851d22f20
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-6242-a75809584d2d
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-4473-14c4fb174e65
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-bb3c-d89f8111257c
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-1562-e1344ec3d014
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-4119-bf92f7e21e46
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-d37e-ecc394f557a1
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-ab32-82a9ed79d61e
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-e31d-b8c21e5571ec
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-f59f-d011f92116a9
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-1c28-2aae7913adda
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-a798-16a32bd83d24
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-408d-8752959c6be0
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-477f-3d9d80560e9d
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-8e1a-9c55879dfafd
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-00d2-37b5f55d8141
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-a280-9e1231fe4fbd
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-0558-1af8360899a7
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-72f7-8466d1a7305c
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-2714-bd7507635284
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-7e74-41f082a989fe
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-da01-89f6bb0ddb88
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-b9b8-7d8559afcf4d
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-ba8c-e65d47425f87
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-e66a-02930a19a266
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-84a3-62c4dc2c543a
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-6a02-206a1e993d3c
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-ff35-694013d5606b
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-d2b6-e554eb14c745
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-9f57-57b4b96d8a12
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-75b0-34722de2138a
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-b09b-3cbfd9af6127
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-cc09-dade71d96eeb
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-e51d-c92fe92a4267
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-5f61-ced742c68f34
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-0371-c12eaede8cda
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-2ef7-df6e8954b575
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-0ad9-503019ae37e7
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-f0e9-be166806801c
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-c7cd-75eac84257ef
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-1e8c-8305b6c61ca2
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-28cd-9596be1b262f
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-4f19-417b54f849f7
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-8a1f-e34ac649b8c5
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-80ee-4a3deadb7317
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-76d4-10bbc34ed3a3
00020000-561e-038d-fd27-8505434346c5	00030000-561e-038d-6f9f-efaddb828c68
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-a0d3-94fefb5ba2eb
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-4473-14c4fb174e65
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-bb3c-d89f8111257c
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-d37e-ecc394f557a1
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-1c28-2aae7913adda
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-408d-8752959c6be0
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-8e1a-9c55879dfafd
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-00d2-37b5f55d8141
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-a280-9e1231fe4fbd
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-0558-1af8360899a7
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-72f7-8466d1a7305c
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-2714-bd7507635284
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-7e74-41f082a989fe
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-b9b8-7d8559afcf4d
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-e66a-02930a19a266
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-84a3-62c4dc2c543a
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-6a02-206a1e993d3c
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-75b0-34722de2138a
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-cc09-dade71d96eeb
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-5f61-ced742c68f34
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-2ef7-df6e8954b575
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-680a-661be671890a
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-2ce2-df1ff6e146b1
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-107e-b88b62920845
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-cc90-6b4a077a1fea
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-af40-f61f4afe1d91
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-2696-a72ad4e54982
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-76d4-10bbc34ed3a3
00020000-561e-038e-1be0-f94cbff3d33d	00030000-561e-038d-6f9f-efaddb828c68
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-a0d3-94fefb5ba2eb
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-30ae-ee3851d22f20
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-4473-14c4fb174e65
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-5ea0-822a6d4a53f5
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-9a8d-47bffa499d3e
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-c33d-48f4c2cdd18f
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-bb3c-d89f8111257c
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-d37e-ecc394f557a1
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-e31d-b8c21e5571ec
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-1c28-2aae7913adda
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-408d-8752959c6be0
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-8e1a-9c55879dfafd
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-a280-9e1231fe4fbd
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-0558-1af8360899a7
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-72f7-8466d1a7305c
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-7e74-41f082a989fe
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-b9b8-7d8559afcf4d
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-6a02-206a1e993d3c
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-d2b6-e554eb14c745
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-75b0-34722de2138a
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-cc09-dade71d96eeb
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-5f61-ced742c68f34
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-2ef7-df6e8954b575
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-f0e9-be166806801c
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-28cd-9596be1b262f
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-8a1f-e34ac649b8c5
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-76d4-10bbc34ed3a3
00020000-561e-038e-f6bd-bbccd0c70b3d	00030000-561e-038d-6f9f-efaddb828c68
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-a0d3-94fefb5ba2eb
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-0897-4c7e87769d2f
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-6242-a75809584d2d
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-4473-14c4fb174e65
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-bb3c-d89f8111257c
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-d37e-ecc394f557a1
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-1c28-2aae7913adda
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-408d-8752959c6be0
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-a280-9e1231fe4fbd
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-0558-1af8360899a7
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-7e74-41f082a989fe
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-b9b8-7d8559afcf4d
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-6a02-206a1e993d3c
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-75b0-34722de2138a
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-cc09-dade71d96eeb
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-5f61-ced742c68f34
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-2ef7-df6e8954b575
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-f0e9-be166806801c
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-76d4-10bbc34ed3a3
00020000-561e-038e-b68d-a8e9a19a3697	00030000-561e-038d-6f9f-efaddb828c68
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-a0d3-94fefb5ba2eb
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-4473-14c4fb174e65
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-bb3c-d89f8111257c
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-d37e-ecc394f557a1
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-1c28-2aae7913adda
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-408d-8752959c6be0
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-a280-9e1231fe4fbd
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-0558-1af8360899a7
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-7e74-41f082a989fe
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-b9b8-7d8559afcf4d
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-6a02-206a1e993d3c
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-75b0-34722de2138a
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-cc09-dade71d96eeb
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-5f61-ced742c68f34
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-2ef7-df6e8954b575
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-36a8-3f7b13d68bc0
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-57f6-e617ca6521e1
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-f0e9-be166806801c
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-76d4-10bbc34ed3a3
00020000-561e-038e-9ee1-c9aac8f213bb	00030000-561e-038d-6f9f-efaddb828c68
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-db12-49948ea7e982
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-528a-6d5320497061
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-57f6-e617ca6521e1
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1562-e1344ec3d014
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-7a66-975759d5be64
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-50a1-d59e49338f44
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2181-a9b8c7d23ab6
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-a0d3-94fefb5ba2eb
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0897-4c7e87769d2f
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-30ae-ee3851d22f20
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6242-a75809584d2d
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-4473-14c4fb174e65
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-5ea0-822a6d4a53f5
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-9a8d-47bffa499d3e
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0f53-cff1705f4e3a
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-c33d-48f4c2cdd18f
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-b9d2-364c8d75ebce
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-bb3c-d89f8111257c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-4119-bf92f7e21e46
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-d37e-ecc394f557a1
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-ab32-82a9ed79d61e
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-dea6-2f64d7a5aa42
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-7f95-6b008b43c1df
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-eaaa-b81b09de7f3b
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-8b96-9bf89a76cad5
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-e31d-b8c21e5571ec
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-f59f-d011f92116a9
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1c28-2aae7913adda
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-a798-16a32bd83d24
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-408d-8752959c6be0
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-477f-3d9d80560e9d
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-8e1a-9c55879dfafd
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-00d2-37b5f55d8141
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-dc9b-878261ff8069
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-ffd9-ada2dcd4dcdc
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-ec73-120ad41a658c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-78cb-56daf47e512e
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-a280-9e1231fe4fbd
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-b2d8-9a6164ebbb7c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0558-1af8360899a7
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-62d8-351533eaa0b6
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-72f7-8466d1a7305c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2714-bd7507635284
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-f06f-0fef60fa1895
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2c21-fb963782b450
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-9c18-ca138e6e4e56
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-dd69-3e0659c08814
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1bc5-3056445c574c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-251a-2544485ea38f
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-7e74-41f082a989fe
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-da01-89f6bb0ddb88
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-b9b8-7d8559afcf4d
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-ba8c-e65d47425f87
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-cce3-ec3487820e52
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1c7b-a28b792bfe70
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6c03-876a489b6408
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-5d48-f4fbf44566ea
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-e66a-02930a19a266
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-84a3-62c4dc2c543a
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6a02-206a1e993d3c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-ff35-694013d5606b
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-dd41-b642d747bfa1
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1b26-ce3ae3367969
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-4560-9fa2b327f376
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-044f-4f52db67e31e
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-d2b6-e554eb14c745
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-9f57-57b4b96d8a12
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-e008-f6ef1d181b03
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-98e5-bf6b3c90ab72
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-9c20-983fd7bebc69
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-e0a3-e6e8fbfc9780
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-b804-02649320718e
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-3c51-fbfdc99458a0
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-ee07-67714f5c82a6
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-a4ce-63ca81530d8c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-01c8-d0446d2e3678
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-faf7-c61b99d92fe9
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2178-9c1b32e05935
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6709-89f84ac928a7
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-28ff-bf056bc9c578
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6620-a3ad6d5457fb
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-4659-a78061514490
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-25ce-20e2ac1a6d94
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-a39c-60580af26b71
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1dc4-2cca0dc3e8fa
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-e61e-f869607eac75
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-01ed-3a7f7b4973b8
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-75b0-34722de2138a
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-b09b-3cbfd9af6127
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1c9d-762e3734fa3a
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-361c-d5815112b3d4
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-c674-38b27a52a051
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6fac-300834fb4e9c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-cc09-dade71d96eeb
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-e51d-c92fe92a4267
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-5f61-ced742c68f34
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0371-c12eaede8cda
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-98e4-80ff8462d074
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-c385-47f8f41cf914
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-df56-e9d3045a9231
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-d0d2-f8e8a66f6dd0
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-c95e-418180706c0a
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-8d8c-688fb6ce1004
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1d80-6b63c5b7bde1
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-26a7-08764529c8e7
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2ef7-df6e8954b575
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0ad9-503019ae37e7
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0ee5-1fe83a009b80
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2f5b-a549c0fa1ec5
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-cbd6-876e3a93617b
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6913-26bcac51c7ac
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-de2e-9606d71dabb5
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-892e-24b02e24e397
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-95d0-0d39654fcdd5
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-ba99-4396bec60f02
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-680a-661be671890a
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2ce2-df1ff6e146b1
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-36a8-3f7b13d68bc0
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0162-923b3d05aa2c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-f0e9-be166806801c
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-abf9-e25cd11a4a76
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-0adb-1abc50b5c2ef
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-5ae9-1b0af7ec2d48
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-107e-b88b62920845
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-cc90-6b4a077a1fea
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-c7cd-75eac84257ef
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-1e8c-8305b6c61ca2
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-28cd-9596be1b262f
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-4f19-417b54f849f7
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-5fd2-c1899b5ddb26
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-8af4-267b74990479
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-37b9-0dd234fe9521
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-415c-317c49e77610
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-af40-f61f4afe1d91
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2696-a72ad4e54982
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-8a1f-e34ac649b8c5
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-80ee-4a3deadb7317
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-76d4-10bbc34ed3a3
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-429f-f97fefa1a7af
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-6f9f-efaddb828c68
00020000-561e-0392-3198-9ed840036e93	00030000-561e-038d-2e11-c26e17b5db58
\.


--
-- TOC entry 3046 (class 0 OID 21950092)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21950126)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 21950262)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561e-0393-dd7d-850f34b24186	00090000-561e-0393-37da-0f4cb3d9559c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561e-0393-edac-ca8319ab5f21	00090000-561e-0393-4da2-83a8e48369f8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561e-0393-44ac-ecbe9ee44637	00090000-561e-0393-5bd5-fac18300a486	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561e-0393-88eb-aa6d3ed1e0eb	00090000-561e-0393-26b7-a59871562c0e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3022 (class 0 OID 21949826)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561e-0393-baa2-386b453d1e74	\N	00040000-561e-038d-e12b-1fba2d2f9256	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0393-83cb-0741bac0bc58	\N	00040000-561e-038d-e12b-1fba2d2f9256	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561e-0393-7eb1-8e722080b0d0	\N	00040000-561e-038d-e12b-1fba2d2f9256	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0393-331d-02a14732962f	\N	00040000-561e-038d-e12b-1fba2d2f9256	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0393-9d87-70d546d95f22	\N	00040000-561e-038d-e12b-1fba2d2f9256	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0393-60e8-c851c3d4210a	\N	00040000-561e-038c-52f7-e1861b4db94e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0393-f16a-7a272202aaec	\N	00040000-561e-038c-0566-a687109647ef	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0393-b79c-8695a6d08156	\N	00040000-561e-038c-0ffb-21fa15d5b17f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0393-df90-66b6dd21c508	\N	00040000-561e-038d-b01e-51a441020e26	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561e-0398-08a2-98a34d3e963a	\N	00040000-561e-038d-e12b-1fba2d2f9256	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3024 (class 0 OID 21949861)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561e-038b-cf3c-877add6b1b48	8341	Adlešiči
00050000-561e-038b-cb64-a7dfdf19fe5b	5270	Ajdovščina
00050000-561e-038b-e9d5-f72fb6d9e7cf	6280	Ankaran/Ancarano
00050000-561e-038b-7873-c8791562c265	9253	Apače
00050000-561e-038b-488d-3ac9527b9fca	8253	Artiče
00050000-561e-038b-173a-d59ac69d9ce6	4275	Begunje na Gorenjskem
00050000-561e-038b-b814-fb8b0eb0f842	1382	Begunje pri Cerknici
00050000-561e-038b-382d-23e7915221ad	9231	Beltinci
00050000-561e-038b-1d43-0b454f046577	2234	Benedikt
00050000-561e-038b-8999-f380490b24af	2345	Bistrica ob Dravi
00050000-561e-038b-8a87-6e1d0c6c61af	3256	Bistrica ob Sotli
00050000-561e-038b-2e0b-2abcdfed6ce7	8259	Bizeljsko
00050000-561e-038b-3382-caa440c33b0c	1223	Blagovica
00050000-561e-038b-d835-8a789ec54a34	8283	Blanca
00050000-561e-038b-5bb9-6d8503c77938	4260	Bled
00050000-561e-038b-0274-cdd0628ffec9	4273	Blejska Dobrava
00050000-561e-038b-5eb7-b6c8bf7ea5bf	9265	Bodonci
00050000-561e-038b-5656-035d6dbbefd0	9222	Bogojina
00050000-561e-038b-a805-1b0b0e68fe99	4263	Bohinjska Bela
00050000-561e-038b-e879-fb98f1875ade	4264	Bohinjska Bistrica
00050000-561e-038b-35f9-8f66d51cc051	4265	Bohinjsko jezero
00050000-561e-038b-b62d-031e3e77ca94	1353	Borovnica
00050000-561e-038b-47eb-fea5f6b2763b	8294	Boštanj
00050000-561e-038b-f456-3672bbb82be0	5230	Bovec
00050000-561e-038b-0846-433e6f336465	5295	Branik
00050000-561e-038b-a500-2beb3b126b97	3314	Braslovče
00050000-561e-038b-cd49-efee9f76230b	5223	Breginj
00050000-561e-038b-a725-fa2642c08cfd	8280	Brestanica
00050000-561e-038b-a58d-5ab676e4eed3	2354	Bresternica
00050000-561e-038b-b2f6-ba270022fdf9	4243	Brezje
00050000-561e-038b-6c36-9e56cc40bc81	1351	Brezovica pri Ljubljani
00050000-561e-038b-2895-91f75dde39d3	8250	Brežice
00050000-561e-038b-a46f-4aeffe72afca	4210	Brnik - Aerodrom
00050000-561e-038b-4764-1115225e38ce	8321	Brusnice
00050000-561e-038b-3c65-dda0c44ac47d	3255	Buče
00050000-561e-038b-033c-da9527c0d7dd	8276	Bučka 
00050000-561e-038b-bd6f-df317534394d	9261	Cankova
00050000-561e-038b-82af-0bce03331bf8	3000	Celje 
00050000-561e-038b-74d7-4a76aadc2704	3001	Celje - poštni predali
00050000-561e-038b-7d75-a939413c5b4a	4207	Cerklje na Gorenjskem
00050000-561e-038b-1a3b-7a788de5710b	8263	Cerklje ob Krki
00050000-561e-038b-7d96-bd600703b210	1380	Cerknica
00050000-561e-038b-66d8-b2adff182daf	5282	Cerkno
00050000-561e-038b-5111-732d6714c922	2236	Cerkvenjak
00050000-561e-038b-bc4e-01e7214e6624	2215	Ceršak
00050000-561e-038b-61cf-ee2feeee7943	2326	Cirkovce
00050000-561e-038b-4418-da75acc9d785	2282	Cirkulane
00050000-561e-038b-57ed-d44bbffc4a71	5273	Col
00050000-561e-038c-fbef-4912706b5cb7	8251	Čatež ob Savi
00050000-561e-038c-e9b8-f16980bdbe34	1413	Čemšenik
00050000-561e-038c-4e62-0b66a592ad9c	5253	Čepovan
00050000-561e-038c-00da-d694ccbf2af9	9232	Črenšovci
00050000-561e-038c-524b-4212fcd201fb	2393	Črna na Koroškem
00050000-561e-038c-1fe2-761d77a36cf6	6275	Črni Kal
00050000-561e-038c-2444-6e76ace782ea	5274	Črni Vrh nad Idrijo
00050000-561e-038c-a9be-302b3ee123f1	5262	Črniče
00050000-561e-038c-4744-968650ac85c7	8340	Črnomelj
00050000-561e-038c-28c8-1b1b15769bd6	6271	Dekani
00050000-561e-038c-6185-35f0b9231469	5210	Deskle
00050000-561e-038c-1aee-613ae0204867	2253	Destrnik
00050000-561e-038c-29c7-4c035c18b1a3	6215	Divača
00050000-561e-038c-8413-982d979eb3f5	1233	Dob
00050000-561e-038c-201b-1b8ec99a49a7	3224	Dobje pri Planini
00050000-561e-038c-51e2-d26352133169	8257	Dobova
00050000-561e-038c-8c53-80964a016def	1423	Dobovec
00050000-561e-038c-3482-9f61e9ca4fe8	5263	Dobravlje
00050000-561e-038c-ae92-6b302eecee72	3204	Dobrna
00050000-561e-038c-629c-38358753a42f	8211	Dobrnič
00050000-561e-038c-316c-9d8a9e4afade	1356	Dobrova
00050000-561e-038c-32e6-6b6bb5ac75e5	9223	Dobrovnik/Dobronak 
00050000-561e-038c-4676-4c1c22e5c817	5212	Dobrovo v Brdih
00050000-561e-038c-43f1-a7c523764eed	1431	Dol pri Hrastniku
00050000-561e-038c-ecf8-7987509e2b5c	1262	Dol pri Ljubljani
00050000-561e-038c-ab59-6df68fcfb4e2	1273	Dole pri Litiji
00050000-561e-038c-2f5e-0f3f7b43d6b3	1331	Dolenja vas
00050000-561e-038c-a454-1d526c48d165	8350	Dolenjske Toplice
00050000-561e-038c-640c-a67b8e58c902	1230	Domžale
00050000-561e-038c-8507-b8f436c08fc0	2252	Dornava
00050000-561e-038c-aa9e-a803b9276bdf	5294	Dornberk
00050000-561e-038c-d5bd-76d3f227ee50	1319	Draga
00050000-561e-038c-4952-f811d5e9a051	8343	Dragatuš
00050000-561e-038c-8b65-9fca202afde8	3222	Dramlje
00050000-561e-038c-6daf-baa2f26e88c3	2370	Dravograd
00050000-561e-038c-d949-d3b8f94867db	4203	Duplje
00050000-561e-038c-8218-4cfff9d7437c	6221	Dutovlje
00050000-561e-038c-fef5-610c5e4f15ea	8361	Dvor
00050000-561e-038c-554c-92e26c43216a	2343	Fala
00050000-561e-038c-8fdb-33cf95e7b6af	9208	Fokovci
00050000-561e-038c-0663-e24960ba50f8	2313	Fram
00050000-561e-038c-aee3-c7053c3eda80	3213	Frankolovo
00050000-561e-038c-14ab-afbd27930d06	1274	Gabrovka
00050000-561e-038c-4cd2-f9c949bf786f	8254	Globoko
00050000-561e-038c-cb0b-441c8b6de718	5275	Godovič
00050000-561e-038c-1d59-3f8208e3ea9d	4204	Golnik
00050000-561e-038c-d36d-94332aa86fad	3303	Gomilsko
00050000-561e-038c-7c86-3c85177c98e7	4224	Gorenja vas
00050000-561e-038c-caba-cceed0cbfb3e	3263	Gorica pri Slivnici
00050000-561e-038c-0d36-28f59a2c8ad0	2272	Gorišnica
00050000-561e-038c-e1b1-9a3ee1be67b9	9250	Gornja Radgona
00050000-561e-038c-c536-ea80a75d9e45	3342	Gornji Grad
00050000-561e-038c-4489-3fcafcd323af	4282	Gozd Martuljek
00050000-561e-038c-bd0b-b56045516c77	6272	Gračišče
00050000-561e-038c-8591-126287396c01	9264	Grad
00050000-561e-038c-10e1-c21b3e69645d	8332	Gradac
00050000-561e-038c-8dbf-a68f0ae4a93b	1384	Grahovo
00050000-561e-038c-2ced-ae62dcf5c639	5242	Grahovo ob Bači
00050000-561e-038c-6857-fff808b2e5ad	5251	Grgar
00050000-561e-038c-62e0-de0ae36449e0	3302	Griže
00050000-561e-038c-1d32-7663a4b3cca9	3231	Grobelno
00050000-561e-038c-f9f4-d25d3fe017a5	1290	Grosuplje
00050000-561e-038c-95cb-f9bd4a685c2f	2288	Hajdina
00050000-561e-038c-60b7-6bb1c42d9f3d	8362	Hinje
00050000-561e-038c-32bb-ede79f7c9992	2311	Hoče
00050000-561e-038c-c2e9-9ff094c34a08	9205	Hodoš/Hodos
00050000-561e-038c-a774-3021de27bd10	1354	Horjul
00050000-561e-038c-0d8a-2468cc87a8cc	1372	Hotedršica
00050000-561e-038c-2a45-446ae1266d07	1430	Hrastnik
00050000-561e-038c-9844-8a4f497c3453	6225	Hruševje
00050000-561e-038c-04c1-9e40f8b102e1	4276	Hrušica
00050000-561e-038c-7d45-bc19c54b32b0	5280	Idrija
00050000-561e-038c-5db0-337bb7787d24	1292	Ig
00050000-561e-038c-9ff7-ff16642e8bf2	6250	Ilirska Bistrica
00050000-561e-038c-ebe3-8e49e036644c	6251	Ilirska Bistrica-Trnovo
00050000-561e-038c-e99d-140e2cfea3ee	1295	Ivančna Gorica
00050000-561e-038c-2813-81042ea0df4e	2259	Ivanjkovci
00050000-561e-038c-3ba1-c96f4347a124	1411	Izlake
00050000-561e-038c-643d-59235d5c9b49	6310	Izola/Isola
00050000-561e-038c-7787-97769e29d0f8	2222	Jakobski Dol
00050000-561e-038c-1f6f-875c416af629	2221	Jarenina
00050000-561e-038c-9e6b-5b7378c331d0	6254	Jelšane
00050000-561e-038c-43a8-9dedd756110a	4270	Jesenice
00050000-561e-038c-a7ac-b7c2c8f93d05	8261	Jesenice na Dolenjskem
00050000-561e-038c-6156-c43c1533141e	3273	Jurklošter
00050000-561e-038c-fe4b-4adb14c3f3f4	2223	Jurovski Dol
00050000-561e-038c-b0b2-520b5c0ef51c	2256	Juršinci
00050000-561e-038c-427f-77059f2b0a1a	5214	Kal nad Kanalom
00050000-561e-038c-01d4-a3df494e8c4c	3233	Kalobje
00050000-561e-038c-72a3-447ce28f0030	4246	Kamna Gorica
00050000-561e-038c-d031-9b78752315fa	2351	Kamnica
00050000-561e-038c-2bcc-2160d1605932	1241	Kamnik
00050000-561e-038c-088c-b2af33bf2d10	5213	Kanal
00050000-561e-038c-350a-e692ee818f4c	8258	Kapele
00050000-561e-038c-8254-20ee31f9a895	2362	Kapla
00050000-561e-038c-11c6-fdbdde0bf9fa	2325	Kidričevo
00050000-561e-038c-5872-f2d9454ebf52	1412	Kisovec
00050000-561e-038c-0d6c-7b6c0f8ba33b	6253	Knežak
00050000-561e-038c-32e6-9e7b61eec7b1	5222	Kobarid
00050000-561e-038c-4f46-6e8c0c2d5e2b	9227	Kobilje
00050000-561e-038c-5b3b-16c89e37f7aa	1330	Kočevje
00050000-561e-038c-41f2-aa1f10db712f	1338	Kočevska Reka
00050000-561e-038c-769c-6f189f9df462	2276	Kog
00050000-561e-038c-7441-1caa97a58603	5211	Kojsko
00050000-561e-038c-7388-e07c95cf662e	6223	Komen
00050000-561e-038c-5ff0-a18841451f67	1218	Komenda
00050000-561e-038c-4251-c00b9bd2f58d	6000	Koper/Capodistria 
00050000-561e-038c-d6b2-f9ecd697a23c	6001	Koper/Capodistria - poštni predali
00050000-561e-038c-1517-04e648ee47e4	8282	Koprivnica
00050000-561e-038c-a826-83fb114ee1cf	5296	Kostanjevica na Krasu
00050000-561e-038c-2cbd-60ea1a615d34	8311	Kostanjevica na Krki
00050000-561e-038c-78dd-5a5606585e3d	1336	Kostel
00050000-561e-038c-7735-9602793a64e9	6256	Košana
00050000-561e-038c-fcd2-c9453c5e12e6	2394	Kotlje
00050000-561e-038c-877c-8d5182e1a30d	6240	Kozina
00050000-561e-038c-16e8-2a701edddd5b	3260	Kozje
00050000-561e-038c-bafa-5270e4c20013	4000	Kranj 
00050000-561e-038c-9710-12c0e522aa57	4001	Kranj - poštni predali
00050000-561e-038c-b66f-27e1fc043a2a	4280	Kranjska Gora
00050000-561e-038c-4743-e25938598579	1281	Kresnice
00050000-561e-038c-fa20-2fe3183d9f73	4294	Križe
00050000-561e-038c-e715-2d8f5f2155ad	9206	Križevci
00050000-561e-038c-73cd-5e122746ea25	9242	Križevci pri Ljutomeru
00050000-561e-038c-b87f-34778d5055f7	1301	Krka
00050000-561e-038c-b8b4-e9d5b6a0b400	8296	Krmelj
00050000-561e-038c-0c7b-65abd6d3dd21	4245	Kropa
00050000-561e-038c-9a86-0a66c24f6a33	8262	Krška vas
00050000-561e-038c-ea2e-59975d961451	8270	Krško
00050000-561e-038c-5c8c-2141b2bf52e0	9263	Kuzma
00050000-561e-038c-6264-aeaacdbcd033	2318	Laporje
00050000-561e-038c-8dea-dd13062d3470	3270	Laško
00050000-561e-038c-15da-8ccdba1d0ada	1219	Laze v Tuhinju
00050000-561e-038c-3317-379609cfc237	2230	Lenart v Slovenskih goricah
00050000-561e-038c-b0d6-cf5a9981f898	9220	Lendava/Lendva
00050000-561e-038c-9e28-d5e77f89371e	4248	Lesce
00050000-561e-038c-f459-b77b3759f213	3261	Lesično
00050000-561e-038c-a087-93f2ddc37b33	8273	Leskovec pri Krškem
00050000-561e-038c-7176-7d9dd0fc13d5	2372	Libeliče
00050000-561e-038c-dc96-291a4bb0b61f	2341	Limbuš
00050000-561e-038c-6cd3-3947a1c3c5ef	1270	Litija
00050000-561e-038c-8a93-acaeaa0821cd	3202	Ljubečna
00050000-561e-038c-04f2-1e4873d62ac4	1000	Ljubljana 
00050000-561e-038c-7a4a-d993d28d23d4	1001	Ljubljana - poštni predali
00050000-561e-038c-1496-2c393ab89137	1231	Ljubljana - Črnuče
00050000-561e-038c-baad-d848bb291aae	1261	Ljubljana - Dobrunje
00050000-561e-038c-7502-6177c300b56a	1260	Ljubljana - Polje
00050000-561e-038c-8b0a-a81a75c69b0b	1210	Ljubljana - Šentvid
00050000-561e-038c-ee75-b441ac0610eb	1211	Ljubljana - Šmartno
00050000-561e-038c-3b22-8e5969c7f048	3333	Ljubno ob Savinji
00050000-561e-038c-a680-369f0100266f	9240	Ljutomer
00050000-561e-038c-fa0d-7a473dfec031	3215	Loče
00050000-561e-038c-8c73-307c4a2c818d	5231	Log pod Mangartom
00050000-561e-038c-3a7c-fdb6399cba52	1358	Log pri Brezovici
00050000-561e-038c-6a5e-6e6caf38aefc	1370	Logatec
00050000-561e-038c-9ab0-5d3fb38d79d8	1371	Logatec
00050000-561e-038c-f614-c2e83913da25	1434	Loka pri Zidanem Mostu
00050000-561e-038c-d003-2194cd97f6af	3223	Loka pri Žusmu
00050000-561e-038c-6409-60c665aea337	6219	Lokev
00050000-561e-038c-7037-5525e34b2e1b	1318	Loški Potok
00050000-561e-038c-82cf-ee187be1c7d1	2324	Lovrenc na Dravskem polju
00050000-561e-038c-63dd-c21d38806aeb	2344	Lovrenc na Pohorju
00050000-561e-038c-1dd4-81939df9658c	3334	Luče
00050000-561e-038c-f114-c9ea8872ff99	1225	Lukovica
00050000-561e-038c-2e3f-5bb32d57d7db	9202	Mačkovci
00050000-561e-038c-6ddf-ce45bebaa49e	2322	Majšperk
00050000-561e-038c-3f17-c9b7b12adb55	2321	Makole
00050000-561e-038c-2f5e-d0f94f3c7f56	9243	Mala Nedelja
00050000-561e-038c-ac36-178c9d4d247b	2229	Malečnik
00050000-561e-038c-f7b8-bb0418c3a6a7	6273	Marezige
00050000-561e-038c-6805-2a3d30245e56	2000	Maribor 
00050000-561e-038c-7ac6-e00e393f6e9f	2001	Maribor - poštni predali
00050000-561e-038c-b30d-ffc841bebca9	2206	Marjeta na Dravskem polju
00050000-561e-038c-938d-997f6ff3c666	2281	Markovci
00050000-561e-038c-5fc5-4a422d878e03	9221	Martjanci
00050000-561e-038c-5788-8d8448763a37	6242	Materija
00050000-561e-038c-b859-c0778eee5cde	4211	Mavčiče
00050000-561e-038c-b405-3eacaef0fcf9	1215	Medvode
00050000-561e-038c-78a9-7217a9c090f7	1234	Mengeš
00050000-561e-038c-dfae-4618f78dd8b4	8330	Metlika
00050000-561e-038c-8a6b-58762a467a4e	2392	Mežica
00050000-561e-038c-a172-2b0fd6b53795	2204	Miklavž na Dravskem polju
00050000-561e-038c-c3f5-7c36289957ab	2275	Miklavž pri Ormožu
00050000-561e-038c-9573-c9514b86e836	5291	Miren
00050000-561e-038c-7a77-b36736e195c8	8233	Mirna
00050000-561e-038c-d2a4-ccf8cc4d33e7	8216	Mirna Peč
00050000-561e-038c-a4c9-64a0d2c1892c	2382	Mislinja
00050000-561e-038c-0473-c4741f88a7a9	4281	Mojstrana
00050000-561e-038c-b92d-b2e7846275e4	8230	Mokronog
00050000-561e-038c-2843-cb5482257d2c	1251	Moravče
00050000-561e-038c-10a9-a1c777b1616e	9226	Moravske Toplice
00050000-561e-038c-895f-81e861c18c22	5216	Most na Soči
00050000-561e-038c-5bbf-57fe08c282c9	1221	Motnik
00050000-561e-038c-27d2-42c868175f09	3330	Mozirje
00050000-561e-038c-04fd-ded97b557f73	9000	Murska Sobota 
00050000-561e-038c-c7cc-94ecf6b05def	9001	Murska Sobota - poštni predali
00050000-561e-038c-760a-012224916be5	2366	Muta
00050000-561e-038c-9692-00e2984ad415	4202	Naklo
00050000-561e-038c-6069-5dcbdff60ca4	3331	Nazarje
00050000-561e-038c-f616-61191819f190	1357	Notranje Gorice
00050000-561e-038c-3989-0fe471979745	3203	Nova Cerkev
00050000-561e-038c-24c2-b1e161720719	5000	Nova Gorica 
00050000-561e-038c-5d21-0b6a9a799a99	5001	Nova Gorica - poštni predali
00050000-561e-038c-6f87-de7daf0de23b	1385	Nova vas
00050000-561e-038c-13e5-2372229864ad	8000	Novo mesto
00050000-561e-038c-a8ec-c3fc22d2987a	8001	Novo mesto - poštni predali
00050000-561e-038c-f1be-5472d134f3a8	6243	Obrov
00050000-561e-038c-08ff-85eb3f096a7a	9233	Odranci
00050000-561e-038c-9404-9090144b0a1a	2317	Oplotnica
00050000-561e-038c-c5f3-d6cd6a6381ec	2312	Orehova vas
00050000-561e-038c-7b1e-3b1379d0a32f	2270	Ormož
00050000-561e-038c-db73-bcbbec9d5e9a	1316	Ortnek
00050000-561e-038c-b0ad-1a006424ee29	1337	Osilnica
00050000-561e-038c-786e-2a5ba506f8b4	8222	Otočec
00050000-561e-038c-9626-fdb88b04f5c7	2361	Ožbalt
00050000-561e-038c-89c5-a5033f97ae51	2231	Pernica
00050000-561e-038c-af7f-ed7f1489dbcd	2211	Pesnica pri Mariboru
00050000-561e-038c-7c45-fa8a10780a28	9203	Petrovci
00050000-561e-038c-daf5-52a31a657723	3301	Petrovče
00050000-561e-038c-05d6-9770af13e39f	6330	Piran/Pirano
00050000-561e-038c-ec6b-b8b2cd7af47f	8255	Pišece
00050000-561e-038c-744b-817bfea17558	6257	Pivka
00050000-561e-038c-e828-1f6f3ba34bb0	6232	Planina
00050000-561e-038c-c5fd-1f63a1a176cf	3225	Planina pri Sevnici
00050000-561e-038c-5c4c-5774f6a1f1e6	6276	Pobegi
00050000-561e-038c-1903-a36e969503a2	8312	Podbočje
00050000-561e-038c-0267-450501c55efb	5243	Podbrdo
00050000-561e-038c-ba6e-84e716c27ff4	3254	Podčetrtek
00050000-561e-038c-2b0c-c24d53571dfc	2273	Podgorci
00050000-561e-038c-47f1-44aa7618ce63	6216	Podgorje
00050000-561e-038c-5513-540ff4384688	2381	Podgorje pri Slovenj Gradcu
00050000-561e-038c-4c1b-9580f521d2ab	6244	Podgrad
00050000-561e-038c-ac18-dd8f886fdb04	1414	Podkum
00050000-561e-038c-c1c5-34489a57a6d1	2286	Podlehnik
00050000-561e-038c-d57d-c03249445a26	5272	Podnanos
00050000-561e-038c-d2ab-d2c21fd6268f	4244	Podnart
00050000-561e-038c-aaf3-47b41381d7c7	3241	Podplat
00050000-561e-038c-c83c-ca112b519ac6	3257	Podsreda
00050000-561e-038c-f3aa-8d02c5dd0279	2363	Podvelka
00050000-561e-038c-31a1-c351b52126c6	2208	Pohorje
00050000-561e-038c-3c5a-3c4e4257d597	2257	Polenšak
00050000-561e-038c-96f1-a968c7c28274	1355	Polhov Gradec
00050000-561e-038c-ac0b-5a30ff6b9fa2	4223	Poljane nad Škofjo Loko
00050000-561e-038c-5dd8-8120d5616ef2	2319	Poljčane
00050000-561e-038c-c9c3-89a13b170cfc	1272	Polšnik
00050000-561e-038c-97d2-790f04bba1c6	3313	Polzela
00050000-561e-038c-f66c-19412fba9c72	3232	Ponikva
00050000-561e-038c-b3b9-4d0aefbc6b00	6320	Portorož/Portorose
00050000-561e-038c-7b6c-77c62ca90127	6230	Postojna
00050000-561e-038c-0c92-f763bebf198d	2331	Pragersko
00050000-561e-038c-8bc3-1e9308d35d0f	3312	Prebold
00050000-561e-038c-c515-0ef7d24175e7	4205	Preddvor
00050000-561e-038c-5914-65ff87b427ac	6255	Prem
00050000-561e-038c-818c-0b9e03170aaf	1352	Preserje
00050000-561e-038c-aab8-b3572e17ffce	6258	Prestranek
00050000-561e-038c-3e79-f4f892d85141	2391	Prevalje
00050000-561e-038c-93ce-96828912192f	3262	Prevorje
00050000-561e-038c-d6c4-017b7600ae6b	1276	Primskovo 
00050000-561e-038c-1d89-54ef44d36804	3253	Pristava pri Mestinju
00050000-561e-038c-d96e-ef00f0b3a7ee	9207	Prosenjakovci/Partosfalva
00050000-561e-038c-578c-ad6f571ab16b	5297	Prvačina
00050000-561e-038c-0d3f-d921cc471070	2250	Ptuj
00050000-561e-038c-4307-c0bd79b1f407	2323	Ptujska Gora
00050000-561e-038c-a9a7-668e0b2ded8f	9201	Puconci
00050000-561e-038c-dbbd-9422a65c4176	2327	Rače
00050000-561e-038c-37ce-f7be895f6bb5	1433	Radeče
00050000-561e-038c-1ac5-31f4c19be2ba	9252	Radenci
00050000-561e-038c-0be3-d79f51910693	2360	Radlje ob Dravi
00050000-561e-038c-1f3f-98108483bf07	1235	Radomlje
00050000-561e-038c-4465-187183f92dfc	4240	Radovljica
00050000-561e-038c-2971-8a40b27eafd0	8274	Raka
00050000-561e-038c-9bbf-8497f732cc2a	1381	Rakek
00050000-561e-038c-b9de-0c5201b8e9ff	4283	Rateče - Planica
00050000-561e-038c-c188-c17831cc4231	2390	Ravne na Koroškem
00050000-561e-038c-1acc-8fbab98b3029	9246	Razkrižje
00050000-561e-038c-b84d-ddf2cd8bad1d	3332	Rečica ob Savinji
00050000-561e-038c-3bff-519876caada8	5292	Renče
00050000-561e-038c-2bfe-9acd940ce0a2	1310	Ribnica
00050000-561e-038c-16af-d73dad3cfc5e	2364	Ribnica na Pohorju
00050000-561e-038c-06a0-e8daa5c32ff7	3272	Rimske Toplice
00050000-561e-038c-cc24-b15adb3001c3	1314	Rob
00050000-561e-038c-69cd-b299c6466623	5215	Ročinj
00050000-561e-038c-887e-92001449cc24	3250	Rogaška Slatina
00050000-561e-038c-0050-afa6172946d1	9262	Rogašovci
00050000-561e-038c-6d69-6c92a124b8bb	3252	Rogatec
00050000-561e-038c-3973-b7c41fa1435b	1373	Rovte
00050000-561e-038c-9607-949d566c11fc	2342	Ruše
00050000-561e-038c-fd00-6d2430a4fb99	1282	Sava
00050000-561e-038c-cc1e-fc3df0e22612	6333	Sečovlje/Sicciole
00050000-561e-038c-3739-4f4bb82c9f16	4227	Selca
00050000-561e-038c-6a97-c9642e99672b	2352	Selnica ob Dravi
00050000-561e-038c-f12b-f4d7ed9c2c16	8333	Semič
00050000-561e-038c-42bc-b4ddfa7d0ae6	8281	Senovo
00050000-561e-038c-9ac6-bb486d7bdc67	6224	Senožeče
00050000-561e-038c-2ba6-69d5814d1d48	8290	Sevnica
00050000-561e-038c-2153-0e3aaa952b57	6210	Sežana
00050000-561e-038c-ccbd-379aa5a2e684	2214	Sladki Vrh
00050000-561e-038c-39d7-91195d5b2897	5283	Slap ob Idrijci
00050000-561e-038c-5da2-fa47cacccfde	2380	Slovenj Gradec
00050000-561e-038c-1e6c-738702869f59	2310	Slovenska Bistrica
00050000-561e-038c-80d8-3057368a2f2d	3210	Slovenske Konjice
00050000-561e-038c-74a0-9ca10ea90cd9	1216	Smlednik
00050000-561e-038c-c0e4-37886d3df66b	5232	Soča
00050000-561e-038c-165b-91423de5efc4	1317	Sodražica
00050000-561e-038c-28c1-0bb7bd1c16dc	3335	Solčava
00050000-561e-038c-74ca-8c1f3bc0a7ea	5250	Solkan
00050000-561e-038c-7928-c67b16854c83	4229	Sorica
00050000-561e-038c-db6b-71e4c575c6fc	4225	Sovodenj
00050000-561e-038c-f370-53efbf84087e	5281	Spodnja Idrija
00050000-561e-038c-760a-dbdfd35c347a	2241	Spodnji Duplek
00050000-561e-038c-d02f-ad3d08066147	9245	Spodnji Ivanjci
00050000-561e-038c-7f53-72793787c820	2277	Središče ob Dravi
00050000-561e-038c-e430-c412bbb1b88a	4267	Srednja vas v Bohinju
00050000-561e-038c-35f8-f13dad70904d	8256	Sromlje 
00050000-561e-038c-aae8-21d328181bbe	5224	Srpenica
00050000-561e-038c-1997-a0e7cbcd079e	1242	Stahovica
00050000-561e-038c-6529-6bc2c4bef3ad	1332	Stara Cerkev
00050000-561e-038c-a401-2d80acd73dd5	8342	Stari trg ob Kolpi
00050000-561e-038c-806c-b4d418dc9540	1386	Stari trg pri Ložu
00050000-561e-038c-128f-58910c7e8875	2205	Starše
00050000-561e-038c-bcf4-f57113cbea96	2289	Stoperce
00050000-561e-038c-3c0f-aab5b3dc639c	8322	Stopiče
00050000-561e-038c-f14b-9bdccdf94ccf	3206	Stranice
00050000-561e-038c-5fd8-d3ae78781d6a	8351	Straža
00050000-561e-038c-aea3-fffd04be9c17	1313	Struge
00050000-561e-038c-bb99-25d615013659	8293	Studenec
00050000-561e-038c-5587-f3a3c66c83cf	8331	Suhor
00050000-561e-038c-685a-362a8e12e20d	2233	Sv. Ana v Slovenskih goricah
00050000-561e-038c-637a-5c454c8432ce	2235	Sv. Trojica v Slovenskih goricah
00050000-561e-038c-db17-40105b65c542	2353	Sveti Duh na Ostrem Vrhu
00050000-561e-038c-13fa-66bc952278fc	9244	Sveti Jurij ob Ščavnici
00050000-561e-038c-c7ea-edff05fcfa0d	3264	Sveti Štefan
00050000-561e-038c-c77d-34bec95d0010	2258	Sveti Tomaž
00050000-561e-038c-f852-366df28737fc	9204	Šalovci
00050000-561e-038c-0730-ab7ccb57bba8	5261	Šempas
00050000-561e-038c-0e79-796b8c280661	5290	Šempeter pri Gorici
00050000-561e-038c-5541-2d5b57263e55	3311	Šempeter v Savinjski dolini
00050000-561e-038c-4f56-d5174df3cc93	4208	Šenčur
00050000-561e-038c-e975-12134741bdbb	2212	Šentilj v Slovenskih goricah
00050000-561e-038c-0e59-21431946b6ac	8297	Šentjanž
00050000-561e-038c-3352-bcb0a36e0e82	2373	Šentjanž pri Dravogradu
00050000-561e-038c-dfdc-02077219f6f5	8310	Šentjernej
00050000-561e-038c-4fbe-0c5d58fd1c63	3230	Šentjur
00050000-561e-038c-8e77-11cb7f825806	3271	Šentrupert
00050000-561e-038c-148d-b98c974862b2	8232	Šentrupert
00050000-561e-038c-2320-d9468abe3010	1296	Šentvid pri Stični
00050000-561e-038c-1952-4af4633f9b2a	8275	Škocjan
00050000-561e-038c-2b23-3c0dc0310374	6281	Škofije
00050000-561e-038c-095e-85eb0d95eeb0	4220	Škofja Loka
00050000-561e-038c-7f42-d4e92c65a509	3211	Škofja vas
00050000-561e-038c-830b-ccb6438ada57	1291	Škofljica
00050000-561e-038c-aac9-0e73c9bb34c0	6274	Šmarje
00050000-561e-038c-9e87-7bf86f1fad39	1293	Šmarje - Sap
00050000-561e-038c-4456-b0067acba65a	3240	Šmarje pri Jelšah
00050000-561e-038c-a22e-0374f1fdb60d	8220	Šmarješke Toplice
00050000-561e-038c-f55e-245d83917de1	2315	Šmartno na Pohorju
00050000-561e-038c-5eca-c46d3040c548	3341	Šmartno ob Dreti
00050000-561e-038c-b851-d9e8ee8b3c90	3327	Šmartno ob Paki
00050000-561e-038c-c9fe-bc04407330b0	1275	Šmartno pri Litiji
00050000-561e-038c-acd0-c27e3b014dbe	2383	Šmartno pri Slovenj Gradcu
00050000-561e-038c-3e78-808cdc2574d3	3201	Šmartno v Rožni dolini
00050000-561e-038c-1838-1e1b3016baa8	3325	Šoštanj
00050000-561e-038c-a258-c8bb70f944c2	6222	Štanjel
00050000-561e-038c-dba9-fafa0575c864	3220	Štore
00050000-561e-038c-0b84-96b4bd61e9e0	3304	Tabor
00050000-561e-038c-21bc-231fb3dc7a3c	3221	Teharje
00050000-561e-038c-4134-2ea5b08d2efb	9251	Tišina
00050000-561e-038c-bd23-c9fb3220bc63	5220	Tolmin
00050000-561e-038c-7dc8-6ad39b7bd95d	3326	Topolšica
00050000-561e-038c-8472-245ac0350331	2371	Trbonje
00050000-561e-038c-834f-6b40615e9bd3	1420	Trbovlje
00050000-561e-038c-35e7-589230026a7f	8231	Trebelno 
00050000-561e-038c-d322-cc6102b2f1cf	8210	Trebnje
00050000-561e-038c-2d72-0d1e10ba127f	5252	Trnovo pri Gorici
00050000-561e-038c-e48a-170faa199787	2254	Trnovska vas
00050000-561e-038c-9da2-93b4a1f99021	1222	Trojane
00050000-561e-038c-7d9a-68923ebdb15a	1236	Trzin
00050000-561e-038c-80dc-7b419f550c32	4290	Tržič
00050000-561e-038c-7c24-b39487f6a585	8295	Tržišče
00050000-561e-038c-88b4-fd4a82f4e624	1311	Turjak
00050000-561e-038c-26b0-ba55f14a10f8	9224	Turnišče
00050000-561e-038c-b91f-daf54d9789d2	8323	Uršna sela
00050000-561e-038c-40e6-e2809cd8dd39	1252	Vače
00050000-561e-038c-5f30-aa7b3ca8e66d	3320	Velenje 
00050000-561e-038c-ae0b-6bce0a9b350d	3322	Velenje - poštni predali
00050000-561e-038c-0a7e-ef1ef3022eae	8212	Velika Loka
00050000-561e-038c-b425-f4203e20c19a	2274	Velika Nedelja
00050000-561e-038c-0096-54ab47e80482	9225	Velika Polana
00050000-561e-038c-aff3-217293082dbf	1315	Velike Lašče
00050000-561e-038c-e307-a721263fcca5	8213	Veliki Gaber
00050000-561e-038c-1624-2409e017b33f	9241	Veržej
00050000-561e-038c-8ed3-e30d71b2e210	1312	Videm - Dobrepolje
00050000-561e-038c-6df8-9e957bdca600	2284	Videm pri Ptuju
00050000-561e-038c-1547-faadad2fd456	8344	Vinica
00050000-561e-038c-f05f-6513db8a6592	5271	Vipava
00050000-561e-038c-e187-5d5fa9ea6312	4212	Visoko
00050000-561e-038c-99d7-d329c28a68a0	1294	Višnja Gora
00050000-561e-038c-048d-3458276667c0	3205	Vitanje
00050000-561e-038c-0bf2-7bead33d80ee	2255	Vitomarci
00050000-561e-038c-efcf-9c7c9970960c	1217	Vodice
00050000-561e-038c-7ed2-396941169380	3212	Vojnik\t
00050000-561e-038c-6e31-14ea15f27eb6	5293	Volčja Draga
00050000-561e-038c-0ec2-f595b9e8b399	2232	Voličina
00050000-561e-038c-670e-7df38a8aac16	3305	Vransko
00050000-561e-038c-05a5-3d3d0e1056c3	6217	Vremski Britof
00050000-561e-038c-9ca8-68ed4704a50d	1360	Vrhnika
00050000-561e-038c-1c61-92394254a568	2365	Vuhred
00050000-561e-038c-1495-bad505b7fd2a	2367	Vuzenica
00050000-561e-038c-108b-5a5d52fd309a	8292	Zabukovje 
00050000-561e-038c-bb9c-c8268939c04c	1410	Zagorje ob Savi
00050000-561e-038c-1a1e-d94f54b91115	1303	Zagradec
00050000-561e-038c-afa3-bafbad2db9b7	2283	Zavrč
00050000-561e-038c-c03d-3d79cc0769be	8272	Zdole 
00050000-561e-038c-440e-eae38840d14b	4201	Zgornja Besnica
00050000-561e-038c-9463-8a7315d985c5	2242	Zgornja Korena
00050000-561e-038c-3216-b7dfddaab7e0	2201	Zgornja Kungota
00050000-561e-038c-60e1-1d37fab4d71c	2316	Zgornja Ložnica
00050000-561e-038c-9fc6-79d40caa6217	2314	Zgornja Polskava
00050000-561e-038c-2e38-cb489480da71	2213	Zgornja Velka
00050000-561e-038c-2397-2ee07a8314ac	4247	Zgornje Gorje
00050000-561e-038c-a9d8-92028a8fc5e8	4206	Zgornje Jezersko
00050000-561e-038c-9515-c0f67e543cbe	2285	Zgornji Leskovec
00050000-561e-038c-eb82-24d68d071aeb	1432	Zidani Most
00050000-561e-038c-6614-10b28b0840a3	3214	Zreče
00050000-561e-038c-d370-bb9502986caa	4209	Žabnica
00050000-561e-038c-3397-c8ba9d3ffe40	3310	Žalec
00050000-561e-038c-ce8d-16be0e8611bc	4228	Železniki
00050000-561e-038c-b527-d6f5b904fe10	2287	Žetale
00050000-561e-038c-25e1-71853a2395a8	4226	Žiri
00050000-561e-038c-5e12-1f4eab514ccc	4274	Žirovnica
00050000-561e-038c-9b51-47f7251cf7ea	8360	Žužemberk
\.


--
-- TOC entry 3069 (class 0 OID 21950473)
-- Dependencies: 233
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21950066)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21949846)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561e-0393-d57b-204c1b5b9b4a	00080000-561e-0393-baa2-386b453d1e74	\N	00040000-561e-038d-e12b-1fba2d2f9256	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561e-0393-73be-4f6ec4371ea3	00080000-561e-0393-baa2-386b453d1e74	\N	00040000-561e-038d-e12b-1fba2d2f9256	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561e-0393-81f9-9af34d089b8d	00080000-561e-0393-83cb-0741bac0bc58	\N	00040000-561e-038d-e12b-1fba2d2f9256	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3031 (class 0 OID 21949950)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 21950078)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 21950487)
-- Dependencies: 234
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 21950497)
-- Dependencies: 235
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561e-0393-bd91-6f13723ddabb	00080000-561e-0393-7eb1-8e722080b0d0	0987	AK
00190000-561e-0393-01d4-be5020af3bcd	00080000-561e-0393-83cb-0741bac0bc58	0989	AK
00190000-561e-0393-916d-075fb6015468	00080000-561e-0393-331d-02a14732962f	0986	AK
00190000-561e-0393-93b6-accdb2369460	00080000-561e-0393-60e8-c851c3d4210a	0984	AK
00190000-561e-0393-acf2-22be2f9b21b8	00080000-561e-0393-f16a-7a272202aaec	0983	AK
00190000-561e-0393-b23d-d8f8a9239d1b	00080000-561e-0393-b79c-8695a6d08156	0982	AK
00190000-561e-0398-ca11-46afa0e6d372	00080000-561e-0398-08a2-98a34d3e963a	1001	AK
\.


--
-- TOC entry 3068 (class 0 OID 21950412)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561e-0393-734f-9df174ea7516	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3072 (class 0 OID 21950505)
-- Dependencies: 236
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 21950107)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561e-0392-4280-540d6a89a536	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561e-0392-4cdf-5ddca4875c39	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561e-0392-7e1a-90a5738081f9	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561e-0392-2220-4112805665d7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561e-0392-d7ac-e5a00bf42acd	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561e-0392-89bb-861be3a5782e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561e-0392-67b6-543375afce5a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3040 (class 0 OID 21950051)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21950041)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 21950251)
-- Dependencies: 225
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21950181)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21949924)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21949708)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561e-0398-08a2-98a34d3e963a	00010000-561e-038e-23e2-8facfa891ade	2015-10-14 09:26:16	INS	a:0:{}
2	App\\Entity\\Option	00000000-561e-0398-7a6e-77edee5906c2	00010000-561e-038e-23e2-8facfa891ade	2015-10-14 09:26:16	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561e-0398-ca11-46afa0e6d372	00010000-561e-038e-23e2-8facfa891ade	2015-10-14 09:26:16	INS	a:0:{}
\.


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3049 (class 0 OID 21950120)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21949746)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561e-038d-dc36-8301ba8d33dc	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561e-038d-83e7-2cf4e3b21ce2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561e-038d-5f06-eff66cf032c0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561e-038d-0a6f-51961816c3b4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561e-038d-fd27-8505434346c5	planer	Planer dogodkov v koledarju	t
00020000-561e-038e-1be0-f94cbff3d33d	kadrovska	Kadrovska služba	t
00020000-561e-038e-f6bd-bbccd0c70b3d	arhivar	Ažuriranje arhivalij	t
00020000-561e-038e-b68d-a8e9a19a3697	igralec	Igralec	t
00020000-561e-038e-9ee1-c9aac8f213bb	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561e-0392-3198-9ed840036e93	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3013 (class 0 OID 21949730)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561e-038e-eda8-5f2b285de750	00020000-561e-038d-5f06-eff66cf032c0
00010000-561e-038e-23e2-8facfa891ade	00020000-561e-038d-5f06-eff66cf032c0
00010000-561e-0393-9477-01ff5702255f	00020000-561e-0392-3198-9ed840036e93
\.


--
-- TOC entry 3051 (class 0 OID 21950134)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21950072)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21950018)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21949695)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561e-038c-6654-962d590649f4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561e-038c-80be-6b9ba24520f7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561e-038c-a0f9-961b425a2202	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561e-038c-69d8-64ff6737b937	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561e-038c-41c4-b0a221a926c3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3008 (class 0 OID 21949687)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561e-038c-0550-749e99011fa6	00230000-561e-038c-69d8-64ff6737b937	popa
00240000-561e-038c-aa57-5b2955c20336	00230000-561e-038c-69d8-64ff6737b937	oseba
00240000-561e-038c-8973-f93816554f2b	00230000-561e-038c-69d8-64ff6737b937	tippopa
00240000-561e-038c-226e-b49a94c8b4fe	00230000-561e-038c-69d8-64ff6737b937	sezona
00240000-561e-038c-ed7a-e912eef6dc4d	00230000-561e-038c-80be-6b9ba24520f7	prostor
00240000-561e-038c-19bf-d7c86bd9b478	00230000-561e-038c-69d8-64ff6737b937	besedilo
00240000-561e-038c-b291-227aaa979515	00230000-561e-038c-69d8-64ff6737b937	uprizoritev
00240000-561e-038c-d578-4bcef531b7c7	00230000-561e-038c-69d8-64ff6737b937	funkcija
00240000-561e-038c-389c-33430177c0fb	00230000-561e-038c-69d8-64ff6737b937	tipfunkcije
00240000-561e-038c-b106-783b10f48894	00230000-561e-038c-69d8-64ff6737b937	alternacija
00240000-561e-038c-c98c-802b9c141691	00230000-561e-038c-6654-962d590649f4	pogodba
00240000-561e-038c-3acb-dbebef8e66bd	00230000-561e-038c-69d8-64ff6737b937	zaposlitev
00240000-561e-038c-c065-86d3c8f94465	00230000-561e-038c-69d8-64ff6737b937	zvrstuprizoritve
00240000-561e-038c-7c5b-39eedd4b8866	00230000-561e-038c-6654-962d590649f4	programdela
00240000-561e-038c-e305-1b0e0bba158e	00230000-561e-038c-69d8-64ff6737b937	zapis
\.


--
-- TOC entry 3007 (class 0 OID 21949682)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
316e0a71-3948-4821-bf1b-51281343a1ba	00240000-561e-038c-0550-749e99011fa6	0	1001
\.


--
-- TOC entry 3057 (class 0 OID 21950198)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561e-0393-8873-0d45def0b5d6	000e0000-561e-0393-a733-9df6d8d65432	00080000-561e-0393-baa2-386b453d1e74	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561e-038d-49aa-63af394e48a0
00270000-561e-0393-b619-d19d5698e59d	000e0000-561e-0393-a733-9df6d8d65432	00080000-561e-0393-baa2-386b453d1e74	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561e-038d-49aa-63af394e48a0
\.


--
-- TOC entry 3021 (class 0 OID 21949818)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21950028)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561e-0393-47fe-2fafd5c8f8b7	00180000-561e-0393-a8c2-b2aea616ff77	000c0000-561e-0393-6ce0-0aa53335c56d	00090000-561e-0393-dc75-e8e1e474306c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561e-0393-445d-d25f0c93edd5	00180000-561e-0393-a8c2-b2aea616ff77	000c0000-561e-0393-107b-50bb185305b5	00090000-561e-0393-26b7-a59871562c0e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561e-0393-5ce9-acca786d64be	00180000-561e-0393-a8c2-b2aea616ff77	000c0000-561e-0393-5f15-f12a8cb166cf	00090000-561e-0393-418f-31fef3d16722	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561e-0393-829e-d12e272f5939	00180000-561e-0393-a8c2-b2aea616ff77	000c0000-561e-0393-e70c-7882a3743ad2	00090000-561e-0393-7fe2-913f07ea31e0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561e-0393-0867-e618210fa717	00180000-561e-0393-a8c2-b2aea616ff77	000c0000-561e-0393-8a45-f85dec4b8ba3	00090000-561e-0393-9b8f-cc061b2101b4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561e-0393-a9d7-0df413070f4c	00180000-561e-0393-22c9-ea4cd0254235	\N	00090000-561e-0393-9b8f-cc061b2101b4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3060 (class 0 OID 21950239)
-- Dependencies: 224
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561e-038c-4063-12d1ac2b2927	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561e-038c-2fc4-de5da0b0d5bb	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561e-038c-56d9-9589fd7f1213	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561e-038c-80eb-fa59835a0060	04	Režija	Režija	Režija	umetnik	30
000f0000-561e-038c-7d97-f66985856b64	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561e-038c-6770-e9d1efd6b1a3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561e-038c-cb2b-83804cb016bc	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561e-038c-decb-d37a19aa7b25	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561e-038c-7d8a-772d579681bc	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561e-038c-ff23-f0b69b10e11a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561e-038c-81c4-1f9f6bfbb165	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561e-038c-7a02-cf1e5ada1218	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561e-038c-dbc1-03a27318bb0b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561e-038c-19a8-c71747f1cc4c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561e-038c-512d-72cc0465d2a4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561e-038c-a8fd-c39461d5ff76	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561e-038c-bd49-9ad9f95d253f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561e-038c-d1c3-f47fb1dfb899	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3018 (class 0 OID 21949772)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis, sort) FROM stdin;
00400000-561e-0392-d48a-65aa2ab4a387	0001	šola	osnovna ali srednja šola	1
00400000-561e-0392-5b00-3e16ae609378	0002	gledalec	gledalec, ki ima abonma ali podobno	2
00400000-561e-0392-c881-156ec6b3db28	0003	sponzor	sponzor dogodkov	3
\.


--
-- TOC entry 3073 (class 0 OID 21950516)
-- Dependencies: 237
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561e-038c-b434-d2f6c5cea62c	01	Velika predstava	f	1.00	1.00
002b0000-561e-038c-4b84-06e2727d1a41	02	Mala predstava	f	0.50	0.50
002b0000-561e-038c-6814-89f63d64bc36	03	Mala koprodukcija	t	0.40	1.00
002b0000-561e-038c-fd39-63eddcf7504c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561e-038c-d24c-d3e4e4d419ac	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3026 (class 0 OID 21949881)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 21949717)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561e-038e-23e2-8facfa891ade	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROpKy4hf2cDH1co.dJ8e96gv99UfiXpLq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561e-0393-f108-a497fe2d8b73	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561e-0393-37ba-0f786b1305cc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561e-0393-43ac-b20854828c3a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561e-0393-8068-66e721be80d8	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561e-0393-f8ef-d813968a669a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561e-0393-7a13-c38b32d8f6c0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561e-0393-d60f-64c9ea0ef164	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561e-0393-abc5-b0d05c5bec10	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561e-0393-bd7a-61d7486aa69d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561e-0393-9477-01ff5702255f	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561e-038e-eda8-5f2b285de750	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3064 (class 0 OID 21950289)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561e-0393-8e59-64e159d86f78	00160000-561e-0392-7f0d-ca797fe39b6f	\N	00140000-561e-038c-849b-c1858118f9dd	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561e-0392-d7ac-e5a00bf42acd
000e0000-561e-0393-a733-9df6d8d65432	00160000-561e-0392-bb95-d287742d839d	\N	00140000-561e-038c-56f4-03d054609776	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561e-0392-89bb-861be3a5782e
000e0000-561e-0393-dbb5-bf593c797b46	\N	\N	00140000-561e-038c-56f4-03d054609776	00190000-561e-0393-bd91-6f13723ddabb	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561e-0392-d7ac-e5a00bf42acd
000e0000-561e-0393-5a4c-03080c5edca6	\N	\N	00140000-561e-038c-56f4-03d054609776	00190000-561e-0393-bd91-6f13723ddabb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561e-0392-d7ac-e5a00bf42acd
000e0000-561e-0393-3e01-01c6c4cb1b83	\N	\N	00140000-561e-038c-56f4-03d054609776	00190000-561e-0393-bd91-6f13723ddabb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561e-0392-4280-540d6a89a536
000e0000-561e-0393-5c2b-9daf8375bea7	\N	\N	00140000-561e-038c-56f4-03d054609776	00190000-561e-0393-bd91-6f13723ddabb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561e-0392-4280-540d6a89a536
\.


--
-- TOC entry 3033 (class 0 OID 21949972)
-- Dependencies: 197
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561e-0393-3e96-b58ea63cf4cd	000e0000-561e-0393-a733-9df6d8d65432	\N	1	
00200000-561e-0393-5464-5fa2606c3e5e	000e0000-561e-0393-a733-9df6d8d65432	\N	2	
00200000-561e-0393-3862-10631526fd33	000e0000-561e-0393-a733-9df6d8d65432	\N	3	
00200000-561e-0393-1ea7-1c9d2421b0ee	000e0000-561e-0393-a733-9df6d8d65432	\N	4	
00200000-561e-0393-6518-821895a135cb	000e0000-561e-0393-a733-9df6d8d65432	\N	5	
\.


--
-- TOC entry 3047 (class 0 OID 21950099)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 21950212)
-- Dependencies: 222
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561e-038d-280c-29a6a0a8054f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561e-038d-179f-d0f858b6edd6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561e-038d-ba16-b1ec6769daf1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561e-038d-4390-5e9024c9a420	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561e-038d-1841-7a06894e0b97	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561e-038d-43c5-1a01b8163023	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561e-038d-a6a7-7b08eda17601	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561e-038d-9736-6468f245892b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561e-038d-49aa-63af394e48a0	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561e-038d-a226-e87c2ff52c55	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561e-038d-7642-8573d221aa4f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561e-038d-48a6-2399fdcc15b7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561e-038d-8a34-2b8d2a2b12df	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561e-038d-e68d-b2e92b6e0b5f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561e-038d-7412-e723972e5061	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561e-038d-1cb2-461a746867f1	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561e-038d-9ebd-6580b18fa4a9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561e-038d-28c5-f9f4fd2da021	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561e-038d-90f6-d68b365d7e6d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561e-038d-cdb4-dec95c7a4890	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561e-038d-2e2d-ae44aae8ad8e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561e-038d-c24b-29477cce9a5d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561e-038d-bb27-72f3b06b103f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561e-038d-4c85-c6a3cb10909f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561e-038d-1a74-52905f0b6eec	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561e-038d-086a-da10cbeb8d1d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561e-038d-f797-92b41f4fa44a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561e-038d-712e-6d117c2bb99d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3076 (class 0 OID 21950563)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 21950535)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 21950575)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21950171)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561e-0393-d8e4-c3bb6ec27a82	00090000-561e-0393-26b7-a59871562c0e	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561e-0393-2177-5063f735f6a0	00090000-561e-0393-418f-31fef3d16722	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561e-0393-ca2c-12a85deae6d8	00090000-561e-0393-bb70-e6b35672724d	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561e-0393-4650-3f78a08076bb	00090000-561e-0393-ee48-d2c7946c7d58	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561e-0393-a1de-b2fbc747c65b	00090000-561e-0393-dc75-e8e1e474306c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561e-0393-8248-4d3b21ab10a0	00090000-561e-0393-b27e-bc979946209e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3035 (class 0 OID 21950007)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 21950279)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561e-038c-849b-c1858118f9dd	01	Drama	drama (SURS 01)
00140000-561e-038c-a4be-4c31664ab2c7	02	Opera	opera (SURS 02)
00140000-561e-038c-0e3a-bd149bbac60a	03	Balet	balet (SURS 03)
00140000-561e-038c-6d1e-f6e47cf05f8f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561e-038c-20e2-6a092ff2a901	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561e-038c-56f4-03d054609776	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561e-038c-1953-4319256131d6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3053 (class 0 OID 21950161)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2533 (class 2606 OID 21949771)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 21950338)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 21950328)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 21950195)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 21950237)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 21950615)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 21949996)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21950017)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 21950533)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 21949907)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 21950406)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 21950157)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 21949970)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 21949945)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 21949921)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21950064)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 21950592)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 21950599)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2792 (class 2606 OID 21950623)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21932911)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2650 (class 2606 OID 21950091)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 21949879)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21949790)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21949814)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 21949760)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2524 (class 2606 OID 21949745)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 21950097)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21950133)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 21950274)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 21949842)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21949867)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 21950485)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 21950070)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21949857)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 21949958)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 21950082)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 21950494)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 21950502)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 21950472)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 21950514)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 21950115)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 21950055)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 21950046)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 21950261)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21950188)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 21949933)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 21949716)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 21950124)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 21949734)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2526 (class 2606 OID 21949754)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 21950142)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21950077)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 21950026)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 21949704)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 21949692)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 21949686)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 21950208)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21949823)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 21950037)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 21950248)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21949779)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 21950526)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 21949892)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 21949729)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21950307)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21949980)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 21950105)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 21950220)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 21950573)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 21950557)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 21950581)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 21950179)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21950011)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 21950287)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 21950169)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 1259 OID 21950005)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2603 (class 1259 OID 21950006)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2604 (class 1259 OID 21950004)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2605 (class 1259 OID 21950003)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2606 (class 1259 OID 21950002)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2692 (class 1259 OID 21950209)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2693 (class 1259 OID 21950210)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 21950211)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 21950594)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2779 (class 1259 OID 21950593)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 21949844)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2552 (class 1259 OID 21949845)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2651 (class 1259 OID 21950098)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2765 (class 1259 OID 21950561)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2766 (class 1259 OID 21950560)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2767 (class 1259 OID 21950562)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2768 (class 1259 OID 21950559)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2769 (class 1259 OID 21950558)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 21950084)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2646 (class 1259 OID 21950083)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2597 (class 1259 OID 21949981)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 21950158)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 21950160)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2677 (class 1259 OID 21950159)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2577 (class 1259 OID 21949923)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 21949922)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 21950515)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2708 (class 1259 OID 21950276)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 21950277)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2710 (class 1259 OID 21950278)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2775 (class 1259 OID 21950582)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2717 (class 1259 OID 21950312)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2718 (class 1259 OID 21950309)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2719 (class 1259 OID 21950313)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2720 (class 1259 OID 21950311)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2721 (class 1259 OID 21950310)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2567 (class 1259 OID 21949894)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 21949893)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 21949817)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2663 (class 1259 OID 21950125)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2528 (class 1259 OID 21949761)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2529 (class 1259 OID 21949762)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2668 (class 1259 OID 21950145)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2669 (class 1259 OID 21950144)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2670 (class 1259 OID 21950143)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2590 (class 1259 OID 21949959)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 21949960)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2508 (class 1259 OID 21949694)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2625 (class 1259 OID 21950050)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2626 (class 1259 OID 21950048)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2627 (class 1259 OID 21950047)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2628 (class 1259 OID 21950049)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2519 (class 1259 OID 21949735)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2520 (class 1259 OID 21949736)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2654 (class 1259 OID 21950106)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2788 (class 1259 OID 21950616)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2690 (class 1259 OID 21950197)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2691 (class 1259 OID 21950196)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2789 (class 1259 OID 21950624)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2790 (class 1259 OID 21950625)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2640 (class 1259 OID 21950071)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2684 (class 1259 OID 21950189)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2685 (class 1259 OID 21950190)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2738 (class 1259 OID 21950411)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2739 (class 1259 OID 21950410)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2740 (class 1259 OID 21950407)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 21950408)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2742 (class 1259 OID 21950409)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2556 (class 1259 OID 21949859)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 21949858)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2558 (class 1259 OID 21949860)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 21950119)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2658 (class 1259 OID 21950118)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2748 (class 1259 OID 21950495)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2749 (class 1259 OID 21950496)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2731 (class 1259 OID 21950342)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 21950343)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2733 (class 1259 OID 21950340)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2734 (class 1259 OID 21950341)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2681 (class 1259 OID 21950180)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 21950059)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2632 (class 1259 OID 21950058)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2633 (class 1259 OID 21950056)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2634 (class 1259 OID 21950057)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2727 (class 1259 OID 21950330)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 21950329)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2581 (class 1259 OID 21949934)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2584 (class 1259 OID 21949948)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2585 (class 1259 OID 21949947)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2586 (class 1259 OID 21949946)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 21949949)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2596 (class 1259 OID 21949971)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2745 (class 1259 OID 21950486)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2764 (class 1259 OID 21950534)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2782 (class 1259 OID 21950600)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2783 (class 1259 OID 21950601)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 21949792)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 21949791)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 21949824)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 21949825)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 21950012)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 21950040)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 21950039)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2622 (class 1259 OID 21950038)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 21949998)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2608 (class 1259 OID 21949999)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2609 (class 1259 OID 21949997)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2610 (class 1259 OID 21950001)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2611 (class 1259 OID 21950000)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2555 (class 1259 OID 21949843)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 21949780)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21949781)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2573 (class 1259 OID 21949908)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2574 (class 1259 OID 21949910)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2575 (class 1259 OID 21949909)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2576 (class 1259 OID 21949911)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2639 (class 1259 OID 21950065)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2713 (class 1259 OID 21950275)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 21950308)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 21950249)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 21950250)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2545 (class 1259 OID 21949815)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 21949816)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 21950170)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 21949705)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 21949880)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2511 (class 1259 OID 21949693)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2761 (class 1259 OID 21950527)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 21950117)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2662 (class 1259 OID 21950116)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 21950339)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 21949868)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 21950288)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2772 (class 1259 OID 21950574)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2754 (class 1259 OID 21950503)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2755 (class 1259 OID 21950504)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2701 (class 1259 OID 21950238)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2619 (class 1259 OID 21950027)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21949755)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2824 (class 2606 OID 21950761)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2823 (class 2606 OID 21950766)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2819 (class 2606 OID 21950786)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2825 (class 2606 OID 21950756)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2821 (class 2606 OID 21950776)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2820 (class 2606 OID 21950781)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2822 (class 2606 OID 21950771)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2860 (class 2606 OID 21950951)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2859 (class 2606 OID 21950956)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2858 (class 2606 OID 21950961)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2892 (class 2606 OID 21951126)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2893 (class 2606 OID 21951121)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2805 (class 2606 OID 21950681)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2804 (class 2606 OID 21950686)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21950871)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2887 (class 2606 OID 21951106)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 21951101)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2886 (class 2606 OID 21951111)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 21951096)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2890 (class 2606 OID 21951091)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2840 (class 2606 OID 21950866)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2841 (class 2606 OID 21950861)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2818 (class 2606 OID 21950751)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 21950911)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 21950921)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2851 (class 2606 OID 21950916)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2811 (class 2606 OID 21950721)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2812 (class 2606 OID 21950716)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21950851)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 21951081)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2863 (class 2606 OID 21950966)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2862 (class 2606 OID 21950971)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 21950976)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2891 (class 2606 OID 21951116)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2865 (class 2606 OID 21950996)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2868 (class 2606 OID 21950981)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2864 (class 2606 OID 21951001)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2866 (class 2606 OID 21950991)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2867 (class 2606 OID 21950986)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2809 (class 2606 OID 21950711)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2810 (class 2606 OID 21950706)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 21950666)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2801 (class 2606 OID 21950661)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 21950891)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2797 (class 2606 OID 21950641)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2796 (class 2606 OID 21950646)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2847 (class 2606 OID 21950906)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2848 (class 2606 OID 21950901)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2849 (class 2606 OID 21950896)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2816 (class 2606 OID 21950736)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 21950741)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2793 (class 2606 OID 21950626)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2830 (class 2606 OID 21950826)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2832 (class 2606 OID 21950816)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2833 (class 2606 OID 21950811)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2831 (class 2606 OID 21950821)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2795 (class 2606 OID 21950631)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21950636)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2843 (class 2606 OID 21950876)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2896 (class 2606 OID 21951141)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2856 (class 2606 OID 21950946)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2857 (class 2606 OID 21950941)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2898 (class 2606 OID 21951146)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2897 (class 2606 OID 21951151)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2839 (class 2606 OID 21950856)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2855 (class 2606 OID 21950931)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2854 (class 2606 OID 21950936)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2875 (class 2606 OID 21951056)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 21951051)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2879 (class 2606 OID 21951036)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2878 (class 2606 OID 21951041)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2877 (class 2606 OID 21951046)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2807 (class 2606 OID 21950696)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2808 (class 2606 OID 21950691)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2806 (class 2606 OID 21950701)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2844 (class 2606 OID 21950886)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2845 (class 2606 OID 21950881)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 21951066)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2881 (class 2606 OID 21951071)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2872 (class 2606 OID 21951026)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2871 (class 2606 OID 21951031)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2874 (class 2606 OID 21951016)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2873 (class 2606 OID 21951021)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2853 (class 2606 OID 21950926)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21950846)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2835 (class 2606 OID 21950841)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 21950831)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2836 (class 2606 OID 21950836)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2869 (class 2606 OID 21951011)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2870 (class 2606 OID 21951006)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2813 (class 2606 OID 21950726)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2814 (class 2606 OID 21950731)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2817 (class 2606 OID 21950746)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 21951061)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 21951076)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 21951086)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2895 (class 2606 OID 21951131)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 21951136)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2798 (class 2606 OID 21950656)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2799 (class 2606 OID 21950651)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2803 (class 2606 OID 21950671)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2802 (class 2606 OID 21950676)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2826 (class 2606 OID 21950791)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 21950806)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 21950801)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2829 (class 2606 OID 21950796)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-14 09:26:20 CEST

--
-- PostgreSQL database dump complete
--

