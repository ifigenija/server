--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-15 17:55:37 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 247 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 247
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22095318)
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
-- TOC entry 231 (class 1259 OID 22095898)
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
-- TOC entry 230 (class 1259 OID 22095881)
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
-- TOC entry 221 (class 1259 OID 22095758)
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
-- TOC entry 224 (class 1259 OID 22095788)
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
-- TOC entry 245 (class 1259 OID 22096169)
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
-- TOC entry 199 (class 1259 OID 22095548)
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
-- TOC entry 201 (class 1259 OID 22095579)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 22096095)
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
-- TOC entry 192 (class 1259 OID 22095461)
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
-- TOC entry 232 (class 1259 OID 22095911)
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
-- TOC entry 217 (class 1259 OID 22095712)
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
-- TOC entry 197 (class 1259 OID 22095527)
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
-- TOC entry 195 (class 1259 OID 22095501)
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
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22095478)
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
-- TOC entry 206 (class 1259 OID 22095626)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 243 (class 1259 OID 22096150)
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
-- TOC entry 244 (class 1259 OID 22096162)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 22096184)
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
-- TOC entry 210 (class 1259 OID 22095651)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22095435)
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
-- TOC entry 183 (class 1259 OID 22095337)
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
-- TOC entry 187 (class 1259 OID 22095401)
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
-- TOC entry 184 (class 1259 OID 22095348)
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
-- TOC entry 178 (class 1259 OID 22095292)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22095311)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 22095658)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 22095692)
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
-- TOC entry 227 (class 1259 OID 22095829)
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
-- TOC entry 186 (class 1259 OID 22095381)
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
-- TOC entry 189 (class 1259 OID 22095427)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 22096040)
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
-- TOC entry 207 (class 1259 OID 22095632)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22095412)
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
-- TOC entry 196 (class 1259 OID 22095516)
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
-- TOC entry 209 (class 1259 OID 22095644)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 22096054)
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
-- TOC entry 236 (class 1259 OID 22096064)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 22095979)
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
-- TOC entry 237 (class 1259 OID 22096072)
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
-- TOC entry 213 (class 1259 OID 22095673)
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
-- TOC entry 205 (class 1259 OID 22095617)
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
-- TOC entry 204 (class 1259 OID 22095607)
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
-- TOC entry 226 (class 1259 OID 22095818)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 22095748)
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
-- TOC entry 194 (class 1259 OID 22095490)
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
-- TOC entry 175 (class 1259 OID 22095263)
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
-- TOC entry 174 (class 1259 OID 22095261)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 214 (class 1259 OID 22095686)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22095301)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22095285)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 22095700)
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
-- TOC entry 208 (class 1259 OID 22095638)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 22095584)
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
-- TOC entry 173 (class 1259 OID 22095250)
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
-- TOC entry 172 (class 1259 OID 22095242)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22095237)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 222 (class 1259 OID 22095765)
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
-- TOC entry 185 (class 1259 OID 22095373)
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
-- TOC entry 203 (class 1259 OID 22095594)
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
-- TOC entry 225 (class 1259 OID 22095806)
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
-- TOC entry 182 (class 1259 OID 22095327)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 238 (class 1259 OID 22096083)
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
-- TOC entry 191 (class 1259 OID 22095447)
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
-- TOC entry 176 (class 1259 OID 22095272)
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
-- TOC entry 229 (class 1259 OID 22095856)
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
-- TOC entry 198 (class 1259 OID 22095538)
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
-- TOC entry 212 (class 1259 OID 22095665)
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
-- TOC entry 223 (class 1259 OID 22095779)
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
-- TOC entry 241 (class 1259 OID 22096130)
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
-- TOC entry 240 (class 1259 OID 22096102)
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
-- TOC entry 242 (class 1259 OID 22096142)
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
-- TOC entry 219 (class 1259 OID 22095737)
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
-- TOC entry 200 (class 1259 OID 22095573)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 228 (class 1259 OID 22095846)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 218 (class 1259 OID 22095727)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2210 (class 2604 OID 22095266)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3034 (class 0 OID 22095318)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22095898)
-- Dependencies: 231
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561f-cc76-7f8d-75cca0b7d5ec	000d0000-561f-cc76-d4d6-4b476ef5fb34	\N	00090000-561f-cc75-5c14-b49d5da76573	000b0000-561f-cc75-69ea-07bf53b4cd22	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561f-cc76-a23b-a17e9e76858f	000d0000-561f-cc76-f8c0-e9c7d3fd2842	00100000-561f-cc75-42b3-7baaf7e34bc1	00090000-561f-cc75-7545-426f1b9f549d	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561f-cc76-8162-290f09535b0d	000d0000-561f-cc76-af33-1fc712ff0f85	00100000-561f-cc75-ac90-abf61de320aa	00090000-561f-cc75-7a5c-39976bddb9b4	\N	0003	t	\N	2015-10-15	\N	2	t	\N	f	f
000c0000-561f-cc76-3356-110a1dc5e442	000d0000-561f-cc76-80db-76d0644edd71	\N	00090000-561f-cc75-69ef-db6b9cd5249f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561f-cc76-88a5-e5ed6a9ceaa7	000d0000-561f-cc76-e2d9-0159d99335da	\N	00090000-561f-cc75-2433-b1649c87c4e7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561f-cc76-7aff-76ff411b5440	000d0000-561f-cc76-40ed-d28f0e4e121e	\N	00090000-561f-cc75-5f81-9548f8b750e5	000b0000-561f-cc75-8fa5-f4ab709bccc2	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561f-cc76-8bbb-8ddadafba6b6	000d0000-561f-cc76-447c-b8563f08389d	00100000-561f-cc75-a163-3800c93960e9	00090000-561f-cc75-545c-0b5b3020b61f	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561f-cc76-c84b-7360abf0ff3c	000d0000-561f-cc76-38e4-8ca388a81c31	\N	00090000-561f-cc75-f5aa-1e32cdb34e76	000b0000-561f-cc75-6143-274717abda34	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561f-cc76-c08d-8dba0d1f8443	000d0000-561f-cc76-447c-b8563f08389d	00100000-561f-cc75-be3f-26b5f548a2ba	00090000-561f-cc75-51fe-e4fabaed3c32	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561f-cc76-8393-9a35092c2d95	000d0000-561f-cc76-447c-b8563f08389d	00100000-561f-cc75-2640-a8ed16703d92	00090000-561f-cc75-0792-645ca663b2eb	\N	0010	t	\N	2015-10-15	\N	16	f	\N	f	t
000c0000-561f-cc76-1674-96d293007092	000d0000-561f-cc76-447c-b8563f08389d	00100000-561f-cc75-d600-bd72837c0281	00090000-561f-cc75-e872-d8963a4b77c1	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561f-cc76-bee8-c486b0a2ce48	000d0000-561f-cc76-45d4-16f415b90fe1	\N	00090000-561f-cc75-7545-426f1b9f549d	000b0000-561f-cc75-2b7c-cc530874664e	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3083 (class 0 OID 22095881)
-- Dependencies: 230
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 22095758)
-- Dependencies: 221
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561f-cc75-ff46-53255b0df3f2	00160000-561f-cc74-bbb4-f6825d995326	00090000-561f-cc75-36ee-8c7730efe66b	aizv	10	t
003d0000-561f-cc75-137b-ef66717c0089	00160000-561f-cc74-bbb4-f6825d995326	00090000-561f-cc75-8191-462958c72893	apri	14	t
003d0000-561f-cc75-b3cc-9e7ce929c3d1	00160000-561f-cc74-f282-3bdafedcc648	00090000-561f-cc75-ee10-c96e303ed3e4	aizv	11	t
003d0000-561f-cc75-42ef-4d5fdd6bd45e	00160000-561f-cc75-6bdd-3989409cbc90	00090000-561f-cc75-2ccd-ced64c834c5f	aizv	12	t
003d0000-561f-cc75-a911-f669ddf7affb	00160000-561f-cc74-bbb4-f6825d995326	00090000-561f-cc75-cd6d-9f4ad1ad5dac	apri	18	f
\.


--
-- TOC entry 3077 (class 0 OID 22095788)
-- Dependencies: 224
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561f-cc74-bbb4-f6825d995326	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561f-cc74-f282-3bdafedcc648	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561f-cc75-6bdd-3989409cbc90	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3098 (class 0 OID 22096169)
-- Dependencies: 245
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 22095548)
-- Dependencies: 199
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561f-cc76-e133-0517af667730	\N	\N	00200000-561f-cc76-7e68-a47ec407e8f4	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561f-cc76-dd31-eb688ae01457	\N	\N	00200000-561f-cc76-f0c8-f074b226be86	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561f-cc76-5d88-554e1afcd61c	\N	\N	00200000-561f-cc76-8e30-7656b3715483	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561f-cc76-cc50-0e3fee00be1b	\N	\N	00200000-561f-cc76-53a8-f7d452634269	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561f-cc76-a38a-b9c523837748	\N	\N	00200000-561f-cc76-261d-68624c51bc8d	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3054 (class 0 OID 22095579)
-- Dependencies: 201
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22096095)
-- Dependencies: 239
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3045 (class 0 OID 22095461)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561f-cc72-963f-28441412a714	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561f-cc72-eb06-946a73215dd5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561f-cc72-0fee-3d1ae0eac80b	AL	ALB	008	Albania 	Albanija	\N
00040000-561f-cc72-a5ae-3e30bcde10be	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561f-cc72-9a18-d6640f9c4a03	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561f-cc72-7667-bcd2a1ee9d33	AD	AND	020	Andorra 	Andora	\N
00040000-561f-cc72-d169-a80b89adfb73	AO	AGO	024	Angola 	Angola	\N
00040000-561f-cc72-4b55-6c67aa9541c4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561f-cc72-4eb1-7e2bf84eabb7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561f-cc72-360a-f5af68cadcdd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-cc72-055c-b6b7380258c5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561f-cc72-f8f9-35167cda21dd	AM	ARM	051	Armenia 	Armenija	\N
00040000-561f-cc72-7d1b-b58ff502abbb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561f-cc72-bfdf-5c3f923e5c5d	AU	AUS	036	Australia 	Avstralija	\N
00040000-561f-cc72-429f-36b28bb23bd0	AT	AUT	040	Austria 	Avstrija	\N
00040000-561f-cc72-3bc2-09e3885c90a1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561f-cc72-c3f1-3847fefc33c4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561f-cc72-8a8a-d1b356f375d0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561f-cc72-5da8-f7170ce5e52a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561f-cc72-6c2a-4164b50b3386	BB	BRB	052	Barbados 	Barbados	\N
00040000-561f-cc72-05bf-1e38a12f86b5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561f-cc72-ec31-3dca62a5a9db	BE	BEL	056	Belgium 	Belgija	\N
00040000-561f-cc72-6974-183ff4a82925	BZ	BLZ	084	Belize 	Belize	\N
00040000-561f-cc72-44b2-c30d06cbeed8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561f-cc72-5a7f-7034795ef529	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561f-cc72-41c0-f3eb4b7bc4e9	BT	BTN	064	Bhutan 	Butan	\N
00040000-561f-cc72-bd84-ab54ed129508	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561f-cc72-34c3-215011fad863	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561f-cc72-fff6-91f1fa681448	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561f-cc72-794f-55a3d207fb40	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561f-cc72-073d-943eea6dc455	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561f-cc72-2d75-907cb28169e4	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561f-cc72-8add-ef30729949c0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561f-cc72-0e0a-e1003bf2cf0f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561f-cc72-3c18-b9b1c351ae0f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561f-cc72-5bdd-932b9f173180	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561f-cc72-8f10-04f4f7db8505	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561f-cc72-05c1-0768089c5c51	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561f-cc72-bdc3-15ac0897aa53	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561f-cc72-4552-eaf8708b7c20	CA	CAN	124	Canada 	Kanada	\N
00040000-561f-cc72-e528-3efb662cb9ee	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561f-cc72-7888-5e2004a5f757	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561f-cc72-17e6-a5741e967287	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561f-cc72-efd0-cc50c40b6d98	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561f-cc72-49c6-095c99dd7506	CL	CHL	152	Chile 	Čile	\N
00040000-561f-cc72-4e25-e4cccbdc06db	CN	CHN	156	China 	Kitajska	\N
00040000-561f-cc72-8020-a3620700e1b0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561f-cc72-b12a-987f1952b591	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561f-cc72-9238-3931faeff3a4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561f-cc72-d7bd-446c3043965f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561f-cc72-0c3c-e02ea94697f4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561f-cc72-74de-ad9429c00d48	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561f-cc72-78b6-40c8a669c3f7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561f-cc72-1fbe-3d657c326ced	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561f-cc72-9b35-e341c4de79d2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561f-cc72-1e12-550bd377fecd	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561f-cc72-6a6c-40d5b47c340e	CU	CUB	192	Cuba 	Kuba	\N
00040000-561f-cc72-c925-c537f42d73fc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561f-cc72-111e-176a64865f38	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561f-cc72-f8ad-377fcffe52d2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561f-cc72-7a5a-9c151694b41d	DK	DNK	208	Denmark 	Danska	\N
00040000-561f-cc72-5719-f5376ef1261b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561f-cc72-3960-1976fd6e44c2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-cc72-7aff-789381d70394	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561f-cc72-fde9-74f92bf4f32a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561f-cc72-52a4-1d1d9e1eb8c5	EG	EGY	818	Egypt 	Egipt	\N
00040000-561f-cc72-192f-d3a0ded73d0e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561f-cc72-07e0-51c5fb30e10f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561f-cc72-01d9-b30dc46f5e7f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561f-cc72-22c1-72c69436243b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561f-cc72-21e6-02838be85945	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561f-cc72-1bf8-42e8f202915d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561f-cc72-eb86-3fd457c13b74	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561f-cc72-8aa8-426d96625d85	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561f-cc72-47ee-04a4529eddc6	FI	FIN	246	Finland 	Finska	\N
00040000-561f-cc72-4dfd-c206b16d63cc	FR	FRA	250	France 	Francija	\N
00040000-561f-cc72-d753-e3eb81df539d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561f-cc72-a13e-37e75e81f040	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561f-cc72-5441-f7f3efcbddab	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561f-cc72-65e6-a60e0216746b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561f-cc72-5886-36e64c484afb	GA	GAB	266	Gabon 	Gabon	\N
00040000-561f-cc72-a5bd-c3fdd6584387	GM	GMB	270	Gambia 	Gambija	\N
00040000-561f-cc72-7e18-3ca7042bb035	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561f-cc72-f1e9-f020a2c41e57	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561f-cc72-8689-37855a81f5e5	GH	GHA	288	Ghana 	Gana	\N
00040000-561f-cc72-c6d8-22469e4e7163	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561f-cc72-0a4a-e0923823edf6	GR	GRC	300	Greece 	Grčija	\N
00040000-561f-cc72-9d17-47a811ece616	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561f-cc72-7fe5-3a75075d0ed2	GD	GRD	308	Grenada 	Grenada	\N
00040000-561f-cc72-2a6a-e70b484b661f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561f-cc72-f4c9-f1b52d6d880a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561f-cc72-2def-d906a6033f43	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561f-cc72-27a8-5e8099a0dd9f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561f-cc72-9412-1928cd9e0a24	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561f-cc72-cf79-52725aab9fba	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561f-cc72-db2e-aaaefa21c863	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561f-cc72-262e-3c5e433182b5	HT	HTI	332	Haiti 	Haiti	\N
00040000-561f-cc72-eebe-b3b8b8f36adf	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561f-cc72-1793-4a0c84df87d6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561f-cc72-563e-5b9376d4e01c	HN	HND	340	Honduras 	Honduras	\N
00040000-561f-cc72-9279-a11472eb3c2a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561f-cc72-590c-7d5dc21a3b8d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561f-cc72-f64b-7f66cac2241d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561f-cc72-5d39-4fff6e88f90a	IN	IND	356	India 	Indija	\N
00040000-561f-cc72-3adf-1b7ba30a7ddf	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561f-cc72-ebda-47bc8bac9caf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561f-cc72-3153-f39ec7fa6ed2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561f-cc72-5ea1-04a961b03239	IE	IRL	372	Ireland 	Irska	\N
00040000-561f-cc72-8501-8f98d4fe811d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561f-cc72-7755-9ee9005ea45f	IL	ISR	376	Israel 	Izrael	\N
00040000-561f-cc72-267a-46e25bd8667b	IT	ITA	380	Italy 	Italija	\N
00040000-561f-cc72-fbbe-c57c639a39f4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561f-cc72-f7a7-c4ac23f79758	JP	JPN	392	Japan 	Japonska	\N
00040000-561f-cc72-055a-5763ae13171c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561f-cc72-766d-f85104f6f0ca	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561f-cc72-e1f7-778de74c8ba0	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561f-cc72-ed06-61398f28672f	KE	KEN	404	Kenya 	Kenija	\N
00040000-561f-cc72-ad1d-8d91769fac20	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561f-cc72-f934-e483d85216ef	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561f-cc72-e7fd-d656d12d89ad	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561f-cc72-4d96-a3999fafd6d1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561f-cc72-1c44-0e260389e13a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561f-cc72-75f0-a5b0c2f0fb70	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561f-cc72-f1e7-f5797351e2b5	LV	LVA	428	Latvia 	Latvija	\N
00040000-561f-cc72-1b05-98139b196484	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561f-cc72-b4a2-96ad42742cd6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561f-cc72-2366-a38eb707ad26	LR	LBR	430	Liberia 	Liberija	\N
00040000-561f-cc72-1c40-9a12c868734d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561f-cc72-931b-e0a07495cb55	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561f-cc72-fb6e-51f263892067	LT	LTU	440	Lithuania 	Litva	\N
00040000-561f-cc72-e109-49287061a711	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561f-cc72-7f67-595b4ef266e3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561f-cc72-bc9a-0526661adbcf	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561f-cc72-6d18-55aad383a3b3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561f-cc72-7e6f-1a0b99ad7c31	MW	MWI	454	Malawi 	Malavi	\N
00040000-561f-cc72-538e-a2ab7ba06e46	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561f-cc72-77f5-5b055304ba74	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561f-cc72-ca66-41031c5aa11f	ML	MLI	466	Mali 	Mali	\N
00040000-561f-cc72-7080-9065a6c0811f	MT	MLT	470	Malta 	Malta	\N
00040000-561f-cc72-8276-2375060e6d62	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561f-cc72-2fe8-c7b85835fd69	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561f-cc72-667a-769b33f645a1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561f-cc72-610e-9c145d21a00c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561f-cc72-9ffc-854e2465b0c0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561f-cc72-2760-eeec2f2a9df2	MX	MEX	484	Mexico 	Mehika	\N
00040000-561f-cc72-59bb-bab675140c04	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561f-cc72-2859-49da3c8b657e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561f-cc72-8111-5f0642d13220	MC	MCO	492	Monaco 	Monako	\N
00040000-561f-cc72-1841-140751602ae1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561f-cc72-97f8-9630f77a16f2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561f-cc72-792c-2bc523f6cef7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561f-cc72-ca4f-a296b0ab4176	MA	MAR	504	Morocco 	Maroko	\N
00040000-561f-cc72-0c4e-60816c385daf	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561f-cc72-4ad1-51333c1b9aca	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561f-cc72-72d3-a4d370148df0	NA	NAM	516	Namibia 	Namibija	\N
00040000-561f-cc72-b83e-92f363d667d6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561f-cc72-76bd-5c7bd0cb2f1b	NP	NPL	524	Nepal 	Nepal	\N
00040000-561f-cc72-5e05-8d582b034608	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561f-cc72-aacd-f76184c2b8e4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561f-cc72-264e-006c2268753f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561f-cc72-287c-176402cce1fc	NE	NER	562	Niger 	Niger 	\N
00040000-561f-cc72-5fcf-81ae3bde1234	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561f-cc72-c335-dcc245a4feb9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561f-cc72-ec10-4f989642ff73	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561f-cc72-4ad8-fe1db077c366	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561f-cc72-9d0e-258867e8d365	NO	NOR	578	Norway 	Norveška	\N
00040000-561f-cc72-19f2-48741a835839	OM	OMN	512	Oman 	Oman	\N
00040000-561f-cc72-240e-fd7fa3f5fac6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561f-cc72-b67b-f9f78cfb1cde	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561f-cc72-232e-38f6dc6f0132	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561f-cc72-7cc7-6449cecf4158	PA	PAN	591	Panama 	Panama	\N
00040000-561f-cc72-3764-fa9aee4e7fad	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561f-cc72-e6d3-bb0f832eb532	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561f-cc72-331d-d86015a4a898	PE	PER	604	Peru 	Peru	\N
00040000-561f-cc72-2fa1-8d372f2db881	PH	PHL	608	Philippines 	Filipini	\N
00040000-561f-cc72-3da2-92d6786429c1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561f-cc72-1705-2987ffe4bac4	PL	POL	616	Poland 	Poljska	\N
00040000-561f-cc72-1c62-4d60c4ebbc2b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561f-cc72-3a1f-4888944ab970	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561f-cc72-146d-e862d505c32d	QA	QAT	634	Qatar 	Katar	\N
00040000-561f-cc72-ae16-5ad0d8e67792	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561f-cc72-9982-43c9a8800a58	RO	ROU	642	Romania 	Romunija	\N
00040000-561f-cc72-af3d-4d6e519323ca	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561f-cc72-da09-14f682adffcb	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561f-cc72-b9fe-4a8aa5eb5e45	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561f-cc72-fdce-54ff026e3317	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561f-cc72-2816-5c924077cc1a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561f-cc72-3f6c-29c20359106a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561f-cc72-da57-2561b8253aab	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561f-cc72-86f6-03e38025d8d2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561f-cc72-2a0c-c5c8b2466a9c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561f-cc72-9264-c6adced46f54	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561f-cc72-9a07-52d8a1a3d939	SM	SMR	674	San Marino 	San Marino	\N
00040000-561f-cc72-e36f-3c64f896a36b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561f-cc72-e918-7b2c871bef7d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561f-cc72-8e5d-f5aee3c163e3	SN	SEN	686	Senegal 	Senegal	\N
00040000-561f-cc72-5678-83c7ec3246f6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561f-cc72-cc62-3fe934f4d6a7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561f-cc72-787e-cac3a15e5072	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561f-cc72-3fa4-caf699a2b31f	SG	SGP	702	Singapore 	Singapur	\N
00040000-561f-cc72-5e20-d51517ab8269	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561f-cc72-0468-6de00588f1c0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561f-cc72-6553-2c250d3f0f03	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561f-cc72-7d8a-f5c2c04f78a0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561f-cc72-3686-8aaa31bf7573	SO	SOM	706	Somalia 	Somalija	\N
00040000-561f-cc72-19c0-6551b2b2db4c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561f-cc72-a270-714dff2818af	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561f-cc72-7b25-df59f1181251	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561f-cc72-9518-a0c3b34d1446	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561f-cc72-6b2e-29731875b7c4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561f-cc72-a373-2b2becb960f2	SD	SDN	729	Sudan 	Sudan	\N
00040000-561f-cc72-168a-3c840908e7a8	SR	SUR	740	Suriname 	Surinam	\N
00040000-561f-cc72-041c-148ad76a21e7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561f-cc72-47ca-439e134bfc22	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561f-cc72-879d-9962a299723d	SE	SWE	752	Sweden 	Švedska	\N
00040000-561f-cc72-8922-fe3673558d18	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561f-cc72-fd43-821ccfd248a9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561f-cc72-65f0-76e5cb89767d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561f-cc72-3890-ef041743aff1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561f-cc72-a220-9d7e390c9832	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561f-cc72-9575-c8fb2b5f05af	TH	THA	764	Thailand 	Tajska	\N
00040000-561f-cc72-41fd-de9831c10e05	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561f-cc72-1828-e365131e9a80	TG	TGO	768	Togo 	Togo	\N
00040000-561f-cc72-793c-6869350c88e1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561f-cc72-5b66-e36593f78da6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561f-cc72-9749-dad6b721cf98	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561f-cc72-1133-25f767ec8794	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561f-cc72-1e55-c8771bc081b9	TR	TUR	792	Turkey 	Turčija	\N
00040000-561f-cc72-6c97-be78b0149ef1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561f-cc72-8d43-83520dad555e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-cc72-5893-0dd513ad6774	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561f-cc72-7d73-dc05dfea2a45	UG	UGA	800	Uganda 	Uganda	\N
00040000-561f-cc72-300d-2b155298ebed	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561f-cc72-61d9-4d633f9a5615	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561f-cc72-048b-3bd212debceb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561f-cc72-f0df-c51d6b7fd9ab	US	USA	840	United States 	Združene države Amerike	\N
00040000-561f-cc72-9e00-1bb8738c7f27	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561f-cc72-72be-3475d37775d4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561f-cc72-353c-168dae8b4150	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561f-cc72-23c3-a169aee8e4ba	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561f-cc72-ae68-e7502ba491ed	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561f-cc72-3302-38bebae1f786	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561f-cc72-2ef4-bbb6463a7ddc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-cc72-e3df-0545764fb800	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561f-cc72-ca5b-e6b647bba57d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561f-cc72-514e-0bec821dd517	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561f-cc72-a144-962c698d9018	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561f-cc72-ba26-6929fce0fef7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561f-cc72-1f36-bba1937e3e30	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3085 (class 0 OID 22095911)
-- Dependencies: 232
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561f-cc76-a227-12f3dc56f624	000e0000-561f-cc75-416e-9ca7ca2f9228	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-cc72-f135-d00338426495	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-cc76-7009-6777317ae747	000e0000-561f-cc75-59e5-1e1c7400894b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-cc72-537a-eadc20a17a03	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-cc76-31fc-bc8bebfae014	000e0000-561f-cc75-7213-d2b6798ce75d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-cc72-f135-d00338426495	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561f-cc76-aa99-ea61276d4bfd	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561f-cc76-df4e-08b67d736d3e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3070 (class 0 OID 22095712)
-- Dependencies: 217
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561f-cc76-d4d6-4b476ef5fb34	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-7f8d-75cca0b7d5ec	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-cc72-1748-541f1f4fe2f3
000d0000-561f-cc76-f8c0-e9c7d3fd2842	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-a23b-a17e9e76858f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561f-cc72-31c6-7e4295b3e3e7
000d0000-561f-cc76-af33-1fc712ff0f85	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-8162-290f09535b0d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561f-cc72-3161-4c817f7e59ca
000d0000-561f-cc76-80db-76d0644edd71	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-3356-110a1dc5e442	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561f-cc72-1ca3-09c7d84f970e
000d0000-561f-cc76-e2d9-0159d99335da	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-88a5-e5ed6a9ceaa7	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561f-cc72-1ca3-09c7d84f970e
000d0000-561f-cc76-40ed-d28f0e4e121e	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-7aff-76ff411b5440	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-cc72-1748-541f1f4fe2f3
000d0000-561f-cc76-447c-b8563f08389d	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-c08d-8dba0d1f8443	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561f-cc72-1748-541f1f4fe2f3
000d0000-561f-cc76-38e4-8ca388a81c31	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-c84b-7360abf0ff3c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561f-cc72-89a0-e8fed0474264
000d0000-561f-cc76-45d4-16f415b90fe1	000e0000-561f-cc75-59e5-1e1c7400894b	000c0000-561f-cc76-bee8-c486b0a2ce48	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561f-cc72-b73b-f19dc1b4444b
\.


--
-- TOC entry 3050 (class 0 OID 22095527)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 22095501)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 22095478)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561f-cc75-4910-87a82f694499	00080000-561f-cc75-772b-0fbb0cd8c0a9	00090000-561f-cc75-0792-645ca663b2eb	AK		igralka
\.


--
-- TOC entry 3059 (class 0 OID 22095626)
-- Dependencies: 206
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 22096150)
-- Dependencies: 243
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 22096162)
-- Dependencies: 244
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 22096184)
-- Dependencies: 246
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 22028081)
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
-- TOC entry 3063 (class 0 OID 22095651)
-- Dependencies: 210
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 22095435)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561f-cc73-999c-9f2bde6cb456	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561f-cc73-7ab0-d9346fa8ae50	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561f-cc73-52a4-a7351ba1b2a3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561f-cc73-b0aa-ed7673ddb677	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561f-cc73-79d8-3b619500ac2a	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561f-cc73-e3d2-c026d2a35f03	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561f-cc73-9aa2-7ac021559a5c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561f-cc73-6fe8-726c731c6253	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-cc73-5972-0a4e206763fc	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-cc73-f1fa-7896ec8952e2	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561f-cc73-6e9d-f1720b8a43d3	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561f-cc73-13db-9bb57ab53bf0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561f-cc73-e106-c191ff9c618c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561f-cc73-d335-2eb5ef3c02eb	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561f-cc73-4f55-59dbefccabcd	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561f-cc75-cdc4-eefd476c6eee	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561f-cc75-3522-c1bcde057747	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561f-cc75-cb54-82201fe32bb7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561f-cc75-b88f-59442c65261e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561f-cc75-8269-36ebefcc2c98	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561f-cc78-800b-fc8ea0f32b38	application.tenant.maticnopodjetje	string	s:36:"00080000-561f-cc78-c570-656cbfe0da27";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3036 (class 0 OID 22095337)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561f-cc75-d507-2ac2162bd1e9	00000000-561f-cc75-cdc4-eefd476c6eee	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561f-cc75-1d82-0aabb8917776	00000000-561f-cc75-cdc4-eefd476c6eee	00010000-561f-cc73-86f8-54bc5c26b5ed	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561f-cc75-898a-b40f62d46bed	00000000-561f-cc75-3522-c1bcde057747	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3040 (class 0 OID 22095401)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 22095348)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561f-cc75-5c14-b49d5da76573	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561f-cc75-69ef-db6b9cd5249f	00010000-561f-cc75-7f30-582977d92d4b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561f-cc75-7a5c-39976bddb9b4	00010000-561f-cc75-361d-18d7eba024c8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561f-cc75-51fe-e4fabaed3c32	00010000-561f-cc75-46ee-299966900401	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561f-cc75-0313-8aab2da61465	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561f-cc75-5f81-9548f8b750e5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561f-cc75-e872-d8963a4b77c1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561f-cc75-545c-0b5b3020b61f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561f-cc75-0792-645ca663b2eb	00010000-561f-cc75-1ff7-4429ff04a819	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561f-cc75-7545-426f1b9f549d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561f-cc75-b1ec-774c60de93ea	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-cc75-2433-b1649c87c4e7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561f-cc75-f5aa-1e32cdb34e76	00010000-561f-cc75-598c-9cce0f83784f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-cc75-36ee-8c7730efe66b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-cc75-8191-462958c72893	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-cc75-ee10-c96e303ed3e4	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-cc75-2ccd-ced64c834c5f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561f-cc75-cd6d-9f4ad1ad5dac	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 22095292)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561f-cc72-668a-7af04cd2597b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561f-cc72-6be6-d8237e26debc	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561f-cc72-ba6e-f61890030189	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561f-cc72-5f8b-a8ed167f6d5f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561f-cc72-00c5-0a2672bdd604	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561f-cc72-0c77-eef2a5177dd3	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561f-cc72-1cbf-e841373c8f59	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561f-cc72-35b2-c6f432fd7a23	Abonma-read	Abonma - branje	f
00030000-561f-cc72-5246-58a609b3e4dd	Abonma-write	Abonma - spreminjanje	f
00030000-561f-cc72-2761-2471fbe376e8	Alternacija-read	Alternacija - branje	f
00030000-561f-cc72-e460-a6933097a2f5	Alternacija-write	Alternacija - spreminjanje	f
00030000-561f-cc72-202c-8516bdd8931f	Arhivalija-read	Arhivalija - branje	f
00030000-561f-cc72-6847-b32ce5135205	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561f-cc72-1242-f651407865dd	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561f-cc72-ba9a-f5b81c9677cb	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561f-cc72-ac3c-7682696de9c4	Besedilo-read	Besedilo - branje	f
00030000-561f-cc72-7015-d1345b07c5e6	Besedilo-write	Besedilo - spreminjanje	f
00030000-561f-cc72-6508-3b4e7fec3228	DogodekIzven-read	DogodekIzven - branje	f
00030000-561f-cc72-daaa-35bd1be2946e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561f-cc72-dec0-414ae702a99c	Dogodek-read	Dogodek - branje	f
00030000-561f-cc72-f9e0-d10886463592	Dogodek-write	Dogodek - spreminjanje	f
00030000-561f-cc72-794c-f14505011966	DrugiVir-read	DrugiVir - branje	f
00030000-561f-cc72-bc12-3b692636949d	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561f-cc72-7158-61cd8b9b6d9c	Drzava-read	Drzava - branje	f
00030000-561f-cc72-486e-4640c6f66ed2	Drzava-write	Drzava - spreminjanje	f
00030000-561f-cc72-e4ee-e27cefdbe899	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561f-cc72-27bb-5edca75a5201	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561f-cc72-d96e-cf130331a6f9	Funkcija-read	Funkcija - branje	f
00030000-561f-cc72-7684-a55edb397cae	Funkcija-write	Funkcija - spreminjanje	f
00030000-561f-cc72-e4ac-403480420962	Gostovanje-read	Gostovanje - branje	f
00030000-561f-cc72-e952-16b651825699	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561f-cc72-1fd1-cd3743bf4c93	Gostujoca-read	Gostujoca - branje	f
00030000-561f-cc72-88a1-9e6b1fe827cd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561f-cc72-7f22-eb419293dbb2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561f-cc72-459b-6a220cf276cc	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561f-cc72-abcc-63cbc2e7524e	Kupec-read	Kupec - branje	f
00030000-561f-cc72-e1e1-9966e238e780	Kupec-write	Kupec - spreminjanje	f
00030000-561f-cc72-484d-689d79e65407	NacinPlacina-read	NacinPlacina - branje	f
00030000-561f-cc72-7c84-bc7918cc3861	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561f-cc72-4a7a-1578578d4c2d	Option-read	Option - branje	f
00030000-561f-cc72-81b9-dbaac6ac5bf1	Option-write	Option - spreminjanje	f
00030000-561f-cc72-e4f2-4286c733f227	OptionValue-read	OptionValue - branje	f
00030000-561f-cc72-ec12-83fdb1760d41	OptionValue-write	OptionValue - spreminjanje	f
00030000-561f-cc72-2e75-20c7a3c3fe6d	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-561f-cc72-5db2-47350e2235d1	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-561f-cc72-70d2-b24315efc21c	Oseba-read	Oseba - branje	f
00030000-561f-cc72-0fa2-9a40416f2819	Oseba-write	Oseba - spreminjanje	f
00030000-561f-cc72-c752-636e21d2b9e3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561f-cc72-79c8-f56eca4f0caa	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561f-cc72-0af2-84f92ec1519b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561f-cc72-05c0-0116ffad8741	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561f-cc72-4362-3229415d4ff2	Pogodba-read	Pogodba - branje	f
00030000-561f-cc72-6590-9bef7a8cdfdb	Pogodba-write	Pogodba - spreminjanje	f
00030000-561f-cc72-cf9a-3a743244f5a1	Popa-read	Popa - branje	f
00030000-561f-cc72-612a-146307226a2e	Popa-write	Popa - spreminjanje	f
00030000-561f-cc72-0096-fd1fe98a6216	Posta-read	Posta - branje	f
00030000-561f-cc72-d976-7b0d39549890	Posta-write	Posta - spreminjanje	f
00030000-561f-cc72-2757-3be5733f84ee	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561f-cc72-5f1f-66a8c5389aa4	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561f-cc72-d6aa-c26331e6785f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561f-cc72-af12-65576d34b96f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561f-cc72-7af7-3617fcebdec0	PostniNaslov-read	PostniNaslov - branje	f
00030000-561f-cc72-75c4-f3aaeadec2b3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561f-cc72-c13b-b23511786429	Predstava-read	Predstava - branje	f
00030000-561f-cc72-2ae7-7120d9f493cd	Predstava-write	Predstava - spreminjanje	f
00030000-561f-cc72-6977-824bc9dbe737	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561f-cc72-6b98-d727e5a79c60	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561f-cc72-a4d7-2f80ab3765e3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561f-cc72-2f9b-4ba773f712b0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561f-cc72-5190-3e928c804de7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561f-cc72-d587-1c52130f6e7a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561f-cc72-e7ae-04d6b0db8869	ProgramDela-read	ProgramDela - branje	f
00030000-561f-cc72-e564-0c6d0508d8bd	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561f-cc72-8e11-de1541b16b5e	ProgramFestival-read	ProgramFestival - branje	f
00030000-561f-cc72-52e0-f8baf708d61f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561f-cc72-beb6-5a75df6148ba	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561f-cc72-e4b9-ba1c35764620	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561f-cc72-301b-7f4bef4e2d3f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561f-cc72-ec8e-67f0b568d145	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561f-cc72-580e-aa6368c6c0fc	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561f-cc72-1206-511502876a96	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561f-cc72-51f3-e340621bdd65	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561f-cc72-90bd-27a24cb30e2e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561f-cc72-4eb3-5bd01ca74d85	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561f-cc72-d00b-de7a2185fb58	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561f-cc72-65e9-66a51b6eee15	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561f-cc72-dd19-8bfe6e466f58	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561f-cc72-e642-3ccfc3510a2d	ProgramRazno-read	ProgramRazno - branje	f
00030000-561f-cc72-0552-2b8d0f707285	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561f-cc72-b415-9305f3fa4270	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561f-cc72-ad66-012262b0d387	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561f-cc72-f9be-5bf78039b0a7	Prostor-read	Prostor - branje	f
00030000-561f-cc72-25a1-926b095c4482	Prostor-write	Prostor - spreminjanje	f
00030000-561f-cc72-eac2-08495497cf53	Racun-read	Racun - branje	f
00030000-561f-cc72-f87b-ad743f679475	Racun-write	Racun - spreminjanje	f
00030000-561f-cc72-d97d-a71a9b955705	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561f-cc72-78ce-9dd792a0f3e1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561f-cc72-c1f4-a1a1056a6fd9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561f-cc72-dd20-565e48c23aca	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561f-cc72-f708-5af88d755096	Rekvizit-read	Rekvizit - branje	f
00030000-561f-cc72-5587-2d33696ee932	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561f-cc72-7982-893e23339ebb	Revizija-read	Revizija - branje	f
00030000-561f-cc72-5302-223cc5c3ac17	Revizija-write	Revizija - spreminjanje	f
00030000-561f-cc72-f07a-63ba7b2e6b95	Rezervacija-read	Rezervacija - branje	f
00030000-561f-cc72-60f1-af67268e1eda	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561f-cc72-4f3f-a21f1d59a5f3	SedezniRed-read	SedezniRed - branje	f
00030000-561f-cc72-f6ae-f36527e3f894	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561f-cc72-9c03-c19d5283e1c8	Sedez-read	Sedez - branje	f
00030000-561f-cc72-dce6-4beb8b295b8c	Sedez-write	Sedez - spreminjanje	f
00030000-561f-cc72-b8c9-10616a6185c5	Sezona-read	Sezona - branje	f
00030000-561f-cc72-b3c8-b491b7859613	Sezona-write	Sezona - spreminjanje	f
00030000-561f-cc72-2f95-ebe28c131259	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561f-cc72-e5ef-45c2e5ffdb86	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561f-cc72-5132-2889fd9c063e	Stevilcenje-read	Stevilcenje - branje	f
00030000-561f-cc72-53ad-858172229d6a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561f-cc72-5d4a-e6a4028444a7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561f-cc72-a4c5-46d445c989be	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561f-cc72-e5a7-460f8b33b084	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561f-cc72-4c2d-cde5128b3359	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561f-cc72-a472-005f01c8e46f	Telefonska-read	Telefonska - branje	f
00030000-561f-cc72-48d0-db2a70de4ccb	Telefonska-write	Telefonska - spreminjanje	f
00030000-561f-cc72-d738-20e409247bff	TerminStoritve-read	TerminStoritve - branje	f
00030000-561f-cc72-afd0-b2122b65ce5b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561f-cc72-d98e-982ce075691e	TipFunkcije-read	TipFunkcije - branje	f
00030000-561f-cc72-c895-045562b46c0e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561f-cc72-98a0-8d15750f7505	TipPopa-read	TipPopa - branje	f
00030000-561f-cc72-d631-d5ee3f331558	TipPopa-write	TipPopa - spreminjanje	f
00030000-561f-cc72-2dcb-21f32db712ba	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561f-cc72-d7ed-e2a5793a9ee7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561f-cc72-45a2-a032acdc71cb	Trr-read	Trr - branje	f
00030000-561f-cc72-9b68-8b1dbcabd850	Trr-write	Trr - spreminjanje	f
00030000-561f-cc72-e9b5-b5324079d864	Uprizoritev-read	Uprizoritev - branje	f
00030000-561f-cc72-439f-bc59bc0a50e5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561f-cc72-0f4f-b5b10ae30590	Vaja-read	Vaja - branje	f
00030000-561f-cc72-3f20-cc3b705ea3db	Vaja-write	Vaja - spreminjanje	f
00030000-561f-cc72-8441-7c949bc61422	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561f-cc72-17f3-e7842e868326	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561f-cc72-e2d4-b2bc93485db0	VrstaStroska-read	VrstaStroska - branje	f
00030000-561f-cc72-1007-d3f88618c21f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561f-cc72-48b7-987b7a781fe4	Zaposlitev-read	Zaposlitev - branje	f
00030000-561f-cc72-4d0e-b39c55158eb6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561f-cc72-56cf-66609e598292	Zasedenost-read	Zasedenost - branje	f
00030000-561f-cc72-c87d-04154fed4f41	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561f-cc72-8e1d-3c782ba827f7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561f-cc72-6f93-8f955c43a916	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561f-cc72-b8bc-76d7985ab925	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561f-cc72-8bf1-a7a655bc101c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561f-cc72-c994-f2cb6db7cc53	Job-read	Branje opravil - samo zase - branje	f
00030000-561f-cc72-76a9-cd457afd3315	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561f-cc72-fe20-181c8c4c46e8	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561f-cc72-4315-525f452965ee	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561f-cc72-8b12-45f93720ca6f	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561f-cc72-7d8e-01b00b23c436	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561f-cc72-358c-6035da05b9f4	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561f-cc72-c509-7a5d2f4ac36f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-cc72-f79f-1b86dce770e0	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-cc72-8637-84e4390763b1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-cc72-ab2c-e62346c51351	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-cc72-d27f-b81c2a134cf9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561f-cc72-ab1a-beb0250e3387	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561f-cc72-c4d4-133c6316e9be	Datoteka-write	Datoteka - spreminjanje	f
00030000-561f-cc72-2c2d-b958769c1dcb	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3033 (class 0 OID 22095311)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561f-cc72-5628-74d7a01aeb45	00030000-561f-cc72-6be6-d8237e26debc
00020000-561f-cc72-6e3c-1819fd8a755c	00030000-561f-cc72-7158-61cd8b9b6d9c
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-35b2-c6f432fd7a23
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-5246-58a609b3e4dd
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-2761-2471fbe376e8
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-e460-a6933097a2f5
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-202c-8516bdd8931f
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-dec0-414ae702a99c
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-5f8b-a8ed167f6d5f
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-f9e0-d10886463592
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-7158-61cd8b9b6d9c
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-486e-4640c6f66ed2
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-d96e-cf130331a6f9
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-7684-a55edb397cae
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-e4ac-403480420962
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-e952-16b651825699
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-1fd1-cd3743bf4c93
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-88a1-9e6b1fe827cd
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-7f22-eb419293dbb2
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-459b-6a220cf276cc
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-4a7a-1578578d4c2d
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-e4f2-4286c733f227
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-70d2-b24315efc21c
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-0fa2-9a40416f2819
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-cf9a-3a743244f5a1
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-612a-146307226a2e
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-0096-fd1fe98a6216
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-d976-7b0d39549890
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-7af7-3617fcebdec0
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-75c4-f3aaeadec2b3
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-c13b-b23511786429
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-2ae7-7120d9f493cd
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-5190-3e928c804de7
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-d587-1c52130f6e7a
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-f9be-5bf78039b0a7
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-25a1-926b095c4482
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-c1f4-a1a1056a6fd9
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-dd20-565e48c23aca
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-f708-5af88d755096
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-5587-2d33696ee932
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-b8c9-10616a6185c5
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-b3c8-b491b7859613
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-d98e-982ce075691e
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-e9b5-b5324079d864
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-439f-bc59bc0a50e5
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-0f4f-b5b10ae30590
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-3f20-cc3b705ea3db
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-56cf-66609e598292
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-c87d-04154fed4f41
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-8e1d-3c782ba827f7
00020000-561f-cc72-7b14-f4e4c074f24e	00030000-561f-cc72-b8bc-76d7985ab925
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-35b2-c6f432fd7a23
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-202c-8516bdd8931f
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-dec0-414ae702a99c
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-7158-61cd8b9b6d9c
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-e4ac-403480420962
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-1fd1-cd3743bf4c93
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-7f22-eb419293dbb2
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-459b-6a220cf276cc
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-4a7a-1578578d4c2d
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-e4f2-4286c733f227
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-70d2-b24315efc21c
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-0fa2-9a40416f2819
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-cf9a-3a743244f5a1
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-0096-fd1fe98a6216
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-7af7-3617fcebdec0
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-75c4-f3aaeadec2b3
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-c13b-b23511786429
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-f9be-5bf78039b0a7
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-c1f4-a1a1056a6fd9
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-f708-5af88d755096
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-b8c9-10616a6185c5
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-a472-005f01c8e46f
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-48d0-db2a70de4ccb
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-45a2-a032acdc71cb
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-9b68-8b1dbcabd850
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-48b7-987b7a781fe4
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-4d0e-b39c55158eb6
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-8e1d-3c782ba827f7
00020000-561f-cc72-59b5-da262f0fdb5c	00030000-561f-cc72-b8bc-76d7985ab925
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-35b2-c6f432fd7a23
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-2761-2471fbe376e8
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-202c-8516bdd8931f
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-6847-b32ce5135205
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-ac3c-7682696de9c4
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-6508-3b4e7fec3228
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-dec0-414ae702a99c
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-7158-61cd8b9b6d9c
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-d96e-cf130331a6f9
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-e4ac-403480420962
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-1fd1-cd3743bf4c93
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-7f22-eb419293dbb2
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-4a7a-1578578d4c2d
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-e4f2-4286c733f227
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-70d2-b24315efc21c
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-cf9a-3a743244f5a1
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-0096-fd1fe98a6216
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-c13b-b23511786429
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-5190-3e928c804de7
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-f9be-5bf78039b0a7
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-c1f4-a1a1056a6fd9
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-f708-5af88d755096
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-b8c9-10616a6185c5
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-d98e-982ce075691e
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-0f4f-b5b10ae30590
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-56cf-66609e598292
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-8e1d-3c782ba827f7
00020000-561f-cc72-55c7-c2a3b2fa1e4b	00030000-561f-cc72-b8bc-76d7985ab925
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-35b2-c6f432fd7a23
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-5246-58a609b3e4dd
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-e460-a6933097a2f5
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-202c-8516bdd8931f
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-dec0-414ae702a99c
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-7158-61cd8b9b6d9c
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-e4ac-403480420962
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-1fd1-cd3743bf4c93
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-4a7a-1578578d4c2d
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-e4f2-4286c733f227
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-cf9a-3a743244f5a1
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-0096-fd1fe98a6216
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-c13b-b23511786429
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-f9be-5bf78039b0a7
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-c1f4-a1a1056a6fd9
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-f708-5af88d755096
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-b8c9-10616a6185c5
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-d98e-982ce075691e
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-8e1d-3c782ba827f7
00020000-561f-cc72-a91d-0c76fda26b47	00030000-561f-cc72-b8bc-76d7985ab925
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-35b2-c6f432fd7a23
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-202c-8516bdd8931f
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-dec0-414ae702a99c
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-7158-61cd8b9b6d9c
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-e4ac-403480420962
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-1fd1-cd3743bf4c93
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-4a7a-1578578d4c2d
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-e4f2-4286c733f227
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-cf9a-3a743244f5a1
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-0096-fd1fe98a6216
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-c13b-b23511786429
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-f9be-5bf78039b0a7
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-c1f4-a1a1056a6fd9
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-f708-5af88d755096
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-b8c9-10616a6185c5
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-d738-20e409247bff
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-ba6e-f61890030189
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-d98e-982ce075691e
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-8e1d-3c782ba827f7
00020000-561f-cc72-500f-eb62767b41db	00030000-561f-cc72-b8bc-76d7985ab925
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-668a-7af04cd2597b
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-6be6-d8237e26debc
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-ba6e-f61890030189
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5f8b-a8ed167f6d5f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-00c5-0a2672bdd604
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-0c77-eef2a5177dd3
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-1cbf-e841373c8f59
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-35b2-c6f432fd7a23
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5246-58a609b3e4dd
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-2761-2471fbe376e8
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e460-a6933097a2f5
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-202c-8516bdd8931f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-6847-b32ce5135205
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-ac3c-7682696de9c4
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-7015-d1345b07c5e6
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-6508-3b4e7fec3228
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-daaa-35bd1be2946e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-dec0-414ae702a99c
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-f9e0-d10886463592
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-7158-61cd8b9b6d9c
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-486e-4640c6f66ed2
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-794c-f14505011966
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-bc12-3b692636949d
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e4ee-e27cefdbe899
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-27bb-5edca75a5201
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d96e-cf130331a6f9
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-7684-a55edb397cae
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e4ac-403480420962
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e952-16b651825699
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-1fd1-cd3743bf4c93
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-88a1-9e6b1fe827cd
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-7f22-eb419293dbb2
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-459b-6a220cf276cc
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-abcc-63cbc2e7524e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e1e1-9966e238e780
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-484d-689d79e65407
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-7c84-bc7918cc3861
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-4a7a-1578578d4c2d
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-81b9-dbaac6ac5bf1
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e4f2-4286c733f227
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-ec12-83fdb1760d41
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-70d2-b24315efc21c
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-0fa2-9a40416f2819
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-c752-636e21d2b9e3
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-79c8-f56eca4f0caa
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-0af2-84f92ec1519b
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-05c0-0116ffad8741
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-4362-3229415d4ff2
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-6590-9bef7a8cdfdb
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-cf9a-3a743244f5a1
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-612a-146307226a2e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-0096-fd1fe98a6216
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d976-7b0d39549890
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-2757-3be5733f84ee
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5f1f-66a8c5389aa4
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d6aa-c26331e6785f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-af12-65576d34b96f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-7af7-3617fcebdec0
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-75c4-f3aaeadec2b3
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-c13b-b23511786429
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-2ae7-7120d9f493cd
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-6977-824bc9dbe737
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-6b98-d727e5a79c60
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-a4d7-2f80ab3765e3
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-2f9b-4ba773f712b0
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5190-3e928c804de7
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d587-1c52130f6e7a
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e7ae-04d6b0db8869
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e564-0c6d0508d8bd
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-8e11-de1541b16b5e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-52e0-f8baf708d61f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-beb6-5a75df6148ba
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e4b9-ba1c35764620
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-301b-7f4bef4e2d3f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-ec8e-67f0b568d145
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-580e-aa6368c6c0fc
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-1206-511502876a96
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-51f3-e340621bdd65
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-90bd-27a24cb30e2e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-4eb3-5bd01ca74d85
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d00b-de7a2185fb58
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-65e9-66a51b6eee15
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-dd19-8bfe6e466f58
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e642-3ccfc3510a2d
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-0552-2b8d0f707285
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-b415-9305f3fa4270
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-ad66-012262b0d387
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-f9be-5bf78039b0a7
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-25a1-926b095c4482
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-eac2-08495497cf53
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-f87b-ad743f679475
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d97d-a71a9b955705
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-78ce-9dd792a0f3e1
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-c1f4-a1a1056a6fd9
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-dd20-565e48c23aca
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-f708-5af88d755096
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5587-2d33696ee932
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-7982-893e23339ebb
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5302-223cc5c3ac17
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-f07a-63ba7b2e6b95
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-60f1-af67268e1eda
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-4f3f-a21f1d59a5f3
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-f6ae-f36527e3f894
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-9c03-c19d5283e1c8
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-dce6-4beb8b295b8c
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-b8c9-10616a6185c5
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-b3c8-b491b7859613
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-2f95-ebe28c131259
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e5ef-45c2e5ffdb86
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5132-2889fd9c063e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-53ad-858172229d6a
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-5d4a-e6a4028444a7
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-a4c5-46d445c989be
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e5a7-460f8b33b084
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-4c2d-cde5128b3359
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-a472-005f01c8e46f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-48d0-db2a70de4ccb
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d738-20e409247bff
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-afd0-b2122b65ce5b
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d98e-982ce075691e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-c895-045562b46c0e
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-2dcb-21f32db712ba
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-d7ed-e2a5793a9ee7
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-45a2-a032acdc71cb
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-9b68-8b1dbcabd850
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e9b5-b5324079d864
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-439f-bc59bc0a50e5
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-0f4f-b5b10ae30590
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-3f20-cc3b705ea3db
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-8441-7c949bc61422
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-17f3-e7842e868326
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-e2d4-b2bc93485db0
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-1007-d3f88618c21f
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-48b7-987b7a781fe4
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-4d0e-b39c55158eb6
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-56cf-66609e598292
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-c87d-04154fed4f41
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-8e1d-3c782ba827f7
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-6f93-8f955c43a916
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-b8bc-76d7985ab925
00020000-561f-cc75-7ca7-7189630906e0	00030000-561f-cc72-8bf1-a7a655bc101c
\.


--
-- TOC entry 3064 (class 0 OID 22095658)
-- Dependencies: 211
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22095692)
-- Dependencies: 215
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 22095829)
-- Dependencies: 227
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561f-cc75-69ea-07bf53b4cd22	00090000-561f-cc75-5c14-b49d5da76573	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561f-cc75-8fa5-f4ab709bccc2	00090000-561f-cc75-5f81-9548f8b750e5	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561f-cc75-6143-274717abda34	00090000-561f-cc75-f5aa-1e32cdb34e76	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561f-cc75-2b7c-cc530874664e	00090000-561f-cc75-7545-426f1b9f549d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3039 (class 0 OID 22095381)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561f-cc75-772b-0fbb0cd8c0a9	\N	00040000-561f-cc72-6553-2c250d3f0f03	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc75-29e0-5ecf6e80005b	\N	00040000-561f-cc72-6553-2c250d3f0f03	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561f-cc75-bf03-5aeb8677a4d9	\N	00040000-561f-cc72-6553-2c250d3f0f03	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc75-fc4a-295c812fd423	\N	00040000-561f-cc72-6553-2c250d3f0f03	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc75-a8ee-eede72b127c9	\N	00040000-561f-cc72-6553-2c250d3f0f03	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc75-abcf-333d9865f695	\N	00040000-561f-cc72-055c-b6b7380258c5	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc75-4edc-268cc49362c1	\N	00040000-561f-cc72-1e12-550bd377fecd	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc75-8739-f25e67292b61	\N	00040000-561f-cc72-429f-36b28bb23bd0	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc75-1917-e8b789ac477f	\N	00040000-561f-cc72-f1e9-f020a2c41e57	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-cc78-c570-656cbfe0da27	\N	00040000-561f-cc72-6553-2c250d3f0f03	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3042 (class 0 OID 22095427)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561f-cc71-1514-cbe1c71b44ba	8341	Adlešiči
00050000-561f-cc71-baa2-861d0b1e4664	5270	Ajdovščina
00050000-561f-cc71-9644-b1630183cc6a	6280	Ankaran/Ancarano
00050000-561f-cc71-74be-688c3869b923	9253	Apače
00050000-561f-cc71-77cf-72a3dcf55347	8253	Artiče
00050000-561f-cc71-19f1-69eeceead532	4275	Begunje na Gorenjskem
00050000-561f-cc71-a6df-84362bb5bea3	1382	Begunje pri Cerknici
00050000-561f-cc71-de5f-ce74abf893c4	9231	Beltinci
00050000-561f-cc71-58a7-286d7c5919c9	2234	Benedikt
00050000-561f-cc71-a90a-ae69b065d329	2345	Bistrica ob Dravi
00050000-561f-cc71-ed77-d7b7bd0e0106	3256	Bistrica ob Sotli
00050000-561f-cc71-a732-0a8dd7fff260	8259	Bizeljsko
00050000-561f-cc71-fe34-87152e75ce04	1223	Blagovica
00050000-561f-cc71-34fc-77c622de4417	8283	Blanca
00050000-561f-cc71-8822-6df12b768e1c	4260	Bled
00050000-561f-cc71-7f08-c2a65bc4a0b7	4273	Blejska Dobrava
00050000-561f-cc71-9940-c37f38e8e295	9265	Bodonci
00050000-561f-cc71-e098-3dc939184a3f	9222	Bogojina
00050000-561f-cc71-5575-742d29732ce6	4263	Bohinjska Bela
00050000-561f-cc71-fd80-a8bb993af449	4264	Bohinjska Bistrica
00050000-561f-cc71-09c1-ca544e71e94e	4265	Bohinjsko jezero
00050000-561f-cc71-202b-70a331fe8b83	1353	Borovnica
00050000-561f-cc71-00a9-4ede15afd1cc	8294	Boštanj
00050000-561f-cc71-955c-ae9bdb7a1447	5230	Bovec
00050000-561f-cc71-f68f-f39a74ec44d4	5295	Branik
00050000-561f-cc71-1917-cc6b3f804db3	3314	Braslovče
00050000-561f-cc71-ab2b-deb0e9095bf6	5223	Breginj
00050000-561f-cc71-5578-2f9f83d99f1f	8280	Brestanica
00050000-561f-cc71-a192-fd8f8234edf2	2354	Bresternica
00050000-561f-cc71-6e42-df1bcbfc890a	4243	Brezje
00050000-561f-cc71-5c60-03aaa7da398f	1351	Brezovica pri Ljubljani
00050000-561f-cc71-5120-0eec3995f734	8250	Brežice
00050000-561f-cc71-8193-87d0d56a8728	4210	Brnik - Aerodrom
00050000-561f-cc71-e56a-4c4aa0890a14	8321	Brusnice
00050000-561f-cc71-acdc-6e6b994a76dc	3255	Buče
00050000-561f-cc71-4728-f6699d329d13	8276	Bučka 
00050000-561f-cc71-8d34-9b2bdd2e77cb	9261	Cankova
00050000-561f-cc71-1ce1-12b35b51da69	3000	Celje 
00050000-561f-cc71-5382-b0df733e6357	3001	Celje - poštni predali
00050000-561f-cc71-b3ec-7156ba0743d9	4207	Cerklje na Gorenjskem
00050000-561f-cc71-19a3-312b15def75d	8263	Cerklje ob Krki
00050000-561f-cc71-911b-ab42ef5cda5e	1380	Cerknica
00050000-561f-cc71-92bc-5f17ef91c5c3	5282	Cerkno
00050000-561f-cc71-f322-91d341eec5c3	2236	Cerkvenjak
00050000-561f-cc71-015f-fad9ead4cdf0	2215	Ceršak
00050000-561f-cc71-d834-e13daec5ee06	2326	Cirkovce
00050000-561f-cc71-f33f-1bb0608b7d8a	2282	Cirkulane
00050000-561f-cc71-8641-3bbebe272ef3	5273	Col
00050000-561f-cc71-7da3-80b62c77eb63	8251	Čatež ob Savi
00050000-561f-cc71-16c2-b5544d616855	1413	Čemšenik
00050000-561f-cc71-b93c-b1a57654c723	5253	Čepovan
00050000-561f-cc71-0268-d03b8ac3387c	9232	Črenšovci
00050000-561f-cc71-3991-31d53fffe4b8	2393	Črna na Koroškem
00050000-561f-cc71-0953-6497ffd2d55c	6275	Črni Kal
00050000-561f-cc71-b3fb-7ca84821cf8c	5274	Črni Vrh nad Idrijo
00050000-561f-cc71-89a0-0213d90cbdc7	5262	Črniče
00050000-561f-cc71-97b9-b5eba4ad665d	8340	Črnomelj
00050000-561f-cc71-5589-e24472177756	6271	Dekani
00050000-561f-cc71-9bbc-eb4ef45f3965	5210	Deskle
00050000-561f-cc71-fb02-54a43c953854	2253	Destrnik
00050000-561f-cc71-e58f-8fafb5157ed2	6215	Divača
00050000-561f-cc71-2052-b9f5417f86e3	1233	Dob
00050000-561f-cc71-8cd4-a9879c9cc831	3224	Dobje pri Planini
00050000-561f-cc71-0f1e-5507d0ef95cf	8257	Dobova
00050000-561f-cc71-0b2e-630e4d5b573e	1423	Dobovec
00050000-561f-cc71-5def-21bdae12c7e3	5263	Dobravlje
00050000-561f-cc71-a3cc-04fe7ff096ef	3204	Dobrna
00050000-561f-cc71-360f-d80be958ed2c	8211	Dobrnič
00050000-561f-cc71-5a85-be44b9d4c070	1356	Dobrova
00050000-561f-cc71-be65-52c8a14b975b	9223	Dobrovnik/Dobronak 
00050000-561f-cc71-874f-771e415de0f4	5212	Dobrovo v Brdih
00050000-561f-cc71-aca5-1c759e407221	1431	Dol pri Hrastniku
00050000-561f-cc71-45b7-2d35c7febf5f	1262	Dol pri Ljubljani
00050000-561f-cc71-667f-1d723ce7a7a7	1273	Dole pri Litiji
00050000-561f-cc71-0c75-c9c3cc15afe8	1331	Dolenja vas
00050000-561f-cc71-5b49-e6d0555df874	8350	Dolenjske Toplice
00050000-561f-cc71-a2f7-f904957a4f7c	1230	Domžale
00050000-561f-cc71-0c5d-58713eb37276	2252	Dornava
00050000-561f-cc71-ffaa-0c82e41cb837	5294	Dornberk
00050000-561f-cc71-34f3-5cbe2a51b849	1319	Draga
00050000-561f-cc71-6ab6-ad4a8e9f48eb	8343	Dragatuš
00050000-561f-cc71-2b71-b6951af2f4b8	3222	Dramlje
00050000-561f-cc71-024c-b5fbabf0804e	2370	Dravograd
00050000-561f-cc71-c027-644b43445c85	4203	Duplje
00050000-561f-cc71-b3d7-8cf7ad3d4710	6221	Dutovlje
00050000-561f-cc71-efa8-da14df44e203	8361	Dvor
00050000-561f-cc71-745e-e56bde74cf57	2343	Fala
00050000-561f-cc71-802e-22b457f87eb5	9208	Fokovci
00050000-561f-cc71-f996-530feed581b7	2313	Fram
00050000-561f-cc71-edc0-11be96699c54	3213	Frankolovo
00050000-561f-cc71-a32c-6f0fbfbcb155	1274	Gabrovka
00050000-561f-cc71-13e5-3a6f7b80d5cf	8254	Globoko
00050000-561f-cc71-663c-89184d20a5d8	5275	Godovič
00050000-561f-cc71-e706-a1233e1ea476	4204	Golnik
00050000-561f-cc71-6cdb-b0303f150003	3303	Gomilsko
00050000-561f-cc71-02b4-ec57a5a7cef8	4224	Gorenja vas
00050000-561f-cc71-ab32-356f977d2cab	3263	Gorica pri Slivnici
00050000-561f-cc71-d81d-78cb4e67c075	2272	Gorišnica
00050000-561f-cc71-2f57-cf3d147ce5e9	9250	Gornja Radgona
00050000-561f-cc71-2e4b-6bd2fcda5064	3342	Gornji Grad
00050000-561f-cc71-0165-becd3ac35e7b	4282	Gozd Martuljek
00050000-561f-cc71-313e-a27ad5af6d77	6272	Gračišče
00050000-561f-cc71-c1cf-8093c1ff72a8	9264	Grad
00050000-561f-cc71-8e1f-daf604114c73	8332	Gradac
00050000-561f-cc71-efa3-3af46ec73ff5	1384	Grahovo
00050000-561f-cc71-8806-16717daae61e	5242	Grahovo ob Bači
00050000-561f-cc71-8797-188c55da7bd3	5251	Grgar
00050000-561f-cc71-6005-af8bfafe3b3c	3302	Griže
00050000-561f-cc71-08d4-b0ed467e619c	3231	Grobelno
00050000-561f-cc71-a67c-d73d323f1e0b	1290	Grosuplje
00050000-561f-cc71-dec6-5affd1b580f5	2288	Hajdina
00050000-561f-cc71-5f28-23b4c09afacf	8362	Hinje
00050000-561f-cc71-6273-521daeec172c	2311	Hoče
00050000-561f-cc71-01fa-b785748e0023	9205	Hodoš/Hodos
00050000-561f-cc71-0e80-3da0c3f4d6ed	1354	Horjul
00050000-561f-cc71-f0de-d88e2f306cfb	1372	Hotedršica
00050000-561f-cc71-2122-8403b57abcb7	1430	Hrastnik
00050000-561f-cc71-4e5f-5cb6a3566d62	6225	Hruševje
00050000-561f-cc71-a039-01182be3fd29	4276	Hrušica
00050000-561f-cc71-96d3-c733da79305d	5280	Idrija
00050000-561f-cc71-883f-912a2a0083b8	1292	Ig
00050000-561f-cc71-a94b-23a131480dd6	6250	Ilirska Bistrica
00050000-561f-cc71-db11-0ff0e02c2cc5	6251	Ilirska Bistrica-Trnovo
00050000-561f-cc71-8099-9bbd84d4143a	1295	Ivančna Gorica
00050000-561f-cc71-995f-b4e54500cd5a	2259	Ivanjkovci
00050000-561f-cc71-7590-ced9177840a3	1411	Izlake
00050000-561f-cc71-fcab-79e1a52b5869	6310	Izola/Isola
00050000-561f-cc71-8176-0455b0b2479b	2222	Jakobski Dol
00050000-561f-cc71-c61e-b448c1189544	2221	Jarenina
00050000-561f-cc71-bc7a-c2b421721510	6254	Jelšane
00050000-561f-cc71-193e-d85e9c96a0b6	4270	Jesenice
00050000-561f-cc71-f7b1-c7cd313794ef	8261	Jesenice na Dolenjskem
00050000-561f-cc71-dec9-42a52c832edf	3273	Jurklošter
00050000-561f-cc71-3e95-3e0a3246c83f	2223	Jurovski Dol
00050000-561f-cc71-998e-ca13745d64ac	2256	Juršinci
00050000-561f-cc71-b7b1-920a270e9fdf	5214	Kal nad Kanalom
00050000-561f-cc71-157d-0d272b14afbc	3233	Kalobje
00050000-561f-cc71-ad88-6b0667f09809	4246	Kamna Gorica
00050000-561f-cc71-7bac-abb5f494d2b0	2351	Kamnica
00050000-561f-cc71-2731-03e90b2c674e	1241	Kamnik
00050000-561f-cc71-70c6-5a6253740137	5213	Kanal
00050000-561f-cc71-a2e8-49ae730dbef5	8258	Kapele
00050000-561f-cc71-cc17-e93f3194048b	2362	Kapla
00050000-561f-cc71-2149-b63b9b8b59b8	2325	Kidričevo
00050000-561f-cc71-fb5d-ac681cc86454	1412	Kisovec
00050000-561f-cc71-f0be-ad6e7296fed6	6253	Knežak
00050000-561f-cc71-91f5-55972bbef2e1	5222	Kobarid
00050000-561f-cc71-a639-a11c5d21df5b	9227	Kobilje
00050000-561f-cc71-60d7-1099d801655f	1330	Kočevje
00050000-561f-cc71-59e4-9efffdcfa675	1338	Kočevska Reka
00050000-561f-cc71-806d-a2f860ab6cf6	2276	Kog
00050000-561f-cc71-0c5a-ba9f3c53a478	5211	Kojsko
00050000-561f-cc71-597e-5239916c3634	6223	Komen
00050000-561f-cc71-9a9f-3e0efc055ad0	1218	Komenda
00050000-561f-cc71-58b0-b711cf53ac94	6000	Koper/Capodistria 
00050000-561f-cc71-9ec3-c3ab63c70cc0	6001	Koper/Capodistria - poštni predali
00050000-561f-cc71-4617-646420c30a9c	8282	Koprivnica
00050000-561f-cc71-a6f3-f4a488b966ba	5296	Kostanjevica na Krasu
00050000-561f-cc71-d533-0cab91ce906b	8311	Kostanjevica na Krki
00050000-561f-cc71-dc7b-831c4c6fe643	1336	Kostel
00050000-561f-cc71-cbfd-5aa821b73f7a	6256	Košana
00050000-561f-cc71-dfbe-d78424bef095	2394	Kotlje
00050000-561f-cc71-6660-c18ace3018f7	6240	Kozina
00050000-561f-cc71-d813-fb2b4e37dda7	3260	Kozje
00050000-561f-cc71-1a32-b6b804b52d4d	4000	Kranj 
00050000-561f-cc71-0c60-74a748d4540f	4001	Kranj - poštni predali
00050000-561f-cc71-b6b4-924edec4a668	4280	Kranjska Gora
00050000-561f-cc71-4120-817b2466263a	1281	Kresnice
00050000-561f-cc71-530c-913ef5436a14	4294	Križe
00050000-561f-cc71-3169-bf0cb3c53736	9206	Križevci
00050000-561f-cc71-c69f-6b8041719e07	9242	Križevci pri Ljutomeru
00050000-561f-cc71-c5a6-56e79f3693e3	1301	Krka
00050000-561f-cc71-dbab-974cb6401a1e	8296	Krmelj
00050000-561f-cc71-ba30-e6acd7047a55	4245	Kropa
00050000-561f-cc71-baf4-eeff2b176cd4	8262	Krška vas
00050000-561f-cc71-2bb2-a3ac3c0f9ab7	8270	Krško
00050000-561f-cc71-059b-c564aa3ef88d	9263	Kuzma
00050000-561f-cc71-78cf-fae228e0d0e3	2318	Laporje
00050000-561f-cc71-24b3-d8d1fabaefca	3270	Laško
00050000-561f-cc71-9863-c8c063558bee	1219	Laze v Tuhinju
00050000-561f-cc71-ee46-a3aeb2c51056	2230	Lenart v Slovenskih goricah
00050000-561f-cc71-2ea3-e66b4297130c	9220	Lendava/Lendva
00050000-561f-cc71-dec3-314081d2a3a8	4248	Lesce
00050000-561f-cc71-eaeb-78ecfd7115c2	3261	Lesično
00050000-561f-cc71-0b5b-c1b22db46633	8273	Leskovec pri Krškem
00050000-561f-cc71-4576-82db70e87296	2372	Libeliče
00050000-561f-cc71-6ce7-0d44021395b1	2341	Limbuš
00050000-561f-cc71-739a-cebbf1b74466	1270	Litija
00050000-561f-cc71-a4c7-a6eeddf3b002	3202	Ljubečna
00050000-561f-cc71-ba25-cd83056731ab	1000	Ljubljana 
00050000-561f-cc71-50d7-06b73c64d690	1001	Ljubljana - poštni predali
00050000-561f-cc71-b7e9-c71ac1d0ae33	1231	Ljubljana - Črnuče
00050000-561f-cc71-5fe0-763126220137	1261	Ljubljana - Dobrunje
00050000-561f-cc71-4992-45aad7f57b40	1260	Ljubljana - Polje
00050000-561f-cc71-7be3-a1b658759e1d	1210	Ljubljana - Šentvid
00050000-561f-cc71-3378-1f0468754848	1211	Ljubljana - Šmartno
00050000-561f-cc71-a557-cd64b7e1b982	3333	Ljubno ob Savinji
00050000-561f-cc71-3f47-f3a45ace2321	9240	Ljutomer
00050000-561f-cc71-a719-e3250a8b0ce3	3215	Loče
00050000-561f-cc71-b4df-45115b672489	5231	Log pod Mangartom
00050000-561f-cc71-c5c5-640d06e3e2bd	1358	Log pri Brezovici
00050000-561f-cc71-c52a-dce5da68c558	1370	Logatec
00050000-561f-cc71-2bc7-d4b35b2a8fb0	1371	Logatec
00050000-561f-cc71-e01f-76c12a417eaf	1434	Loka pri Zidanem Mostu
00050000-561f-cc71-65f0-f72ea1f93077	3223	Loka pri Žusmu
00050000-561f-cc71-684e-a4aa0fc9f25d	6219	Lokev
00050000-561f-cc71-6b65-a4a3f93d56cd	1318	Loški Potok
00050000-561f-cc71-41cf-7866b7406087	2324	Lovrenc na Dravskem polju
00050000-561f-cc71-7aaf-8906fe752ce2	2344	Lovrenc na Pohorju
00050000-561f-cc71-8bf1-a726c566cfca	3334	Luče
00050000-561f-cc71-b4de-e2b235fd6a4e	1225	Lukovica
00050000-561f-cc71-c596-ba0668c8ff43	9202	Mačkovci
00050000-561f-cc71-d5af-900dd92ea0db	2322	Majšperk
00050000-561f-cc71-ee15-0d9cf31401f0	2321	Makole
00050000-561f-cc71-c886-040cc24a60f9	9243	Mala Nedelja
00050000-561f-cc71-97cd-c5c1530d58bf	2229	Malečnik
00050000-561f-cc71-44fd-7054f6eb2708	6273	Marezige
00050000-561f-cc71-6715-6168e13b0752	2000	Maribor 
00050000-561f-cc71-c418-349cdae59bc6	2001	Maribor - poštni predali
00050000-561f-cc71-a2a6-e51738638f14	2206	Marjeta na Dravskem polju
00050000-561f-cc71-3cd5-e07cf54b67df	2281	Markovci
00050000-561f-cc71-87e2-85bdca16e7ad	9221	Martjanci
00050000-561f-cc71-654d-4e5d46af041c	6242	Materija
00050000-561f-cc71-7cad-d8f51132a468	4211	Mavčiče
00050000-561f-cc71-62d3-e17f2f758cee	1215	Medvode
00050000-561f-cc71-219b-bde383f28bbc	1234	Mengeš
00050000-561f-cc71-c36f-ba080cd46a97	8330	Metlika
00050000-561f-cc71-6f1d-c2dfd6da338d	2392	Mežica
00050000-561f-cc71-a3f6-93c9d755fbae	2204	Miklavž na Dravskem polju
00050000-561f-cc71-2cc5-eb1e6f10fbc2	2275	Miklavž pri Ormožu
00050000-561f-cc71-cf44-a93201028465	5291	Miren
00050000-561f-cc71-90dd-b030bf6bf8fb	8233	Mirna
00050000-561f-cc71-556e-51881fad8d0a	8216	Mirna Peč
00050000-561f-cc71-83d7-aca7768d3a9e	2382	Mislinja
00050000-561f-cc71-43d9-d58bcfaeff32	4281	Mojstrana
00050000-561f-cc71-f929-4fdc54afabca	8230	Mokronog
00050000-561f-cc71-7870-330f027b89ed	1251	Moravče
00050000-561f-cc71-09e9-6433895983f6	9226	Moravske Toplice
00050000-561f-cc71-fa4f-2bf5f4403cb3	5216	Most na Soči
00050000-561f-cc71-d1e7-ecc13a4a414f	1221	Motnik
00050000-561f-cc71-abdc-6988e4c3aa6d	3330	Mozirje
00050000-561f-cc71-6d1e-a9ed0a0b37b7	9000	Murska Sobota 
00050000-561f-cc71-f024-dd16d9ae4ebf	9001	Murska Sobota - poštni predali
00050000-561f-cc71-04bf-c38500f6043f	2366	Muta
00050000-561f-cc71-fc83-922c13d3bf13	4202	Naklo
00050000-561f-cc71-709c-247df64ac237	3331	Nazarje
00050000-561f-cc71-d8c4-8dfc2743f47c	1357	Notranje Gorice
00050000-561f-cc71-100e-9a8d1e9c3925	3203	Nova Cerkev
00050000-561f-cc71-a8bb-9af0e6b03836	5000	Nova Gorica 
00050000-561f-cc71-2c6d-ca2453f6ae22	5001	Nova Gorica - poštni predali
00050000-561f-cc71-8d37-43b1c93da489	1385	Nova vas
00050000-561f-cc71-0d7c-1933d72bc283	8000	Novo mesto
00050000-561f-cc71-ffd9-6245e7fcd9c6	8001	Novo mesto - poštni predali
00050000-561f-cc71-8040-c45480a6d385	6243	Obrov
00050000-561f-cc71-0a36-42a786071699	9233	Odranci
00050000-561f-cc71-c630-3e80b1d1926e	2317	Oplotnica
00050000-561f-cc71-490e-a8fb3c3aa070	2312	Orehova vas
00050000-561f-cc71-b607-7860eb4c39f6	2270	Ormož
00050000-561f-cc71-bde8-df8767f91025	1316	Ortnek
00050000-561f-cc71-4448-588316ef6e22	1337	Osilnica
00050000-561f-cc71-bc41-d2f2f8112b61	8222	Otočec
00050000-561f-cc71-e04a-2e07ec779b22	2361	Ožbalt
00050000-561f-cc71-32ee-b672ad400d9e	2231	Pernica
00050000-561f-cc71-57d8-4ce4bf51410e	2211	Pesnica pri Mariboru
00050000-561f-cc71-907b-9d821244d783	9203	Petrovci
00050000-561f-cc71-ffb0-a453263acb04	3301	Petrovče
00050000-561f-cc71-ba67-b49d0b8cdc2e	6330	Piran/Pirano
00050000-561f-cc71-4d17-44918eef4045	8255	Pišece
00050000-561f-cc71-635d-c821ae1c0c07	6257	Pivka
00050000-561f-cc71-1be6-c284fcca9bf4	6232	Planina
00050000-561f-cc71-8f26-50d81329e4c0	3225	Planina pri Sevnici
00050000-561f-cc71-5149-30bb19315fc7	6276	Pobegi
00050000-561f-cc71-8f70-25119e100361	8312	Podbočje
00050000-561f-cc71-61ca-c4f334fbd5c0	5243	Podbrdo
00050000-561f-cc71-7922-30ded7cde6e9	3254	Podčetrtek
00050000-561f-cc71-eb2a-1ec0b5865792	2273	Podgorci
00050000-561f-cc71-517a-0594ffdaca99	6216	Podgorje
00050000-561f-cc71-ecd7-d3dfcce3f15b	2381	Podgorje pri Slovenj Gradcu
00050000-561f-cc71-8394-b38d5697d825	6244	Podgrad
00050000-561f-cc71-7c2c-7ee1f1cb3d41	1414	Podkum
00050000-561f-cc71-3ef1-cf85a1214ed2	2286	Podlehnik
00050000-561f-cc71-2340-7395940a800a	5272	Podnanos
00050000-561f-cc71-2d57-17a2a1e7849d	4244	Podnart
00050000-561f-cc71-22a9-a8d853142740	3241	Podplat
00050000-561f-cc71-b3ff-733f9b0b2f88	3257	Podsreda
00050000-561f-cc71-2fb0-7db9d10e8992	2363	Podvelka
00050000-561f-cc71-5f03-383da9555bae	2208	Pohorje
00050000-561f-cc71-7568-3470a4fd1563	2257	Polenšak
00050000-561f-cc71-3e6d-088b71440fec	1355	Polhov Gradec
00050000-561f-cc71-9fb2-f0beed19f3c7	4223	Poljane nad Škofjo Loko
00050000-561f-cc71-bc62-4256c8270a60	2319	Poljčane
00050000-561f-cc71-f64d-6ace18eb951a	1272	Polšnik
00050000-561f-cc71-2de3-138267019cb7	3313	Polzela
00050000-561f-cc71-37f6-39ecf0b32017	3232	Ponikva
00050000-561f-cc71-ae9d-4a96ff2a57b5	6320	Portorož/Portorose
00050000-561f-cc71-8a20-e2215c200d13	6230	Postojna
00050000-561f-cc71-1440-0c9b54a171ed	2331	Pragersko
00050000-561f-cc71-f978-1b7ab3d32666	3312	Prebold
00050000-561f-cc71-0d48-b135eb4a8728	4205	Preddvor
00050000-561f-cc71-d897-df74703eecaa	6255	Prem
00050000-561f-cc71-a9b6-3dca8e698014	1352	Preserje
00050000-561f-cc71-c7e7-2e4b1996435b	6258	Prestranek
00050000-561f-cc71-ab42-7b117dd6d11e	2391	Prevalje
00050000-561f-cc71-a419-e12a5cd190ae	3262	Prevorje
00050000-561f-cc71-5e73-1e90eee4db08	1276	Primskovo 
00050000-561f-cc71-20a5-94c40e855c38	3253	Pristava pri Mestinju
00050000-561f-cc71-bd7b-c91b4d0478bf	9207	Prosenjakovci/Partosfalva
00050000-561f-cc71-3a09-3ef8e8703ddc	5297	Prvačina
00050000-561f-cc71-89be-224f26a7bfe4	2250	Ptuj
00050000-561f-cc71-4c8f-8f37e0716cf7	2323	Ptujska Gora
00050000-561f-cc71-eba9-4a86f00103f0	9201	Puconci
00050000-561f-cc71-8c3e-fa5074b9e22e	2327	Rače
00050000-561f-cc71-0d4d-7d824221f6b6	1433	Radeče
00050000-561f-cc71-33f0-d3a6354ca619	9252	Radenci
00050000-561f-cc71-d5a1-da642c220167	2360	Radlje ob Dravi
00050000-561f-cc71-758f-76cf7e98e649	1235	Radomlje
00050000-561f-cc71-8ccc-0cdaf41b873b	4240	Radovljica
00050000-561f-cc71-baa9-c59a33033041	8274	Raka
00050000-561f-cc71-c99d-18564a44904c	1381	Rakek
00050000-561f-cc71-685d-251a1fef637b	4283	Rateče - Planica
00050000-561f-cc71-f634-ad7a0a6b2db3	2390	Ravne na Koroškem
00050000-561f-cc71-6594-5bf10998bc0e	9246	Razkrižje
00050000-561f-cc71-2acc-07f47513fffa	3332	Rečica ob Savinji
00050000-561f-cc71-c003-e70aeddc3b66	5292	Renče
00050000-561f-cc71-2146-bce3f660fc75	1310	Ribnica
00050000-561f-cc71-636c-dea2fe959557	2364	Ribnica na Pohorju
00050000-561f-cc71-4efb-38c981b2c6a3	3272	Rimske Toplice
00050000-561f-cc71-0b8a-6122d9a3f40d	1314	Rob
00050000-561f-cc71-02d1-c088e9620f60	5215	Ročinj
00050000-561f-cc71-65d1-db569d85ea73	3250	Rogaška Slatina
00050000-561f-cc71-fcc0-bd69f10bc4d6	9262	Rogašovci
00050000-561f-cc71-05b3-3a5191daeca6	3252	Rogatec
00050000-561f-cc71-fa25-f8706da97e59	1373	Rovte
00050000-561f-cc71-9f9a-9369c7ea7ee6	2342	Ruše
00050000-561f-cc71-a36a-a331d7cbbf7a	1282	Sava
00050000-561f-cc71-424e-0600b82883f7	6333	Sečovlje/Sicciole
00050000-561f-cc71-580d-a07e5800ef78	4227	Selca
00050000-561f-cc71-e4ac-1cdcd202767b	2352	Selnica ob Dravi
00050000-561f-cc71-0c02-cae96fa73b38	8333	Semič
00050000-561f-cc71-69e2-a76a7c0e23e2	8281	Senovo
00050000-561f-cc71-a26c-74b8d3d81fa1	6224	Senožeče
00050000-561f-cc71-bfc0-7bfafdc770c9	8290	Sevnica
00050000-561f-cc71-3201-fe3e8feee087	6210	Sežana
00050000-561f-cc71-149c-6465e47ada7f	2214	Sladki Vrh
00050000-561f-cc71-6f35-d5a6044c9cad	5283	Slap ob Idrijci
00050000-561f-cc71-4c59-2adf2053ec66	2380	Slovenj Gradec
00050000-561f-cc71-e888-bbf58aaeec94	2310	Slovenska Bistrica
00050000-561f-cc71-7ebc-dcdafa821065	3210	Slovenske Konjice
00050000-561f-cc71-a21e-7432f43c2c91	1216	Smlednik
00050000-561f-cc71-97cf-d8a3a2a543d0	5232	Soča
00050000-561f-cc71-2c90-36acaaf2f991	1317	Sodražica
00050000-561f-cc71-1154-c1f14e67f1b9	3335	Solčava
00050000-561f-cc71-fcbb-05b3a9952365	5250	Solkan
00050000-561f-cc71-8209-8cbd32a23fa7	4229	Sorica
00050000-561f-cc71-fb2e-e6b382f185b6	4225	Sovodenj
00050000-561f-cc71-44b9-1dc8f95f779a	5281	Spodnja Idrija
00050000-561f-cc71-4606-f7ab780fb4f5	2241	Spodnji Duplek
00050000-561f-cc71-702e-3e3b7c75b20b	9245	Spodnji Ivanjci
00050000-561f-cc71-3913-68e9327639b4	2277	Središče ob Dravi
00050000-561f-cc71-baaa-e9b328b8085f	4267	Srednja vas v Bohinju
00050000-561f-cc71-739a-0a9a0fb29abc	8256	Sromlje 
00050000-561f-cc71-c526-ee15a118369d	5224	Srpenica
00050000-561f-cc71-2285-85ee9173a2d5	1242	Stahovica
00050000-561f-cc71-7cab-a628180f1f73	1332	Stara Cerkev
00050000-561f-cc71-449f-5fc528b87e8c	8342	Stari trg ob Kolpi
00050000-561f-cc71-9c49-be501bce5058	1386	Stari trg pri Ložu
00050000-561f-cc71-603b-24f8ad15ab87	2205	Starše
00050000-561f-cc71-38b5-adcb4a5fe7fb	2289	Stoperce
00050000-561f-cc71-dca8-7d922378def3	8322	Stopiče
00050000-561f-cc71-a023-7da1869afb26	3206	Stranice
00050000-561f-cc71-e77c-f0af384246f6	8351	Straža
00050000-561f-cc71-ed19-9ce5ce184d06	1313	Struge
00050000-561f-cc71-82e1-c53ab33c63a9	8293	Studenec
00050000-561f-cc71-5c76-a9e12ee95fbb	8331	Suhor
00050000-561f-cc71-20ab-4dccf52d947d	2233	Sv. Ana v Slovenskih goricah
00050000-561f-cc71-56ae-4e49766f0601	2235	Sv. Trojica v Slovenskih goricah
00050000-561f-cc71-21fc-e4438ac9e917	2353	Sveti Duh na Ostrem Vrhu
00050000-561f-cc71-c6da-ba9d1e7ea7bd	9244	Sveti Jurij ob Ščavnici
00050000-561f-cc71-535d-2d1deba1b922	3264	Sveti Štefan
00050000-561f-cc71-730d-3d50827c69bf	2258	Sveti Tomaž
00050000-561f-cc71-e5a3-5f4f1cad3a6a	9204	Šalovci
00050000-561f-cc71-9d15-930efa453839	5261	Šempas
00050000-561f-cc71-d489-c4aed4c4b2eb	5290	Šempeter pri Gorici
00050000-561f-cc71-1ac7-5c27da252546	3311	Šempeter v Savinjski dolini
00050000-561f-cc71-bcbf-353a5e2b290f	4208	Šenčur
00050000-561f-cc71-ada0-6d36c8d9c7dd	2212	Šentilj v Slovenskih goricah
00050000-561f-cc71-183f-9aeb3466b9d5	8297	Šentjanž
00050000-561f-cc71-57ff-40b28976d600	2373	Šentjanž pri Dravogradu
00050000-561f-cc71-88f3-d009c755fc80	8310	Šentjernej
00050000-561f-cc71-8cc3-f5a8eb7f62d2	3230	Šentjur
00050000-561f-cc71-ed85-8f632d815b60	3271	Šentrupert
00050000-561f-cc71-c1e3-5d1fc76af779	8232	Šentrupert
00050000-561f-cc71-0a09-52d430268c10	1296	Šentvid pri Stični
00050000-561f-cc71-12e3-bc992c962648	8275	Škocjan
00050000-561f-cc71-2d68-aa785363de7f	6281	Škofije
00050000-561f-cc71-f40b-4b30003b38b5	4220	Škofja Loka
00050000-561f-cc71-99c5-df0e135d41c0	3211	Škofja vas
00050000-561f-cc71-a2b9-19eb15a7f001	1291	Škofljica
00050000-561f-cc71-6b08-b4f7b28b9d4f	6274	Šmarje
00050000-561f-cc71-d8db-8b6b12a17d52	1293	Šmarje - Sap
00050000-561f-cc71-b697-54388fa1c909	3240	Šmarje pri Jelšah
00050000-561f-cc71-1de6-b6ecf502dd12	8220	Šmarješke Toplice
00050000-561f-cc71-11fb-ef196f1b5142	2315	Šmartno na Pohorju
00050000-561f-cc71-71b9-7eb5d9d9017e	3341	Šmartno ob Dreti
00050000-561f-cc71-d7db-ca59388b1bb8	3327	Šmartno ob Paki
00050000-561f-cc71-6bde-5cd96ff5f4db	1275	Šmartno pri Litiji
00050000-561f-cc71-7de8-6f7ff1d4044e	2383	Šmartno pri Slovenj Gradcu
00050000-561f-cc71-ecfc-479a9433fb81	3201	Šmartno v Rožni dolini
00050000-561f-cc71-855a-2814f3552499	3325	Šoštanj
00050000-561f-cc71-c6d0-4c3d5b053a7a	6222	Štanjel
00050000-561f-cc71-e468-44b33be2f2de	3220	Štore
00050000-561f-cc71-2db3-3cf06d4676e6	3304	Tabor
00050000-561f-cc71-e4ec-ad74823fbce2	3221	Teharje
00050000-561f-cc71-9a2c-d93ca76c0e26	9251	Tišina
00050000-561f-cc71-1c49-eff54568f292	5220	Tolmin
00050000-561f-cc71-5a76-d3192563eb2b	3326	Topolšica
00050000-561f-cc71-188a-834418cc0d11	2371	Trbonje
00050000-561f-cc71-e39d-b413a89fca31	1420	Trbovlje
00050000-561f-cc71-ea45-00253ec12eec	8231	Trebelno 
00050000-561f-cc71-676d-0657450e83f8	8210	Trebnje
00050000-561f-cc71-df89-cd8e91a3e786	5252	Trnovo pri Gorici
00050000-561f-cc71-3c49-c3e5956a5bb2	2254	Trnovska vas
00050000-561f-cc71-acb2-d2fb4ec470b9	1222	Trojane
00050000-561f-cc71-9c46-cbaa39f1b1d6	1236	Trzin
00050000-561f-cc71-3a4b-d074014d4b48	4290	Tržič
00050000-561f-cc71-1e3f-50c40a82ecf5	8295	Tržišče
00050000-561f-cc71-c1cf-545d495ded7e	1311	Turjak
00050000-561f-cc71-c6fa-aa9665793710	9224	Turnišče
00050000-561f-cc71-af5e-4dabb28c5ad4	8323	Uršna sela
00050000-561f-cc71-1e6c-0965028f7b13	1252	Vače
00050000-561f-cc71-a919-34ad0f4f5fc7	3320	Velenje 
00050000-561f-cc71-a346-ab471f920062	3322	Velenje - poštni predali
00050000-561f-cc71-f7a6-140a14987587	8212	Velika Loka
00050000-561f-cc71-bb99-953d8e0706c1	2274	Velika Nedelja
00050000-561f-cc71-1f3f-f698723102cb	9225	Velika Polana
00050000-561f-cc71-3585-d771323ccbd4	1315	Velike Lašče
00050000-561f-cc71-b9a3-bb5961b38060	8213	Veliki Gaber
00050000-561f-cc71-c783-9a4e890ef508	9241	Veržej
00050000-561f-cc71-5e0e-138b5d3661d9	1312	Videm - Dobrepolje
00050000-561f-cc71-ff03-87589b126c76	2284	Videm pri Ptuju
00050000-561f-cc71-4737-76455c9295c0	8344	Vinica
00050000-561f-cc71-185b-1365107bde5a	5271	Vipava
00050000-561f-cc71-3b09-ea15722a2127	4212	Visoko
00050000-561f-cc71-ad57-d6496be74a8d	1294	Višnja Gora
00050000-561f-cc71-caaa-ad9428374cc9	3205	Vitanje
00050000-561f-cc71-05a5-7557817967a6	2255	Vitomarci
00050000-561f-cc71-5dd9-f6388c0c61cc	1217	Vodice
00050000-561f-cc71-f318-6cc031edb9a1	3212	Vojnik\t
00050000-561f-cc71-025c-a3dd91dc6c24	5293	Volčja Draga
00050000-561f-cc71-1208-577184e231a5	2232	Voličina
00050000-561f-cc71-ae50-46cf0bee82e3	3305	Vransko
00050000-561f-cc71-738f-5ef18389fe27	6217	Vremski Britof
00050000-561f-cc71-9da8-0440c48176a0	1360	Vrhnika
00050000-561f-cc71-c9b4-5d6e43e4f089	2365	Vuhred
00050000-561f-cc71-e201-fc686d91379f	2367	Vuzenica
00050000-561f-cc71-3882-69ff9ca69259	8292	Zabukovje 
00050000-561f-cc71-faee-2ca49cf3fce8	1410	Zagorje ob Savi
00050000-561f-cc71-0ed2-ae0a4a992f93	1303	Zagradec
00050000-561f-cc71-dd60-8ef12a6a1c62	2283	Zavrč
00050000-561f-cc71-01d9-794c02a0cbf7	8272	Zdole 
00050000-561f-cc71-75b6-aa04708ff325	4201	Zgornja Besnica
00050000-561f-cc71-7f59-6fadd4dde0ef	2242	Zgornja Korena
00050000-561f-cc72-3c56-a4bd39f3c503	2201	Zgornja Kungota
00050000-561f-cc72-a4f3-730c5dd5a4ec	2316	Zgornja Ložnica
00050000-561f-cc72-c606-c9218793e5cf	2314	Zgornja Polskava
00050000-561f-cc72-3d90-d0d423cdd5a8	2213	Zgornja Velka
00050000-561f-cc72-4643-f962c817ab10	4247	Zgornje Gorje
00050000-561f-cc72-1b2b-88a71b0bf663	4206	Zgornje Jezersko
00050000-561f-cc72-3628-f7d8e305be16	2285	Zgornji Leskovec
00050000-561f-cc72-3762-ee9ada5757c3	1432	Zidani Most
00050000-561f-cc72-0b49-cecfbdd0014d	3214	Zreče
00050000-561f-cc72-8367-c4f5b68a98ab	4209	Žabnica
00050000-561f-cc72-3fff-fdad8ec2c686	3310	Žalec
00050000-561f-cc72-3aef-22ff1a7103e8	4228	Železniki
00050000-561f-cc72-4876-5523bd9cf21d	2287	Žetale
00050000-561f-cc72-d215-cf2a6668d965	4226	Žiri
00050000-561f-cc72-0ea7-5165a719843c	4274	Žirovnica
00050000-561f-cc72-b5d3-0fbac029998d	8360	Žužemberk
\.


--
-- TOC entry 3087 (class 0 OID 22096040)
-- Dependencies: 234
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 22095632)
-- Dependencies: 207
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 22095412)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561f-cc75-471f-8f449702f0c4	00080000-561f-cc75-772b-0fbb0cd8c0a9	\N	00040000-561f-cc72-6553-2c250d3f0f03	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561f-cc75-6e0a-649ed5717086	00080000-561f-cc75-772b-0fbb0cd8c0a9	\N	00040000-561f-cc72-6553-2c250d3f0f03	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561f-cc75-f95f-343c44e595cc	00080000-561f-cc75-29e0-5ecf6e80005b	\N	00040000-561f-cc72-6553-2c250d3f0f03	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3049 (class 0 OID 22095516)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 22095644)
-- Dependencies: 209
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 22096054)
-- Dependencies: 235
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 22096064)
-- Dependencies: 236
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561f-cc75-9d14-433691b1a1dc	00080000-561f-cc75-bf03-5aeb8677a4d9	0987	AK
00190000-561f-cc75-65c3-1dcd38227754	00080000-561f-cc75-29e0-5ecf6e80005b	0989	AK
00190000-561f-cc75-f484-fdc6177017f8	00080000-561f-cc75-fc4a-295c812fd423	0986	AK
00190000-561f-cc75-552e-f7a1146399be	00080000-561f-cc75-abcf-333d9865f695	0984	AK
00190000-561f-cc75-4f87-3a4ca4a1eb95	00080000-561f-cc75-4edc-268cc49362c1	0983	AK
00190000-561f-cc75-3557-0dc7735b7bd6	00080000-561f-cc75-8739-f25e67292b61	0982	AK
00190000-561f-cc78-79a7-47ea8b9a99f0	00080000-561f-cc78-c570-656cbfe0da27	1001	AK
\.


--
-- TOC entry 3086 (class 0 OID 22095979)
-- Dependencies: 233
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561f-cc76-ccfb-2868353d8143	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3090 (class 0 OID 22096072)
-- Dependencies: 237
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22095673)
-- Dependencies: 213
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561f-cc75-29f9-b6a8a17bc674	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561f-cc75-9e8f-75d45e61b1e1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561f-cc75-53df-07345fc9b83e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561f-cc75-db78-473ec85533f3	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561f-cc75-c199-93a2a5fe2804	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561f-cc75-72e3-d08fbf767a6d	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561f-cc75-8975-f4ec20ca2808	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3058 (class 0 OID 22095617)
-- Dependencies: 205
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22095607)
-- Dependencies: 204
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22095818)
-- Dependencies: 226
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22095748)
-- Dependencies: 220
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 22095490)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 22095263)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561f-cc78-c570-656cbfe0da27	00010000-561f-cc73-52a7-077f32823751	2015-10-15 17:55:36	INS	a:0:{}
2	App\\Entity\\Option	00000000-561f-cc78-800b-fc8ea0f32b38	00010000-561f-cc73-52a7-077f32823751	2015-10-15 17:55:36	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561f-cc78-79a7-47ea8b9a99f0	00010000-561f-cc73-52a7-077f32823751	2015-10-15 17:55:36	INS	a:0:{}
\.


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3067 (class 0 OID 22095686)
-- Dependencies: 214
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 22095301)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561f-cc72-5628-74d7a01aeb45	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561f-cc72-6e3c-1819fd8a755c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561f-cc72-e58b-e03c6b820b95	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561f-cc72-dde3-553c6bd2335d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561f-cc72-7b14-f4e4c074f24e	planer	Planer dogodkov v koledarju	t
00020000-561f-cc72-59b5-da262f0fdb5c	kadrovska	Kadrovska služba	t
00020000-561f-cc72-55c7-c2a3b2fa1e4b	arhivar	Ažuriranje arhivalij	t
00020000-561f-cc72-a91d-0c76fda26b47	igralec	Igralec	t
00020000-561f-cc72-500f-eb62767b41db	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561f-cc75-7ca7-7189630906e0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3030 (class 0 OID 22095285)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561f-cc73-86f8-54bc5c26b5ed	00020000-561f-cc72-e58b-e03c6b820b95
00010000-561f-cc73-52a7-077f32823751	00020000-561f-cc72-e58b-e03c6b820b95
00010000-561f-cc75-b8b7-2a4b0befd763	00020000-561f-cc75-7ca7-7189630906e0
\.


--
-- TOC entry 3069 (class 0 OID 22095700)
-- Dependencies: 216
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 22095638)
-- Dependencies: 208
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22095584)
-- Dependencies: 202
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 22095250)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561f-cc72-42c5-423609ff0000	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561f-cc72-2d50-f37abd1c85ed	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561f-cc72-7467-89da147e5065	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561f-cc72-5661-baaec5a63401	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561f-cc72-5426-7dbb374f1fba	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3025 (class 0 OID 22095242)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561f-cc72-75e8-8bf7d4307bd1	00230000-561f-cc72-5661-baaec5a63401	popa
00240000-561f-cc72-26fe-f160a6e4970b	00230000-561f-cc72-5661-baaec5a63401	oseba
00240000-561f-cc72-4cea-073d5a8757ff	00230000-561f-cc72-5661-baaec5a63401	tippopa
00240000-561f-cc72-063b-a592ccff5662	00230000-561f-cc72-5661-baaec5a63401	organizacijskaenota
00240000-561f-cc72-e4d0-99b56fbcf19b	00230000-561f-cc72-5661-baaec5a63401	sezona
00240000-561f-cc72-374d-0b6afd0f0e7b	00230000-561f-cc72-2d50-f37abd1c85ed	prostor
00240000-561f-cc72-18d4-05a058f8e756	00230000-561f-cc72-5661-baaec5a63401	besedilo
00240000-561f-cc72-e124-71c2d97acd0f	00230000-561f-cc72-5661-baaec5a63401	uprizoritev
00240000-561f-cc72-35b5-359239fb779f	00230000-561f-cc72-5661-baaec5a63401	funkcija
00240000-561f-cc72-d67f-c6182f1061fa	00230000-561f-cc72-5661-baaec5a63401	tipfunkcije
00240000-561f-cc72-221f-16f05b55111b	00230000-561f-cc72-5661-baaec5a63401	alternacija
00240000-561f-cc72-614d-3a5d87064f28	00230000-561f-cc72-42c5-423609ff0000	pogodba
00240000-561f-cc72-a99d-7145993fd0df	00230000-561f-cc72-5661-baaec5a63401	zaposlitev
00240000-561f-cc72-6f04-08d3f2e59242	00230000-561f-cc72-5661-baaec5a63401	zvrstuprizoritve
00240000-561f-cc72-2d3d-847f76089f7b	00230000-561f-cc72-42c5-423609ff0000	programdela
00240000-561f-cc72-4888-096e383bd53c	00230000-561f-cc72-5661-baaec5a63401	zapis
\.


--
-- TOC entry 3024 (class 0 OID 22095237)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f62e9181-357f-47a0-b6d0-08faf0243d6f	00240000-561f-cc72-75e8-8bf7d4307bd1	0	1001
\.


--
-- TOC entry 3075 (class 0 OID 22095765)
-- Dependencies: 222
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561f-cc76-6de9-5d9af28a33e0	000e0000-561f-cc75-59e5-1e1c7400894b	00080000-561f-cc75-772b-0fbb0cd8c0a9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561f-cc72-b12d-49c6791713ae
00270000-561f-cc76-d940-4ee3bd4c48e7	000e0000-561f-cc75-59e5-1e1c7400894b	00080000-561f-cc75-772b-0fbb0cd8c0a9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561f-cc72-b12d-49c6791713ae
\.


--
-- TOC entry 3038 (class 0 OID 22095373)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22095594)
-- Dependencies: 203
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-561f-cc76-ac80-fd383f45ba24	00180000-561f-cc76-e133-0517af667730	000c0000-561f-cc76-7f8d-75cca0b7d5ec	00090000-561f-cc75-0792-645ca663b2eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-cc76-e3a7-b05156411450	00180000-561f-cc76-e133-0517af667730	000c0000-561f-cc76-a23b-a17e9e76858f	00090000-561f-cc75-7545-426f1b9f549d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-cc76-dc44-e0d1ad01c21a	00180000-561f-cc76-e133-0517af667730	000c0000-561f-cc76-8162-290f09535b0d	00090000-561f-cc75-7a5c-39976bddb9b4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-cc76-3584-a8060bd1d158	00180000-561f-cc76-e133-0517af667730	000c0000-561f-cc76-3356-110a1dc5e442	00090000-561f-cc75-69ef-db6b9cd5249f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-cc76-dd99-e2a367253a64	00180000-561f-cc76-e133-0517af667730	000c0000-561f-cc76-88a5-e5ed6a9ceaa7	00090000-561f-cc75-2433-b1649c87c4e7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-561f-cc76-9f0c-2948c4495722	00180000-561f-cc76-5d88-554e1afcd61c	\N	00090000-561f-cc75-2433-b1649c87c4e7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3078 (class 0 OID 22095806)
-- Dependencies: 225
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561f-cc72-b73b-f19dc1b4444b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561f-cc72-0d99-1c0abb832cfb	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561f-cc72-e0e4-240c86122b7f	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561f-cc72-31c6-7e4295b3e3e7	04	Režija	Režija	Režija	umetnik	30
000f0000-561f-cc72-8bf5-5d575b73af4d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561f-cc72-0fa2-cbbb637bc34c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561f-cc72-1e2d-e8f6bebd410a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561f-cc72-a16c-5373bd4a366a	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561f-cc72-ef64-d9a4940967d4	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561f-cc72-ee78-794d48cfbb2a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561f-cc72-89a0-e8fed0474264	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561f-cc72-b09d-9efc996c403c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561f-cc72-924d-d1aac9b13162	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561f-cc72-4e86-09c06e8ae071	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561f-cc72-1748-541f1f4fe2f3	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561f-cc72-f0b8-5f4e6b5b4161	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561f-cc72-1ca3-09c7d84f970e	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561f-cc72-3161-4c817f7e59ca	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3035 (class 0 OID 22095327)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-561f-cc75-f34b-ff20f3cd67d2	0001	šola	osnovna ali srednja šola
00400000-561f-cc75-b39c-ea0c0118b550	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-561f-cc75-8c43-e9b763dc13c4	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3091 (class 0 OID 22096083)
-- Dependencies: 238
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561f-cc72-be9b-19fae1f01c9d	01	Velika predstava	f	1.00	1.00
002b0000-561f-cc72-db7c-80e5f3bebecc	02	Mala predstava	f	0.50	0.50
002b0000-561f-cc72-13fa-1853b55f60e5	03	Mala koprodukcija	t	0.40	1.00
002b0000-561f-cc72-f135-d00338426495	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561f-cc72-537a-eadc20a17a03	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3044 (class 0 OID 22095447)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 22095272)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561f-cc73-52a7-077f32823751	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROlr6ACHwMHAgmKr9J/Hf7DFPdQxxbgmO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561f-cc75-361d-18d7eba024c8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561f-cc75-7f30-582977d92d4b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561f-cc75-1ff7-4429ff04a819	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561f-cc75-598c-9cce0f83784f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561f-cc75-46ee-299966900401	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561f-cc75-e84b-6f896af2be0a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561f-cc75-05b3-e1536d3b55fc	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561f-cc75-e28b-4d1ca1d62d92	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561f-cc75-ea2c-9376175d96d3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561f-cc75-b8b7-2a4b0befd763	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561f-cc73-86f8-54bc5c26b5ed	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3082 (class 0 OID 22095856)
-- Dependencies: 229
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561f-cc75-416e-9ca7ca2f9228	00160000-561f-cc74-bbb4-f6825d995326	\N	00140000-561f-cc72-ed53-612a5802f458	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561f-cc75-c199-93a2a5fe2804
000e0000-561f-cc75-59e5-1e1c7400894b	00160000-561f-cc75-6bdd-3989409cbc90	\N	00140000-561f-cc72-17c5-5e48361ec2fa	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561f-cc75-72e3-d08fbf767a6d
000e0000-561f-cc75-7213-d2b6798ce75d	\N	\N	00140000-561f-cc72-17c5-5e48361ec2fa	00190000-561f-cc75-9d14-433691b1a1dc	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-cc75-c199-93a2a5fe2804
000e0000-561f-cc75-d606-e05f0c7ad443	\N	\N	00140000-561f-cc72-17c5-5e48361ec2fa	00190000-561f-cc75-9d14-433691b1a1dc	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-cc75-c199-93a2a5fe2804
000e0000-561f-cc75-ec28-0c85eb66f98d	\N	\N	00140000-561f-cc72-17c5-5e48361ec2fa	00190000-561f-cc75-9d14-433691b1a1dc	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-cc75-29f9-b6a8a17bc674
000e0000-561f-cc75-df2f-7718409bcb39	\N	\N	00140000-561f-cc72-17c5-5e48361ec2fa	00190000-561f-cc75-9d14-433691b1a1dc	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-cc75-29f9-b6a8a17bc674
\.


--
-- TOC entry 3051 (class 0 OID 22095538)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561f-cc76-7e68-a47ec407e8f4	000e0000-561f-cc75-59e5-1e1c7400894b	\N	1	
00200000-561f-cc76-f0c8-f074b226be86	000e0000-561f-cc75-59e5-1e1c7400894b	\N	2	
00200000-561f-cc76-8e30-7656b3715483	000e0000-561f-cc75-59e5-1e1c7400894b	\N	3	
00200000-561f-cc76-53a8-f7d452634269	000e0000-561f-cc75-59e5-1e1c7400894b	\N	4	
00200000-561f-cc76-261d-68624c51bc8d	000e0000-561f-cc75-59e5-1e1c7400894b	\N	5	
\.


--
-- TOC entry 3065 (class 0 OID 22095665)
-- Dependencies: 212
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 22095779)
-- Dependencies: 223
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561f-cc72-b16e-3b2281ddda9e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561f-cc72-6381-bc3756b47a09	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561f-cc72-dee5-7ebbd0e46afb	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561f-cc72-8245-6cc8c3511bac	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561f-cc72-317e-50f1cdabe031	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561f-cc72-ec54-306351731b84	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561f-cc72-c0ba-ee9df0fe13d7	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561f-cc72-4d75-ef19c7afdacd	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561f-cc72-b12d-49c6791713ae	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561f-cc72-2b70-52bdadf9d85b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561f-cc72-f62d-27fb030e0414	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561f-cc72-1e42-100f470bcf78	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561f-cc72-696b-735fffe11377	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561f-cc72-5e1d-472ca5b80416	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561f-cc72-c83b-70570872bc47	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561f-cc72-34de-274dade5b53b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561f-cc72-365a-30e04152768d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561f-cc72-f5e0-1b86886c3755	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561f-cc72-a046-b23a82b8c2a1	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561f-cc72-6dc4-bb321264777e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561f-cc72-36c1-3f47ee8d4817	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561f-cc72-a656-2e2b8a6a1f9c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561f-cc72-0789-9364227b13f6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561f-cc72-5394-f4f42b8122cc	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561f-cc72-79c8-20c5d21e9dbe	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561f-cc72-099c-5106300a0471	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561f-cc72-e528-e8be227bd422	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561f-cc72-ad77-dd5307d1a5e9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3094 (class 0 OID 22096130)
-- Dependencies: 241
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 22096102)
-- Dependencies: 240
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22096142)
-- Dependencies: 242
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22095737)
-- Dependencies: 219
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-561f-cc75-42b3-7baaf7e34bc1	00090000-561f-cc75-7545-426f1b9f549d	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-cc75-ac90-abf61de320aa	00090000-561f-cc75-7a5c-39976bddb9b4	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-cc75-a163-3800c93960e9	00090000-561f-cc75-545c-0b5b3020b61f	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-cc75-be3f-26b5f548a2ba	00090000-561f-cc75-51fe-e4fabaed3c32	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-cc75-2640-a8ed16703d92	00090000-561f-cc75-0792-645ca663b2eb	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-561f-cc75-d600-bd72837c0281	00090000-561f-cc75-e872-d8963a4b77c1	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3053 (class 0 OID 22095573)
-- Dependencies: 200
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 22095846)
-- Dependencies: 228
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561f-cc72-ed53-612a5802f458	01	Drama	drama (SURS 01)
00140000-561f-cc72-b409-0c658f7fa9ac	02	Opera	opera (SURS 02)
00140000-561f-cc72-d650-024d41beb85f	03	Balet	balet (SURS 03)
00140000-561f-cc72-8917-0f3c3360cf54	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561f-cc72-69c4-5b1cb9ae7db4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561f-cc72-17c5-5e48361ec2fa	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561f-cc72-03f3-a7050658b36d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3071 (class 0 OID 22095727)
-- Dependencies: 218
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2539 (class 2606 OID 22095326)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 22095905)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 22095895)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 22095762)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 22095804)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 22096182)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 22095562)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 22095583)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 22096100)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 22095473)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 22095973)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22095723)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 22095536)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 22095511)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 22095487)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 22095630)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 22096159)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 22096166)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2805 (class 2606 OID 22096190)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 22028085)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2662 (class 2606 OID 22095657)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 22095445)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 22095345)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 22095407)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 22095369)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 22095315)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2530 (class 2606 OID 22095300)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22095663)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 22095699)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 22095841)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22095397)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 22095433)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 22096052)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 22095636)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 22095423)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 22095524)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 22095648)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 22096061)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 22096069)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 22096039)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 22096081)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 22095681)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 22095621)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 22095612)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22095828)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 22095755)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 22095499)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 22095271)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22095690)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 22095289)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2532 (class 2606 OID 22095309)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 22095708)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 22095643)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 22095592)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 22095259)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 22095247)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 22095241)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22095775)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 22095378)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 22095603)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 22095815)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22095334)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 22096093)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 22095458)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 22095284)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 22095874)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 22095546)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 22095671)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22095787)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 22096140)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 22096124)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 22096148)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 22095745)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 22095577)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22095854)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 22095735)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 1259 OID 22095571)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2615 (class 1259 OID 22095572)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2616 (class 1259 OID 22095570)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2617 (class 1259 OID 22095569)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2618 (class 1259 OID 22095568)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2705 (class 1259 OID 22095776)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2706 (class 1259 OID 22095777)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2707 (class 1259 OID 22095778)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 22096161)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2792 (class 1259 OID 22096160)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2557 (class 1259 OID 22095399)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2558 (class 1259 OID 22095400)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2663 (class 1259 OID 22095664)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2778 (class 1259 OID 22096128)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2779 (class 1259 OID 22096127)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2780 (class 1259 OID 22096129)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2781 (class 1259 OID 22096126)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2782 (class 1259 OID 22096125)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2657 (class 1259 OID 22095650)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2658 (class 1259 OID 22095649)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2609 (class 1259 OID 22095547)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2687 (class 1259 OID 22095724)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2688 (class 1259 OID 22095726)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2689 (class 1259 OID 22095725)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2589 (class 1259 OID 22095489)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2590 (class 1259 OID 22095488)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2769 (class 1259 OID 22096082)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2721 (class 1259 OID 22095843)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 22095844)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2723 (class 1259 OID 22095845)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2788 (class 1259 OID 22096149)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2730 (class 1259 OID 22095879)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2731 (class 1259 OID 22095876)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2732 (class 1259 OID 22095880)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2733 (class 1259 OID 22095878)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2734 (class 1259 OID 22095877)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2579 (class 1259 OID 22095460)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2580 (class 1259 OID 22095459)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2548 (class 1259 OID 22095372)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2675 (class 1259 OID 22095691)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 22095316)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2535 (class 1259 OID 22095317)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2680 (class 1259 OID 22095711)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2681 (class 1259 OID 22095710)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2682 (class 1259 OID 22095709)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2562 (class 1259 OID 22095410)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2563 (class 1259 OID 22095409)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2564 (class 1259 OID 22095411)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2602 (class 1259 OID 22095525)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2603 (class 1259 OID 22095526)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2514 (class 1259 OID 22095249)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2637 (class 1259 OID 22095616)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2638 (class 1259 OID 22095614)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2639 (class 1259 OID 22095613)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2640 (class 1259 OID 22095615)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2525 (class 1259 OID 22095290)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2526 (class 1259 OID 22095291)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2666 (class 1259 OID 22095672)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2801 (class 1259 OID 22096183)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2703 (class 1259 OID 22095764)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2704 (class 1259 OID 22095763)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2802 (class 1259 OID 22096191)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2803 (class 1259 OID 22096192)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2652 (class 1259 OID 22095637)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2697 (class 1259 OID 22095756)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2698 (class 1259 OID 22095757)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 22095978)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2752 (class 1259 OID 22095977)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2753 (class 1259 OID 22095974)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 22095975)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2755 (class 1259 OID 22095976)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2568 (class 1259 OID 22095425)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2569 (class 1259 OID 22095424)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2570 (class 1259 OID 22095426)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 22095685)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2670 (class 1259 OID 22095684)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2761 (class 1259 OID 22096062)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2762 (class 1259 OID 22096063)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2744 (class 1259 OID 22095909)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2745 (class 1259 OID 22095910)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2746 (class 1259 OID 22095907)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2747 (class 1259 OID 22095908)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2693 (class 1259 OID 22095746)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2694 (class 1259 OID 22095747)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2643 (class 1259 OID 22095625)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2644 (class 1259 OID 22095624)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2645 (class 1259 OID 22095622)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2646 (class 1259 OID 22095623)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2740 (class 1259 OID 22095897)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 22095896)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2593 (class 1259 OID 22095500)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2596 (class 1259 OID 22095514)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2597 (class 1259 OID 22095513)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2598 (class 1259 OID 22095512)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2599 (class 1259 OID 22095515)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2608 (class 1259 OID 22095537)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2758 (class 1259 OID 22096053)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2777 (class 1259 OID 22096101)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2795 (class 1259 OID 22096167)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2796 (class 1259 OID 22096168)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2544 (class 1259 OID 22095347)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2545 (class 1259 OID 22095346)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2553 (class 1259 OID 22095379)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2554 (class 1259 OID 22095380)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2624 (class 1259 OID 22095578)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2632 (class 1259 OID 22095606)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 22095605)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 22095604)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2619 (class 1259 OID 22095564)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2620 (class 1259 OID 22095565)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2621 (class 1259 OID 22095563)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2622 (class 1259 OID 22095567)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2623 (class 1259 OID 22095566)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 22095398)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 22095335)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 22095336)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2585 (class 1259 OID 22095474)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 22095476)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2587 (class 1259 OID 22095475)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2588 (class 1259 OID 22095477)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2651 (class 1259 OID 22095631)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2726 (class 1259 OID 22095842)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 22095875)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2717 (class 1259 OID 22095816)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2718 (class 1259 OID 22095817)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2551 (class 1259 OID 22095370)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 22095371)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2690 (class 1259 OID 22095736)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 22095260)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2578 (class 1259 OID 22095446)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2567 (class 1259 OID 22095408)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 22095248)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2774 (class 1259 OID 22096094)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 22095683)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2674 (class 1259 OID 22095682)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 22095906)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 22095434)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 22095855)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2785 (class 1259 OID 22096141)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2767 (class 1259 OID 22096070)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2768 (class 1259 OID 22096071)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2714 (class 1259 OID 22095805)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2631 (class 1259 OID 22095593)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 22095310)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2840 (class 2606 OID 22096343)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2839 (class 2606 OID 22096348)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2835 (class 2606 OID 22096368)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2841 (class 2606 OID 22096338)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2837 (class 2606 OID 22096358)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2836 (class 2606 OID 22096363)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2838 (class 2606 OID 22096353)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2877 (class 2606 OID 22096538)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2876 (class 2606 OID 22096543)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2875 (class 2606 OID 22096548)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 22096713)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2910 (class 2606 OID 22096708)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2818 (class 2606 OID 22096248)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2817 (class 2606 OID 22096253)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2858 (class 2606 OID 22096453)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2904 (class 2606 OID 22096693)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2905 (class 2606 OID 22096688)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2903 (class 2606 OID 22096698)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2906 (class 2606 OID 22096683)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2907 (class 2606 OID 22096678)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2856 (class 2606 OID 22096448)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2857 (class 2606 OID 22096443)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2834 (class 2606 OID 22096333)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2868 (class 2606 OID 22096493)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2866 (class 2606 OID 22096503)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2867 (class 2606 OID 22096498)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2827 (class 2606 OID 22096303)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 22096298)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 22096433)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 22096668)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2880 (class 2606 OID 22096553)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 22096558)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2878 (class 2606 OID 22096563)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2908 (class 2606 OID 22096703)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2882 (class 2606 OID 22096583)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2885 (class 2606 OID 22096568)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2881 (class 2606 OID 22096588)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2883 (class 2606 OID 22096578)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2884 (class 2606 OID 22096573)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2825 (class 2606 OID 22096293)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2826 (class 2606 OID 22096288)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2813 (class 2606 OID 22096233)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2814 (class 2606 OID 22096228)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2862 (class 2606 OID 22096473)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2810 (class 2606 OID 22096208)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2809 (class 2606 OID 22096213)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2863 (class 2606 OID 22096488)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2864 (class 2606 OID 22096483)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2865 (class 2606 OID 22096478)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2820 (class 2606 OID 22096263)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2821 (class 2606 OID 22096258)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2819 (class 2606 OID 22096268)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2832 (class 2606 OID 22096318)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 22096323)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2806 (class 2606 OID 22096193)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2846 (class 2606 OID 22096408)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2848 (class 2606 OID 22096398)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2849 (class 2606 OID 22096393)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2847 (class 2606 OID 22096403)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2808 (class 2606 OID 22096198)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2807 (class 2606 OID 22096203)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2859 (class 2606 OID 22096458)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2913 (class 2606 OID 22096728)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 22096533)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2874 (class 2606 OID 22096528)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2915 (class 2606 OID 22096733)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2914 (class 2606 OID 22096738)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2855 (class 2606 OID 22096438)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2872 (class 2606 OID 22096518)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2871 (class 2606 OID 22096523)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 22096643)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2893 (class 2606 OID 22096638)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2896 (class 2606 OID 22096623)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 22096628)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2894 (class 2606 OID 22096633)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2823 (class 2606 OID 22096278)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 22096273)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2822 (class 2606 OID 22096283)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 22096468)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2861 (class 2606 OID 22096463)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 22096653)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2898 (class 2606 OID 22096658)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2889 (class 2606 OID 22096613)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 22096618)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2891 (class 2606 OID 22096603)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2890 (class 2606 OID 22096608)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2870 (class 2606 OID 22096508)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 22096513)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2850 (class 2606 OID 22096428)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2851 (class 2606 OID 22096423)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2853 (class 2606 OID 22096413)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2852 (class 2606 OID 22096418)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2886 (class 2606 OID 22096598)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2887 (class 2606 OID 22096593)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 22096308)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2830 (class 2606 OID 22096313)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 22096328)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2897 (class 2606 OID 22096648)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 22096663)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2902 (class 2606 OID 22096673)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2912 (class 2606 OID 22096718)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 22096723)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2811 (class 2606 OID 22096223)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2812 (class 2606 OID 22096218)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2816 (class 2606 OID 22096238)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2815 (class 2606 OID 22096243)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 22096373)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 22096388)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2844 (class 2606 OID 22096383)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2845 (class 2606 OID 22096378)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-15 17:55:38 CEST

--
-- PostgreSQL database dump complete
--

