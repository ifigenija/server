--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-16 09:01:14 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 248 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 248
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22096826)
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
-- TOC entry 232 (class 1259 OID 22097416)
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
-- TOC entry 231 (class 1259 OID 22097399)
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
-- TOC entry 222 (class 1259 OID 22097276)
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
-- TOC entry 225 (class 1259 OID 22097306)
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
-- TOC entry 246 (class 1259 OID 22097687)
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
-- TOC entry 199 (class 1259 OID 22097056)
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
-- TOC entry 201 (class 1259 OID 22097087)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 22097613)
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
-- TOC entry 192 (class 1259 OID 22096969)
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
-- TOC entry 233 (class 1259 OID 22097429)
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
-- TOC entry 218 (class 1259 OID 22097230)
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
-- TOC entry 197 (class 1259 OID 22097035)
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
-- TOC entry 195 (class 1259 OID 22097009)
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
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22096986)
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
-- TOC entry 207 (class 1259 OID 22097144)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 244 (class 1259 OID 22097668)
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
-- TOC entry 245 (class 1259 OID 22097680)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 22097702)
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
-- TOC entry 211 (class 1259 OID 22097169)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22096943)
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
-- TOC entry 183 (class 1259 OID 22096845)
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
-- TOC entry 187 (class 1259 OID 22096909)
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
-- TOC entry 184 (class 1259 OID 22096856)
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
-- TOC entry 178 (class 1259 OID 22096800)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22096819)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22097176)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 22097210)
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
-- TOC entry 228 (class 1259 OID 22097347)
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
-- TOC entry 186 (class 1259 OID 22096889)
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
-- TOC entry 189 (class 1259 OID 22096935)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22097558)
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
-- TOC entry 208 (class 1259 OID 22097150)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22096920)
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
-- TOC entry 196 (class 1259 OID 22097024)
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
-- TOC entry 210 (class 1259 OID 22097162)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 22097572)
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
-- TOC entry 237 (class 1259 OID 22097582)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 22097497)
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
-- TOC entry 238 (class 1259 OID 22097590)
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
-- TOC entry 214 (class 1259 OID 22097191)
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
-- TOC entry 206 (class 1259 OID 22097135)
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
-- TOC entry 205 (class 1259 OID 22097125)
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
-- TOC entry 227 (class 1259 OID 22097336)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 22097266)
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
-- TOC entry 194 (class 1259 OID 22096998)
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
-- TOC entry 175 (class 1259 OID 22096771)
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
-- TOC entry 174 (class 1259 OID 22096769)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 215 (class 1259 OID 22097204)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22096809)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22096793)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 22097218)
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
-- TOC entry 209 (class 1259 OID 22097156)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 22097102)
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
-- TOC entry 173 (class 1259 OID 22096758)
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
-- TOC entry 172 (class 1259 OID 22096750)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22096745)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 223 (class 1259 OID 22097283)
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
-- TOC entry 185 (class 1259 OID 22096881)
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
-- TOC entry 204 (class 1259 OID 22097112)
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
-- TOC entry 226 (class 1259 OID 22097324)
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
-- TOC entry 182 (class 1259 OID 22096835)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 239 (class 1259 OID 22097601)
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
-- TOC entry 202 (class 1259 OID 22097092)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22096955)
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
-- TOC entry 176 (class 1259 OID 22096780)
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
-- TOC entry 230 (class 1259 OID 22097374)
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
-- TOC entry 198 (class 1259 OID 22097046)
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
-- TOC entry 213 (class 1259 OID 22097183)
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
-- TOC entry 224 (class 1259 OID 22097297)
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
-- TOC entry 242 (class 1259 OID 22097648)
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
-- TOC entry 241 (class 1259 OID 22097620)
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
-- TOC entry 243 (class 1259 OID 22097660)
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
-- TOC entry 220 (class 1259 OID 22097255)
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
-- TOC entry 200 (class 1259 OID 22097081)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 229 (class 1259 OID 22097364)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 219 (class 1259 OID 22097245)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2215 (class 2604 OID 22096774)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3043 (class 0 OID 22096826)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 22097416)
-- Dependencies: 232
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5620-a0b7-614e-6df69000a29c	000d0000-5620-a0b7-da47-3cdff69914ef	\N	00090000-5620-a0b7-342e-93ccf383eef2	000b0000-5620-a0b7-faf2-09b47f53da7d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5620-a0b7-bf8c-0ba365ba001a	000d0000-5620-a0b7-d736-ca1b46c09a3f	00100000-5620-a0b7-5756-3b9582acd89c	00090000-5620-a0b7-cbc5-6eb02c63b594	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5620-a0b7-7d79-71ef7a484fc6	000d0000-5620-a0b7-ca8f-5788fd622341	00100000-5620-a0b7-db42-9d916dff9d08	00090000-5620-a0b7-8506-2cd41e615ae2	\N	0003	t	\N	2015-10-16	\N	2	t	\N	f	f
000c0000-5620-a0b7-7bd3-2c9af435db00	000d0000-5620-a0b7-758d-c9e60fea6021	\N	00090000-5620-a0b7-6d2a-b8b4ac4487d5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5620-a0b7-8f11-562029c3fab2	000d0000-5620-a0b7-a20d-31a644f045fe	\N	00090000-5620-a0b7-83d6-053c9ec199cc	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5620-a0b7-342c-507060a1a462	000d0000-5620-a0b7-d60f-711325ad5088	\N	00090000-5620-a0b7-4eb3-7baa6dd398f0	000b0000-5620-a0b7-7f2d-a5252fa29565	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5620-a0b7-2a19-640c5d3df411	000d0000-5620-a0b7-4367-3d4a44d27efb	00100000-5620-a0b7-bf3a-95492cfa552f	00090000-5620-a0b7-4bde-d0f8e068e2df	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5620-a0b7-b0cb-2483c24ab91a	000d0000-5620-a0b7-d8b6-432e67422742	\N	00090000-5620-a0b7-1ae9-f5f94058fad8	000b0000-5620-a0b7-c47c-4374bda4249c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5620-a0b7-031d-997c3ee21345	000d0000-5620-a0b7-4367-3d4a44d27efb	00100000-5620-a0b7-f7e3-a86a06d75503	00090000-5620-a0b7-3680-e639d2049dee	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5620-a0b7-8a4f-e1b73e926eac	000d0000-5620-a0b7-4367-3d4a44d27efb	00100000-5620-a0b7-35d3-cf45c90fd91e	00090000-5620-a0b7-5c46-d698e9f9ecd0	\N	0010	t	\N	2015-10-16	\N	16	f	\N	f	t
000c0000-5620-a0b7-cc01-c1e68971d190	000d0000-5620-a0b7-4367-3d4a44d27efb	00100000-5620-a0b7-3a0a-4bd4e1628597	00090000-5620-a0b7-e462-f1573253170c	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5620-a0b7-c010-5c0a9144e7a7	000d0000-5620-a0b7-5740-179db7ce09e8	\N	00090000-5620-a0b7-cbc5-6eb02c63b594	000b0000-5620-a0b7-8224-6f0c9e72943c	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3093 (class 0 OID 22097399)
-- Dependencies: 231
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22097276)
-- Dependencies: 222
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5620-a0b7-f8d0-78427b7aea86	00160000-5620-a0b6-ff07-6a0340f9bbf0	00090000-5620-a0b7-99b2-ec2fb567a5d8	aizv	10	t
003d0000-5620-a0b7-126a-72083a045fb4	00160000-5620-a0b6-ff07-6a0340f9bbf0	00090000-5620-a0b7-1c08-14672cd89cf0	apri	14	t
003d0000-5620-a0b7-f5cc-e0ce90925a23	00160000-5620-a0b6-ef8c-7e48cb46e7ef	00090000-5620-a0b7-2c5c-296bd1469a63	aizv	11	t
003d0000-5620-a0b7-f5d1-231e00109b0e	00160000-5620-a0b6-038f-dcc403031a83	00090000-5620-a0b7-b43c-54f1a20c0efb	aizv	12	t
003d0000-5620-a0b7-e8a1-ba24ed015652	00160000-5620-a0b6-ff07-6a0340f9bbf0	00090000-5620-a0b7-db8a-dab495988a14	apri	18	f
\.


--
-- TOC entry 3087 (class 0 OID 22097306)
-- Dependencies: 225
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5620-a0b6-ff07-6a0340f9bbf0	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5620-a0b6-ef8c-7e48cb46e7ef	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5620-a0b6-038f-dcc403031a83	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3108 (class 0 OID 22097687)
-- Dependencies: 246
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 22097056)
-- Dependencies: 199
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5620-a0b7-ad67-eb5c230f9178	\N	\N	00200000-5620-a0b7-a9eb-65afc3318ecb	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5620-a0b7-f7f2-d184ec7fb033	\N	\N	00200000-5620-a0b7-56dd-b51961163fed	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5620-a0b7-8f7c-751dde6147d6	\N	\N	00200000-5620-a0b7-45ff-09b6e893b071	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5620-a0b7-2410-376490818d6b	\N	\N	00200000-5620-a0b7-b5f3-f5333fa0411b	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5620-a0b7-87a8-49a3d3053a6a	\N	\N	00200000-5620-a0b7-4ca7-59f6ab5f67fe	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3063 (class 0 OID 22097087)
-- Dependencies: 201
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 22097613)
-- Dependencies: 240
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 22096969)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5620-a0b5-53f8-c7cce6587b67	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5620-a0b5-03a6-9e298a814e00	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5620-a0b5-deae-3c845e6124b2	AL	ALB	008	Albania 	Albanija	\N
00040000-5620-a0b5-829f-b4d60dcd12e9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5620-a0b5-6533-5fb61f1b89cc	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5620-a0b5-d715-31e14f55b390	AD	AND	020	Andorra 	Andora	\N
00040000-5620-a0b5-8a19-623a41d384f9	AO	AGO	024	Angola 	Angola	\N
00040000-5620-a0b5-0f45-3eee798649df	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5620-a0b5-9241-a5c1d996f558	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5620-a0b5-6649-9456b236d11b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-a0b5-31c7-91bdfe63b305	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5620-a0b5-b1af-3bb70afdff84	AM	ARM	051	Armenia 	Armenija	\N
00040000-5620-a0b5-55da-86fada45201f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5620-a0b5-c0cb-bcba6d5a08b1	AU	AUS	036	Australia 	Avstralija	\N
00040000-5620-a0b5-3e49-d6bf94df4775	AT	AUT	040	Austria 	Avstrija	\N
00040000-5620-a0b5-426e-78106dd3c3c4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5620-a0b5-8a4e-34951d919044	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5620-a0b5-2263-440a2766bc8c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5620-a0b5-ae67-fad6565631b2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5620-a0b5-0225-4d33bf7d7e4f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5620-a0b5-707e-ae223e968b3c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5620-a0b5-a82e-e8f1210585bf	BE	BEL	056	Belgium 	Belgija	\N
00040000-5620-a0b5-5511-984aa25f35f2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5620-a0b5-de81-87b7c16ebfaf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5620-a0b5-e000-afd12fb76530	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5620-a0b5-2691-0421275b5c60	BT	BTN	064	Bhutan 	Butan	\N
00040000-5620-a0b5-f257-fa39cbb7b051	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5620-a0b5-9d34-41f951e9545d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5620-a0b5-2712-34612791090b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5620-a0b5-32d5-979fafb656e9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5620-a0b5-0fae-4b1c762b9a6c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5620-a0b5-ff27-d44d96a167f7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5620-a0b5-72c3-d08be040a05d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5620-a0b5-7f57-683160163cf2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5620-a0b5-0bf4-fc48ad9b53ea	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5620-a0b5-7388-07a2f2531b55	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5620-a0b5-32e5-b77cb7be7d4b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5620-a0b5-fd92-6de769856a34	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5620-a0b5-0e41-3262693b8a43	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5620-a0b5-e56f-5588635d6761	CA	CAN	124	Canada 	Kanada	\N
00040000-5620-a0b5-90ec-de11e5793aea	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5620-a0b5-a0a7-8b74a5e13cc5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5620-a0b5-0946-a67d78ccb225	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5620-a0b5-47c5-2274b78441e2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5620-a0b5-bf34-a655d5ce70fb	CL	CHL	152	Chile 	Čile	\N
00040000-5620-a0b5-b9e2-d02ebe167e10	CN	CHN	156	China 	Kitajska	\N
00040000-5620-a0b5-b58e-6157407b2652	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5620-a0b5-5cc7-1e792d302021	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5620-a0b5-565e-7d45273f42b8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5620-a0b5-ef1b-ee9e33bc60f3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5620-a0b5-24bb-f646882f8576	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5620-a0b5-c205-8cae289e1164	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5620-a0b5-84c7-a8f7336486df	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5620-a0b5-ef80-6967077f7363	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5620-a0b5-8fb5-ae3594c51008	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5620-a0b5-3062-5fdda0e55d2c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5620-a0b5-6db5-1bca6863ab78	CU	CUB	192	Cuba 	Kuba	\N
00040000-5620-a0b5-2c58-69734e9148b5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5620-a0b5-45df-875e17157253	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5620-a0b5-b9da-f6590941dcaf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5620-a0b5-cfe5-c4de42db42bf	DK	DNK	208	Denmark 	Danska	\N
00040000-5620-a0b5-b83e-9615ca42709f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5620-a0b5-56d3-47ac9b72c3e4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-a0b5-9b8e-99852a4313b9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5620-a0b5-c7f8-7523af40e352	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5620-a0b5-14f5-6ec9cb527fd5	EG	EGY	818	Egypt 	Egipt	\N
00040000-5620-a0b5-5aa7-cb506c37f016	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5620-a0b5-2ac5-756ebcce58dc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5620-a0b5-0bc5-eea838b88c8b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5620-a0b5-75a9-d5a7e9156cc3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5620-a0b5-b904-ada04b52171b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5620-a0b5-c22a-de5baf2a891f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5620-a0b5-4eed-371922466c3d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5620-a0b5-8858-c89fe8908ae8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5620-a0b5-d93d-7629dbd80400	FI	FIN	246	Finland 	Finska	\N
00040000-5620-a0b5-1898-33d8589362e4	FR	FRA	250	France 	Francija	\N
00040000-5620-a0b5-43ab-ab87ea67b038	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5620-a0b5-a366-65cc78d508a0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5620-a0b5-7a9c-7b2bedd35dde	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5620-a0b5-3223-77a67f8e7e49	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5620-a0b5-6248-17c59252f92c	GA	GAB	266	Gabon 	Gabon	\N
00040000-5620-a0b5-82c8-292550cef601	GM	GMB	270	Gambia 	Gambija	\N
00040000-5620-a0b5-6857-94fe6ba828f3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5620-a0b5-ba19-29428d2136a3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5620-a0b5-da95-c9fabcc581c4	GH	GHA	288	Ghana 	Gana	\N
00040000-5620-a0b5-69ef-f461a1651d63	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5620-a0b5-1fb6-c741171ad13b	GR	GRC	300	Greece 	Grčija	\N
00040000-5620-a0b5-7992-3b571ae47f70	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5620-a0b5-5abc-5db5d322f0bf	GD	GRD	308	Grenada 	Grenada	\N
00040000-5620-a0b5-5818-241d8a43eafb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5620-a0b5-641a-2b0f31974744	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5620-a0b5-3416-81c34e616b57	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5620-a0b5-ebdd-c9874c25a5c8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5620-a0b5-e7ba-bc33da11cac1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5620-a0b5-38d9-2d11ca56ae5c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5620-a0b5-8568-7bd56e10d1de	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5620-a0b5-6e3a-dcd9a05bd73f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5620-a0b5-9462-feb1600b0e68	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5620-a0b5-0624-26992e8d448a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5620-a0b5-9f92-a4d4b6c379d8	HN	HND	340	Honduras 	Honduras	\N
00040000-5620-a0b5-7a8a-d1c73a321db2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5620-a0b5-8d71-0e9a582ada27	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5620-a0b5-3ac0-5d38d3301e4d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5620-a0b5-0398-ba3a7406b564	IN	IND	356	India 	Indija	\N
00040000-5620-a0b5-6268-c1386defdf97	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5620-a0b5-47c7-5ea36d2093a7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5620-a0b5-0fd2-998e829d0c0b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5620-a0b5-368f-3edbd02c08c0	IE	IRL	372	Ireland 	Irska	\N
00040000-5620-a0b5-4a4c-d256e15753d0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5620-a0b5-168e-76a75fd8de35	IL	ISR	376	Israel 	Izrael	\N
00040000-5620-a0b5-e930-7ccb0b68ae7f	IT	ITA	380	Italy 	Italija	\N
00040000-5620-a0b5-4ba3-fae8e7dfcc47	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5620-a0b5-1a9c-f340b124ea96	JP	JPN	392	Japan 	Japonska	\N
00040000-5620-a0b5-cb94-104a32d83f53	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5620-a0b5-dead-9bb08c1228cc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5620-a0b5-8831-268c1e551c15	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5620-a0b5-8016-203afa0bb84d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5620-a0b5-42b5-8c1aa4f0a499	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5620-a0b5-475a-2b1d34ffdb14	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5620-a0b5-0123-b3160df0bbd8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5620-a0b5-5976-5279ff6dd40b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5620-a0b5-1ac5-cff3ab23db9d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5620-a0b5-1dc8-55133508d59e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5620-a0b5-da2d-78595e137c8c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5620-a0b5-3de1-532654ca4735	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5620-a0b5-3b43-80ec98eba535	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5620-a0b5-dfe3-960e6c330105	LR	LBR	430	Liberia 	Liberija	\N
00040000-5620-a0b5-6363-82470b07c24c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5620-a0b5-2959-ce73e625ada5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5620-a0b5-0e41-6297c490a5c3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5620-a0b5-67c8-3ba2c7506404	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5620-a0b5-7b8b-d7ab672de98b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5620-a0b5-bbeb-fa6adaad798a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5620-a0b5-83c2-dfb2b174968b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5620-a0b5-988a-ef6ec87dce4b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5620-a0b5-e14e-9e02a606b056	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5620-a0b5-e814-b8e52bcd567a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5620-a0b5-46ae-4713de82b07a	ML	MLI	466	Mali 	Mali	\N
00040000-5620-a0b5-f666-d57046726b37	MT	MLT	470	Malta 	Malta	\N
00040000-5620-a0b5-2863-f19c8986dd00	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5620-a0b5-c2df-b1b835eae071	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5620-a0b5-8acd-40f7d8a225b2	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5620-a0b5-7cde-ad6a3d3f951e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5620-a0b5-cd46-2e44c78992ad	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5620-a0b5-ffdd-3b57472ff582	MX	MEX	484	Mexico 	Mehika	\N
00040000-5620-a0b5-7e70-042a091e69aa	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5620-a0b5-bea9-315680710bf3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5620-a0b5-bf11-f212ddd74b5f	MC	MCO	492	Monaco 	Monako	\N
00040000-5620-a0b5-aab9-a4e0027a8df0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5620-a0b5-edcb-3fb9ee153a3c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5620-a0b5-9181-198aebac05c7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5620-a0b5-eea1-216ac8bda6a5	MA	MAR	504	Morocco 	Maroko	\N
00040000-5620-a0b5-71a7-f0e0998a3344	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5620-a0b5-952b-cb3a114e0089	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5620-a0b5-cec1-d9f6df484a34	NA	NAM	516	Namibia 	Namibija	\N
00040000-5620-a0b5-07ab-90027ba2b447	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5620-a0b5-8c12-53b4c5a2eff5	NP	NPL	524	Nepal 	Nepal	\N
00040000-5620-a0b5-7971-69e17cee3078	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5620-a0b5-badf-37620d9c5b9e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5620-a0b5-c36f-8c4d4038dc6f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5620-a0b5-46f9-8043e4942a8b	NE	NER	562	Niger 	Niger 	\N
00040000-5620-a0b5-76a1-89af64264a33	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5620-a0b5-682f-b2277615c9ff	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5620-a0b5-6a36-194a05de5ccd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5620-a0b5-5294-53ab0a285c66	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5620-a0b5-886b-12df24337bee	NO	NOR	578	Norway 	Norveška	\N
00040000-5620-a0b5-85b8-800055dab24b	OM	OMN	512	Oman 	Oman	\N
00040000-5620-a0b5-1612-3db06601efad	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5620-a0b5-c272-efe568ee2432	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5620-a0b5-bc01-ad2b882fe5d5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5620-a0b5-00c8-57d8cd30d00a	PA	PAN	591	Panama 	Panama	\N
00040000-5620-a0b5-bc6c-c5bcfa796f3b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5620-a0b5-63bd-13bf5e03711a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5620-a0b5-2427-584f7d9d7be5	PE	PER	604	Peru 	Peru	\N
00040000-5620-a0b5-efdb-c8c7539c7e23	PH	PHL	608	Philippines 	Filipini	\N
00040000-5620-a0b5-3123-fffb3db26a82	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5620-a0b5-e83c-c70ef29c4df1	PL	POL	616	Poland 	Poljska	\N
00040000-5620-a0b5-652a-1de8a8d004d3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5620-a0b5-c866-d8f776ebeb98	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5620-a0b5-af11-d0541adf9058	QA	QAT	634	Qatar 	Katar	\N
00040000-5620-a0b5-9b79-7a6c7c65eef3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5620-a0b5-349c-da22d1b746e9	RO	ROU	642	Romania 	Romunija	\N
00040000-5620-a0b5-6605-f2e174032421	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5620-a0b5-1145-6f59de72ca5a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5620-a0b5-2a9f-b48a5260ac03	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5620-a0b5-7695-522a8fa7378b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5620-a0b5-06bb-4754aad27975	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5620-a0b5-ee61-3a33d91b9201	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5620-a0b5-ad18-1906e96a72e8	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5620-a0b5-a6ab-142d73488768	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5620-a0b5-43a4-050776385261	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5620-a0b5-6d5d-a5ccd52fec10	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5620-a0b5-2d57-248c149fc5d0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5620-a0b5-3b60-69be82931d02	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5620-a0b5-ad1e-953c9f7a261b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5620-a0b5-539c-532561628226	SN	SEN	686	Senegal 	Senegal	\N
00040000-5620-a0b5-7355-e4bc79b31dc9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5620-a0b5-8709-e0f53a1651ba	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5620-a0b5-cfd5-8c46f5b563c4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5620-a0b5-7e42-834a708c7f61	SG	SGP	702	Singapore 	Singapur	\N
00040000-5620-a0b5-479e-7d021a41cc84	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5620-a0b5-c6ab-a4fc02b55ba9	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5620-a0b5-1ef8-c806582c97f7	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5620-a0b5-ff28-539a9238a31b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5620-a0b5-5e4a-c1c960aeb173	SO	SOM	706	Somalia 	Somalija	\N
00040000-5620-a0b5-cfe0-84057fa98366	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5620-a0b5-08b8-62b7d1baea5d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5620-a0b5-0631-d2b03eea98c9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5620-a0b5-7d12-1d8629e1ada6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5620-a0b5-4799-5a29d5e1b79e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5620-a0b5-841f-c12398217dbf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5620-a0b5-e6e7-c78951c5c05c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5620-a0b5-8ceb-fa5a205afa82	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5620-a0b5-1278-2bcab930c544	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5620-a0b5-304c-9a8c83ee7f58	SE	SWE	752	Sweden 	Švedska	\N
00040000-5620-a0b5-3479-a6fdfb14b546	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5620-a0b5-d372-45e1246cc92c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5620-a0b5-b691-8fa43162bbb5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5620-a0b5-a981-8aaf0ea93c4a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5620-a0b5-6f99-69872a7f059c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5620-a0b5-72e2-82a5bc06f3dd	TH	THA	764	Thailand 	Tajska	\N
00040000-5620-a0b5-8bb4-e00a55a02fd3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5620-a0b5-1ad3-1ba5f728d818	TG	TGO	768	Togo 	Togo	\N
00040000-5620-a0b5-7300-3b33c3d84260	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5620-a0b5-77b6-49e0817bbfe2	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5620-a0b5-ee6b-55ff6a2a381d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5620-a0b5-c88a-aaa8099785f7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5620-a0b5-be34-3bc7bec0c5b9	TR	TUR	792	Turkey 	Turčija	\N
00040000-5620-a0b5-5d6c-9f549b3eb209	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5620-a0b5-6231-d0d97a19f69f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-a0b5-7ea1-910cb1983548	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5620-a0b5-396b-08b6b8f3de5d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5620-a0b5-a5e9-bc81139179ec	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5620-a0b5-c219-58396d45557c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5620-a0b5-3f29-7e150df4253f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5620-a0b5-9ff6-0e46f268a016	US	USA	840	United States 	Združene države Amerike	\N
00040000-5620-a0b5-a188-f199a1d43ab4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5620-a0b5-8ec4-44da4ceae172	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5620-a0b5-8994-1429fd05fe49	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5620-a0b5-bd08-e3a6ab72a98a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5620-a0b5-e5e2-6ed0654034d3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5620-a0b5-7204-e625150ab27e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5620-a0b5-041f-25f40efbfa02	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-a0b5-56ac-453a924ffccf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5620-a0b5-9809-8f53772a5947	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5620-a0b5-c6c2-1cd1acd361ee	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5620-a0b5-c65c-708360d2d5bc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5620-a0b5-ffbf-de82db0f764b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5620-a0b5-05a7-70d4d767a3b6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3095 (class 0 OID 22097429)
-- Dependencies: 233
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5620-a0b7-9b53-be57a0187d44	000e0000-5620-a0b7-41ae-1e53d5f839cd	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-a0b4-7f0a-5e35de3d65ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-a0b7-0fe3-ccb5ec8398a2	000e0000-5620-a0b7-81f0-fa117f080d09	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-a0b4-04d1-8d6da7f4835f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-a0b7-f07f-142d3da9c2b6	000e0000-5620-a0b7-8c96-16255dd79ea2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-a0b4-7f0a-5e35de3d65ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-a0b7-24b5-77c93584db5f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-a0b7-be2b-8f4aa04f173d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3080 (class 0 OID 22097230)
-- Dependencies: 218
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5620-a0b7-da47-3cdff69914ef	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-614e-6df69000a29c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-a0b4-bd3a-2165551a319a
000d0000-5620-a0b7-d736-ca1b46c09a3f	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-bf8c-0ba365ba001a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5620-a0b4-187b-333a58dc11c4
000d0000-5620-a0b7-ca8f-5788fd622341	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-7d79-71ef7a484fc6	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5620-a0b4-ab5c-bb932af7c36c
000d0000-5620-a0b7-758d-c9e60fea6021	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-7bd3-2c9af435db00	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5620-a0b4-d10a-8090bb8defd8
000d0000-5620-a0b7-a20d-31a644f045fe	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-8f11-562029c3fab2	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5620-a0b4-d10a-8090bb8defd8
000d0000-5620-a0b7-d60f-711325ad5088	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-342c-507060a1a462	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-a0b4-bd3a-2165551a319a
000d0000-5620-a0b7-4367-3d4a44d27efb	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-031d-997c3ee21345	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5620-a0b4-bd3a-2165551a319a
000d0000-5620-a0b7-d8b6-432e67422742	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-b0cb-2483c24ab91a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5620-a0b4-291d-280182adc8a1
000d0000-5620-a0b7-5740-179db7ce09e8	000e0000-5620-a0b7-81f0-fa117f080d09	000c0000-5620-a0b7-c010-5c0a9144e7a7	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5620-a0b4-5c54-2ef6b4a65b41
\.


--
-- TOC entry 3059 (class 0 OID 22097035)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22097009)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22096986)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5620-a0b7-9930-62c8e04cffca	00080000-5620-a0b7-3f74-e45107547156	00090000-5620-a0b7-5c46-d698e9f9ecd0	AK		igralka
\.


--
-- TOC entry 3069 (class 0 OID 22097144)
-- Dependencies: 207
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 22097668)
-- Dependencies: 244
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 22097680)
-- Dependencies: 245
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 22097702)
-- Dependencies: 247
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 22028081)
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
-- TOC entry 3073 (class 0 OID 22097169)
-- Dependencies: 211
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 22096943)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5620-a0b5-d776-a9b265ce14f8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5620-a0b5-ffe2-d515cd00abb0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5620-a0b5-0f63-65204b770098	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5620-a0b5-0299-bbb6c61697a8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5620-a0b5-253e-fe0ea01ddafb	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5620-a0b5-8638-72db1d5a8c51	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5620-a0b5-2cdc-34cac35ac038	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5620-a0b5-9cd9-ad73c77f7723	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-a0b5-7248-d7f821ad9a54	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-a0b5-72ef-02a7a23d8cf5	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5620-a0b5-df83-407ecb100b65	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5620-a0b5-ef21-690d4625bb20	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5620-a0b5-271c-6438adddd099	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5620-a0b5-0d37-0aad564537c1	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5620-a0b5-56c3-813448f4f02c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5620-a0b6-2dfb-e8a12310d03c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5620-a0b6-9dd9-c5311a9b5062	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5620-a0b6-95fb-983f197255e7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5620-a0b6-ebe4-6e5b1e67cfcf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5620-a0b6-5c62-1495b9875f93	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5620-a0b8-b334-87170497ac93	application.tenant.maticnopodjetje	string	s:36:"00080000-5620-a0b8-85d5-850df05b94eb";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3045 (class 0 OID 22096845)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5620-a0b6-c0ff-e4504425397c	00000000-5620-a0b6-2dfb-e8a12310d03c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5620-a0b6-d340-46755d2a786b	00000000-5620-a0b6-2dfb-e8a12310d03c	00010000-5620-a0b5-6abd-09884057fa25	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5620-a0b6-41ca-f7994f7da27d	00000000-5620-a0b6-9dd9-c5311a9b5062	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3049 (class 0 OID 22096909)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 22096856)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5620-a0b7-342e-93ccf383eef2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5620-a0b7-6d2a-b8b4ac4487d5	00010000-5620-a0b7-e10e-aa9fba9e3f6c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5620-a0b7-8506-2cd41e615ae2	00010000-5620-a0b7-b3fd-f23be3fdcf2c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5620-a0b7-3680-e639d2049dee	00010000-5620-a0b7-f1d9-28902df22d0c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5620-a0b7-ce53-65e6775dd53a	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5620-a0b7-4eb3-7baa6dd398f0	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5620-a0b7-e462-f1573253170c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5620-a0b7-4bde-d0f8e068e2df	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5620-a0b7-5c46-d698e9f9ecd0	00010000-5620-a0b7-dfd5-216d568bee15	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5620-a0b7-cbc5-6eb02c63b594	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5620-a0b7-e47e-9e12cffaf15c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-a0b7-83d6-053c9ec199cc	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5620-a0b7-1ae9-f5f94058fad8	00010000-5620-a0b7-a6cd-0ec13274d896	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-a0b7-99b2-ec2fb567a5d8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-a0b7-1c08-14672cd89cf0	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-a0b7-2c5c-296bd1469a63	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-a0b7-b43c-54f1a20c0efb	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5620-a0b7-db8a-dab495988a14	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 22096800)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5620-a0b5-9438-60d4d8d258cc	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5620-a0b5-afa0-53818feb5996	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5620-a0b5-47ae-99813bddeba4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5620-a0b5-3710-867c78d43fad	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5620-a0b5-68a4-00ee8a2b7a69	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5620-a0b5-2b95-2f5935e6ebb4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5620-a0b5-ce7d-9190710c833d	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5620-a0b5-8e4d-2943dab5a771	Abonma-read	Abonma - branje	f
00030000-5620-a0b5-d804-17d8e4b4e311	Abonma-write	Abonma - spreminjanje	f
00030000-5620-a0b5-234e-86d7155220f5	Alternacija-read	Alternacija - branje	f
00030000-5620-a0b5-c783-f77997b0b64a	Alternacija-write	Alternacija - spreminjanje	f
00030000-5620-a0b5-5fa0-9579233208e1	Arhivalija-read	Arhivalija - branje	f
00030000-5620-a0b5-42c0-39d0e7fa6497	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5620-a0b5-04e7-97ff615e15cd	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5620-a0b5-0c03-dad144928798	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5620-a0b5-6fcc-ee63eaf3db31	Besedilo-read	Besedilo - branje	f
00030000-5620-a0b5-11c1-fecba37a3458	Besedilo-write	Besedilo - spreminjanje	f
00030000-5620-a0b5-6fb6-95de98a3153a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5620-a0b5-24f2-50ad3d653e4e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5620-a0b5-5dfb-20bb6b112b5c	Dogodek-read	Dogodek - branje	f
00030000-5620-a0b5-b235-a857e11ed2df	Dogodek-write	Dogodek - spreminjanje	f
00030000-5620-a0b5-a72a-c385e66c899a	DrugiVir-read	DrugiVir - branje	f
00030000-5620-a0b5-149c-a35f2f95d087	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5620-a0b5-102b-7f60971accce	Drzava-read	Drzava - branje	f
00030000-5620-a0b5-b4d5-376b08b16755	Drzava-write	Drzava - spreminjanje	f
00030000-5620-a0b5-f59c-dcd5108d0634	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5620-a0b5-10c2-84ab1221e019	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5620-a0b5-6099-bc8734265797	Funkcija-read	Funkcija - branje	f
00030000-5620-a0b5-5cbb-9c86b3eed233	Funkcija-write	Funkcija - spreminjanje	f
00030000-5620-a0b5-5edb-5cbd89a7a9ea	Gostovanje-read	Gostovanje - branje	f
00030000-5620-a0b5-e6c0-36063de70fd2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5620-a0b5-2153-6d25531c150d	Gostujoca-read	Gostujoca - branje	f
00030000-5620-a0b5-f593-be1c98f60dd7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5620-a0b5-5f1c-4336861a82fe	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5620-a0b5-b507-176239d842fc	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5620-a0b5-de90-3277a6fbf788	Kupec-read	Kupec - branje	f
00030000-5620-a0b5-e6e5-403dff084dd1	Kupec-write	Kupec - spreminjanje	f
00030000-5620-a0b5-b775-8f7982acf8b1	NacinPlacina-read	NacinPlacina - branje	f
00030000-5620-a0b5-8c0e-c59a26d3771c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5620-a0b5-09e7-fe6a81d34df8	Option-read	Option - branje	f
00030000-5620-a0b5-6414-718da3bfb09a	Option-write	Option - spreminjanje	f
00030000-5620-a0b5-fa7f-f2d3e435b372	OptionValue-read	OptionValue - branje	f
00030000-5620-a0b5-966b-d18040ce41ea	OptionValue-write	OptionValue - spreminjanje	f
00030000-5620-a0b5-74dd-56356cb6249c	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5620-a0b5-0324-08a450d5d821	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5620-a0b5-e664-002810e6b6cd	Oseba-read	Oseba - branje	f
00030000-5620-a0b5-f526-d7e992b021ab	Oseba-write	Oseba - spreminjanje	f
00030000-5620-a0b5-167b-6c030efc8352	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5620-a0b5-a77e-0debba7f74e3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5620-a0b5-f257-3eefad031976	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5620-a0b5-661f-842af834ce53	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5620-a0b5-3582-a87dd937113d	Pogodba-read	Pogodba - branje	f
00030000-5620-a0b5-c7b6-286e85ad9ee3	Pogodba-write	Pogodba - spreminjanje	f
00030000-5620-a0b5-c9f9-41cede03c3b8	Popa-read	Popa - branje	f
00030000-5620-a0b5-d9ea-b3ba7b16a640	Popa-write	Popa - spreminjanje	f
00030000-5620-a0b5-61e0-ca6e0390e9d4	Posta-read	Posta - branje	f
00030000-5620-a0b5-b6f1-18a6c763246d	Posta-write	Posta - spreminjanje	f
00030000-5620-a0b5-aa5e-cfd38bf08fda	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5620-a0b5-4b99-e57ee617b32f	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5620-a0b5-e55f-b3dcd61c80a2	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5620-a0b5-c36b-7f70d3281686	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5620-a0b5-a595-a668e737ec0a	PostniNaslov-read	PostniNaslov - branje	f
00030000-5620-a0b5-86ff-7387712de834	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5620-a0b5-031e-39e6f09ff797	Predstava-read	Predstava - branje	f
00030000-5620-a0b5-61af-94b817d3c2c1	Predstava-write	Predstava - spreminjanje	f
00030000-5620-a0b5-6238-26086a725274	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5620-a0b5-160b-d5c57c3a46ad	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5620-a0b5-ff75-4675968612dc	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5620-a0b5-d237-298ddb10b206	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5620-a0b5-e7ce-884154add83d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5620-a0b5-9dd4-5f6ac22802dc	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5620-a0b5-2dcb-28bd1138ab5b	ProgramDela-read	ProgramDela - branje	f
00030000-5620-a0b5-f9ae-0044e704b6a6	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5620-a0b5-af14-65e488134cab	ProgramFestival-read	ProgramFestival - branje	f
00030000-5620-a0b5-f761-c08898f14af2	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5620-a0b5-64c0-856d760192e4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5620-a0b5-0d4a-eb16e088d79b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5620-a0b5-dead-2a9cf14ee9ac	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5620-a0b5-2e2a-46505ad772a6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5620-a0b5-dd50-53ce79e7e05c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5620-a0b5-a779-c608f64d3031	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5620-a0b5-cdff-118c6854ee78	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5620-a0b5-1659-fc8f6c6eff67	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5620-a0b5-2eff-139cebe942ec	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5620-a0b5-bc59-69aa727f59f7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5620-a0b5-f817-b1b024d5a9bf	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5620-a0b5-626c-dacdf6ea67b0	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5620-a0b5-3760-376689a2e8e3	ProgramRazno-read	ProgramRazno - branje	f
00030000-5620-a0b5-4626-f880369af9a9	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5620-a0b5-82a3-24cc2355f1c0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5620-a0b5-64a3-add9b3bee2a4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5620-a0b5-6d13-9af9d4c417d9	Prostor-read	Prostor - branje	f
00030000-5620-a0b5-c35c-4b8c9f16cf35	Prostor-write	Prostor - spreminjanje	f
00030000-5620-a0b5-5246-cf18461c5d66	Racun-read	Racun - branje	f
00030000-5620-a0b5-c2f4-7f4c6b1c95d8	Racun-write	Racun - spreminjanje	f
00030000-5620-a0b5-3e09-86077625c130	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5620-a0b5-7687-1dd6a8417374	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5620-a0b5-53c3-507b5212912e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5620-a0b5-f190-995ea6dda13b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5620-a0b5-dece-ae9b1ddff995	Rekvizit-read	Rekvizit - branje	f
00030000-5620-a0b5-51cd-8e8a68f98e88	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5620-a0b5-c21b-fc637533eb23	Revizija-read	Revizija - branje	f
00030000-5620-a0b5-8d82-ea4f555acc49	Revizija-write	Revizija - spreminjanje	f
00030000-5620-a0b5-0d58-ffcf7f4b205f	Rezervacija-read	Rezervacija - branje	f
00030000-5620-a0b5-42e0-01e21b42341a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5620-a0b5-a526-a1e0362aee15	SedezniRed-read	SedezniRed - branje	f
00030000-5620-a0b5-00c8-03011add103a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5620-a0b5-18b4-95deb7f10cb4	Sedez-read	Sedez - branje	f
00030000-5620-a0b5-67dc-aedc24f8c674	Sedez-write	Sedez - spreminjanje	f
00030000-5620-a0b5-a1ad-3988baa5ecd9	Sezona-read	Sezona - branje	f
00030000-5620-a0b5-0ee2-e33325685d13	Sezona-write	Sezona - spreminjanje	f
00030000-5620-a0b5-df3d-7a7d0e5d9af6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5620-a0b5-161a-bf68be389e4a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5620-a0b5-9d93-677fb76fe3d2	Stevilcenje-read	Stevilcenje - branje	f
00030000-5620-a0b5-ffbb-df31dfc6ec48	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5620-a0b5-5d4a-77bee257ab8f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5620-a0b5-4574-c958e32dc936	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5620-a0b5-86a7-1f111f060ff3	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5620-a0b5-6a74-a4d03110269c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5620-a0b5-87b1-a26a3c979551	Telefonska-read	Telefonska - branje	f
00030000-5620-a0b5-9e3f-c8844adc2c78	Telefonska-write	Telefonska - spreminjanje	f
00030000-5620-a0b5-b87e-5c3965704a2f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5620-a0b5-96f8-300385662edc	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5620-a0b5-fde7-09b04c484f11	TipFunkcije-read	TipFunkcije - branje	f
00030000-5620-a0b5-df1f-716187ef3173	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5620-a0b5-486b-e89ecd29678b	TipPopa-read	TipPopa - branje	f
00030000-5620-a0b5-6ece-e76e81305220	TipPopa-write	TipPopa - spreminjanje	f
00030000-5620-a0b5-13b4-6000b3c39a88	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5620-a0b5-6f61-395aec08ab1c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5620-a0b5-3be9-e606f1f508ce	Trr-read	Trr - branje	f
00030000-5620-a0b5-d36d-c61f362352c6	Trr-write	Trr - spreminjanje	f
00030000-5620-a0b5-0788-22d8b96ccf09	Uprizoritev-read	Uprizoritev - branje	f
00030000-5620-a0b5-750f-f655ddbe56cc	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5620-a0b5-cf04-3ceb2000b709	Vaja-read	Vaja - branje	f
00030000-5620-a0b5-4f70-551b34cf9688	Vaja-write	Vaja - spreminjanje	f
00030000-5620-a0b5-f66e-f8de962bb498	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5620-a0b5-2fd4-b2c22f5bf02d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5620-a0b5-8b55-b58b6a34ceb6	VrstaStroska-read	VrstaStroska - branje	f
00030000-5620-a0b5-d61f-13706356a812	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5620-a0b5-5aa4-5fc4bf3969b7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5620-a0b5-aff0-a2962f727a37	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5620-a0b5-b919-d657e9179b80	Zasedenost-read	Zasedenost - branje	f
00030000-5620-a0b5-94d7-d4d73cfc9ac9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5620-a0b5-dd23-b7b17da2637b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5620-a0b5-b0fa-207153b73dd7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5620-a0b5-f765-7b91e57dbcc7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5620-a0b5-3c44-a57648d7dfca	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5620-a0b5-31e2-0817a9357a95	Job-read	Branje opravil - samo zase - branje	f
00030000-5620-a0b5-c91d-900b4d795680	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5620-a0b5-83d8-c7c2864686e4	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5620-a0b5-689c-5fc6be449fda	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5620-a0b5-6b04-2eabd2f6a6a6	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5620-a0b5-cbda-2079911bf067	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5620-a0b5-c0dc-903480f2df36	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5620-a0b5-ef98-eb64c8b56ced	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-a0b5-f26e-fe8e5fbfff99	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-a0b5-0c04-26cf05d499b4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-a0b5-51ea-a025133b8c05	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-a0b5-e236-3699e9045b5b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5620-a0b5-b26b-fa06ba99524e	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5620-a0b5-a267-abbd1eb6ba06	Datoteka-write	Datoteka - spreminjanje	f
00030000-5620-a0b5-c247-bca44320df0b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3042 (class 0 OID 22096819)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5620-a0b5-1037-f1de5b060cff	00030000-5620-a0b5-afa0-53818feb5996
00020000-5620-a0b5-5253-3b2cd9bc9c4b	00030000-5620-a0b5-102b-7f60971accce
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-8e4d-2943dab5a771
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-d804-17d8e4b4e311
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-234e-86d7155220f5
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-c783-f77997b0b64a
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-5fa0-9579233208e1
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-5dfb-20bb6b112b5c
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-3710-867c78d43fad
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-b235-a857e11ed2df
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-102b-7f60971accce
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-b4d5-376b08b16755
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-6099-bc8734265797
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-5cbb-9c86b3eed233
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-5edb-5cbd89a7a9ea
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-e6c0-36063de70fd2
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-2153-6d25531c150d
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-f593-be1c98f60dd7
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-5f1c-4336861a82fe
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-b507-176239d842fc
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-09e7-fe6a81d34df8
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-fa7f-f2d3e435b372
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-e664-002810e6b6cd
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-f526-d7e992b021ab
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-c9f9-41cede03c3b8
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-d9ea-b3ba7b16a640
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-61e0-ca6e0390e9d4
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-b6f1-18a6c763246d
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-a595-a668e737ec0a
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-86ff-7387712de834
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-031e-39e6f09ff797
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-61af-94b817d3c2c1
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-e7ce-884154add83d
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-9dd4-5f6ac22802dc
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-6d13-9af9d4c417d9
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-c35c-4b8c9f16cf35
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-53c3-507b5212912e
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-f190-995ea6dda13b
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-dece-ae9b1ddff995
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-51cd-8e8a68f98e88
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-a1ad-3988baa5ecd9
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-0ee2-e33325685d13
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-fde7-09b04c484f11
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-0788-22d8b96ccf09
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-750f-f655ddbe56cc
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-cf04-3ceb2000b709
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-4f70-551b34cf9688
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-b919-d657e9179b80
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-94d7-d4d73cfc9ac9
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-dd23-b7b17da2637b
00020000-5620-a0b5-0c54-130f51432b15	00030000-5620-a0b5-f765-7b91e57dbcc7
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-8e4d-2943dab5a771
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-5fa0-9579233208e1
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-5dfb-20bb6b112b5c
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-102b-7f60971accce
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-5edb-5cbd89a7a9ea
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-2153-6d25531c150d
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-5f1c-4336861a82fe
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-b507-176239d842fc
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-09e7-fe6a81d34df8
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-fa7f-f2d3e435b372
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-e664-002810e6b6cd
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-f526-d7e992b021ab
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-c9f9-41cede03c3b8
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-61e0-ca6e0390e9d4
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-a595-a668e737ec0a
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-86ff-7387712de834
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-031e-39e6f09ff797
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-6d13-9af9d4c417d9
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-53c3-507b5212912e
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-dece-ae9b1ddff995
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-a1ad-3988baa5ecd9
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-87b1-a26a3c979551
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-9e3f-c8844adc2c78
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-3be9-e606f1f508ce
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-d36d-c61f362352c6
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-5aa4-5fc4bf3969b7
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-aff0-a2962f727a37
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-dd23-b7b17da2637b
00020000-5620-a0b5-646e-fc4896726b3c	00030000-5620-a0b5-f765-7b91e57dbcc7
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-8e4d-2943dab5a771
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-234e-86d7155220f5
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-5fa0-9579233208e1
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-42c0-39d0e7fa6497
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-6fcc-ee63eaf3db31
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-6fb6-95de98a3153a
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-5dfb-20bb6b112b5c
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-102b-7f60971accce
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-6099-bc8734265797
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-5edb-5cbd89a7a9ea
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-2153-6d25531c150d
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-5f1c-4336861a82fe
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-09e7-fe6a81d34df8
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-fa7f-f2d3e435b372
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-e664-002810e6b6cd
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-c9f9-41cede03c3b8
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-61e0-ca6e0390e9d4
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-031e-39e6f09ff797
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-e7ce-884154add83d
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-6d13-9af9d4c417d9
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-53c3-507b5212912e
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-dece-ae9b1ddff995
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-a1ad-3988baa5ecd9
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-fde7-09b04c484f11
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-cf04-3ceb2000b709
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-b919-d657e9179b80
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-dd23-b7b17da2637b
00020000-5620-a0b5-54eb-11c0913f14f1	00030000-5620-a0b5-f765-7b91e57dbcc7
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-8e4d-2943dab5a771
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-d804-17d8e4b4e311
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-c783-f77997b0b64a
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-5fa0-9579233208e1
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-5dfb-20bb6b112b5c
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-102b-7f60971accce
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-5edb-5cbd89a7a9ea
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-2153-6d25531c150d
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-09e7-fe6a81d34df8
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-fa7f-f2d3e435b372
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-c9f9-41cede03c3b8
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-61e0-ca6e0390e9d4
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-031e-39e6f09ff797
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-6d13-9af9d4c417d9
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-53c3-507b5212912e
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-dece-ae9b1ddff995
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-a1ad-3988baa5ecd9
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-fde7-09b04c484f11
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-dd23-b7b17da2637b
00020000-5620-a0b5-f0a2-15f28d79a993	00030000-5620-a0b5-f765-7b91e57dbcc7
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-8e4d-2943dab5a771
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-5fa0-9579233208e1
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-5dfb-20bb6b112b5c
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-102b-7f60971accce
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-5edb-5cbd89a7a9ea
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-2153-6d25531c150d
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-09e7-fe6a81d34df8
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-fa7f-f2d3e435b372
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-c9f9-41cede03c3b8
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-61e0-ca6e0390e9d4
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-031e-39e6f09ff797
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-6d13-9af9d4c417d9
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-53c3-507b5212912e
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-dece-ae9b1ddff995
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-a1ad-3988baa5ecd9
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-b87e-5c3965704a2f
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-47ae-99813bddeba4
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-fde7-09b04c484f11
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-dd23-b7b17da2637b
00020000-5620-a0b5-5b63-1fbb1fd410a8	00030000-5620-a0b5-f765-7b91e57dbcc7
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-9438-60d4d8d258cc
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-afa0-53818feb5996
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-47ae-99813bddeba4
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-3710-867c78d43fad
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-68a4-00ee8a2b7a69
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-2b95-2f5935e6ebb4
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-ce7d-9190710c833d
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-8e4d-2943dab5a771
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-d804-17d8e4b4e311
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-234e-86d7155220f5
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-c783-f77997b0b64a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5fa0-9579233208e1
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-42c0-39d0e7fa6497
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6fcc-ee63eaf3db31
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-11c1-fecba37a3458
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6fb6-95de98a3153a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-24f2-50ad3d653e4e
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5dfb-20bb6b112b5c
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b235-a857e11ed2df
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-102b-7f60971accce
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b4d5-376b08b16755
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-a72a-c385e66c899a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-149c-a35f2f95d087
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f59c-dcd5108d0634
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-10c2-84ab1221e019
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6099-bc8734265797
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5cbb-9c86b3eed233
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5edb-5cbd89a7a9ea
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-e6c0-36063de70fd2
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-2153-6d25531c150d
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f593-be1c98f60dd7
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5f1c-4336861a82fe
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b507-176239d842fc
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-de90-3277a6fbf788
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-e6e5-403dff084dd1
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b775-8f7982acf8b1
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-8c0e-c59a26d3771c
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-09e7-fe6a81d34df8
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6414-718da3bfb09a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-fa7f-f2d3e435b372
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-966b-d18040ce41ea
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-e664-002810e6b6cd
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f526-d7e992b021ab
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-167b-6c030efc8352
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-a77e-0debba7f74e3
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f257-3eefad031976
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-661f-842af834ce53
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-3582-a87dd937113d
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-c7b6-286e85ad9ee3
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-c9f9-41cede03c3b8
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-d9ea-b3ba7b16a640
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-61e0-ca6e0390e9d4
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b6f1-18a6c763246d
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-aa5e-cfd38bf08fda
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-4b99-e57ee617b32f
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-e55f-b3dcd61c80a2
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-c36b-7f70d3281686
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-a595-a668e737ec0a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-86ff-7387712de834
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-031e-39e6f09ff797
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-61af-94b817d3c2c1
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6238-26086a725274
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-160b-d5c57c3a46ad
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-ff75-4675968612dc
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-d237-298ddb10b206
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-e7ce-884154add83d
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-9dd4-5f6ac22802dc
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-2dcb-28bd1138ab5b
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f9ae-0044e704b6a6
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-af14-65e488134cab
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f761-c08898f14af2
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-64c0-856d760192e4
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-0d4a-eb16e088d79b
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-dead-2a9cf14ee9ac
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-2e2a-46505ad772a6
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-dd50-53ce79e7e05c
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-a779-c608f64d3031
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-cdff-118c6854ee78
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-1659-fc8f6c6eff67
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-2eff-139cebe942ec
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-bc59-69aa727f59f7
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f817-b1b024d5a9bf
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-626c-dacdf6ea67b0
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-3760-376689a2e8e3
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-4626-f880369af9a9
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-82a3-24cc2355f1c0
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-64a3-add9b3bee2a4
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6d13-9af9d4c417d9
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-c35c-4b8c9f16cf35
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5246-cf18461c5d66
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-c2f4-7f4c6b1c95d8
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-3e09-86077625c130
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-7687-1dd6a8417374
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-53c3-507b5212912e
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f190-995ea6dda13b
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-dece-ae9b1ddff995
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-51cd-8e8a68f98e88
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-c21b-fc637533eb23
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-8d82-ea4f555acc49
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-0d58-ffcf7f4b205f
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-42e0-01e21b42341a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-a526-a1e0362aee15
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-00c8-03011add103a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-18b4-95deb7f10cb4
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-67dc-aedc24f8c674
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-a1ad-3988baa5ecd9
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-0ee2-e33325685d13
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-df3d-7a7d0e5d9af6
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-161a-bf68be389e4a
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-9d93-677fb76fe3d2
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-ffbb-df31dfc6ec48
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5d4a-77bee257ab8f
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-4574-c958e32dc936
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-86a7-1f111f060ff3
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6a74-a4d03110269c
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-87b1-a26a3c979551
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-9e3f-c8844adc2c78
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b87e-5c3965704a2f
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-96f8-300385662edc
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-fde7-09b04c484f11
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-df1f-716187ef3173
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-13b4-6000b3c39a88
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-6f61-395aec08ab1c
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-3be9-e606f1f508ce
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-d36d-c61f362352c6
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-0788-22d8b96ccf09
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-750f-f655ddbe56cc
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-cf04-3ceb2000b709
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-4f70-551b34cf9688
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f66e-f8de962bb498
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-2fd4-b2c22f5bf02d
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-8b55-b58b6a34ceb6
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-d61f-13706356a812
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-5aa4-5fc4bf3969b7
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-aff0-a2962f727a37
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b919-d657e9179b80
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-94d7-d4d73cfc9ac9
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-dd23-b7b17da2637b
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-b0fa-207153b73dd7
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-f765-7b91e57dbcc7
00020000-5620-a0b6-2b10-9ddf9979a560	00030000-5620-a0b5-3c44-a57648d7dfca
\.


--
-- TOC entry 3074 (class 0 OID 22097176)
-- Dependencies: 212
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 22097210)
-- Dependencies: 216
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22097347)
-- Dependencies: 228
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5620-a0b7-faf2-09b47f53da7d	00090000-5620-a0b7-342e-93ccf383eef2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5620-a0b7-7f2d-a5252fa29565	00090000-5620-a0b7-4eb3-7baa6dd398f0	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5620-a0b7-c47c-4374bda4249c	00090000-5620-a0b7-1ae9-f5f94058fad8	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5620-a0b7-8224-6f0c9e72943c	00090000-5620-a0b7-cbc5-6eb02c63b594	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3048 (class 0 OID 22096889)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5620-a0b7-3f74-e45107547156	\N	00040000-5620-a0b5-1ef8-c806582c97f7	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b7-6942-d4d942ffe025	\N	00040000-5620-a0b5-1ef8-c806582c97f7	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5620-a0b7-897e-cd8223f680e4	\N	00040000-5620-a0b5-1ef8-c806582c97f7	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b7-9d44-2c088c564fec	\N	00040000-5620-a0b5-1ef8-c806582c97f7	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b7-fabf-c7e2c8f7b4a2	\N	00040000-5620-a0b5-1ef8-c806582c97f7	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b7-148f-0ad2551a92dc	\N	00040000-5620-a0b5-31c7-91bdfe63b305	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b7-85ec-5decc662a68f	\N	00040000-5620-a0b5-3062-5fdda0e55d2c	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b7-ea9f-cad70923aa50	\N	00040000-5620-a0b5-3e49-d6bf94df4775	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b7-0f9a-5dfbff4539e6	\N	00040000-5620-a0b5-ba19-29428d2136a3	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-a0b8-85d5-850df05b94eb	\N	00040000-5620-a0b5-1ef8-c806582c97f7	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3051 (class 0 OID 22096935)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5620-a0b4-5284-1a31d337e5e5	8341	Adlešiči
00050000-5620-a0b4-830e-5dc98f3dbecf	5270	Ajdovščina
00050000-5620-a0b4-3b5e-72789566720a	6280	Ankaran/Ancarano
00050000-5620-a0b4-c288-5fe33a6c35a8	9253	Apače
00050000-5620-a0b4-dcde-0705c21e4cbf	8253	Artiče
00050000-5620-a0b4-4966-cc1e010c5916	4275	Begunje na Gorenjskem
00050000-5620-a0b4-da59-bbf5af86227c	1382	Begunje pri Cerknici
00050000-5620-a0b4-774c-7a963a7176fe	9231	Beltinci
00050000-5620-a0b4-81ca-bae87e09564a	2234	Benedikt
00050000-5620-a0b4-f9ac-688a56387ff2	2345	Bistrica ob Dravi
00050000-5620-a0b4-b4fd-c4319e6b32e8	3256	Bistrica ob Sotli
00050000-5620-a0b4-d999-8c0ce587cb7c	8259	Bizeljsko
00050000-5620-a0b4-a2d2-e62c4b306399	1223	Blagovica
00050000-5620-a0b4-473b-884ec59bd80d	8283	Blanca
00050000-5620-a0b4-8bc8-482dcc08d707	4260	Bled
00050000-5620-a0b4-5395-aa723ac6555b	4273	Blejska Dobrava
00050000-5620-a0b4-afcf-4f51f1409e1f	9265	Bodonci
00050000-5620-a0b4-e73f-0944878dd21d	9222	Bogojina
00050000-5620-a0b4-af50-4829c0d9f400	4263	Bohinjska Bela
00050000-5620-a0b4-040e-af436aee57be	4264	Bohinjska Bistrica
00050000-5620-a0b4-92a3-d1e81e3533b2	4265	Bohinjsko jezero
00050000-5620-a0b4-328e-f34fe7f4cf5c	1353	Borovnica
00050000-5620-a0b4-a914-e50f43cf7fac	8294	Boštanj
00050000-5620-a0b4-72de-3ebfc464f6fb	5230	Bovec
00050000-5620-a0b4-3735-9fe97edf63fe	5295	Branik
00050000-5620-a0b4-dcd1-487fa8620c19	3314	Braslovče
00050000-5620-a0b4-60fa-d9aa465e7aef	5223	Breginj
00050000-5620-a0b4-e8bd-0dcba4479c34	8280	Brestanica
00050000-5620-a0b4-8728-5967c4c39396	2354	Bresternica
00050000-5620-a0b4-da26-0ea7008d3b7b	4243	Brezje
00050000-5620-a0b4-827f-6003762c8791	1351	Brezovica pri Ljubljani
00050000-5620-a0b4-666d-b532fdebf317	8250	Brežice
00050000-5620-a0b4-f288-5cd5a4729302	4210	Brnik - Aerodrom
00050000-5620-a0b4-78b3-e6a7cb51df31	8321	Brusnice
00050000-5620-a0b4-cb83-d786a2b6e1e8	3255	Buče
00050000-5620-a0b4-fa5d-f8cd50656296	8276	Bučka 
00050000-5620-a0b4-fec7-16d437fb5e01	9261	Cankova
00050000-5620-a0b4-b79d-7db2024e605f	3000	Celje 
00050000-5620-a0b4-3e57-e147c46e54c9	3001	Celje - poštni predali
00050000-5620-a0b4-28d9-b6d734c76de6	4207	Cerklje na Gorenjskem
00050000-5620-a0b4-7a49-280d6063ab5c	8263	Cerklje ob Krki
00050000-5620-a0b4-7cd9-14a744f002e7	1380	Cerknica
00050000-5620-a0b4-4a3e-ef1157ee62d4	5282	Cerkno
00050000-5620-a0b4-a9eb-a10430c0c02c	2236	Cerkvenjak
00050000-5620-a0b4-20cd-83208070486f	2215	Ceršak
00050000-5620-a0b4-b5b2-0d7dc85a0341	2326	Cirkovce
00050000-5620-a0b4-88af-31c08c8c3aad	2282	Cirkulane
00050000-5620-a0b4-1068-c0abf7416b05	5273	Col
00050000-5620-a0b4-4dce-d61f9e5ea417	8251	Čatež ob Savi
00050000-5620-a0b4-2e6a-6cc45559fb1d	1413	Čemšenik
00050000-5620-a0b4-4c2d-6e72fdbf68dc	5253	Čepovan
00050000-5620-a0b4-3afc-01e97170ede2	9232	Črenšovci
00050000-5620-a0b4-87fe-693922ae060b	2393	Črna na Koroškem
00050000-5620-a0b4-8548-8255d9ddffb5	6275	Črni Kal
00050000-5620-a0b4-4f90-f6faa9d46130	5274	Črni Vrh nad Idrijo
00050000-5620-a0b4-8391-18fc83ed9e2c	5262	Črniče
00050000-5620-a0b4-11dc-69e47fba78a7	8340	Črnomelj
00050000-5620-a0b4-b1b2-6cf1ee0bfb87	6271	Dekani
00050000-5620-a0b4-e9f0-905e36e86fce	5210	Deskle
00050000-5620-a0b4-8dd8-057ef29f7a4e	2253	Destrnik
00050000-5620-a0b4-e7f5-6c5a25eb15d0	6215	Divača
00050000-5620-a0b4-47a6-fb4734219f7d	1233	Dob
00050000-5620-a0b4-6cb4-906d3c85f8ef	3224	Dobje pri Planini
00050000-5620-a0b4-aca9-50bfdfd9a089	8257	Dobova
00050000-5620-a0b4-98ea-151709edc810	1423	Dobovec
00050000-5620-a0b4-d9cc-7470d1a96bb7	5263	Dobravlje
00050000-5620-a0b4-ff51-6f3adf05ea08	3204	Dobrna
00050000-5620-a0b4-2c21-7f80e8781d26	8211	Dobrnič
00050000-5620-a0b4-4915-6f57acb959d3	1356	Dobrova
00050000-5620-a0b4-ef0a-655193a683f5	9223	Dobrovnik/Dobronak 
00050000-5620-a0b4-23f6-a799fcaa6449	5212	Dobrovo v Brdih
00050000-5620-a0b4-4a49-1884731512a2	1431	Dol pri Hrastniku
00050000-5620-a0b4-dfa0-335ecf16f30b	1262	Dol pri Ljubljani
00050000-5620-a0b4-eda1-183ea38fa8be	1273	Dole pri Litiji
00050000-5620-a0b4-fb46-83460ff62c21	1331	Dolenja vas
00050000-5620-a0b4-99e3-601c96e9d524	8350	Dolenjske Toplice
00050000-5620-a0b4-345c-5460e3438d23	1230	Domžale
00050000-5620-a0b4-0b01-3b7fece4c89c	2252	Dornava
00050000-5620-a0b4-f06e-7772961bad75	5294	Dornberk
00050000-5620-a0b4-760b-7dd16bf02e42	1319	Draga
00050000-5620-a0b4-06c2-33bcc3c6c286	8343	Dragatuš
00050000-5620-a0b4-ff13-83a3830617b8	3222	Dramlje
00050000-5620-a0b4-d6f9-bd06e1ab909a	2370	Dravograd
00050000-5620-a0b4-5d3f-436eb8ace0a4	4203	Duplje
00050000-5620-a0b4-d65a-0e49fd8eb832	6221	Dutovlje
00050000-5620-a0b4-e0c1-e2d9ea1a7904	8361	Dvor
00050000-5620-a0b4-3a39-3d9f1e1965bd	2343	Fala
00050000-5620-a0b4-d334-6f31001c6669	9208	Fokovci
00050000-5620-a0b4-9f8b-e2ab93da7493	2313	Fram
00050000-5620-a0b4-5b4e-98081969fe9a	3213	Frankolovo
00050000-5620-a0b4-16b4-e5f815bdf189	1274	Gabrovka
00050000-5620-a0b4-5d5d-aed511472980	8254	Globoko
00050000-5620-a0b4-6129-c951becc10ff	5275	Godovič
00050000-5620-a0b4-cb26-21fa9be93ade	4204	Golnik
00050000-5620-a0b4-0eee-2f55e76e76b0	3303	Gomilsko
00050000-5620-a0b4-6adc-99d05c9c48db	4224	Gorenja vas
00050000-5620-a0b4-b78b-d4c7bc3c7852	3263	Gorica pri Slivnici
00050000-5620-a0b4-9492-500727d8016a	2272	Gorišnica
00050000-5620-a0b4-9162-7298d71c9051	9250	Gornja Radgona
00050000-5620-a0b4-8a8b-8e064e124a7d	3342	Gornji Grad
00050000-5620-a0b4-1e84-f90f1dde9965	4282	Gozd Martuljek
00050000-5620-a0b4-87c0-d4d7e6ec7aec	6272	Gračišče
00050000-5620-a0b4-8e7e-3e2aa9b323dd	9264	Grad
00050000-5620-a0b4-0a7a-9db4a676e485	8332	Gradac
00050000-5620-a0b4-2200-26d0e637db29	1384	Grahovo
00050000-5620-a0b4-8714-bd484bbdea2f	5242	Grahovo ob Bači
00050000-5620-a0b4-9b13-ebe17d96761c	5251	Grgar
00050000-5620-a0b4-ed2c-d1f4c629b781	3302	Griže
00050000-5620-a0b4-2a95-1bbda09a0fad	3231	Grobelno
00050000-5620-a0b4-e39c-421adebd70f8	1290	Grosuplje
00050000-5620-a0b4-96a2-c38bf25825f3	2288	Hajdina
00050000-5620-a0b4-f04a-56de204bb54e	8362	Hinje
00050000-5620-a0b4-e61a-95f4e9317249	2311	Hoče
00050000-5620-a0b4-313a-199dcc3c47d0	9205	Hodoš/Hodos
00050000-5620-a0b4-5455-3b593ebaa2fb	1354	Horjul
00050000-5620-a0b4-8f45-9365d5e8209c	1372	Hotedršica
00050000-5620-a0b4-ae37-0b444cd933d7	1430	Hrastnik
00050000-5620-a0b4-e81e-e961d1abc4c7	6225	Hruševje
00050000-5620-a0b4-bad1-03961d62ce85	4276	Hrušica
00050000-5620-a0b4-90c7-3be3c5bdaf65	5280	Idrija
00050000-5620-a0b4-c563-57c67d1818f9	1292	Ig
00050000-5620-a0b4-6f55-73cdb378c00f	6250	Ilirska Bistrica
00050000-5620-a0b4-6fa1-21c602c0fc78	6251	Ilirska Bistrica-Trnovo
00050000-5620-a0b4-1ca1-72c8acf5db28	1295	Ivančna Gorica
00050000-5620-a0b4-5e17-3550822c80e3	2259	Ivanjkovci
00050000-5620-a0b4-d0e0-d6ca54adbba3	1411	Izlake
00050000-5620-a0b4-bab9-c5c1f19cd06e	6310	Izola/Isola
00050000-5620-a0b4-dbe4-69fe2a09c921	2222	Jakobski Dol
00050000-5620-a0b4-6c3e-73d9caf472c5	2221	Jarenina
00050000-5620-a0b4-251c-76095e221e13	6254	Jelšane
00050000-5620-a0b4-3b2e-fc8de99b78b9	4270	Jesenice
00050000-5620-a0b4-147a-8737af73d5ac	8261	Jesenice na Dolenjskem
00050000-5620-a0b4-7dc4-837e9bcff14b	3273	Jurklošter
00050000-5620-a0b4-d19d-420073688a29	2223	Jurovski Dol
00050000-5620-a0b4-45ce-cb875a2efb81	2256	Juršinci
00050000-5620-a0b4-3bb1-b8a66f9cd6da	5214	Kal nad Kanalom
00050000-5620-a0b4-8ac2-cfc8f443a965	3233	Kalobje
00050000-5620-a0b4-6458-d7dcf5cc72e3	4246	Kamna Gorica
00050000-5620-a0b4-4be6-1bc6140b507a	2351	Kamnica
00050000-5620-a0b4-6486-1ee8affcd8cc	1241	Kamnik
00050000-5620-a0b4-9374-816d9ae244db	5213	Kanal
00050000-5620-a0b4-5bef-812d0898ffe2	8258	Kapele
00050000-5620-a0b4-5a5c-ced39a4fbc19	2362	Kapla
00050000-5620-a0b4-2326-62263913fe58	2325	Kidričevo
00050000-5620-a0b4-0c53-4425dc1c8b32	1412	Kisovec
00050000-5620-a0b4-184c-7c1dfa7f9073	6253	Knežak
00050000-5620-a0b4-977d-5d6afde5ab91	5222	Kobarid
00050000-5620-a0b4-d1cb-c7e276e94adc	9227	Kobilje
00050000-5620-a0b4-9956-22013c29c346	1330	Kočevje
00050000-5620-a0b4-4acf-aab2a874e1a0	1338	Kočevska Reka
00050000-5620-a0b4-6901-be94fa8343b6	2276	Kog
00050000-5620-a0b4-c4cc-b63c1af96cee	5211	Kojsko
00050000-5620-a0b4-6762-fa736053178d	6223	Komen
00050000-5620-a0b4-a7bb-29f8a0cb3831	1218	Komenda
00050000-5620-a0b4-0be0-93bb25daf2ae	6000	Koper/Capodistria 
00050000-5620-a0b4-eca4-87ad4bab6aa8	6001	Koper/Capodistria - poštni predali
00050000-5620-a0b4-ea52-9d933de743a5	8282	Koprivnica
00050000-5620-a0b4-f22b-267b6c2d336c	5296	Kostanjevica na Krasu
00050000-5620-a0b4-6e26-d3e92a4b2557	8311	Kostanjevica na Krki
00050000-5620-a0b4-502e-4ccb00848732	1336	Kostel
00050000-5620-a0b4-29cd-b25ff6c6ce9d	6256	Košana
00050000-5620-a0b4-8be0-af4528fae5fd	2394	Kotlje
00050000-5620-a0b4-2960-52eea681c2ef	6240	Kozina
00050000-5620-a0b4-d2f2-2f34ea70f465	3260	Kozje
00050000-5620-a0b4-7d10-6a8c7b7ce04f	4000	Kranj 
00050000-5620-a0b4-bf22-a90d35503acd	4001	Kranj - poštni predali
00050000-5620-a0b4-c560-59281dcc2048	4280	Kranjska Gora
00050000-5620-a0b4-2323-5974856788cc	1281	Kresnice
00050000-5620-a0b4-0117-60c1317f6bb1	4294	Križe
00050000-5620-a0b4-8f2c-5ffba3a8c194	9206	Križevci
00050000-5620-a0b4-ea28-8aee2ae90019	9242	Križevci pri Ljutomeru
00050000-5620-a0b4-cabb-e52575ffa5e9	1301	Krka
00050000-5620-a0b4-5895-5e78991c75f5	8296	Krmelj
00050000-5620-a0b4-68df-69afc6f5831e	4245	Kropa
00050000-5620-a0b4-8a5f-dc3534391b30	8262	Krška vas
00050000-5620-a0b4-ced1-f6a70d632ae8	8270	Krško
00050000-5620-a0b4-7ad7-868afc2904aa	9263	Kuzma
00050000-5620-a0b4-ab0b-10933d3439b6	2318	Laporje
00050000-5620-a0b4-e211-ef55c85d2bb3	3270	Laško
00050000-5620-a0b4-5138-02397ab445ab	1219	Laze v Tuhinju
00050000-5620-a0b4-1b8d-b2c9d65ebe9e	2230	Lenart v Slovenskih goricah
00050000-5620-a0b4-7d98-6dd92ded753e	9220	Lendava/Lendva
00050000-5620-a0b4-e95e-041b4ab6c90a	4248	Lesce
00050000-5620-a0b4-cdb9-077f9fbfc612	3261	Lesično
00050000-5620-a0b4-c7fc-bd0871d3c78c	8273	Leskovec pri Krškem
00050000-5620-a0b4-08c5-ea24d19ae789	2372	Libeliče
00050000-5620-a0b4-247c-bab2704a88f9	2341	Limbuš
00050000-5620-a0b4-f1aa-932706e228a6	1270	Litija
00050000-5620-a0b4-b5b6-d9e372384f97	3202	Ljubečna
00050000-5620-a0b4-5046-b71dee5fe592	1000	Ljubljana 
00050000-5620-a0b4-cacc-0b1c0e71e4ac	1001	Ljubljana - poštni predali
00050000-5620-a0b4-5f25-10eadfe42a8f	1231	Ljubljana - Črnuče
00050000-5620-a0b4-8457-edc6cc926450	1261	Ljubljana - Dobrunje
00050000-5620-a0b4-6a87-10e33185ce55	1260	Ljubljana - Polje
00050000-5620-a0b4-7e8f-836732bc7d4d	1210	Ljubljana - Šentvid
00050000-5620-a0b4-b819-833948df60a2	1211	Ljubljana - Šmartno
00050000-5620-a0b4-d606-20aff6299399	3333	Ljubno ob Savinji
00050000-5620-a0b4-ef26-4835e065b8df	9240	Ljutomer
00050000-5620-a0b4-820d-0be06deb3308	3215	Loče
00050000-5620-a0b4-6ceb-f41e8a7c14c3	5231	Log pod Mangartom
00050000-5620-a0b4-6183-f12a29cd9b77	1358	Log pri Brezovici
00050000-5620-a0b4-64e8-be57eaced2d3	1370	Logatec
00050000-5620-a0b4-a4b8-6e1c24fcb51a	1371	Logatec
00050000-5620-a0b4-b83a-f1828b53d4ef	1434	Loka pri Zidanem Mostu
00050000-5620-a0b4-96ac-ec34b39b68a2	3223	Loka pri Žusmu
00050000-5620-a0b4-c72b-3701b1da767c	6219	Lokev
00050000-5620-a0b4-4bbe-b97a1a06e2f7	1318	Loški Potok
00050000-5620-a0b4-fc0c-bd4b92b68bbe	2324	Lovrenc na Dravskem polju
00050000-5620-a0b4-4f38-c8fbec215c89	2344	Lovrenc na Pohorju
00050000-5620-a0b4-ffa2-883c9a99fc7a	3334	Luče
00050000-5620-a0b4-e206-247044758ce3	1225	Lukovica
00050000-5620-a0b4-3306-f54373ac14a2	9202	Mačkovci
00050000-5620-a0b4-5b80-7cb61e28e193	2322	Majšperk
00050000-5620-a0b4-8db0-be3f927d4c6b	2321	Makole
00050000-5620-a0b4-855f-7f1c978618eb	9243	Mala Nedelja
00050000-5620-a0b4-3eed-e4628a4ab755	2229	Malečnik
00050000-5620-a0b4-6f8c-1285e84de7ec	6273	Marezige
00050000-5620-a0b4-83da-0f8c4df459d4	2000	Maribor 
00050000-5620-a0b4-5047-1cc4fd374782	2001	Maribor - poštni predali
00050000-5620-a0b4-5828-14d66a3e0cf0	2206	Marjeta na Dravskem polju
00050000-5620-a0b4-cedb-501afb0c9333	2281	Markovci
00050000-5620-a0b4-8395-f2062f95a8b5	9221	Martjanci
00050000-5620-a0b4-4be7-1ac6cc9ab70e	6242	Materija
00050000-5620-a0b4-ee23-2aa2ed290827	4211	Mavčiče
00050000-5620-a0b4-2b8b-898aeeccb701	1215	Medvode
00050000-5620-a0b4-8dd3-70b38e8f5bc3	1234	Mengeš
00050000-5620-a0b4-e299-7ded0b8be3b3	8330	Metlika
00050000-5620-a0b4-7d71-087caca323ab	2392	Mežica
00050000-5620-a0b4-b4c2-9be21d4a2459	2204	Miklavž na Dravskem polju
00050000-5620-a0b4-657b-b2ddeaa85910	2275	Miklavž pri Ormožu
00050000-5620-a0b4-a68d-d94ab38829d8	5291	Miren
00050000-5620-a0b4-fed0-49f7e4c298f7	8233	Mirna
00050000-5620-a0b4-f0a2-eba1daf62898	8216	Mirna Peč
00050000-5620-a0b4-8f6e-0417fd6874c1	2382	Mislinja
00050000-5620-a0b4-1ddb-318c7a66b78b	4281	Mojstrana
00050000-5620-a0b4-60d0-d6e7d74b5d19	8230	Mokronog
00050000-5620-a0b4-355e-cb72eae30880	1251	Moravče
00050000-5620-a0b4-180f-200a1cd0086d	9226	Moravske Toplice
00050000-5620-a0b4-f5fc-1d9bc2924faf	5216	Most na Soči
00050000-5620-a0b4-25d0-1d8efea43723	1221	Motnik
00050000-5620-a0b4-1e02-7c82fea9915f	3330	Mozirje
00050000-5620-a0b4-908a-adcf98840e6a	9000	Murska Sobota 
00050000-5620-a0b4-5e15-73a34b2d13ca	9001	Murska Sobota - poštni predali
00050000-5620-a0b4-bd2a-a713763f04c1	2366	Muta
00050000-5620-a0b4-a100-ce6d7df2c297	4202	Naklo
00050000-5620-a0b4-bb25-b6f0b2946f79	3331	Nazarje
00050000-5620-a0b4-5aa8-43688f84bfa4	1357	Notranje Gorice
00050000-5620-a0b4-fb81-a30171342a1a	3203	Nova Cerkev
00050000-5620-a0b4-1507-d5b5a7e432a4	5000	Nova Gorica 
00050000-5620-a0b4-d831-7b1c60c9c8e4	5001	Nova Gorica - poštni predali
00050000-5620-a0b4-2d4f-6ff77ff7fbd8	1385	Nova vas
00050000-5620-a0b4-5fcd-d6ada8754ea4	8000	Novo mesto
00050000-5620-a0b4-7300-603934d26413	8001	Novo mesto - poštni predali
00050000-5620-a0b4-0870-f803e9438b7f	6243	Obrov
00050000-5620-a0b4-5d7b-188d444b9949	9233	Odranci
00050000-5620-a0b4-cbc9-06aa5600b519	2317	Oplotnica
00050000-5620-a0b4-8f91-59cedec48d14	2312	Orehova vas
00050000-5620-a0b4-0393-70e19fdf3c7f	2270	Ormož
00050000-5620-a0b4-bd56-79264f981a83	1316	Ortnek
00050000-5620-a0b4-00fb-8ed58e602804	1337	Osilnica
00050000-5620-a0b4-a0bd-c3054becede4	8222	Otočec
00050000-5620-a0b4-2665-3a8577be6624	2361	Ožbalt
00050000-5620-a0b4-3166-245bcb435bb9	2231	Pernica
00050000-5620-a0b4-0291-720eae0c13ca	2211	Pesnica pri Mariboru
00050000-5620-a0b4-940d-4167eb3bdd74	9203	Petrovci
00050000-5620-a0b4-0218-c1a67fb4eec6	3301	Petrovče
00050000-5620-a0b4-0b87-80b4df173631	6330	Piran/Pirano
00050000-5620-a0b4-8a17-30a66102027c	8255	Pišece
00050000-5620-a0b4-852c-3c9495e26a7e	6257	Pivka
00050000-5620-a0b4-a979-e7f01855c4ef	6232	Planina
00050000-5620-a0b4-9b9d-712c4e73f2bc	3225	Planina pri Sevnici
00050000-5620-a0b4-ae78-2ec958ecd0cf	6276	Pobegi
00050000-5620-a0b4-ab00-d816ad5117fb	8312	Podbočje
00050000-5620-a0b4-9a0c-60f93f33dcae	5243	Podbrdo
00050000-5620-a0b4-3827-eb408a0103ae	3254	Podčetrtek
00050000-5620-a0b4-41a1-618226db37e7	2273	Podgorci
00050000-5620-a0b4-dc74-dff2ffde657f	6216	Podgorje
00050000-5620-a0b4-464e-53b37c63f58f	2381	Podgorje pri Slovenj Gradcu
00050000-5620-a0b4-eee1-59bb1c18cff8	6244	Podgrad
00050000-5620-a0b4-2896-64b392969eec	1414	Podkum
00050000-5620-a0b4-f29d-ef1d57d022f0	2286	Podlehnik
00050000-5620-a0b4-3fa2-68762b0c6d64	5272	Podnanos
00050000-5620-a0b4-198b-6b9c000ebb95	4244	Podnart
00050000-5620-a0b4-2a52-9ec2284bce41	3241	Podplat
00050000-5620-a0b4-61a9-9f54c4b573e5	3257	Podsreda
00050000-5620-a0b4-2126-45b420b74ed3	2363	Podvelka
00050000-5620-a0b4-b684-ce7c0dc01cc4	2208	Pohorje
00050000-5620-a0b4-32a9-7d15c1878ea9	2257	Polenšak
00050000-5620-a0b4-4fdf-d6731e9cdcc1	1355	Polhov Gradec
00050000-5620-a0b4-76ee-ef0c1d692002	4223	Poljane nad Škofjo Loko
00050000-5620-a0b4-d3e9-36c7da1c6e8e	2319	Poljčane
00050000-5620-a0b4-3db9-7221d3f17844	1272	Polšnik
00050000-5620-a0b4-f261-01f43f89075c	3313	Polzela
00050000-5620-a0b4-8043-ec488b48ae62	3232	Ponikva
00050000-5620-a0b4-3168-b9c31a04b4f1	6320	Portorož/Portorose
00050000-5620-a0b4-4ab2-a61d96d5afe1	6230	Postojna
00050000-5620-a0b4-c5f3-5dfcd2a1bd25	2331	Pragersko
00050000-5620-a0b4-9e62-522a61ceb8d8	3312	Prebold
00050000-5620-a0b4-e4f8-269bfcd14b35	4205	Preddvor
00050000-5620-a0b4-a489-43577489907a	6255	Prem
00050000-5620-a0b4-f817-b97874fd7747	1352	Preserje
00050000-5620-a0b4-7e71-23fd930a07a2	6258	Prestranek
00050000-5620-a0b4-1ed3-eaa4dd540c46	2391	Prevalje
00050000-5620-a0b4-ce41-bc56cae6840b	3262	Prevorje
00050000-5620-a0b4-f6c1-53cc0fd5493e	1276	Primskovo 
00050000-5620-a0b4-edc9-621d53d703a8	3253	Pristava pri Mestinju
00050000-5620-a0b4-dd8e-73d50ac2071f	9207	Prosenjakovci/Partosfalva
00050000-5620-a0b4-21a1-7ea910de880d	5297	Prvačina
00050000-5620-a0b4-b356-923b15d713a2	2250	Ptuj
00050000-5620-a0b4-151d-8f7da0488858	2323	Ptujska Gora
00050000-5620-a0b4-56b3-2bd5bcf80b43	9201	Puconci
00050000-5620-a0b4-18e3-fd9136e026fd	2327	Rače
00050000-5620-a0b4-c5f7-465d217be7fa	1433	Radeče
00050000-5620-a0b4-8bf8-0e60c77c4a68	9252	Radenci
00050000-5620-a0b4-bd6e-2515110ee28d	2360	Radlje ob Dravi
00050000-5620-a0b4-1ff5-324b40369d91	1235	Radomlje
00050000-5620-a0b4-7903-6b6c9f3ffb9f	4240	Radovljica
00050000-5620-a0b4-0898-0a761bd6b474	8274	Raka
00050000-5620-a0b4-8cb5-c62ac4525770	1381	Rakek
00050000-5620-a0b4-6568-d7e94607d5f5	4283	Rateče - Planica
00050000-5620-a0b4-5bfb-579cdbd2893c	2390	Ravne na Koroškem
00050000-5620-a0b4-a75e-d909d5ff63e2	9246	Razkrižje
00050000-5620-a0b4-33d9-be9256709a1f	3332	Rečica ob Savinji
00050000-5620-a0b4-c650-32a4af04e489	5292	Renče
00050000-5620-a0b4-1c80-0d54d3862e59	1310	Ribnica
00050000-5620-a0b4-e56d-51ed09498a58	2364	Ribnica na Pohorju
00050000-5620-a0b4-f095-782dcc53909c	3272	Rimske Toplice
00050000-5620-a0b4-cd1b-57be2a3b8ed0	1314	Rob
00050000-5620-a0b4-a771-107d00a0ea5d	5215	Ročinj
00050000-5620-a0b4-8b29-5079fa7d2e31	3250	Rogaška Slatina
00050000-5620-a0b4-d279-8377c1b6a72d	9262	Rogašovci
00050000-5620-a0b4-e599-2c1eb3223297	3252	Rogatec
00050000-5620-a0b4-cd57-beebc74b9a75	1373	Rovte
00050000-5620-a0b4-5908-07e5d0da75c8	2342	Ruše
00050000-5620-a0b4-df21-81ed128ac926	1282	Sava
00050000-5620-a0b4-d2ee-0d03920bd3f6	6333	Sečovlje/Sicciole
00050000-5620-a0b4-35b2-c15e41f78d21	4227	Selca
00050000-5620-a0b4-26c2-2534db31bf64	2352	Selnica ob Dravi
00050000-5620-a0b4-1d67-b75fc216686a	8333	Semič
00050000-5620-a0b4-474b-aa0fed4c2984	8281	Senovo
00050000-5620-a0b4-90f8-c7fc83636442	6224	Senožeče
00050000-5620-a0b4-c59a-07bd4ebdceb1	8290	Sevnica
00050000-5620-a0b4-f14c-f1f6e81e28de	6210	Sežana
00050000-5620-a0b4-65e1-b92822bde807	2214	Sladki Vrh
00050000-5620-a0b4-68ac-ceb800901056	5283	Slap ob Idrijci
00050000-5620-a0b4-6eb8-52a94b3f8960	2380	Slovenj Gradec
00050000-5620-a0b4-2de6-075a5e567931	2310	Slovenska Bistrica
00050000-5620-a0b4-cae8-fbade7f0d041	3210	Slovenske Konjice
00050000-5620-a0b4-c624-7609ea35d84b	1216	Smlednik
00050000-5620-a0b4-88f9-a09a7d1e6f4b	5232	Soča
00050000-5620-a0b4-6ca8-d966edf80e62	1317	Sodražica
00050000-5620-a0b4-fb43-166ec9722f2a	3335	Solčava
00050000-5620-a0b4-7ed0-39135cb3947f	5250	Solkan
00050000-5620-a0b4-5865-9c11b3994bdc	4229	Sorica
00050000-5620-a0b4-c4fa-4b1806734f3b	4225	Sovodenj
00050000-5620-a0b4-2cde-90b370705a35	5281	Spodnja Idrija
00050000-5620-a0b4-0575-e911d5448c8a	2241	Spodnji Duplek
00050000-5620-a0b4-afe8-e50dad591f59	9245	Spodnji Ivanjci
00050000-5620-a0b4-6187-187f9fc3837c	2277	Središče ob Dravi
00050000-5620-a0b4-e08d-ad809be88ef8	4267	Srednja vas v Bohinju
00050000-5620-a0b4-32d9-e9f28c370032	8256	Sromlje 
00050000-5620-a0b4-2963-14f6dff8e3a1	5224	Srpenica
00050000-5620-a0b4-7a83-fc053806c8d9	1242	Stahovica
00050000-5620-a0b4-a8a5-8dbc0b23019c	1332	Stara Cerkev
00050000-5620-a0b4-48c2-18b4e57f1c58	8342	Stari trg ob Kolpi
00050000-5620-a0b4-6a7b-3e57240b5321	1386	Stari trg pri Ložu
00050000-5620-a0b4-82e1-d34a366fbac5	2205	Starše
00050000-5620-a0b4-6056-2d719129238c	2289	Stoperce
00050000-5620-a0b4-cdef-f5c2b977975c	8322	Stopiče
00050000-5620-a0b4-4090-1ffc57f6b374	3206	Stranice
00050000-5620-a0b4-0cb7-9be6869f9999	8351	Straža
00050000-5620-a0b4-3e2e-12b432532ef9	1313	Struge
00050000-5620-a0b4-6f8c-5883477d07f3	8293	Studenec
00050000-5620-a0b4-35e0-363aaa3a4a1e	8331	Suhor
00050000-5620-a0b4-c95a-90cb8cc8e823	2233	Sv. Ana v Slovenskih goricah
00050000-5620-a0b4-a63e-db49d6c5ecc2	2235	Sv. Trojica v Slovenskih goricah
00050000-5620-a0b4-a8a4-89d19fa52b4a	2353	Sveti Duh na Ostrem Vrhu
00050000-5620-a0b4-fde7-dfa9c2967daf	9244	Sveti Jurij ob Ščavnici
00050000-5620-a0b4-5fd4-fd244e136014	3264	Sveti Štefan
00050000-5620-a0b4-afa7-7bce1271381c	2258	Sveti Tomaž
00050000-5620-a0b4-fa44-14fcf355c557	9204	Šalovci
00050000-5620-a0b4-de70-f90d9a886eef	5261	Šempas
00050000-5620-a0b4-e030-8535e62cb239	5290	Šempeter pri Gorici
00050000-5620-a0b4-e5fd-f46672e1a5b2	3311	Šempeter v Savinjski dolini
00050000-5620-a0b4-466a-f18f403a1530	4208	Šenčur
00050000-5620-a0b4-c147-baaafa9a2c58	2212	Šentilj v Slovenskih goricah
00050000-5620-a0b4-27eb-bfff6bad8421	8297	Šentjanž
00050000-5620-a0b4-2c93-85fb61206daf	2373	Šentjanž pri Dravogradu
00050000-5620-a0b4-06e7-4d78ec946fe0	8310	Šentjernej
00050000-5620-a0b4-f87d-26c3cbc4129b	3230	Šentjur
00050000-5620-a0b4-2b7e-0e15b4df8f16	3271	Šentrupert
00050000-5620-a0b4-f0a8-42b8f904113f	8232	Šentrupert
00050000-5620-a0b4-e975-9f573c0a6949	1296	Šentvid pri Stični
00050000-5620-a0b4-e7f9-292417dd1790	8275	Škocjan
00050000-5620-a0b4-d30c-34732d0c0ff0	6281	Škofije
00050000-5620-a0b4-ba3c-3edd4b06246e	4220	Škofja Loka
00050000-5620-a0b4-392c-adee8822fddb	3211	Škofja vas
00050000-5620-a0b4-ec73-28bbcd4f837e	1291	Škofljica
00050000-5620-a0b4-18e4-0e281e7cf468	6274	Šmarje
00050000-5620-a0b4-9de3-e37f98baf825	1293	Šmarje - Sap
00050000-5620-a0b4-0b6c-8cf99527a521	3240	Šmarje pri Jelšah
00050000-5620-a0b4-3ef3-28599f1c35c8	8220	Šmarješke Toplice
00050000-5620-a0b4-d9b2-62899e145362	2315	Šmartno na Pohorju
00050000-5620-a0b4-9f27-bae3afc5e1c9	3341	Šmartno ob Dreti
00050000-5620-a0b4-42fe-c351edb86031	3327	Šmartno ob Paki
00050000-5620-a0b4-4f04-47a208b96d3a	1275	Šmartno pri Litiji
00050000-5620-a0b4-79f3-b0675a888e2b	2383	Šmartno pri Slovenj Gradcu
00050000-5620-a0b4-d33a-7945fac33c88	3201	Šmartno v Rožni dolini
00050000-5620-a0b4-bd34-fcd844ef13f1	3325	Šoštanj
00050000-5620-a0b4-9025-4a063350ffe8	6222	Štanjel
00050000-5620-a0b4-b261-223040f9b7e3	3220	Štore
00050000-5620-a0b4-2680-13ebd7df2cb1	3304	Tabor
00050000-5620-a0b4-14ad-40861c12ce80	3221	Teharje
00050000-5620-a0b4-d907-edf59f57e3b5	9251	Tišina
00050000-5620-a0b4-102b-e45eb504377d	5220	Tolmin
00050000-5620-a0b4-aee5-bc2c59c55e55	3326	Topolšica
00050000-5620-a0b4-ffce-875189a8be4f	2371	Trbonje
00050000-5620-a0b4-5014-fa8c1d5a2c66	1420	Trbovlje
00050000-5620-a0b4-265f-6670926696bd	8231	Trebelno 
00050000-5620-a0b4-7fe8-90b8fcbd23b0	8210	Trebnje
00050000-5620-a0b4-53aa-582455746946	5252	Trnovo pri Gorici
00050000-5620-a0b4-9f06-aefe03fdc597	2254	Trnovska vas
00050000-5620-a0b4-13ac-139c1b7f8c91	1222	Trojane
00050000-5620-a0b4-9d84-48eed22b9542	1236	Trzin
00050000-5620-a0b4-f03a-dadb228fb30b	4290	Tržič
00050000-5620-a0b4-aa7a-788359234b19	8295	Tržišče
00050000-5620-a0b4-bf35-30e8ce730b8d	1311	Turjak
00050000-5620-a0b4-ca4e-ae177a713dcd	9224	Turnišče
00050000-5620-a0b4-f832-3b4d67301c4f	8323	Uršna sela
00050000-5620-a0b4-92dc-156f6c954fec	1252	Vače
00050000-5620-a0b4-d54a-79726ad0e1fa	3320	Velenje 
00050000-5620-a0b4-c4e8-9d7c6e1217e4	3322	Velenje - poštni predali
00050000-5620-a0b4-3d9d-19c8131f851c	8212	Velika Loka
00050000-5620-a0b4-68a6-d457b82bca35	2274	Velika Nedelja
00050000-5620-a0b4-8a59-12f08d8c702e	9225	Velika Polana
00050000-5620-a0b4-0891-f02e473a2e86	1315	Velike Lašče
00050000-5620-a0b4-ba63-c340649e9684	8213	Veliki Gaber
00050000-5620-a0b4-c7b5-251b8affe89a	9241	Veržej
00050000-5620-a0b4-0e2d-96aae6a069eb	1312	Videm - Dobrepolje
00050000-5620-a0b4-5836-5e10168e72a1	2284	Videm pri Ptuju
00050000-5620-a0b4-952c-2301ba0bdc11	8344	Vinica
00050000-5620-a0b4-dc98-3a77c2090a17	5271	Vipava
00050000-5620-a0b4-e676-2778b158fb6c	4212	Visoko
00050000-5620-a0b4-6259-c50583c1f434	1294	Višnja Gora
00050000-5620-a0b4-6417-3ea3c09fd3e1	3205	Vitanje
00050000-5620-a0b4-7ced-3fcd20aa9198	2255	Vitomarci
00050000-5620-a0b4-6939-b7f5de341c80	1217	Vodice
00050000-5620-a0b4-bbd3-b766901c7c99	3212	Vojnik\t
00050000-5620-a0b4-d25a-cb78547edf86	5293	Volčja Draga
00050000-5620-a0b4-4410-a9db9c0a21bd	2232	Voličina
00050000-5620-a0b4-7f26-92564c8bc557	3305	Vransko
00050000-5620-a0b4-0aae-62f2df69d1f9	6217	Vremski Britof
00050000-5620-a0b4-3095-50f64bd61751	1360	Vrhnika
00050000-5620-a0b4-7a0a-6c3107f6511c	2365	Vuhred
00050000-5620-a0b4-472a-1e0cffd98f96	2367	Vuzenica
00050000-5620-a0b4-8e45-ec62b24d77f0	8292	Zabukovje 
00050000-5620-a0b4-897f-ef30a323c28d	1410	Zagorje ob Savi
00050000-5620-a0b4-4263-317179a052a5	1303	Zagradec
00050000-5620-a0b4-4568-b97cc0c46b3b	2283	Zavrč
00050000-5620-a0b4-eb26-8acbd3177ff7	8272	Zdole 
00050000-5620-a0b4-c2d0-c02c79806c3a	4201	Zgornja Besnica
00050000-5620-a0b4-2db7-3ae2363c6b89	2242	Zgornja Korena
00050000-5620-a0b4-7f09-d90bea5a6d90	2201	Zgornja Kungota
00050000-5620-a0b4-d502-4c7357ce5102	2316	Zgornja Ložnica
00050000-5620-a0b4-9cc8-c0f8d326c2be	2314	Zgornja Polskava
00050000-5620-a0b4-7519-2145122fde71	2213	Zgornja Velka
00050000-5620-a0b4-0f4e-de9a536def5c	4247	Zgornje Gorje
00050000-5620-a0b4-3a4f-9aace3e03912	4206	Zgornje Jezersko
00050000-5620-a0b4-606d-2540a92e8580	2285	Zgornji Leskovec
00050000-5620-a0b4-65e0-f5f40203fbba	1432	Zidani Most
00050000-5620-a0b4-eac7-3d9a8c00f95a	3214	Zreče
00050000-5620-a0b4-838e-a54de45820f6	4209	Žabnica
00050000-5620-a0b4-a360-8b24eaf6fdbb	3310	Žalec
00050000-5620-a0b4-dc56-982194ca4a53	4228	Železniki
00050000-5620-a0b4-961f-a233805601e1	2287	Žetale
00050000-5620-a0b4-71db-69204cfc8c7b	4226	Žiri
00050000-5620-a0b4-5dd2-e9cc51a4b438	4274	Žirovnica
00050000-5620-a0b4-48da-ccd335916a3b	8360	Žužemberk
\.


--
-- TOC entry 3097 (class 0 OID 22097558)
-- Dependencies: 235
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22097150)
-- Dependencies: 208
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 22096920)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5620-a0b7-29d0-105e645a41ea	00080000-5620-a0b7-3f74-e45107547156	\N	00040000-5620-a0b5-1ef8-c806582c97f7	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5620-a0b7-dfcd-aa881f442e03	00080000-5620-a0b7-3f74-e45107547156	\N	00040000-5620-a0b5-1ef8-c806582c97f7	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5620-a0b7-bad4-6e80548eaba2	00080000-5620-a0b7-6942-d4d942ffe025	\N	00040000-5620-a0b5-1ef8-c806582c97f7	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3058 (class 0 OID 22097024)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22097162)
-- Dependencies: 210
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 22097572)
-- Dependencies: 236
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 22097582)
-- Dependencies: 237
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5620-a0b7-b778-e39b98652fc3	00080000-5620-a0b7-897e-cd8223f680e4	0987	AK
00190000-5620-a0b7-6d56-64f1f1aa8c51	00080000-5620-a0b7-6942-d4d942ffe025	0989	AK
00190000-5620-a0b7-8f59-0e16e035df26	00080000-5620-a0b7-9d44-2c088c564fec	0986	AK
00190000-5620-a0b7-5914-bc563fb30405	00080000-5620-a0b7-148f-0ad2551a92dc	0984	AK
00190000-5620-a0b7-408f-ea1c0d1704da	00080000-5620-a0b7-85ec-5decc662a68f	0983	AK
00190000-5620-a0b7-9aee-61c975d9d0ae	00080000-5620-a0b7-ea9f-cad70923aa50	0982	AK
00190000-5620-a0b8-a224-2a49025fd596	00080000-5620-a0b8-85d5-850df05b94eb	1001	AK
\.


--
-- TOC entry 3096 (class 0 OID 22097497)
-- Dependencies: 234
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5620-a0b7-8efb-aa1cd2bc91fb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 22097590)
-- Dependencies: 238
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 22097191)
-- Dependencies: 214
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5620-a0b6-46dc-d0d5b55c5969	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5620-a0b6-6838-ae768288c756	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5620-a0b6-b8fa-2683f88f50ba	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5620-a0b6-1028-d8f0d29d4f59	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5620-a0b6-4ea4-747f12ebc741	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5620-a0b6-66b7-01aba65f859e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5620-a0b6-3c24-6845663a9a51	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3068 (class 0 OID 22097135)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22097125)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 22097336)
-- Dependencies: 227
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22097266)
-- Dependencies: 221
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22096998)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 22096771)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5620-a0b8-85d5-850df05b94eb	00010000-5620-a0b5-4862-4a6e60cadbb9	2015-10-16 09:01:12	INS	a:0:{}
2	App\\Entity\\Option	00000000-5620-a0b8-b334-87170497ac93	00010000-5620-a0b5-4862-4a6e60cadbb9	2015-10-16 09:01:12	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5620-a0b8-a224-2a49025fd596	00010000-5620-a0b5-4862-4a6e60cadbb9	2015-10-16 09:01:12	INS	a:0:{}
\.


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3077 (class 0 OID 22097204)
-- Dependencies: 215
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 22096809)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5620-a0b5-1037-f1de5b060cff	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5620-a0b5-5253-3b2cd9bc9c4b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5620-a0b5-76c3-3e22fe6e1ff3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5620-a0b5-fa47-b5287f761c16	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5620-a0b5-0c54-130f51432b15	planer	Planer dogodkov v koledarju	t
00020000-5620-a0b5-646e-fc4896726b3c	kadrovska	Kadrovska služba	t
00020000-5620-a0b5-54eb-11c0913f14f1	arhivar	Ažuriranje arhivalij	t
00020000-5620-a0b5-f0a2-15f28d79a993	igralec	Igralec	t
00020000-5620-a0b5-5b63-1fbb1fd410a8	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5620-a0b6-2b10-9ddf9979a560	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3039 (class 0 OID 22096793)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5620-a0b5-6abd-09884057fa25	00020000-5620-a0b5-76c3-3e22fe6e1ff3
00010000-5620-a0b5-4862-4a6e60cadbb9	00020000-5620-a0b5-76c3-3e22fe6e1ff3
00010000-5620-a0b7-6a09-c169da9fec29	00020000-5620-a0b6-2b10-9ddf9979a560
\.


--
-- TOC entry 3079 (class 0 OID 22097218)
-- Dependencies: 217
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22097156)
-- Dependencies: 209
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 22097102)
-- Dependencies: 203
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 22096758)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5620-a0b5-d2f1-c970364fb8b3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5620-a0b5-2169-5edc6f102089	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5620-a0b5-4072-ca1974e59aa0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5620-a0b5-3d68-4866c63e99ef	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5620-a0b5-2f99-a2118967df37	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3034 (class 0 OID 22096750)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5620-a0b5-b42e-ff1c187dae4f	00230000-5620-a0b5-3d68-4866c63e99ef	popa
00240000-5620-a0b5-7cef-3bf5668a2eb8	00230000-5620-a0b5-3d68-4866c63e99ef	oseba
00240000-5620-a0b5-3c31-e48b3e4ce89e	00230000-5620-a0b5-3d68-4866c63e99ef	tippopa
00240000-5620-a0b5-d992-7470211d3d0a	00230000-5620-a0b5-3d68-4866c63e99ef	organizacijskaenota
00240000-5620-a0b5-93eb-ec649e2e9559	00230000-5620-a0b5-3d68-4866c63e99ef	sezona
00240000-5620-a0b5-6e6d-539eaf3cefde	00230000-5620-a0b5-2169-5edc6f102089	prostor
00240000-5620-a0b5-9dad-41041a1f1242	00230000-5620-a0b5-3d68-4866c63e99ef	besedilo
00240000-5620-a0b5-b73a-e7978b7c305c	00230000-5620-a0b5-3d68-4866c63e99ef	uprizoritev
00240000-5620-a0b5-42de-5f2362be1acc	00230000-5620-a0b5-3d68-4866c63e99ef	funkcija
00240000-5620-a0b5-ba5c-aa7a15ccb8ef	00230000-5620-a0b5-3d68-4866c63e99ef	tipfunkcije
00240000-5620-a0b5-68ee-0ae8979370e9	00230000-5620-a0b5-3d68-4866c63e99ef	alternacija
00240000-5620-a0b5-f8f2-38e2c53abd1f	00230000-5620-a0b5-d2f1-c970364fb8b3	pogodba
00240000-5620-a0b5-dd11-a1acb877c553	00230000-5620-a0b5-3d68-4866c63e99ef	zaposlitev
00240000-5620-a0b5-dd15-d3cc526e09b0	00230000-5620-a0b5-3d68-4866c63e99ef	zvrstuprizoritve
00240000-5620-a0b5-9d1e-e6bf454296fa	00230000-5620-a0b5-d2f1-c970364fb8b3	programdela
00240000-5620-a0b5-d370-ac5d8c0660dd	00230000-5620-a0b5-3d68-4866c63e99ef	zapis
\.


--
-- TOC entry 3033 (class 0 OID 22096745)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5555cafc-b4ea-4de2-8318-9d74fca01200	00240000-5620-a0b5-b42e-ff1c187dae4f	0	1001
\.


--
-- TOC entry 3085 (class 0 OID 22097283)
-- Dependencies: 223
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5620-a0b7-20e4-1321f64f4fe4	000e0000-5620-a0b7-81f0-fa117f080d09	00080000-5620-a0b7-3f74-e45107547156	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5620-a0b5-0a3c-35a96ae54759
00270000-5620-a0b7-5dc8-898a186dd7c8	000e0000-5620-a0b7-81f0-fa117f080d09	00080000-5620-a0b7-3f74-e45107547156	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5620-a0b5-0a3c-35a96ae54759
\.


--
-- TOC entry 3047 (class 0 OID 22096881)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22097112)
-- Dependencies: 204
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5620-a0b7-e9e2-c0bc4ed272cb	00180000-5620-a0b7-ad67-eb5c230f9178	000c0000-5620-a0b7-614e-6df69000a29c	00090000-5620-a0b7-5c46-d698e9f9ecd0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-a0b7-23d6-66483a8d2300	00180000-5620-a0b7-ad67-eb5c230f9178	000c0000-5620-a0b7-bf8c-0ba365ba001a	00090000-5620-a0b7-cbc5-6eb02c63b594	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-a0b7-4daf-d4a5c1c3ddc4	00180000-5620-a0b7-ad67-eb5c230f9178	000c0000-5620-a0b7-7d79-71ef7a484fc6	00090000-5620-a0b7-8506-2cd41e615ae2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-a0b7-6790-e0f9ed2eabec	00180000-5620-a0b7-ad67-eb5c230f9178	000c0000-5620-a0b7-7bd3-2c9af435db00	00090000-5620-a0b7-6d2a-b8b4ac4487d5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-a0b7-5796-42bf63d8df5f	00180000-5620-a0b7-ad67-eb5c230f9178	000c0000-5620-a0b7-8f11-562029c3fab2	00090000-5620-a0b7-83d6-053c9ec199cc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-a0b7-4ed6-873cb6b3f7d6	00180000-5620-a0b7-8f7c-751dde6147d6	\N	00090000-5620-a0b7-83d6-053c9ec199cc	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3088 (class 0 OID 22097324)
-- Dependencies: 226
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5620-a0b4-5c54-2ef6b4a65b41	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5620-a0b4-9b83-67322ed6e600	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5620-a0b4-675e-f60f7bc419a6	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5620-a0b4-187b-333a58dc11c4	04	Režija	Režija	Režija	umetnik	30
000f0000-5620-a0b4-64a6-d41298452990	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5620-a0b4-32c6-f9298f9e3f48	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5620-a0b4-8f6e-4542678f401a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5620-a0b4-0391-dc7fd57bc3d0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5620-a0b4-5c5d-53127ebc866f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5620-a0b4-ecb3-0871ea5efc7a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5620-a0b4-291d-280182adc8a1	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5620-a0b4-7795-a21c92ef1a83	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5620-a0b4-bead-f71d537ce973	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5620-a0b4-cd22-66726fa5d553	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5620-a0b4-bd3a-2165551a319a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5620-a0b4-25ce-b9433c85a5b6	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5620-a0b4-d10a-8090bb8defd8	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5620-a0b4-ab5c-bb932af7c36c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3044 (class 0 OID 22096835)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5620-a0b6-82a6-8fee4e2bc9f1	0001	šola	osnovna ali srednja šola
00400000-5620-a0b6-25cc-2060339956cb	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5620-a0b6-6beb-b747e3c2b0f0	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3101 (class 0 OID 22097601)
-- Dependencies: 239
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5620-a0b4-d496-fce10e8ecb35	01	Velika predstava	f	1.00	1.00
002b0000-5620-a0b4-f105-49d87fb14c45	02	Mala predstava	f	0.50	0.50
002b0000-5620-a0b4-d234-c83e2bef6745	03	Mala koprodukcija	t	0.40	1.00
002b0000-5620-a0b4-7f0a-5e35de3d65ae	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5620-a0b4-04d1-8d6da7f4835f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3064 (class 0 OID 22097092)
-- Dependencies: 202
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 22096955)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 22096780)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5620-a0b5-4862-4a6e60cadbb9	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROjwYpwONxVPgd8/xHwFxTwN6hLKy9Hqa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-b3fd-f23be3fdcf2c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-e10e-aa9fba9e3f6c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-dfd5-216d568bee15	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-a6cd-0ec13274d896	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-f1d9-28902df22d0c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-7c77-50c166510e93	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-7faa-5517127ca1f5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-6b6d-8bd45b19cde7	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-63ff-e1806d488d70	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5620-a0b7-6a09-c169da9fec29	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5620-a0b5-6abd-09884057fa25	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3092 (class 0 OID 22097374)
-- Dependencies: 230
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5620-a0b7-41ae-1e53d5f839cd	00160000-5620-a0b6-ff07-6a0340f9bbf0	\N	00140000-5620-a0b5-17ce-f518c1d86d91	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5620-a0b6-4ea4-747f12ebc741
000e0000-5620-a0b7-81f0-fa117f080d09	00160000-5620-a0b6-038f-dcc403031a83	\N	00140000-5620-a0b5-aada-2fd1494b5903	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5620-a0b6-66b7-01aba65f859e
000e0000-5620-a0b7-8c96-16255dd79ea2	\N	\N	00140000-5620-a0b5-aada-2fd1494b5903	00190000-5620-a0b7-b778-e39b98652fc3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-a0b6-4ea4-747f12ebc741
000e0000-5620-a0b7-36e4-f5b64fdccd56	\N	\N	00140000-5620-a0b5-aada-2fd1494b5903	00190000-5620-a0b7-b778-e39b98652fc3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-a0b6-4ea4-747f12ebc741
000e0000-5620-a0b7-967c-6da5636c3ed5	\N	\N	00140000-5620-a0b5-aada-2fd1494b5903	00190000-5620-a0b7-b778-e39b98652fc3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-a0b6-46dc-d0d5b55c5969
000e0000-5620-a0b7-ab7d-b836922b2a49	\N	\N	00140000-5620-a0b5-aada-2fd1494b5903	00190000-5620-a0b7-b778-e39b98652fc3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-a0b6-46dc-d0d5b55c5969
\.


--
-- TOC entry 3060 (class 0 OID 22097046)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5620-a0b7-a9eb-65afc3318ecb	000e0000-5620-a0b7-81f0-fa117f080d09	\N	1	
00200000-5620-a0b7-56dd-b51961163fed	000e0000-5620-a0b7-81f0-fa117f080d09	\N	2	
00200000-5620-a0b7-45ff-09b6e893b071	000e0000-5620-a0b7-81f0-fa117f080d09	\N	3	
00200000-5620-a0b7-b5f3-f5333fa0411b	000e0000-5620-a0b7-81f0-fa117f080d09	\N	4	
00200000-5620-a0b7-4ca7-59f6ab5f67fe	000e0000-5620-a0b7-81f0-fa117f080d09	\N	5	
\.


--
-- TOC entry 3075 (class 0 OID 22097183)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 22097297)
-- Dependencies: 224
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5620-a0b5-5b42-c5685613775c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5620-a0b5-b6c0-b7a168ab76ac	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5620-a0b5-2106-a26e2b91dc5c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5620-a0b5-fea5-4c5a276b220d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5620-a0b5-0e7a-864a184b6505	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5620-a0b5-fdd2-f48aa53bfee3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5620-a0b5-6552-14ac57346310	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5620-a0b5-300c-10a23d9e1436	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5620-a0b5-0a3c-35a96ae54759	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5620-a0b5-7687-a69091f1cddf	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5620-a0b5-e2f6-1c279c18c8ae	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5620-a0b5-f475-50154ff598aa	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5620-a0b5-eea0-b66f19317837	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5620-a0b5-34b5-b8d3f1c35a80	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5620-a0b5-dcbb-64f50b9dc87b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5620-a0b5-5a77-617b1e3ead54	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5620-a0b5-0931-abf273c2873b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5620-a0b5-a396-cd5bf88246f0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5620-a0b5-b503-e6b290dff2db	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5620-a0b5-ba9c-4d1edcb0532b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5620-a0b5-28d4-afbf39e7985d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5620-a0b5-7389-a4c2655114ac	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5620-a0b5-1371-122e95ccff3d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5620-a0b5-5735-7bdca48449c8	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5620-a0b5-5f42-68829ec02f31	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5620-a0b5-93ad-994357f73b8b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5620-a0b5-e15b-2ce25e1fb880	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5620-a0b5-6ba8-c5edcc0c1ab6	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3104 (class 0 OID 22097648)
-- Dependencies: 242
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22097620)
-- Dependencies: 241
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 22097660)
-- Dependencies: 243
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 22097255)
-- Dependencies: 220
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5620-a0b7-5756-3b9582acd89c	00090000-5620-a0b7-cbc5-6eb02c63b594	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-a0b7-db42-9d916dff9d08	00090000-5620-a0b7-8506-2cd41e615ae2	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-a0b7-bf3a-95492cfa552f	00090000-5620-a0b7-4bde-d0f8e068e2df	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-a0b7-f7e3-a86a06d75503	00090000-5620-a0b7-3680-e639d2049dee	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-a0b7-35d3-cf45c90fd91e	00090000-5620-a0b7-5c46-d698e9f9ecd0	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-a0b7-3a0a-4bd4e1628597	00090000-5620-a0b7-e462-f1573253170c	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3062 (class 0 OID 22097081)
-- Dependencies: 200
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 22097364)
-- Dependencies: 229
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5620-a0b5-17ce-f518c1d86d91	01	Drama	drama (SURS 01)
00140000-5620-a0b5-cc57-28c6ebd92c10	02	Opera	opera (SURS 02)
00140000-5620-a0b5-507e-39813b30fa82	03	Balet	balet (SURS 03)
00140000-5620-a0b5-ad05-a911f3e68bac	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5620-a0b5-5b73-8ac732ed5881	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5620-a0b5-aada-2fd1494b5903	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5620-a0b5-3f49-da3cd334a9c6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3081 (class 0 OID 22097245)
-- Dependencies: 219
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2544 (class 2606 OID 22096834)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 22097423)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 22097413)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22097280)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 22097322)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 22097700)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22097070)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 22097091)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22097618)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 22096981)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 22097491)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22097241)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 22097044)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 22097019)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 22096995)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 22097148)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 22097677)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 22097684)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2814 (class 2606 OID 22097708)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 22028085)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2671 (class 2606 OID 22097175)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 22096953)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 22096853)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 22096915)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 22096877)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 22096823)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2535 (class 2606 OID 22096808)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22097181)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 22097217)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22097359)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 22096905)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 22096941)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 22097570)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 22097154)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 22096931)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 22097032)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 22097166)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 22097579)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22097587)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 22097557)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 22097599)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 22097199)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 22097139)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 22097130)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22097346)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22097273)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 22097007)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 22096779)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22097208)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 22096797)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2537 (class 2606 OID 22096817)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 22097226)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22097161)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 22097110)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 22096767)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 22096755)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 22096749)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 22097293)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 22096886)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 22097121)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 22097333)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 22096842)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22097611)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 22097099)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 22096966)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 22096792)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 22097392)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 22097054)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22097189)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22097305)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 22097658)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22097642)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 22097666)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 22097263)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 22097085)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22097372)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22097253)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 1259 OID 22097079)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2620 (class 1259 OID 22097080)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2621 (class 1259 OID 22097078)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2622 (class 1259 OID 22097077)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2623 (class 1259 OID 22097076)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2714 (class 1259 OID 22097294)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2715 (class 1259 OID 22097295)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 22097296)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 22097679)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2801 (class 1259 OID 22097678)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2562 (class 1259 OID 22096907)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2563 (class 1259 OID 22096908)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2672 (class 1259 OID 22097182)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2787 (class 1259 OID 22097646)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2788 (class 1259 OID 22097645)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2789 (class 1259 OID 22097647)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2790 (class 1259 OID 22097644)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2791 (class 1259 OID 22097643)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2666 (class 1259 OID 22097168)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2667 (class 1259 OID 22097167)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2614 (class 1259 OID 22097055)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 22097242)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 22097244)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2698 (class 1259 OID 22097243)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2594 (class 1259 OID 22096997)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 22096996)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22097600)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2730 (class 1259 OID 22097361)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 22097362)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 22097363)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2797 (class 1259 OID 22097667)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2739 (class 1259 OID 22097397)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2740 (class 1259 OID 22097394)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2741 (class 1259 OID 22097398)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2742 (class 1259 OID 22097396)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2743 (class 1259 OID 22097395)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2584 (class 1259 OID 22096968)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 22096967)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2553 (class 1259 OID 22096880)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2684 (class 1259 OID 22097209)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2539 (class 1259 OID 22096824)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2540 (class 1259 OID 22096825)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2689 (class 1259 OID 22097229)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 22097228)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2691 (class 1259 OID 22097227)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2567 (class 1259 OID 22096918)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2568 (class 1259 OID 22096917)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2569 (class 1259 OID 22096919)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2607 (class 1259 OID 22097033)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2608 (class 1259 OID 22097034)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2519 (class 1259 OID 22096757)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2646 (class 1259 OID 22097134)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2647 (class 1259 OID 22097132)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2648 (class 1259 OID 22097131)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2649 (class 1259 OID 22097133)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2530 (class 1259 OID 22096798)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2531 (class 1259 OID 22096799)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2675 (class 1259 OID 22097190)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2810 (class 1259 OID 22097701)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2712 (class 1259 OID 22097282)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2713 (class 1259 OID 22097281)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2811 (class 1259 OID 22097709)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2812 (class 1259 OID 22097710)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2661 (class 1259 OID 22097155)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2706 (class 1259 OID 22097274)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2707 (class 1259 OID 22097275)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 22097496)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2761 (class 1259 OID 22097495)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2762 (class 1259 OID 22097492)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 22097493)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2764 (class 1259 OID 22097494)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2573 (class 1259 OID 22096933)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2574 (class 1259 OID 22096932)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2575 (class 1259 OID 22096934)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 22097203)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2679 (class 1259 OID 22097202)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2770 (class 1259 OID 22097580)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2771 (class 1259 OID 22097581)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2753 (class 1259 OID 22097427)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 22097428)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2755 (class 1259 OID 22097425)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2756 (class 1259 OID 22097426)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2702 (class 1259 OID 22097264)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2703 (class 1259 OID 22097265)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2652 (class 1259 OID 22097143)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2653 (class 1259 OID 22097142)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 22097140)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2655 (class 1259 OID 22097141)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2749 (class 1259 OID 22097415)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 22097414)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 22097008)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2601 (class 1259 OID 22097022)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2602 (class 1259 OID 22097021)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2603 (class 1259 OID 22097020)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2604 (class 1259 OID 22097023)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2613 (class 1259 OID 22097045)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 22097571)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2786 (class 1259 OID 22097619)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2804 (class 1259 OID 22097685)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2805 (class 1259 OID 22097686)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2549 (class 1259 OID 22096855)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2550 (class 1259 OID 22096854)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2558 (class 1259 OID 22096887)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2559 (class 1259 OID 22096888)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2629 (class 1259 OID 22097086)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 22097124)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 22097123)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2643 (class 1259 OID 22097122)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 22097072)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2625 (class 1259 OID 22097073)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2626 (class 1259 OID 22097071)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2627 (class 1259 OID 22097075)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2628 (class 1259 OID 22097074)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2566 (class 1259 OID 22096906)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 22096843)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 22096844)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2590 (class 1259 OID 22096982)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 22096984)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2592 (class 1259 OID 22096983)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2593 (class 1259 OID 22096985)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2660 (class 1259 OID 22097149)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 22097360)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22097393)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 22097334)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 22097335)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2556 (class 1259 OID 22096878)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 22096879)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2699 (class 1259 OID 22097254)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 22096768)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 22096954)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2572 (class 1259 OID 22096916)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 22096756)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2783 (class 1259 OID 22097612)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 22097201)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2683 (class 1259 OID 22097200)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 22097100)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 22097101)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2757 (class 1259 OID 22097424)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 22096942)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 22097373)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 22097659)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2776 (class 1259 OID 22097588)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 22097589)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2723 (class 1259 OID 22097323)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2640 (class 1259 OID 22097111)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2538 (class 1259 OID 22096818)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2849 (class 2606 OID 22097861)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2848 (class 2606 OID 22097866)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2844 (class 2606 OID 22097886)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2850 (class 2606 OID 22097856)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2846 (class 2606 OID 22097876)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2845 (class 2606 OID 22097881)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2847 (class 2606 OID 22097871)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2886 (class 2606 OID 22098056)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2885 (class 2606 OID 22098061)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2884 (class 2606 OID 22098066)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 22098231)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2919 (class 2606 OID 22098226)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 22097766)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2826 (class 2606 OID 22097771)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2867 (class 2606 OID 22097971)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2913 (class 2606 OID 22098211)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 22098206)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2912 (class 2606 OID 22098216)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 22098201)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2916 (class 2606 OID 22098196)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2865 (class 2606 OID 22097966)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2866 (class 2606 OID 22097961)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2843 (class 2606 OID 22097851)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2877 (class 2606 OID 22098011)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2875 (class 2606 OID 22098021)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2876 (class 2606 OID 22098016)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2836 (class 2606 OID 22097821)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2837 (class 2606 OID 22097816)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 22097951)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2910 (class 2606 OID 22098186)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2889 (class 2606 OID 22098071)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 22098076)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2887 (class 2606 OID 22098081)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2917 (class 2606 OID 22098221)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2891 (class 2606 OID 22098101)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2894 (class 2606 OID 22098086)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2890 (class 2606 OID 22098106)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2892 (class 2606 OID 22098096)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2893 (class 2606 OID 22098091)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2834 (class 2606 OID 22097811)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2835 (class 2606 OID 22097806)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2822 (class 2606 OID 22097751)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2823 (class 2606 OID 22097746)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 22097991)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2819 (class 2606 OID 22097726)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2818 (class 2606 OID 22097731)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2872 (class 2606 OID 22098006)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2873 (class 2606 OID 22098001)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2874 (class 2606 OID 22097996)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2829 (class 2606 OID 22097781)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 22097776)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2828 (class 2606 OID 22097786)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2841 (class 2606 OID 22097836)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2840 (class 2606 OID 22097841)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2815 (class 2606 OID 22097711)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2855 (class 2606 OID 22097926)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2857 (class 2606 OID 22097916)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2858 (class 2606 OID 22097911)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2856 (class 2606 OID 22097921)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2817 (class 2606 OID 22097716)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 22097721)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2868 (class 2606 OID 22097976)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2922 (class 2606 OID 22098246)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 22098051)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2883 (class 2606 OID 22098046)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2924 (class 2606 OID 22098251)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2923 (class 2606 OID 22098256)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2864 (class 2606 OID 22097956)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2881 (class 2606 OID 22098036)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2880 (class 2606 OID 22098041)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2901 (class 2606 OID 22098161)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2902 (class 2606 OID 22098156)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2905 (class 2606 OID 22098141)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2904 (class 2606 OID 22098146)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2903 (class 2606 OID 22098151)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2832 (class 2606 OID 22097796)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 22097791)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 22097801)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2869 (class 2606 OID 22097986)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2870 (class 2606 OID 22097981)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2908 (class 2606 OID 22098171)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2907 (class 2606 OID 22098176)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2898 (class 2606 OID 22098131)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 22098136)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2900 (class 2606 OID 22098121)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2899 (class 2606 OID 22098126)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2879 (class 2606 OID 22098026)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2878 (class 2606 OID 22098031)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2859 (class 2606 OID 22097946)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2860 (class 2606 OID 22097941)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2862 (class 2606 OID 22097931)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2861 (class 2606 OID 22097936)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2895 (class 2606 OID 22098116)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 22098111)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2838 (class 2606 OID 22097826)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2839 (class 2606 OID 22097831)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 22097846)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2906 (class 2606 OID 22098166)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2909 (class 2606 OID 22098181)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 22098191)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2921 (class 2606 OID 22098236)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2920 (class 2606 OID 22098241)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 22097741)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2821 (class 2606 OID 22097736)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2825 (class 2606 OID 22097756)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 22097761)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2851 (class 2606 OID 22097891)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 22097906)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 22097901)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2854 (class 2606 OID 22097896)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-16 09:01:14 CEST

--
-- PostgreSQL database dump complete
--

