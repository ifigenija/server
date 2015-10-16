--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-16 15:42:51 CEST

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
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 248
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22373166)
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
-- TOC entry 232 (class 1259 OID 22373756)
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
-- TOC entry 231 (class 1259 OID 22373739)
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
-- TOC entry 222 (class 1259 OID 22373616)
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
-- TOC entry 225 (class 1259 OID 22373646)
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
-- TOC entry 246 (class 1259 OID 22374027)
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
-- TOC entry 199 (class 1259 OID 22373396)
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
-- TOC entry 201 (class 1259 OID 22373427)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 22373953)
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
-- TOC entry 192 (class 1259 OID 22373309)
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
-- TOC entry 233 (class 1259 OID 22373769)
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
-- TOC entry 218 (class 1259 OID 22373570)
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
-- TOC entry 197 (class 1259 OID 22373375)
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
-- TOC entry 195 (class 1259 OID 22373349)
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
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22373326)
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
-- TOC entry 207 (class 1259 OID 22373484)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 244 (class 1259 OID 22374008)
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
-- TOC entry 245 (class 1259 OID 22374020)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 22374042)
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
-- TOC entry 211 (class 1259 OID 22373509)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22373283)
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
-- TOC entry 183 (class 1259 OID 22373185)
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
-- TOC entry 187 (class 1259 OID 22373249)
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
-- TOC entry 184 (class 1259 OID 22373196)
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
-- TOC entry 178 (class 1259 OID 22373140)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22373159)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22373516)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 22373550)
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
-- TOC entry 228 (class 1259 OID 22373687)
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
-- TOC entry 186 (class 1259 OID 22373229)
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
-- TOC entry 189 (class 1259 OID 22373275)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22373898)
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
-- TOC entry 208 (class 1259 OID 22373490)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22373260)
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
-- TOC entry 196 (class 1259 OID 22373364)
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
-- TOC entry 210 (class 1259 OID 22373502)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 22373912)
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
-- TOC entry 237 (class 1259 OID 22373922)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 22373837)
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
-- TOC entry 238 (class 1259 OID 22373930)
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
-- TOC entry 214 (class 1259 OID 22373531)
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
-- TOC entry 206 (class 1259 OID 22373475)
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
-- TOC entry 205 (class 1259 OID 22373465)
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
-- TOC entry 227 (class 1259 OID 22373676)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 22373606)
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
-- TOC entry 194 (class 1259 OID 22373338)
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
-- TOC entry 175 (class 1259 OID 22373111)
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
-- TOC entry 174 (class 1259 OID 22373109)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 215 (class 1259 OID 22373544)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22373149)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22373133)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 22373558)
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
-- TOC entry 209 (class 1259 OID 22373496)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 22373442)
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
-- TOC entry 173 (class 1259 OID 22373098)
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
-- TOC entry 172 (class 1259 OID 22373090)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22373085)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 223 (class 1259 OID 22373623)
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
-- TOC entry 185 (class 1259 OID 22373221)
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
-- TOC entry 204 (class 1259 OID 22373452)
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
-- TOC entry 226 (class 1259 OID 22373664)
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
-- TOC entry 182 (class 1259 OID 22373175)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 239 (class 1259 OID 22373941)
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
-- TOC entry 202 (class 1259 OID 22373432)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22373295)
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
-- TOC entry 176 (class 1259 OID 22373120)
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
-- TOC entry 230 (class 1259 OID 22373714)
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
-- TOC entry 198 (class 1259 OID 22373386)
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
-- TOC entry 213 (class 1259 OID 22373523)
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
-- TOC entry 224 (class 1259 OID 22373637)
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
-- TOC entry 242 (class 1259 OID 22373988)
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
-- TOC entry 241 (class 1259 OID 22373960)
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
-- TOC entry 243 (class 1259 OID 22374000)
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
-- TOC entry 220 (class 1259 OID 22373595)
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
-- TOC entry 200 (class 1259 OID 22373421)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 229 (class 1259 OID 22373704)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 219 (class 1259 OID 22373585)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2215 (class 2604 OID 22373114)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3044 (class 0 OID 22373166)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22373756)
-- Dependencies: 232
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5620-fed9-133b-6da2100e9ba4	000d0000-5620-fed8-c17c-0b881669663a	\N	00090000-5620-fed8-dd76-f52b46456d0c	000b0000-5620-fed8-0a49-4d85c2d93bff	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5620-fed9-63a2-15fb8c9060bd	000d0000-5620-fed8-321e-1b91490cb3ab	00100000-5620-fed8-54e6-bee556fe742a	00090000-5620-fed8-6779-30a26d076379	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5620-fed9-b235-5438ce065a1b	000d0000-5620-fed8-04b3-37089aa7bdd6	00100000-5620-fed8-8628-1c699edc5a6b	00090000-5620-fed8-672f-945a342f3e67	\N	0003	t	\N	2015-10-16	\N	2	t	\N	f	f
000c0000-5620-fed9-8183-3ac15c44b4e0	000d0000-5620-fed8-d488-ec113ec96428	\N	00090000-5620-fed8-1b76-99d966b059ce	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5620-fed9-f034-ff5d33bbcfde	000d0000-5620-fed8-0a02-adea3abe76bf	\N	00090000-5620-fed8-3636-74548311e081	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5620-fed9-9ad8-dc65236af48b	000d0000-5620-fed8-64c9-751c1d51ad4a	\N	00090000-5620-fed8-a048-5c68a466849b	000b0000-5620-fed8-c811-28061cb43e5c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5620-fed9-e94a-82392645bff7	000d0000-5620-fed8-2485-aaaed4c25299	00100000-5620-fed8-f8ba-b59f33c4f79c	00090000-5620-fed8-df57-dcf4ce9394d8	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5620-fed9-1071-335db58f1950	000d0000-5620-fed8-9bce-edef8f44512f	\N	00090000-5620-fed8-e33c-86731642f642	000b0000-5620-fed8-1eb0-f9ae427ddcac	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5620-fed9-8fed-475eb01196ac	000d0000-5620-fed8-2485-aaaed4c25299	00100000-5620-fed8-e508-8765a8b20cab	00090000-5620-fed8-3134-68dc173cda84	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5620-fed9-886f-11b60104107e	000d0000-5620-fed8-2485-aaaed4c25299	00100000-5620-fed8-136b-7ac88e87f0cb	00090000-5620-fed8-ccde-1cf3f999ddb7	\N	0010	t	\N	2015-10-16	\N	16	f	\N	f	t
000c0000-5620-fed9-b0e3-d3bb8efe1e66	000d0000-5620-fed8-2485-aaaed4c25299	00100000-5620-fed8-db49-aadc39fb6e6c	00090000-5620-fed8-face-52b31bbf7d01	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5620-fed9-fc05-ffff13cd4179	000d0000-5620-fed8-c3fd-8c032ab80411	\N	00090000-5620-fed8-6779-30a26d076379	000b0000-5620-fed8-93f1-793af0dce497	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3094 (class 0 OID 22373739)
-- Dependencies: 231
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 22373616)
-- Dependencies: 222
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5620-fed8-162c-80cc93fc2775	00160000-5620-fed8-d884-30e169b57b44	00090000-5620-fed8-90de-a1cda3e2e4c1	aizv	10	t
003d0000-5620-fed8-b29c-54c272f9e7c2	00160000-5620-fed8-d884-30e169b57b44	00090000-5620-fed8-0c8f-5cc3557dacd8	apri	14	t
003d0000-5620-fed8-2bde-a5f6176fb6f0	00160000-5620-fed8-ff9d-debedd6ea6c0	00090000-5620-fed8-8203-eda271ab4f0f	aizv	11	t
003d0000-5620-fed8-da08-8756dd1190b7	00160000-5620-fed8-2c2a-ffe242c66302	00090000-5620-fed8-3677-d16c1acf8dc5	aizv	12	t
003d0000-5620-fed8-0bb9-82cf1ddf21f4	00160000-5620-fed8-d884-30e169b57b44	00090000-5620-fed8-d1bd-329cbf2c4754	apri	18	f
\.


--
-- TOC entry 3088 (class 0 OID 22373646)
-- Dependencies: 225
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5620-fed8-d884-30e169b57b44	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5620-fed8-ff9d-debedd6ea6c0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5620-fed8-2c2a-ffe242c66302	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3109 (class 0 OID 22374027)
-- Dependencies: 246
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 22373396)
-- Dependencies: 199
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5620-fed8-066c-14ce9bd66f41	\N	\N	00200000-5620-fed8-8e66-3e1a66c7f6c8	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5620-fed8-542f-db13857da86f	\N	\N	00200000-5620-fed8-72eb-3342bc56eaf2	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5620-fed8-929f-87ae204ba9e5	\N	\N	00200000-5620-fed8-c9d5-3917ead96eda	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5620-fed8-66d5-e49c80726bbc	\N	\N	00200000-5620-fed8-4b65-c22144d4e12b	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5620-fed8-6183-e3666f898e9b	\N	\N	00200000-5620-fed8-f76b-25c1cac93a92	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3064 (class 0 OID 22373427)
-- Dependencies: 201
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22373953)
-- Dependencies: 240
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22373309)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5620-fed6-0d2c-f83482652c13	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5620-fed6-12ff-74f34d837bf0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5620-fed6-d266-f966d4afc020	AL	ALB	008	Albania 	Albanija	\N
00040000-5620-fed6-2420-3683d5683d45	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5620-fed6-42e2-3fc44d302539	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5620-fed6-2dad-93086ac718e5	AD	AND	020	Andorra 	Andora	\N
00040000-5620-fed6-6eeb-240e9a491f40	AO	AGO	024	Angola 	Angola	\N
00040000-5620-fed6-6ad0-575385fe6833	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5620-fed6-95bf-b599b9a27221	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5620-fed6-d09a-f3cd5c2aa143	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-fed6-3ca8-d2afa7028106	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5620-fed6-1c35-7f107da4ef48	AM	ARM	051	Armenia 	Armenija	\N
00040000-5620-fed6-1375-6d2a4aef8260	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5620-fed6-a44f-0594996f9103	AU	AUS	036	Australia 	Avstralija	\N
00040000-5620-fed6-425c-2ebf5b14c4a3	AT	AUT	040	Austria 	Avstrija	\N
00040000-5620-fed6-ab9a-9e5ee603a670	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5620-fed6-1a91-b9c49ae69d54	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5620-fed6-09f9-83aa6e57d335	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5620-fed6-8ca8-b72121c0c2c5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5620-fed6-69ab-032c6f0a6f45	BB	BRB	052	Barbados 	Barbados	\N
00040000-5620-fed6-f257-f8c1d09f7a00	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5620-fed6-65ec-cfef665a6a4d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5620-fed6-189a-c3c00a0954e4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5620-fed6-b920-5e1702cfbb6b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5620-fed6-e02d-fab9ef57a70d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5620-fed6-9f21-4f39c2d716f4	BT	BTN	064	Bhutan 	Butan	\N
00040000-5620-fed6-23dd-991b01b0ce61	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5620-fed6-b310-f406da7f2931	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5620-fed6-3ae5-4219ba511f9b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5620-fed6-2614-ededaf6046b2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5620-fed6-030f-97f23dce2cfd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5620-fed6-238c-4ee7c2d8713c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5620-fed6-f372-e9b23e42fab2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5620-fed6-1810-f7cb0a061625	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5620-fed6-27c4-3bb5cf169455	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5620-fed6-c2eb-4b177bfc9d4d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5620-fed6-522f-fbe6740bbd8f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5620-fed6-8859-525155584f3a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5620-fed6-c34a-055505d078d8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5620-fed6-ddc7-420c90fddef0	CA	CAN	124	Canada 	Kanada	\N
00040000-5620-fed6-70c1-82395b06d0ff	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5620-fed6-8e06-8126146176c3	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5620-fed6-9ee4-487749f1f6c4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5620-fed6-a488-b20cc56fc03b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5620-fed6-4ad4-f8b2e7a4d2c6	CL	CHL	152	Chile 	Čile	\N
00040000-5620-fed6-7ff2-df590af4b119	CN	CHN	156	China 	Kitajska	\N
00040000-5620-fed6-1901-44bea78037e1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5620-fed6-9b70-6fc26818c8f6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5620-fed6-c357-5a35c1f04cfc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5620-fed6-2d6c-f545ee2bde6a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5620-fed6-f73a-0b7030b79abf	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5620-fed6-2527-abff290e157b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5620-fed6-347a-2bdfa7f0ef35	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5620-fed6-df7c-942547c8e58b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5620-fed6-d488-664d201f4b8f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5620-fed6-2fec-83a88b100ff3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5620-fed6-7876-6fd391159bb4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5620-fed6-6d19-c10d4b9fc982	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5620-fed6-ac98-a3a99f21e7cf	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5620-fed6-b5ec-00fdd5430f23	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5620-fed6-4f8f-1cc900ff419b	DK	DNK	208	Denmark 	Danska	\N
00040000-5620-fed6-1bc7-11e0b94e26c8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5620-fed6-a657-bc22871e3ddf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-fed6-432c-f3a35e029639	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5620-fed6-e722-a2f361693b25	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5620-fed6-06d0-1ba41ae8b90a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5620-fed6-d3d9-7b2df47b6643	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5620-fed6-54bf-d8fb4d630911	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5620-fed6-14bb-4bb1897741a9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5620-fed6-4b4a-b0067f0e52a3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5620-fed6-c4d4-074a116d3f55	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5620-fed6-d798-86b9b6d328af	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5620-fed6-926e-1ad3073f8510	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5620-fed6-5da7-8f07101a423d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5620-fed6-7db5-58bb07f41de9	FI	FIN	246	Finland 	Finska	\N
00040000-5620-fed6-9e69-da6f2f0ccfec	FR	FRA	250	France 	Francija	\N
00040000-5620-fed6-c607-0936a6177fb6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5620-fed6-7da6-a35b94cc7bb6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5620-fed6-9626-7f2a284f07f6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5620-fed6-d8e2-2d9822ba202e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5620-fed6-fa2f-67e0b0c2b09d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5620-fed6-3a65-6e83f4c6b963	GM	GMB	270	Gambia 	Gambija	\N
00040000-5620-fed6-87d7-97460aac461b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5620-fed6-8010-fe603971b4fc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5620-fed6-9fcf-5e719df104a8	GH	GHA	288	Ghana 	Gana	\N
00040000-5620-fed6-ddb2-32815781d579	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5620-fed6-0d36-3dbc11c15d48	GR	GRC	300	Greece 	Grčija	\N
00040000-5620-fed6-3fb5-74ba73bf2c83	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5620-fed6-ad30-5489cfb5562a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5620-fed6-dceb-c7939e0fdc95	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5620-fed6-896c-e3c27cfdadf7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5620-fed6-94a1-b6fb9702fb56	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5620-fed6-e9cb-caffa1f810dd	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5620-fed6-c0be-cf50797ea4ca	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5620-fed6-43e6-70f7512a2b1c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5620-fed6-6b9f-1d16c888baa1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5620-fed6-b018-a057e07f5896	HT	HTI	332	Haiti 	Haiti	\N
00040000-5620-fed6-175a-d072dda0b4b2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5620-fed6-1d97-eabd07d24257	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5620-fed6-f48d-c62e901e4356	HN	HND	340	Honduras 	Honduras	\N
00040000-5620-fed6-ad9d-09a7cad87f98	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5620-fed6-98c9-6700460d2cae	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5620-fed6-6dcc-dbc7715d8767	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5620-fed6-8dff-7754c01d82a3	IN	IND	356	India 	Indija	\N
00040000-5620-fed6-8966-314b8038e835	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5620-fed6-2cf3-f79b307e7cc7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5620-fed6-3939-f3ce3ee39876	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5620-fed6-96d9-1d2059fc2750	IE	IRL	372	Ireland 	Irska	\N
00040000-5620-fed6-e440-e91e23827eb6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5620-fed6-3644-6bad273c7422	IL	ISR	376	Israel 	Izrael	\N
00040000-5620-fed6-99a6-ecff15ad8911	IT	ITA	380	Italy 	Italija	\N
00040000-5620-fed6-8406-69bd49bec5c5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5620-fed6-0afb-000fb30e3334	JP	JPN	392	Japan 	Japonska	\N
00040000-5620-fed6-b89f-a28e92fbb9b7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5620-fed6-0b03-730206c0d165	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5620-fed6-5308-70672ec509fb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5620-fed6-216e-9209c497bd58	KE	KEN	404	Kenya 	Kenija	\N
00040000-5620-fed6-a1ab-1e50b8cc0e27	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5620-fed6-67ce-509caad3d390	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5620-fed6-1d7a-68b67d6831cb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5620-fed6-9a8a-6a0831fd7151	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5620-fed6-a70d-f3c707d4c780	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5620-fed6-047d-3528926e0dd9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5620-fed6-82d7-e14447be5d00	LV	LVA	428	Latvia 	Latvija	\N
00040000-5620-fed6-0a9a-112c583e2f4d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5620-fed6-07e9-8fb0c6b0c802	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5620-fed6-4495-e12b370d5737	LR	LBR	430	Liberia 	Liberija	\N
00040000-5620-fed6-a91b-c950bb0655df	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5620-fed6-8c54-890a0180fa51	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5620-fed6-5930-92a9a4885df9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5620-fed6-02e5-87e4d73d4a96	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5620-fed6-8b21-bb3a8c47af1d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5620-fed6-e19f-83b2dcbb0708	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5620-fed6-8e44-36ca766ea94a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5620-fed6-1cf6-344dd2762f62	MW	MWI	454	Malawi 	Malavi	\N
00040000-5620-fed6-f45b-8ed2ee734c15	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5620-fed6-bb88-cb67c24960dd	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5620-fed6-96ac-64b3556d672a	ML	MLI	466	Mali 	Mali	\N
00040000-5620-fed6-40cf-4e39de9bafc3	MT	MLT	470	Malta 	Malta	\N
00040000-5620-fed6-e57d-7b2e5a553a40	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5620-fed6-e54f-0dab3e8662f6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5620-fed6-78db-c020682925e9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5620-fed6-b3f9-2478db523eb7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5620-fed6-1290-c2a7056d15cf	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5620-fed6-887b-b3208d24f840	MX	MEX	484	Mexico 	Mehika	\N
00040000-5620-fed6-3956-a2e8450b4968	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5620-fed6-c22c-1d6200abbfc0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5620-fed6-1ce1-11a0be6a0795	MC	MCO	492	Monaco 	Monako	\N
00040000-5620-fed6-a066-8552f3423420	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5620-fed6-79be-194f6ceba49a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5620-fed6-17bb-b503fd5fd75b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5620-fed6-a77b-da86a31edda0	MA	MAR	504	Morocco 	Maroko	\N
00040000-5620-fed6-5df2-586b36dd48ac	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5620-fed6-eb3d-000072c9d5f2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5620-fed6-402f-f1b33e9ad884	NA	NAM	516	Namibia 	Namibija	\N
00040000-5620-fed6-47c0-4f9fa9ac206c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5620-fed6-03c0-250e18713f1d	NP	NPL	524	Nepal 	Nepal	\N
00040000-5620-fed6-cc71-ce3e1f3307e0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5620-fed6-54e5-ae443582910c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5620-fed6-c87c-0a48b26a97c0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5620-fed6-ab7c-108e5fa8c159	NE	NER	562	Niger 	Niger 	\N
00040000-5620-fed6-7eaf-e2ea758877a0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5620-fed6-5a83-2f3d70e77828	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5620-fed6-fa68-a559a2b529fd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5620-fed6-fc08-530e3f6538f2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5620-fed6-2dd6-5c18d35c45ef	NO	NOR	578	Norway 	Norveška	\N
00040000-5620-fed6-f21f-bde3ef5f603a	OM	OMN	512	Oman 	Oman	\N
00040000-5620-fed6-b437-2162cda18e01	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5620-fed6-5e90-a44a0e213658	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5620-fed6-e029-4336cd621020	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5620-fed6-39a8-e50f77dedb2f	PA	PAN	591	Panama 	Panama	\N
00040000-5620-fed6-171c-aa4b0751c699	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5620-fed6-38b1-cd532fa9d317	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5620-fed6-4e85-e7d68d1907b1	PE	PER	604	Peru 	Peru	\N
00040000-5620-fed6-a7aa-0a9c4e63567c	PH	PHL	608	Philippines 	Filipini	\N
00040000-5620-fed6-215d-3639d9a95d50	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5620-fed6-42b8-fa7a7806defa	PL	POL	616	Poland 	Poljska	\N
00040000-5620-fed6-211d-903e1ee7e196	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5620-fed6-0ec7-e7d3910c27d5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5620-fed6-2c3c-0412a482aea2	QA	QAT	634	Qatar 	Katar	\N
00040000-5620-fed6-d9d5-51d567333460	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5620-fed6-8900-c6b9b96cee5c	RO	ROU	642	Romania 	Romunija	\N
00040000-5620-fed6-c020-10dd7dfe5eef	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5620-fed6-66e5-84fbeaaa52e3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5620-fed6-e9fa-48afb3dabdb6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5620-fed6-9822-413ff22cd225	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5620-fed6-0640-39a913d03fbe	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5620-fed6-9e25-1abb4cc4e3a7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5620-fed6-eb0a-062226423066	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5620-fed6-1e2d-d53c9ffb4ec6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5620-fed6-aaff-54105df761e7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5620-fed6-894f-45e555d0b085	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5620-fed6-e3b5-bbc157aa3038	SM	SMR	674	San Marino 	San Marino	\N
00040000-5620-fed6-6840-63bf438f294d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5620-fed6-3cf7-90a40e7f7774	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5620-fed6-d022-7e209f6c0163	SN	SEN	686	Senegal 	Senegal	\N
00040000-5620-fed6-41dd-6646a162a6e4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5620-fed6-65cf-4216ee15dbb9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5620-fed6-30d8-205e412ca080	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5620-fed6-f945-1a10e14903cf	SG	SGP	702	Singapore 	Singapur	\N
00040000-5620-fed6-5a6c-d49afafbd50c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5620-fed6-ed81-ff6a007a7f0e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5620-fed6-3d61-8cde3f178162	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5620-fed6-2684-00a3b286f408	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5620-fed6-d496-ad5a72b9cafe	SO	SOM	706	Somalia 	Somalija	\N
00040000-5620-fed6-cc12-9cd1127238d7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5620-fed6-cd25-e2094849b21b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5620-fed6-299c-bbaac39fc390	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5620-fed6-eed6-40cf097a6ef4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5620-fed6-adb9-c0cb04d0d2c8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5620-fed6-8e03-4542e05bb85f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5620-fed6-e056-41c92347eb69	SR	SUR	740	Suriname 	Surinam	\N
00040000-5620-fed6-af09-6fc88d77e386	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5620-fed6-cb9d-a908e1cbfc1c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5620-fed6-136f-fab6af21e1cd	SE	SWE	752	Sweden 	Švedska	\N
00040000-5620-fed6-e343-1c27ee7ca452	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5620-fed6-2000-5fa57402aa43	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5620-fed6-1730-3a62a9ad2804	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5620-fed6-86f6-feb64d57d547	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5620-fed6-d356-9000dea12856	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5620-fed6-fa30-3108e5739a50	TH	THA	764	Thailand 	Tajska	\N
00040000-5620-fed6-d424-3fbe26d522b2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5620-fed6-92af-1778e42b3f4a	TG	TGO	768	Togo 	Togo	\N
00040000-5620-fed6-7e5a-2c0441948583	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5620-fed6-abab-3eb4a74d5667	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5620-fed6-a33d-42053ee43af3	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5620-fed6-cf7f-0f5963ad7581	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5620-fed6-2352-9a0083917620	TR	TUR	792	Turkey 	Turčija	\N
00040000-5620-fed6-0f54-15ac0f544e2c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5620-fed6-85aa-6dfc0ab5ed1b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-fed6-450b-4f4907a0e381	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5620-fed6-b594-5234204bb40e	UG	UGA	800	Uganda 	Uganda	\N
00040000-5620-fed6-badf-2ca0fba835b9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5620-fed6-f71b-d8d8efbc0281	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5620-fed6-961c-163764c96cf8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5620-fed6-d166-0ccd54cf6608	US	USA	840	United States 	Združene države Amerike	\N
00040000-5620-fed6-9620-e54016d5e1a5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5620-fed6-5d76-7e036a2bbf05	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5620-fed6-5e35-dc30010cc228	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5620-fed6-f4d0-0644fde226c5	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5620-fed6-f93b-01c7799cbee6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5620-fed6-2a6a-e5f0561ce610	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5620-fed6-bd5b-4aa3b0b3018a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-fed6-9c65-f5508d95b8b2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5620-fed6-e213-fb4da798e534	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5620-fed6-6ab8-944e655dc35a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5620-fed6-13f1-70bf60ef9d1b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5620-fed6-1288-7a3342b83851	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5620-fed6-7ebb-999be670040c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3096 (class 0 OID 22373769)
-- Dependencies: 233
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5620-fed8-5e02-cccff599f79f	000e0000-5620-fed8-f185-c86da8ab396c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-fed6-9885-25146fd87a72	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-fed8-ca02-9666cbbff2ec	000e0000-5620-fed8-e29e-d40072893aeb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-fed6-d0e9-a43a47581327	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-fed8-46dd-738a96e7c52e	000e0000-5620-fed8-5f64-9503cb0924e1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-fed6-9885-25146fd87a72	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-fed8-46ab-28472237224a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-fed8-eb1c-ad712708e947	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3081 (class 0 OID 22373570)
-- Dependencies: 218
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5620-fed8-c17c-0b881669663a	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-133b-6da2100e9ba4	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-fed6-0019-7acd91ce4809
000d0000-5620-fed8-321e-1b91490cb3ab	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-63a2-15fb8c9060bd	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5620-fed6-f856-fee8a92846a4
000d0000-5620-fed8-04b3-37089aa7bdd6	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-b235-5438ce065a1b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5620-fed6-d7cd-e01118d2b03b
000d0000-5620-fed8-d488-ec113ec96428	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-8183-3ac15c44b4e0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5620-fed6-ddf7-cf10e5e62d2b
000d0000-5620-fed8-0a02-adea3abe76bf	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-f034-ff5d33bbcfde	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5620-fed6-ddf7-cf10e5e62d2b
000d0000-5620-fed8-64c9-751c1d51ad4a	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-9ad8-dc65236af48b	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-fed6-0019-7acd91ce4809
000d0000-5620-fed8-2485-aaaed4c25299	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-8fed-475eb01196ac	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5620-fed6-0019-7acd91ce4809
000d0000-5620-fed8-9bce-edef8f44512f	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-1071-335db58f1950	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5620-fed6-0205-3f5fa3b86ea5
000d0000-5620-fed8-c3fd-8c032ab80411	000e0000-5620-fed8-e29e-d40072893aeb	000c0000-5620-fed9-fc05-ffff13cd4179	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5620-fed6-bfcf-e34987d65f57
\.


--
-- TOC entry 3060 (class 0 OID 22373375)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 22373349)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22373326)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5620-fed8-1467-45855515e12a	00080000-5620-fed8-356d-9118dda792da	00090000-5620-fed8-ccde-1cf3f999ddb7	AK		igralka
\.


--
-- TOC entry 3070 (class 0 OID 22373484)
-- Dependencies: 207
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 22374008)
-- Dependencies: 244
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 22374020)
-- Dependencies: 245
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22374042)
-- Dependencies: 247
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 22028081)
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
-- TOC entry 3074 (class 0 OID 22373509)
-- Dependencies: 211
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 22373283)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5620-fed7-2faa-7855c42ef9bf	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5620-fed7-1d2f-c45f7fca7022	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5620-fed7-3eb7-c6a8089e6ea4	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5620-fed7-c6a2-3eeb3e34c497	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5620-fed7-08e3-b8168f7e3a8c	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5620-fed7-a1b6-971ea9043846	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5620-fed7-48d1-f68d51192406	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5620-fed7-6a19-7fa99663403c	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-fed7-f489-48024feab178	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-fed7-d976-98df16e7409b	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5620-fed7-247c-42918428842d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5620-fed7-92fe-d83a29599690	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5620-fed7-be89-65b7a492c667	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5620-fed7-31c8-c48a22c3c225	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5620-fed7-1abb-72d2e2903189	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5620-fed8-40eb-33ab3bdfa663	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5620-fed8-53fc-d2026ea6bcd1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5620-fed8-f136-e9e05a13c01e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5620-fed8-7280-d1c175c6cab3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5620-fed8-a5eb-1617fbb03595	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5620-feda-4b2d-5e8048815cff	application.tenant.maticnopodjetje	string	s:36:"00080000-5620-feda-c907-01010d0cf451";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3046 (class 0 OID 22373185)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5620-fed8-d572-ab1128bad3be	00000000-5620-fed8-40eb-33ab3bdfa663	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5620-fed8-a1d8-7d1c108d7fe2	00000000-5620-fed8-40eb-33ab3bdfa663	00010000-5620-fed7-189f-8f7c57c3c54d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5620-fed8-675f-51eabb29d2f6	00000000-5620-fed8-53fc-d2026ea6bcd1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3050 (class 0 OID 22373249)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5620-fed8-bb5b-96ce05f70cc0	\N	00100000-5620-fed8-54e6-bee556fe742a	00100000-5620-fed8-8628-1c699edc5a6b	01	Gledališče Nimbis
00410000-5620-fed8-1506-33f0cbcd5abf	00410000-5620-fed8-bb5b-96ce05f70cc0	00100000-5620-fed8-54e6-bee556fe742a	00100000-5620-fed8-8628-1c699edc5a6b	02	Tehnika
\.


--
-- TOC entry 3047 (class 0 OID 22373196)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5620-fed8-dd76-f52b46456d0c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5620-fed8-1b76-99d966b059ce	00010000-5620-fed8-c270-842b6321ca91	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5620-fed8-672f-945a342f3e67	00010000-5620-fed8-1d8a-3cb062ad3c75	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5620-fed8-3134-68dc173cda84	00010000-5620-fed8-128f-52373139d0c2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5620-fed8-e5df-f9d1913248e2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5620-fed8-a048-5c68a466849b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5620-fed8-face-52b31bbf7d01	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5620-fed8-df57-dcf4ce9394d8	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5620-fed8-ccde-1cf3f999ddb7	00010000-5620-fed8-e7e5-b93ec98e544a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5620-fed8-6779-30a26d076379	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5620-fed8-3b5a-7b919fd1e536	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-fed8-3636-74548311e081	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5620-fed8-e33c-86731642f642	00010000-5620-fed8-63a0-f186580df545	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-fed8-90de-a1cda3e2e4c1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-fed8-0c8f-5cc3557dacd8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-fed8-8203-eda271ab4f0f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-fed8-3677-d16c1acf8dc5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5620-fed8-d1bd-329cbf2c4754	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 22373140)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5620-fed7-3b4a-4de1c7d5afb6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5620-fed7-bc01-b6c842a54e41	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5620-fed7-8dc6-7d1e269bd808	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5620-fed7-1304-cc2ea79b799f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5620-fed7-a5c7-d7cf77aa8b87	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5620-fed7-87b6-848d85066ede	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5620-fed7-4228-7478c941204a	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5620-fed7-47f0-a6c4ce14b838	Abonma-read	Abonma - branje	f
00030000-5620-fed7-2174-9cffa7cf316a	Abonma-write	Abonma - spreminjanje	f
00030000-5620-fed7-edef-97798755e9f4	Alternacija-read	Alternacija - branje	f
00030000-5620-fed7-4096-e2c2823aaf48	Alternacija-write	Alternacija - spreminjanje	f
00030000-5620-fed7-b80b-b4f965a80b04	Arhivalija-read	Arhivalija - branje	f
00030000-5620-fed7-bead-ed29fbc575d4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5620-fed7-7150-c82d02b29c49	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5620-fed7-8c99-774ea06ef034	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5620-fed7-dd83-88ee1484157d	Besedilo-read	Besedilo - branje	f
00030000-5620-fed7-10d8-b441d7df6767	Besedilo-write	Besedilo - spreminjanje	f
00030000-5620-fed7-944e-6a468371e706	DogodekIzven-read	DogodekIzven - branje	f
00030000-5620-fed7-c232-48d0364e735d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5620-fed7-7530-8d13bfc6c966	Dogodek-read	Dogodek - branje	f
00030000-5620-fed7-15b4-ca81d6ba1284	Dogodek-write	Dogodek - spreminjanje	f
00030000-5620-fed7-245c-3138e69ba4d9	DrugiVir-read	DrugiVir - branje	f
00030000-5620-fed7-b5cb-636c53166206	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5620-fed7-66ca-c63174995cba	Drzava-read	Drzava - branje	f
00030000-5620-fed7-379a-e78d3b9b0ef1	Drzava-write	Drzava - spreminjanje	f
00030000-5620-fed7-cdb0-8f38b4b338ac	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5620-fed7-7415-3ff29e7064a9	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5620-fed7-5bc3-5f8edd149b3a	Funkcija-read	Funkcija - branje	f
00030000-5620-fed7-21f7-53df11dde531	Funkcija-write	Funkcija - spreminjanje	f
00030000-5620-fed7-47e9-320f408c4498	Gostovanje-read	Gostovanje - branje	f
00030000-5620-fed7-98cb-b0d6422a575d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5620-fed7-9296-ea4342f694c4	Gostujoca-read	Gostujoca - branje	f
00030000-5620-fed7-0313-9f1d992a45e8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5620-fed7-18a5-981fe077950e	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5620-fed7-b262-bd3a5017c006	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5620-fed7-2161-b69f99a509c0	Kupec-read	Kupec - branje	f
00030000-5620-fed7-bc74-6e654b668afd	Kupec-write	Kupec - spreminjanje	f
00030000-5620-fed7-ba17-1edca2c112c7	NacinPlacina-read	NacinPlacina - branje	f
00030000-5620-fed7-4bcc-1a97de6db0fd	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5620-fed7-9562-207824ff2062	Option-read	Option - branje	f
00030000-5620-fed7-0f2a-7dd216ef1a2b	Option-write	Option - spreminjanje	f
00030000-5620-fed7-b880-45c580744f39	OptionValue-read	OptionValue - branje	f
00030000-5620-fed7-37fa-e7917828ad43	OptionValue-write	OptionValue - spreminjanje	f
00030000-5620-fed7-8b18-164a5306a08f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5620-fed7-729c-544c2ca879f4	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5620-fed7-6f0e-7f1295a38b2a	Oseba-read	Oseba - branje	f
00030000-5620-fed7-36aa-bf2d58e6fc6c	Oseba-write	Oseba - spreminjanje	f
00030000-5620-fed7-9eec-29bf29b23f79	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5620-fed7-af7c-767442f4e345	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5620-fed7-f875-74cdbf283fea	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5620-fed7-3150-a907aa14a4fc	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5620-fed7-a09d-b0c9b5ae3e88	Pogodba-read	Pogodba - branje	f
00030000-5620-fed7-3771-25926d55dbfc	Pogodba-write	Pogodba - spreminjanje	f
00030000-5620-fed7-719f-60bdf54329e9	Popa-read	Popa - branje	f
00030000-5620-fed7-058e-aff24cfc2e20	Popa-write	Popa - spreminjanje	f
00030000-5620-fed7-5b3c-58a0d4eaf46f	Posta-read	Posta - branje	f
00030000-5620-fed7-2089-4e06cdf6c02a	Posta-write	Posta - spreminjanje	f
00030000-5620-fed7-4d25-820386501cb6	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5620-fed7-84d8-0dfb1d085600	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5620-fed7-ed20-1027174d5ace	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5620-fed7-c177-b102d89c0936	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5620-fed7-6705-f3882e5032d4	PostniNaslov-read	PostniNaslov - branje	f
00030000-5620-fed7-a099-1dee4ca97871	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5620-fed7-8056-f305b36b6627	Predstava-read	Predstava - branje	f
00030000-5620-fed7-0b38-d24f9e3039d8	Predstava-write	Predstava - spreminjanje	f
00030000-5620-fed7-4c09-972b97bca7a3	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5620-fed7-7cbb-f29863744320	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5620-fed7-30f9-5ba817b903a6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5620-fed7-04e3-dbd99d206467	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5620-fed7-8dca-317b8baf114b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5620-fed7-d949-61223c442e54	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5620-fed7-c2f5-c94a8bf6f492	ProgramDela-read	ProgramDela - branje	f
00030000-5620-fed7-9e17-7185eb7d8b9c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5620-fed7-26f3-d79ea8dda806	ProgramFestival-read	ProgramFestival - branje	f
00030000-5620-fed7-bc43-f53cc735140a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5620-fed7-0f7c-0c9be883c9f7	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5620-fed7-a3b5-327538b35348	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5620-fed7-0ad1-1b9b62663e50	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5620-fed7-251e-aa2fea5bd184	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5620-fed7-5cf1-9bde918a95d5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5620-fed7-21c6-e155b45baf2d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5620-fed7-5d35-9f345427aaaa	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5620-fed7-d289-6f2a582ca3b5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5620-fed7-583f-3d5e9aeffead	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5620-fed7-bc1a-18d337f42c73	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5620-fed7-0972-9b9894661cea	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5620-fed7-baa5-742c0e85d5f4	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5620-fed7-8b6d-42c12ae06387	ProgramRazno-read	ProgramRazno - branje	f
00030000-5620-fed7-c95e-e752b4947bdd	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5620-fed7-a121-cb8d33e91b66	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5620-fed7-1ea3-a9e22859662f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5620-fed7-fc23-a559b0db2b85	Prostor-read	Prostor - branje	f
00030000-5620-fed7-027a-e554fd0bca62	Prostor-write	Prostor - spreminjanje	f
00030000-5620-fed7-bfd1-48e7888dadff	Racun-read	Racun - branje	f
00030000-5620-fed7-540a-823d414ea491	Racun-write	Racun - spreminjanje	f
00030000-5620-fed7-79b5-2567ba56e5b1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5620-fed7-78a3-1953245de820	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5620-fed7-e381-e5534d9739f4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5620-fed7-dc02-92fef72119e9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5620-fed7-b019-0e5ffa002ff2	Rekvizit-read	Rekvizit - branje	f
00030000-5620-fed7-9ce4-d49d06eef5d5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5620-fed7-4e35-a370b9888ea8	Revizija-read	Revizija - branje	f
00030000-5620-fed7-0e6d-643f0f8c3ed1	Revizija-write	Revizija - spreminjanje	f
00030000-5620-fed7-5765-77dfae6b34bd	Rezervacija-read	Rezervacija - branje	f
00030000-5620-fed7-3200-d35dead3b5ed	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5620-fed7-24d5-370464582578	SedezniRed-read	SedezniRed - branje	f
00030000-5620-fed7-598c-8cfa3830b91b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5620-fed7-8c6f-690e982228ff	Sedez-read	Sedez - branje	f
00030000-5620-fed7-6e33-c6c5b5bf7af2	Sedez-write	Sedez - spreminjanje	f
00030000-5620-fed7-e01a-2f54e17b6718	Sezona-read	Sezona - branje	f
00030000-5620-fed7-7161-c77258646dcd	Sezona-write	Sezona - spreminjanje	f
00030000-5620-fed7-20cf-4fd6923ce022	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5620-fed7-e0f7-90734c58e5bc	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5620-fed7-85ec-99be01a8e9d4	Stevilcenje-read	Stevilcenje - branje	f
00030000-5620-fed7-fdb7-e616a32e317c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5620-fed7-6539-df5a5c22420f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5620-fed7-a3bc-96d8046e0897	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5620-fed7-28dc-f19db38283a0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5620-fed7-fad3-0cc9a6f8982c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5620-fed7-858b-c1ea06ede3e3	Telefonska-read	Telefonska - branje	f
00030000-5620-fed7-0711-a0844a182f60	Telefonska-write	Telefonska - spreminjanje	f
00030000-5620-fed7-aa03-b013a839ebfe	TerminStoritve-read	TerminStoritve - branje	f
00030000-5620-fed7-a40d-41a2f63fcaac	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5620-fed7-cb0a-d78104dea63a	TipFunkcije-read	TipFunkcije - branje	f
00030000-5620-fed7-f72e-a0c0a2d32933	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5620-fed7-7548-19946afc4699	TipPopa-read	TipPopa - branje	f
00030000-5620-fed7-c91e-2ba3fb68eae7	TipPopa-write	TipPopa - spreminjanje	f
00030000-5620-fed7-9306-6939f422a719	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5620-fed7-6a17-3ef20c937faa	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5620-fed7-7cb2-822b1c9a62db	TipVaje-read	TipVaje - branje	f
00030000-5620-fed7-5302-3952db7e209c	TipVaje-write	TipVaje - spreminjanje	f
00030000-5620-fed7-84d1-21ff8aa20c2a	Trr-read	Trr - branje	f
00030000-5620-fed7-3a90-ace71fb798f3	Trr-write	Trr - spreminjanje	f
00030000-5620-fed7-2c2a-505571821b84	Uprizoritev-read	Uprizoritev - branje	f
00030000-5620-fed7-30b9-5dabe5b4c528	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5620-fed7-8717-322a14b7f464	Vaja-read	Vaja - branje	f
00030000-5620-fed7-ec9e-4e360d332407	Vaja-write	Vaja - spreminjanje	f
00030000-5620-fed7-9e4a-893b54b2c1f2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5620-fed7-0609-a0395cc4e438	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5620-fed7-806c-558af5a3b394	VrstaStroska-read	VrstaStroska - branje	f
00030000-5620-fed7-41f4-86041536aa66	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5620-fed7-c1c8-7fa7a3684548	Zaposlitev-read	Zaposlitev - branje	f
00030000-5620-fed7-87a7-5602635b1296	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5620-fed7-3ba3-3dd3647a37e2	Zasedenost-read	Zasedenost - branje	f
00030000-5620-fed7-28b8-8ea266706e1b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5620-fed7-0beb-f66f535d76c8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5620-fed7-0e9b-afc6c8f11f69	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5620-fed7-aa0c-af03ce1646dc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5620-fed7-803f-6c7f856d1bb5	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5620-fed7-2e5e-99c7461ed15d	Job-read	Branje opravil - samo zase - branje	f
00030000-5620-fed7-5634-cde5a65b6c7f	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5620-fed7-8e84-45a93d9ee42c	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5620-fed7-1ef7-69c089d5f7c2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5620-fed7-26a3-60bd992e51fa	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5620-fed7-541b-feb1d2c314d6	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5620-fed7-b43b-c91fa2b27f58	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5620-fed7-cf0e-a657152ad37d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-fed7-e68e-048f3235c086	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-fed7-5450-735e7be2aed7	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-fed7-8423-6d213601fa32	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-fed7-82a2-bac739b2fb15	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5620-fed7-3d06-266a86867de9	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5620-fed7-55d4-89e27604a148	Datoteka-write	Datoteka - spreminjanje	f
00030000-5620-fed7-f460-22b5c4f69058	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3043 (class 0 OID 22373159)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5620-fed7-028f-2e0fe8477d40	00030000-5620-fed7-bc01-b6c842a54e41
00020000-5620-fed7-3309-f5cfc36f9aa5	00030000-5620-fed7-66ca-c63174995cba
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-47f0-a6c4ce14b838
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-2174-9cffa7cf316a
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-edef-97798755e9f4
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-4096-e2c2823aaf48
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-b80b-b4f965a80b04
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-7530-8d13bfc6c966
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-1304-cc2ea79b799f
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-15b4-ca81d6ba1284
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-66ca-c63174995cba
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-379a-e78d3b9b0ef1
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-5bc3-5f8edd149b3a
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-21f7-53df11dde531
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-47e9-320f408c4498
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-98cb-b0d6422a575d
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-9296-ea4342f694c4
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-0313-9f1d992a45e8
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-18a5-981fe077950e
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-b262-bd3a5017c006
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-9562-207824ff2062
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-b880-45c580744f39
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-6f0e-7f1295a38b2a
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-36aa-bf2d58e6fc6c
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-719f-60bdf54329e9
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-058e-aff24cfc2e20
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-5b3c-58a0d4eaf46f
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-2089-4e06cdf6c02a
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-6705-f3882e5032d4
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-a099-1dee4ca97871
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-8056-f305b36b6627
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-0b38-d24f9e3039d8
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-8dca-317b8baf114b
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-d949-61223c442e54
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-fc23-a559b0db2b85
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-027a-e554fd0bca62
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-e381-e5534d9739f4
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-dc02-92fef72119e9
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-b019-0e5ffa002ff2
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-9ce4-d49d06eef5d5
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-e01a-2f54e17b6718
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-7161-c77258646dcd
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-cb0a-d78104dea63a
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-2c2a-505571821b84
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-30b9-5dabe5b4c528
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-8717-322a14b7f464
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-ec9e-4e360d332407
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-3ba3-3dd3647a37e2
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-28b8-8ea266706e1b
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-0beb-f66f535d76c8
00020000-5620-fed7-5400-b06d28ec9ba1	00030000-5620-fed7-aa0c-af03ce1646dc
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-47f0-a6c4ce14b838
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-b80b-b4f965a80b04
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-7530-8d13bfc6c966
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-66ca-c63174995cba
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-47e9-320f408c4498
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-9296-ea4342f694c4
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-18a5-981fe077950e
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-b262-bd3a5017c006
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-9562-207824ff2062
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-b880-45c580744f39
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-6f0e-7f1295a38b2a
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-36aa-bf2d58e6fc6c
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-719f-60bdf54329e9
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-5b3c-58a0d4eaf46f
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-6705-f3882e5032d4
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-a099-1dee4ca97871
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-8056-f305b36b6627
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-fc23-a559b0db2b85
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-e381-e5534d9739f4
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-b019-0e5ffa002ff2
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-e01a-2f54e17b6718
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-858b-c1ea06ede3e3
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-0711-a0844a182f60
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-84d1-21ff8aa20c2a
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-3a90-ace71fb798f3
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-c1c8-7fa7a3684548
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-87a7-5602635b1296
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-0beb-f66f535d76c8
00020000-5620-fed7-0902-a1a94aaf4b47	00030000-5620-fed7-aa0c-af03ce1646dc
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-47f0-a6c4ce14b838
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-edef-97798755e9f4
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-b80b-b4f965a80b04
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-bead-ed29fbc575d4
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-dd83-88ee1484157d
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-944e-6a468371e706
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-7530-8d13bfc6c966
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-66ca-c63174995cba
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-5bc3-5f8edd149b3a
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-47e9-320f408c4498
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-9296-ea4342f694c4
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-18a5-981fe077950e
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-9562-207824ff2062
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-b880-45c580744f39
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-6f0e-7f1295a38b2a
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-719f-60bdf54329e9
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-5b3c-58a0d4eaf46f
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-8056-f305b36b6627
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-8dca-317b8baf114b
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-fc23-a559b0db2b85
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-e381-e5534d9739f4
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-b019-0e5ffa002ff2
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-e01a-2f54e17b6718
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-cb0a-d78104dea63a
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-8717-322a14b7f464
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-3ba3-3dd3647a37e2
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-0beb-f66f535d76c8
00020000-5620-fed7-3b3a-50109133d6be	00030000-5620-fed7-aa0c-af03ce1646dc
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-47f0-a6c4ce14b838
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-2174-9cffa7cf316a
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-4096-e2c2823aaf48
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-b80b-b4f965a80b04
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-7530-8d13bfc6c966
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-66ca-c63174995cba
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-47e9-320f408c4498
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-9296-ea4342f694c4
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-9562-207824ff2062
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-b880-45c580744f39
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-719f-60bdf54329e9
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-5b3c-58a0d4eaf46f
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-8056-f305b36b6627
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-fc23-a559b0db2b85
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-e381-e5534d9739f4
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-b019-0e5ffa002ff2
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-e01a-2f54e17b6718
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-cb0a-d78104dea63a
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-0beb-f66f535d76c8
00020000-5620-fed7-8257-4de6e6b1c958	00030000-5620-fed7-aa0c-af03ce1646dc
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-47f0-a6c4ce14b838
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-b80b-b4f965a80b04
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-7530-8d13bfc6c966
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-66ca-c63174995cba
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-47e9-320f408c4498
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-9296-ea4342f694c4
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-9562-207824ff2062
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-b880-45c580744f39
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-719f-60bdf54329e9
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-5b3c-58a0d4eaf46f
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-8056-f305b36b6627
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-fc23-a559b0db2b85
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-e381-e5534d9739f4
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-b019-0e5ffa002ff2
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-e01a-2f54e17b6718
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-aa03-b013a839ebfe
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-8dc6-7d1e269bd808
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-cb0a-d78104dea63a
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-0beb-f66f535d76c8
00020000-5620-fed7-be82-33761f199634	00030000-5620-fed7-aa0c-af03ce1646dc
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-3b4a-4de1c7d5afb6
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-bc01-b6c842a54e41
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-8dc6-7d1e269bd808
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-1304-cc2ea79b799f
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-a5c7-d7cf77aa8b87
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-87b6-848d85066ede
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-4228-7478c941204a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-47f0-a6c4ce14b838
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-2174-9cffa7cf316a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-edef-97798755e9f4
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-4096-e2c2823aaf48
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-b80b-b4f965a80b04
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-bead-ed29fbc575d4
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-dd83-88ee1484157d
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-10d8-b441d7df6767
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-944e-6a468371e706
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-c232-48d0364e735d
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-7530-8d13bfc6c966
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-15b4-ca81d6ba1284
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-66ca-c63174995cba
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-379a-e78d3b9b0ef1
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-245c-3138e69ba4d9
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-b5cb-636c53166206
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-cdb0-8f38b4b338ac
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-7415-3ff29e7064a9
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-5bc3-5f8edd149b3a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-21f7-53df11dde531
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-47e9-320f408c4498
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-98cb-b0d6422a575d
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-9296-ea4342f694c4
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0313-9f1d992a45e8
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-18a5-981fe077950e
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-b262-bd3a5017c006
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-2161-b69f99a509c0
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-bc74-6e654b668afd
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-ba17-1edca2c112c7
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-4bcc-1a97de6db0fd
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-9562-207824ff2062
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0f2a-7dd216ef1a2b
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-b880-45c580744f39
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-37fa-e7917828ad43
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-6f0e-7f1295a38b2a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-36aa-bf2d58e6fc6c
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-9eec-29bf29b23f79
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-af7c-767442f4e345
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-f875-74cdbf283fea
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-3150-a907aa14a4fc
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-a09d-b0c9b5ae3e88
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-3771-25926d55dbfc
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-719f-60bdf54329e9
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-058e-aff24cfc2e20
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-5b3c-58a0d4eaf46f
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-2089-4e06cdf6c02a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-4d25-820386501cb6
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-84d8-0dfb1d085600
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-ed20-1027174d5ace
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-c177-b102d89c0936
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-6705-f3882e5032d4
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-a099-1dee4ca97871
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-8056-f305b36b6627
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0b38-d24f9e3039d8
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-4c09-972b97bca7a3
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-7cbb-f29863744320
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-30f9-5ba817b903a6
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-04e3-dbd99d206467
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-8dca-317b8baf114b
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-d949-61223c442e54
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-c2f5-c94a8bf6f492
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-9e17-7185eb7d8b9c
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-26f3-d79ea8dda806
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-bc43-f53cc735140a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0f7c-0c9be883c9f7
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-a3b5-327538b35348
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0ad1-1b9b62663e50
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-251e-aa2fea5bd184
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-5cf1-9bde918a95d5
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-21c6-e155b45baf2d
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-5d35-9f345427aaaa
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-d289-6f2a582ca3b5
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-583f-3d5e9aeffead
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-bc1a-18d337f42c73
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0972-9b9894661cea
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-baa5-742c0e85d5f4
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-8b6d-42c12ae06387
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-c95e-e752b4947bdd
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-a121-cb8d33e91b66
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-1ea3-a9e22859662f
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-fc23-a559b0db2b85
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-027a-e554fd0bca62
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-bfd1-48e7888dadff
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-540a-823d414ea491
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-79b5-2567ba56e5b1
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-78a3-1953245de820
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-e381-e5534d9739f4
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-dc02-92fef72119e9
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-b019-0e5ffa002ff2
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-9ce4-d49d06eef5d5
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-4e35-a370b9888ea8
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0e6d-643f0f8c3ed1
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-5765-77dfae6b34bd
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-3200-d35dead3b5ed
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-24d5-370464582578
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-598c-8cfa3830b91b
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-8c6f-690e982228ff
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-6e33-c6c5b5bf7af2
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-e01a-2f54e17b6718
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-7161-c77258646dcd
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-20cf-4fd6923ce022
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-e0f7-90734c58e5bc
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-85ec-99be01a8e9d4
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-fdb7-e616a32e317c
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-6539-df5a5c22420f
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-a3bc-96d8046e0897
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-28dc-f19db38283a0
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-fad3-0cc9a6f8982c
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-858b-c1ea06ede3e3
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0711-a0844a182f60
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-aa03-b013a839ebfe
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-a40d-41a2f63fcaac
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-cb0a-d78104dea63a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-f72e-a0c0a2d32933
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-9306-6939f422a719
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-6a17-3ef20c937faa
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-84d1-21ff8aa20c2a
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-3a90-ace71fb798f3
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-2c2a-505571821b84
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-30b9-5dabe5b4c528
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-8717-322a14b7f464
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-ec9e-4e360d332407
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-9e4a-893b54b2c1f2
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0609-a0395cc4e438
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-806c-558af5a3b394
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-41f4-86041536aa66
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-c1c8-7fa7a3684548
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-87a7-5602635b1296
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-3ba3-3dd3647a37e2
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-28b8-8ea266706e1b
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0beb-f66f535d76c8
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-0e9b-afc6c8f11f69
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-aa0c-af03ce1646dc
00020000-5620-fed8-3e71-87e45dc41e0d	00030000-5620-fed7-803f-6c7f856d1bb5
\.


--
-- TOC entry 3075 (class 0 OID 22373516)
-- Dependencies: 212
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22373550)
-- Dependencies: 216
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 22373687)
-- Dependencies: 228
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5620-fed8-0a49-4d85c2d93bff	00090000-5620-fed8-dd76-f52b46456d0c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5620-fed8-c811-28061cb43e5c	00090000-5620-fed8-a048-5c68a466849b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5620-fed8-1eb0-f9ae427ddcac	00090000-5620-fed8-e33c-86731642f642	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5620-fed8-93f1-793af0dce497	00090000-5620-fed8-6779-30a26d076379	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3049 (class 0 OID 22373229)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5620-fed8-356d-9118dda792da	\N	00040000-5620-fed6-3d61-8cde3f178162	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-fed8-b7ff-bc09b37c1e2c	\N	00040000-5620-fed6-3d61-8cde3f178162	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5620-fed8-d28b-6a70413980d7	\N	00040000-5620-fed6-3d61-8cde3f178162	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-fed8-d384-bc0a9416450a	\N	00040000-5620-fed6-3d61-8cde3f178162	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-fed8-e477-73db792dda8a	\N	00040000-5620-fed6-3d61-8cde3f178162	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-fed8-eb78-2486313e5f83	\N	00040000-5620-fed6-3ca8-d2afa7028106	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-fed8-f441-c88a8fc25b56	\N	00040000-5620-fed6-2fec-83a88b100ff3	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-fed8-4ddf-8ef1f353128b	\N	00040000-5620-fed6-425c-2ebf5b14c4a3	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-fed8-2a03-3d769e5e43b9	\N	00040000-5620-fed6-8010-fe603971b4fc	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-feda-c907-01010d0cf451	\N	00040000-5620-fed6-3d61-8cde3f178162	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3052 (class 0 OID 22373275)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5620-fed6-c26a-7205718167e6	8341	Adlešiči
00050000-5620-fed6-3317-6efc5f097f9f	5270	Ajdovščina
00050000-5620-fed6-32ce-518c9f720086	6280	Ankaran/Ancarano
00050000-5620-fed6-717a-ccb4e4651428	9253	Apače
00050000-5620-fed6-146f-da5533d40fdd	8253	Artiče
00050000-5620-fed6-b94c-3447c3ae43f6	4275	Begunje na Gorenjskem
00050000-5620-fed6-51fb-ea5149ef77e4	1382	Begunje pri Cerknici
00050000-5620-fed6-bccc-fb6c05ba3882	9231	Beltinci
00050000-5620-fed6-ff4e-23f2a3fb5b88	2234	Benedikt
00050000-5620-fed6-dba0-eee6437ec86c	2345	Bistrica ob Dravi
00050000-5620-fed6-956f-9e32e9f39dcf	3256	Bistrica ob Sotli
00050000-5620-fed6-cd86-bc34f41143ab	8259	Bizeljsko
00050000-5620-fed6-428c-86263a39210e	1223	Blagovica
00050000-5620-fed6-69cb-628fc5bf3d2f	8283	Blanca
00050000-5620-fed6-ec07-8f51effb44cd	4260	Bled
00050000-5620-fed6-9457-89ce3451277d	4273	Blejska Dobrava
00050000-5620-fed6-1b36-f084801b27a3	9265	Bodonci
00050000-5620-fed6-5766-c73e238b043d	9222	Bogojina
00050000-5620-fed6-0758-25327eefb6eb	4263	Bohinjska Bela
00050000-5620-fed6-ee0f-61d68591e7d3	4264	Bohinjska Bistrica
00050000-5620-fed6-5379-bdb125c3df1b	4265	Bohinjsko jezero
00050000-5620-fed6-d660-ff94d104cd7c	1353	Borovnica
00050000-5620-fed6-4da4-66a2feda4b1b	8294	Boštanj
00050000-5620-fed6-4350-49fa773bac26	5230	Bovec
00050000-5620-fed6-b020-4f5b047a7835	5295	Branik
00050000-5620-fed6-5c27-773d66c3b663	3314	Braslovče
00050000-5620-fed6-9789-3f28b3009679	5223	Breginj
00050000-5620-fed6-2fc6-fd872871823b	8280	Brestanica
00050000-5620-fed6-8167-d793b604bf12	2354	Bresternica
00050000-5620-fed6-64d2-0ff1677824c9	4243	Brezje
00050000-5620-fed6-180b-d89a0933941f	1351	Brezovica pri Ljubljani
00050000-5620-fed6-180d-2145792ae47f	8250	Brežice
00050000-5620-fed6-58e5-73bcd7e15761	4210	Brnik - Aerodrom
00050000-5620-fed6-72ef-12c6fae559b0	8321	Brusnice
00050000-5620-fed6-d92b-f1bcf7688863	3255	Buče
00050000-5620-fed6-4fad-15150cd4076d	8276	Bučka 
00050000-5620-fed6-9f89-94dc7c41c694	9261	Cankova
00050000-5620-fed6-70b5-f074be68e94e	3000	Celje 
00050000-5620-fed6-daa8-3b7d47a4deb7	3001	Celje - poštni predali
00050000-5620-fed6-5358-a6672ac6efdc	4207	Cerklje na Gorenjskem
00050000-5620-fed6-31ce-4ef519def464	8263	Cerklje ob Krki
00050000-5620-fed6-7258-403afaa02fda	1380	Cerknica
00050000-5620-fed6-e1e1-c9e28c7cd6c9	5282	Cerkno
00050000-5620-fed6-2b2a-790ab8cd4643	2236	Cerkvenjak
00050000-5620-fed6-ea26-e53e32e11d1d	2215	Ceršak
00050000-5620-fed6-0174-f5695ba9dc5c	2326	Cirkovce
00050000-5620-fed6-75f6-f29ada28f05f	2282	Cirkulane
00050000-5620-fed6-bf23-b86408906058	5273	Col
00050000-5620-fed6-656c-22a7e657661e	8251	Čatež ob Savi
00050000-5620-fed6-9f60-7772cadf7a32	1413	Čemšenik
00050000-5620-fed6-8dec-1eca06a15dcf	5253	Čepovan
00050000-5620-fed6-a724-9d6a7b01a1f0	9232	Črenšovci
00050000-5620-fed6-aee7-3dd1d4cf88cd	2393	Črna na Koroškem
00050000-5620-fed6-cc85-1c68115f2f5d	6275	Črni Kal
00050000-5620-fed6-51f5-b8aba287933e	5274	Črni Vrh nad Idrijo
00050000-5620-fed6-ccda-c67e0a6a45ac	5262	Črniče
00050000-5620-fed6-73be-c99170cf0369	8340	Črnomelj
00050000-5620-fed6-5a9e-bc07b1e52c6a	6271	Dekani
00050000-5620-fed6-a685-8ff81f9a8432	5210	Deskle
00050000-5620-fed6-142f-2e03bd0a40a2	2253	Destrnik
00050000-5620-fed6-1c8b-92af4bf050ef	6215	Divača
00050000-5620-fed6-008d-dc00d1d57df4	1233	Dob
00050000-5620-fed6-47fe-572ceedbaec8	3224	Dobje pri Planini
00050000-5620-fed6-104b-a155f3a35fa6	8257	Dobova
00050000-5620-fed6-3bfd-60f81f6b936a	1423	Dobovec
00050000-5620-fed6-ddf0-e04ce33ab8e4	5263	Dobravlje
00050000-5620-fed6-baa5-9515074e7e59	3204	Dobrna
00050000-5620-fed6-650d-92e966d26b12	8211	Dobrnič
00050000-5620-fed6-3018-bd3f7a66255b	1356	Dobrova
00050000-5620-fed6-9bca-5e5af7e71ab7	9223	Dobrovnik/Dobronak 
00050000-5620-fed6-a32c-af2ef6e6b1af	5212	Dobrovo v Brdih
00050000-5620-fed6-f8bd-3f9398920b36	1431	Dol pri Hrastniku
00050000-5620-fed6-4778-8b10eb9dd70d	1262	Dol pri Ljubljani
00050000-5620-fed6-685b-4ff088fe940d	1273	Dole pri Litiji
00050000-5620-fed6-2c1f-220c6b1c5d5d	1331	Dolenja vas
00050000-5620-fed6-47d2-ff3e8519b79e	8350	Dolenjske Toplice
00050000-5620-fed6-979e-1af186d8807e	1230	Domžale
00050000-5620-fed6-2089-f84228f5554d	2252	Dornava
00050000-5620-fed6-f839-acfd0382da29	5294	Dornberk
00050000-5620-fed6-a8b7-6fc0bbf9f931	1319	Draga
00050000-5620-fed6-9691-f795b0c0a96e	8343	Dragatuš
00050000-5620-fed6-7aa6-620474a40bdc	3222	Dramlje
00050000-5620-fed6-bda3-86407885a58c	2370	Dravograd
00050000-5620-fed6-6cf1-a0bbd5176962	4203	Duplje
00050000-5620-fed6-b373-c78e8abea468	6221	Dutovlje
00050000-5620-fed6-51c5-6bbac04ebde4	8361	Dvor
00050000-5620-fed6-ab7d-22fb0b744412	2343	Fala
00050000-5620-fed6-a88d-02341cacae10	9208	Fokovci
00050000-5620-fed6-7261-3cd2fd6e2da7	2313	Fram
00050000-5620-fed6-c285-28b3ade18a75	3213	Frankolovo
00050000-5620-fed6-9e4a-26320d07a038	1274	Gabrovka
00050000-5620-fed6-fd04-c5f5482277ce	8254	Globoko
00050000-5620-fed6-7776-14b3fb2a8253	5275	Godovič
00050000-5620-fed6-d83d-fe03c0afcd4a	4204	Golnik
00050000-5620-fed6-032d-493dc6a1d0aa	3303	Gomilsko
00050000-5620-fed6-17b6-2acbe3e4f6e0	4224	Gorenja vas
00050000-5620-fed6-769b-56864ab16058	3263	Gorica pri Slivnici
00050000-5620-fed6-e2bf-249ab3b897fe	2272	Gorišnica
00050000-5620-fed6-4c7e-5c7049d77973	9250	Gornja Radgona
00050000-5620-fed6-3540-292c672d30d2	3342	Gornji Grad
00050000-5620-fed6-7f58-ea639d144f53	4282	Gozd Martuljek
00050000-5620-fed6-768f-0fd9c155df76	6272	Gračišče
00050000-5620-fed6-fd35-b12737313352	9264	Grad
00050000-5620-fed6-1011-97b325990434	8332	Gradac
00050000-5620-fed6-2423-35522785690b	1384	Grahovo
00050000-5620-fed6-bd18-cf8228a3c963	5242	Grahovo ob Bači
00050000-5620-fed6-7f9a-b613dbbf44a6	5251	Grgar
00050000-5620-fed6-c0d4-6556fb74b6c6	3302	Griže
00050000-5620-fed6-28e7-550a0969511f	3231	Grobelno
00050000-5620-fed6-c5a3-4a1303b00f2a	1290	Grosuplje
00050000-5620-fed6-f054-e1ac9a876ea2	2288	Hajdina
00050000-5620-fed6-1400-d72e45cbd316	8362	Hinje
00050000-5620-fed6-1d1b-696077decdec	2311	Hoče
00050000-5620-fed6-6802-116f08ec25ef	9205	Hodoš/Hodos
00050000-5620-fed6-dccd-d36273390ead	1354	Horjul
00050000-5620-fed6-892b-128ef29f6ada	1372	Hotedršica
00050000-5620-fed6-c713-0472391eced2	1430	Hrastnik
00050000-5620-fed6-84bf-537d4331b8dd	6225	Hruševje
00050000-5620-fed6-9a8d-8e31af1384e8	4276	Hrušica
00050000-5620-fed6-e0d0-b65166862d34	5280	Idrija
00050000-5620-fed6-8b52-9c31ebab7c81	1292	Ig
00050000-5620-fed6-78ad-ef91fe62ddbe	6250	Ilirska Bistrica
00050000-5620-fed6-b5c1-899273ab0594	6251	Ilirska Bistrica-Trnovo
00050000-5620-fed6-8d07-555fc98ced79	1295	Ivančna Gorica
00050000-5620-fed6-56f0-a1b794ebb7cc	2259	Ivanjkovci
00050000-5620-fed6-346b-341959762098	1411	Izlake
00050000-5620-fed6-bd36-678f66e93b6b	6310	Izola/Isola
00050000-5620-fed6-0698-d411a6625b98	2222	Jakobski Dol
00050000-5620-fed6-1c43-86ecee1ae19d	2221	Jarenina
00050000-5620-fed6-f496-5925cbe37b29	6254	Jelšane
00050000-5620-fed6-8cf3-ddd4000eabd5	4270	Jesenice
00050000-5620-fed6-304e-a22d3da14292	8261	Jesenice na Dolenjskem
00050000-5620-fed6-573f-cd4ac6d0ef06	3273	Jurklošter
00050000-5620-fed6-8727-acfe041db5ab	2223	Jurovski Dol
00050000-5620-fed6-fddb-30fb22c4b9b6	2256	Juršinci
00050000-5620-fed6-d307-2f01012aca99	5214	Kal nad Kanalom
00050000-5620-fed6-7785-b2b140d7f42b	3233	Kalobje
00050000-5620-fed6-18f3-07cde5aac41b	4246	Kamna Gorica
00050000-5620-fed6-48bd-2a870965bdd4	2351	Kamnica
00050000-5620-fed6-c0a8-2553cb498afb	1241	Kamnik
00050000-5620-fed6-d8a0-3053ff559241	5213	Kanal
00050000-5620-fed6-714a-e0ab5fa509c3	8258	Kapele
00050000-5620-fed6-1e91-7a8bc9366d8a	2362	Kapla
00050000-5620-fed6-34c6-bb40fe79c8c7	2325	Kidričevo
00050000-5620-fed6-07d6-2a9754dbd2db	1412	Kisovec
00050000-5620-fed6-3f73-8d095f76d1a6	6253	Knežak
00050000-5620-fed6-852c-362526c79ca6	5222	Kobarid
00050000-5620-fed6-8581-a77efcea15bc	9227	Kobilje
00050000-5620-fed6-50b0-a860d5c27d6c	1330	Kočevje
00050000-5620-fed6-aefc-64c89e14cdcd	1338	Kočevska Reka
00050000-5620-fed6-c115-3ee57171dbd8	2276	Kog
00050000-5620-fed6-ca8c-1559feb0b694	5211	Kojsko
00050000-5620-fed6-ee73-c07fdd722175	6223	Komen
00050000-5620-fed6-d059-13016a87e230	1218	Komenda
00050000-5620-fed6-7d1c-e7a808883b4d	6000	Koper/Capodistria 
00050000-5620-fed6-96bf-8fea681fc817	6001	Koper/Capodistria - poštni predali
00050000-5620-fed6-b675-39449fb530f1	8282	Koprivnica
00050000-5620-fed6-752f-38ff1bb7f61c	5296	Kostanjevica na Krasu
00050000-5620-fed6-90ce-2d803cbcc681	8311	Kostanjevica na Krki
00050000-5620-fed6-f1ef-a0164c5ef28f	1336	Kostel
00050000-5620-fed6-6a7a-8d48c6b3ed6b	6256	Košana
00050000-5620-fed6-c766-8a0ac7b5d520	2394	Kotlje
00050000-5620-fed6-86cf-73927a8bd268	6240	Kozina
00050000-5620-fed6-d796-add2b23a12ea	3260	Kozje
00050000-5620-fed6-0489-f9638fc1c2cd	4000	Kranj 
00050000-5620-fed6-ddaa-7f4ef21169e2	4001	Kranj - poštni predali
00050000-5620-fed6-c4a3-1025c2eb370e	4280	Kranjska Gora
00050000-5620-fed6-3aa4-bb3e1d154771	1281	Kresnice
00050000-5620-fed6-3388-3554f2e6323d	4294	Križe
00050000-5620-fed6-1f8c-970577e35955	9206	Križevci
00050000-5620-fed6-cc26-8a26943c3215	9242	Križevci pri Ljutomeru
00050000-5620-fed6-c18d-dbc12a9c4f55	1301	Krka
00050000-5620-fed6-4cea-8de9e8d8c7dc	8296	Krmelj
00050000-5620-fed6-74bb-c9801bebd152	4245	Kropa
00050000-5620-fed6-515b-3df4c4e9995c	8262	Krška vas
00050000-5620-fed6-de05-1137448b85ca	8270	Krško
00050000-5620-fed6-e0c3-562f1d0891d9	9263	Kuzma
00050000-5620-fed6-a52e-9c5e52501dfd	2318	Laporje
00050000-5620-fed6-3fd3-c0721190537f	3270	Laško
00050000-5620-fed6-9d5b-da47c33b6952	1219	Laze v Tuhinju
00050000-5620-fed6-81dd-5729bb7522e1	2230	Lenart v Slovenskih goricah
00050000-5620-fed6-0b75-a4e7c56c4839	9220	Lendava/Lendva
00050000-5620-fed6-7c73-a960f5f4aed1	4248	Lesce
00050000-5620-fed6-d62e-9c924a6f1e86	3261	Lesično
00050000-5620-fed6-6f93-aca173d2f9d5	8273	Leskovec pri Krškem
00050000-5620-fed6-57fb-9967b7caf723	2372	Libeliče
00050000-5620-fed6-f8da-dd6957573e0d	2341	Limbuš
00050000-5620-fed6-2d22-edbe410eb5ae	1270	Litija
00050000-5620-fed6-4569-2f9b4e0ba126	3202	Ljubečna
00050000-5620-fed6-b731-b3d8ee374440	1000	Ljubljana 
00050000-5620-fed6-1991-de6b2b1a91a2	1001	Ljubljana - poštni predali
00050000-5620-fed6-5977-aba36097ccd9	1231	Ljubljana - Črnuče
00050000-5620-fed6-9247-c3d7b30fff27	1261	Ljubljana - Dobrunje
00050000-5620-fed6-d171-82f32b7f77db	1260	Ljubljana - Polje
00050000-5620-fed6-50af-db4188c0f6ad	1210	Ljubljana - Šentvid
00050000-5620-fed6-6d5a-95ff88fcb85f	1211	Ljubljana - Šmartno
00050000-5620-fed6-d5c9-21da190dd709	3333	Ljubno ob Savinji
00050000-5620-fed6-6d9e-1079c6fb7969	9240	Ljutomer
00050000-5620-fed6-e835-8b491c80800c	3215	Loče
00050000-5620-fed6-8d68-9965308df286	5231	Log pod Mangartom
00050000-5620-fed6-2b90-6c94284ea5a3	1358	Log pri Brezovici
00050000-5620-fed6-477e-1c4fc9004555	1370	Logatec
00050000-5620-fed6-ae91-bb29c9009628	1371	Logatec
00050000-5620-fed6-816a-68b2b06b9aff	1434	Loka pri Zidanem Mostu
00050000-5620-fed6-d685-707327fd0ae1	3223	Loka pri Žusmu
00050000-5620-fed6-b839-59599ce0b129	6219	Lokev
00050000-5620-fed6-ef3a-57861d93261e	1318	Loški Potok
00050000-5620-fed6-c069-98ae36b65475	2324	Lovrenc na Dravskem polju
00050000-5620-fed6-723d-6bfac4cf0e79	2344	Lovrenc na Pohorju
00050000-5620-fed6-d233-fc0bcdce12b6	3334	Luče
00050000-5620-fed6-a11a-15043d791f71	1225	Lukovica
00050000-5620-fed6-4135-f2d731076a46	9202	Mačkovci
00050000-5620-fed6-2552-8b3883ada04d	2322	Majšperk
00050000-5620-fed6-1471-ded1a6b8dced	2321	Makole
00050000-5620-fed6-4ab5-db91051cac60	9243	Mala Nedelja
00050000-5620-fed6-762d-b53cb7a4bcdf	2229	Malečnik
00050000-5620-fed6-790e-8a908c7e065a	6273	Marezige
00050000-5620-fed6-2fc4-bc74895fe937	2000	Maribor 
00050000-5620-fed6-b2f6-1f37f5323ed4	2001	Maribor - poštni predali
00050000-5620-fed6-c5a3-176043317d9b	2206	Marjeta na Dravskem polju
00050000-5620-fed6-859d-786a19f6f427	2281	Markovci
00050000-5620-fed6-dff7-c3fc1dd49294	9221	Martjanci
00050000-5620-fed6-25db-330af4bae04c	6242	Materija
00050000-5620-fed6-e5bb-126cd1b825b7	4211	Mavčiče
00050000-5620-fed6-1750-041c0c198d48	1215	Medvode
00050000-5620-fed6-a5ed-9f821fc9ecf3	1234	Mengeš
00050000-5620-fed6-49e4-7970e8f880a3	8330	Metlika
00050000-5620-fed6-6f41-a1f1d90e5203	2392	Mežica
00050000-5620-fed6-7acb-ff135bc9baa0	2204	Miklavž na Dravskem polju
00050000-5620-fed6-4308-873ae4ff5866	2275	Miklavž pri Ormožu
00050000-5620-fed6-46bc-14eb7f3f8f48	5291	Miren
00050000-5620-fed6-3330-90516600bd9c	8233	Mirna
00050000-5620-fed6-7906-a13b8a68fc5a	8216	Mirna Peč
00050000-5620-fed6-ac79-29334a937d2c	2382	Mislinja
00050000-5620-fed6-75e0-0d8d438d7668	4281	Mojstrana
00050000-5620-fed6-5b5c-243f5c543c63	8230	Mokronog
00050000-5620-fed6-a2a5-2d367587576b	1251	Moravče
00050000-5620-fed6-aa24-12fad756e6f8	9226	Moravske Toplice
00050000-5620-fed6-4e63-4f5d5eb65f15	5216	Most na Soči
00050000-5620-fed6-ddc6-c5ea8dbeb804	1221	Motnik
00050000-5620-fed6-1b86-f800f5f62f77	3330	Mozirje
00050000-5620-fed6-5c83-13678fe49b9e	9000	Murska Sobota 
00050000-5620-fed6-70f5-a7595accc7e1	9001	Murska Sobota - poštni predali
00050000-5620-fed6-128e-57f87c0f58d7	2366	Muta
00050000-5620-fed6-e55d-73f0bdf3c342	4202	Naklo
00050000-5620-fed6-6c05-2cc6aab436fa	3331	Nazarje
00050000-5620-fed6-a512-5d297e190152	1357	Notranje Gorice
00050000-5620-fed6-e712-848226582bb1	3203	Nova Cerkev
00050000-5620-fed6-a907-b02ea172c741	5000	Nova Gorica 
00050000-5620-fed6-571c-04a54e14a60f	5001	Nova Gorica - poštni predali
00050000-5620-fed6-1458-61f95ffd0f94	1385	Nova vas
00050000-5620-fed6-b860-ceb5cd1a0c03	8000	Novo mesto
00050000-5620-fed6-49ca-2d74b7a9d4ef	8001	Novo mesto - poštni predali
00050000-5620-fed6-c918-2eb5f771bcf3	6243	Obrov
00050000-5620-fed6-3f68-233dfd41212e	9233	Odranci
00050000-5620-fed6-4f9a-0ca8834a91d7	2317	Oplotnica
00050000-5620-fed6-1af3-bd3f3c08c308	2312	Orehova vas
00050000-5620-fed6-8923-c92001c41a4c	2270	Ormož
00050000-5620-fed6-fe64-fb8d165850a4	1316	Ortnek
00050000-5620-fed6-0846-419c3c2d91cb	1337	Osilnica
00050000-5620-fed6-2f78-afa8ce001efb	8222	Otočec
00050000-5620-fed6-d034-46e0a6369240	2361	Ožbalt
00050000-5620-fed6-a5e7-0011ebd37971	2231	Pernica
00050000-5620-fed6-255a-759131ee1529	2211	Pesnica pri Mariboru
00050000-5620-fed6-6af6-fc29476916bb	9203	Petrovci
00050000-5620-fed6-160c-90dbb2864a02	3301	Petrovče
00050000-5620-fed6-5f83-acefca7994d1	6330	Piran/Pirano
00050000-5620-fed6-f26d-503be7e854ed	8255	Pišece
00050000-5620-fed6-d712-c7f03b8cbfee	6257	Pivka
00050000-5620-fed6-79a5-1531c6eaca4e	6232	Planina
00050000-5620-fed6-3ef8-80d7e7bfce54	3225	Planina pri Sevnici
00050000-5620-fed6-278f-f762f1fc691f	6276	Pobegi
00050000-5620-fed6-cdb2-877fc8bf9216	8312	Podbočje
00050000-5620-fed6-3add-12534784f7a6	5243	Podbrdo
00050000-5620-fed6-dab4-b9113d92db26	3254	Podčetrtek
00050000-5620-fed6-d413-9f08a833f63e	2273	Podgorci
00050000-5620-fed6-061f-0c2f2a610c29	6216	Podgorje
00050000-5620-fed6-c1f3-44867fe9efcf	2381	Podgorje pri Slovenj Gradcu
00050000-5620-fed6-51f7-7a290daab3f6	6244	Podgrad
00050000-5620-fed6-6fc5-b6d11c817f03	1414	Podkum
00050000-5620-fed6-388d-f69c0912fba8	2286	Podlehnik
00050000-5620-fed6-4fd8-714f7290b726	5272	Podnanos
00050000-5620-fed6-58e1-9533d5e21c64	4244	Podnart
00050000-5620-fed6-5230-73aa1db50a12	3241	Podplat
00050000-5620-fed6-e0ff-c210d8ebc762	3257	Podsreda
00050000-5620-fed6-e317-43607b0e8b74	2363	Podvelka
00050000-5620-fed6-1fef-4b070a7cb59b	2208	Pohorje
00050000-5620-fed6-9048-86204b80b4c4	2257	Polenšak
00050000-5620-fed6-b8c8-35ab3c9a27ea	1355	Polhov Gradec
00050000-5620-fed6-77aa-bea273a43776	4223	Poljane nad Škofjo Loko
00050000-5620-fed6-eee3-cf8429b75497	2319	Poljčane
00050000-5620-fed6-db92-4030e7c0a515	1272	Polšnik
00050000-5620-fed6-f36f-bf598cc3d030	3313	Polzela
00050000-5620-fed6-4e9d-b1357c7985cc	3232	Ponikva
00050000-5620-fed6-e256-8b6c89c1c7a4	6320	Portorož/Portorose
00050000-5620-fed6-7738-ca790d036289	6230	Postojna
00050000-5620-fed6-838c-e7d4345de8d6	2331	Pragersko
00050000-5620-fed6-5102-f751832fdea3	3312	Prebold
00050000-5620-fed6-8019-16d0729b4e25	4205	Preddvor
00050000-5620-fed6-d3e2-0b1908df1c6c	6255	Prem
00050000-5620-fed6-c192-e19238ddf769	1352	Preserje
00050000-5620-fed6-bb5a-365c934e04d3	6258	Prestranek
00050000-5620-fed6-b6e8-22c719130f1b	2391	Prevalje
00050000-5620-fed6-3743-4c802969dc68	3262	Prevorje
00050000-5620-fed6-85e6-6bcbf4b14337	1276	Primskovo 
00050000-5620-fed6-947b-b85b1164123c	3253	Pristava pri Mestinju
00050000-5620-fed6-ca40-76d2c822816c	9207	Prosenjakovci/Partosfalva
00050000-5620-fed6-f543-cb54295bbaf6	5297	Prvačina
00050000-5620-fed6-28df-42dfb166a941	2250	Ptuj
00050000-5620-fed6-6399-10af6c8a0d95	2323	Ptujska Gora
00050000-5620-fed6-8224-8d46a773f9ae	9201	Puconci
00050000-5620-fed6-221b-180848709f93	2327	Rače
00050000-5620-fed6-2624-46bbffdb0662	1433	Radeče
00050000-5620-fed6-ac3c-cfe4367d2c92	9252	Radenci
00050000-5620-fed6-d6fb-ddbc9f33c55c	2360	Radlje ob Dravi
00050000-5620-fed6-8bd2-70f83b197bcc	1235	Radomlje
00050000-5620-fed6-199e-e3add82d7638	4240	Radovljica
00050000-5620-fed6-985e-878a1dd199b3	8274	Raka
00050000-5620-fed6-82d5-170968a83d4a	1381	Rakek
00050000-5620-fed6-b17f-7ca81658288b	4283	Rateče - Planica
00050000-5620-fed6-5987-f43be0080d3a	2390	Ravne na Koroškem
00050000-5620-fed6-4c2d-467a3a279c74	9246	Razkrižje
00050000-5620-fed6-1571-4a70b96e6d96	3332	Rečica ob Savinji
00050000-5620-fed6-1628-f0363cc0eb3c	5292	Renče
00050000-5620-fed6-9732-c29da36a6ad0	1310	Ribnica
00050000-5620-fed6-250b-d1c253244400	2364	Ribnica na Pohorju
00050000-5620-fed6-ef49-b403637d0c72	3272	Rimske Toplice
00050000-5620-fed6-1b34-bc7c9b728800	1314	Rob
00050000-5620-fed6-931e-71a102832f2a	5215	Ročinj
00050000-5620-fed6-d358-0e38d01ff2df	3250	Rogaška Slatina
00050000-5620-fed6-b9a4-8b70478f9730	9262	Rogašovci
00050000-5620-fed6-8f3e-e698571842f7	3252	Rogatec
00050000-5620-fed6-9c15-c7af344b71d8	1373	Rovte
00050000-5620-fed6-7eaa-4f1450f431e8	2342	Ruše
00050000-5620-fed6-0759-9cfefc343ee1	1282	Sava
00050000-5620-fed6-7a23-76c726207d5f	6333	Sečovlje/Sicciole
00050000-5620-fed6-5fee-afc1e4532e0e	4227	Selca
00050000-5620-fed6-132d-50a241310c5d	2352	Selnica ob Dravi
00050000-5620-fed6-dde5-daee3d4fb408	8333	Semič
00050000-5620-fed6-d188-0cf9941490a6	8281	Senovo
00050000-5620-fed6-f530-23db27e1f9ee	6224	Senožeče
00050000-5620-fed6-668b-73db3038b362	8290	Sevnica
00050000-5620-fed6-5332-0fa88d9772e2	6210	Sežana
00050000-5620-fed6-05a4-5e92b6977218	2214	Sladki Vrh
00050000-5620-fed6-704c-d4dc6e7a4a0c	5283	Slap ob Idrijci
00050000-5620-fed6-5217-710009825303	2380	Slovenj Gradec
00050000-5620-fed6-7f98-8cbf90e0c3ec	2310	Slovenska Bistrica
00050000-5620-fed6-d467-fb04e02f929e	3210	Slovenske Konjice
00050000-5620-fed6-35dc-7ad005f9083a	1216	Smlednik
00050000-5620-fed6-3f41-7007910bc6da	5232	Soča
00050000-5620-fed6-4426-4007d3f57c9d	1317	Sodražica
00050000-5620-fed6-55e7-ca1f9c7d4048	3335	Solčava
00050000-5620-fed6-91ae-af2130ae630b	5250	Solkan
00050000-5620-fed6-7493-38f65db04156	4229	Sorica
00050000-5620-fed6-2ce1-e18ed81a0869	4225	Sovodenj
00050000-5620-fed6-083c-295e6c501fbd	5281	Spodnja Idrija
00050000-5620-fed6-2109-2d78d9b5434b	2241	Spodnji Duplek
00050000-5620-fed6-f676-acb39fb9a6c5	9245	Spodnji Ivanjci
00050000-5620-fed6-29b9-c1d27efd0d3a	2277	Središče ob Dravi
00050000-5620-fed6-efd6-8228e872bfde	4267	Srednja vas v Bohinju
00050000-5620-fed6-2d4a-53021295cd26	8256	Sromlje 
00050000-5620-fed6-892a-4caa9c29320e	5224	Srpenica
00050000-5620-fed6-faee-6e3c9a311d53	1242	Stahovica
00050000-5620-fed6-713c-1157799a138e	1332	Stara Cerkev
00050000-5620-fed6-fd54-caf961758f3e	8342	Stari trg ob Kolpi
00050000-5620-fed6-368b-7c943674f69b	1386	Stari trg pri Ložu
00050000-5620-fed6-1fc3-1761087da1e4	2205	Starše
00050000-5620-fed6-d31c-e026904809e0	2289	Stoperce
00050000-5620-fed6-5384-ec5cb81baa72	8322	Stopiče
00050000-5620-fed6-a419-8f92815b2b78	3206	Stranice
00050000-5620-fed6-5de3-f8b036327543	8351	Straža
00050000-5620-fed6-fd85-e53b6a6d588b	1313	Struge
00050000-5620-fed6-5f8b-bdfa3d66a11a	8293	Studenec
00050000-5620-fed6-dd20-47332d5d7070	8331	Suhor
00050000-5620-fed6-ac30-ac6cb1f59e68	2233	Sv. Ana v Slovenskih goricah
00050000-5620-fed6-2e37-e345bf4e7062	2235	Sv. Trojica v Slovenskih goricah
00050000-5620-fed6-75ae-1b3c29a04582	2353	Sveti Duh na Ostrem Vrhu
00050000-5620-fed6-97df-cbc2a77f021d	9244	Sveti Jurij ob Ščavnici
00050000-5620-fed6-7df8-64aa8539de61	3264	Sveti Štefan
00050000-5620-fed6-3459-a95374c867a6	2258	Sveti Tomaž
00050000-5620-fed6-1490-88bf87a886d7	9204	Šalovci
00050000-5620-fed6-ff22-bfd6f5aef1e4	5261	Šempas
00050000-5620-fed6-c4ce-0dd5f1c4091b	5290	Šempeter pri Gorici
00050000-5620-fed6-bf3b-c0f7218024b6	3311	Šempeter v Savinjski dolini
00050000-5620-fed6-2100-cf1768abd663	4208	Šenčur
00050000-5620-fed6-64f7-73c9f677bff9	2212	Šentilj v Slovenskih goricah
00050000-5620-fed6-515c-9f2bb14071ac	8297	Šentjanž
00050000-5620-fed6-4b7d-1ae5cab2d3e3	2373	Šentjanž pri Dravogradu
00050000-5620-fed6-7d96-1031ffd17087	8310	Šentjernej
00050000-5620-fed6-4a40-84fd578f7f92	3230	Šentjur
00050000-5620-fed6-cd49-19add329e2d3	3271	Šentrupert
00050000-5620-fed6-c3c9-07c11e4dc5ee	8232	Šentrupert
00050000-5620-fed6-7cf8-af7c84461586	1296	Šentvid pri Stični
00050000-5620-fed6-a26c-4f0b6623c823	8275	Škocjan
00050000-5620-fed6-3f68-020c8946cbe7	6281	Škofije
00050000-5620-fed6-e072-f82d08bd98e3	4220	Škofja Loka
00050000-5620-fed6-8d3c-d4c1535410d0	3211	Škofja vas
00050000-5620-fed6-f9f1-9f8c2a58b120	1291	Škofljica
00050000-5620-fed6-c2f1-1935c6e3383f	6274	Šmarje
00050000-5620-fed6-927e-7ae9e602c2ed	1293	Šmarje - Sap
00050000-5620-fed6-b1b1-af992e38bf2b	3240	Šmarje pri Jelšah
00050000-5620-fed6-05a8-fe784015ba26	8220	Šmarješke Toplice
00050000-5620-fed6-7048-5c84de8b03bf	2315	Šmartno na Pohorju
00050000-5620-fed6-3d37-e580e2a48d80	3341	Šmartno ob Dreti
00050000-5620-fed6-a41c-2c48a10813e7	3327	Šmartno ob Paki
00050000-5620-fed6-a858-8591b9b792cf	1275	Šmartno pri Litiji
00050000-5620-fed6-ac6f-0885332afed2	2383	Šmartno pri Slovenj Gradcu
00050000-5620-fed6-5d6f-2da9820e2336	3201	Šmartno v Rožni dolini
00050000-5620-fed6-1fc3-298a110984f7	3325	Šoštanj
00050000-5620-fed6-ec5e-ccd604e5d611	6222	Štanjel
00050000-5620-fed6-2119-9496ea838242	3220	Štore
00050000-5620-fed6-f5f6-95897b355f5d	3304	Tabor
00050000-5620-fed6-394b-9c6627fd24a8	3221	Teharje
00050000-5620-fed6-c12c-04fb8a5f6910	9251	Tišina
00050000-5620-fed6-dec0-84fbdc1826f7	5220	Tolmin
00050000-5620-fed6-729b-f6bfeb866710	3326	Topolšica
00050000-5620-fed6-4298-1b09001b30bc	2371	Trbonje
00050000-5620-fed6-9406-e3dd1dcf03cf	1420	Trbovlje
00050000-5620-fed6-c71e-9ea77ea9d49d	8231	Trebelno 
00050000-5620-fed6-dda4-7f941e5bf80d	8210	Trebnje
00050000-5620-fed6-741b-07ab070baa7c	5252	Trnovo pri Gorici
00050000-5620-fed6-3227-6bd78ea795a3	2254	Trnovska vas
00050000-5620-fed6-8910-f5053aef6ebc	1222	Trojane
00050000-5620-fed6-0a4a-7385cadeb2c7	1236	Trzin
00050000-5620-fed6-d0c7-97f9c7aabe84	4290	Tržič
00050000-5620-fed6-ecd4-3636bddc9aa2	8295	Tržišče
00050000-5620-fed6-2571-9ad55701e1fb	1311	Turjak
00050000-5620-fed6-7cf7-ae89f9af0995	9224	Turnišče
00050000-5620-fed6-9015-2076e166ac4f	8323	Uršna sela
00050000-5620-fed6-b81b-49535e173836	1252	Vače
00050000-5620-fed6-00e2-1f4362f21fa5	3320	Velenje 
00050000-5620-fed6-d6f6-8537e3727df9	3322	Velenje - poštni predali
00050000-5620-fed6-9445-7cf9d7cb5526	8212	Velika Loka
00050000-5620-fed6-db74-8b4cf26bfc85	2274	Velika Nedelja
00050000-5620-fed6-ce00-1dd11886cb6e	9225	Velika Polana
00050000-5620-fed6-31b8-43d1d8ea86d0	1315	Velike Lašče
00050000-5620-fed6-1e49-6c897ca11505	8213	Veliki Gaber
00050000-5620-fed6-5595-4caef4243026	9241	Veržej
00050000-5620-fed6-9bc6-d550793b40ec	1312	Videm - Dobrepolje
00050000-5620-fed6-b4be-46cacc0723a2	2284	Videm pri Ptuju
00050000-5620-fed6-6248-e718ba406db6	8344	Vinica
00050000-5620-fed6-2956-acd327159b38	5271	Vipava
00050000-5620-fed6-1b34-fd7f0db1f94b	4212	Visoko
00050000-5620-fed6-6e39-c6558679f3ec	1294	Višnja Gora
00050000-5620-fed6-8e51-a3cd55c542ec	3205	Vitanje
00050000-5620-fed6-cd8f-7d3001387c20	2255	Vitomarci
00050000-5620-fed6-ed2f-dff2df8231b4	1217	Vodice
00050000-5620-fed6-8ae5-f85160c6a0fb	3212	Vojnik\t
00050000-5620-fed6-97e6-cad7e5dafc74	5293	Volčja Draga
00050000-5620-fed6-e07c-3f73027c70ec	2232	Voličina
00050000-5620-fed6-e6be-8382d1ee3c2f	3305	Vransko
00050000-5620-fed6-07b4-5244de8697ca	6217	Vremski Britof
00050000-5620-fed6-8224-eef68ec8b1f1	1360	Vrhnika
00050000-5620-fed6-2ea1-96c2c82101ec	2365	Vuhred
00050000-5620-fed6-f200-0e5d779b397e	2367	Vuzenica
00050000-5620-fed6-af74-6048c259b1a1	8292	Zabukovje 
00050000-5620-fed6-3e7c-03e5e5d592e3	1410	Zagorje ob Savi
00050000-5620-fed6-143d-1f4c61a66875	1303	Zagradec
00050000-5620-fed6-692b-c5d9bb225d66	2283	Zavrč
00050000-5620-fed6-67ee-899cadbfb732	8272	Zdole 
00050000-5620-fed6-edf2-9d0c6ee154e5	4201	Zgornja Besnica
00050000-5620-fed6-d76e-273c6f048613	2242	Zgornja Korena
00050000-5620-fed6-5e1d-4c18e5dd5ef5	2201	Zgornja Kungota
00050000-5620-fed6-8ac6-7c16f23453a8	2316	Zgornja Ložnica
00050000-5620-fed6-4355-059eb48d6724	2314	Zgornja Polskava
00050000-5620-fed6-59ed-571d588c258d	2213	Zgornja Velka
00050000-5620-fed6-84ef-167e8199bf9c	4247	Zgornje Gorje
00050000-5620-fed6-b450-dee91f96bc6b	4206	Zgornje Jezersko
00050000-5620-fed6-ff17-0743b2b0201a	2285	Zgornji Leskovec
00050000-5620-fed6-adb7-9477124b08ce	1432	Zidani Most
00050000-5620-fed6-331c-2729f3adbdc1	3214	Zreče
00050000-5620-fed6-a522-c217b4b72d86	4209	Žabnica
00050000-5620-fed6-6fda-c0f72e30668d	3310	Žalec
00050000-5620-fed6-df18-02a2fa832413	4228	Železniki
00050000-5620-fed6-f8d0-faa707347262	2287	Žetale
00050000-5620-fed6-6f72-17c9da2029c8	4226	Žiri
00050000-5620-fed6-b624-920042d46e1c	4274	Žirovnica
00050000-5620-fed6-93da-5674d2e20edd	8360	Žužemberk
\.


--
-- TOC entry 3098 (class 0 OID 22373898)
-- Dependencies: 235
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22373490)
-- Dependencies: 208
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22373260)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5620-fed8-976e-bd4ad2ce6bcf	00080000-5620-fed8-356d-9118dda792da	\N	00040000-5620-fed6-3d61-8cde3f178162	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5620-fed8-a2b8-4cd8423ac966	00080000-5620-fed8-356d-9118dda792da	\N	00040000-5620-fed6-3d61-8cde3f178162	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5620-fed8-7608-f667cfa4dcc4	00080000-5620-fed8-b7ff-bc09b37c1e2c	\N	00040000-5620-fed6-3d61-8cde3f178162	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3059 (class 0 OID 22373364)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22373502)
-- Dependencies: 210
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 22373912)
-- Dependencies: 236
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22373922)
-- Dependencies: 237
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5620-fed8-8887-2f47e949f211	00080000-5620-fed8-d28b-6a70413980d7	0987	AK
00190000-5620-fed8-c2f7-cc34649f3462	00080000-5620-fed8-b7ff-bc09b37c1e2c	0989	AK
00190000-5620-fed8-519f-09e55a55e7db	00080000-5620-fed8-d384-bc0a9416450a	0986	AK
00190000-5620-fed8-4fbf-a9ae34c29523	00080000-5620-fed8-eb78-2486313e5f83	0984	AK
00190000-5620-fed8-63bb-8d1bf755b586	00080000-5620-fed8-f441-c88a8fc25b56	0983	AK
00190000-5620-fed8-5b6d-c241ed14b592	00080000-5620-fed8-4ddf-8ef1f353128b	0982	AK
00190000-5620-feda-7881-01c083adf319	00080000-5620-feda-c907-01010d0cf451	1001	AK
\.


--
-- TOC entry 3097 (class 0 OID 22373837)
-- Dependencies: 234
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5620-fed8-fe80-7d344e7032fc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3101 (class 0 OID 22373930)
-- Dependencies: 238
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22373531)
-- Dependencies: 214
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5620-fed8-7c3b-d3da900b6d0b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5620-fed8-6100-b86267b3b140	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5620-fed8-70aa-4895fbba38e6	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5620-fed8-b2b1-a5bef8e96c29	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5620-fed8-1586-8269bd38953f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5620-fed8-d015-d7e2deb43b81	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5620-fed8-8838-d79b50bc4092	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3069 (class 0 OID 22373475)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22373465)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22373676)
-- Dependencies: 227
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22373606)
-- Dependencies: 221
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22373338)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 22373111)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5620-feda-c907-01010d0cf451	00010000-5620-fed7-c63a-e41d5feaac94	2015-10-16 15:42:50	INS	a:0:{}
2	App\\Entity\\Option	00000000-5620-feda-4b2d-5e8048815cff	00010000-5620-fed7-c63a-e41d5feaac94	2015-10-16 15:42:50	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5620-feda-7881-01c083adf319	00010000-5620-fed7-c63a-e41d5feaac94	2015-10-16 15:42:50	INS	a:0:{}
\.


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3078 (class 0 OID 22373544)
-- Dependencies: 215
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 22373149)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5620-fed7-028f-2e0fe8477d40	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5620-fed7-3309-f5cfc36f9aa5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5620-fed7-4fd4-e3c2639fd565	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5620-fed7-8de4-1bb97e5e3c05	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5620-fed7-5400-b06d28ec9ba1	planer	Planer dogodkov v koledarju	t
00020000-5620-fed7-0902-a1a94aaf4b47	kadrovska	Kadrovska služba	t
00020000-5620-fed7-3b3a-50109133d6be	arhivar	Ažuriranje arhivalij	t
00020000-5620-fed7-8257-4de6e6b1c958	igralec	Igralec	t
00020000-5620-fed7-be82-33761f199634	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5620-fed8-3e71-87e45dc41e0d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3040 (class 0 OID 22373133)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5620-fed7-189f-8f7c57c3c54d	00020000-5620-fed7-4fd4-e3c2639fd565
00010000-5620-fed7-c63a-e41d5feaac94	00020000-5620-fed7-4fd4-e3c2639fd565
00010000-5620-fed8-20b5-1cb12cfd4118	00020000-5620-fed8-3e71-87e45dc41e0d
\.


--
-- TOC entry 3080 (class 0 OID 22373558)
-- Dependencies: 217
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22373496)
-- Dependencies: 209
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22373442)
-- Dependencies: 203
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 22373098)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5620-fed6-97e4-f94632a5e422	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5620-fed6-cab4-88ed02952629	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5620-fed6-256a-31ea8d1d605c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5620-fed6-dcf1-54b1950f87be	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5620-fed6-01db-bafffc9a3f71	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3035 (class 0 OID 22373090)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5620-fed6-79b8-32abdb891e9a	00230000-5620-fed6-dcf1-54b1950f87be	popa
00240000-5620-fed6-2ed3-5656d08a2d4a	00230000-5620-fed6-dcf1-54b1950f87be	oseba
00240000-5620-fed6-051c-b11942a5fe64	00230000-5620-fed6-dcf1-54b1950f87be	tippopa
00240000-5620-fed6-cfc9-9b92e2297450	00230000-5620-fed6-dcf1-54b1950f87be	organizacijskaenota
00240000-5620-fed6-eeef-cfc8ab40d28e	00230000-5620-fed6-dcf1-54b1950f87be	sezona
00240000-5620-fed6-4d62-c3276e62e1d0	00230000-5620-fed6-dcf1-54b1950f87be	tipvaje
00240000-5620-fed6-fe62-aba539893adc	00230000-5620-fed6-cab4-88ed02952629	prostor
00240000-5620-fed6-571f-a77f0bf80e2e	00230000-5620-fed6-dcf1-54b1950f87be	besedilo
00240000-5620-fed6-5243-cee5e4c8e441	00230000-5620-fed6-dcf1-54b1950f87be	uprizoritev
00240000-5620-fed6-b3fd-028f5500ee48	00230000-5620-fed6-dcf1-54b1950f87be	funkcija
00240000-5620-fed6-f81a-64235c3d6929	00230000-5620-fed6-dcf1-54b1950f87be	tipfunkcije
00240000-5620-fed6-ccce-9aab849cd893	00230000-5620-fed6-dcf1-54b1950f87be	alternacija
00240000-5620-fed6-bb48-21c36987abfd	00230000-5620-fed6-97e4-f94632a5e422	pogodba
00240000-5620-fed6-dd9d-835e5e5b8acc	00230000-5620-fed6-dcf1-54b1950f87be	zaposlitev
00240000-5620-fed6-a05f-c6994e4dcc3b	00230000-5620-fed6-dcf1-54b1950f87be	zvrstuprizoritve
00240000-5620-fed6-d8ae-cbe465e52025	00230000-5620-fed6-97e4-f94632a5e422	programdela
00240000-5620-fed6-59a6-7ddebd56ef11	00230000-5620-fed6-dcf1-54b1950f87be	zapis
\.


--
-- TOC entry 3034 (class 0 OID 22373085)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7c090641-3219-49e1-83e6-47b5165923d5	00240000-5620-fed6-79b8-32abdb891e9a	0	1001
\.


--
-- TOC entry 3086 (class 0 OID 22373623)
-- Dependencies: 223
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5620-fed8-0fdc-787e341eb7f4	000e0000-5620-fed8-e29e-d40072893aeb	00080000-5620-fed8-356d-9118dda792da	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5620-fed7-604f-27aade3b5ded
00270000-5620-fed8-59cb-40c4a964c7db	000e0000-5620-fed8-e29e-d40072893aeb	00080000-5620-fed8-356d-9118dda792da	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5620-fed7-604f-27aade3b5ded
\.


--
-- TOC entry 3048 (class 0 OID 22373221)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22373452)
-- Dependencies: 204
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5620-fed9-6e22-82be179b61fa	00180000-5620-fed8-066c-14ce9bd66f41	000c0000-5620-fed9-133b-6da2100e9ba4	00090000-5620-fed8-ccde-1cf3f999ddb7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-fed9-faba-4e94aed0c1f8	00180000-5620-fed8-066c-14ce9bd66f41	000c0000-5620-fed9-63a2-15fb8c9060bd	00090000-5620-fed8-6779-30a26d076379	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-fed9-142d-675e7415589b	00180000-5620-fed8-066c-14ce9bd66f41	000c0000-5620-fed9-b235-5438ce065a1b	00090000-5620-fed8-672f-945a342f3e67	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-fed9-b3db-75fb4c3c30c8	00180000-5620-fed8-066c-14ce9bd66f41	000c0000-5620-fed9-8183-3ac15c44b4e0	00090000-5620-fed8-1b76-99d966b059ce	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-fed9-7d7f-f4cbded89a27	00180000-5620-fed8-066c-14ce9bd66f41	000c0000-5620-fed9-f034-ff5d33bbcfde	00090000-5620-fed8-3636-74548311e081	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-fed9-0a92-d594e2c3909c	00180000-5620-fed8-929f-87ae204ba9e5	\N	00090000-5620-fed8-3636-74548311e081	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3089 (class 0 OID 22373664)
-- Dependencies: 226
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5620-fed6-bfcf-e34987d65f57	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5620-fed6-e4d2-788bbcd3f1d3	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5620-fed6-480d-988faba224c1	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5620-fed6-f856-fee8a92846a4	04	Režija	Režija	Režija	umetnik	30
000f0000-5620-fed6-253b-6af7ef35f4b9	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5620-fed6-7aef-45cd99e61871	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5620-fed6-fd65-e385667780f7	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5620-fed6-86d1-64a99efc0342	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5620-fed6-720d-29472401efd2	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5620-fed6-f7ca-a77c845a519a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5620-fed6-0205-3f5fa3b86ea5	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5620-fed6-201e-6e6fdddd7e4e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5620-fed6-10c5-828bd82c39b0	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5620-fed6-4e86-4f08c12550fa	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5620-fed6-0019-7acd91ce4809	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5620-fed6-1096-cda19c4e8940	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5620-fed6-ddf7-cf10e5e62d2b	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5620-fed6-d7cd-e01118d2b03b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3045 (class 0 OID 22373175)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5620-fed8-b41e-2699f0bd0810	0001	šola	osnovna ali srednja šola
00400000-5620-fed8-2621-54a66a095862	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5620-fed8-4782-4bea143bbda1	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3102 (class 0 OID 22373941)
-- Dependencies: 239
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5620-fed6-09e0-bacea357d6bd	01	Velika predstava	f	1.00	1.00
002b0000-5620-fed6-0ee9-973e74ed6e6e	02	Mala predstava	f	0.50	0.50
002b0000-5620-fed6-198c-0ba3d7d14724	03	Mala koprodukcija	t	0.40	1.00
002b0000-5620-fed6-9885-25146fd87a72	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5620-fed6-d0e9-a43a47581327	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3065 (class 0 OID 22373432)
-- Dependencies: 202
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5620-fed6-16ab-f72324152548	0001	prva vaja	prva vaja
00420000-5620-fed6-366e-b4242d1e92ba	0002	tehnična vaja	tehnična vaja
00420000-5620-fed6-e8eb-c6b15c4b8774	0003	lučna vaja	lučna vaja
00420000-5620-fed6-eaca-a8275138a236	0004	kostumska vaja	kostumska vaja
00420000-5620-fed6-cbfe-53198112f9a1	0005	foto vaja	foto vaja
00420000-5620-fed6-c618-686bd98410ae	0006	1. glavna vaja	1. glavna vaja
00420000-5620-fed6-588e-9d7cfa8e6447	0007	2. glavna vaja	2. glavna vaja
00420000-5620-fed6-5aa6-a0069c015946	0008	1. generalka	1. generalka
00420000-5620-fed6-c35a-61eed4a15702	0009	2. generalka	2. generalka
00420000-5620-fed6-edfe-e4646ce6323f	0010	odprta generalka	odprta generalka
00420000-5620-fed6-c027-26c95ed23a47	0011	obnovitvena vaja	obnovitvena vaja
00420000-5620-fed6-efc4-5509c1fe6220	0012	pevska vaja	pevska vaja
00420000-5620-fed6-fc74-7c59b0327e44	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5620-fed6-8e2b-379daf12a27e	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3054 (class 0 OID 22373295)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 22373120)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5620-fed7-c63a-e41d5feaac94	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRObyjgF2hMVxhNzNA1RPiQ0a9fauDTpdG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5620-fed8-1d8a-3cb062ad3c75	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5620-fed8-c270-842b6321ca91	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5620-fed8-e7e5-b93ec98e544a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5620-fed8-63a0-f186580df545	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5620-fed8-128f-52373139d0c2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5620-fed8-0d00-fd4b1fb2c6e2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5620-fed8-6331-303c517b3412	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5620-fed8-f8e8-8ec1f2fe8d8c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5620-fed8-8374-0cdb59903544	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5620-fed8-20b5-1cb12cfd4118	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5620-fed7-189f-8f7c57c3c54d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3093 (class 0 OID 22373714)
-- Dependencies: 230
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5620-fed8-f185-c86da8ab396c	00160000-5620-fed8-d884-30e169b57b44	\N	00140000-5620-fed6-f702-96fb8dd47082	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5620-fed8-1586-8269bd38953f
000e0000-5620-fed8-e29e-d40072893aeb	00160000-5620-fed8-2c2a-ffe242c66302	\N	00140000-5620-fed6-98a2-cf4be0d4d62b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5620-fed8-d015-d7e2deb43b81
000e0000-5620-fed8-5f64-9503cb0924e1	\N	\N	00140000-5620-fed6-98a2-cf4be0d4d62b	00190000-5620-fed8-8887-2f47e949f211	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-fed8-1586-8269bd38953f
000e0000-5620-fed8-c653-3d575cba684a	\N	\N	00140000-5620-fed6-98a2-cf4be0d4d62b	00190000-5620-fed8-8887-2f47e949f211	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-fed8-1586-8269bd38953f
000e0000-5620-fed8-eb23-6638d6491966	\N	\N	00140000-5620-fed6-98a2-cf4be0d4d62b	00190000-5620-fed8-8887-2f47e949f211	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-fed8-7c3b-d3da900b6d0b
000e0000-5620-fed8-d401-23c31d3c9bd5	\N	\N	00140000-5620-fed6-98a2-cf4be0d4d62b	00190000-5620-fed8-8887-2f47e949f211	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-fed8-7c3b-d3da900b6d0b
\.


--
-- TOC entry 3061 (class 0 OID 22373386)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5620-fed8-8e66-3e1a66c7f6c8	\N	000e0000-5620-fed8-e29e-d40072893aeb	1	
00200000-5620-fed8-72eb-3342bc56eaf2	\N	000e0000-5620-fed8-e29e-d40072893aeb	2	
00200000-5620-fed8-c9d5-3917ead96eda	\N	000e0000-5620-fed8-e29e-d40072893aeb	3	
00200000-5620-fed8-4b65-c22144d4e12b	\N	000e0000-5620-fed8-e29e-d40072893aeb	4	
00200000-5620-fed8-f76b-25c1cac93a92	\N	000e0000-5620-fed8-e29e-d40072893aeb	5	
\.


--
-- TOC entry 3076 (class 0 OID 22373523)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 22373637)
-- Dependencies: 224
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5620-fed7-1312-118428f4991b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5620-fed7-668f-bf59b62a6c00	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5620-fed7-6e4e-d0ca99b62f3d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5620-fed7-c151-7de7c6bedf8a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5620-fed7-a4f9-5eec89004a65	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5620-fed7-c411-069e1ea48593	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5620-fed7-3e11-99ea8eafc65e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5620-fed7-b85d-3fffd3c47262	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5620-fed7-604f-27aade3b5ded	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5620-fed7-f28d-9aa5a7c8ccb6	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5620-fed7-195a-225d53c3d45d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5620-fed7-3bb4-620bea5aca75	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5620-fed7-d7e6-6579e056ae21	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5620-fed7-7153-db36b48aff21	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5620-fed7-1f86-8589d9831080	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5620-fed7-940d-eb52bba9b95d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5620-fed7-00f1-175bed60dd6e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5620-fed7-a437-8c79dc7d0194	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5620-fed7-b0d3-5b7097fc30f3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5620-fed7-4952-91e2617a690b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5620-fed7-2a4e-123957aeba62	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5620-fed7-560e-9062375b7791	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5620-fed7-b4bc-d142e468e347	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5620-fed7-bb79-5c3bb9e173c0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5620-fed7-a90b-3e200c6c3e41	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5620-fed7-97bc-4a8fb710a2b2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5620-fed7-6d4a-a0131cf4f0be	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5620-fed7-ebf7-654ddac98375	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3105 (class 0 OID 22373988)
-- Dependencies: 242
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22373960)
-- Dependencies: 241
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 22374000)
-- Dependencies: 243
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22373595)
-- Dependencies: 220
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5620-fed8-54e6-bee556fe742a	00090000-5620-fed8-6779-30a26d076379	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-fed8-8628-1c699edc5a6b	00090000-5620-fed8-672f-945a342f3e67	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-fed8-f8ba-b59f33c4f79c	00090000-5620-fed8-df57-dcf4ce9394d8	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-fed8-e508-8765a8b20cab	00090000-5620-fed8-3134-68dc173cda84	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-fed8-136b-7ac88e87f0cb	00090000-5620-fed8-ccde-1cf3f999ddb7	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-fed8-db49-aadc39fb6e6c	00090000-5620-fed8-face-52b31bbf7d01	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3063 (class 0 OID 22373421)
-- Dependencies: 200
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22373704)
-- Dependencies: 229
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5620-fed6-f702-96fb8dd47082	01	Drama	drama (SURS 01)
00140000-5620-fed6-dae9-1da69da3b267	02	Opera	opera (SURS 02)
00140000-5620-fed6-bc15-841974e4d884	03	Balet	balet (SURS 03)
00140000-5620-fed6-8521-29b8a2cd8f4c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5620-fed6-3936-a661c8e48b65	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5620-fed6-98a2-cf4be0d4d62b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5620-fed6-25b2-e2d699400fb3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3082 (class 0 OID 22373585)
-- Dependencies: 219
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2543 (class 2606 OID 22373174)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 22373763)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 22373753)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22373620)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 22373662)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 22374040)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22373410)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 22373431)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22373958)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 22373321)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 22373831)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22373581)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 22373384)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 22373359)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 22373335)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 22373488)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 22374017)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 22374024)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2814 (class 2606 OID 22374048)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 22028085)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2671 (class 2606 OID 22373515)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 22373293)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 22373193)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 22373255)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 22373217)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22373163)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2534 (class 2606 OID 22373148)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22373521)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 22373557)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22373699)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22373245)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 22373281)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 22373910)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 22373494)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 22373271)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22373372)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 22373506)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 22373919)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22373927)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 22373897)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 22373939)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 22373539)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 22373479)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 22373470)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22373686)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22373613)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 22373347)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 22373119)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22373548)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22373137)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2536 (class 2606 OID 22373157)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 22373566)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22373501)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 22373450)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 22373107)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 22373095)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 22373089)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 22373633)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22373226)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 22373461)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 22373673)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22373182)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22373951)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 22373439)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 22373306)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 22373132)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 22373732)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 22373393)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22373529)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22373645)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 22373998)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22373982)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 22374006)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 22373603)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 22373425)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22373712)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22373593)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 1259 OID 22373419)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2620 (class 1259 OID 22373420)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2621 (class 1259 OID 22373418)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2622 (class 1259 OID 22373417)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2623 (class 1259 OID 22373416)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2714 (class 1259 OID 22373634)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2715 (class 1259 OID 22373635)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 22373636)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 22374019)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2801 (class 1259 OID 22374018)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2561 (class 1259 OID 22373247)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2562 (class 1259 OID 22373248)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2672 (class 1259 OID 22373522)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2787 (class 1259 OID 22373986)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2788 (class 1259 OID 22373985)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2789 (class 1259 OID 22373987)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2790 (class 1259 OID 22373984)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2791 (class 1259 OID 22373983)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2666 (class 1259 OID 22373508)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2667 (class 1259 OID 22373507)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2613 (class 1259 OID 22373394)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2614 (class 1259 OID 22373395)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 22373582)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 22373584)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2698 (class 1259 OID 22373583)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2593 (class 1259 OID 22373337)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 22373336)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22373940)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2730 (class 1259 OID 22373701)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 22373702)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 22373703)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2797 (class 1259 OID 22374007)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2739 (class 1259 OID 22373737)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2740 (class 1259 OID 22373734)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2741 (class 1259 OID 22373738)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2742 (class 1259 OID 22373736)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2743 (class 1259 OID 22373735)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2583 (class 1259 OID 22373308)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 22373307)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2552 (class 1259 OID 22373220)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2684 (class 1259 OID 22373549)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2538 (class 1259 OID 22373164)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2539 (class 1259 OID 22373165)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2689 (class 1259 OID 22373569)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 22373568)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2691 (class 1259 OID 22373567)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2566 (class 1259 OID 22373258)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2567 (class 1259 OID 22373257)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2568 (class 1259 OID 22373259)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2606 (class 1259 OID 22373373)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 22373374)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2518 (class 1259 OID 22373097)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2646 (class 1259 OID 22373474)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2647 (class 1259 OID 22373472)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2648 (class 1259 OID 22373471)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2649 (class 1259 OID 22373473)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2529 (class 1259 OID 22373138)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2530 (class 1259 OID 22373139)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2675 (class 1259 OID 22373530)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2810 (class 1259 OID 22374041)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2712 (class 1259 OID 22373622)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2713 (class 1259 OID 22373621)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2811 (class 1259 OID 22374049)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2812 (class 1259 OID 22374050)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2661 (class 1259 OID 22373495)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2706 (class 1259 OID 22373614)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2707 (class 1259 OID 22373615)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 22373836)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2761 (class 1259 OID 22373835)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2762 (class 1259 OID 22373832)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 22373833)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2764 (class 1259 OID 22373834)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2572 (class 1259 OID 22373273)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2573 (class 1259 OID 22373272)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2574 (class 1259 OID 22373274)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 22373543)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2679 (class 1259 OID 22373542)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2770 (class 1259 OID 22373920)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2771 (class 1259 OID 22373921)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2753 (class 1259 OID 22373767)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 22373768)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2755 (class 1259 OID 22373765)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2756 (class 1259 OID 22373766)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2702 (class 1259 OID 22373604)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2703 (class 1259 OID 22373605)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2652 (class 1259 OID 22373483)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2653 (class 1259 OID 22373482)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 22373480)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2655 (class 1259 OID 22373481)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2749 (class 1259 OID 22373755)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 22373754)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2597 (class 1259 OID 22373348)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2600 (class 1259 OID 22373362)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2601 (class 1259 OID 22373361)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2602 (class 1259 OID 22373360)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 22373363)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2612 (class 1259 OID 22373385)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 22373911)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2786 (class 1259 OID 22373959)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2804 (class 1259 OID 22374025)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2805 (class 1259 OID 22374026)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2548 (class 1259 OID 22373195)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2549 (class 1259 OID 22373194)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2557 (class 1259 OID 22373227)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 22373228)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2629 (class 1259 OID 22373426)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 22373464)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 22373463)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2643 (class 1259 OID 22373462)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 22373412)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2625 (class 1259 OID 22373413)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2626 (class 1259 OID 22373411)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2627 (class 1259 OID 22373415)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2628 (class 1259 OID 22373414)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2565 (class 1259 OID 22373246)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 22373183)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 22373184)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2589 (class 1259 OID 22373322)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 22373324)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2591 (class 1259 OID 22373323)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2592 (class 1259 OID 22373325)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2660 (class 1259 OID 22373489)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 22373700)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22373733)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 22373674)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 22373675)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2555 (class 1259 OID 22373218)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 22373219)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2699 (class 1259 OID 22373594)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 22373108)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 22373294)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2571 (class 1259 OID 22373256)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 22373096)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2783 (class 1259 OID 22373952)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 22373541)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2683 (class 1259 OID 22373540)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 22373440)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 22373441)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2757 (class 1259 OID 22373764)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 22373282)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 22373713)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 22373999)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2776 (class 1259 OID 22373928)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 22373929)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2723 (class 1259 OID 22373663)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2640 (class 1259 OID 22373451)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 22373158)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2850 (class 2606 OID 22374206)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2849 (class 2606 OID 22374211)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2845 (class 2606 OID 22374231)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2851 (class 2606 OID 22374201)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2847 (class 2606 OID 22374221)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2846 (class 2606 OID 22374226)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2848 (class 2606 OID 22374216)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2887 (class 2606 OID 22374401)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2886 (class 2606 OID 22374406)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 22374411)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 22374576)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2920 (class 2606 OID 22374571)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 22374106)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2826 (class 2606 OID 22374111)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2868 (class 2606 OID 22374316)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2914 (class 2606 OID 22374556)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 22374551)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2913 (class 2606 OID 22374561)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2916 (class 2606 OID 22374546)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2917 (class 2606 OID 22374541)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2866 (class 2606 OID 22374311)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2867 (class 2606 OID 22374306)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2844 (class 2606 OID 22374191)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2843 (class 2606 OID 22374196)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2878 (class 2606 OID 22374356)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2876 (class 2606 OID 22374366)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2877 (class 2606 OID 22374361)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2836 (class 2606 OID 22374161)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2837 (class 2606 OID 22374156)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 22374296)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 22374531)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2890 (class 2606 OID 22374416)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 22374421)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 22374426)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2918 (class 2606 OID 22374566)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2892 (class 2606 OID 22374446)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2895 (class 2606 OID 22374431)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2891 (class 2606 OID 22374451)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2893 (class 2606 OID 22374441)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2894 (class 2606 OID 22374436)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2834 (class 2606 OID 22374151)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2835 (class 2606 OID 22374146)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2822 (class 2606 OID 22374091)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2823 (class 2606 OID 22374086)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 22374336)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2819 (class 2606 OID 22374066)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2818 (class 2606 OID 22374071)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2873 (class 2606 OID 22374351)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2874 (class 2606 OID 22374346)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2875 (class 2606 OID 22374341)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2829 (class 2606 OID 22374121)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 22374116)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2828 (class 2606 OID 22374126)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2841 (class 2606 OID 22374176)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2840 (class 2606 OID 22374181)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2815 (class 2606 OID 22374051)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2856 (class 2606 OID 22374271)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2858 (class 2606 OID 22374261)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2859 (class 2606 OID 22374256)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2857 (class 2606 OID 22374266)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2817 (class 2606 OID 22374056)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 22374061)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 22374321)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2923 (class 2606 OID 22374591)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 22374396)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 22374391)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2925 (class 2606 OID 22374596)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2924 (class 2606 OID 22374601)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2865 (class 2606 OID 22374301)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2882 (class 2606 OID 22374381)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2881 (class 2606 OID 22374386)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2902 (class 2606 OID 22374506)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 22374501)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2906 (class 2606 OID 22374486)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2905 (class 2606 OID 22374491)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2904 (class 2606 OID 22374496)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2832 (class 2606 OID 22374136)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 22374131)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 22374141)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2870 (class 2606 OID 22374331)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2871 (class 2606 OID 22374326)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 22374516)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2908 (class 2606 OID 22374521)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2899 (class 2606 OID 22374476)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2898 (class 2606 OID 22374481)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2901 (class 2606 OID 22374466)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2900 (class 2606 OID 22374471)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2880 (class 2606 OID 22374371)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 22374376)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2860 (class 2606 OID 22374291)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2861 (class 2606 OID 22374286)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2863 (class 2606 OID 22374276)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2862 (class 2606 OID 22374281)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2896 (class 2606 OID 22374461)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 22374456)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2838 (class 2606 OID 22374166)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2839 (class 2606 OID 22374171)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 22374186)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2907 (class 2606 OID 22374511)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2910 (class 2606 OID 22374526)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2912 (class 2606 OID 22374536)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2922 (class 2606 OID 22374581)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2921 (class 2606 OID 22374586)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 22374081)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2821 (class 2606 OID 22374076)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2825 (class 2606 OID 22374096)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 22374101)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 22374236)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 22374251)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 22374246)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2855 (class 2606 OID 22374241)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-16 15:42:51 CEST

--
-- PostgreSQL database dump complete
--

